/***************                    NAME: ANUSHA ANAGANI  DATE:02/20/2020                            *************/

/*************************        QUERY TO GET THE TOTAL MONTHLY DIRECT SALES                *********************/
/*****************************************************************************************************************/
-- used To_char() function to formate date values.
-- extracted the Month(MON) from Date time stamp value(order_date).

/*****************************************************************************************************************/ 

SELECT to_char(order_date,'MON') AS Sales_Month,SUM(order_total) AS Total_Of_Sales 
FROM oe.orders 
WHERE lower(order_mode)='direct' 
GROUP BY to_char(order_date,'MON') 
ORDER BY Total_Of_Sales DESC;
/***************************************            END OF  QUERY         ****************************************/
