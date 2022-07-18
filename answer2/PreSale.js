import React, { useEffect, useCallback, useState } from "react";
import { Statistic } from "antd";
import styled from "styled-components";

const PreSale = ({ web3, account, saleInstance, instance, setBalance }) => {
  const [time, setTime] = useState(new Date(2022, 5, 4, 16, 50, 0));
  const closingtime = new Date(2023, 7, 4, 17, 0, 0);

  const [preSaleTitle, setPreSaleTitle] = useState("Start In");
  const [whitelist, setWhitelist] = useState("");

  useEffect(() => {
    if (time.getTime() <= Date.now()) {
      setTime(closingtime);
      setPreSaleTitle("End In");
    }
  }, [time, closingtime]);

  const startPresale = useCallback(() => {
    setTime(closingtime);
    setPreSaleTitle("End In");
  }, [closingtime]);

  const buy = useCallback(async () => {
    /*
    web3.eth.sendTransaction({
      from: account,
      to: "0xc5f36cc69e380d02473CAd13b2bFBaBAa4AcaCCC",
      value: web3.utils.toWei("1", "ether"),
    });
    */

    await saleInstance.methods
      .buyTokens(account)
      .send({ from: account, value: web3.utils.toWei("1", "ether") });

    const balance = await instance.methods.balanceOf(account).call();
    setBalance(balance);
  }, [saleInstance, account, web3, instance, setBalance]);

  const changeInput = useCallback((e) => {
    setWhitelist(e.target.value);
  }, []);

  const enrollWhitelist = useCallback(async () => {
    //saleInstance.methods.addMyWhitelist(whitelist).send({ from: account });
    //"0x62C9E0301d500C24E19fE12CBd56506aaCF0e742,0xd70471780633FcB380ef07E0c2E0d5a3a96EC951,0x7C1E7fC2E9B2e6FbDB6f5627d056ec3b526D5114"

    await saleInstance.methods
      .addMyWhitelist2(whitelist.split(","))
      .send({ from: account });
  }, [saleInstance, account, whitelist]);

  return (
    <>
      <StyledCountdown
        title={preSaleTitle}
        value={time}
        onFinish={startPresale}
      />
      <button onClick={buy}>buy for 1 eth</button>
      <input
        value={whitelist}
        onChange={changeInput}
        style={{ width: "50%" }}
      />
      <button onClick={enrollWhitelist}>Enroll</button>
    </>
  );
};
const StyledCountdown = styled(Statistic.Countdown)`
  .ant-statistic-content-value,
  .ant-statistic-title {
    font-size: 4rem;
  }
  .ant-statistic-content {
    text-align: center;
  }
`;
export default PreSale;
