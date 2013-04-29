class RPGMut extends Mutator;

function ModifyPlayer(Pawn Player)
{
     Super.ModifyPlayer(Player);
     Player.GiveWeapon("RPG7DT_v2.RPG");
}

defaultproperties
{
     bAddToServerPackages=True
     GroupName="KF-RPG7DT_v2"
     FriendlyName="RPG7DT_v2 Mutator"
     Description="Gives RPG7DT_v2 weapon to player."
}
