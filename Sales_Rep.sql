/**********************              QUERY TO GET TOP 3 SALES REPRESENTATIVES         ***************************/
/****************************************************************************************************************/
/************************************        CONCLUSION/OBSERVATIONS         *************************************/                  
-- Sales Rep with SALES_REP_ID = 161 has sold more number of products(90) 
-- Followed by SALES_REP_ID = 163 with 49 products
/****************************************************************************************************************/ 
SELECT * FROM(
    SELECT O.SALES_REP_ID,COUNT(OI.PRODUCT_ID) AS NUM_PRODUCTS   -- Displaying sales rep Id(SALES_REP_ID) and the num of products they sold(NUM_PRODUCTS). 
    FROM OE.ORDER_ITEMS OI RIGHT JOIN OE.ORDERS O                -- joining the two tables "ORDER_ITEMS" and "ORDERS" from schema "OE".
    ON OI.ORDER_ID=O.ORDER_ID                                    -- joining tables on matching columns "ORDER_ID".
    AND O.ORDER_MODE='direct'   
    GROUP BY O.SALES_REP_ID                                      -- grouping by "SALES_REP_ID" column values to get the individual products sold by each sales rep.
    HAVING O.SALES_REP_ID IS NOT NULL                            -- considering only those values of this column whose value is not null.(online sales has no Sales_rep_id). 
    ORDER BY NUM_PRODUCTS DESC)                                 -- ordering the NUM_PRODUCTS in descending order to get the (top) Sales Representatives with more Products sold. 
WHERE ROWNUM <=3;                       
/***************************************            END OF  QUERY         ****************************************/
