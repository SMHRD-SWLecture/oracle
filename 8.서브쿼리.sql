/************************* 서브쿼리 *************************/

-- 평균 금액보다 더 높은 급여를 받는 직원을 출력

-- (1) 직원들의 평균 급여 조회
SELECT ROUND(AVG(SALARY))
    FROM EMPLOYEES;
    
-- (2) 그 평균보다 높은 직원의 이름, 급여 출력
SELECT FIRST_NAME, SALARY
    FROM EMPLOYEES
 WHERE SALARY > 6462;
 
-- (3) 서브쿼리 이용
SELECT FIRST_NAME, SALARY
    FROM EMPLOYEES
 WHERE SALARY > (SELECT ROUND(AVG(SALARY))
                    FROM EMPLOYEES);
                    
-- 실습
-- (1) FIRST_NAME이 Louise인 직원과 같은 급여를 받는 직원의 이름과 급여를 출력하시오.
SELECT FIRST_NAME, SALARY
    FROM EMPLOYEES
 WHERE SALARY = (SELECT SALARY
                    FROM EMPLOYEES
                 WHERE FIRST_NAME = 'Louise');

-- (2) 평균 급여보다 낮은 급여를 받는 직원의 이름과 급여를 출력하시오.
SELECT FIRST_NAME, SALARY
    FROM EMPLOYEES
 WHERE SALARY < (SELECT ROUND(AVG(SALARY))
                    FROM EMPLOYEES); 
                    
-- 다중행 서브쿼리

-- 부서별 최고 급여를 받는 직원과 같은 직원을 출력

-- (1) 부서별 최고급여 출력
SELECT MAX(SALARY)
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID;

-- (2) 부서별 최고급여와 급여가 같은 직원 출력
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE SALARY IN (SELECT MAX(SALARY)
                    FROM EMPLOYEES
                   GROUP BY DEPARTMENT_ID) ;
                   
-- ANY, SOME 연산자
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE SALARY = SOME (SELECT MAX(SALARY)
                       FROM EMPLOYEES
                      GROUP BY DEPARTMENT_ID) ;
                      
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE SALARY = ANY (SELECT MAX(SALARY)
                       FROM EMPLOYEES
                      GROUP BY DEPARTMENT_ID) ;
                      
-- 부서별 최고연봉을 받는 직원은 여러 명이다.
-- 그 직원들 중 1명이라도 연봉이 같은 직원이 있다면 출력됨
-- IN/=ANY/=SOME 연산자 

-- ALL 연산자
-- 부서별 최고연봉들 보다 더 크거나 같은 연봉을 받는 직원을 출력
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE SALARY >= ALL (SELECT MAX(SALARY)
                       FROM EMPLOYEES
                      GROUP BY DEPARTMENT_ID) ;
                      
-- 다중열 서브쿼리

-- 각 부서별 최고 연봉을 받는 직원 출력

-- (1) 최고 연봉을 받는 직원의 부서명, 급여
SELECT DEPARTMENT_ID, MAX(SALARY)
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID;
 
-- (2) 최고 연봉을 받는 직원과 급여, 부서가 모두 같은 것만 출력
SELECT FIRST_NAME, DEPARTMENT_ID, SALARY
  FROM EMPLOYEES
 WHERE (DEPARTMENT_ID, SALARY) IN (SELECT DEPARTMENT_ID, MAX(SALARY)
                                     FROM EMPLOYEES
                                    GROUP BY DEPARTMENT_ID) ;                  