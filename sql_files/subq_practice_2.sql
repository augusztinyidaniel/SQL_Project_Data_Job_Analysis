SELECT
    company_id,
    company_name,
    CASE
        WHEN total_jobs > 50 THEN 'Large'
        WHEN total_jobs BETWEEN 10 AND 49 THEN 'Medium'
        WHEN total_jobs < 10 THEN 'Small'
    END AS size_category
FROM (
    SELECT
        company_dim.company_id,
        company_dim.name AS company_name,
        COUNT(job_postings_fact.job_id) AS total_jobs
    FROM
        company_dim
    INNER JOIN job_postings_fact ON company_dim.company_id = job_postings_fact.company_id
    GROUP BY
        company_dim.company_id
)


/*
❓Question:

Determine the size category ('Small', 'Medium', or 'Large') for each company by first identifying the number of job postings they have. Use a subquery to calculate the total job postings per company. A company is considered 'Small' if it has less than 10 job postings, 'Medium' if the number of job postings is between 10 and 50, and 'Large' if it has more than 50 job postings. Implement a subquery to aggregate job counts per company before classifying them based on size.

🔎 Hints:

Aggregate job counts per company in the subquery. This involves grouping by company and counting job postings.
Use this subquery in the FROM clause of your main query.
In the main query, categorize companies based on the aggregated job counts from the subquery with a CASE statement.
The subquery prepares data (counts jobs per company), and the outer query classifies companies based on these counts.
*/