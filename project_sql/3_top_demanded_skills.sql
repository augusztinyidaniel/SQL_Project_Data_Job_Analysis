/*
Question: What are the most in-demand skills for entry level Data Analysts?
- join job postings to inner join table similar to Query 2
- Identify the top 5 in—demand skills for entry level Data Analysts.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market for entry level jobs
    providing insights into the most vatuable skills for job seekers with moderate experience.
*/

SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON  job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst'
    AND (job_postings_fact.job_title ILIKE '%Entry%'
         OR job_postings_fact.job_title ILIKE '%Junior%')
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;