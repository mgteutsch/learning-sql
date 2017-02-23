-- 9. What are the respective total sales for each of those years (2009 & 2011)?

SELECT SUM(CASE WHEN InvoiceDate LIKE "2009%"THEN Total END) AS "2009 Total", 
     SUM(CASE WHEN InvoiceDate LIKE "2011%"THEN Total END) AS "2011 Total", 
           SUM(CASE WHEN InvoiceDate LIKE "2009%" OR InvoiceDate LIKE "2011%" THEN Total END) AS "2009 & 2011 Combined" FROM Invoice 

-- This will return 3 columns:
--- (1) 2009 Total (2) 2011 Total (3) 2009+2011   