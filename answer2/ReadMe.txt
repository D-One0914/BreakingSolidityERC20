기존에 있는  App.js와 Presale.js Answer2에 있는 App.js와 Presale.js로 변경하셔도 됩니다. 


1. App.js로 가서, 

Presale 컴포넌트에  instance={instance}와 setBalance={setBalance} 추가
....
const App = () => {
    .....
    return (
    .....
      <PreSale
        web3={web3}
        account={account}
        saleInstance={saleInstance}
        instance={instance} << 추가 
        setBalance={setBalance} << 추가 
      />
    .....
  );
}

....

2. PreSale.js로 가서, 

함수 buy에, const balance = await instance.methods.balanceOf(account).call();와 setBalance(balance); 추가 

....
const PreSale = () => {
    .....
    
    const buy = useCallback(async () => {
        await saleInstance.methods
        .buyTokens(account)
        .send({ from: account, value: web3.utils.toWei("1", "ether") });

        const balance = await instance.methods.balanceOf(account).call(); <<추가
        setBalance(balance); <<추가
        }, [saleInstance, account, web3, instance, setBalance]); <<  instance와 setBalance추가
    .....
  );
}
