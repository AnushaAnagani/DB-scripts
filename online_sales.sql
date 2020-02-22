/***************                    NAME: ANUSHA ANAGANI  DATE:02/20/2020                            *************/

/*************************        QUERY TO GET THE TOTAL MONTHLY ONLINE SALES                *********************/
/*****************************************************************************************************************/
-- used To_char() function to formate date values.
-- extracted the Month(MON) from Date time stamp value(order_date).
-- It was observed that there were no online sales during the months of April,July,September.
/*****************************************************************************************************************/ 

SELECT to_char(order_date,'MON') AS Sales_Month,SUM(order_total) AS Total_Of_Sales 
FROM oe.orders 
WHERE lower(order_mode)='online' 
GROUP BY to_char(order_date,'MON') 
ORDER BY Total_Of_Sales DESC;
/***************************************            END OF  QUERY         ****************************************/
