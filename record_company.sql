CREATE DATABASE record_company;
USE record_company;

CREATE TABLE bands (
	id INT NOT NULL AUTO_INCREMENT,					   	/*The id value whill be updated automatically*/
	name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE albums (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    release_year INT,
    band_id INT NOT NULL,							
    PRIMARY KEY (id),
    FOREIGN KEY (band_id) REFERENCES bands(id)         
);

INSERT INTO bands (name)									/*Insert value to column*/
VALUE ('Iron Man'), ('Hello Kitty'), ('The Lion'), ('Good morning G7');

SELECT * FROM bands;
SELECT * FROM bands LIMIT 2;								/*Just show 2 first record*/
SELECT name From bands;										/*Just show the column name*/
SELECT id AS 'ID', name AS 'Band Name' FROM bands LIMIT 2;	/*Show columns with diffirent name*/
SELECT * FROM bands ORDER BY name;							/*Show asscending records ordered by name*/
SELECT * FROM bands ORDER BY name DESC;						/*Show desscending records ordered by name*/

INSERT INTO albums (name, release_year, band_id)
VALUES ('The Rain Drop', 1985, 1),
	   ('Broken Heart', 1999, 2),
       ('Let me love you', 1992, 3),
       ('Mr Adam Smith', 1990, 4),
       ('Sing along with me', 2001, 4),
       ('Electric power', 1990, 1),
       ('Love never felt so good', NULL, 1);

INSERT INTO albums (name, release_year, band_id)
VALUES ('Let me love you', 2001, 2);
       
SELECT * FROM albums;
SELECT DISTINCT name FROM albums;						/*Show unique name in column name*/

SELECT * FROM albums ORDER BY release_year;

UPDATE albums											/*Change the existing value (of a record from 1985 to 1982)*/
SET release_year = 1982
WHERE id = 1;

SELECT * FROM albums
WHERE release_year = 2001;								/*WHERE: play role as a filter*/

SELECT * FROM albums
WHERE name LIKE '%it%';									/*Select records which has column name value contain 'it'*/

SELECT * FROM albums
WHERE name LIKE '%it%' OR band_id = 1;	

SELECT * FROM albums
WHERE name LIKE '%it%' AND release_year = 2001;

SELECT * FROM albums
WHERE release_year BETWEEN 1999 AND 2002;

SELECT * FROM albums
WHERE release_year IS NULL;

/*Delete record having null value*/
DELETE FROM albums WHERE id = 7;				
SELECT * FROM albums;

SELECT * FROM albums										/*Join 2 tables satisfying some conditions - only show matching records*/
JOIN bands ON bands.id = albums.band_id;					/*LEFT JOIN: keep all records of albums - RIGHT JOIN: keep all records of bands*/

/*Use function*/
SELECT AVG(release_year) FROM albums;						
SELECT band_id, COUNT(band_id) FROM albums					/*Count albums by band_id*/
GROUP BY band_id;

/*Show band name and number of their albums*/
/*Join 2 table*/
/*select brand.name và count number of album theo brands.id*/
SELECT bands.name AS band_name, COUNT(albums.id) AS no_album
FROM bands JOIN albums ON bands.id = albums.band_id
GROUP BY bands.id;

SELECT bands.name AS band_name, COUNT(albums.id) AS no_album		/*WHERE is used to select data in the original tables whereas HAVING is used to filter data in the result set*/
FROM bands JOIN albums ON bands.id = albums.band_id
GROUP BY bands.id
HAVING no_album = 1;


