-- 7. Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.

SELECT Employee.FirstName || " " || Employee.LastName AS "Sales Agent Full Name", InvoiceId, Customer.FirstName || " " || Customer.LastName AS "Invoiced Customer Full Name", Customer.Company AS "Customer Company (if applicable)", Invoice.BillingAddress || ", " || Invoice.BillingCity || ", "|| Invoice.BillingState || ", " || Invoice.BillingCountry || ", " || Invoice.BillingPostalCode AS "Invoice Address", Invoice.Total  
     FROM Employee 
          JOIN Customer ON Employee.EmployeeId == Customer.SupportRepId 

-- Most of this was 'accidentally' accomplished in #6. Added Invoice Total.