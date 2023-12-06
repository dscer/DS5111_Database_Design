
{{ config(materialized='table') }}

SELECT
    t.term,
    i.name AS instructor_name,
    COUNT(t.mnemonic) AS num_courses_taught
FROM
    teaches t
JOIN
    instructor i ON t.instructor_id = i.id
GROUP BY
    t.term, i.name
ORDER BY
    t.term, instructor_name
-- DO NOT USE ; in these sql files