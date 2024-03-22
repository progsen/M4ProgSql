## Table alias

Voordat we aan joins beginnen moeten we wat leren over aliassen.

voorbeeld:
```SQL
SELECT * FROM `huisdieren` HD WHERE HD.id =1; 
```

- bekijk de query en lees het onderstaande:
> - Hierboven zien we *`huisdieren` HD* staan
> - HD is nu een naam van de tabel `huisdieren` geworden
> - als we `HD.` typen krijgen we nu `altijd` de `kolommen` van de tabel `huisdieren`
> - dit is belangrijk als we 2 tabellen in 1 keer gaan selecteren:
>   - als 2 tabellen alletwee een `id` hebben wat dan? Dat werkt niet

## Tabel maken voor het voorbeeld:

- run de volgende sql:

```SQL
CREATE TABLE `persoon` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `hobbyid` int(11) NOT NULL,
  `naam` varchar(150) NOT NULL,
  UNIQUE INDEX `persoonid_UNIQUE` (`id` ASC) VISIBLE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `hobby` (
  `hobbyid` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `hobby` varchar(150) NOT NULL,
  UNIQUE INDEX `hobbyid_UNIQUE` (`hobbyid` ASC) VISIBLE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `hobby` ( `hobbyid`,`hobby`) VALUES (1,"gamen");
INSERT INTO `persoon` ( `naam`,`hobbyid`) VALUES ("leraar",1);
```

- nu heb je 2 tabllen erbij:
> ![](img/persoonhobby.PNG)

#### in 1 keer

- we gaan hobby en persoon in 1 keer selecteren:
    - dat doen we door `hobbyid` uit `persoon` aan `hobbyid` van `hobby` te koppelen:
        ```SQL
         SELECT * FROM `hobby` join persoon on hobbyid = hobbyid;
        ```