# Bootcamp Suzano - Data Analysis with Power BI
This repository includes all the projects completed during the Power BI data analysis bootcamp provided by Suzano on the DIO platform. Below, you will find descriptions for each of the projects added to this repository.

## Project 1 -- E-Commerce
An EER diagram illustrating the structure of an e-commerce application, along with the MySQL code corresponding to the project based on the diagram.

## Project 2 -- Auto repair shop
This project aims to develop a system for controlling and managing work orders (WOs) for an automotive repair shop. The system is based on an Enhanced Entity-Relationship (EER) diagram and implemented in MySQL to manage information about customers, vehicles, mechanics, work orders, services provided, and parts used.

System Description
The system is designed to meet the operational needs of an automotive repair shop, from receiving vehicles to completing work orders (WOs). The goal is to ensure efficient and detailed control of activities, promoting agility and clarity in service execution.

Key Features
Customer Management:
Customers register their personal and contact information. Each customer can have multiple vehicles associated with their account.

Vehicle Management:
The system tracks details about each vehicle, including its model, brand, and customer ownership.

Work Order Management:
Work orders include essential details such as:

Order number
Issuance date
Total value
Status (e.g., "In Processing," "Confirmed," "Completed")
Delivery date
Each work order is linked to a specific vehicle and customer.
Service and Labor Management:
Services to be performed are identified and evaluated by mechanics. The cost of labor for each service is determined based on a reference table.

Parts Management:
The system tracks parts used for repairs or maintenance, including their types, prices, and quantities. The total cost of parts is added to the work order.

Mechanic Assignment:
Mechanics are assigned to work orders based on their specialization. Each mechanic has a unique ID, name, address, and expertise.

EER Diagram Overview
Entities:

Customer: Represents individuals bringing vehicles for repairs or maintenance.
Vehicle: Represents cars or other vehicles owned by customers.
Work Order (WO): Represents the tasks to be performed, linking services, parts, and mechanics.
Mechanic: Represents individuals responsible for diagnosing and repairing vehicles.
Service: Represents labor tasks performed on vehicles.
Part: Represents components used during repairs or maintenance.
Relationships:

A customer can own multiple vehicles.
A vehicle can have multiple work orders.
A work order can include multiple services and parts.
A work order is assigned to one or more mechanics.
Mechanics can be involved in multiple work orders.
Usage Scenarios
Customer Brings a Vehicle:
The customer registers their details and associates their vehicle with their account.

Work Order Creation:
Mechanics assess the vehicle, list required services, and estimate costs for labor and parts. The customer approves the work order.

Service Execution:
Assigned mechanics perform the approved services, record hours worked, and update the order status.

Work Order Completion:
Once the services are completed, the system calculates the total cost and updates the work order status to "Completed."

Reports and Analysis:
The system generates detailed reports about customers, vehicles, services, and work orders for operational analysis.
