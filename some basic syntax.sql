CREATE DATABASE test;
DROP DATABASE test; 	  				/*To destroy the databse, be cautious when using this command!*/
USE test;								/*To specify which database these sql command will be applied on*/

CREATE TABLE test (
	test_column INT
);

ALTER TABLE test						/*To alter the existing table without destroy or affected existing datata*/
ADD another_column VARCHAR(255); 
DROP TABLE test;						/*To destroy the table*/

