# RESTaurant, by Peter N. Michalakis 

WHAT IS THIS?
------------------------------------------------

This is an application created for restaurants to help waiters and waitresses manage their tables and orders. The application will allow restaurant staff to take orders of food from parties and subsequently create a receipt for the party to pay their bill. 

CONTENT
-------------------------------------------------

The main page has a link to a list of all parties, and an interactive menu, containing a list of all of the food available at the restaurant.

FOOD
*****

Clicking on an individual food item takes you to that individual item's page. On that page, there are three additional links. The link "Back to menu" takes the user back to the main page. "Take off menu" removes the item from the menu entirely. "Change the dish?" leads to an edit page, where the user can change the Name and Price of the item.

At the bottom of the main page, the link "Add Item to Menu" leads to a new food item page, where the user can add a new food item, entering values for Name and Price. It will then redirect back to the main/menu page, where the new item will have generated.


PARTIES
*****

From the menu page, clicking "List of Parties" will take the user to a page with all of the parties currently in the restaurant. The party's name, the number of attendees and whether or not the party has paid yet will be displayed.

At the bottom of the page, there is a link to return to the menu, and a link to add a new table. The new table link will lead the user to a new party page, where values of Party name and size (number of attendees) will be entered. The "Paid" column has a prepopulated value of "No" Submitting this form will redirect the user back to the parties page. 

INDIVIDUAL PARTY
*****

Clicking on an individual party will take the user to a page where the user can see the party's current order, and/or if they have no order, add food items to an order. The user can add items to the order by clicking on the name of the food from the menu below, under "Select Food." The page has links to return to the list of tables and to return to the menu, at the bottom. There are also links allowing the user to edit a party, labeled "Change of Plans?" That takes the user to an edit page, where the user can change the name and size of the party. "Cancellation" removes the party. 

Clicking on the items under "Party's current order" takes the use to an orders page, the orders page has a button to remove an item from the order. Print bill generates a receipt on a receipt page, which has the total, as well as suggested tips, based on common tipping percentages. Checkout changes the party's Paid status to "Yes."
