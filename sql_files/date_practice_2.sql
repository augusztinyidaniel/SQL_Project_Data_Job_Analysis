SELECT
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS month,
    COUNT(job_id) AS job_posted_count
FROM
    job_postings_fact
WHERE
    EXTRACT(YEAR FROM job_posted_date::DATE) = 2023
GROUP BY
    month
ORDER BY
    month;

/*
❓Question:
Count the number of job postings for each month in 2023, adjusting the job_posted_date to be in 'America/New_York' time zone before extracting the month. Assume the job_posted_date is stored in UTC. Group by and order by the month.

🔎 Hint:
Use the EXTRACT(MONTH FROM ...) function to get the month from job_posted_date and wihtin this EXTRACT convert it to the 'America/New_York' time zone using AT TIME ZONE (don’t forget to assume default is in ‘UTC’).
COUNT the number of job postings
GROUP BY the extracted month
ORDER BY the month.
*/