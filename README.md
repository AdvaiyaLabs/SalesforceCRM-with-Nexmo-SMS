#Salesforce CRM with Nexmo SMS 
<img src= "https://raw.githubusercontent.com/AdvaiyaLabs/SalesforceCRM-with-Nexmo-SMS/master/Docs/image1.png" width=200>

##Introduction

With **Salesforce CRM with Nexmo SMS** app, organizations can facilitate sales manager to receive SMS notifications whenever a new opportunity is created/updated or a lead is converted into an opportunity, with budget amount above a particular threshold.

##Use Case 

1.  When a sales executive adds a new opportunity or qualifies a lead into an opportunity, and adds the expected budget amount to that opportunity, the app will send an SMS to the respective sales manager if the opportunity budget value is above the threshold amount.

    SMS that will be sent to the sales manager: **A new opportunity &lt;&lt;Title&gt;&gt; for &lt;&lt;Account&gt;&gt; with probable value &lt;Budget value&gt; has been added.**

2.  When a sales executive updates the budget amount of any opportunity, the app will send an SMS to the respective sales manager if the opportunity budget value is above a threshold amount.

    SMS that will be sent to the sales manager: **An opportunity &lt;&lt;Title&gt;&gt; for &lt;&lt;Account name&gt;&gt; has been updated with probable value &lt; Budget value&gt;.**

##Prerequisites 

-   A Salesforce account.

-   Nexmo subscription and corresponding Nexmo API keys (Keys and Secret). To access the API keys, see appendix section.

-   Salesforce Organisation users must have a “Manager” assigned.

-   Every organisation manager’s mobile number (international format) must be configured in the CRM.

-   User must have all necessary permissions to access visual force pages and tabs.

##Features

-   Enables sending SMS when:

    -   a new opportunity is created with an amount above the threshold value

    -   an opportunity is updated with an amount above the threshold value

    -   a lead is converted to an opportunity with an amount above the threshold value

-   Allows salesforce CRM admin to define threshold value for opportunities budget to decide when the SMS notification should be sent.

-   Allows salesforce CRM admin to enable or disable the SMS notifications functionality.

##Steps to deploy Salesforce with Nexmo SMS app

