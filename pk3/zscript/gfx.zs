class BigExplosionFast : Actor{
	default{
		Radius 16;
		Height 16;
		SeeSound "BOMB2";
		RenderStyle "Add";
		+ROLLSPRITE;
		+nogravity;
	}
	
	states{
		Spawn:
			NEXP AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 1 Bright{
				A_SetScale(scalex+0.15,scaley+0.15);
				A_SetRoll(roll+=0.45,0,0);
			}
			TNT1 A -1;
			Stop;
	}
}

class BigExplosion : Actor{
	default{
		Radius 16;
		Height 16;
		SeeSound "BOMB2";
		RenderStyle "Add";
		+ROLLSPRITE;
		+nogravity;
		speed 10;
	}
	
	states{
		Spawn:
			NEXP AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 2 Bright{
				A_SetScale(scalex+0.15,scaley+0.15);
				A_SetRoll(roll+=0.45,0,0);
			}
			NEXP AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 2 Bright{
				A_SetScale(scalex+0.15,scaley+0.15);
				A_SetRoll(roll+=0.45,0,0);
			}
			TNT1 A -1;
			Stop;
	}
}

class NoTanBigExplosion : Actor{
	default{
		Radius 16;
		Height 16;
		SeeSound "BOMB2";
		RenderStyle "Add";
		+ROLLSPRITE;
		+nogravity;
		speed 10;
	}
	
	states{
		Spawn:
			NEXP AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 2 Bright{
				A_SetScale(scalex+0.005,scaley+0.005);
				A_SetRoll(roll+=0.45,0,0);
			}
			NEXP AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 2 Bright{
				A_SetScale(scalex+0.005,scaley+0.005);
				A_SetRoll(roll+=0.45,0,0);
			}
			TNT1 A -1;
			Stop;
	}
}

class BiggerExplosion : Actor{
	default{
		Radius 16;
		Height 16;
		SeeSound "BOMB2";
		RenderStyle "Add";
		+ROLLSPRITE;
		+nogravity;
	}
	
	void NegShaderOn (){
		Cvar shader = CVar.findcvar("sigtagny2_shader");
		shader.SetInt(1);
	}
	
	void NegShaderOff (){
		Cvar shader = CVar.findcvar("sigtagny2_shader");
		shader.SetInt(0);
	}
	
	states{
		Spawn:
			NEXP A 2 Bright NegShaderOn;
			NEXP AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 2 Bright{
				A_SetScale(scalex+0.25,scaley+0.25);
				A_SetRoll(roll+=0.45,0,0);
			}
			NEXP AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 2 Bright{
				A_SetScale(scalex+0.25,scaley+0.25);
				A_SetRoll(roll+=0.45,0,0);
			}
			TNT1 A -1 NegShaderOff;
			Stop;
	}
}