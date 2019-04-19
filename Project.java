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
		    int nLocalPort = 5949;  
				
                    // database loging username
		    String strDbUser = "msandbox";

                    // database login password
		    String strDbPassword = "gillespie";                    
		    
                    // remote port number of your database  
                    int nRemotePort = 5949; 
				
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
			String results = "";
                        while(rs.next())
                        {
                            System.out.println(rs.getString("plate") + " : " + 
                                    rs.getInt("miles") +":"+ rs.getString("M.name") +
                                    ":" + rs.getString("status"));
                        }
                    }	

                    if (args[0].equals("addNewCar")) {
                    
                    }

                    if (args[0].equals("addClient")) {
                    
                    }

                    if (args[0].equals("rentCar")) {
                    
                    }

                    if (args[0].equals("rentalDetails")) {
                    
                    }

                    if (args[0].equals("deleteRental")) {
                    
                    } 
                    
                    if (args[0].equals("help")) {
                        help();
                    }
                    else {
                        System.out.println("Invalid command.\n");
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
                String sql;

	        con.setAutoCommit(false);//transaction block starts
                Statement stmt = con.createStatement();
		ResultSet resultSet = stmt.executeQuery(
                        "SELECT plate, miles, M.name, status " +
                        "FROM Car as C JOIN Model as M on C.model_id=M.model_id " +
                        "WHERE C.status = 'available'");
				
	        con.commit(); //transaction block ends
                return resultSet;

        }

        private static ResultSet addNewCar(Connection con) throws SQLException {
           return null; 
        }

        private static ResultSet addNewClient(Connection con) throws SQLException {
            return null;
        }
        
        private static ResultSet rentCar(Connection con) throws SQLException {
            return null;
        }

        private static ResultSet rentalDetails(Connection con) throws SQLException {
            return null;
        }
        
        private static ResultSet deleteRental(Connection con) throws SQLException {
            return null;
        }
        
        private static void help() {
            System.out.println("Help!\n");
        }

}
