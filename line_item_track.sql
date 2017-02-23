-- 12. Provide a query that includes the purchased track name with each invoice line item.

SELECT Track.Name, InvoiceLine.* FROM InvoiceLine JOIN Track ON Track.TrackId == InvoiceLine.TrackId