1.  Visit the target Git repository using the [URL](https://github.com/AdvaiyaLabs/SalesforceCRM-with-Nexmo-SMS.git). Click on **Raw**, the app's ZIP file will be downloaded.

	<img src= "https://raw.githubusercontent.com/AdvaiyaLabs/SalesforceCRM-with-Nexmo-SMS/master/Docs/image3.png" width=400>

2.  Extract ZIP file and use the source code as explained below.

##Steps to install Salesforce CRM with Nexmo SMS app

The source code extracted from zip file can be deployed to any Salesforce organization using Force.com IDE, which is an add-on with Eclipse for creating and deploying Salesforce (Force.com) applications.

You will need the following to configure Force.com IDE with Eclipse:

-   Salesforce Enterprise Edition or above Or

-   Salesforce Developer Edition (Sign up for Free at <https://developer.salesforce.com/> )

Please follow the below steps to install Salesforce CRM with Nexmo SMS using Force.com IDE:

1.  Install Force.com IDE add-on with Eclipse. (Ref: <https://developer.salesforce.com/page/Force.com_IDE_Installation>)

2.  Create a new Force.com project with Eclipse

	<img src= "https://raw.githubusercontent.com/AdvaiyaLabs/SalesforceCRM-with-Nexmo-SMS/master/Docs/image4.png" width=400>
 
	<img src= "https://raw.githubusercontent.com/AdvaiyaLabs/SalesforceCRM-with-Nexmo-SMS/master/Docs/image5.png" width=400>

3.  Enter the project name, salesforce organization details and select the environment.

	<img src= "https://raw.githubusercontent.com/AdvaiyaLabs/SalesforceCRM-with-Nexmo-SMS/master/Docs/image6.png" width=400>

4.  In case you don’t have the Security Token, you can reset the **Security Token** from **My Settings -&gt; Personal -&gt; Reset My Security Token** in Salesforce platform.

    <img src= "https://raw.githubusercontent.com/AdvaiyaLabs/SalesforceCRM-with-Nexmo-SMS/master/Docs/image7.png" width=400>

	<img src= "https://raw.githubusercontent.com/AdvaiyaLabs/SalesforceCRM-with-Nexmo-SMS/master/Docs/image8.png" width=400>

5.  Switch to eclipse, select **none** from **Initial Project Content** screen and click on **Finish.**

	<img src= "https://raw.githubusercontent.com/AdvaiyaLabs/SalesforceCRM-with-Nexmo-SMS/master/Docs/image9.png" width=400>

6.  Copy the source code downloaded from github (as explained previously) to **src** folder of Eclipse project workspace. To find the workspace location, right click on project and check **Resources** from **Properties** window.

	<img src= "https://raw.githubusercontent.com/AdvaiyaLabs/SalesforceCRM-with-Nexmo-SMS/master/Docs/image10.png" width=400>

7.  Right-click on Project and select **Deploy to Server…**

	<img src= "https://raw.githubusercontent.com/AdvaiyaLabs/SalesforceCRM-with-Nexmo-SMS/master/Docs/image11.png" width=400>

8.  Enter the Salesforce organization details and select the environment.

	<img src= "https://raw.githubusercontent.com/AdvaiyaLabs/SalesforceCRM-with-Nexmo-SMS/master/Docs/image12.png" width=400>

9.  Click **Next** and follow other steps.

10.  Select **Archive** **Options.**

	<img src= "https://raw.githubusercontent.com/AdvaiyaLabs/SalesforceCRM-with-Nexmo-SMS/master/Docs/image13.png" width=400>

11.  Click **Next** and **Validate Deployment.**

	<img src= "https://raw.githubusercontent.com/AdvaiyaLabs/SalesforceCRM-with-Nexmo-SMS/master/Docs/image14.png" width=400>
	
	<img src= "https://raw.githubusercontent.com/AdvaiyaLabs/SalesforceCRM-with-Nexmo-SMS/master/Docs/image15.png" width=400>

12.  Close the **Success** window. Click **Next** to deploy.

	<img src= "https://raw.githubusercontent.com/AdvaiyaLabs/SalesforceCRM-with-Nexmo-SMS/master/Docs/image16.png" width=400>

13.  Click **Finish.**

14.  Now in Salesforce CRM, the Salesforce CRM with Nexmo SMS app will be added under **Setup -&gt; Create -&gt; Packages** list in the Salesforce CRM.

	<img src= "https://raw.githubusercontent.com/AdvaiyaLabs/SalesforceCRM-with-Nexmo-SMS/master/Docs/image17.png" width=400>

15.  Go to **Nexmo Settings** tab in the Salesforce CRM :

    1.  All tabs -&gt; Nexmo Settings

	<img src= "https://raw.githubusercontent.com/AdvaiyaLabs/SalesforceCRM-with-Nexmo-SMS/master/Docs/image18.png" width=400>

	<img src= "https://raw.githubusercontent.com/AdvaiyaLabs/SalesforceCRM-with-Nexmo-SMS/master/Docs/image19.png" width=400>

	2. 	Enter **Configuration Settings** details and check **Enable SMS** checkbox to enable SMS functionality. 
	
	<img src= "https://raw.githubusercontent.com/AdvaiyaLabs/SalesforceCRM-with-Nexmo-SMS/master/Docs/image20.png" width=400>

	3.  Click on **Save** button.

##Steps to use the Salesforce CRM with Nexmo SMS app

1.  Add a new opportunity

    1.  Navigate to New Opportunity screen via **Opportunities -&gt; New**<img src= "https://raw.githubusercontent.com/AdvaiyaLabs/SalesforceCRM-with-Nexmo-SMS/master/Docs/image21.png" width=400>

    2.  Enter opportunity details and click on **Save.**

    3.  Make sure that the logged in user has a **Manager** with an active mobile number assigned since the SMS will be sent to manager.

    4.  If the amount defined for the new opportunity is greater than the threshold defined, the reporting manager will get an SMS like:

        **A new opportunity &lt;&lt; *Opportunity name* &gt;&gt; for &lt;&lt;*Account*&gt;&gt; with probable value &lt;&lt;*Budget value*&gt;&gt; has been added**.

2.  Update an opportunity

    1.  Navigate to the **New Opportunity** screen via **Opportunities -&gt; Edit**<img src= "https://raw.githubusercontent.com/AdvaiyaLabs/SalesforceCRM-with-Nexmo-SMS/master/Docs/image22.png" width=400>

    2.  Update all the required fields and click on **Save**.

    3.  If the amount defined for the updated opportunity is greater than the threshold defined, the reporting manager will get an SMS like:

        **An opportunity &lt;&lt; *Opportunity name* &gt;&gt; for &lt;&lt;*Account*&gt;&gt; has been updated with probable value &lt;&lt;*Budget value*&gt;&gt;**.

3.  Convert lead to an opportunity (Assume that lead is already there in CRM)

    1.  Select the lead you want to convert: **Leads -&gt; Convert**

        <img src= "https://raw.githubusercontent.com/AdvaiyaLabs/SalesforceCRM-with-Nexmo-SMS/master/Docs/image23.png" width=400>

    2.  Update the new converted opportunity as shown in Step 2.

    3.  If the amount defined for the updated opportunity is greater than the threshold defined, the reporting manager will get an SMS like:

        **An opportunity &lt;&lt; Opportunity name &gt;&gt; for &lt;&lt;Account&gt;&gt; has been updated with probable value &lt;&lt;Budget value&gt;&gt;.**<span id="_Toc433989966" class="anchor"></span>

##Appendix

Nexmo API Keys
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-   To access the Nexmo keys, go to <https://www.nexmo.com/> and sign-in.

-   On the top right corner, click on the **Api Settings**.

-   Key and Secret will display in the top bar as shown in the below image:

	<img src= "https://raw.githubusercontent.com/AdvaiyaLabs/SalesforceCRM-with-Nexmo-SMS/master/Docs/image24.png" width=400>
