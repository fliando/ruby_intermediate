# Module 2

**Ruby for Intermediate** program is a coding bootcamp by [Gojek's GoAcademy](https://www.gojek.com/go-academy/) and [Generation Girl](https://www.generationgirl.org/).

The curriculum is designed with the aim to introduce the fundamentals of software development and developing a web application with unit test and follow F.I.R.S.T principles.
We learn the theory and numerous practical exercises in the program.

In the third class of *Intermediate* level, we:
* Showcase and discuss Module 1's Homework (Databases)
* Learn about Routing and Rendering
    * HTTP methods
    * REST API routing
    * Rendering HTML static tag with Ruby
    * Rendering HTML dynamic tag with Ruby (using ERB, which stands for embedded Ruby)
    * Use Ruby gems 'sinatra' and 'mysql2'
* Learn about Database Connection
    * Create database connection
    * Create queries from database
    * Create CRUD value from and to database using view

For our Homework, we practice everything we learned by showing data from database on pages that do CRUD functions.<br>
The theme that we use for the exercises is Food Business. We learn to create Menu Items management system.<br>
Note: In order for 'Delete' method to work, I set foreign key check 'ON DELETE SET NULL' on 'item_categories' table in database.<br>

#### Homework Submission
**1. Index Page**<br>
On this page, we show:
* List of Menu Items with Name and Price
* Shows navigation to Create New Item, Show Item Details, Update/Edit Item Information and button to Delete Item from the database

**2. Create New Item**<br>
Upon clicking the 'New Item' navigation, user is shown a page to Add New Item to the database.<br>
On this page, we show:
* Name and Price columns - that user can fill in with information to be added to the database
* Category (drop down) selection - that renders the category information stored in the database
* Add Item button - that user clicks to add the item to the database

**3. Read / Show Item Information**<br>
Upon clicking the 'Show' navigation, user is shown a page to Item Information Details.<br>
On this page, we show chosen Item Details:
* Item Name
* Item Price
* Item Category

**4. Update / Edit Item Information**<br>
Upon clicking the 'Edit' navigation, user is shown a page to Update / Edit Item Information.<br>
On this page, we show:
* Name and Price columns - that user can fill in with information to be updated on existing data on the database
* Category (drop down) selection - that renders the category information stored in the database and user can choose to be updated on existing data on the database
* Add Item button - that user clicks to update the item data to the database

**5. Delete Item**<br>
Upon clicking the 'Delete' button, user is shown a page to confirm the deletion of selected item, with another 'Delete Item' button.<br>
Upon clicking the 'Delete Item' button on that confirmation page, the selected item data is deleted from the database.
<br>

Thanks for reading. Hope you have a nice day!