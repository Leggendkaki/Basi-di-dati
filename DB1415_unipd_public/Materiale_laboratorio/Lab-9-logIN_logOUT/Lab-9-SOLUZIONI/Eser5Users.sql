/* crea la tabella degli utenti registrati per l'esercitazione 5 */

DROP TABLE IF EXISTS Eser5Users;

CREATE TABLE Eser5Users (
       Login     CHAR(8)   PRIMARY KEY,
       Password  CHAR(40)
);