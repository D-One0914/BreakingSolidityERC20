const Web3 = require("web3");
const web3Provider = new Web3.providers.HttpProvider("HTTP://127.0.0.1:7545");
const web3 = new Web3(web3Provider);

//1 -> 33
//2 -> 23
//3 -> 10

const getAccounts = async () => {
  let accounts = await web3.eth.getAccounts();

  console.log(accounts);
};

//getAccounts();

const getBalance = async () => {
  let accounts = await web3.eth.getAccounts();
  let balance = await web3.eth.getBalance(accounts[0]);
  console.log(`account[0]: ${accounts[0]} balance: ${balance}`);
};

//getBalance();

const sendTransaction = async () => {
  let accounts = await web3.eth.getAccounts();
  let balance0 = await web3.eth.getBalance(accounts[0]);
  let balance1 = await web3.eth.getBalance(accounts[1]);
  console.log(`account[0]: ${accounts[0]} balance: ${balance0}`);
  console.log(`account[1]: ${accounts[1]} balance: ${balance1}`);

  await web3.eth.sendTransaction({
    from: accounts[0],
    to: accounts[1],
    value: web3.utils.toWei("1", "ether"),
  });

  balance0 = await web3.eth.getBalance(accounts[0]);
  balance1 = await web3.eth.getBalance(accounts[1]);
  console.log(`account[0]: ${accounts[0]} balance: ${balance0}`);
  console.log(`account[1]: ${accounts[1]} balance: ${balance1}`);
};

sendTransaction();
