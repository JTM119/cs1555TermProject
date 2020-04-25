//Joshua Martin
//JTM119
//Olympics.java

import java.sql.*;
import java.util.*;


public class Olympic{
	
	private static Connection olympicDb;
	
	private  final String username = "jtm119";
    private  final String password = "4264878";
    private  final String url = "jdbc:oracle:thin:@class3.cs.pitt.edu:1521:dbclass";
    private static boolean loggedIN = false;
	
    private static String userNameLogin;

	private static int userRole; 

	public Olympic(){
		  		
		Connection connection;
		try{
			DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
            connection = DriverManager.getConnection(url, username, password);
            connection.setAutoCommit(true);
            connection.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
			connection = DriverManager.getConnection("jdbc:oracle:thin:@class3.cs.pitt.edu:1521:dbclass", username, password);
			olympicDb = connection;

		}catch(Exception e){
			System.out.println(
                    "Error connecting to database. Printing stack trace: ");
            e.printStackTrace();
            System.out.println("STACK PRINTED");
		}
	}
	
	//-------------------------------------------------------------------------------------------------------------------------------------------------------
	//Organizer the following can only be used by an organizer (These may need to use strings instead of ids)
	public static void createUser(String userName, String passkey, int role_ID){
		if (userRole != 1){
			System.out.println("You do not have access to this command");
			return;
		}
		try{
		Statement sqlStatement;
		sqlStatement = olympicDb.createStatement();
		String query = "insert into User_Account values (User_id_seq.nextval, '" + userName + "', '"+ passkey+ "', "+ role_ID+", systimestamp)";
		System.out.println(query);
		sqlStatement.executeQuery(query);
		}catch(Exception e){
			 // e.printStackTrace();
			System.out.println("Error encountered");
		}

	}

	public static void dropUser(String user){
		if (userRole != 1){
			System.out.println("You do not have access to this command");
			return;
		}
		try{
			Statement sqlStatement;
			sqlStatement = olympicDb.createStatement();
			sqlStatement.executeQuery("delete from User_Account where username = '" + user + "'");
		}catch(Exception e){
			System.out.println("Error encountered");
			 // e.printStackTrace();
		}
	}

	//Still need to test
	public static void createEvent(int sportId, int venueId, String date, char gender){
		if (userRole != 1){
			System.out.println("You do not have access to this command");
			return;
		}

		int sex;
		if(gender == 'm' || gender == 'M'){
			sex = 1;
		}else{
			sex = 0;
		}
		try{
		Statement sqlStatement;
		sqlStatement = olympicDb.createStatement();
		sqlStatement.executeQuery("insert into Event values (eventid_seq.nextval, " + sportId + ", "+ venueId+ ", "+ sex+", '"+ date +"')");
		}catch(Exception e){
			 e.printStackTrace();
			//System.out.println("Error encountered");
		}
	}

