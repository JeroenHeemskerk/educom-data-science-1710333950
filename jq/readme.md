### 1. Zoals je in de manual kunt lezen, kun je ook rekenen in je queries. Schrijf een query die de bevolkingsdichtheid in 1970 voor ieder land berekent.

```
jq '.[] | {country: .country, population_density_1970: (.population_1970 / .area_km2)}| [.country, .population_density_1970] ' < world-population.json
```

```json

[ ...]
[
  "Algeria",
  5.792365752615419
]
[... ]

```

### 2. Schrijf een query/verzin een oplossing die per continent de absolute bevolkingsgroei tussen 1970 en 2022 weergeeft.

```
$ jq 'group_by(.continent) | map({continent: .[0].continent, population_growth: ( (map(.population_2020) | add) - (map(.population_1970) | add) )})' < world-population.json
```

```json
[
  {
    "continent": "Africa",
    "population_growth": 995227462
  },
  {
    "continent": "Asia",
    "population_growth": 2518180245
  },
  {
    "continent": "Europe",
    "population_growth": 89868205
  },
  {
    "continent": "North America",
    "population_growth": 278801987
  },
  {
    "continent": "Oceania",
    "population_growth": 24453156
  },
  {
    "continent": "South America",
    "population_growth": 238582887
  }
]

```
### 3. Schrijf een query/verzin een oplossing die per continent de absolute aantallen per gegeven jaar weergeeft.
```
jq "group_by(.continent) | map({continent: .[0].continent, population_1970: map(.population_1970) | add, population_1980: map(.population_1980) | add, population_1990: map(.population_1990) | add, population_2000: map(.population_2000) | add, population_2010: map(.population_2010) | add, population_2020: map(.population_2020) | add})" < world-population.json
```

```json
[
  {
    "continent": "Africa",
    "population_1970": 365444348,
    "population_1980": 481536377,
    "population_1990": 638150629,
    "population_2000": 818946032,
    "population_2010": 1055228072,
    "population_2020": 1360671810
  },
  {
    "continent": "Asia",
    "population_1970": 2144906290,
    "population_1980": 2635334228,
    "population_1990": 3210563577,
    "population_2000": 3735089604,
    "population_2010": 4220041327,
    "population_2020": 4663086535
  },
  {
    "continent": "Europe",
    "population_1970": 655923991,
    "population_1980": 692527159,
    "population_1990": 720320797,
    "population_2000": 726093423,
    "population_2010": 735613934,
    "population_2020": 745792196
  },
  {
    "continent": "North America",
    "population_1970": 315434606,
    "population_1980": 368293361,
    "population_1990": 421266425,
    "population_2000": 486069584,
    "population_2010": 542720651,
    "population_2020": 594236593
  },
  {
    "continent": "Oceania",
    "population_1970": 19480270,
    "population_1980": 22920240,
    "population_1990": 26743822,
    "population_2000": 31222778,
    "population_2010": 37102764,
    "population_2020": 43933426
  },
  {
    "continent": "South America",
    "population_1970": 192947156,
    "population_1980": 241789006,
    "population_1990": 297146415,
    "population_2000": 349634282,
    "population_2010": 393078250,
    "population_2020": 431530043
  }
]

```

### 4. Schrijf een query/verzin een oplossing die per continent het percentage van de wereldbevolking van dat continent weergeeft.

Quick method

```
jq 'group_by(.continent) | map({ continent: .[0].continent, population_percentage: (map(.percentage_world_population) | add)  })' < world-population.json
```

```json
[
  {
    "continent": "Africa",
    "population_percentage": 17.869999999999997
  },
  {
    "continent": "Asia",
    "population_percentage": 59.19
  },
  {
    "continent": "Europe",
    "population_percentage": 9.33
  },
  {
    "continent": "North America",
    "population_percentage": 7.51
  },
  {
    "continent": "Oceania",
    "population_percentage": 0.55
  },
  {
    "continent": "South America",
    "population_percentage": 5.4799999999999995
  }
]
```

Percentages herberekenen
```
total=$(jq 'map(.population_2020) | add'< world-population.json)

```

### 5. Schrijf een query/verzin een oplossing die per continent het percentage groei ten opzichte van 1970 weergeeft.

```
jq 'group_by(.continent) | map({ continent: .[0].continent,  population_growth: ( ( (map(.population_2020) | add) - (map(.population_1970) | add) ) / (map(.population_1970) | add) * 100 * 100  | round / 100 ) }) '< world-population.json
```

```json
[
  {
    "continent": "Africa",
    "population_growth": 272.33
  },
  {
    "continent": "Asia",
    "population_growth": 117.4
  },
  {
    "continent": "Europe",
    "population_growth": 13.7
  },
  {
    "continent": "North America",
    "population_growth": 88.39
  },
  {
    "continent": "Oceania",
    "population_growth": 125.53
  },
  {
    "continent": "South America",
    "population_growth": 123.65
  }
]

```

