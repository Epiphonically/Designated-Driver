if (!global.gameOver) {
    switch (other.dropType) {
        case 0:
            hp = clamp(hp + 20, 0, maxhp);
            instance_destroy(other);
        break;
        
        case 1:
            o_game.trueSpd += 0.1;
            instance_destroy(other);
        break;
        
        case 2:
            o_game.points += 25;
            instance_destroy(other);
        break;
        case 3:
			 wobble = 1;
             instance_destroy(other);
        break;
        
        case 4:
            oCamera.boost = 180;
            oCamera.timer = 60 * 5;
            instance_destroy(other);
        break;
    }
}