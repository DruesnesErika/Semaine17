-- Exercice 1 : base hotel

-- Afficher la liste des hôtels avec leur station.

CREATE VIEW view_hotel_station
AS 
SELECT * 
FROM hotel, station
WHERE hotel.hot_sta_id = station.sta_id

-- Afficher la liste des chambres et leur hôtel

CREATE VIEW view_chambre_hotel
AS 
SELECT * 
FROM chambre, hotel 
WHERE hotel.hot_id = chambre.cha_hot_id

-- Afficher la liste des réservations avec le nom des clients

CREATE VIEW view_reservation_client
AS 
SELECT *
FROM reservation, client 
WHERE reservation.res_cli_id = client._cli_id

-- Afficher la liste des chambres avec le nom de l'hôtel et le nom de la station

CREATE VIEW v_chambre_nomhotel_nomstation
AS 
SELECT cha_id, cha_hot_id, cha_numero, cha_capacite, cha_type, hot_nom, sta_nom
FROM chambre, hotel, station
WHERE hotel.hot_sta_id = station.sta_id
AND hotel.hot_id = chambre.cha_hot_id

-- Afficher les réservations avec le nom du client et le nom de l'hôtel

CREATE VIEW v_reservation_nomclient_nomhotel
AS
SELECT res_id, res_cha_id, res_cli_id, res_date, res_date_debut, res_date_fin, res_prix, res_arrhes, cli_nom, hot_nom 
FROM reservation, hotel, client, chambre
WHERE client.cli_id = reservation.res_cli_id 
AND reservation.res_cha_id = chambre.cha_id 
AND chambre.cha_hot_id = hotel.hot_id