	public static void addEventOutcome(int olympicID, int teamId, int eventId, int participantId, int position){
	//Uses the assign medal trigger
		if (userRole != 1){
			System.out.println("You do not have access to this command");
			return;
		}
		try{
			Statement sqlStatement;
			sqlStatement = olympicDb.createStatement();
			sqlStatement.executeQuery("insert into scoreboard (olympic_id, event_id, team_id, participant_id, position) values(" + olympicID + ", " + eventId + ", " + teamId + ", " + participantId + "," + position+")");
		}catch(Exception e){
			 // System.out.println("Error encountered");
			 e.printStackTrace();
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------------------
	//Coach - The following can only be used by a coach
	public static void createTeam(String city, int year, String sport, String country, String teamName){
		//TeamID should be auto generated
		if (userRole != 2){
			System.out.println("You do not have access to this command");
			return;
		}

		try{
		Statement sqlStatement;
		sqlStatement = olympicDb.createStatement();
		int countryId;
		int sportId;
		int olympicId;
		int coachId;

		ResultSet result;

		String preQuery = "select country_Id from country where country = '" + country+ "'";
		result = sqlStatement.executeQuery(preQuery);
		result.next();
		countryId = (int)result.getLong(1);

		preQuery = "select sport_Id from sport where sport_name = '" + sport + "'";
		result = sqlStatement.executeQuery(preQuery);
		result.next();
		sportId = (int)result.getLong(1);


		preQuery = "select olympic_Id from olympics where host_city = '" + city + "'";
		result = sqlStatement.executeQuery(preQuery);
		result.next();
		olympicId = (int)result.getLong(1);

		preQuery = "select user_Id from user_Account where username = '" + userNameLogin + "'";
		result = sqlStatement.executeQuery(preQuery);
		result.next();
		coachId = (int)result.getLong(1);

		String query = "insert into team values (teamid_seq.nextval, " + olympicId + ", '"+ teamName+ "', "+ countryId+ ", "+ sportId+", "+ coachId+ ")";
		System.out.println(query);
		sqlStatement.executeQuery(query);
		}catch(Exception e){
			 System.out.println("Error encountered");
			 // e.printStackTrace();
		}

	}

	public static void registerTeam(int teamId, int eventId){
		//Register the team to a specific event
		//Update scores and such accordingly
		if (userRole != 2){
			System.out.println("You do not have access to this command");
			return;
		}
		try{
			Statement sqlStatement;
			sqlStatement = olympicDb.createStatement();
			String preQuery = "insert into event_participation values(" + eventId + ", " + teamId + ", 'e')";
			sqlStatement.executeQuery(preQuery);
		}catch(Exception e){
			 System.out.println("Error encountered");
			 // e.printStackTrace();
		}

	}

	//Still need to test
	public static void addParticipant(String fname, String lname, String dob, String nationality, String birthPlace){
		if (userRole != 2){
			System.out.println("You do not have access to this command");
			return;
		}
		
		try{
			Statement sqlStatement;
			sqlStatement = olympicDb.createStatement();
			String preQuery = "insert into participant values (participantid_seq.nextval,'" + fname + "', '" + lname + "', '" + nationality + "', '" + birthPlace +"', '"+dob+"')";
			sqlStatement.executeQuery(preQuery);
		}catch(Exception e){
			 //System.out.println("Error encountered");
			 e.printStackTrace();
		}
	}

	//Still need to test
	public static void addTeamMember(int teamId, int participantId){
		//Add participant to the team, only works for the coach of that team
		
		if (userRole != 2){
			System.out.println("You do not have access to this command");
			return;
		}

		try{
			Statement sqlStatement;
			sqlStatement = olympicDb.createStatement();
			String preQuery = "insert into team_member values (" + teamId + ", " + participantId + ")";
			sqlStatement.executeQuery(preQuery);
		}catch(Exception e){
			 // System.out.println("Error encountered");
			 e.printStackTrace();
		}

	}


	//Still needs to be done
	public static void dropTeamMember(int participantId){
		//Should trigger the dismiss athlete trigger
		if (userRole != 2){
			System.out.println("You do not have access to this command");
			return;
		}
		try{
		Statement sqlStatement;
		sqlStatement = olympicDb.createStatement();
		sqlStatement.executeQuery("delete from participant where participant_id = " + participantId);
		}catch(Exception e){
			e.printStackTrace();
			//System.out.println("Error encountered");
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------------------
	//These can be called by everyone
	//Logs the user into the system. If the log in is successful (if the user is in the system) it sets the user's role and returns true else it returns false
	public static boolean login(String user, String pass){
		Statement sqlStatement;

		try{
			sqlStatement = olympicDb.createStatement();
			ResultSet result;
			String query = "select role_id from USER_ACCOUNT where username = '" + user + "' and passkey = '" + pass + "'";
			
			result = sqlStatement.executeQuery(query);
			
			result.next();
			userRole = (int)result.getLong(1);

			sqlStatement = olympicDb.createStatement();
			
			query = "update user_account set last_login = systimestamp where username = '" + user + "'";
			result = sqlStatement.executeQuery(query);

			userNameLogin = user;

		}catch (Exception e){
			 System.out.println(
                    "Error connecting to database. Printing stack trace: ");
            //e.printStackTrace();
		}
		
		if (userRole == 0){
			System.out.println("Invalid Credentials, try again");
			return false;
		}else{
			System.out.println("Login successful");
			loggedIN = true;
			return true;
		}
	}

	public static void displaySport(String sport){
		//Display the sport info
		

		ResultSet result;
		try{
			Statement sqlStatement;
			sqlStatement = olympicDb.createStatement();
			String preQuery = "select dob from sport where sport_name  = '" + sport + "'";
			result = sqlStatement.executeQuery(preQuery);
			result.next();
			String dob = result.getString(1);

			System.out.println(sport + " was added in " + dob);


			String query = "select event_Id from event natural join sport where sport_name = '" + sport+ "'";
			
			System.out.println("The event Ids for this sport are:");
			result = sqlStatement.executeQuery(query);
			while(result.next()){
				System.out.println("Event Id: " + result.getString(1));
			}

			query = "select gender from event natural join sport where sport_name ='" + sport+ "'";
			result = sqlStatement.executeQuery(query);
			result.next();
			int gender = (int)result.getLong(1);
			if (gender == 1){
				System.out.println("Sport is : male");
			}else if (gender == 0){
				System.out.println("Sport is : female");
			}else{
				System.out.println("Sport is : coed");
			}

			System.out.println("The medalists for this sport were:");
			query = "select fname, lname, country, medal_title, opening_date"+
					" from (select medal_id, event_ID, olympic_id, participant_id, team_id from scoreboard) "+
					    " natural join (select event_id, sport_id from event) "+
					    " natural join (select sport_id, sport_name from sport )"+
					    " natural join (select fname, lname, participant_id from participant)"+
					    " natural join (select medal_id, medal_title from medal )"+
					    " natural join (select team_id, country_id, country from country natural join team )"+
					    " natural join (select olympic_id, opening_date from olympics)"+
					" where sport_name = '"+ sport + "'" +
					" order by medal_id asc, opening_date asc";

			
			result = sqlStatement.executeQuery(query);
			System.out.println("FNAME\t\tLNAME\t \tCOUNNTRY \t\tMEDAL\t\tDATE");
			while(result.next()){
				
				System.out.println(result.getString(1) + "\t\t" + result.getString(2) + "\t\t" + result.getString(3) + "\t\t" + result.getString(4) + "\t\t" + result.getString(5) + " ");
			}

		}catch(Exception e){
			 System.out.println("Error encountered");
			 // e.printStackTrace();
		}

	}

	public static void displayEvent(String city, int year, int eventID){
		try{
			Statement sqlStatement;
			sqlStatement = olympicDb.createStatement();
			String query = "select distinct host_city, fName, Lname, position, medal_title, sport_name" + 
							" from scoreboard natural join olympics natural join event natural join participant natural join medal natural join (team natural join sport)" + 
							" where host_city = '" + city+ "' and event_id = "+ eventID +
							"order by position asc";

			ResultSet result = sqlStatement.executeQuery(query);
			System.out.println("HOST CITY\t\tFNAME\t\tLNAME\t\tPOSITION\t\tMEDAL\t\tSPORT NAME");
			while(result.next()){
				
				System.out.println(result.getString(1) + "\t\t" + result.getString(2) + "\t\t" + result.getString(3) + "\t\t" + result.getString(4) + "\t\t" + result.getString(5) + "\t\t" + result.getString(6));
			}
		}catch(Exception e){
			 System.out.println("Error encountered");
			 // e.printStackTrace();
		}

	}

	//Fix it so that there's rank instead of just score
	public static void countryRanking(int olympicId){
		// Given an olympic id, display all the participating countries (country abbreviation),
		// the first year the country participated in the Olympics (first registered in the DB) 
		// along with the number of gold, silver and bronze medals and their ranking sorted in 
		// descending order. The rank is computed based on the points associated with each metal.
		try{
			Statement sqlStatement;
			sqlStatement = olympicDb.createStatement();
			String query = "select * from ("+
							    " select coalesce(country_code, cc2, cc3) as country_code, coalesce(gold, 0) as gold, coalesce(silver, 0) as silver, coalesce(bronze,0) as bronze, (3*coalesce(gold, 0)+ 2* coalesce(silver, 0) +coalesce(bronze,0)) as score"+
							    " from(("+
							      "   (select country_id, country_code, count(medal_id) as gold"+
							      "   from country natural join scoreboard natural join team natural join participant"+
							      "   where medal_id = 1 and olympic_id = "+olympicId +
							      "   group by country_id, country_code) "+
							      "   full outer join"+
							      "   (select country_id as c2Id, country_code as cc2, count(medal_id) as silver"+
							      "       from country natural join scoreboard natural join team natural join participant"+
							      "       where medal_id = 2 and olympic_id = "+olympicId+
							      "       group by country_id, country_code)  on c2Id = country_id"+
							      "   full outer join     "+
							       "     (select country_id as c3_id, country_code as cc3, count(medal_id) as bronze"+
							        "    from country natural join scoreboard natural join team natural join participant"+
							       "     where medal_id = 3 and olympic_id = "+olympicId+
							      "     group by country_id, country_code) on c3_Id = country_id"+
							      "  ))"+
							   " ) natural join"+
							   " (   select country_code, min(event_time) as appeared"+
							   "     from scoreboard natural join team natural join event natural join country"+
							   "     where olympic_id = "+olympicId+
							   "     group by country_code)"+
							   " where country_code is not null"+
							   " order by score desc";
    


			ResultSet result = sqlStatement.executeQuery(query);
			System.out.println("COUNTRY CODE\t\tGOLD\t\tSILVER\t\tBRONZE\t\tSCORE\t\tAPPEARED");
			while(result.next()){
				
				System.out.println(result.getString(1) + "\t\t" + result.getString(2) + "\t\t" + result.getString(3) + "\t\t" + result.getString(4) + "\t\t" + result.getString(5) + "\t\t" + result.getString(6));
			}
		}catch(Exception e){
			 System.out.println("Error encountered");
			 // e.printStackTrace();
		}


	}

	public static void topkAthletes(int k, int olympicId){
		try{
			Statement sqlStatement;
			sqlStatement = olympicDb.createStatement();
			String query = "select fName, lName, gold, silver, bronze, rownum as rank from"+
							"	(select coalesce(participant_id, pid2, pid3) as participant_id, coalesce(fname, fn1, fn2) as fName, coalesce(lname, ln1, ln2) as lName, coalesce(gold, 0) as gold, coalesce(silver,0) as silver, coalesce(bronze,0) as bronze, (3* coalesce(gold, 0) + 2*coalesce(silver,0) + 1 * coalesce(bronze,0)) as score from("+
       						"	 (select participant_id, fname, lname, count(medal_id) as gold"+
						  "      from  scoreboard natural join participant "+
						  "      where medal_id = 1 and olympic_id = "+ olympicId +
						  "      group by participant_id, fname, lname) "+
						  "      full outer join"+
						 "       (select participant_id as pid2, fname as fn1, lname as ln1, count(medal_id) as silver"+
						  "          from scoreboard natural join participant "+
						 "           where medal_id = 2 and olympic_id = "+ olympicId +
						 "           group by participant_id, fname, lname)  on pid2 = participant_id"+
						 "       full outer join     "+
						 "           (select participant_id as pid3, fname as fn2, lname as ln2, count(medal_id) as bronze"+
						 "           from scoreboard natural join participant "+
						 "           where medal_id = 3 and olympic_id = "+ olympicId +
						 "           group by participant_id, fname, lname) on pid3 = participant_id"+
						 "       )"+
						"order by score desc)"+
						"where rownum <= " + k;

			ResultSet result = sqlStatement.executeQuery(query);
			System.out.println("FNAME\t\tLNAME\t\tGOLD\t\tSILVER\t\tBRONZE\t\tRANK");
			while(result.next()){
				
				System.out.println(result.getString(1) + "\t\t" + result.getString(2) + "\t\t" + result.getString(3) + "\t\t" + result.getString(4) + "\t\t" + result.getString(5) + "\t\t" + result.getString(6));
			}
		}catch(Exception e){
			 System.out.println("Error encountered");
			 // e.printStackTrace();
		}

	}
	//WTF am I supposed to do? What would this even be used for? This one is really stupid
	public static void connectedAthletes(int participantId, int olympicId, int n){
		//This gets it for 1 level of connectivity. I'm not sure how to do level 2
		ResultSet result;	
		try{
			Statement sqlStatement;
			sqlStatement = olympicDb.createStatement();
			String preQuery = "create or replace view connections as"+
							" select distinct fname, lname, participant_id"+
							" from EVENT_PARTICIPATION  natural join team natural join team_member natural join participant "+
							" where event_id in (select event_id "+
		                    " from EVENT_PARTICIPATION natural join team natural join team_member natural join participant"+
		                    " where participant_id = "+ participantId+") and olympic_id = " + olympicId;
		                    
							
			sqlStatement.executeQuery(preQuery);
			preQuery = "select * from connections";
			result = sqlStatement.executeQuery(preQuery);
		
		}catch(Exception e){
			 e.printStackTrace();
		}

		
	}

	public static void logout(){
		userRole = 0;
		userNameLogin ="";
		loggedIN = false;
	}

	public static void exit(){
		try{
			olympicDb.close();
			System.exit(0);
		}catch(Exception e){
			System.out.println("An error occurred");
		}
	}

	public static void main(String[] args){
		// String username = args[0];
		// String password = args[1];
		Olympic user = new Olympic();
		Scanner keyboard = new Scanner(System.in);
		boolean notLoggedIn = false;
		
		while(true){
			int olympicsID;
			int eventID;
			int teamID;
			String city;
			String sport;
			int year;
			int participantID;
			while(!loggedIN){
				try{
					System.out.println("Press the number for the operation you wish to perform?\n[1] Login\n[2] Display sport information\n[3] Display event information"+
										"\n[4] Display country rankings\n[5] Display top k athletes\n[6] View connected athletes\n[7] Exit");
					int option = keyboard.nextInt();
					keyboard.nextLine();
					switch (option){
						case 1:
							
								System.out.println("Please enter username: ");
							 	String username = keyboard.nextLine();
							 	System.out.println("Please enter password: ");
							 	String password = keyboard.nextLine();
							 	notLoggedIn = login(username, password);
							 
						 	break;
						 case 2:
						 	System.out.println("Please enter sport: ");
						 	sport = keyboard.nextLine();
						 	displaySport(sport);
						 	break;
						 case 3:
						 	
						 	System.out.println("Please enter the city the olympics took place in: ");
						 	city = keyboard.nextLine();
						 	System.out.println("Please enter the year of the olympics: ");
						 	year = keyboard.nextInt();
						 	keyboard.nextLine();
						 	System.out.println("Please enter eventID: ");
						 	eventID = keyboard.nextInt();
						 	displayEvent(city, year, eventID);

						 	break;
						 case 4: 
						 	
						 	System.out.println("Please enter the olympics ID: ");
						 	olympicsID = keyboard.nextInt();
						 	keyboard.nextLine();
						 	countryRanking(olympicsID);
						 	
						 	break;
						 case 5:
						 	
						 	System.out.println("Please enter the olympics ID: ");
						 	olympicsID = keyboard.nextInt();
						 	keyboard.nextLine();
						 	System.out.println("Please enter the number of athletes you wish to see: ");
						 	int k = keyboard.nextInt();
						 	keyboard.nextLine();
						 	topkAthletes(k, olympicsID);
						 	
						 	break;
						 case 6:
						 	
						 	System.out.println("Enter an athletes ID: ");
						 	int participantId = keyboard.nextInt();
						 	keyboard.nextLine();
						 	System.out.println("Enter a level of connectedness: ");
						 	int n = keyboard.nextInt();
						 	keyboard.nextLine();
						 	System.out.println("Please enter the olympics ID: ");
						 	olympicsID = keyboard.nextInt();
						 	keyboard.nextLine();
						 	connectedAthletes(participantId, olympicsID, n);
						 	
						 	break;
						 case 7:
						 	System.out.println("Exiting");
						 	exit();
							break;
						 default:
						 	System.out.println("Invalid option");
						 }


					}catch(Exception e){
						System.out.println("Invalid input type");
						continue;
					}
				}
			

			
			//The user is now logged in 
			while(loggedIN){
				if(userRole == 1){
					System.out.println("Press the number for the operation you wish to perform?\n[1] Logout\n[2] Display sport information\n[3] Display event information"+
										"\n[4] Display country rankings\n[5] Display top k athletes\n[6] View connected athletes\n[7] Exit\n[8] Create a user\n[9]Remove a user"+
										"\n[10] Create an event\n[11] Add an event outcome");
					int option = keyboard.nextInt();
					keyboard.nextLine();
					switch (option){
						case 1:
							logout();
						 	break;
						 case 2:
						 	System.out.println("Please enter sport: ");
						 	sport = keyboard.nextLine();
						 	displaySport(sport);
						 	break;
						 case 3:
						 	try{
						 	System.out.println("Please enter the city the olympics took place in: ");
						 	city = keyboard.nextLine();
						 	System.out.println("Please enter the year of the olympics: ");
						 	year = keyboard.nextInt();
						 	keyboard.nextLine();
						 	System.out.println("Please enter eventID: ");
						 	eventID = keyboard.nextInt();
						 	displayEvent(city, year, eventID);
						 	 }catch(Exception e){
						 	System.out.println("Invalid input type");
						 	}
						 	break;
						 case 4: 
							try{
						 	System.out.println("Please enter the olympics ID: ");
						 	olympicsID = keyboard.nextInt();
						 	keyboard.nextLine();
						 	countryRanking(olympicsID);
						 	 }catch(Exception e){
						 	System.out.println("Invalid input type");
						 	}
						 	break;
						 case 5:
						 	try{
						 	System.out.println("Please enter the olympics ID: ");
						 	olympicsID = keyboard.nextInt();
						 	keyboard.nextLine();
						 	System.out.println("Please enter the number of athletes you wish to see: ");
						 	int k = keyboard.nextInt();
						 	keyboard.nextLine();
						 	topkAthletes(k, olympicsID);
						 	 }catch(Exception e){
						 	System.out.println("Invalid input type");
						 }
						 	break;
						 case 6:
						 	try{
						 	System.out.println("Enter an athletes ID: ");
						 	int participantId = keyboard.nextInt();
						 	keyboard.nextLine();
						 	System.out.println("Enter a level of connectedness: ");
						 	int n = keyboard.nextInt();
						 	keyboard.nextLine();
						 	System.out.println("Please enter the olympics ID: ");
						 	olympicsID = keyboard.nextInt();
						 	keyboard.nextLine();
						 	connectedAthletes(participantId, olympicsID, n);
						 	 }catch(Exception e){
						 	System.out.println("Invalid input type");
						 	}
						 	break;
						 case 7:
						 	System.out.println("Exiting");
						 	exit();
							break;
						case 8:
							try{
							System.out.println("Please enter the username: ");
						 	String usname = keyboard.nextLine();
						 	System.out.println("Please enter the password: ");
						 	String passkey = keyboard.nextLine();
						 	System.out.println("Please enter RoleID: ");
						 	eventID = keyboard.nextInt();
						 	keyboard.nextLine();
						 	createUser(usname, passkey, eventID);
						 	 }catch(Exception e){
						 	System.out.println("Invalid input type");
						 	}
						 	break;
						 case 9:
						 	try{
						 	System.out.println("Please enter the username: ");
						 	String toDrop= keyboard.nextLine();
						 	dropUser(toDrop);
						 	 }catch(Exception e){
						 	System.out.println("Invalid input type");
						 }
						 	break;
						 case 10:
						 	try{
						 	System.out.println("Please enter the sport ID: ");
						 	int sportID = keyboard.nextInt();
						 	keyboard.nextLine();

						 	System.out.println("Please enter the venue ID: ");
						 	int venueID = keyboard.nextInt();
						 	keyboard.nextLine();

						 	System.out.println("Please enter the event date: ");
						 	String eventDate = keyboard.nextLine();
						 	
						 	System.out.println("Please enter the gender of the event: ");
						 	char gender = keyboard.next().charAt(0);

						 	createEvent(sportID, venueID, eventDate, gender);
						 	 }catch(Exception e){
						 	System.out.println("Invalid input type");
						 }
						 	break;
						 case 11:
						 	try{
						 	System.out.println("Please enter an olympicsID: " );
						 	olympicsID = keyboard.nextInt();
						 	keyboard.nextLine();

						 	System.out.println("Please enter a team ID: " );
						 	teamID = keyboard.nextInt();
						 	keyboard.nextLine();

						 	System.out.println("Please enter an event ID: " );
						 	eventID = keyboard.nextInt();
						 	keyboard.nextLine();

						 	System.out.println("Please enter a participant ID: " );
						 	participantID = keyboard.nextInt();
						 	keyboard.nextLine();

						 	System.out.println("Please enter a position: " );
						 	int position = keyboard.nextInt();
						 	keyboard.nextLine();

						 	addEventOutcome(olympicsID, teamID, eventID, participantID, position);
						 	 }catch(Exception e){
						 	System.out.println("Invalid input type");
						 	}
						 	break;
						 default:
						 	System.out.println("Invalid option");
						 }
				}else if (userRole == 2){
						System.out.println("Press the number for the operation you wish to perform?\n[1] Logout\n[2] Display sport information\n[3] Display event information"+
										"\n[4] Display country rankings\n[5] Display top k athletes\n[6] View connected athletes\n[7] Exit\n[8] Create team \n[9] Register Team"+
										"\n[10] Add participant\n[11] Add team member \n[12] Dismiss Athlete");
					int option = keyboard.nextInt();
					keyboard.nextLine();
					switch (option){	
						case 1:
							logout();
						 	break;
						 case 2:
						 	System.out.println("Please enter sport: ");
						 	sport = keyboard.nextLine();
						 	displaySport(sport);
						 	break;
						 case 3:
						 	try{
						 	System.out.println("Please enter the city the olympics took place in: ");
						 	city = keyboard.nextLine();
						 	System.out.println("Please enter the year of the olympics: ");
						 	year = keyboard.nextInt();
						 	keyboard.nextLine();
						 	System.out.println("Please enter eventID: ");
						 	eventID = keyboard.nextInt();
						 	displayEvent(city, year, eventID);
						 	 }catch(Exception e){
						 	System.out.println("Invalid input type");
						 	}
						 	break;
						 case 4: 
							 try{
						 	System.out.println("Please enter the olympics ID: ");
						 	olympicsID = keyboard.nextInt();
						 	keyboard.nextLine();
						 	countryRanking(olympicsID);
						 	 }catch(Exception e){
						 	System.out.println("Invalid input type");
						 }
						 	break;
						 case 5:
						 	try{
						 	System.out.println("Please enter the olympics ID: ");
						 	olympicsID = keyboard.nextInt();
						 	keyboard.nextLine();
						 	System.out.println("Please enter the number of athletes you wish to see: ");
						 	int k = keyboard.nextInt();
						 	keyboard.nextLine();
						 	topkAthletes(k, olympicsID);
						 	 }catch(Exception e){
						 	System.out.println("Invalid input type");
						 }
						 	break;
						 case 6:
						 	try{
						 	System.out.println("Enter an athletes ID: ");
						 	int participantId = keyboard.nextInt();
						 	keyboard.nextLine();
						 	System.out.println("Enter a level of connectedness: ");
						 	int n = keyboard.nextInt();
						 	keyboard.nextLine();
						 	System.out.println("Please enter the olympics ID: ");
						 	olympicsID = keyboard.nextInt();
						 	keyboard.nextLine();
						 	connectedAthletes(participantId, olympicsID, n);
						 	 }catch(Exception e){
						 	System.out.println("Invalid input type");
						 }
						 	break;
						 case 7:
						 	System.out.println("Exiting");
						 	exit();
							break;
						case 8:
							try{
							System.out.println("Please enter the city the olympics took place in: ");
						 	city = keyboard.nextLine();
						 	
						 	System.out.println("Please enter the year the olympics took place in: ");
						 	year = keyboard.nextInt();
						 	keyboard.nextLine();
						 	
						 	System.out.println("Please enter the sport your team plays: ");
						 	sport = keyboard.nextLine();

						 	System.out.println("Please enter the country you represent: ");
						 	String country = keyboard.nextLine();

						 	System.out.println("Please enter your team name: ");
						 	String teamName = keyboard.nextLine();
						 	 }catch(Exception e){
						 	System.out.println("Invalid input type");
						 }
						 	break;
						 case 9:
						 	try{
						 	System.out.println("Please enter you team ID: ");
						 	teamID= keyboard.nextInt();
						 	keyboard.nextLine();

						 	System.out.println("Please enter the event ID: ");
						 	eventID = keyboard.nextInt();
						 	keyboard.nextLine();

						 	registerTeam(teamID, eventID);
						 	 }catch(Exception e){
						 	System.out.println("Invalid input type");
						 	}
						 	break;
						 case 10:
						 	try{
						 	System.out.println("Please enter the first name: ");
						 	String fname = keyboard.nextLine();
						 	System.out.println("Please enter the last name: ");
						 	String lname = keyboard.nextLine();
						 	System.out.println("Please enter the date of birth: ");
						 	String dob = keyboard.nextLine();
						 	System.out.println("Please enter the nationality: ");
						 	String nationality = keyboard.nextLine();
						 	System.out.println("Please enter the birth place: ");
						 	String birthplace = keyboard.nextLine();

						 	addParticipant(fname, lname, dob, nationality, birthplace);
						 	 }catch(Exception e){
						 	System.out.println("Invalid input type");
						 	}
						 	break;
						 case 11:
						 	try{
						 	System.out.println("Please enter your team ID: ");
						 	teamID= keyboard.nextInt();
						 	keyboard.nextLine();

						 	System.out.println("Please enter the participant ID: ");
						 	participantID = keyboard.nextInt();
						 	keyboard.nextLine();

						 	addTeamMember(teamID, participantID);
						 	 }catch(Exception e){
						 	System.out.println("Invalid input type");
						 	}
						 	break;
						 case 12:
						 	try{
						 	System.out.println("Please enter the participant ID: ");
						 	participantID = keyboard.nextInt();
						 	keyboard.nextLine();

						 	dropTeamMember(participantID);
						 	 }catch(Exception e){
						 	System.out.println("Invalid input type");
						 	}
						 	break;
						 default:
						 	System.out.println("Invalid option");
					}
				}else{
					System.out.println("Press the number for the operation you wish to perform?\n[1] Logout\n[2] Display sport information\n[3] Display event information"+
											"\n[4] Display country rankings\n[5] Display top k athletes\n[6]View connected athletes\n[7]Exit");
					int option = keyboard.nextInt();
					keyboard.nextLine();
					switch (option){
						case 1:
							logout();
						 	break;
						 case 2:
						 	System.out.println("Please enter sport: ");
						 	sport = keyboard.nextLine();
						 	displaySport(sport);
						 	break;
						 case 3:
						 	System.out.println("Please enter the city the olympics took place in: ");
						 	city = keyboard.nextLine();
						 	System.out.println("Please enter the year of the olympics: ");
						 	year = keyboard.nextInt();
						 	keyboard.nextLine();
						 	System.out.println("Please enter eventID: ");
						 	eventID = keyboard.nextInt();
						 	displayEvent(city, year, eventID);
						 	break;
						 case 4: 
						 	System.out.println("Please enter the olympics ID: ");
						 	olympicsID = keyboard.nextInt();
						 	keyboard.nextLine();
						 	countryRanking(olympicsID);
						 	break;
						 case 5:
						 	System.out.println("Please enter the olympics ID: ");
						 	olympicsID = keyboard.nextInt();
						 	keyboard.nextLine();
						 	System.out.println("Please enter the number of athletes you wish to see: ");
						 	int k = keyboard.nextInt();
						 	keyboard.nextLine();
						 	topkAthletes(k, olympicsID);
						 	break;
						 case 6:
						 	System.out.println("Enter an athletes ID: ");
						 	int participantId = keyboard.nextInt();
						 	keyboard.nextLine();
						 	System.out.println("Enter a level of connectedness: ");
						 	int n = keyboard.nextInt();
						 	keyboard.nextLine();
						 	System.out.println("Please enter the olympics ID: ");
						 	olympicsID = keyboard.nextInt();
						 	keyboard.nextLine();
						 	connectedAthletes(participantId, olympicsID, n);
						 	break;
						 case 7:
						 	System.out.println("Exiting");
						 	exit();
							break;
						 default:
						 	System.out.println("Invalid option");	 
					}
				}
			}
		}
	}
}









