/****************************** DDL ******************************/

-- 미션 : 기존의 EMPLOYEES 테이블을 한글 버전으로 생성
CREATE TABLE 직원(
    직원ID NUMBER(6,0) NOT NULL,
    이름 VARCHAR2(20),
    성 VARCHAR2(25) NOT NULL,
    이메일 VARCHAR2(20) NOT NULL,
    핸드폰 VARCHAR2(20),
    입사일 DATE NOT NULL,
    직업ID VARCHAR(10) NOT NULL,
    급여 NUMBER(8,2),
    커미션비율 NUMBER(2,2),
    매니저ID NUMBER(6,0),
    부서ID NUMBER(4,0)
    );

DROP TABLE 직원;




-- 실습! DEPARTMENTS 테이블을 부서 테이블이라는 한글 VER 테이블로 만들기
-- DEPARTMENT_ID -> 부서ID
-- DEPARTMENT_NAME -> 부서이름
-- MANAGER_ID -> 매니저ID
-- LOCATION_ID -> 위치ID

CREATE TABLE 부서 (
    부서ID NUMBER(4) NOT NULL,
    부서이름 VARCHAR2(30) NOT NULL,
    매니저ID NUMBER(6),
    위치ID NUMBER(4)
    );
    
    
-- 만약 이미 만들어진 테이블에서 제약조건만 추가하고 싶다면?
-- ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건명 제약조건(column)

-- 직원 ID를 PK로 지정
ALTER TABLE 직원 ADD CONSTRAINT 직원_직원ID_PK PRIMARY KEY(직원ID);

-- 직원의 이메일을 UK로 지정
ALTER TABLE 직원 ADD CONSTRAINT 직원_직원이메일_UK UNIQUE(이메일);

-- CHECK 지정 : 직원의 급여를 무조건 0보다 큰 값만 가능
ALTER TABLE 직원 ADD CONSTRAINT 직원_급여_CK CHECK(급여>0);

-- NOT NULL 변경
ALTER TABLE 직원 MODIFY 이름 NOT NULL;

-- FK 추가
-- 1. 부서 테이블에서 부서 ID를 PK로 지정
ALTER TABLE 부서 ADD CONSTRAINT 부서_부서ID_PK PRIMARY KEY(부서ID);

-- 2. 직원 테이블에서 부서 ID를 참조
ALTER TABLE 직원 ADD CONSTRAINT 직원_부서ID_FK FOREIGN KEY(부서ID) REFERENCES 부서(부서ID);

-- 3. 제약조건 삭제
ALTER TABLE 직원 DROP CONSTRAINT 직원_급여_CK;


-- 제약 조건을 테이블 생성 시에 바로 추가 하는 문법
CREATE TABLE 제약조건테스트(
    PK테스트 NUMBER PRIMARY KEY,
    UK테스트 NUMBER UNIQUE,
    NN테스트 NUMBER NOT NULL,
    CK테스트 NUMBER CHECK(CK테스트 IN ('남', '여'))
    );
    
-- 실습문제!
/*
    - 테이블 이름 : 네이버회원
    - 테이블 안에 들어갈 속성
        회원ID 문자형15바이트 -> PK
        이름   문자형12바이트 -> NULL 안 됨
        비밀번호 문자형16바이트
        생년월일 날짜형
        성별     문자형3바이트 -> 데이터가 남, 여 두개만 입력 가능
*/

CREATE TABLE 네이버회원 (
    회원ID VARCHAR2(15) PRIMARY KEY,
    이름 VARCHAR2(12) NOT NULL,
    비밀번호 VARCHAR2(16),
    생년월일 DATE,
    성별 VARCHAR2(3) CHECK(성별 IN ('남', '여'))
    );