CREATE DATABASE mlb_pitching;
USE mlb_pitching;

CREATE TABLE fastballs (
	name varchar(100),
    player_id INT,
    year INT,
    pa INT,
    pitch_hand varchar(100),
    arm_angle float,
    n_ff_formatted float,
    ff_avg_speed float,
    ff_avg_spin int,
    ff_avg_break_x float,
    ff_avg_break_z float,
    ff_avg_break_z_induced float,
    ff_avg_break float,
    ff_range_speed float
);
CREATE TABLE pitch_arsenal (
	name varchar(100),
    player_id int,
    team_name varchar(100),
    pitch_type varchar(100),
    pitch_name varchar(100),
    run_value_per_100 float,
    run_value int,
    pitches int,
    pitch_usage float,
    pa int,
    ba float,
    sig float,
    woba float,
    whiff_percent float,
    k_percent float,
    put_away float,
    est_ba float,
    est_sig float,
    est_woba float,
    hard_hit_percent float
);