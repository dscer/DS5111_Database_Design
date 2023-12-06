
{{ config(materialized='table') }}

SELECT c.mnemonic AS course_mnemonic, c.name AS course_name, lo.objective_description AS outcome_description
FROM course c
JOIN learning_outcome lo ON c.mnemonic = lo.mnemonic
WHERE c.active = TRUE AND LOWER(lo.objective_description) LIKE '%sql%'
-- DO NOT USE ; in these sql files