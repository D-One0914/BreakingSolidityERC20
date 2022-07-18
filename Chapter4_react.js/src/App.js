import React, { useEffect, useState, useCallback } from "react";
import styled from "styled-components";

const App = () => {
  const [value, setValue] = useState("");

  useEffect(() => {
    console.log("USEEFFECT3!");
  }, []);

  const hi = useCallback(() => {
    console.log(value);
  }, [value]);

  const hi2 = useCallback(() => {
    setValue("HI!!!!!!");
  }, []);

  const change = useCallback((e) => {
    setValue(e.target.value);
  }, []);
  const submit = useCallback(
    (e) => {
      e.preventDefault();
      console.log(value);
    },
    [value]
  );

  return (
    <Wrapper>
      <form onSubmit={submit}>
        <Title>{value}</Title>
        <input value={value} onChange={change} />
        <button type="submit">Submit</button>
      </form>
      {/* <button onClick={hi}> Show Value</button> */}
      {/* <button onClick={hi2}> Change Value</button> */}
    </Wrapper>
  );
};

export default App;

const Title = styled.div`
  font-size: 1.5em;
  text-align: center;
  color: palevioletred;
`;

const Wrapper = styled.section`
  padding: 4em;
  background: papayawhip;
`;
