-- Select queries for each database we have : Events, Performers, Venues, Ticket_Sales, Customers, and Event_Performers 

SELECT event_id, name FROM Events;
SELECT performer_id, name FROM Performers;
SELECT venue_id, name FROM Venues;
SELECT customer_id, first_name, last_name FROM Customers;
SELECT ticket_sales_id, customer_id, event_id, number_of_tickets, date_of_purchase, total_cost FROM Ticket_Sales;
SELECT e.name AS Event_Name, p.name AS Performer_Name
FROM Events_Performers ep
JOIN Events e ON ep.event_id = e.event_id
JOIN Performers p ON ep.performer_id = p.performer_id;




--Add 

-- Insert queries for each database we have : Events, Performers, Venues, Ticket_Sales, Customers, and Event_Performers 

INSERT INTO Events (name, date, price, venue_id, total_attendees) VALUES (:name, :date, :price, :venue_id, :total_attendees);

INSERT INTO Performers (name, genre, biography, website) VALUES (:name, :genre, :biography, :website);

INSERT INTO Venues (name, location, capacity) VALUES (:name, :location, :capacity);

INSERT INTO Ticket_Sales (customer_id, event_id, number_of_tickets, date_of_purchase, total_cost) VALUES (:customer_id, :event_id, :number_of_tickets, :date_of_purchase, :total_cost);

INSERT INTO Customers (first_name, last_name, email, password) VALUES (:first_name, :last_name, :email, :password); 

INSERT INTO Event_Performers (event_id, performer_id) VALUES (:event_id, :performer_id);



--Delete 

-- Delete queries for each database we have : Events, Performers, Venues, Ticket_Sales, Customers, and Event_Performers 

DELETE FROM Events WHERE event_id = :event_id;
 
DELETE FROM Performers WHERE performer_id = :performer_id;
 
DELETE FROM Venues WHERE venue_id = :venue_id;
 
DELETE FROM Ticket_Sales WHERE ticket_sales_id = :ticket_sales_id;

DELETE FROM Customers WHERE customer_id = :customer_id;

-- First delete all related entries in the junction table
DELETE FROM Events_Performers
WHERE event_id = :specific_event_id;

-- Then delete the event itself
DELETE FROM Events
WHERE event_id = :specific_event_id;


-- First delete all related entries in the junction table
DELETE FROM Events_Performers
WHERE performer_id = :specific_performer_id;

-- Then delete the performer itself
DELETE FROM Performers
WHERE performer_id = :specific_performer_id;


--Update

-- Update queries for each database we have : Events, Performers, Venues, Ticket_Sales, Customers, and Event_Performers 

UPDATE Venues
SET name = :name, venue_location = :venue_location, capacity = :capacity
WHERE venue_id = :venue_ID_from_the_update_form;

UPDATE Performers
SET name = :name, genre = :genre, biography = :biography, website = :website
WHERE performer_id = :performer_ID_from_the_update_form;

UPDATE Events
SET name = :name, date = :date, price = :price, total_attendees = :total_attendees, venue_id = :venue_ID_from_the_drop_down
WHERE event_id = :event_ID_from_the_update_form;

UPDATE Customers
SET first_name = :first_name, last_name = :last_name, email = :email, password = :password
WHERE customer_id = :customer_ID_from_the_update_form;

UPDATE Ticket_Sales
SET customer_id = :customer_ID_from_the_drop_down, event_id = :event_ID_from_the_drop_down, number_of_tickets = :number_of_tickets, date_of_purchase = :date_of_purchase, total_cost = :total_cost
WHERE ticket_sales_id = :ticket_sales_ID_from_the_update_form;
