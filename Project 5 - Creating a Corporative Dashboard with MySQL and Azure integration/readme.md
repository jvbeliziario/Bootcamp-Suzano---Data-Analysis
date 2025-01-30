# Creating a Corporative Dashboard with MySQL and Azure integration

## Project Description

The project involves the creation of a MySQL instance on the Azure platform, where a database named Azure_Company was configured. Following the creation of this database, data such as employee information, departments, and projects were inserted into the database. Subsequently, this data was integrated into Power BI through a connection to the MySQL database. During the integration process, a careful selection of the tables to be loaded was made, followed by adjustments to data types and the application of filters to ensure that the information was presented clearly and consistently in the final report. 

Database Creation Script: This script creates all the necessary tables in the Azure_Company database, including tables for employees, departments, and projects, as well as defining their primary and foreign keys.
Data Insertion Script
The data transformation stage aimed to meet the following premises:

* Analysis of headers and data types.
* Modification of monetary values to the double type.
* Verification of null data and handling of removal.
* Analysis of employees without managers and departments without managers.
* Adjustment in project hours columns.
* Merging of tables and complex columns.
* Creation of derived tables, such as Employee-Manager and Employee_Department.
* Deletion of unnecessary columns.

The final Power BI report can be accessed via the following link: [Company Report](https://app.powerbi.com/view?r=eyJrIjoiOTE0Nzc4YzItMzM5ZS00MTAwLTgxY2EtMzAxZmRkYzc5OGRiIiwidCI6ImZlODc4N2JjLWM5MTQtNDY2NS04NTQ3LTI2OGUxNWNiMGQ5YSJ9).
