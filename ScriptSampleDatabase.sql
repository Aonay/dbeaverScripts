# Faremos uma analise descritiva

SELECT * FROM Album a;
SELECT COUNT(*) as Records FROM Album a 

SELECT AlbumId, Title FROM Album a WHERE Title LIKE '%For Those%';

SELECT COUNT(*) FROM Album a WHERE Title LIKE '%Disc%';

SELECT * FROM Artist a ;

SELECT * FROM Album a INNER JOIN Artist a2 ON a.ArtistId = a2.ArtistId ;


#Caracterizando os registros dos artistas por quantidade de albuns
SELECT a.ArtistId  , a2.Name , count(*) as Albuns FROM Album a INNER JOIN Artist a2 ON a.ArtistId = a2.ArtistId GROUP BY a.ArtistId ORDER BY Albuns DESC;

SELECT * FROM Album a Where a.ArtistId = 90;

#Analisando Clientes

SELECT * FROM Customer c LIMIT 10;

#Nessa consulta consigo ver quantos dos meus stados estao nulos. Percebi possivel descobrir o estado porque temos informações de Pais e cidade.
SELECT State,  COUNT(*) as Total FROM Customer GROUP BY State 

SELECT FirstName,Address, COUNT(*) FROM Customer c where Address LIKE '%Broadway%'

SELECT c.Country ,c.City , COUNT(*) as Total FROM Customer c GROUP BY c.Country, c.City 

SELECT c.Country ,c.City , COUNT(*) as Total FROM Customer c GROUP BY c.Country, c.City 

# Verificando quais empregrados tambem sao clientes

SELECT * FROM Employee e 


#Exemplo com subquery
SELECT c.FirstName, c.LastName From Customer c  WHERE c.Company  is NULL AND c.FirstName IN(SELECT e.FirstName FROM Employee e)

#Exemplo com innerJoin

SELECT c.FirstName ,c.LastName  FROM Customer c INNER JOIN Employee e ON c.FirstName = e.FirstName 




