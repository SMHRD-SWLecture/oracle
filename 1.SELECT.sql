/*************************** SELECT *****************************/
-- 주석 (하이픈 2번, CTRL +/) 
-- SQL 문법은 대소문자를 구분X, 대문자 작성 선호 
-- 띄어쓰기와 줄바꿈은 명령어 수행에 영향을 미치지 않음 
-- SQL 문장 맨 뒤에는 꼭 ;(세미콜론)을 적을 것 
-- 실행은 CTRL + ENTER , F9, 왼쪽 상단에 초록색 재생버튼
/* 장문 주석 */

/*
    1.전체 컬럼 출력
    * : 애스터리스크 -> "전체" 의미
*/

SELECT *
  FROM EMPLOYEES;
    
-- 2. 내가 원하는 컬럼 출력 
SELECT FIRST_NAME, LAST_NAME
  FROM EMPLOYEES;


/*
    SELECT 출력하고 하는 커럼
      FROM 데이터를 가져올 테이블
*/

-- 실습 1) 직원 테이블에서 직원ID, 이름(LAST), 입사일 출력하기
SELECT EMPLOYEE_ID, LAST_NAME, HIRE_DATE
  FROM EMPLOYEES;


-- 실습 2) 부서 테이블에서 부서ID, 부서명, 근무지ID를 출력하기 
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID
  FROM DEPARTMENTS;


-- 힌트! 전체출력을 우선 한 후에 밑에 결과를 보면서
--      하나하나 입력하면 편하게 풀 수 있음 

-- 3. DISTINCT를 사용해서 중복 제거

-- 컬럼이 1개일 경우 
SELECT DISTINCT DEPARTMENT_ID
  FROM EMPLOYEES;

-- 컬럼이 2개일 경우 (두 컬럼의 값이 모두 같은 것을 제거)
SELECT DISTINCT DEPARTMENT_ID, JOB_ID
  FROM EMPLOYEES;
  
-- 4. 별칭 설정하기 
SELECT EMPLOYEE_ID AS 직원아이디
  FROM EMPLOYEES;

SELECT SALARY*12 AS 연봉
  FROM EMPLOYEES;

/* 
    실습!
    직원 테이블에서 입사일과 계약일을 조회해보자 
    이때, 입사한 날을 기준으로 이틀 뒤를 계약일이라고 한다. 
    별칭을 이용할 것! 
*/
SELECT HIRE_DATE AS 입사일, HIRE_DATE+2 AS 계약일
  FROM EMPLOYEES;


/*
1. COUNTRIES 라는 테이블에서 다음 컬럼만 출력해주세요. 
   추출할 컬럼 : COUNTRY_ID , COUNTRY_NAME 

[출력결과] (총 25행이 출력) 
COUNTRY_ID   COUNTRY_NAME    <--이건 컬럼이름 
    AR	     Argentina
    AU  	 Australia
    ...         ... 
    ZW     	 Zimbabwe
*/ 
SELECT COUNTRY_ID, COUNTRY_NAME
  FROM COUNTRIES;


/*
2. EMPLOYEES 라는 테이블에서 EMPLOYEE_ID , EMAIL , PHONE_NUMBER 컬럼만 출력하되, 
   각각 직원ID , 이메일 , 핸드폰번호 라는 별칭을 부여하여 출력해주세요. 
   
[출력결과] (총 107행이 출력) 
직원ID   이메일       핸드폰번호    <--이건 컬럼이름 
 100	SKING	    515.123.4567 
 101	NKOCHHAR	515.123.4568
 102	LDEHAAN	    515.123.4569
 103	AHUNOLD	    590.423.4567
 104	BERNST	    590.423.4568
 ...    ...         ...
 205	SHIGGINS	515.123.8080
 206	WGIETZ	    515.123.8181 
*/ 
SELECT EMPLOYEE_ID AS 직원ID,
       EMAIL AS 이메일,
       PHONE_NUMBER AS 핸드폰번호
  FROM EMPLOYEES;


/*
3. JOBS 라는 테이블의 모든 컬럼이 추출되도록 데이터를 출력해주세요. 

[출력결과] (총 19 행) 
JOB_ID   JOB_TITLE                      MIN_SALARY   MAX_SALARY    <--이건 컬럼이름 
AD_PRES	 President	                       20080	    40000
AD_VP	Administration Vice President	   15000	    30000
...        ...                              ...         ... 
HR_REP	Human Resources Representative	   4000	        9000
PR_REP	Public Relations Representative	   4500	       10500
*/
SELECT *
  FROM JOBS;


/*
4. EMPLOYEES 테이블에는 JOB_ID 컬럼이 있습니다. 
   이 JOB_ID 컬럼을 추출할 때 중복이 없이 출력되도록 해주세요. (출력순서는 상관없습니다) 
   
[출력결과] (총 19 행) 
JOB_ID      <--이건 컬럼이름
AC_ACCOUNT
AC_MGR
AD_ASST
AD_PRES
  ... 
ST_MAN
*/
SELECT DISTINCT JOB_ID
  FROM EMPLOYEES;


/* 
5. EMPLOYEES 테이블에서 EMPLOYEE_ID 와 SALARY 를 출력해주세요.
   추가로 SALARY 에 1000 씩을 더해서 BONUS 라는 새로운 별칭을 통해 가공된 컬럼도 출력해주세요. 

[출력결과] (총 107행)
EMPLOYEE_ID   SALARY   BONUS    <--이건 컬럼이름 
    100	      24000	   25000
    101	      17000	   18000
    102	      17000	   18000
    ...        ...      ... 
    205 	  12008	   13008
    206	       8300	    9300    
*/ 
SELECT EMPLOYEE_ID, SALARY, SALARY+1000 AS BONUS
  FROM EMPLOYEES;



