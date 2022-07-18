import React, { useEffect, useCallback, useState } from "react";
import styled from "styled-components";
const Erc20 = ({ web3, account, instance, balance, setBalance }) => {
  const [inputValue, setInputValue] = useState({ to: "", amount: "" });
  const [transferEvents, setTransferEvents] = useState([]);

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
  }, [instance]);

  useEffect(() => {
    if (instance) {
      getEvents();
    }
  }, [instance, getEvents]);
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
    [inputValue, instance, account, setBalance, getEvents]
  );

  return (
    <>
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
          transferEvents.map((v, i) => {
            return (
              <TableRaw key={i}>
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
    </>
  );
};
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

export default Erc20;
