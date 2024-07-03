WITH title_counts AS (
    SELECT
        company_id,
        COUNT(DISTINCT job_title) AS title_count
    FROM
        job_postings_fact
    GROUP BY
        company_id
)

SELECT
    company_dim.name AS company_name,
    title_counts.title_count AS unique_titles
FROM
    company_dim
    INNER JOIN title_counts ON company_dim.company_id = title_counts.company_id
ORDER BY
    title_counts.title_count DESC
LIMIT 10

/*
❓Question:

Identify companies with the most diverse (unique) job titles. Use a CTE to count the number of unique job titles per company, then select companies with the highest diversity in job titles.

🔎 Hints:

Use a CTE to count the distinct number of job titles for each company.
After identifying the number of unique job titles per company, join this result with the company_dim table to get the company names.
Order your final results by the number of unique job titles in descending order to highlight the companies with the highest diversity.
Limit your results to the top 10 companies. This limit helps focus on the companies with the most significant diversity in job roles. Think about how SQL determines which companies make it into the top 10 when there are ties in the number of unique job titles.
*/