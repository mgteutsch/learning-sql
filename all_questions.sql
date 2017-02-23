 -- 1. Provide a query showing Customers (just their full names, customer ID and country) who are not in the US

SELECT * FROM Customer WHERE Country != "USA"




-- 2. Provide a query only showing the Customers from Brazil.

SELECT * FROM Customer WHERE Country == "Brazil"




-- 3. Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.

Select Customer.FirstName || " " || Customer.LastName AS "Customer Full Name", Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.BillingCountry FROM Customer
JOIN Invoice ON Invoice.CustomerId == Customer.CustomerId
WHERE BillingCountry == "Brazil"

-- Having "Invoice.BillingCountry" or "Customer.FirstName" is redundant,
-- but I think it is clearer for a user to know where the field comes from.




-- 4. Provide a query showing only the Employees who are Sales Agents.

Select * FROM Employee WHERE Title == "Sales Support Agent"




-- 5. Provide a query showing a unique/distinct list of billing countries from the Invoice table.

Select * FROM Invoice GROUP BY BillingCountry

-- or you can use DISTINCT:

SELECT DISTINCT BillingCountry FROM Invoice 




-- 6. Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.

SELECT Employee.FirstName || " " || Employee.LastName AS "Sales Agent Full Name", InvoiceId, Customer.FirstName || " " || Customer.LastName AS "Invoiced Customer Full Name", Customer.Company AS "Customer Company (if applicable)", Invoice.BillingAddress || ", " || Invoice.BillingCity || ", "|| Invoice.BillingState || ", " || Invoice.BillingCountry || ", " || Invoice.BillingPostalCode AS "Invoice Address"  
     FROM Employee 
          JOIN Customer ON Employee.EmployeeId == Customer.SupportRepId 
               JOIN Invoice ON Customer.CustomerId == Invoice.CustomerId

-- I added some extras around the Invoiced Customer (including Name, Company, and Address)




-- 7. Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.

SELECT Employee.FirstName || " " || Employee.LastName AS "Sales Agent Full Name", InvoiceId, Customer.FirstName || " " || Customer.LastName AS "Invoiced Customer Full Name", Customer.Company AS "Customer Company (if applicable)", Invoice.BillingAddress || ", " || Invoice.BillingCity || ", "|| Invoice.BillingState || ", " || Invoice.BillingCountry || ", " || Invoice.BillingPostalCode AS "Invoice Address", Invoice.Total  
     FROM Employee 
          JOIN Customer ON Employee.EmployeeId == Customer.SupportRepId
               JOIN Invoice ON Customer.CustomerId == Invoice.CustomerId 

-- Most of this was 'accidentally' accomplished in #6. Added Invoice Total. 




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




-- 9. What are the respective total sales for each of those years (2009 & 2011)?

SELECT SUM(CASE WHEN InvoiceDate LIKE "2009%" THEN Total END) AS "2009 Total", 
     SUM(CASE WHEN InvoiceDate LIKE "2011%" THEN Total END) AS "2011 Total", 
           SUM(CASE WHEN InvoiceDate LIKE "2009%" OR InvoiceDate LIKE "2011%" THEN Total END) AS "2009 & 2011 Combined" FROM Invoice 

-- This will return 3 columns:
--- (1) 2009 Total (2) 2011 Total (3) 2009+2011 




-- 10. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.

SELECT COUNT(InvoiceId) FROM InvoiceLine WHERE InvoiceId == 37




-- 11. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY

SELECT InvoiceId, COUNT(InvoiceId) FROM InvoiceLine GROUP BY InvoiceId




-- 12. Provide a query that includes the purchased track name with each invoice line item.

SELECT Track.Name, InvoiceLine.* FROM InvoiceLine JOIN Track ON Track.TrackId == InvoiceLine.TrackId 




-- 13. Provide a query that includes the purchased track name AND artist name with each invoice line item.

SELECT Track.Name AS "Track Name", Artist.Name AS "Artist Name", InvoiceLine.* FROM InvoiceLine 
     JOIN Track ON Track.TrackId == InvoiceLine.TrackId
          JOIN Album ON Album.AlbumId == Track.AlbumId
               JOIN Artist ON Artist.ArtistId == Album.ArtistId
                    GROUP BY InvoiceLineId

-- GROUP BY isn't necessary, but will consolidate the duplicates




-- 14. 













