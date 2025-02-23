/*************************** WHERE *************************/

-- 1.  WHERE 절 : 조건을 지정 

SELECT *
  FROM EMPLOYEES
 WHERE JOB_ID = 'IT_PROG';
 
 
 -- EMPLOYEE_ID가 105인 직원의 이름을 조회 
 
 SELECT FIRST_NAME, LAST_NAME 
   FROM EMPLOYEES
  WHERE EMPLOYEE_ID = 105;
  
-- 2. 산술 연산자 (+,-,*,/) 

SELECT SALARY, SALARY+2, SALARY-2, SALARY*2, SALARY/2
  FROM EMPLOYEES;
  


-- 3. 비교연산자 

-- 대부분의 프로그래밍 언어에서 = 는 대입, ==는 비교를 나타낸다 
-- 다만 SQL 에서는 =가 비교다. 
  

-- 부서 ID가 50인 사람의 직원 ID와 부서 ID를 출력 
SELECT EMPLOYEE_ID, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 50;
  
-- 실습1) 직원 테이블에서 (EMPLOYEES) 급여가 (SALARY) 가 5000 이하인 
--       사람들의 이름(LAST_NAME)과 급여(SALARY)를 출력하시오.

SELECT LAST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY <= 5000;

-- 실습2) 직원 테이블에서 (EMPLOYEES) ★연봉★이 5000 이상인 사람들의
--      이름과 (LAST_NAME)과 연봉을 출력하시오, 
--      이 때 연봉은 'ANNSAL' 라는 별칭과 함께 출력하시오. 

SELECT LAST_NAME, SALARY AS ANNSAL
  FROM EMPLOYEES
 WHERE SALARY >= 5000;

-- 비교연산자는 =, >=, <=, <, > 사용 가능 

-- 4. 등가비교연산자 
-- 같지 않다 : !=, <>, ^=, NOT 
-- 모두 동일한 연산자
-- 기본적으로 <> 해당 연산자를 가장 많이 사용 
  
SELECT *
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID <> 50;
  
SELECT *
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID != 50;
  
SELECT *
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID ^= 50;
  
SELECT *
  FROM EMPLOYEES 
 WHERE NOT DEPARTMENT_ID = 50;
  

--1) EMPLOYEES 테이블에서 JOB_ID가 IT_PROG가 아닌 직원의 LAST_NAME과
--  JOB_ID를 출력하시오. 

SELECT LAST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID ^= IT_PROG;


-- 2) 급여가 10000 미만이 아닌 직원의 EMPLOYEE_ID와
-- LAST_NAME을 출력하시오.

SELECT EMPLOYEE_ID, LAST_NAME 
  FROM EMPLOYEES 
 WHERE SALARY >= 10000; 


-- 5. 논리연산자 (AND, OR) : 조건식을 여러개 사용 

-- 직원테이블에서 (EMPLOYEES) EMPLOYEE_ID가 90이고, 급여(SALARY)가 5000 이상인 직원의
-- 직원 ID (EMPLOYEE_ID)와 이름(LAST_NAME)을 호출하시오.

SELECT EMPLOYEE_ID, LAST_NAME
  FROM EMPLOYEES 
 WHERE EMPLOYEE_ID = 90 
   AND SALARY >= 5000;

SELECT EMPLOYEE_ID, LAST_NAME
  FROM EMPLOYEES 
 WHERE EMPLOYEE_ID = 90 
    OR SALARY >= 5000;

-- 1. 부서 ID (DEPARTMENT_ID)가 100이거나, 입사일(HIRE_DATE)이 16년 2월 2일 이후인 직원의
--   이름(LAST_NAME)과 입사일(HIRE_DATE), 부서ID(DEPARTMENT_ID)를 출력하시오. 

SELECT LAST_NAME, HIRE_DATE, DEPARTMENT_ID 
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 100 
    OR HIRE_DATE >= '16/02/02';

-- 2. 부서 ID( DEPARTMENT_ID)가 100이거나, 50인 직원 중, 연봉이 10000 이상 이상인 직원의 ID
--  ,이름, 그리고 연봉을 출력하세요. 연봉 컬럼명은 ANNSAL입니다. 

SELECT EMPLOYEE_ID, LAST_NAME, SALARY*12 AS ANNSAL
  FROM EMPLOYEES
 WHERE (DEPARTMENT_ID = 100
    OR DEPARTMENT_ID = 50)
   AND SALARY*12 >= 10000;

-- 연산자에도 우선순위가 존재한다. 조건이 3개 있어서 AND, OR 가 모두 사용되는 조건이라면 
-- AND 연산자의 조건이 우선실행되고 이후 OR 연산자가 실행된다.
-- 우선 실행하고 싶은 조건이 있다면 () 괄호 안에 넣을 것!
   
   
INSERT INTO EMPLOYEES(
    EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID)
