CREATE TABLE 스마트뱅크 (
    계좌번호 VARCHAR2(50),
    예금주 VARCHAR2(12),
    잔액 NUMBER
);

INSERT INTO 스마트뱅크 VALUES (
    '100-131-475302',
    '장영민',
    1000
);

SELECT *
  FROM 스마트뱅크;

ROLLBACK;
-- 롤백하니 계좌가 사라짐
-- DML(INSERT, UPDATE, DELETE)는 테이블에 바로 반영되지 않음
-- COMMIT을 해야만 트랜잭션이 완료되고 영구반영됨

-- DDL(CREATE, ALTER, DROP)은 ROLLBACK 못함

INSERT INTO 스마트뱅크 VALUES (
    '3333-04-1234-1234'
    ,'JDW'
    ,200
);

INSERT INTO 스마트뱅크 VALUES (
    '652702-04-494446'
    ,'이도현'
    ,1000000000
);

INSERT INTO 스마트뱅크 VALUES (
    '3333-04-1234-1234'
    ,'선영표'
    ,200
);

COMMIT;


-- 송금 트랜잭션 실행(이도현 -> 장영민 : 1000000)

-- 1. 잔액 확인
SELECT *
  FROM 스마트뱅크
 WHERE 예금주 = '이도현'
  AND 잔액 >= 1000000;
  
-- 2. 이도현 계좌에서 차감
UPDATE 스마트뱅크
  SET 잔액 = 잔액 - 1000000
 WHERE 예금주 = '이도현';

-- 3. 장영민 계좌에 추가
UPDATE 스마트뱅크
  SET 잔액 = 잔액 + 1000000
 WHERE 예금주 = '장영민';

SELECT *
  FROM 스마트뱅크;

ROLLBACK;
COMMIT;