/************************* DML *************************/

SELECT *
    FROM 네이버회원;
    
INSERT INTO 네이버회원
    (회원ID, 이름, 비밀번호, 생년월일, 성별)
    VALUES ('JYM', '장영민', '1234', SYSDATE, '남');

-- 전체 컬럼에 값 입력 시, 컬럼리스트 생략 가능
INSERT INTO 네이버회원
    VALUES ('GY', '기융', '1234', SYSDATE, '남');

-- 만약 특정 컬럼에만 값을 넣고 싶다면?
INSERT INTO 네이버회원
    (회원ID, 이름)
    VALUES ('SYP', '선영표');   
    
SELECT *
    FROM 부서;

-- 실습 1) 부서 테이블에 값을 넣어주기 (단톡방 사진 참조)
INSERT INTO 부서
    (부서ID, 부서이름)
    VALUES('1', '연구개발팀');

INSERT INTO 부서
    (부서ID, 부서이름)
    VALUES('2', '교육운영부');

INSERT INTO 부서
    (부서ID, 부서이름)
    VALUES('3', '기획팀');
    
INSERT INTO 부서
    (부서ID, 부서이름)
    VALUES('4', '홍보팀');
    
INSERT INTO 부서
    (부서ID, 부서이름)
    VALUES('5', '외부강사');

-- 실습 2) 직원 테이블에 본인 값을 넣어주기
SELECT *
    FROM 직원;
    
COMMIT;
    
INSERT INTO 직원
    (직원ID, 이름, 성, 이메일, 입사일, 직업ID, 부서ID)
    VALUES('1', '영민', '장', 'APPLE', SYSDATE, 'PROGRAMMER', 5);
    
-- UPDATE : 테이블 안에 데이터를 변경하고 싶을 때 사용
INSERT INTO 직원 VALUES (2, '보경', '서', 'SBK@gmail.com', '010-0000-0000', sysdate, 'JAVA', 10000, NULL, NULL, 5);
INSERT INTO 직원 VALUES (3, '원호', '박', '1HO@gmail.com', '010-1111-1111', sysdate, 'JAVA', 10000, NULL, NULL, 2);
INSERT INTO 직원 VALUES (4, '수현', '박', 'SUE@gmail.com', '010-2222-2222', sysdate, 'DB', 10000, NULL, NULL, 1);

UPDATE 직원
    SET 직업ID = 'JAVA';

ROLLBACK;

UPDATE 직원
    SET 직업ID = 'JAVA'
 WHERE 직원ID = 4;

-- 데이터 전부 삭제
DELETE FROM 직원;

-- 특정 행만 삭제
DELETE FROM 직원
 WHERE 직원ID = 2;
