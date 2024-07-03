SELECT
    cd.name AS company_name,
    COUNT(jpf.job_id) AS job_count
FROM
    job_postings_fact AS jpf
    INNER JOIN company_dim AS cd ON jpf.company_id = cd.company_id
WHERE
    jpf.job_health_insurance = TRUE
    AND EXTRACT(YEAR FROM jpf.job_posted_date) = 2023
    AND EXTRACT(QUARTER FROM jpf.job_posted_date) = 2
GROUP BY
    company_name
HAVING
    COUNT(jpf.job_id) > 0
ORDER BY
    job_count DESC;

/*
❓Question:
Find companies (include company name) that have posted jobs offering health insurance, where these postings were made in the second quarter of 2023. Use date extraction to filter by quarter. And order by the job postings count from highest to lowest.

🔎 Hint:
Join job_postings_fact and company_dim on company_id to match jobs to companies.
Use the WHERE clause to filter for jobs with job_health_insurance column.
Use EXTRACT(QUARTER FROM job_posted_date) to filter for postings in the second quarter.
Group results by company_name.
Count the number of job postings per company with COUNT(job_id).
Use HAVING to include only companies with at least one job posting.
ORDER BY the job postings count in descending order to get highest → lowest.
*/