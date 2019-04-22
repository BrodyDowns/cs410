import java.io.*;
import java.sql.*;
import java.util.*;

import com.jcraft.jsch.*;

public class Project {
    
    public static void main(String[] args) throws ClassNotFoundException, 
            JSchException, SQLException {
        
            if (args.length<0){
	        System.out.println("Usage DBConnectTest <BroncoUserid> " + 
                        "<BroncoPassword> msandbox <sandbox password> " + 
                        "<yourportnumber>");
            }
	    else{
                Connection con = null;
                Session session = null;
                Statement stmt = null, stmt2 = null;
                try
                {
                    // hostname or ip or SSH server
                    String strSshHost = "onyx.boisestate.edu"; 

                    // remote SSH host port number
		    int nSshPort = 22;

                    // hostname or ip of your database server
                    String strRemoteHost = "localhost";
                    
                    // local port number use to bind SSH tunnel
		    int nLocalPort = 6942;
				
                    // database loging username
		    String strDbUser = "msandbox";

                    // database login password
		    String strDbPassword = "4434Bsql";                    
		    
                    // remote port number of your database  
                    int nRemotePort = 6942; 
				
		    /*
		    * STEP 0
		    * CREATE a SSH session to ONYX
		    * 
		    * */
		    //session = JDBCexample.doSshTunnel(strSshUser, 
                    //              strSshPassword, strSshHost, nSshPort, 
                    //              strRemoteHost, nLocalPort, nRemotePort);
				
				
		    /*
		    * STEP 1 and 2
		    * LOAD the Database DRIVER and obtain a CONNECTION
		    * 
		    * */
		    Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection("jdbc:mysql://localhost:"+
                            nLocalPort+"/car_rental?autoReconnect=true&useSSL=false",
                            strDbUser, strDbPassword);

		    /*
		    * STEP 3
		    * EXECUTE STATEMENTS (by using Transactions)
		    * 
		    * */
                    if(args[0].equals("cars"))
                    {
		        ResultSet rs = listCars(con);
			System.out.println("Transaction done!");
                        while(rs.next())
                        {
                            System.out.println(
                                "Make: " + rs.getString("M.make") + "\n" +
                                "Model: " + rs.getString("M.name") + "\n"+
                                "Miles: " + rs.getInt("miles") + "\n" +
                                "Plate#: " + rs.getString("plate") + "\n" + 
                                "status: " + rs.getString("status") + "\n\n");
                        }
                    }	

                    if (args[0].equals("availableCars")) {
                        ResultSet rs = listCars(con);
			System.out.println("Transaction done!");
                        while(rs.next())
                        {
                            System.out.println(
                                "Make: " + rs.getString("M.make") + "\n" +
                                "Model: " + rs.getString("M.name") + "\n"+
                                "Miles: " + rs.getInt("miles") + "\n" +
                                "Plate#: " + rs.getString("plate") + "\n" + 
                                "status: " + rs.getString("status") + "\n\n");
                        }
                    }

                    if (args[0].equals("addNewCar")) {
                        int model = Integer.parseInt(args[1]);
                        int miles = Integer.parseInt(args[3]);
                        addNewCar(con, model, args[2], miles); 
                    }
                    
                    if (args[0].equals("addClient")) {
                        addNewClient(con, args[1], args[2], args[3]);
                    }

                    if (args[0].equals("rentCar")) {
                    
                        int client = Integer.parseInt(args[1]);
                        int carID = Integer.parseInt(args[2]);
                        int miles = Integer.parseInt(args[5]);


                        rentCar(con, client, carID, args[3], args[4], miles, args[6]);
                    }

                    if (args[0].equals("rentalDetails")) {
                        int rentID = Integer.parseInt(args[1]);
                        ResultSet rs = rentalDetails(con, rentID);
                        rs.next();
                        double total = rs.getDouble("Ct.fee") * rs.getInt(8);
                        System.out.println(
                            "Client Name: " + rs.getString("Cl.name") + "\n" +
                            "Client License: " + rs.getString("Cl.license") + "\n"+
                            "Client Phone: " + rs.getString("Cl.phone") + "\n" +
                            "Car Plate: " + rs.getString("C.plate") + "\n" + 
                            "Car Status: " + rs.getString("C.status") + "\n" + 
                            "Car Model ID: " + rs.getInt("C.model_id") + "\n" + 
                            "Category Fee: " + rs.getDouble("Ct.fee") + "\n" + 
                            "Days : " + rs.getInt(8) + "\n" +
                            "Total Price: " + total  + "\n"
                        );
                    }

                    if (args[0].equals("deleteRental")) {
                        deleteRental(con, Integer.parseInt(args[1]));
                    } 
                    
                    if (args[0].equals("help")) {
                       
                    }
		}
		catch( SQLException e )
		{
		    System.out.println(e.getMessage());

                    /* In case of any exception, we roll back to the database 
                       state we had before starting this transaction */
		    con.rollback(); 
	        }
		finally{		
		    /*
		    * STEP 5
		    * CLOSE CONNECTION AND SSH SESSION
		    * 
		    * */
				
		    if(stmt!=null)
			stmt.close();
				
		    if(stmt2!=null)
			stmt2.close();
				
		    con.setAutoCommit(true); // restore dafault mode
		    con.close(); //session.disconnect();
		}
    	    }
	}
	
