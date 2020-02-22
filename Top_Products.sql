
/*************************   Name:Anusha Anagani    Date:02/20/2020   ************************************/

/********************  QUERY TO GET TOP 5 PRODUCTS ORDERED IN AMERICA  ***************************/
                      
-- If a particular product is ordered more number of times, it means that the product is more popular.
-- So obtained the product id's from the "ORDER_ITEMS" table.                                                
-- Used Joins and Subquery concepts.
/****************************************      OBSERVATIONS    ********************************************/
-- Though there is a customer base in other parts of globe. Orders were placed only from America .

/**********************************************************************************************************/
SELECT * 
FROM(
     SELECT T.PRODUCT_ID, COUNT(*) AS NUM_OF_PROD_ORDERED
    FROM OE.ORDER_ITEMS T JOIN OE.ORDERS D
    ON T.ORDER_ID = D.ORDER_ID WHERE D.CUSTOMER_ID IN
        (SELECT CUSTOMER_ID FROM OE.CUSTOMERS C WHERE UPPER(NLS_TERRITORY)= 'AMERICA' AND PRODUCT_ID IN 
            (SELECT PRODUCT_ID FROM OE.PRODUCT_INFORMATION P)
        )
    GROUP BY T.PRODUCT_ID
    ORDER BY NUM_OF_PROD_ORDERED DESC
    )
WHERE ROWNUM <=5;
/***************************************** End of Query  *************************************************/