VALUES (207, '선', 'SYP', SYSDATE,'IT_PROG');


SELECT *
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 207;
 
-- 6. NULL 
-- NULL이란 존재하지 않는 값이다. 
-- NULL은 아무리 연산해도 NULL이다. 
-- NULL이 사용할 수 있는 연산자는 IS NULL, IS NOT NULL 뿐이다. 

-- 핸드폰 번호가 NULL인 직원의 이름과 폰번호를 출력하시오. 

SELECT LAST_NAME, PHONE_NUMBER
  FROM EMPLOYEES 
 WHERE PHONE_NUMBER IS NULL;


SELECT LAST_NAME, PHONE_NUMBER
  FROM EMPLOYEES 
 WHERE PHONE_NUMBER IS NOT NULL;
 
 
 /*
    SQLD/ 정보처리기사에서 나올만한 문제 
    
    Q. 다음 중 올바른 식은? 
    1. SELECT * FROM 직원 WHERE 나이 = NULL
    2. SELECT * FROM 직원 WHERE 나이 != NULL
    3. SELECT * FROM 직원 WHERE 나이 <> NULL
    4. SELECT * FROM 직원 WHERE 나이 ^= NULL
    5. SELECT * FROM 직원 WHERE 나이 IS NOT NULL
    
 */

-- 7. IN :  WHERE 절에서 특정 값을 여러개 선택하고싶을 때
-- IN 연산자 => =연산자 + OR연산자 

-- 부서 ID가 30이거나, 50이거나, 90인 대상의 정보를 출력해보자. 
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 30
    OR DEPARTMENT_ID = 50
    OR DEPARTMENT_ID = 90;

SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (30,50,90,NULL);
-- IN 연산자도 연산이기때문에 NULL을 무시한다.
-- 그러나, OR연산자로 이루어져있기 때문에 다른 문장들이 TRUE라서 오류는 안나는 것!  

-- NOT IN : 입력된 조건 값을 제외한 대상 출력 
-- IN : = + OR 
-- NOT IN : <> + AND  

SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID NOT IN (30,50,90);

-- 실습 
-- 1. 직원 EMPLOYEES 테이블에서 매니저 ID (MANAGER_ID)가 100이거나, 120인 
--      직원의 이름(LAST_NAME)과 매니저 ID(MANAGER_ID)를 출력하시오

SELECT LAST_NAME, MANAGER_ID 
  FROM EMPLOYEES 
 WHERE MANAGER_ID IN (100,120);

-- 2. 직원 EMPLOYEES 테이블에서 직업의 ID(JOB_ID)가 AD_VP이거나, ST_MAN 인 사람의
--         이름(LAST_NAME)과 직업 ID(JOB_ID)를 출력하시오. 

SELECT LAST_NAME, JOB_ID
  FROM EMPLOYEES 
 WHERE JOB_ID IN ('AD_VP', 'ST_MAN');

-- 3. 직원 EMPLOYEES 테이블에서 매니저 ID가 145,146,147,148,149 가 아닌 직원의 이름
--      (LAST_NAME)과 MANAGER_ID 출력

SELECT LAST_NAME, MANAGER_ID 
  FROM EMPLOYEES 
 WHERE MANAGER_ID NOT IN (145,146,147,148,149);




-- 실습문제

-- 1. 650으로 시작하는 핸드폰 번호 찾기 (EMPLOYEE 테이블에서) 
-- 2. 이름이 S로 시작하고 n로 끝나는 직원 찾기
-- 3. 이름에 두번째 글자가 e인 직원 찾기 (하이픈 + %) 
-- 4. 01월에 입사한 직원 찾기




   
/* 
1. EMPLOYEES 테이블에서 FIRST_NAME 이 대문자 S 로 시작하면서 
   LAST_NAME 이 대문자 M 으로 시작하는 대상의 EMPLOYEE_ID , FIRST_NAME , LAST_NAME 을 출력해주세요. 
   (출력 순서는 상관 없습니다) 
   [힌트 : LIKE , AND 활용 , LIKE 사용시 매칭할 값을 겉따옴표(') 로 감싸주세요. 

[출력결과] (총 3행) 
EMPLOYEE_ID    FIRST_NAME   LAST_NAME  
    128           Steven        Markle
    203           Susan        Mavris
    194           Samuel        McCain
*/ 




