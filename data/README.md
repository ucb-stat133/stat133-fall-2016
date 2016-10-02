## Data Sets

This folder contains most of the data sets used in lab sections and 
homework assignments.

-----

### `usa-states.RData`

Data stored in R binary format containing information about
the states and territories of the US.

- `state` (names of the States)
- `capital` (names of the capitals)
- `area` (total area in km2)
- `water` (water area in km2)
- `seats` (number of house seats)

Source: [https://en.wikipedia.org/wiki/List_of_states_and_territories_of_the_United_States](https://en.wikipedia.org/wiki/List_of_states_and_territories_of_the_United_States)

-----

### `cereals.RData`

Data stored in R binary format on several variables of different brands of cereal.

- `cereals` (names of cereals)
- `brands` (name of manufacturer)
- `calories` (number of calories)
- `sugars` (amount of sugar in grams)
- `shelfs` (display shelf: 1, 2, or 3, counting from the floor)

Source: [http://lib.stat.cmu.edu/DASL/Datafiles/Cereals.html](http://lib.stat.cmu.edu/DASL/Datafiles/Cereals.html)

-----

### `camping-tents.csv`

Data set of camping tents (stored in csv format) with the following variables:

- `name` (name of tent)
- `brand` (name of brand)
- `price` (price in dollars)
- `weight` (weights in grams)
- `height` (height in centimeters)
- `bestuse` (recommended use)
- `seasons` (number of seasons)
- `capacity` (sleep capacity)

Source: [REI](https://www.rei.com/b/rei/c/tents)

-----

### `bike-accidents.csv`

Data set of bike accidents in the bay area (stored in csv format) with the following variables:

- `Date`
- `Year`
- `Month`
- `Time`
- `Hour`
- `Street1`
- `Street2`
- `AtFault`
- `SecondVehicle`
- `Fatalities`
- `Violation`
- `HitRun`
- `County`
- `City`
- `Lighting`
- `RoadSurface`
- `Injured`

Source: 2011 The Bay Citizen’s Bike Accident Tracker 2.0 (No longer available)

-----

### `moible-food.csv`

Data set Mobile Food Schedule (stored in csv format) with the following variables:

- `DayOfWeekStr` (day of the week)
- `starttime` (starting time)
- `endtime` (end time)
- `PermitLocation` (address of permite location)
- `optionaltext` (description of the local and food)
- `ColdTruck` (whether it is a cold truck)
- `Applicant` (name of applicant)
- `Location` (latitude and longitude)

Source: [https://data.sfgov.org/Economy-and-Community/Mobile-Food-Schedule/jjew-r69b](https://data.sfgov.org/Economy-and-Community/Mobile-Food-Schedule/jjew-r69b)

-----

### `womens-high-jump-records.csv`

Data set of Women's High Jump World Records (as of Sep 2016), stored in csv format, 
with the following variables:

- `height` (record in meters)
- `first` (first name)
- `last` (last name)
- `country` (name of country)
- `day` (day of month, from record's date)
- `month` (name of month, from record's date)
- `year` (date year, from record's date)

Source: [https://en.wikipedia.org/wiki/Women%27s_high_jump_world_record_progression](https://en.wikipedia.org/wiki/Women%27s_high_jump_world_record_progression)

-----

### `womens-high-jump-raw.csv`

Raw data set of Women's High Jump World Records (as of Sep 2016), stored in csv format, 
with the following variables:

"Height","Athlete","Date","Place"

- `Height` (record in meters)
- `Athlete` (name of athlete and country)
- `Date` (date in format %d %B %Y)
- `Place` (name of city with numbers inside brackets)

Source: [https://en.wikipedia.org/wiki/Women%27s_high_jump_world_record_progression](https://en.wikipedia.org/wiki/Women%27s_high_jump_world_record_progression)

-----

### `mens-high-jump-raw.csv`

Raw data set of Men's High Jump World Records (as of Sep 2016), stored in csv format, 
with the following variables:

"Height","Athlete","Date","Place"

- `Height` (record in meters)
- `Athlete` (name of athlete and country)
- `Venue` (name of city, and sometimes state)
- `Date` (date in format %d %B %Y, with numbers inside brackets)

Source: [https://en.wikipedia.org/wiki/Men%27s_high_jump_world_record_progression](https://en.wikipedia.org/wiki/Men%27s_high_jump_world_record_progression)

-----