### 6. Gebruik jq om een JSON-file naar een CSV-file om te zetten. Exporteer de resultaten van de vorige opdrachten naar een CVS-bestand. Lees deze bestanden vervolgens in een spreadsheet en maak grafieken van de data. 

#### 1

```
jq -r '.[] | [.country, (.population_1970 / .area_km2)] | @csv' < world-population.json > population_density_1970.csv
```

#### 2
```
jq -r 'group_by(.continent) | map({ continent: .[0].continent, population_growth: ((map(.population_2020) | add) - (map(.population_1970) | add))                                                                            }) | (.[0] | keys_unsorted) as $keys | $keys, map([.[ $keys[] ]])[] | @csv' < world-population.json > population_absolute_growth.csv   
```
#### 3

```
jq -r 'group_by(.continent) | map({continent: .[0].continent, population_1970: (map(.population_1970) | add), population_1980: (map(.population_1980) | add), population_1990: (map(.population_1990) | add), population_2000: (map(.population_2000) | add), population_2010: (map(.population_2010) | add), population_2020: (map(.population_2020) | add)}) | (.[0] | keys_unsorted) as $keys | $keys, map([.[ $keys[] ]])[] | @csv' < world-population.json > population_count.csv
```

#### 4

```
 jq -r 'group_by(.continent) | map({ continent: .[0].continent, population_percentage: (map(.percentage_world_population) | add)  }) | (.[0] | keys_unsorted) as $keys | $keys, map([.[ $keys[] ]])[] | @csv' < world-population.json > population_percentage.csv
```

#### 5

```
jq -r 'group_by(.continent) | map({ continent: .[0].continent,  population_growth: ( ( (map(.population_2020) | add) - (map(.population_1970) | add) ) / (map(.population_1970) | add) * 100 * 100  | round / 100 ) }) | (.[0] | keys_unsorted) as $keys |  $keys, map([.[ $keys[] ]])[] | @csv '< world-population.json > population_percentage_growth.csv
```

### 7. Schrijf een query/verzin een oplossing die de data uit world-population.json omzet naar de volgende structuur:

```
jq 'map({rank, cca3, country, capital, continent, population: [{year: 2022, population: .population_2022}, {year: 2020, population: .population_2020}, {year: 2015, population: .population_2015}, {year: 2010, population: .population_2010}, {year: 2000, population: .population_2000}, {year: 1990, population: .population_1990}, {year: 1980, population: .population_1980}, {year: 1970, population: .population_1970}], area_km2, population_density, population_growth_rate, percentage_world_population})' world-population.json
```
```json
[
  {...},
  {
    "rank": 74,
    "cca3": "ZWE",
    "country": "Zimbabwe",
    "capital": "Harare",
    "continent": "Africa",
    "population": [
      {
        "year": 2022,
        "population": 16320537
      },
      {
        "year": 2020,
        "population": 15669666
      },
      {
        "year": 2015,
        "population": 14154937
      },
      {
        "year": 2010,
        "population": 12839771
      },
      {
        "year": 2000,
        "population": 11834676
      },
      {
        "year": 1990,
        "population": 10113893
      },
      {
        "year": 1980,
        "population": 7049926
      },
      {
        "year": 1970,
        "population": 5202918
      }
    ],
    "area_km2": 390757,
    "population_density": 41.7665,
    "population_growth_rate": 1.0204,
    "percentage_world_population": 0.2
  }
]

```

### 8. Bedenk een manier om de informatie uit ``world-population.json`` in een MySQL database op te nemen. Normaliseer de data aan de hand van "Codd" en formateer de data met behulp van ``jq``.

De population density, growth, en percentage world population hoeven niet in het database worden opgeslagen.
Die kunnen herberekend worden.

Ik zou de volgende tabellen maken
```mermaid
erDiagram
  Country{
  int id PK
  int rank
  varchar country UK
  varchar continent
  char(3) cca3 UK
  varchar capital
  int area_km2
  int continent_id FK
  }
  
  
  Population{
  int id pk
  char(3) cca3 FK 
  int 1970_pop
  int 1980_pop
  int 1990_pop
  int 2000_pop
  int 2010_pop
  int 2020_pop
  int 2022_pop
  }
 
```

#### Country

Ik wil een id vast zette zodat beide country en population die kunnen gebruiken
Rank kan hiervoor worken

```
jq -r '.[] | [.rank, .rank, .cca3, .country, .capital, .continent, .area_km2] | @csv' < world-population.json > countries.csv
```

#### Population
``` 
jq -r 'map({id: "null, country_id: .rank , pop_2022: .population_2022, pop_2020: .population_2020, pop_2010: .population_2010, pop_2000: .population_2000, pop_1990: .population_1990, pop_1980: .population_1980, pop_1970: .population_1970}) | (.[0] | keys_unsorted | @csv), (.[] | [.[]] | @csv)' world-population.json > population.csv
```

