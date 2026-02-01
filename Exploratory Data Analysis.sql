SELECT *
FROM menu_items ;

SELECT *
FROM order_details ;


-- Combining the menu_items and order_details tables into a single table

SELECT *
FROM order_details od
JOIN menu_items mi
	ON od.item_id = mi.Menu_Item_ID ;


-- finding what are the least ordered items and What categories they were in

SELECT Item_Name, Category, COUNT(Order_Details_ID) AS Number_of_purchases
FROM order_details od
JOIN menu_items mi
	ON od.Item_id = mi.Menu_Item_ID
GROUP BY Item_Name, Category
ORDER BY Number_of_purchases ;


-- finding what is the most ordered items and What categories they were in

SELECT Item_Name, Category, COUNT(Order_Details_ID) AS Number_of_purchases
FROM order_details od
JOIN menu_items mi
	ON od.Item_id = mi.Menu_Item_ID
GROUP BY Item_Name, Category
ORDER BY number_of_purchases DESC ;


-- finding what were the top 5 orders that spent the most money

SELECT Order_id, ROUND(SUM(Price), 2) AS Total
FROM order_details od
JOIN menu_items mi
	ON od.Item_id = MI.Menu_Item_ID
GROUP BY Order_id
ORDER BY Total DESC
LIMIT 5 ;


-- Viewing the details of the highest spend order 4482

SELECT *
FROM order_details od
JOIN menu_items mi
    ON od.Item_id = mi.Menu_Item_ID
WHERE Order_id = 4482 ;


-- finding the categories and number of items under each category for that order 4482

SELECT Category, COUNT(Item_ID) AS Number_of_items
FROM order_details od
JOIN menu_items mi
    ON od.Item_id = mi.Menu_Item_ID
WHERE Order_id = 4482
GROUP BY Category
ORDER BY Number_of_items DESC  ;


-- finding the menu items and the purchase number of each item, in the Mexican category

SELECT Category, Item_Name, COUNT(Item_ID) AS Number_of_items
FROM order_details od
JOIN menu_items mi
    ON od.item_id = mi.Menu_Item_ID
WHERE order_id = 4482 and category = 'mexican'
GROUP BY Category, Item_Name 
order by Category, Number_of_items desc   ;


-- Viewing the details of the top 5 highest spend orders

SELECT *
FROM order_details od
JOIN menu_items mi
    ON od.item_id = mi.Menu_Item_ID
WHERE order_id IN (4482, 740, 440, 2075, 1957) ;


-- finding the categories and the number of items under each category for those orders (4482, 740, 440, 2075, 1957)

SELECT Order_id, Category, Item_name, COUNT(Item_ID) AS Number_of_items
FROM order_details od
JOIN menu_items mi
    ON od.item_id = mi.Menu_Item_ID
WHERE order_id IN (4482, 740, 440, 2075, 1957) 
GROUP BY order_id, category, item_name
ORDER BY Number_of_items desc ;


-- ranking categories within each of the top 5 orders in regards to number of items per category

SELECT Order_id, Category, Number_of_items, ROW_NUMBER() OVER (PARTITION BY order_id ORDER BY number_of_items DESC) AS Row_num
FROM (SELECT order_id, Category, COUNT(Item_ID) AS Number_of_items
    FROM order_details od
    JOIN menu_items mi
        ON od.item_id = mi.Menu_Item_ID
    WHERE order_id IN (4482, 740, 440, 2075, 1957) 
    GROUP BY order_id, Category) AS sub ;


-- returning only the top category with most items per order

SELECT *
FROM (SELECT Order_id, Category, Number_of_items, ROW_NUMBER() OVER (PARTITION BY order_id ORDER BY number_of_items DESC) AS Row_num
	FROM (SELECT Order_id, Category, COUNT(Item_ID) AS Number_of_items
    FROM order_details od
    JOIN menu_items mi
	ON od.Item_id = mi.Menu_Item_ID
    WHERE order_id IN (4482, 740, 440, 2075, 1957) 
    GROUP BY order_id, category) AS sub)   AS row_num_table
WHERE row_num = 1 ;







