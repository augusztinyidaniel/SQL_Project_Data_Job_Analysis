SELECT
    skills
FROM
    skills_dim
WHERE skill_id IN (
    SELECT
        skill_id
    FROM
        skills_job_dim
    GROUP BY
        skill_id
    ORDER BY
        COUNT(skill_id) DESC
    LIMIT 5
)

/*
❓Question:

Identify the top 5 skills that are most frequently mentioned in job postings. Use a subquery to find the skill IDs with the highest counts in the skills_job_dim table and then join this result with the skills_dim table to get the skill names.

🔎 Hints:

Focus on creating a subquery that identifies and ranks (ORDER BY in descending order) the top 5 skill IDs by their frequency (COUNT) of mention in job postings.
Then join this subquery with the skills table (skills_dim) to match IDs to skill names.
*/