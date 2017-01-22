# Download pictures from Instagram account

This extension enables you to download picture ids and urls from a specified Instagram user using Instagram API Platform

<p align="center">
  <img src="default.png"/ width=320px>
</p>

# Before you start

1. Register as an Instagram developer.

	https://www.instagram.com/developer/register/
	
2. Follow the authentication instruction and get your 'access_token'.

	https://www.instagram.com/developer/authentication/

3. Invite Sandbox users.
	1. Go to 'Manage Clients'
	2. Find your app and click on 'MANAGE'
	3. Choose 'Sandbox' tab
	4. Type in the usernames you wish to invite
	
	more information about sandbox users:
	https://www.instagram.com/developer/sandbox/

4. SPSS Modeler and R requirements:
	- [SPSS Modeler v18.0][4]
	- [SPSS Modeler 'R essentials' plugin][3]
	- R packages: 
		- RJSONIO
		- RCurl
		
5. Install WatsonCreateClassifier extension from [SPSS Modeler Extension Hub][5].


# Example usage

Because the node is not a true source node a dummy 'user input' node has to be connected as input to InstagramPictures node. It's values are not used by the extension.

<p align="center">
  <img src="Screenshot/stream.PNG"/ width=600px>
</p>
	
In the node window you must provide the 'access_token' that you've received earlier.
Optionally the username and number of photos you wish to aquire can be specified. Default parameters will download 5 most recent photos from the 'access_token' owner's account.
	
<p align="center">
  <img src="Screenshot/input2.PNG"/ width=600px>
</p>
	
	
# Output

The generated output is a table that contains the pictures unique ids and their urls.
	
<p align="center">
  <img src="Screenshot/output.PNG"/ width=600px>
</p>

Check out sample stream in Example directory if you run into any problems!

Try our similar extension for Facebook - [FacebookPhotoImport][6]!

# License
- [Apache 2.0][1]

# Contributors
 - Artur Kucia
 
 [1]: http://www.apache.org/licenses/LICENSE-2.0.html
  [3]: http://www.ibm.com/support/knowledgecenter/SS3RA7_18.0.0/modeler_r_plugin_install_project_ddita/clementine/programmability_option/r_essentials_install.html
 [4]: http://www-03.ibm.com/software/products/en/spss-modeler
 [5]: https://ibmpredictiveanalytics.github.io/
 [6]: https://github.com/SpssModelerExtensions/FacebookPhotoImport
	
	
