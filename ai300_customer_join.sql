#Join the 3 key tables first
SELECT *
FROM customer AS c
LEFT JOIN account AS a
    ON c.customer_id = a.customer_id
LEFT JOIN account_usage AS au
    ON a.account_id = au.account_id;

#Left Join the rest of the tables
SELECT
    c.*,
    a.*,
    au.*,
    cs.churn_label,
    ci.city,
    ci.population
FROM customer AS c
LEFT JOIN account AS a
    ON c.customer_id = a.customer_id
LEFT JOIN account_usage AS au
    ON a.account_id = au.account_id
LEFT JOIN churn_status AS cs
    ON c.customer_id = cs.customer_id
LEFT JOIN city AS ci
    ON c.zip_code = ci.zip_code;

  #Double check data completeness after joining
  SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT c.customer_id) AS unique_customers,
    SUM(cs.churn_label IS NULL) AS missing_churn_labels
FROM customer AS c
LEFT JOIN account AS a
    ON c.customer_id = a.customer_id
LEFT JOIN account_usage AS au
    ON a.account_id = au.account_id
LEFT JOIN churn_status AS cs
    ON c.customer_id = cs.customer_id
LEFT JOIN city AS ci
    ON c.zip_code = ci.zip_code;