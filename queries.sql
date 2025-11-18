SELECT * FROM car_data LIMIT 5;
SELECT * FROM transport_data LIMIT 5;
SELECT * FROM daily_grid LIMIT 5;

# Query 1: Bookings per Week per Retail Country
SELECT 
    STR_TO_DATE(CONCAT(YEAR(booking_date), ' ', WEEK(booking_date, 1), ' 1'), '%Y %u %w') AS week_start,
    retail_country,
    COUNT(*) AS num_bookings
FROM car_data
WHERE booking_date IS NOT NULL
GROUP BY 1,2
ORDER BY 1,2


# Query 2: First Workshop Entry per Week per Retail Country with Average Lead Time
SELECT 
    dg.week,
    cd.retail_country,
    COUNT(DISTINCT td.car_id) AS first_workshop_entries,
    AVG(DATEDIFF(td.delivery_date, cd.booking_date)) AS avg_lead_time
FROM transport_data td
JOIN car_data cd 
    ON td.car_id = cd.id
JOIN daily_grid dg 
    ON td.delivery_date BETWEEN dg.first_day_of_week AND dg.last_day_of_week
WHERE td.destination_type = 'Workshop'
GROUP BY dg.week, cd.retail_country
ORDER BY dg.week, cd.retail_country;

# Query 3: Weekly Computation for KPIs
WITH backlog AS (
    SELECT 
        dg.week,
        cd.retail_country,
        COUNT(cd.id) AS backlog_count,
        AVG(DATEDIFF(dg.last_day_of_week, cd.booking_date)) AS avg_backlog_age
    FROM car_data cd
    JOIN daily_grid dg 
        ON cd.booking_date <= dg.last_day_of_week
    LEFT JOIN transport_data td 
        ON cd.id = td.car_id AND td.status = 3
    WHERE td.car_id IS NULL  -- Cars booked but not yet delivered
    GROUP BY dg.week, cd.retail_country
)
SELECT 
    b.week,
    b.retail_country,
    COUNT(cd.id) AS num_bookings,
    COUNT(DISTINCT td.car_id) AS first_workshop_deliveries,
    AVG(DATEDIFF(td.delivery_date, cd.booking_date)) AS avg_lead_time,
    b.backlog_count,
    b.avg_backlog_age
FROM backlog b
JOIN daily_grid dg 
    ON b.week = dg.week
LEFT JOIN car_data cd 
    ON cd.booking_date BETWEEN dg.first_day_of_week AND dg.last_day_of_week
LEFT JOIN transport_data td 
    ON cd.id = td.car_id AND td.destination_type = 'Workshop'
WHERE cd.booking_date IS NOT NULL  -- Filter to avoid unnecessary rows
GROUP BY 
    b.week, b.retail_country, b.backlog_count, b.avg_backlog_age
ORDER BY b.week, b.retail_country;