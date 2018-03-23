# RezerwacjaTransferu (w trakcie rozwoju) 

Aplikacja web, umo¿liwiaj¹ca rezerwacjê transferu lotniskowego. 
W formularzu mo¿na wybraæ us³ugê przewozu kilku lub kilkudziesieciu osób miêdzy kilkoma lokalizacjami np.Lotnsko -> Hotel. Aplikacja oblicza koszt, wysy³a odpowiednie powiadomienia email i pozwala zap³aciæ za us³ugê za pomoc¹ karty p³atniczej (nieaktywne). Panel administracyjny pozwala anulowaæ zlecenia, ustalaæ ceny us³ug, edytowaæ po³¹czenia, 

Java, Spring Framework, hibernate, JPA, spring data, JDBC, maven, bootstrap


## Aby uruchomiæ aplikacjê nale¿y:

### 1. pobraæ projekt

### 2. zaimportowaæ w IDE
// projekt tworzony w ide: Spring Tool Suite (ECLIPSE)
// File -> Import -> Maven / Existing maven projects
	
### 3. Skonfigurowaæ bazê danych, 
w projekcjie zanjduje siê plik:  
```
/src/main/resources/application.properties
```
nale¿y w nim skonfigurowaæ dostêp do bazy danych MySQL, 4 poni¿sze w³aœciwoœci: 

```
spring.datasource.url=jdbc:mysql://localhost:3306/nazwa_twojej_bazy_danych
spring.datasource.username=twoj_username
spring.datasource.password=twoje_has³o
spring.jpa.hibernate.ddl-auto=create   
```
	
"spring.jpa.hibernate.ddl-auto =    " okreœla ona, jak hibernate ma siê zachowywaæ przy uruchomieniu. Dostêpne jest kilka opcji:
* validate — tylko weryfikuje, tej opcji powinniœmy u¿ywaæ w dzia³aj¹cej aplikacji, jeœli pojawi siê jakaœ niespójnoœæ, aplikacja siê nie uruchomi
* update — Hibernate w przypadku natrafienia na niespójnoœæ spróbuje j¹ usun¹æ poprzez modyfikacjê schematu; nara¿amy siê przez to na utratê danych, opcja nadaje siê g³ównie do testowania i rozwoju
* create — tworzy schemat i strukturê, usuwaj¹c istniej¹ce dane
* create-drop — podobnie jak create tworzy schemat i strukturê usuwaj¹c istniej¹ce dane, ale przy zamykaniu aplikacji automatycznie usuwa ca³¹ zawartoœæ u¿ywanej bazy danych
			
	
Bazê danych MySQL mo¿esz pobraæ z https://www.mysql.com/downloads/, 
	
Mo¿esz u¿yæ innej bazy danych, w tym celu w pliku pom.xml zamiast:
```
<dependency>
		<groupId>mysql</groupId>
		<artifactId>mysql-connector-java</artifactId>
		<scope>runtime</scope>
</dependency>
```
	
znajdz i uzupe³nij connector java dla twojej bazy danych
	
### 4. Uruchomiæ, 
Aby uruchomiæ aplikacjê nale¿y uruchomiæ metodê "Main()" z klasy "AirportTransferReservationApplication" w pakiecie "pl.fudalewski.ATR"
w trybie "Run AS" -> "Java Application", lub w IDE STS "Run AS" -> "Spring Boot App"
	

### 5. Aplikacja Web uruchomiona, dostêpna w przegl¹darce pod adresem:

http://localhost:8080/admin
	