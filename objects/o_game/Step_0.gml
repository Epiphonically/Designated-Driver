if (global.gameOver = true) {
	o_player.hp = 0;
    spd = lerp(o_game.spd,0,1/(ospd*4));
    o_player.image_angle += (gameoverRanSpin*ospd/2);
    gameoverRanSpin = lerp(gameoverRanSpin,0,0.05);
	if (untilRestart = 0) { audio_play_sound(sd_gameover,1,0);}
    untilRestart++;
	audio_stop_sound(sd_drivemusic);
    if (untilRestart == 60 * 3) {
        promptRetry = true;
    }
} else {
    var spdDelta = global.w - global.s;
    spd = ((0.5 * trueSpd) * spdDelta) + trueSpd;
    ospd = spd;
    time++;
    if (time == 60) {
		if global.w points+=4;
		if global.s points-=2;
        points += 1;
        time = 0;
    }
}