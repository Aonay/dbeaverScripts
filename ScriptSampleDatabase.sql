-- Faremos uma analise descritiva

SELECT * FROM Album a;
SELECT COUNT(*) as Records FROM Album a 

SELECT AlbumId, Title FROM Album a WHERE Title LIKE '%For Those%';

SELECT COUNT(*) FROM Album a WHERE Title LIKE '%Disc%';

SELECT * FROM Artist a ;

SELECT * FROM Album a INNER JOIN Artist a2 ON a.ArtistId = a2.ArtistId ;


-- Caracterizando os registros dos artistas por quantidade de albuns
SELECT a.ArtistId  , a2.Name , count(*) as Albuns FROM Album a INNER JOIN Artist a2 ON a.ArtistId = a2.ArtistId GROUP BY a.ArtistId ORDER BY Albuns DESC;

SELECT * FROM Album a Where a.ArtistId = 90;

--Analisando Clientes

SELECT * FROM Customer c LIMIT 10;

--Nessa consulta consigo ver quantos dos meus stados estao nulos. Percebi possivel descobrir o estado porque temos informações de Pais e cidade.
SELECT State,  COUNT(*) as Total FROM Customer GROUP BY State 

SELECT FirstName,Address, COUNT(*) FROM Customer c where Address LIKE '%Broadway%'

SELECT c.Country ,c.City , COUNT(*) as Total FROM Customer c GROUP BY c.Country, c.City 

SELECT c.Country ,c.City , COUNT(*) as Total FROM Customer c GROUP BY c.Country, c.City 

-- Verificando quais empregrados tambem sao clientes

SELECT * FROM Employee e 


--Exemplo com subquery
SELECT c.FirstName, c.LastName From Customer c  WHERE c.Company  is NULL AND c.FirstName IN(SELECT e.FirstName FROM Employee e)

--Exemplo com innerJoin

SELECT c.FirstName ,c.LastName  FROM Customer c INNER JOIN Employee e ON c.FirstName = e.FirstName 


--Explorando a tabela INVOICE

SELECT  COUNT(*) as Registros FROM Invoice i 

SELECT * FROM Invoice i

SELECT * FROM InvoiceLine ORDER BY UnitPrice  DESC   LIMIT 10

SELECT UnitPrice , COUNT(*) AS Record FROM InvoiceLine GROUP BY UnitPrice 

SELECT * FROM InvoiceLine il INNER JOIN Invoice i LIMIT 2;

SELECT * FROM InvoiceLine il INNER JOIN Invoice i ON i.InvoiceId = il.InvoiceId WHERE i.InvoiceId =1


-- Aqui eu filtrei pra ver quantas musicas cada cliente comprou
SELECT c.CustomerId,COUNT(il.TrackId) AS TotalTracks 
FROM Customer c 
INNER JOIN Invoice i 
	ON c.CustomerId = i.CustomerId
INNER JOIN InvoiceLine il
	ON i.InvoiceId = il.InvoiceId 
GROUP BY c.CustomerId, c.FirstName ,c.LastName 

-- Como é um sample eu fiquei em duvida pela numeração igual de registros ai filtrei pelo id  e pedi pra ver o nome o id da nota fiscal e i id da musica
SELECT c.CustomerId,c.FirstName ,c.LastName,i.InvoiceId ,il.TrackId 
FROM Customer c 
INNER JOIN Invoice i 
	ON c.CustomerId = i.CustomerId
INNER JOIN InvoiceLine il
	ON i.InvoiceId = il.InvoiceId 
WHERE c.CustomerId = 1
GROUP BY i.InvoiceId 
		
--Pra ver quantas notas cada cliente tem
SELECT c.CustomerId,c.FirstName,i.InvoiceId,COUNT(*)AS TotalInvoices
FROM Customer c 
INNER JOIN Invoice i 
	ON c.CustomerId =i.CustomerId 
GROUP BY c.CustomerId 
