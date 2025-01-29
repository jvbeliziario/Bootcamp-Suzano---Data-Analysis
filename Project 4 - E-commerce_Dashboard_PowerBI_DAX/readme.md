# Designing an E-commerce Dashboard with Power BI Using DAX Formulas

## Project Description
In this project challenge, a data model was created based on the Star Schema, using the Financial Sample table as the foundation for generating fact and dimension tables. The Financial Sample table contains the following information:

* Sales segment
* Sales country
* Product sold
* Discount band
* Units sold
* Manufacturing price
* Selling price
* Gross sales
* Discount amount
* Sales value
* Cost of goods sold
* Profit and sales date

We will use the single Financial Sample table to create the dimension and fact tables for our model based on the star schema.

The process consists of creating tables based on the original table. From the copy, we will select the columns that will compose the view of the new table. Thus, from the main table, the following tables will be created:

* Financials_origem (hidden mode – backup)
* D_Products (ID_Product, Product, Average Units Sold, Average Sales Value, Median Sales Value, Maximum Sales Value, Minimum Sales Value)
* D_Products_Details (ID_Product, Discount Band, Sale Price, Units Sold, Manufacturing Price)
* D_Discounts (ID_Product, Discount, Discount Band)
* D_Details (*)
* D_Calendar – Created using DAX with CALENDAR()
* F_Sales (SK_ID, ID_Product, Product, Units Sold, Sales Price, Discount Band, Segment, Country, Sellers, Profit, Date (fields))
















