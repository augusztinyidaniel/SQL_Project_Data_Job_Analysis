WITH country_avgs AS (
    SELECT
        job_country,
        AVG(salary_year_avg) AS country_avg
    FROM
        job_postings_fact
    GROUP BY
        job_country
)

SELECT
    job_postings_fact.job_id,
    job_postings_fact.job_title,
    company_dim.name,
    job_postings_fact.salary_year_avg,
    CASE
        WHEN job_postings_fact.salary_year_avg > country_avgs.country_avg THEN 'Above Average'
        WHEN job_postings_fact.salary_year_avg < country_avgs.country_avg THEN 'Below Average'
        WHEN job_postings_fact.salary_year_avg = country_avgs.country_avg THEN 'Average'
    END AS salary_category,
    EXTRACT(MONTH FROM job_postings_fact.job_posted_date) AS job_posted_month
FROM
    job_postings_fact
    INNER JOIN country_avgs ON job_postings_fact.job_country = country_avgs.job_country
    INNER JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
ORDER BY
    job_posted_month DESC

/*
❓Question:

Explore job postings by listing job id, job titles, company names, and their average salary rates, while categorizing these salaries relative to the average in their respective countries. Include the month of the job posted date. Use CTEs, conditional logic, and date functions, to compare individual salaries with national averages.

🔎 Hints:

Define a CTE to calculate the average salary for each country. This will serve as a foundational dataset for comparison.
Within the main query, use a CASE WHEN statement to categorize each salary as 'Above Average' or 'Below Average' based on its comparison (>) to the country's average salary calculated in the CTE.
To include the month of the job posting, use the EXTRACT function on the job posting date within your SELECT statement.
Join the job postings data (job_postings_fact) with the CTE to compare individual salaries to the average. Additionally, join with the company dimension (company_dim) table to get company names linked to each job posting.
*/