SELECT *
FROM menu_items ;

SELECT *
FROM order_details ;


-- fixing column headers for menu_items

ALTER TABLE menu_items RENAME COLUMN `ï»¿menu_item_id` TO `Menu_Item_ID` ;
ALTER TABLE menu_items RENAME COLUMN `item_name` TO `Item_Name` ;
ALTER TABLE menu_items RENAME COLUMN `category` TO `Category` ;
ALTER TABLE menu_items RENAME COLUMN `price` TO `Price` ;


-- fixing column headers for order_details

ALTER TABLE order_details RENAME COLUMN `ï»¿order_details_id` TO `Order_Details_ID` ;  
ALTER TABLE order_details RENAME COLUMN `order_id` TO `Order_ID` ;
ALTER TABLE order_details RENAME COLUMN `order_date` TO `Order_Date` ;
ALTER TABLE order_details RENAME COLUMN `order_time` TO `Order_Time` ;
ALTER TABLE order_details RENAME COLUMN `item_id` TO `Item_ID` ;






