## Project's goal ##
The main goal of this project is to display some interesting information in form of an interactive dashboard.
A list of countries is already loaded as buttons on the index page. By click on each country name, related data should be shown in form of bar chart and summary Table to the end-users.
For a bar chart, you can use D3.js library and for the Table view, you can use the Tabulator library which both are already included in the index page's header. 
The sorting feature for the table has to be activated.
You can also use any other sorts of d3.js charts regarding your idea for visualizing the data.
In the back-end, you need to add or modify required classes to get the data from the database and transform to the front-end with RESTful API in JSON format. 
Since this is a test project to examine your skills in the back-end and front-end, please feel free to modify or remove/clean any elements on the page or even add new creative features.

## Structure ##
Project is a basic Maven web project. For more compatibility, we advise opening in Eclipse(Dynamic Web Project) environment. Project can compile as a war file which is runnable under Apache Tomcat v9.0 server.

## Where to start ##
To start, you should download/clone the sample project from GitHub public address at https://github.com/ementalisters/lite-dashboard.git

## Datasource ##
The resource of sample data is [COVID-19 Coronavirus data](https://data.europa.eu/euodp/en/data/dataset/covid-19-coronavirus-data) which is imported from [EU Open data portal](https://data.europa.eu/) under licence of [Creative Commons Attribution 4.0 International](http://creativecommons.org/licenses/by/4.0/).
This data [file](WebContent/data/covid19_data.json) is in form of JSON array and stored in the [WebContent/data](WebContent/data/) folder. You need to import this file into your local MongoDB with the name of "covid19_data" collection in the "ementalist" database.

## Optional component ##
As an optional scenario, we need to be able to update data in the database daily. Let us know what is your solution to achieve this goal?
Which security issues you have to concern by implementing this component?
