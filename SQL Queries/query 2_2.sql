SELECT 
    s2.ing_name,
    s2.ordered_weight,
    ing.ing_weight*inv.quantity as total_inv_weight,
    (ing.ing_weight*inv.quantity) - s2.ordered_weight as remaining_weight
FROM
    (SELECT 
        ing_id,
            ing_name,
            SUM(ordered_weight) AS ordered_weight,
            SUM(ingredient_cost) AS ingredient_cost
    FROM
        stock1
    GROUP BY ing_id , ing_name) s2
    left join inventory inv on s2.ing_id = inv.item_id
    left join ingredient ing on ing.ing_id = s2.ing_id
