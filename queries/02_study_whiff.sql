USE mlb_pitching;

SELECT AVG(whiff_percent) as avg_whiff
FROM whiff;
-- avg_whiff = 20.518604655598484

SELECT name, ff_avg_speed, whiff_percent
FROM whiff
ORDER BY ff_avg_speed DESC LIMIT 10;
/*
	Skenes, Paul	98.2	29.6
	Alcantara, Sandy	97.7	17
	Skubal, Tarik	97.6	28.7
	deGrom, Jacob	97.5	21.5
	Cease, Dylan	97.1	25.7
	Baz, Shane	97	23.5
	Williams, Gavin	96.6	23.3
	Brown, Hunter	96.6	29.8
	Luzardo, Jesus	96.5	19.8
	Crochet, Garrett	96.4	30.5
*/

SELECT name, ff_avg_break, whiff_percent
FROM whiff
ORDER BY ff_avg_break DESC LIMIT 10;
/*
	Rodon, Carlos	20.8	21.5
	Pepiot, Ryan	20.7	25.4
	Gausman, Kevin	20.2	16.9
	Ray, Robbie	20.1	23.5
	Pivetta, Nick	20.1	25.3
	Springs, Jeffrey	19.8	15.4
	Kremer, Dean	19.7	15.9
	Baz, Shane	19.5	23.5
	Alcantara, Sandy	19.4	17
	Wacha, Michael	19.3	17.1
*/

SELECT name, ff_avg_spin, whiff_percent
FROM whiff
ORDER BY ff_avg_spin DESC LIMIT 10;
/*
	Warren, Will	2573	23.2
	Pfaadt, Brandon	2569	20.7
	Cease, Dylan	2550	25.7
	deGrom, Jacob	2519	21.5
	Gray, Sonny	2502	19.1
	Crochet, Garrett	2459	30.5
	Baz, Shane	2456	23.5
	Peralta, Freddy	2441	22.8
	Pepiot, Ryan	2413	25.4
	Freeland, Kyle	2404	11.6
*/


SELECT velo_qrt, COUNT(*) AS pitcher_count, ROUND(AVG(ff_avg_speed), 1) AS avg_velo, ROUND(AVG(whiff_percent), 1) as avg_whiff
FROM (
	SELECT name, ff_avg_speed, whiff_percent, 
    NTILE(4) OVER (ORDER BY ff_avg_speed DESC) AS velo_qrt
	FROM whiff
) AS quartiles
GROUP BY velo_qrt
ORDER BY velo_qrt ASC;
/*
q   #   velo    whiff
1	11	97	    24.7
2	11	94.9	19.9
3	11	93.5	19.4
4	10	92.1	17.9
*/

SELECT break_qrt, COUNT(*) AS pitcher_count, ROUND(AVG(ff_avg_break), 1) AS avg_break, ROUND(AVG(whiff_percent), 1) as avg_whiff
FROM (
	SELECT name, ff_avg_break, whiff_percent,
    NTILE(4) OVER (ORDER BY ff_avg_break DESC) AS break_qrt
    FROM whiff
) AS quartiles
GROUP BY break_qrt
ORDER BY break_qrt ASC;
/*
	q   #   brk	    whiff
	1	11	19.9	19.3
	2	11	18.6	22.2
	3	11	17.8	21.9
	4	10	15.4	18.5
*/

SELECT spin_qrt, COUNT(*) AS pitcher_count, ROUND(AVG(ff_avg_spin), 1) AS avg_spin, ROUND(AVG(whiff_percent), 1) as avg_whiff
FROM (
	SELECT name, ff_avg_spin, whiff_percent,
    NTILE(4) OVER (ORDER BY ff_avg_spin DESC) AS spin_qrt
    FROM whiff
) AS quartiles
GROUP BY spin_qrt
ORDER BY spin_qrt ASC;
/*
	q   #   spin    whiff
	1	11	2480.9	21.9
	2	11	2332.5	19.9
	3	11	2272.2	21.8
	4	10	2153.5	18.3
*/

