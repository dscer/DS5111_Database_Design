
{{ config(materialized='table') }}

SELECT c.mnemonic AS course_mnemonic, COUNT(lo.objective_id) AS num_learning_outcomes
FROM course c
LEFT JOIN learning_outcome lo ON c.mnemonic = lo.mnemonic
WHERE c.active = TRUE
GROUP BY c.mnemonic
-- DO NOT USE ; in these sql files