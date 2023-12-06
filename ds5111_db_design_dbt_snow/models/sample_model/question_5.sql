
{{ config(materialized='table') }}

SELECT c.mnemonic AS course_mnemonic, c.name AS course_name
FROM course c
LEFT JOIN learning_outcome lo ON c.mnemonic = lo.mnemonic
WHERE c.active = TRUE AND lo.objective_id IS NULL
-- DO NOT USE ; in these sql files