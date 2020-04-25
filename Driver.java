//Joshua Martin JTM119 4264878

import java.sql.*;
import java.util.*;

public class Driver{
	public static void main(String[] args){
		//This is a driver to test each of the methods of Olympic.java
		Olympic tester = new Olympic();
		Connection olympicDb;
		try{
			DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
	        Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@class3.cs.pitt.edu:1521:dbclass", "jtm119", "4264878");
	        connection.setAutoCommit(true);
	        connection.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
			connection = DriverManager.getConnection("jdbc:oracle:thin:@class3.cs.pitt.edu:1521:dbclass", "jtm119", "4264878");
			olympicDb = connection;

			System.out.println("Connected to database");
			//Begin with login 
				ResultSet result;
				System.out.println("Testing the Login method\n");
				System.out.println("Table before logging in : ");
				//Print the table before logging int
				Statement sqlStatement;
				String query;
				
				System.out.println("The login was successful :" + tester.login("jtm119", "Organizer"));

			//Testing Organizer Methods -----------------------------------------------------------------------------------------

			//Next Test create user 
				System.out.println("\nNow Testing CREATE USER, creaets user jtm117 as a coach with passkey pass 123");
				try{
					sqlStatement = olympicDb.createStatement();
					query = "select * from USER_ACCOUNT";	
					result = sqlStatement.executeQuery(query);
					while(result.next()){
							
							System.out.println(result.getString(1) + "\t\t" + result.getString(2) + "\t\t" + result.getString(3) + "\t\t" + result.getString(4) + "\t\t" + result.getString(5) + " ");
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				tester.createUser("jtm117", "pass123", 2);
				System.out.println("\n\nAfter");
				try{
					sqlStatement = olympicDb.createStatement();
					query = "select * from USER_ACCOUNT";	
					result = sqlStatement.executeQuery(query);
					while(result.next()){
							
							System.out.println(result.getString(1) + "\t\t" + result.getString(2) + "\t\t" + result.getString(3) + "\t\t" + result.getString(4) + "\t\t" + result.getString(5) + " ");
					}
				}catch(Exception e){
					e.printStackTrace();
				}


			//Next Test drop user
				System.out.println("\n\nNow testing drop user, dropping user jtm117\n\n");
				try{
						sqlStatement = olympicDb.createStatement();
						query = "select * from USER_ACCOUNT";	
						result = sqlStatement.executeQuery(query);
						while(result.next()){
								
								System.out.println(result.getString(1) + "\t\t" + result.getString(2) + "\t\t" + result.getString(3) + "\t\t" + result.getString(4) + "\t\t" + result.getString(5) + " ");
						}
				}catch(Exception e){
					e.printStackTrace();
				}
				tester.dropUser("jtm117");
				System.out.println("\n\nAfter");
				try{
						sqlStatement = olympicDb.createStatement();
						query = "select * from USER_ACCOUNT";	
						result = sqlStatement.executeQuery(query);
						while(result.next()){
								
								System.out.println(result.getString(1) + "\t\t" + result.getString(2) + "\t\t" + result.getString(3) + "\t\t" + result.getString(4) + "\t\t" + result.getString(5) + " ");
						}
				}catch(Exception e){
					e.printStackTrace();
				}

			//Next test create event
				System.out.println("\n\nNow testing create event, creating event with sportID 1, venue ID 1, date Oct 14 2004, gender M");	
				try{
					sqlStatement = olympicDb.createStatement();
					query = "select * from EVENT";	
					result = sqlStatement.executeQuery(query);
					while(result.next()){
								
						System.out.println(result.getString(1) + "\t\t" + result.getString(2) + "\t\t" + result.getString(3) + "\t\t" + result.getString(4) + "\t\t" + result.getString(5) + " ");
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				tester.createEvent(1,1,"14-OCT-2004", 'M');
				System.out.println("\n\nAfter");
				try{
					sqlStatement = olympicDb.createStatement();
					query = "select * from EVENT";	
					result = sqlStatement.executeQuery(query);
					while(result.next()){
								
						System.out.println(result.getString(1) + "\t\t" + result.getString(2) + "\t\t" + result.getString(3) + "\t\t" + result.getString(4) + "\t\t" + result.getString(5) + " ");
					}
				}catch(Exception e){
					e.printStackTrace();
				}
			
			//Next test add event outcome
				//Event 26
				System.out.println("\n\nTesting add event outcome should see (1, 1, 1, 1, 1)");
				try{
					sqlStatement = olympicDb.createStatement();
					query = "select * from SCOREBOARD";	
					result = sqlStatement.executeQuery(query);
					while(result.next()){
								
						System.out.println(result.getString(1) + "\t\t" + result.getString(2) + "\t\t" + result.getString(3) + "\t\t" + result.getString(4) + "\t\t" + result.getString(5) + " ");
					}
				}catch(Exception e){
				e.printStackTrace();
				}	
				tester.addEventOutcome(1, 1, 1, 1, 1);
				System.out.println("\n\nAfter");

				try{
					sqlStatement = olympicDb.createStatement();
					query = "select * from SCOREBOARD";	
					result = sqlStatement.executeQuery(query);
					while(result.next()){
								
						System.out.println(result.getString(1) + "\t\t" + result.getString(2) + "\t\t" + result.getString(3) + "\t\t" + result.getString(4) + "\t\t" + result.getString(5) + " ");
					}
				}catch(Exception e){
					e.printStackTrace();
				}
					
			//Test Log Out-------------------------------------------------------------------------------------------------------
				//Create a coach
				tester.createUser("jtm117", "pass123", 2);

				System.out.println("\n\nLogging out now");
				try{
					sqlStatement = olympicDb.createStatement();
					query = "select * from USER_ACCOUNT";	
					result = sqlStatement.executeQuery(query);
					while(result.next()){
							
							System.out.println(result.getString(1) + "\t\t" + result.getString(2) + "\t\t" + result.getString(3) + "\t\t" + result.getString(4) + "\t\t" + result.getString(5) + " ");
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				tester.logout();
				System.out.println("\n\nAfter Log out");
				try{
					sqlStatement = olympicDb.createStatement();
					query = "select * from USER_ACCOUNT";	
					result = sqlStatement.executeQuery(query);
					while(result.next()){
							
							System.out.println(result.getString(1) + "\t\t" + result.getString(2) + "\t\t" + result.getString(3) + "\t\t" + result.getString(4) + "\t\t" + result.getString(5) + " ");
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				tester.login("jtm117", "pass123");


			//Testing Coach Methods Now -----------------------------------------------------------------------------------------
				
			//Testing createTeam
				System.out.println("\n\nNow testing create team: using values Athens, 2004, 1000M Canoe Sprint, China, Successors\n");
				System.out.println("The output will be 73, 4, Successors, 2, 2, 50");
				try{
					sqlStatement = olympicDb.createStatement();
					query = "select * from TEAM";	
					result = sqlStatement.executeQuery(query);
					while(result.next()){
							
							System.out.println(result.getString(1) + "\t\t" + result.getString(2) + "\t\t" + result.getString(3) + "\t\t" + result.getString(4) + "\t\t" + result.getString(5) + "\t\t" + result.getString(6));
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				tester.createTeam("Athens", 2004, "1000M Canoe Sprint", "China", "Successors");
				System.out.println("\n\nAfter");
				try{
					sqlStatement = olympicDb.createStatement();
					query = "select * from TEAM";	
					result = sqlStatement.executeQuery(query);
					while(result.next()){
							
							System.out.println(result.getString(1) + "\t\t" + result.getString(2) + "\t\t" + result.getString(3) + "\t\t" + result.getString(4) + "\t\t" + result.getString(5) + "\t\t" + result.getString(6)  );
					}
				}catch(Exception e){
					e.printStackTrace();
				}


			//Testing Register Team
				System.out.println("\n\nTesting register team: will register the team created in createTeam to an event (1, 73)");
				try{
					sqlStatement = olympicDb.createStatement();
					query = "select * from EVENT_PARTICIPATION";	
					result = sqlStatement.executeQuery(query);
					while(result.next()){
							
							System.out.println(result.getString(1) + "\t\t" + result.getString(2) + "\t\t" + result.getString(3));
					}
				}catch(Exception e){
					e.printStackTrace();
				}

				tester.registerTeam(73, 1);
				System.out.println("\n\nAfter");
				try{
					sqlStatement = olympicDb.createStatement();
					query = "select * from EVENT_PARTICIPATION";	
					result = sqlStatement.executeQuery(query);
					while(result.next()){
							
							System.out.println(result.getString(1) + "\t\t" + result.getString(2) + "\t\t" + result.getString(3));
					}
				}catch(Exception e){
					e.printStackTrace();
				}


			//Testing add Participant
				System.out.println("\n\nNow testing add participant");
				System.out.println("Will be adding Joshua Martin born 11/16/1999 in Beijing, China");
				try{
					sqlStatement = olympicDb.createStatement();
					query = "select * from Participant";	
					result = sqlStatement.executeQuery(query);
					while(result.next()){
							
							System.out.println(result.getString(1) + "\t\t" + result.getString(2) + "\t\t" + result.getString(3) + "\t\t" + result.getString(4) + "\t\t" + result.getString(5) + "\t\t" + result.getString(6));
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				tester.addParticipant("Joshua", "Martin", "16-NOV-1999", "China", "Beijing");
				System.out.println("\n\nAfter");
				try{
					sqlStatement = olympicDb.createStatement();
					query = "select * from Participant";	
					result = sqlStatement.executeQuery(query);
					while(result.next()){
							
							System.out.println(result.getString(1) + "\t\t" + result.getString(2) + "\t\t" + result.getString(3) + "\t\t" + result.getString(4) + "\t\t" + result.getString(5) + "\t\t" + result.getString(6));
					}
				}catch(Exception e){
					e.printStackTrace();
				}

			//Testing Add Team Member
				System.out.println("\n\nNow testing add TEAM_MEMBER, adding tuple (73, 88) add the participant just created to the new team");
				try{
					sqlStatement = olympicDb.createStatement();
					query = "select * from TEAM_MEMBER";	
					result = sqlStatement.executeQuery(query);
					while(result.next()){
							
							System.out.println(result.getString(1) + "\t\t" + result.getString(2));
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				tester.addTeamMember(73, 88);
				System.out.println("\n\nAfter");
				try{
					sqlStatement = olympicDb.createStatement();
					query = "select * from TEAM_MEMBER";	
					result = sqlStatement.executeQuery(query);
					while(result.next()){
							
							System.out.println(result.getString(1) + "\t\t" + result.getString(2));
					}
				}catch(Exception e){
					e.printStackTrace();
				}

			//Testing drop Team Member
				System.out.println("\n\nNow testing drop team member : We will remove the participant just created");
				try{
					sqlStatement = olympicDb.createStatement();
					query = "select * from Participant";	
					result = sqlStatement.executeQuery(query);
					while(result.next()){
							
							System.out.println(result.getString(1) + "\t\t" + result.getString(2) + "\t\t" + result.getString(3) + "\t\t" + result.getString(4) + "\t\t" + result.getString(5) + "\t\t" + result.getString(6));
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				tester.dropTeamMember(88);
				System.out.println("\n\nAfter Deletion");
				try{
					sqlStatement = olympicDb.createStatement();
					query = "select * from Participant";	
					result = sqlStatement.executeQuery(query);
					while(result.next()){
							
							System.out.println(result.getString(1) + "\t\t" + result.getString(2) + "\t\t" + result.getString(3) + "\t\t" + result.getString(4) + "\t\t" + result.getString(5) + "\t\t" + result.getString(6));
					}
				}catch(Exception e){
					e.printStackTrace();
				}

			//Testing Methods used by everyone------------------------------------------------------------------------------------
			
			//Testing display sport	
				System.out.println("\n\nTesting display sport for Doubles Womens Badminton");

				tester.displaySport("Doubles Womens Badminton");

			//Testing displayEvent
				System.out.println("\n\nTesting display event for Athens, 2004, 4");

				tester.displayEvent("Athens", 2004, 4);

			//Test country ranking
				System.out.println("\n\nTesting country ranking with the Athens olympics");
				tester.countryRanking(4);

			//Test top K athletes
				System.out.println("\n\nNow testing top k athletes for 5 athletes in the Athens olympics");
				tester.topkAthletes(5, 4);
				

			//Test Connected Athletes
				System.out.println("\n\nNow Testing connected athletes with n = 1, participant Id = 1, Olympic Id = 3");
				tester.connectedAthletes(1, 3, 1);
			//Test Exit
				System.out.println("\n\nNow testing exit, the application should now quit");
				tester.exit();
				System.out.println("If this is printing something has gone wrong");
			}catch(Exception e){
				e.printStackTrace();
		}
	}
}