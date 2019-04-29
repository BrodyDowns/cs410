# CS410 Final Project

## Implementation

Query 1: List all cars
Joins the cars and models table and selects information about the cars.

Query 2: Lists all available cars.
Does the same thing as Querry 1 but on the condition that cars are available.

Query 3: Add a new car. 
Inserts a new row that describes a car into Car table
Input:
  plate#
  number of miles
  status of car ('available')
  model id
  
Query 4: Add a new client.
Inserts information about a client into client table
Input:
  name
  license# 
  phone#
  
Query 5: rent a car
First checks if a car is available from the Cars table.  If the car is available then the car is inserted in the rental table and the status of the corresponding entry in the cars table is updated to 'rented'
Input:
  clientID
  carID
  start date (yyyy-mm-dd)
  end date  (yyyy-mm-dd)
  miles
  fee type
  
Query 6: display details of rental
Joins the Rental, Car, and Category tables together and on a specified rental id number.  The selected information includes client info and car info as well as the fee, number of days and total price. The total price is calculated by multiplying the fee and number of days.
Input:
  rentID
  
Query 7: Delete rental
Taking a rentID as an argument, the status of the car associated with the rentID is updated to 'available', and the row with the rentID is deleted.
Input: 
  rentID
