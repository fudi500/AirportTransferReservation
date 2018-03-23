# RezerwacjaTransferu (w trakcie rozwoju) 

Aplikacja web, umo�liwiaj�ca rezerwacj� transferu lotniskowego. 
W formularzu mo�na wybra� us�ug� przewozu kilku lub kilkudziesieciu os�b mi�dzy kilkoma lokalizacjami np.Lotnsko -> Hotel. Aplikacja oblicza koszt, wysy�a odpowiednie powiadomienia email i pozwala zap�aci� za us�ug� za pomoc� karty p�atniczej (nieaktywne). Panel administracyjny pozwala anulowa� zlecenia, ustala� ceny us�ug, edytowa� po��czenia, 

Java, Spring Framework, hibernate, JPA, spring data, JDBC, maven, bootstrap


## Aby uruchomi� aplikacj� nale�y:

### 1. pobra� projekt

### 2. zaimportowa� w IDE
// projekt tworzony w ide: Spring Tool Suite (ECLIPSE)
// File -> Import -> Maven / Existing maven projects
	
### 3. Skonfigurowa� baz� danych, 
w projekcjie zanjduje si� plik:  
```
/src/main/resources/application.properties
```
nale�y w nim skonfigurowa� dost�p do bazy danych MySQL, 4 poni�sze w�a�ciwo�ci: 

```
spring.datasource.url=jdbc:mysql://localhost:3306/nazwa_twojej_bazy_danych
spring.datasource.username=twoj_username
spring.datasource.password=twoje_has�o
spring.jpa.hibernate.ddl-auto=create   
```
	
"spring.jpa.hibernate.ddl-auto =    " okre�la ona, jak hibernate ma si� zachowywa� przy uruchomieniu. Dost�pne jest kilka opcji:
* validate � tylko weryfikuje, tej opcji powinni�my u�ywa� w dzia�aj�cej aplikacji, je�li pojawi si� jaka� niesp�jno��, aplikacja si� nie uruchomi
* update � Hibernate w przypadku natrafienia na niesp�jno�� spr�buje j� usun�� poprzez modyfikacj� schematu; nara�amy si� przez to na utrat� danych, opcja nadaje si� g��wnie do testowania i rozwoju
* create � tworzy schemat i struktur�, usuwaj�c istniej�ce dane
* create-drop � podobnie jak create tworzy schemat i struktur� usuwaj�c istniej�ce dane, ale przy zamykaniu aplikacji automatycznie usuwa ca�� zawarto�� u�ywanej bazy danych
			
	
Baz� danych MySQL mo�esz pobra� z https://www.mysql.com/downloads/, 
	
Mo�esz u�y� innej bazy danych, w tym celu w pliku pom.xml zamiast:
```
<dependency>
		<groupId>mysql</groupId>
		<artifactId>mysql-connector-java</artifactId>
		<scope>runtime</scope>
</dependency>
```
	
znajdz i uzupe�nij connector java dla twojej bazy danych
	
### 4. Uruchomi�, 
Aby uruchomi� aplikacj� nale�y uruchomi� metod� "Main()" z klasy "AirportTransferReservationApplication" w pakiecie "pl.fudalewski.ATR"
w trybie "Run AS" -> "Java Application", lub w IDE STS "Run AS" -> "Spring Boot App"
	

### 5. Aplikacja Web uruchomiona, dost�pna w przegl�darce pod adresem:

http://localhost:8080/admin
	