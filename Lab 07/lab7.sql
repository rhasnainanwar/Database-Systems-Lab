# find the most expensive laptop
SELECT model, price FROM laptop WHERE price IN (SELECT MAX(price) FROM laptop);

# Select model and hard disk size of those PCs that have maximum hard disk
SELECT model, hdsize FROM pc WHERE hdsize IN (SELECT MAX(hdsize) FROM pc);

# Find the total cost of all PCs in each Ramsize
SELECT SUM(price), ramsize FROM pc GROUP BY ramsize;

# Produce the list includes the model and price of printers sorted on price.
SELECT model, price FROM printer ORDER BY price;

# Find those manufacturers (makers) of PCs with speeds of at least 1000
SELECT maker, model FROM product WHERE model IN (
	SELECT model FROM pc WHERE pspeed >= 1000 );
    
# Print model, speed, and price of those PCs whose prices are same
SELECT p.model, p.pspeed, p.price FROM pc p WHERE EXISTS (
	SELECT model FROM pc WHERE model <> p.model AND price = p.price);
    
# Find those manufacturers (makers) that sell laptops, but not PC’s
SELECT p.maker FROM product p WHERE
	EXISTS (SELECT model FROM product WHERE model = 'laptop')
	AND NOT
    EXISTS (SELECT model FROM product WHERE model = 'pc');