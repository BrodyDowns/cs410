import java.io.*;
import java.sql.*;
import java.util.*;

import com.jcraft.jsch.*;

public class Project {

	public static void main(String[] args) throws ClassNotFoundException, JSchException, SQLException {
		if (args.length<0){
			System.out.println("Usage DBConnectTest <BroncoUserid> <BroncoPassword> msandbox <sandbox password> <yourportnumber>");
		}
		else{
			Connection con = null;
			Session session = null;
			Statement stmt = null, stmt2 = null;
			try
			{
				//String strSshUser = "brodydowns";                  // SSH loging username
				//String strSshPassword = "4434BMDbsu@";                   // SSH login password
				String strSshHost = "onyx.boisestate.edu";          // hostname or ip or SSH server
				int nSshPort = 22;                                    // remote SSH host port number
				String strRemoteHost = "localhost";  // hostname or ip of your database server
				int nLocalPort = 5949;  // local port number use to bind SSH tunnel
				
				String strDbUser = "msandbox";                    // database loging username
				String strDbPassword = "gillespie";                    // database login password
				int nRemotePort = 5949; // remote port number of your database 
				
				/*
				 * STEP 0
				 * CREATE a SSH session to ONYX
				 * 
				 * */
				//session = JDBCexample.doSshTunnel(strSshUser, strSshPassword, strSshHost, nSshPort, strRemoteHost, nLocalPort, nRemotePort);
				
				
				/*
				 * STEP 1 and 2
				 * LOAD the Database DRIVER and obtain a CONNECTION
				 * 
				 * */
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:"+nLocalPort+"/car_rental?autoReconnect=true&useSSL=false", strDbUser, strDbPassword);

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
                                                System.out.println(rs.getString("plate") + " : " + rs.getInt("miles") +":"+ rs.getString("M.name") + ":" + rs.getString("status"));
                                        }
                                }

                                
                                
                                
				
			}
			catch( SQLException e )
			{
				System.out.println(e.getMessage());
				con.rollback(); // In case of any exception, we roll back to the database state we had before starting this transaction
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
				con.close();
				//session.disconnect();
			}

		}
	}
	

        private static ResultSet listCars(Connection con) throws SQLException {
                String sql;

	        con.setAutoCommit(false);//transaction block starts
                Statement stmt = con.createStatement();
		ResultSet resultSet = stmt.executeQuery("SELECT plate, miles, M.name, status FROM Car as C JOIN Model as M on C.model_id=M.model_id");
				
	        con.commit(); //transaction block ends
                return resultSet;

        }

}
