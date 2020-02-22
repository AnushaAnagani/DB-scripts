/***************                    Name: Anusha Anagani  Date:02/20/2020                            *************/

/***************   QUERY TO GET THE TOTAL AMOUNT SPENT BY CUSTOMERS SUMMARIZED BY STATE AND MONTH    *************/
/*****************************************************************************************************************/
-- Used date Functions and joins.
-- used To_char() function to formate date values.
-- extracted the Month(MON) from Date time stamp value(order_date).
-- extracted state_province from cust_address.state_province column which is of datatype "address".
/*****************************************************************************************************************/ 

SELECT c.cust_address.state_province AS State_Province, 
       SUM(o.order_total) AS Total_of_Sales, 
       TO_CHAR(o.order_date, 'MON') AS Month_of_Year 
FROM oe.customers c JOIN 
     oe.orders o 
     ON c.customer_id = o.customer_id 
     where o.order_mode='direct' 
GROUP BY c.cust_address.state_province, TO_CHAR(o.order_date, 'MON') 
ORDER BY State_Province DESC;
/***************************************            END OF  QUERY         ****************************************/
