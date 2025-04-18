SELECT 
    invoice_line_id,
    invoice_id,
    track_id,
    customer_id,
    employee_id,
    invoice_date,
    1 AS quantity,
    track_price AS unit_price,
    track_price AS total
INTO Chinook_sales_DM.dbo.fact_sales
FROM OBT_Chinook;

SELECT DISTINCT
    customer_id,
    customer_first_name,
    customer_last_name,
    customer_email,
    customer_company,
    customer_country,
    employee_id AS support_rep_id
INTO Chinook_sales_DM.dbo.dim_customer
FROM OBT_Chinook;

SELECT DISTINCT
    employee_id,
    support_rep_first_name,
    support_rep_last_name,
    support_rep_title
INTO Chinook_sales_DM.dbo.dim_employee
FROM OBT_Chinook
WHERE employee_id IS NOT NULL;

SELECT DISTINCT
    track_id,
    track_name,
    album_title,
    artist_name,
    genre_name,
    media_type_name,
    milliseconds,
    bytes,
    track_price
INTO Chinook_sales_DM.dbo.dim_track
FROM OBT_Chinook;