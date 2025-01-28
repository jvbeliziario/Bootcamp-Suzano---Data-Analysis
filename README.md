# Bootcamp Suzano - Data Analysis with Power BI
This repository includes all the projects completed during the Power BI data analysis bootcamp provided by Suzano on the DIO platform. Below, you will find descriptions for each of the projects added to this repository.

## Databases and SQL - Project 1 -- E-Commerce
An EER diagram illustrating the structure of an e-commerce application, along with the MySQL code corresponding to the project based on the diagram.

## Databases and SQL - Project 2 -- Auto Repair Shop
A database system for managing work orders (WOs) in an automotive repair shop, built with MySQL and guided by an Enhanced Entity-Relationship (EER) diagram. It handles customer, vehicle, mechanic, service, and part data to streamline shop operations.

System Overview
The system facilitates efficient management of repair shop activities, from registering customers and vehicles to completing and tracking work orders.

Core Features
Customer & Vehicle Management: Tracks customer information and their associated vehicles.
Work Orders (WOs): Includes details like order number, issue date, status, total cost, and delivery date, linking vehicles, services, parts, and mechanics.
Service & Labor: Manages services performed, calculates labor costs based on a reference table.
Parts Tracking: Tracks parts used in repairs, their cost, and quantity.
Mechanic Assignment: Associates specialized mechanics with work orders.
Data Model
Entities:

Customer: Linked to vehicles.
Vehicle: Linked to work orders.
Work Order: Central entity tying services, parts, and mechanics.
Mechanic: Specializations aid assignment to work orders.
Service: Represents tasks performed.
Part: Tracks components used.
Relationships:
Customers own vehicles, vehicles have work orders, and work orders involve services, parts, and mechanics.

Workflow
Customer Registration: Link customer to their vehicle.
Work Order Creation: Mechanics assess the vehicle, identify required services, and estimate costs.
Service Execution: Mechanics perform approved work, record hours, and update order status.
Completion: The system calculates total cost and finalizes the WO.

## Data Analysis and Power BI - Project 3 -- Financial Report
Power BI dashboard providing an analysis of sales and profit by country, product, and segment. This interactive report leverages the dataset included in the project to uncover valuable insights, such as regional trends, product performance, and customer segment profitability.

As following part of the third project for the DIO bootcamp, focused on visual resources in Power BI, I developed a more comprehensive and deeper report using Power BI for the Financial Sample Project, which is the detailed version of the Financial Report.
