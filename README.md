COSMOS (Web Challenge 300)

Flag to acquire: MCA-DCE4D899

Hints:
	1. HTML of front page contains commented jsp code that gives the url pattern for user database calls
	2. The user database expects a POST with a custom header "userInfo"
	3. The "default" user has been removed, so the only user left is the name of the admin.
	4. User info returned has a url pattern to access the user's information
	5. The user project url pattern needs a GET performed with a project id as part of the parameters
	6. After finding the second username, cookie information will need to be supplied to bring up the user's project page.

Step by Step
	1. On the front page of the website, the name of the admin is given in the "about" tab, or seen in the HTML code, as "admin".
	2. Open a command prompt, and using curl, give the command:
		  curl -H "userInfo: admin" -v http://webserver/COSMOS/UserDatabase
	   Where "webserver" is the URL of the server where the war file is hosted.
	3. The output should be an xml file with a UserURLPattern and a ProjectID elements.
	4. Using the values of these elements, and with either curl or a web browser, do a GET with URL:
		  http://webserver/COSMOS/H98B4592A?ProjectID=000001
	5. The information in the table will show that there is another user: "billions.and.billions"
	6. Using curl again, give the command:
		  curl -H "userInfo: billions.and.billions" -v http://webserver/COSMOS/UserDatabase
	7. The output should be an xml file with a UserURLPattern and a ProjectID elements for the other user along with non-null cookie name/value.
	8. Using the values of these elements use curl to do a GET with URL:
	      http://webserver/COSMOS/G56KJ503F?ProjectID=926340
	   Pass the cookie: "LastProject=PaleBlueDot"
	   Command is:
	      curl "http://webserver/COSMOS/G56KJ503B?ProjectID=926340" -b "LastProject=PaleBlueDot"
	9. The table returned will contain the flag value.

Requirements:
	COSMOS.war deployed in web server (tested in Tomcat 7)
	Built with Java 6