
## tabel aanmaken


- click nu op `m4prog` om het schema te openen
 > ![](img/schema.PNG)

- vul nu `huisdieren` in als `table name`
 > ![](img/createtable.PNG)

- nu zie je een groot scherm
> ![](img/grootscherm.PNG)

> - elke rij is 1 `colom`
>   - `colommen` zijn `eigenschappen` van het `ding` wat in de `table` komt
> voor onze huisdieren gebruiken we de `volgende` eigenschappen:
>   - `naam`
>   - `eigennaar`
>   - `typedier`
>   - `leeftijd`
>   - `geboortedatum`

- dat zijn 5 eigenschappen we hebben maar 4 rijen:
    - click op `GO` achter `Add`
    > ![](img/colomadd.PNG)
    - doe dat nu nog 1 keer, want we hebben nog 1 eigenschap:
        - de `id` van de `rij` in de `tabel`
            > dit noemen we de `primary key`
    
## eigenschappen maken

- kijk goed naar de wat waar ingevuld moet worden
    - de belangrijke voor nu zijn:
        > - `Name` (naam van de eigenschap)
        > - `Type` (wat voor soort data zit er in? denk nummers, zinnen, > datums?)
        > - `Length` (hoeveel data mag erin)
        > - `Null` (mag het veld leeg zijn, vaak is dit NEE dat mag niet)
        > - `A_I`, autogenerated voor primary keys en indices

- We beginnen met de ID:
    
    - vul onder `Name` *id* in
    - vul onder `Type` *INT* in
    - vink `A_I` aan    
    > ![](img/id.PNG)

## de rest

- laten we naam ook nog even samen doen:
    - vul onder `Name` naam in
    - vul onder `Type` varchar in
        > dit is een string (zin) van een variabele lengte
    - zet `Length` voor nu even op `150`
        > de naam mag nu maximaal `150` letters/cijfers (*characters*) bevatten
- maak nu voor de rest ook colommen aan:
>   - `eigennaar` (varchar van 150)
>   - `typedier` (varchar van 80)
>   - `leeftijd` (int)
>   - `geboortedatum` (date)

- check of het goed staat:
    > ![](img/totaal.PNG)
- click op save
    > ![](img/save.PNG)

- nu zie je het volgende:
    > ![](img/structure.PNG)

## uhmm wat als ik docker delete?

> dan raak je je table en data ook kwijt

- ga naar `export`
    > ![](img/export.PNG)
    - `druk` op de `export` knop    
        - je download nu een `sql file`
            > ![](img/download.PNG)
            - zet deze in je `sql` directory als `huisdieren.sql`
            > ![](img/folder.PNG)

## klaar?

- commit & push naar je git
            