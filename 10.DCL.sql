/*
    우리는 그동안 HR 계정이라는 교육용 DB계정을 사용을 했었음 
    => 다른 계정에 새로 연결할때는 어떻게 해야할까?
    
    1) 계정 만들려면 관리자 계정에 접근
    CONN SYSTEM/12345;
    
    2) 사용자 생성 
    CREATE USER DCLTEST
    IDENTIFIED BY 1234;
    
    3) 계정은 만들어졌으나
    권한이 없어서 연결 불가능 
    
    GRANT CREATE SESSION TO DCLTEST; 
    
    권한 회수
    REVOKE CREATE SESSION FROM DCLTEST;
*/