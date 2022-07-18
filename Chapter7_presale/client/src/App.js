import React, { useEffect, useCallback, useState } from "react";
import getWeb3 from "./getWeb3";
import Erc20Token from "./contracts/Erc20Token.json";
import Sale from "./contracts/Sale.json";
import styled from "styled-components";

import Erc20 from "./components/Erc20";
import PreSale from "./components/PreSale";
const App = () => {
  const [web3, setWeb3] = useState(null);
  const [account, setAccount] = useState(null);
  const [instance, setInstance] = useState(null);
  const [saleInstance, setSaleInstance] = useState(null);
  const [balance, setBalance] = useState(0);

  const setContract = useCallback(async (web3) => {
    const accounts = await web3.eth.getAccounts();

    const networkId = await web3.eth.net.getId();
    const information = Erc20Token.networks[networkId];

    const instance = new web3.eth.Contract(
      Erc20Token.abi,
      information && information.address
    );

    const saleInformation = Sale.networks[networkId];
    const saleInstance = new web3.eth.Contract(
      Sale.abi,
      saleInformation && saleInformation.address
    );
    const balance = await instance.methods.balanceOf(accounts[0]).call();

    setWeb3(web3);
    setAccount(accounts[0]);
    setInstance(instance);
    setBalance(balance);
    setSaleInstance(saleInstance);
  }, []);
  const setUp = useCallback(async () => {
    const web3 = await getWeb3();
    await setContract(web3);
  }, [setContract]);

  useEffect(() => {
    setUp();
    window.ethereum.on("accountsChanged", () => {
      setUp();
    });
  }, [setUp]);

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
      <Erc20
        web3={web3}
        account={account}
        instance={instance}
        balance={balance}
        setBalance={setBalance}
      />
      <PreSale web3={web3} account={account} saleInstance={saleInstance} />
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

export default App;
