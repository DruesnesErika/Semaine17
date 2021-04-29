-- Exercice 2 : base gescom

-- Réalisez les vues suivantes à partir de la base gescom.

-- v_Details correspondant à la requête : _A partir de la table orders_details, afficher par code produit, la somme des quantités commandées et le prix total correspondant : on nommera la colonne correspondant à la somme des quantités commandées, QteTot et le prix total, PrixTot.

CREATE VIEW v_Details 
AS
SELECT DISTINCT pro_ref, SUM(ode_quantity) AS QteTot, CAST(SUM(ode_unit_price - ode_unit_price / 100*ode_discount) AS DECIMAL(7,2)) AS PrixTot
FROM products, orders_details
WHERE orders_details.ode_pro_id = products.pro_id
GROUP BY pro_ref 
-- v_Ventes_Zoom correspondant à la requête : Afficher les ventes dont le code produit est ZOOM (affichage de toutes les colonnes de la table orders_details).

CREATE VIEW v_Ventes_Zoom 
AS 
SELECT ode_id, ode_unit_price, ode_discount, ode_quantity, ode_ord_id, ode_pro_id
FROM products, orders_details
WHERE products.pro_id = orders_details.ode_pro_id
AND pro_ref = 'ZOOM'