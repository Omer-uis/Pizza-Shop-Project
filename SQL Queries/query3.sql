SELECT 
    date,
    st.first_name,
    st.last_name,
    st.hourly_rate,
    sh.start_time,
    sh.end_time,
    TIMESTAMPDIFF(SECOND,
        sh.start_time,
        sh.end_time) / 3600 AS hours_in_shift,
    (TIMESTAMPDIFF(SECOND,
        sh.start_time,
        sh.end_time) / 3600) * st.hourly_rate AS staff_cost
FROM
    rota r
        LEFT JOIN
    staff st ON st.staff_id = r.staff_id
        LEFT JOIN
    shift sh ON sh.shift_id = r.shift_id