        private static ResultSet listCars(Connection con) throws SQLException {
	    con.setAutoCommit(false);//transaction block starts
            Statement stmt = con.createStatement();
	    ResultSet resultSet = stmt.executeQuery(
                "SELECT plate, miles, M.name, M.make, status " +
                "FROM Car as C JOIN Model as M on C.model_id=M.model_id ");
				
	    con.commit(); //transaction block ends
            return resultSet;
        }

        private static ResultSet availableCars(Connection con) throws SQLException {
	    con.setAutoCommit(false);//transaction block starts
            Statement stmt = con.createStatement();
	    ResultSet resultSet = stmt.executeQuery(
                "SELECT plate, miles, M.name, M.make, status " +
                "FROM Car as C JOIN Model as M on C.model_id=M.model_id "+
                "WHERE C.status = 'available'");
				
	    con.commit(); //transaction block ends
            return resultSet;
        }

        private static void addNewCar(Connection con, int model, 
            String plateNum, int miles) throws SQLException {
	    con.setAutoCommit(false);//transaction block starts
            PreparedStatement stmt = con.prepareStatement(
                "INSERT INTO Car (plate, miles, status, model_id) " +
                "values(?, ?, ?, ?)");

            stmt.setString(1, plateNum);
            stmt.setInt(2, miles);
            stmt.setString(3, "available");
            stmt.setInt(4, model);
            stmt.executeUpdate();
	    con.commit(); //transaction block ends
        }

        private static void addNewClient(Connection con, String name, 
            String license, String phone) throws SQLException {
            con.setAutoCommit(false);//transaction block starts
            PreparedStatement stmt = con.prepareStatement(
                "INSERT INTO Client (name, license, phone) " +
                "values(?, ?, ?)");

            stmt.setString(1, name);
            stmt.setString(2, license);
            stmt.setString(3, phone);
            stmt.executeUpdate();
	    con.commit(); //transaction block ends
        }
        
        private static void rentCar(Connection con, int client, int car, 
            String startDate, String endDate, int miles, String feeType)
            throws SQLException {
            con.setAutoCommit(false);//transaction block starts
            PreparedStatement stmt0 = con.prepareStatement(
                "SELECT status " +
                "FROM Car " +
                "WHERE car_id=?;");

            stmt0.setInt(1, car);
            ResultSet resultSet = stmt0.executeQuery();

            resultSet.next();
            String result = resultSet.getString("status");
            System.out.println(result);

            if (result.equals("available")) {
            
                 PreparedStatement stmt = con.prepareStatement(
                "INSERT INTO Rental (client_code, car_id, start_date, end_date, " +
                    "miles, category_type) " +
                "values (?, ?, ?, ?, ?, ?)");

                stmt.setInt(1, client);
                stmt.setInt(2, car);
                stmt.setString(3, startDate);
                stmt.setString(4, endDate);
                stmt.setInt(5, miles);
                stmt.setString(6, feeType);
                stmt.executeUpdate();


                PreparedStatement stmt1 = con.prepareStatement(
                "UPDATE Car " +
                "SET status='rented' WHERE car_id=?;"
                );
                stmt1.setInt(1, car);
                stmt1.executeUpdate();

            } else {
                System.out.println("Car not available.");
            }
            con.commit(); //transaction block ends


        }

        private static ResultSet rentalDetails(Connection con, int rentID) throws SQLException {
	    con.setAutoCommit(false);//transaction block starts
            Statement stmt = con.createStatement();
	    ResultSet resultSet = stmt.executeQuery(
                "SELECT Cl.name, Cl.license, Cl.phone, C.plate, C.status, C.model_id, Ct.fee, DATEDIFF(R.end_date,R.start_date)" +
                "FROM Rental as R JOIN Client as Cl on R.client_code=Cl.client_code " +
                "JOIN Car as C on R.car_id=C.car_id " +
                "JOIN Category Ct on R.category_type=Ct.type " +
                "WHERE R.rental_id =" + rentID
            );


	    con.commit(); //transaction block ends
            return resultSet;
        }
        
        private static void deleteRental(Connection con, int rentID) throws SQLException {
	    con.setAutoCommit(false);//transaction block starts
	   
            Statement stmt = con.createStatement();
	    ResultSet rs = stmt.executeQuery(
                "SELECT car_id " +
                "FROM Rental " +
                "WHERE rental_id=" + rentID
            );
            rs.next();
            int car_id = rs.getInt("car_id");

            
            stmt = con.createStatement();
	    stmt.executeUpdate(
                "UPDATE Car " +
                "SET status='available' " +
                "WHERE car_id=" + car_id
            );

            stmt = con.createStatement();
	    stmt.executeUpdate(
                "DELETE FROM Rental " +
                "WHERE rental_id=" + rentID
            );

            con.commit(); //transaction block ends
        }
        
        private static void help() {
            System.out.println("Help!\n");
        }

}
