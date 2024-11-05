# Sales-Insights-Python-SQL-Tableau-

This project involves analyzing the sales information of retail orders from a store to generate key sales insights. The analysis follows the ETL (Extract, Transform, Load) methodology, which includes data extraction, transformation, and loading processes. I used Python, SQL, and Tableau to extract meaningful insights.

<h1>Approach</h1>
<h2>Extract:</h2> The dataset was extracted using Python. I imported the dataset with Pandas after loading it from a CSV file. The data includes 9,994 rows and 20 columns, detailing orders, sales, discounts, and profits.

<h2>Transform:</h2>
I performed data cleaning and transformation, which involved:

Checking for missing or incorrect data types
Removing duplicates and null values
Renaming and standardizing columns for consistency
Creating new columns, such as profit margin and revenue percentage
Handling outliers and replacing null values with mean, median, or mode, depending on the data type.
<h2>Load:</h2>
The transformed dataset was loaded into a MySQL database. Using SQL, I ran queries to identify key trends, including:

Top revenue-generating products,
Highest-selling products by region,
Sales trends by month and year,
Additionally, the data was visualized using Tableau, creating interactive dashboards that enable stakeholders to explore the data.

<h2>Key Findings:</h2>

The business has been growing in terms of total revenue.
Revenue growth was observed from 2022 to 2023, with notable contributions from high-revenue states such as California, New York, and Washington.

<h4>Profit Margin:</h4> Despite increasing revenue, the profit margin has decreased over time.
The Chairs sub-category was identified as the most profitable, but there were concerns in certain product categories with negative profit margins.

<h4>Geographical Insights:</h4>California, New York, and Washington are the leading states in terms of total revenue.
The East region contributed the most to the overall profit margin.
<h4>Segment Insights:</h4>The Corporate segment was found to contribute the most to total revenue.
Different customer segments performed differently in various regions, with the Consumer segment showing high growth in specific states.
<h4>Product Insights:</h4> Chairs, Tables, and Storage categories generated high revenue.
Profit margins were concerning for certain products, particularly in the Office Supplies category, where certain products had a negative impact on profits.

<h2>Tools Used</h2>

<h4>Python:</h4> For extracting and cleaning the data, including using libraries like Pandas for data manipulation .
<h4>SQL:</h4>Advanced SQL queries were used to generate insights, such as monthly sales trends, revenue contributions by region, and profit analysis.
<h4>Tableau:</h4> Used to create an interactive dashboard for stakeholders to explore the insights and drill down into specific details.
