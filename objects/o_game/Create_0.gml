global.a = keyboard_check(ord("A"));
global.d = keyboard_check(ord("D"));
global.w = keyboard_check(ord("W"));
global.s = keyboard_check(ord("S"));
yy = 15;

spd = 2;
ospd = spd;
gameoverRanSpin = random_range(-1,1);

depth = -0;

distance = 0;
enemySep = 50; 

audio_play_sound(sd_drivemusic,1,1);
global.gameOver = false;

time = 0;
points = 0;

untilRestart = 0;
trueSpd = spd;
spdControl = 0;

distance2 = 0;
dropSep =  60;
promptRetry = false;

fx_speed = 0;