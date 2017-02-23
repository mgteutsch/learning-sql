-- 13. Provide a query that includes the purchased track name AND artist name with each invoice line item.

SELECT Track.Name AS "Track Name", Artist.Name AS "Artist Name", InvoiceLine.* FROM InvoiceLine 
     JOIN Track ON Track.TrackId == InvoiceLine.TrackId
          JOIN Album ON Album.AlbumId == Track.AlbumId
               JOIN Artist ON Artist.ArtistId == Album.ArtistId
                    GROUP BY InvoiceLineId

-- GROUP BY isn't necessary, but will consolidate the duplicates
