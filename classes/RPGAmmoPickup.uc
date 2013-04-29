//=============================================================================
// L.A.W Ammo Pickup.
//=============================================================================
class RPGAmmoPickup extends KFAmmoPickup;

defaultproperties
{
     AmmoAmount=4
     InventoryType=Class'RPG7DT_v2.RPGAmmo'
     PickupMessage="Вы подняли гранаты ПГ-7"
	 DrawType=DT_StaticMesh
     StaticMesh=StaticMesh'KillingFloorStatics.LAWAmmo'
     DrawScale=0.500000
     CollisionRadius=40.000000
	 CollisionHeight=10.000000
}
