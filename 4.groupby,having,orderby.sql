/********************** GROUP BY ************************/

/* SQL 문장 실행순서
    
 4   SELECT 출력할컬럼
 1     FROM 테이블
 2    WHERE 조건지정
 3    GROUP BY 특정컬럼을 기준으로 그룹화
     
*/

-- 3. 교육생정보 테이블에서 각 팀당 몇 명의 인원이 포함되어 있는지 출력

SELECT 팀, COUNT(팀)
    FROM 교육생정보
 GROUP BY 팀;
 
 -- 4. 성적표 테이블에서 학생별로 JAVA와 DATABASE의 성적의 평균을 출력 (단, 반올림해서 출력)
 
SELECT ROUND(AVG(성적))
    FROM 성적표
 WHERE 과목 <> 'PYTHON'
  GROUP BY 학생ID;
  
/********************** HAVING ************************/

-- 예제1) 성적표 테이블에서 평균 성적이 75점 이하인 학생들의 ID와 평균성적을 출력하시오.

SELECT 학생ID, ROUND(AVG(성적)) AS 평균성적
    FROM 성적표
GROUP BY 학생ID;
 HAVING AVG(성적)<=75;

-- 예제2) 성적표 테이블에서 파이썬 성적을 제외한 평균 점수가 80점 이상인 학생을 출력하시오.

SELECT 학생ID, ROUND(AVG(성적)) AS 평균성적
    FROM 성적표
 WHERE 과목 <> 'PYTHON'
 GROUP BY 학생 ID
 HAVING AVG(성적) >= 80;
 
/********************** ORDER BY ************************/

SELECT *
    FROM 성적표
 ORDER BY 학생ID ASC, 성적 DESC;
 
SELECT SALARY*12 AS 연봉
    FROM EMPLOYEES
 ORDER BY DESC;
 
 -- 실습!!!
 -- 실습 풀기 전에, 예제 먼저 혼자 스스로 풀고 오기
 --     이 떄,
 
 -- 실습1) 교육생 정보 테이블에서 소속된 팀의 인원수가 3명 이상인 팀의 이름과 인원수를 출력하시오.
 
 -- EMPLOYEES 테이블에서 부서별 최고 연봉이 100,0000 이상인 부서의 ID와 최고 연봉을 출력하세요.
 


