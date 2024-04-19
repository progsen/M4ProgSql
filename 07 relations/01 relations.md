## relaties tussen tabellen

>Als 2 tabellen naar elkaar wijzen of iets met elkaar te maken hebben willen we een `relatie` leggen.
>- dit houdt de data schoon  
> laten we dat eens gaan proberen

- maak een nieuwe file aan:
    - `07 relaties.sql`

## voorbereiden

laten we een voedsel product tabel maken.
- maak de tabel `voedselProduct` met colommen:
    - id 
        - *INT (AUTO_INCREMENT)*
    - hoofdIngredientId 
        - *(INT)*
    - naam 
        - *VARCHAR(250)*
- maak nu een tabel `ingredient` met colommen:
    - id 
        - *INT (AUTO_INCREMENT)*
    - naam 
        - *VARCHAR(250)*

- bedenk zelf (hoef je niet op te schrijven):
    - welke relatie hebben deze twee tabellen/dingen?

## data

voer de volgende SQL uit zodat er data in de tabel zit:
```SQL

insert into ingredient (id,naam) values 
(1,'pindas');

insert into voedselProduct (hoofdIngredientId,naam) values 
(1,'pindakaas');
```

## klaar?

- commit & push naar je git