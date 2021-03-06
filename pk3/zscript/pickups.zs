class Password : Weapon {
	default{
	Inventory.PickupMessage "Picked up a note";
	weapon.selectionorder 50000;
	Weapon.SlotNumber 0;
	radius 64;
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