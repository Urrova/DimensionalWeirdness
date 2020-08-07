class SlowPlasmaBall : DoomImpBall{
	default{
		speed 5;
	}
}

class FastPlasmaBall : DoomImpBall{
	default{
		speed 20;
	}
}

class CellShooterProj : Actor{
	default{
	height 20;
	radius 10;
	damage 30;
	speed 15;
	renderstyle "add";
	alpha 0.75;
	PROJECTILE;
	SeeSound "SHOOT";
	}
	states{
		Spawn:
			CSPJ AB 5 bright;
			loop;
		Death:
			CSPJ A 1{
				angle = 0;
				while (angle <=360){
					A_SpawnProjectile("SlowPlasmaBall",0,0,angle);
					A_SpawnProjectile("DoomImpBall",0,0,angle);
					angle = angle+30;
				}
				
				angle = 0;
				while (angle <=360){
					A_SpawnProjectile("SlowPlasmaBall",0,0,angle,CMF_ABSOLUTEPITCH ,-30);
					A_SpawnProjectile("DoomImpBall",0,0,angle,CMF_ABSOLUTEPITCH ,-30);
					angle = angle+30;
				}
				
				angle = 0;
				while (angle <=360){
					A_SpawnProjectile("SlowPlasmaBall",0,0,angle,CMF_ABSOLUTEPITCH ,30);
					A_SpawnProjectile("DoomImpBall",0,0,angle,CMF_ABSOLUTEPITCH ,30);
					angle = angle+30;
				}
			}
			TNT1 A -1;
			stop;
		Crash:
			CSPJ A 1{
				angle = 0;
				while (angle <=360){
					A_SpawnProjectile("SlowPlasmaBall",0,0,angle);
					A_SpawnProjectile("DoomImpBall",0,0,angle);
					angle = angle+30;
				}
				
				angle = 0;
				while (angle <=360){
					A_SpawnProjectile("SlowPlasmaBall",0,0,angle,CMF_ABSOLUTEPITCH ,-30);
					A_SpawnProjectile("DoomImpBall",0,0,angle,CMF_ABSOLUTEPITCH ,-30);
					angle = angle+30;
				}
			}
			TNT1 A -1;
			stop;
	}
}

class NukeRocket : Rocket{
	default{
		Scale 5;
		Speed 40;
		Damage 500;
		SeeSound "SHOOT";
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
		Death:
			MISL B 8 Bright{
				NegShaderOn();
				A_SpawnItemEx("BigExplosionFast");
			}
			MISL C 6 Bright{
			
				for (int i = 0; i < 360; i += 10){
					A_SpawnProjectile("FastPlasmaBall",0,0,i,CMF_AIMDIRECTION);
				}
			
				for (int i = 0; i < 360; i += 5){
					A_SpawnProjectile("SlowPlasmaBall",0,0,i,CMF_AIMDIRECTION);
					A_SpawnProjectile("DoomImpBall",0,0,i,CMF_AIMDIRECTION);
				}
				
				
				for (int i = 0; i < 360; i += 10){
					A_SpawnProjectile("FastPlasmaBall",0,0,i,CMF_ABSOLUTEPITCH ,-30);
				}
			
				for (int i = 0; i < 360; i += 5){
					A_SpawnProjectile("SlowPlasmaBall",0,0,i,CMF_ABSOLUTEPITCH ,-30);
					A_SpawnProjectile("DoomImpBall",0,0,i,CMF_ABSOLUTEPITCH ,-30);
				}
				
				for (int i = 0; i < 360; i+=90){
					A_SpawnProjectile("CellShooterProj",0,0,i);
				}
				
			}
			MISL D 4 Bright;
			TNT1 A 10 NegShaderOff();
			Stop;
	}
}