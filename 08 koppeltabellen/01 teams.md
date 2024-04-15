## start

- maak een nieuwe file aan:
    - `07\koppel.sql`
    - kopieer je create tabel sql en je data sql uit  `05\teams.sql` naar deze file

## Teams

wij hadden team tabellen gemaakt toch?
deze waren wel leuk... alleen een teamlid kon maar in 1 team zitten

```SQL
insert into teamlid (voornaam,achternaam,teamid) values 
('mario','mario',1);
```

mario zit alleen in team 1!

## Meer op Meer


> het gebeurt vaak dat iets meerdere koppelingen kan hebben bv:
> - een teamlid mag in meerdere teams zitten
> hoe maken we dat?
> - een koppeltabel!

- we gaan een koppeltabel maken:
    - noem deze `teamlidv2_teamv2`
        - deze heeft:
            - een `teamid`
            - een `teamlidid`
- maak die tabel aan
    - gebruik de SQL hieronder:
    > dit is omdat de primary key ineens over 2 colommen gaat!
```SQL

CREATE TABLE `teamlidv2_teamv2` (
  --maak hier een kolom,
  --maak hier een kolom,
    PRIMARY KEY (`teamlidid`, `teamid`),
  UNIQUE INDEX `teamlid_team_UNIQUE` (`teamlidid` ASC,`teamid` ASC) VISIBLE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
```

## oude tabellen aanpassen

- haal uit `teamlid` de kolom:
    - `teamid`
- verander de naam `teamlid` naar `teamlidv2`
- verander de naam `team` naar `teamv2`
> de `V2` is even voor nu om het `makkelijk` te maken voor jullie, `normaal` pas je de tabel `gewoon aan`

## data

gebruik de volgende data:
```SQL

insert into teamv2 (id,teamnaam) values 
(1,'flowerpower'),
(2,'poisonshroom'),
(3,'goombas'),
(4,'the toad army');


insert into teamlidv2 (id,voornaam,achternaam) values 
(1,'mario','mario'),
(2,'luigi','mario'),
(3,'peach','?'),
(4,'toad','the one and only'),

(5,'kamek','the witch'),
(6,'waluigi','waa'),
(7,'wario','waa'),
(8,'bowser','the great');


insert into teamlidv2_teamv2 (teamlidid,teamid) values 
(1,1),
(2,1),
(3,1),
(4,1),

(5,2),
(6,2),
(7,2),
(8,2);
```

## klaar?

- commit & push naar je git