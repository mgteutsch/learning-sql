-- 5. Provide a query showing a unique/distinct list of billing countries from the Invoice table.

Select * FROM Invoice GROUP BY BillingCountry

-- or you can use DISTINCT:

SELECT DISTINCT BillingCountry FROM Invoice 