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

-- Most of this was 'accidentally' accomplished in #6. Added Invoice Total. 




-- 8. 

