-- 3. Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.

Select Customer.FirstName || " " || Customer.LastName AS "Customer Full Name", Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.BillingCountry FROM Customer
JOIN Invoice ON Invoice.CustomerId == Customer.CustomerId
WHERE BillingCountry == "Brazil"

-- Having "Invoice.BillingCountry" or "Customer.FirstName" is redundant,
-- but I think it is clearer for a user to know where the field comes from.