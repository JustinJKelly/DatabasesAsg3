ALTER TABLE Tickets 
ADD CONSTRAINT positive_ticketPrice CHECK (ticketPrice > 0);

ALTER TABLE Customers
ADD CHECK (joinDate >= '2015-11-27');

ALTER TABLE Showings
ADD CHECK (NOT (movieID IS NOT NULL AND priceCode IS NULL));
