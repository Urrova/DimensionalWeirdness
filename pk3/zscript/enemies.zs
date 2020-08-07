class Nucleardemon_Phase1 : Actor{
	default{
		Health 5000;
		Radius 40;
		Height 110;
		Mass 1000;
		Speed 16;
		PainChance 0;
		Monster;
		+BOSS;
		+MISSILEMORE;
		+MISSILEEVENMORE;
		
		SeeSound "cyber/sight";
	    PainSound "cyber/pain";
	    DeathSound "cyber/death";
	    ActiveSound "cyber/active";
	}
	
	states{
		Spawn:
			CYBR AB 10 A_Look;
			Loop;
		See:
			CYBR A 3 A_Hoof;
			CYBR ABBCC 3 A_Chase;
			CYBR D 3 A_Metal;
			CYBR D 3 A_Chase;
			Loop;
		Missile:
			CYBR E 6 A_FaceTarget;
			CYBR F 10 {
				for (int i = 0; i < 360; i+=5){
					A_SpawnProjectile("BaronBall",32.0,0,i+angle,CMF_ABSOLUTEANGLE);
				}
			}
			CYBR FFFFFFFFFF 10 A_SpawnProjectile("CellShooterProj");
			CYBR E 10 A_FaceTarget;
			CYBR FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF 1{
				A_SpawnProjectile("PlasmaBall",32.0,32.0);
				A_SpawnProjectile("PlasmaBall",32.0,-32.0);
			}
			
			CYBR E 10 A_FaceTarget;
			
			Goto See;
		Pain:
			CYBR G 10 A_Pain;
			Goto See;
		Death:
			
			CYBR I 10 A_Scream;
			CYBR JKL 10;
			CYBR M 10 A_NoBlocking;
			TNT1 A 0 A_SpawnItemEx("Nucleardemon_Phase2",0,0,0,0,0,0,angle,0,0,6002);
			Stop;
	}
}

class Nucleardemon_Phase2 : Actor{
	default{
		Health 5000;
		Radius 40;
		Height 110;
		Mass 1000;
		Speed 16;
		PainChance 0;
		Monster;
		+BOSS;
		+MISSILEMORE;
		+MISSILEEVENMORE;
		
		SeeSound "cyber/sight";
	    PainSound "cyber/pain";
	    DeathSound "cyber/death";
	    ActiveSound "cyber/active";
	}
	
	states{
		Spawn:
			CYBR AB 10 A_Look;
			Loop;
		See:
			CYBR A 3 A_Hoof;
			CYBR ABBCC 3 A_Chase;
			CYBR D 3 A_Metal;
			CYBR D 3 A_Chase;
			Loop;
		Missile:
			CYBR E 6 A_FaceTarget;
			CYBR F 10 {
				for (int i = 0; i < 360; i+=5){
					A_SpawnProjectile("BaronBall",32.0,0,i+angle,CMF_ABSOLUTEANGLE);
				}
			}
			CYBR FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF 2.5{
				A_SpawnProjectile("CacodemonBall",32.0,0,0+angle,CMF_ABSOLUTEANGLE);
				A_SpawnProjectile("CacodemonBall",32.0,0,90+angle,CMF_ABSOLUTEANGLE);
				A_SpawnProjectile("CacodemonBall",32.0,0,180+angle,CMF_ABSOLUTEANGLE);
				A_SpawnProjectile("CacodemonBall",32.0,0,270+angle,CMF_ABSOLUTEANGLE);
				angle+=10;
			}
			CYBR E 10 A_FaceTarget;
			CYBR FFFFFFFFFF 5{
				A_SpawnProjectile("Rocket",32.0,32.0);
				A_SpawnProjectile("Rocket",32.0,-32.0);
			}
			
			CYBR E 10 A_FaceTarget;
			
			Goto See;
		Pain:
			CYBR G 10 A_Pain;
			Goto See;
		Death:
			CYBR I 10 A_Scream;
			CYBR JKL 10;
			CYBR M 10 A_NoBlocking;
			TNT1 A 0 A_SpawnItemEx("Nucleardemon_Phase3",0,0,0,0,0,0,angle,0,0,6002);
			Stop;
	}
}


class Nucleardemon_Phase3 : Actor{
	default{
		Health 5000;
		Radius 40;
		Height 110;
		Mass 1000;
		Speed 16;
		PainChance 0;
		Monster;
		+BOSS;
		+MISSILEMORE;
		+MISSILEEVENMORE;
		+FLOAT;
		+NOGRAVITY;
		
		SeeSound "cyber/sight";
	    PainSound "cyber/pain";
	    DeathSound "cyber/death";
	    ActiveSound "cyber/active";
	}
	
	states{
		Spawn:
			CYBR A 35 ThrustThingZ(0,30,0,0);
			CYBR A 0 A_Jump(256, "bucle");
		bucle:
			CYBR AB 10 A_Look;
			CYBR A 0 A_Jump(256, "bucle");
		See:
			CYBR A 3 A_Hoof;
			CYBR ABBCC 3 A_Chase;
			CYBR D 3 A_Metal;
			CYBR D 3 A_Chase;
			Loop;
		Missile:
			CYBR E 6 A_FaceTarget;
			CYBR F 10 {
				for (int i = 0; i < 360; i+=5){
					A_SpawnProjectile("BaronBall",32.0,0,i+angle,CMF_ABSOLUTEANGLE);
				}
			}
			CYBR E 6 A_FaceTarget;
			CYBR E 10 A_SpawnProjectile("NukeRocket");
			
			Goto See;
		Pain:
			CYBR G 10 A_Pain;
			Goto See;
		Death:
			CYBR H 10;
			CYBR I 10 A_Scream;
			CYBR J 10{
			A_SpawnItem("BiggerExplosion");
			
			for (int i = 0; i < 360; i+=5){
				A_SpawnProjectile("NoTanBigExplosion",32.0,0,i,CMF_AIMDIRECTION);
			}
			}
			CYBR M 10 A_NoBlocking;
			CYBR NO 10;
			CYBR P 30;
			CYBR P -1 A_BossDeath;
			Stop;
	}
}