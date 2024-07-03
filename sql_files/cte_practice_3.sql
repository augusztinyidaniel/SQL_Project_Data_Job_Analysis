WITH total_unique_skills AS (
    SELECT
        company_dim.company_id,
        COUNT(DISTINCT skills_job_dim.skill_id) AS unique_skills
    FROM
        company_dim
        LEFT JOIN job_postings_fact ON job_postings_fact.company_id = company_dim.company_id
        LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    GROUP BY
        company_dim.company_id
),

highest_avg_salary AS (
    SELECT
        job_postings_fact.company_id,
        MAX(job_postings_fact.salary_year_avg) AS highest_avg
    FROM
        job_postings_fact
    WHERE
        job_postings_fact.job_id IN (SELECT job_id FROM skills_job_dim)
    GROUP BY
        job_postings_fact.company_id
)

SELECT
    company_dim.name,
    total_unique_skills.unique_skills,
    highest_avg_salary.highest_avg
FROM
    company_dim
    LEFT JOIN total_unique_skills ON total_unique_skills.company_id = company_dim.company_id
    LEFT JOIN highest_avg_salary ON highest_avg_salary.company_id = company_dim.company_id
ORDER BY
    company_dim.name;

/*
❓Question:

Calculate the number of unique skills required by each company. Aim to quantify the unique skills required per company and identify which of these companies offer the highest average salary for positions necessitating at least one skill. For entities without skill-related job postings, list it as a zero skill requirement and a null salary. Use CTEs to separately assess the unique skill count and the maximum average salary offered by these companies.

🔎 Hints:

Use two CTEs.
The first should focus on counting the unique skills required by each company.
The second CTE should aim to find the highest average salary offered by these companies.
Ensure the final output includes companies without skill-related job postings. This involves use of LEFT JOINs to maintain companies in the result set even if they don't match criteria in the subsequent CTEs.
After creating the CTEs, the main query joins the company dimension table with the results of both CTEs.
*/