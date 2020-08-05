version "2.5"

///////////////////////ACTORES///////////////////////////
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