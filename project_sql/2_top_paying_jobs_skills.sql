/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Philippines' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

/*
SQL dominates → It remains the foundation of data analyst roles.

Python is strong → Its presence shows demand for scripting, automation, and advanced analytics.

Visualization & BI tools vary → Employers list different tools (Tableau, Looker, Power BI) rather than one standard, suggesting flexibility is valued.

Cloud data warehousing is relevant → Mentions of Snowflake and BigQuery show that modern data analysts often work with cloud ecosystems.

Statistical & version control skills appear → R (for stats) and GitHub (for collaboration/version control) are less common but noteworthy.

👉 Overall, a strong candidate would prioritize SQL + Python, and add one or two BI/cloud tools depending on the industry.


[
  {
    "job_id": 830180,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Curated",
    "skills": "sql"
  },
  {
    "job_id": 830180,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Curated",
    "skills": "bigquery"
  },
  {
    "job_id": 830180,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Curated",
    "skills": "looker"
  },
  {
    "job_id": 37518,
    "job_title": "Data Analyst - mid-level",
    "salary_year_avg": "98500.0",
    "company_name": "InDebted",
    "skills": "sql"
  },
  {
    "job_id": 37518,
    "job_title": "Data Analyst - mid-level",
    "salary_year_avg": "98500.0",
    "company_name": "InDebted",
    "skills": "python"
  },
  {
    "job_id": 37518,
    "job_title": "Data Analyst - mid-level",
    "salary_year_avg": "98500.0",
    "company_name": "InDebted",
    "skills": "postgresql"
  },
  {
    "job_id": 37518,
    "job_title": "Data Analyst - mid-level",
    "salary_year_avg": "98500.0",
    "company_name": "InDebted",
    "skills": "snowflake"
  },
  {
    "job_id": 37518,
    "job_title": "Data Analyst - mid-level",
    "salary_year_avg": "98500.0",
    "company_name": "InDebted",
    "skills": "tableau"
  },
  {
    "job_id": 37518,
    "job_title": "Data Analyst - mid-level",
    "salary_year_avg": "98500.0",
    "company_name": "InDebted",
    "skills": "github"
  },
  {
    "job_id": 304908,
    "job_title": "Data Analyst - 6 month's contract",
    "salary_year_avg": "69900.0",
    "company_name": "RepRisk AG",
    "skills": "sql"
  },
  {
    "job_id": 304908,
    "job_title": "Data Analyst - 6 month's contract",
    "salary_year_avg": "69900.0",
    "company_name": "RepRisk AG",
    "skills": "python"
  },
  {
    "job_id": 304908,
    "job_title": "Data Analyst - 6 month's contract",
    "salary_year_avg": "69900.0",
    "company_name": "RepRisk AG",
    "skills": "r"
  },
  {
    "job_id": 304908,
    "job_title": "Data Analyst - 6 month's contract",
    "salary_year_avg": "69900.0",
    "company_name": "RepRisk AG",
    "skills": "power bi"
  }
]
*/