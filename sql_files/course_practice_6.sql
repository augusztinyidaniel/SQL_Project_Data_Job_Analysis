CREATE TABLE january_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

CREATE TABLE february_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

CREATE TABLE march_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

/*
❓Question:
Create three tables:
    Jan 2023 jobs
    Feb 2023 jobs
    Mar 2023 jobs
Foreshadowing: This Will be used in another practice problem below.

🔎 Hint:
Use CREATE TABLE table_name AS syntax to create your table
Look at a way to filter out only specific months (EXTRACT)
*/