-- 8. How many Invoices were there in 2009 and 2011?

SELECT * FROM Invoice WHERE 
    (InvoiceDate BETWEEN "2009-01-01 00:00:00" AND "2009-12-31 00:00:00") 
    OR 
    (InvoiceDate BETWEEN "2011-01-01 00:00:00" AND "2011-12-31 00:00:00")

-- The number of rows returned is 166
-- Another way to do it is:

SELECT COUNT(InvoiceDate) FROM Invoice WHERE 
    (InvoiceDate BETWEEN "2009-01-01 00:00:00" AND "2009-12-31 00:00:00") 
    OR 
    (InvoiceDate BETWEEN "2011-01-01 00:00:00" AND "2011-12-31 00:00:00")

-- which returns 166 in the actual table
-- Simpler:

SELECT COUNT(InvoiceDate) FROM Invoice WHERE 
    InvoiceDate LIKE "2009%" 
    OR 
    InvoiceDate LIKE "2011%" 



