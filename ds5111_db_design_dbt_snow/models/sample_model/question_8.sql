
{{ config(materialized='table') }}

SELECT DISTINCT i.name AS instructor_name
FROM teaches t
JOIN instructor i ON t.instructor_id = i.id
WHERE t.term = 'fall2021'
ORDER BY instructor_name
-- DO NOT USE ; in these sql files