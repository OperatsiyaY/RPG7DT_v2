class RPGAddAnimActor extends Actor;
var KFWeapon W;

simulated function PostBeginPlay()
{
	SetTimer(0.5,true);
	Super.PostBeginPlay();
}

simulated function Timer()
{
	if(W.Instigator!=None && !W.Instigator.HasAnim('Reload_RPG_Y'))
	{
		W.Instigator.LinkSkelAnim(MeshAnimation'RPG7DTv2_A.Soldier_RPG7DT_anims');
		Log("RPGAddAnimActor.Timer"@W.Instigator@W.Instigator.HasAnim('Reload_RPG_Y'));
		SetTimer(0,false);
		Destroyed();
		Destroy();
	}
}