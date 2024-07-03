SELECT
    job_schedule_type AS type,
    AVG(salary_year_avg) AS yearly,
    AVG(salary_hour_avg) AS hourly
FROM
    job_postings_fact
WHERE
    job_posted_date::DATE > '2023-06-01'
GROUP BY
    type
ORDER BY
    type ASC;

/*
❓ Question:
Find the average salary both yearly (salary_year_avg) and hourly (salary_hour_avg) for job postings using the job_postings_fact table that were posted after June 1, 2023. Group the results by job schedule type. Order by the job_schedule_type in ascending order.

🔎 Hint:
Calculate average salaries by using the AVG function on both salary_year_avg and salary_hour_avg.
Filter postings with WHERE for dates after June 1, 2023,
Group the results with job_schedule_type.
Use job_schedule_type for ORDER BY.
*/