/*

ERC20(Ethereum Request for Comment 20) 이란 무엇인가? 
EIP (Ethereum Improvement Proposal)
    - 이더리움 블록체인 네트워크의 표준 토큰 스마트 컨트랙트
    - ether와 같이 대부분의 토큰은 ERC20 스마트 컨트랙트 기반 
    - 대체 가능한 토큰 
        - 예를 들어 
            Alice가 들고 있는 100원 = Bob이 들고 있는 100원
            Alice가 들고 있는 1개의 토큰 = Bob이 들고 있는 1개의 토큰 
    
    ERC20 단점 
    - Fallback 함수 지원 x -> 토큰의 유실(스마트 컨트랙트로 토큰을 보낼시)
    - ERC20의 보완 버전 -> ERC223,ERC777 ( 컨트랙에 토큰 X, Fallback 함수 지원)  
    
*/
