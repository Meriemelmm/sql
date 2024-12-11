show databases;
USE  fitness;

create table mbs (id INT AUTO_INCREMENT PRIMARY KEY,nom varchar(50),date_naissance date,sexe enum('Male','Female','Other'),phone varchar(15));
-- ------------------------------insert
INSERT INTO mbs (nom, date_naissance, sexe, phone)
VALUES ("Alex Johnson", '1990-07-15', 'Male', "1234567890");
select*from mbs;
--  -------------------------------------distinct par sexe
SELECT DISTINCT sexe FROM mbs;


-- --------------------------------------- order by 
SELECT * FROM  mbs
ORDER BY date_naissance DESC;
-- ----------------------------------- condition

SELECT * FROM  mbs 

WHERE date_naissance >200;
-- ---------------------------------------------- categorie d age

select nom,date_naissance,sexe,phone,   TIMESTAMPDIFF(YEAR, date_naissance, CURDATE()) AS age,
    CASE
        WHEN  TIMESTAMPDIFF(YEAR, date_naissance, CURDATE()) < 18 THEN 'Junior'  -- Moins de 18 ans
        WHEN  TIMESTAMPDIFF(YEAR, date_naissance, CURDATE())  BETWEEN 18 AND 60 THEN 'Adulte'  -- Entre 18 et 60 ans
        ELSE 'Senior'  -- Plus de 60 ans
    END AS categorie_age
 
    from mbs;
    -- -------------------------------------------------- moyen age 
SELECT AVG(TIMESTAMPDIFF(YEAR, date_naissance, CURDATE()))
FROM mbs;
-- ---------------------------------------------------------















-- ---------------------TABLE DEPARTEMENT
create table departements( departement_id INT AUTO_INCREMENT PRIMARY KEY, departement_name char(50),emplacement varchar(50));
SELECT departement_name, emplacement FROM departements;

SELECT*FROM  departements;
-- ------------TABLE ENTRAINEURS 
CREATE TABLE Entraineurs (
    id_etraineur INT AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(50),
    first_name VARCHAR(50),
    specialization VARCHAR(50),
    departement_id INT,
    FOREIGN KEY (departement_id) REFERENCES departements(departement_id)
);
                ------------------------------------------------------------------------------------------------------------------ limit
SELECT *
FROM Entraineurs
LIMIT 3;
SELECT *
FROM Entraineurs
 JOIN departements ON Entraineurs.departement_id = departements.departement_id
--------------------------------------------------------------------------- comptez par departements
 SELECT departements.departement_name, COUNT(*) AS nombre_entraineurs
FROM Entraineurs
JOIN departements ON Entraineurs.departement_id = departements.departement_id
GROUP BY departements.departement_name;




show tables;
select*from Entraineurs ;
-- --------------------------------------------TABLE APOINTMENTS
CREATE TABLE Appointments (
    appointement_id INT AUTO_INCREMENT PRIMARY KEY,
    appointement_time TIME,
    appointement_date DATE,
    id_etraineur INT,
    id INT,
    FOREIGN KEY (id_etraineur) REFERENCES Entraineurs(id_etraineur),
    FOREIGN KEY (id) REFERENCES mbs(id)
);
-- ------------------------------------------------------------------------------------------------ nombre total de  apointements 
SELECT*FROM  Appointments;
SELECT COUNT(*)  AS Nombre total FROM Appointments;

-- ---------------------------------------------- -------------------------------------------------------dernier appointments 
SELECT  
 MAX(appointement_time ) AS dernier_apoint_time,
 MAX(  appointement_date) as dernier_apoint_date FROM Appointments ;
--  ------------------------------------------------------------------------------------------ABONNEMENTS
CREATE TABLE memberships(memebership_id INT AUTO_INCREMENT PRIMARY KEY,id INT,salle_id INT,date_start date,    FOREIGN KEY (id) REFERENCES mbs(id),   FOREIGN KEY (salle_id) REFERENCES Salles(salle_id));
select *from memberships;
-- ---------CONDITION
SELECT* FROM memberships WHERE   date_start between '1-12-2024'and'5-12-2024';
-- ------------------------SALLES
CREATE TABLE Salles(salle_id INT AUTO_INCREMENT PRIMARY KEY,salle_number varchar(10),salle_type enum('Cardio','Weights','Studio'),capacity int(11));

SELECT *FROM Salles;
-- -------------------------------------------------------------------------------------------delete
DELETE FROM Appointments
WHERE appointement_date < '2024-01-01';


CREATE TABLE Salles(salle_id INT AUTO_INCREMENT PRIMARY KEY,salle_number varchar(10),salle_type enum('Cardio','Weights','Studio'),capacity int(11));

SELECT *FROM Salles;
show tables;
CREATE TABLE memberships(memebership_id INT AUTO_INCREMENT PRIMARY KEY,id INT,salle_id INT,start_date date,    FOREIGN KEY (id) REFERENCES mbs(id),   FOREIGN KEY (salle_id) REFERENCES Salles(salle_id));
select *from memberships;
-- ---------------------------------------------------------------operation speciaux 
SELECT* FROM memberships WHERE   start_date between '1-12-2024'and'5-12-2024';
SELECT  SUM(.membershipsNumber_of_Memberships) AS total_abonnements  ,Salle. salle_type FROM memberships  JOIN Salles ON memberships.salle_id= Salles.salle_id 
GROUP BY Salle.salle_type;
-- ---------------------------------Jointure : Liste des rendez-vous avec noms des entraîneurs et membres
-- ----------------------------------Récupérez les rendez-vous avec les noms des entraîneurs et des membres.

SELECT
    memberships.memebership_id,
 mbs.id,
mbs.nom,
 Entraineurs. id_etraineur,
Entraineurs.last_name,
Entraineurs.first_name

FROM Appointments
JOIN mbs
  ON Appointments.id=mbs.id
JOIN Entraineurs
  ON Appointments. id_etraineur= Entraineurs.id_etraineur;
-- --------------------------------------------------- update mae's departement
UPDATE  departements
SET departement_name="Force et Conditionnement"
WHERE departement_name="Musculation";
-- ------------------------------------------------------- CLAUSE HAVING 





 


































