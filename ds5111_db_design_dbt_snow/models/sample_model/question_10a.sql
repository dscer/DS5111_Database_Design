
{{ config(materialized='table') }}

SELECT t.mnemonic, t.term
FROM teaches t
GROUP BY t.mnemonic, t.term
HAVING COUNT(DISTINCT t.instructor_id) > 1
-- DO NOT USE ; in these sql files