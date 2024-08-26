SELECT 
    o.order_id,
    o.quantity,
    o.created_at,
    o.delivery,
    i.item_price,
    i.item_cat,
    i.item_name,
    a.delivery_address1,
    a.delivery_address2,
    a.delivery_city,
    a.delivery_zipcode
FROM
    orders o
        LEFT JOIN
    item i ON o.item_id = i.item_id
        LEFT JOIN
    address a ON o.add_id = a.add_id