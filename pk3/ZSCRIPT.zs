version "2.5"

///////////////////////PICKUPS///////////////////////////
class Password : Weapon {
	default{
	Inventory.PickupMessage "Picked up a note";
	weapon.selectionorder 50000;
	Weapon.SlotNumber 0;
	}
	states{
		Select:
		 PASS A 1 A_Raise;
		 loop;
		Deselect:
		 PASS A 1 A_Lower;
		 loop;
		Ready:
		 PASS A 1 A_WeaponReady;
		 loop;
		Fire:
		 PASS A 1;
		 Goto Ready;
		Spawn:
		 PAST A -1;
		 stop;
	}
}

class JetPack : CustomInventory {
  default{
	  Inventory.PickupMessage "A jetpack! Now you can fly.";
	  Inventory.PickupSound "misc/p_pkup";
	  +COUNTITEM
  }
  states{
  Spawn:
    JTPK A -1;
    stop;
  Pickup:
    TNT1 A 0 SetPlayerProperty(0,1,PROP_FLY); //Activa la propiedad del jugador PROP_FLY (tipo el ccmd fly)
    TNT1 A 0 A_GiveInventory ("armorbonus",0,0); //Si o si le tengo que dar algo al jugador pa que el item desaparezca
    stop;
  }
}

////////////////////////////ENEMIGOS//////////////////////////////////////

///////NUCLEARDEMON

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
			CYBR H 10;
			CYBR I 10 A_Scream;
			CYBR JKL 10;
			CYBR M 10 A_NoBlocking;
			CYBR NO 10;
			CYBR P 30;
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
			CYBR H 10;
			CYBR I 10 A_Scream;
			CYBR JKL 10;
			CYBR M 10 A_NoBlocking;
			CYBR NO 10;
			CYBR P 30;
			TNT1 A 0 A_SpawnItemEx("Nucleardemon_Phase3",0,0,0,0,0,0,angle,0,0,6001);
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
			CYBR H 10;
			CYBR I 10 A_Scream;
			CYBR JKL 10;
			CYBR M 10 A_NoBlocking;
			CYBR NO 10;
			CYBR P 30;
			CYBR P -1 A_BossDeath;
			Stop;
	}
}

////////////////////////////PROYECTILES///////////////////////////////////

class SlowPlasmaBall : DoomImpBall{
	default{
		speed 5;
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
			}
			TNT1 A -1;
			stop;
		
	}
}

class NukeRocket : Rocket{
	default{
		Scale 8;
		Speed 40;
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
			MISL B 8 Bright NegShaderOn;
			MISL C 6 Bright;
			MISL D 4 Bright;
			TNT1 A 10 NegShaderOff;
			Stop;
	}
}

////////////////////////////EFECTOS///////////////////////////////////////

class BigExplosion : Actor{
	default{
		Radius 16;
		Height 16;
		SeeSound "BOMB2";
		+ROLLSPRITE;
	}
	
	states{
		Spawn:
			MISL BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB 2 {
				A_SetScale(scalex+0.15,scaley+0.15);
				A_SetRoll(roll+=0.45,0,0);
			}
			MISL BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB 2 {
				A_SetScale(scalex+0.15,scaley+0.15);
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
		+ROLLSPRITE;
	}
	
	states{
		Spawn:
			MISL BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB 2 {
				A_SetScale(scalex+0.25,scaley+0.25);
				A_SetRoll(roll+=0.45,0,0);
			}
			MISL BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB 2 {
				A_SetScale(scalex+0.25,scaley+0.25);
				A_SetRoll(roll+=0.45,0,0);
			}
			TNT1 A -1;
			Stop;
	}
}


/////////////////////////EVENT HANDLERS///////////////////////////////

//Handler de los shaders, para el shader negativo
class ShaderHandler : StaticEventHandler {
	override void RenderOverlay(RenderEvent e) {
		PlayerInfo p = players[consoleplayer];
		if (CVar.GetCVar("SIGTAGNY2_Shader", p).GetInt() == 1) {
			Shader.SetEnabled(p, "NegativeShader", true);
			Shader.SetEnabled(p, "NegativeShader", true);
		}
		else{
			Shader.SetEnabled(p, "NegativeShader", false);
			Shader.SetEnabled(p, "NegativeShader", false);
		}
	}
}