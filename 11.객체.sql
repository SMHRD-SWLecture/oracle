/************************* 객체 *************************/

-- 객체 : 데이터베이스 내에 존재하는 논리적인 저장 구조
-- 스키마 안에 객체들이 저장되는 구조!

-- 테이블 : 데이터를 저장하는 객체

-- 뷰 : 테이블인 것처럼 사용하는 객체 (가상의 테이블)
-- 테이블을 조회하는 SELECT문을 저장하는 객체 -> 물리적 데이터 저장 X

SELECT 회원ID, 비밀번호
  FROM 네이버회원;
  
CREATE VIEW 로그인정보 AS
            SELECT 회원ID, 비밀번호
              FROM 네이버회원;
              
SELECT *
  FROM 로그인정보;
  
-- '부서별최고급여'라는 이름의 VIEW를 생성하고,
-- 해당 VIEW를 사용해서 부서별로 가장 높은 연봉을 가진
-- 직원의 FIRST_NAME, 최고급여, DEPARTMENT_ID

-- STEP 1. 부서별 최고 급여를 조회하는 SELECT문을 VIEW로 저장
SELECT DEPARTMENT_ID, MAX(SALARY) AS 최고급여
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID;

-- STEP 2. 1에 작성한 SELECT문을 VIEW로 저장
CREATE VIEW 부서별최고급여 AS
            SELECT DEPARTMENT_ID, MAX(SALARY) AS 최고급여
              FROM EMPLOYEES
             GROUP BY DEPARTMENT_ID;

SELECT *
  FROM 부서별최고급여;

-- STEP 3. EMPLOYEE 직원 테이블과 부서별최고급여 VIEW를 함께 사용해서
--         최고급여 받는 직원의 이름과 급여, 부서 출력
--         (FROM 별칭, INNER JOIN)
--         부서별 최고급여는 DMAX라는 별칭을 사용
SELECT E.FIRST_NAME, E.SALARY, DMAX.DEPARTMENT_ID
  FROM EMPLOYEES E INNER JOIN 부서별최고급여 DMAX
    ON (E.DEPARTMENT_ID = DMAX.DEPARTMENT_ID)
   AND (E.SALARY = DMAX.최고급여);


-- 시퀀스 : 특정 규칙에 맞는 연속 숫자를 생성하는 객체 (LIKE. 대기순번표)
-- 주로 PK의 컬럼 등에 유일한 값을 만들 때 사용
-- 직원 ID, 사번, 학번, ...

CREATE SEQUENCE NUM1; -- 순번대기표 기계 생성

-- 시퀀스를 테스트해보기 위해 테이블 하나 생성
CREATE TABLE 시퀀스테스트 (
    시퀀스 NUMBER
);

SELECT *
  FROM 시퀀스테스트;
  
INSERT INTO 시퀀스테스트
  VALUES (NUM1.NEXTVAL);

/*
    시퀀스 작성 방법
    
    [시퀀스 생성 방법]
    CREATE SEQUENCE 시퀀스이름
      INCREMENT BY 1 -- 증가할 숫자
        START WITH 1 -- 시작할 숫자
      MAXVALUE -- 최대값
      MINVALUE -- 최소값
        CYCLE - 최대값에 도달 시 다시 시작 OR 중단
        CACHE- 메모리에 미리 할당해놓은 수가 O
    
    [시퀀스 사용 방법]
    시퀀스이름.CURRVAL 마지막 번호 반환
    시퀀스이름.NEXTVAL 다음 번호 반환
    
*/

CREATE SEQUENCE NUM2
    START WITH 0
  INCREMENT BY 2
     MAXVALUE 20
     MINVALUE 0
      NOCYCLE ;

SELECT *
  FROM 시퀀스테스트;

DELETE FROM 시퀀스테스트;

INSERT INTO 시퀀스테스트 VALUES(NUM2.NEXTVAL);


-- ROWNUM
-- 테이블 행에 임시로 부여되는 일련 번호

SELECT ROWNUM, EMPLOYEE_ID, FIRST_NAME
  FROM EMPLOYEES
 WHERE ROWNUM <= 5;
 
SELECT ROWNUM, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY IS NOT NULL
   AND ROWNUM <= 5
 ORDER BY SALARY DESC;


-- 실습 (VIEW, ROWNUM)
-- 1. 직원 중 연봉이 낮은 하위 3명의 이름과 급여를 출력
CREATE VIEW 연봉하위정렬 AS
    SELECT FIRST_NAME, SALARY
      FROM EMPLOYEES
     WHERE SALARY IS NOT NULL
       ORDER BY SALARY;

SELECT *
  FROM 연봉하위정렬
 WHERE ROWNUM <= 5;
 
-- 2. 직원 중 가장 최근에 입사한 3명의 이름과 입사일을 출력 (NULL X)
CREATE VIEW 최근입사정렬 AS
    SELECT FIRST_NAME, HIRE_DATE
      FROM EMPLOYEES
     WHERE HIRE_DATE IS NOT NULL
      ORDER BY HIRE_DATE DESC;

SELECT *
  FROM 최근입사정렬
 WHERE ROWNUM <= 3;