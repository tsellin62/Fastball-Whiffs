USE mlb_pitching;

CREATE TABLE whiff AS
SELECT fastballs.*, pitch_arsenal.whiff_percent
FROM fastballs
INNER JOIN pitch_arsenal
ON fastballs.player_id = pitch_arsenal.player_id;