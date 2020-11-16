# Module 3

**Ruby for Intermediate** program is a coding bootcamp by [Gojek's GoAcademy](https://www.gojek.com/go-academy/) and [Generation Girl](https://www.generationgirl.org/).

The curriculum is designed with the aim to introduce the fundamentals of software development and developing a web application with unit test and follow F.I.R.S.T principles.
We learn the theory and numerous practical exercises in the program.

In the fourth class of *Intermediate* level, we:
* Showcase and discuss Module 2's Homework (Routing & Rendering and Database Connection)
* Learn about MVC Architecture
    * What MVC is and why it is important
    * Create the model
    * Create the view
    * Create the controller
    * Integrate model, view, controller

For our Homework, we practice everything we learned by showing data from database on pages that do CRUD functions, using MVC architecture.
The theme that we use for the exercises is Food Business.<br>
We learn to create system to manage Menu Items and Categories with MVC architecture, demonstrating how they interact.<br>
Note: In order for 'Delete' method to work, I set foreign key check 'ON DELETE SET NULL' on 'item_categories' table in database. <br>

#### Homework Submission
**MAIN NAVIGATION PAGE**<br>
On this page, we show:
* Navigation to Menu Items management
* Navigation to Categories management<br>

**MENU ITEMS MANAGEMENT**<br>
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
Upon clicking the 'Delete Item' button on that confirmation page, the selected item data is deleted from the database.<br>


**CATEGORIES MANAGEMENT**<br>
**1. Index Page**<br>
On this page, we show:
* List of Categories with Name and ID
* Shows navigation to Create New Category, Show Category Details, Update/Edit Category Information and button to Delete Category from the database

**2. Create New Category**<br>
Upon clicking the 'Create New Category' navigation, user is shown a page to Add New Category to the database.<br>
On this page, we show:
* Name and ID columns - that user can fill in with information to be added to the database
* Add Category button - that user clicks to add the category to the database

**3. Read / Show Category Information**<br>
Upon clicking the 'Show' navigation, user is shown a page to Category Information Details.<br>
On this page, we show chosen Category Details:
* Category Name
* Category ID
* Menu Items that are in this Category

**4. Update / Edit Category Information**<br>
Upon clicking the 'Edit' navigation, user is shown a page to Update / Edit Category Information.<br>
On this page, we show:
* Name column - that user can fill in with information to be updated on existing data on the database
* Add Category button - that user clicks to update the category data to the database

**5. Delete Category**<br>
Upon clicking the 'Delete' button, user is shown a page to confirm the deletion of selected category, with another 'Delete Category' button.<br>
Upon clicking the 'Delete Category' button on that confirmation page, the selected category data is deleted from the database.<br>


Thanks for reading. Hope you have a nice day!