import React, { useEffect, useCallback, useState } from "react";
import getWeb3 from "./getWeb3";
import Erc20Token from "./contracts/Erc20Token.json";
import styled from "styled-components";

const App = () => {
  const [web3, setWeb3] = useState(null);
  const [account, setAccount] = useState(null);
  const [instance, setInstance] = useState(null);
  const [balance, setBalance] = useState(0);
  const [inputValue, setInputValue] = useState({ to: "", amount: "" });
  const [transferEvents, setTransferEvents] = useState([]);

  useEffect(() => {
    if (instance) {
      getEvents();
    }
  }, [instance]);

  useEffect(() => {
    setUp();
    window.ethereum.on("accountsChanged", () => {
      setUp();
    });
  }, []);

  const setUp = useCallback(async () => {
    const web3 = await getWeb3();
    await setContract(web3);
  }, []);

  const setContract = useCallback(async (web3) => {
    const accounts = await web3.eth.getAccounts();

    const networkId = await web3.eth.net.getId();
    const information = Erc20Token.networks[networkId];

    const instance = new web3.eth.Contract(
      Erc20Token.abi,
      information && information.address
    );
    const balance = await instance.methods.balanceOf(accounts[0]).call();

    setWeb3(web3);
    setAccount(accounts[0]);
    setInstance(instance);
    setBalance(balance);
  }, []);

  const changeInput = useCallback(
    (e) => {
      setInputValue({
        ...inputValue,
        [e.target.name]: e.target.value,
      });
    },
    [inputValue]
  );

  const transfer = useCallback(
    async (e) => {
      e.preventDefault();
      await instance.methods
        .transfer(inputValue.to, inputValue.amount)
        .send({ from: account });
      const balance = await instance.methods.balanceOf(account).call();
      setBalance(balance);
      getEvents();
    },
    [inputValue, instance, account]
  );

  const getEvents = useCallback(async () => {
    const information =
      (await instance) &&
      (await instance.getPastEvents("Transfer", {
        fromBlock: 0,
        toBlock: "latest",
      }));

    let events =
      information &&
      information.map((value) => {
        return value.returnValues;
      });

    setTransferEvents(events);
    console.log(events);
  }, [instance]);

  if (!web3) {
    return (
      <Container>
        <Content>
          <Text>Welcome!</Text>
          <Text>Please Log in!</Text>
        </Content>
      </Container>
    );
  }
  return (
    <Container>
      <Content>
        <Text>Welcome</Text>
        <Text>{account}</Text>
        <Text>Balance: {balance} </Text>
      </Content>

      <Form onSubmit={transfer}>
        <Text>Address</Text>
        <input
          placeholder="to"
          name="to"
          value={inputValue.to}
          onChange={changeInput}
          required
        />
        <Text>Amount</Text>
        <input
          type="number"
          placeholder="amount"
          name="amount"
          value={inputValue.amount}
          onChange={changeInput}
          required
        />
        <button>transfer</button>
      </Form>

      <Table>
        <Text>Transfer Events</Text>
        <TableRaw>
          <TableData>From</TableData>
          <TableData>To</TableData>
          <TableData>Value</TableData>
        </TableRaw>

        {transferEvents &&
          transferEvents.map((v) => {
            return (
              <TableRaw>
                <TableData>
                  {v.from.substr(0, 3)}...{v.from.substr(-2)}
                </TableData>
                <TableData>
                  {v.to.substr(0, 3)}...{v.to.substr(-2)}
                </TableData>
                <TableData>{web3.utils.fromWei(v.value, "ether")}</TableData>
              </TableRaw>
            );
          })}
      </Table>
    </Container>
  );
};

const Container = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100vw;
  height: 100vh;
  flex-direction: column;
`;

const Content = styled.div`
  display: flex;
  flex-direction: column;
  width: 50%;
`;

const Text = styled.div`
  font-size: 1.5rem;
  margin: 0 auto;
`;

const Form = styled.form`
  display: flex;
  flex-direction: column;
  width: 50%;
`;

const Table = styled.div`
  display: flex;
  flex-direction: column;
  width: 50%;

  margin-top: 50px;
`;

const TableRaw = styled.div`
  display: flex;
  width: 100%;
`;

const TableData = styled.div`
  font-size: 1.5rem;
  width: 33%;
  text-align: center;
`;
export default App;
