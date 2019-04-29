# CS410 Final Project

## Implementation

Query 1: listCars()<br>
Joins the cars and models table and selects information about the cars.

Query 2: availableCars()<br>
Does the same thing as Querry 1 but on the condition that cars are available.

Query 3: addNewCar(int model, String plateNum, int miles)<br> 
Inserts a new row into the Cars table given a model, plateNum, and miles. 

Query 4: addNewClient(String name, String license, String phone)<br>
Given a name, license number, and phone number, inserts a new row into the Client table.
  
Query 5: rentCar(int client, int car, String startDate, String endDate, int miles, String feeType)<br>
Given a client id, car id, start date, end date, miles, and fee type, inserts a new row into Rental table 
and updates the status in the car table.  The status of the car is check first to make sure it's available.
  
Query 6: rentDetails(int rentID)<br>
Given a rentID, foins the Rental, Car, and Category tables together and on a specified rental id number.  The selected information
includes client info and car info as well as the fee, number of days and total price. The total price is calculated 
by multiplying the fee and number of days.
  
Query 7: deleteRental(int rentID)<br>
Given a rentID, the status of the car associated with the rentID is updated to 'available', and the row with the rentID is deleted.
