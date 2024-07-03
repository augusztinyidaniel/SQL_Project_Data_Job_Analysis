SELECT
    company_dim.name
FROM
    company_dim
    INNER JOIN (
    SELECT
        company_id,
        AVG(salary_year_avg) AS company_avg
    FROM
        job_postings_fact
    GROUP BY
        company_id
    ) AS company_avgs ON company_avgs.company_id = company_dim.company_id
WHERE company_avgs.company_avg > (SELECT AVG(salary_year_avg) FROM job_postings_fact)

/*
❓Question:

Find companies that offer an average salary above the overall average yearly salary of all job postings. Use subqueries to select companies with an average salary higher than the overall average salary (which is another subquery).

🔎 Hints:

Start by separating the task into two main steps:
calculating the overall average salary
identifying companies with higher averages.
Use a subquery (subquery 1) to find the average yearly salary across all job postings. Then join this subquery onto the company_dim table.
Use another a subquery (subquery 2) to establish the overall average salary, which will help in filtering in the WHERE clause companies with higher average salaries.
Determine each company's average salary (what you got from the subquery 1) and compare it to the overall average you calculated (subquery 2). Focus on companies that greater than this average.
*/