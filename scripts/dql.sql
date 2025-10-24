--Получение информации о сумме товаров заказанных под каждого клиента
SELECT 
	c.name AS client_name,
    COALESCE(SUM(pio.quantity * pio.price), 0) AS total_amount
FROM clients c
LEFT JOIN orders AS o ON c.id = o.client_id 
LEFT JOIN products_in_orders AS pio ON pio.order_id = o.id
GROUP BY c.id
ORDER BY total_amount DESC;


--Количество дочерних элементов первого уровня вложенности для категорий номенклатуры
SELECT 
    parent.name AS category_name,
    COUNT(child.id) AS child_count
FROM categories parent
LEFT JOIN categories AS child ON parent.id = child.parent_id
GROUP BY parent.id
ORDER BY parent.id;