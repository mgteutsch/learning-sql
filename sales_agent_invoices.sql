-- 6. Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.

SELECT Employee.FirstName || " " || Employee.LastName AS "Sales Agent Full Name", InvoiceId, Customer.FirstName || " " || Customer.LastName AS "Invoiced Customer Full Name", Customer.Company AS "Customer Company (if applicable)", Invoice.BillingAddress || ", " || Invoice.BillingCity || ", "|| Invoice.BillingState || ", " || Invoice.BillingCountry || ", " || Invoice.BillingPostalCode AS "Invoice Address"  
     FROM Employee 
          JOIN Customer ON Employee.EmployeeId == Customer.SupportRepId 
               JOIN Invoice ON Customer.CustomerId == Invoice.CustomerId