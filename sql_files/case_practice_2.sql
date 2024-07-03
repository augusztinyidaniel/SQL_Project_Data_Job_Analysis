SELECT 
    COUNT(DISTINCT CASE WHEN job_work_from_home = TRUE THEN company_id END) AS wfh_companies,
    COUNT(DISTINCT CASE WHEN job_work_from_home = FALSE THEN company_id END) AS non_wfh_companies
FROM job_postings_fact;

/*
❓Question:

Count the number of unique companies that offer work from home (WFH) versus those requiring work to be on-site. Use the job_postings_fact table to count and compare the distinct companies based on their WFH policy (job_work_from_home).

🔎 Hint:

Use COUNT with DISTINCT to find unique values.
CASE WHEN statements to separate companies based on their WFH policy.
The data will be from the job_postings_fact table.
*/