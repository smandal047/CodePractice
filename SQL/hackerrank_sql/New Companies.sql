/*
--company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees
*/

select
    company_code,
    founder,
    count(distinct lead_manager_code),
    count(distinct senior_manager_code),
    count(distinct manager_code),
    count(distinct employee_code)
from Employee as e
left join Company as c using(company_code)

group by 1,2
order by 1;

/*
following code will help us understand, how to create relationship.
a tree like structure where data is one-many
*/
SELECT C.company_code, C.founder, A.NLM, B.NSM, C2.NM, D.NE
FROM
    Company C
    LEFT OUTER JOIN (
        SELECT company_code, COUNT(*) AS NLM FROM Lead_Manager GROUP BY company_code
    ) A ON A.company_code = C.company_code
    LEFT OUTER JOIN (
        SELECT company_code, COUNT(*) AS NSM FROM Senior_Manager GROUP BY company_code
    ) B ON B.company_code = C.company_code
    LEFT OUTER JOIN (
        SELECT company_code, COUNT(*) AS NM FROM Manager GROUP BY company_code
    ) C2 ON A.company_code = C2.company_code
    LEFT OUTER JOIN (
        SELECT company_code, COUNT(*) AS NE FROM Employee GROUP BY company_code
    ) D ON D.company_code = C.company_code

ORDER BY C.company_code;