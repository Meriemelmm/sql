show databases;
USE  fitness;

create table mbs (id INT AUTO_INCREMENT PRIMARY KEY,nom varchar(50),date_naissance date,sexe enum('Male','Female','Other'),phone varchar(15));
INSERT INTO mbs (nom, date_naissance, sexe, phone)
VALUES ("Alex Johnson", '1990-07-15', 'Male', "1234567890");
select*from mbs;
SELECT DISTINCT sexe FROM mbs;
SELECT * FROM  mbs
ORDER BY date_naissance DESC;
SELECT * FROM  mbs 

WHERE date_naissance >200;


select nom,date_naissance,sexe,phone,   TIMESTAMPDIFF(YEAR, date_naissance, CURDATE()) AS age,
    CASE
        WHEN  TIMESTAMPDIFF(YEAR, date_naissance, CURDATE()) < 18 THEN 'Junior'  -- Moins de 18 ans
        WHEN  TIMESTAMPDIFF(YEAR, date_naissance, CURDATE())  BETWEEN 18 AND 60 THEN 'Adulte'  -- Entre 18 et 60 ans
        ELSE 'Senior'  -- Plus de 60 ans
    END AS categorie_age
 
    from mbs;
















create table departements( departement_id INT AUTO_INCREMENT PRIMARY KEY, departement_name char(50),emplacement varchar(50));
SELECT departement_name, emplacement FROM departements;

SELECT*FROM  departements;
CREATE TABLE Entraineurs (
    id_etraineur INT AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(50),
    first_name VARCHAR(50),
    specialization VARCHAR(50),
    departement_id INT,
    FOREIGN KEY (departement_id) REFERENCES departements(departement_id)
);
SELECT *
FROM Entraineurs
LIMIT 3;
SELECT *
FROM Entraineurs
 JOIN departements ON Entraineurs.departement_id = departements.departement_id
WHERE departement_name='Musculation' or departement_name='Cardio';


show tables;
select*from Entraineurs ;
CREATE TABLE Appointments (
    appointement_id INT AUTO_INCREMENT PRIMARY KEY,
    appointement_time TIME,
    appointement_date DATE,
    id_etraineur INT,
    id INT,
    FOREIGN KEY (id_etraineur) REFERENCES Entraineurs(id_etraineur),
    FOREIGN KEY (id) REFERENCES mbs(id)
);
SELECT*FROM  Appointments;
CREATE TABLE Salles(salle_id INT AUTO_INCREMENT PRIMARY KEY,salle_number varchar(10),salle_type enum('Cardio','Weights','Studio'),capacity int(11));

SELECT *FROM Salles;
show tables;
CREATE TABLE memberships(memebership_id INT AUTO_INCREMENT PRIMARY KEY,id INT,salle_id INT,start_date date,    FOREIGN KEY (id) REFERENCES mbs(id),   FOREIGN KEY (salle_id) REFERENCES Salles(salle_id));
select *from memberships;
SELECT* FROM memberships WHERE   start_date between '1-12-2024'and'5-12-2024';





 


































