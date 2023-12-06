
{{ config(materialized='table') }}

WITH MultipleSections AS (
    SELECT t.mnemonic, t.term
    FROM teaches t
    GROUP BY t.mnemonic, t.term
    HAVING COUNT(DISTINCT t.instructor_id) > 1
)

SELECT t.term, t.mnemonic, i.name AS instructor_name
FROM teaches t
JOIN instructor i ON t.instructor_id = i.id
WHERE (t.mnemonic, t.term) IN (SELECT mnemonic, term FROM MultipleSections)
-- DO NOT USE ; in these sql files
