SELECT
    purchase_date,
    purchase_id,
    client_id,
    client_age,
    client_registration_age,
    CASE
    WHEN num_of_purchse == 1 THEN 'new'
    WHEN num_of_purchse > 1 THEN 'old'
    END AS client_category,
    promotion_name,
    category_name,
    partner_name,
    client_city,
    city,
    revenue,
    quantity_sum as quantity
FROM
    (SELECT 
        purchase_date,
        purchase_id,
        client_id,
        dateDiff(year, birth_date, registration) as client_age,
        dateDiff(year, registration, purchase_date) as client_registration_age,
        uniqExact(purchase_id) as num_of_purchse,
        multiply(price, quantity) as revenue,
        sum(quantity) as quantity_sum,
        promotion_name,
        category_name,
        partner_name,
        client_city,
        city
    FROM
        (SELECT
            cast(purchase.purchase_date) as purchase_date , 
            purchase.purchase_id as purchase_id,
            purchase.client_id as client_id,
            purchase.price as price,
            purchase.quantity as quantity,
            cast(clients.birth_date as date) as birth_date,
            cast(clients.registration as date) as registration,
            promotion.promotion_name as promotion_name,
            promotion.category_name as category_name, 
            promotion.partner_name as partner_name,
            city.client_city as client_city,
            city.city as city
        FROM test.t_purchase
        left join clients on purchase.client_id == clients.client_id
        left join promotion on purchase.promotion_id == promotion.promotion_id
        left join city on purchase.city_id == city.city_id
        WHERE purchase.status = 1 and (purchase_date BETWEEN '2020-05-01' AND '2020-08-01'))
    GROUP BY
    purchase_date,
    purchase_id,
    client_id,
    category_name,
    partner_name,
    client_city,
    city, 
    client_age,
    client_registration_age, 
    revenue,
    promotion_name)