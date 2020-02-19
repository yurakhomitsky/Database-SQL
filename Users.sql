
CREATE USER 'Yuriy'@'localhost' IDENTIFIED BY '123';
CREATE USER 'Vitalk'@'localhost' IDENTIFIED BY '234';
CREATE USER 'Roman'@'localhost' IDENTIFIED BY '345';
CREATE USER 'Dima'@'localhost' IDENTIFIED BY '345';
CREATE USER 'Andriy'@'localhost' IDENTIFIED BY '345';

GRANT CREATE ON map.* to 'Andriy'@'localhost';
GRANT ALTER ON map.* to 'Dima'@'localhost';
GRANT SELECT ON map.economy to 'Yuriy'@'localhost';
GRANT SELECT,INSERT,UPDATE ON map.capital  TO 'Vitalk'@'localhost';
GRANT DROP on map.* to  'Roman'@'localhost';