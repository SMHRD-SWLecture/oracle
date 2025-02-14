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
                    
commit;q