/* 
2. DEPARTMENTS 테이블은 부서관련 정보를 저장하는 테이블이며, 각 부서마다 MANAGER_ID 가 존재합니다.  
   그 중 MANAGER_ID 가 정해지지 않은 대상의 모든 정보(*) 를 출력해주세요. 
   [힌트 : IS NULL / IS NOT NULL ] 

[출력결과] (총 16행) 
DEPARTMENT_ID   DEPARTMENT_NAME    MANAGER_ID   LOCATION_ID 
    120           Treasury            NULL          1700
    130           Corporate Tax        NULL          1700
    140           Control And Credit     NULL           1700
    ...         ...                   ...           ...
    260           Recruiting            NULL          1700
    270           Payroll                NULL          1700
*/ 

SELECT *
    FROM DEPARTMENTS
WHERE MANAGER_ID IS NULL;=

/* 
3. EMPLOYEES 테이블에서 직원들의 SALARY(연봉) 이 6000 ~ 7000 사이이면서 
   COMMISSION_PCT(커미션)이 NULL이 아닌 대상의 EMPLOYEE_ID , HIRE_DATE , SALARY , COMMISSION_PCT 를 출력해주세요. 
   [힌트 : BETWEEN ] 

[출력 결과] (총 8행) 
EMPLOYEE_ID      HIRE_DATE          SALARY    COMMISSION_PCT 
    155         2007-11-23 00:00:00      7000           0.15
    161         2006-11-03 00:00:00      7000           0.25
    165         2008-02-23 00:00:00      6800           0.1
    166         2008-03-24 00:00:00      6400           0.1
    167         2008-04-21 00:00:00      6200           0.1
    173         2008-04-21 00:00:00      6100           0.1
    178         2007-05-24 00:00:00      7000           0.15
    179         2008-01-04 00:00:00      6200           0.1
*/ 

SELECT EMPLOYEE_ID , HIRE_DATE , SALARY , COMMISSION_PCT
    FROM EMPLOYEES
WHERE SALARY BETWEEN 6000 AND 7000
    AND COMMISSION_PCT IS NOT NULL;

/* 
4. COUNTRIES 테이블에서 REGION_ID 가 1 , 2 , 3 인 대상의 모든 정보를 출력해주세요. 
   [힌트 : IN 활용 , 혹은 부정연산으로도 풀이 가능 ] 


[출력 결과] (총 8행) 
COUNTRY_ID    COUNTRY_NAME               REGION_ID 
    AR         Argentina                   2
    AU          Australia                   3
    BE          Belgium                       1
    BR          Brazil                       2
    ...         ...                        ... 
    UK          United Kingdom               1
    US          United States of America     2
*/ 

select *
    from countries
where region_id in (1,2,3);


/* 
5(심화). EMPLOYEES 테이블에는 다양한 직원들이 있습니다.
        그 중에서 JOB_ID 가 'SA_REP' 이고, SALARY 가 7000 ~ 9000 이면서 FIRST_NAME에 소문자 et 가 포함된 
        대상의 EMPLOYEE_ID , FIRST_NAME , JOB_ID , SALARY 를 출력해주세요. 

[출력결과 (총 3행) 
EMPLOYEE_ID   FIRST_NAME    JOB_ID  SALARY 
    152           Peter       SA_REP    9000
    154           Nanette       SA_REP    7500
    172           Elizabeth   SA_REP    7300
*/ 

SELECT EMPLOYEE_ID , FIRST_NAME , JOB_ID , SALARY
    FROM EMPLOYEES
WHERE JOB_ID = 'SA_REP'
    AND SALARY BETWEEN 7000 AND 9000
    AND FIRST_NAME LIKE '%et%';

/*
6.(심화). EMPLOYEES 테이블에 존재하는 직원들 중에 2005년에 입사한 'Sales' 부서 직원들의 
         EMPLOYEE_ID , FIRST_NAME , HIRE_DATE , SALARY 를 출력하세요. 
(힌트 : TO_CHAR 혹은 TO_DATE  , 부서정보는 DEPARTMENTS 테이블에서 확인 가능) 

[출력 결과] 
EMPLOYEE_ID    FIRST_NAME       HIRE_DATE         SALARY 
    146           Karen       2005-01-05 00:00:00     13500
    147           Alberto       2005-03-10 00:00:00     12000
    150           Peter       2005-01-30 00:00:00     10000
    151           David       2005-03-24 00:00:00     9500
    152           Peter       2005-08-20 00:00:00     9000
    159           Lindsey       2005-03-10 00:00:00     8000
    160           Louise       2005-12-15 00:00:00     7500
    162           Clara       2005-11-11 00:00:00     10500
    168           Lisa       2005-03-11 00:00:00     11500
    175           Alyssa       2005-03-19 00:00:00     8800

*/ 

-- 부서 정보 우선 확인
SELECT *
    FROM DEPARTMENTS;

-- sales 부서는 부서 ID가 80
SELECT EMPLOYEE_ID , FIRST_NAME , HIRE_DATE , SALARY
    FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80
    AND TO_CHAR(HIRE_DATE, 'YYYY') = '2005';