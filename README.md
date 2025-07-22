# Case-Study-PMM-Grocery-Supermarket
CASE BRIEF: PMM Grocery Supermarket
PMM Grocery Supermarket has decided to move from manual ways of doing things into
digitalize method of operation. They require a new database management system to replace the
original system they had in place as this is no longer viable for the amount of data they are
storing. They would like a design for a centralised database that allows web interface access
for the employees and customers.
PMM Grocery Supermarket is an Hampshire supermarket with branches in Waterlooville,
Fareham, Gosport, Havant, Chichester with Portsmouth as the head office.
Staff work in different locations based on the shift pattern and each location have a
manager who oversees the affairs of the the location. And store manager will report
to the headoffice.
PMM Grocery Supermarket sells products under different categories like beverages,
bread/bakery, Canned/Jarred goods, Dairy, Dry/baking goods, frozenfoods, meats,
produce, cleaners, personal care, paper goods etc. And each product will have details
like product price, product Id, product name, ingredients, allergy advice, lifestyle,
size/volume, net weight, direction for use, nutrition info, country of origin, storage
instruction and maunfacturer.
Example of a details –
Product Name – Sliced Malted Bloomer Bread
Product Price - £1.35
Product Id – 4088600412177
Ingredients - 𝐖𝐡𝐞𝐚𝐭 𝐅𝐥𝐨𝐮𝐫 (𝐖𝐡𝐞𝐚𝐭 𝐅𝐥𝐨𝐮𝐫, Calcium Carbonate, Iron, Niacin, Thiamin),
Water, Malted 𝐖𝐡𝐞𝐚𝐭 (6%), Yeast, 𝐑𝐲𝐞 Flour, Rapeseed Oil, Salt, 𝐖𝐡𝐞𝐚𝐭 Bran, 𝐖𝐡𝐞𝐚𝐭
Semolina, Malted 𝐁𝐚𝐫𝐥𝐞𝐲 Flour, Preservative: Calcium Propionate; Flour Treatment Agent:
Ascorbic Acid.
Net Weight – 800g
Lifestyle - Vegetarian
Nutrition Info.
- Per 100g: Energy 1064kJ, 251kcal Fat 1.7g of which saturates 0.2g
Carbohydrate 48g of which sugars 4.9g Fibre 4.1g Protein 8.5g Salt 0.87g
Storage Instructions - Store in a cool, dry place away from strong odours and direct sunlight.
Once opened, store in an airtight container. Suitable for freezing. Freeze by date mark shown
and use within one month. Defrost thoroughly before use. Do not refreeze once defrosted.
So, as you can see from above brief, there are different numbers of products with
different Ingredients description, different Nutrition information, different storage
Instruction. Therefore, this type of project lends itself to the sue of NoSQL system,
especially a document store system such as MongoDB.
Task T1: Database / record Development 
Create a NoSQL, (MongoDB) database that will store products and their
corresponding details. You can generate random products and their details using any
free online data generating platform or you create your own. You will require to a
minimum of 100 products in your database. Each product will need to be stored as a
single record in a single collection in the database. You will need to provide the code
that you used to create the database and store the records. This will allow you to
create the 3 queries needed for your task 2.
Task T2: Queries 
Write 3 queries that will retrieve product information from your database. Think of
the sort or things that a user will want to be able to do. For example, a user might:
• Look for products for specific season with specific ingredients and
Nutritional content.
• Product availability and locations.
• History of delivery of orders.
• Products purchasing record based on the locations.
Task T3: Reflective Report 
Write a reflective report discussing how you developed the database, the record structure and how you
chose the queries. [300 - 500 words].
