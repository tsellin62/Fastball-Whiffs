# Fastball-Whiffs
Quick SQL Project to get experience with MySQL and Tableau and to explore how what factors cause MLB hitters to whiff on 4 Seam Fastballs
Data Sourced from Baseball Savant, whiff rate from their Pitch Arsenal Stats Leaderboard, and the rest from a custom leaderboard with just fastball data.
It features qualified pitchers with their 2025 stats.

## Initial Looks
I first calculated that average whiff rate across the pitchers was about 20.5%.
I looked at the top 10 pitchers from the dataset by velo, break, and spin rate. Below are the tables I queried.
It is clear from the first table that velocity is impactful. ALl but 2 pitchers from the top 10 have an above average whiff rate, with most being well above average.
Sandy Alcantara and Jesus Luzardo were outliers in how bad their whiff rate was while throwing fast.
It appears that break does not really impact whiff rate on fastballs all that much, as the top 10 pitchers by break are evenly split between above and below average whiff rate.
The spin rate appears to potentially have some impact as well, with an outlier in either direction as well. Garrett Crochet having an impressive 30.6% whiff rate, while Kyle Freeland only had an 11.6% whiff rate.
| Pitcher         | Velocity | Whiff |
| --------------- | -------: | ----: |
| Paul Skenes     |     98.2 |  29.6 |
| Sandy Alcantara |     97.7 |    17 |
| Tarik Skubal    |     97.6 |  28.7 |
| Jacob deGrom    |     97.5 |  21.5 |
| Dylan Cease     |     97.1 |  25.7 |
| Shane Baz       |     97.0 |  23.5 |
| Gavin Williams  |     96.6 |  23.3 |
| Hunter Brown    |     96.6 |  29.8 |
| Jesús Luzardo   |     96.5 |  19.8 |
| Garrett Crochet |     96.4 |  30.5 |

| Pitcher         |  Break  | Whiff % |
| --------------- | ------: | ------: |
| Carlos Rodón    |    20.8 |    21.5 |
| Ryan Pepiot     |    20.7 |    25.4 |
| Kevin Gausman   |    20.2 |    16.9 |
| Robbie Ray      |    20.1 |    23.5 |
| Nick Pivetta    |    20.1 |    25.3 |
| Jeffrey Springs |    19.8 |    15.4 |
| Dean Kremer     |    19.7 |    15.9 |
| Shane Baz       |    19.5 |    23.5 |
| Sandy Alcantara |    19.4 |      17 |
| Michael Wacha   |    19.3 |    17.1 |

| Pitcher         |   RPM   | Whiff % |
| --------------- | ------: | ------: |
| Will Warren     |    2573 |    23.2 |
| Brandon Pfaadt  |    2569 |    20.7 |
| Dylan Cease     |    2550 |    25.7 |
| Jacob deGrom    |    2519 |    21.5 |
| Sonny Gray      |    2502 |    19.1 |
| Garrett Crochet |    2459 |    30.5 |
| Shane Baz       |    2456 |    23.5 |
| Freddy Peralta  |    2441 |    22.8 |
| Ryan Pepiot     |    2413 |    25.4 |
| Kyle Freeland   |    2404 |    11.6 |

## Quartiles
I separated the pitchers into quartiles again by velo, break, and spin rate, and then compared the average whiff rate across the quartiles. Below are the tables I queried.
The top quartile of pitchers by velocity had a very above average whiff rate, while the other quartiles had decreasing and below average whiff rates.
For break and spin, the wuartiles and whiff rates appear pretty unrelated, with no obvious trend. From this data, it appears that velocity is the main factor that influences 
the whiff rate on 4 seam fastballs.

| Quartile | Count | Velocity | Whiff % |
| -------- | ----: | -------: | ------: |
| 1        |    11 |     97.0 |    24.7 |
| 2        |    11 |     94.9 |    19.9 |
| 3        |    11 |     93.5 |    19.4 |
| 4        |    10 |     92.1 |    17.9 |

| Quartile | Count | Break | Whiff % |
| -------- | ----: | ----: | ------: |
| 1        |    11 |  19.9 |    19.3 |
| 2        |    11 |  18.6 |    22.2 |
| 3        |    11 |  17.8 |    21.9 |
| 4        |    10 |  15.4 |    18.5 |

| Quartile | Count |   Spin | Whiff % |
| -------- | ----: | -----: | ------: |
| 1        |    11 | 2480.9 |    21.9 |
| 2        |    11 | 2332.5 |    19.9 |
| 3        |    11 | 2272.2 |    21.8 |
| 4        |    10 | 2153.5 |    18.3 |

## Visual Representation
As mentioned above, I also wanted to get a little bit of experience with Tableau. However, I discovered that you cannot connect to a MySQL server from the free version
of Tableau. So, I exported the data as a csv and moved it in, which I am not thrilled with, but it's better than nothing. Then, I made the graph that is linked below. Visually, there is a
strong trend indicating that as fastball velocity goes up, so does whiff rate. A photo of the graph is also attached in the repo.  
[https://public.tableau.com/views/Fastballs_17794062559450/Velo?:language=en-US&:sid=&:redirect=auth&publish=yes&showOnboarding=true&:display_count=n&:origin=viz_share_link](url)

## Next Steps
While I did this as just a quick afternoon project to have some fun in SQL, there are obviously more steps if I want to really say something about this. I would say that I might take it into python and run a logistic regression to find how significant each factor is. I should also expand my dataset to other seasons. It would be interesting to have pitch by pitch data for all of these things to try to predict a whiff. I may pick this up again in the future. I had a lot of fun doing this one, as I heavily enjoy working with SQL stuff. I had been doing a bunch of SQL practice questions for fun and decided I should actually do something real, and this helped me learn a lot more and actually apply what I know.

