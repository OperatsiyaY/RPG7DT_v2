class RPGAttachment extends KFWeaponAttachment;

#exec OBJ LOAD FILE="..\Animations\RPG7DTv2_A.ukx"

//KF_Soldier_Trip.Soldier_Animations_Trip
var float nextT;
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
simulated event ThirdPersonEffects()
{
	if( FiringMode==1 )
		return;
	Super.ThirdPersonEffects();
}
//--------------------------------------------------------------------------------------------------
simulated function PostBeginPlay()
{
	super.PreBeginPlay();
	log("RPGAttachment PostBeginPlay -> LinkSkelAnim"@Instigator.Controller.PlayerReplicationInfo.PlayerName);
	PlayerController(Instigator.Controller).ClientMessage("RPG7 LinkSkelAnim");

	Instigator.LinkSkelAnim(MeshAnimation'RPG7DTv2_A.Soldier_RPG7DT_anims');
	KFPawn(Instigator).SetWeaponAttachment(self);
}
//--------------------------------------------------------------------------------------------------
simulated function Destroyed()
{
	super.Destroyed();
}
//--------------------------------------------------------------------------------------------------
simulated function Tick(float dt)
{
	local string S;
	super.Tick(dt);
	
	if (nextT < Level.Timeseconds)
	{
		S = "MovementAnims[0]"@KFPawn(Instigator).MovementAnims[0];
		PlayerController(Instigator.Controller).ClientMessage(S);
		
		S = "FireAnims[0]"@KFPawn(Instigator).FireAnims[0];
		PlayerController(Instigator.Controller).ClientMessage(S);

		//Instigator.PlayAnim('Reload_RPG_Y');
		Instigator.PlayAnim(KFPawn(Instigator).FireAnims[0]);
		
		nextT = Level.Timeseconds + 5.0;
	}
	
	/*log(KFPawn(Instigator).MovementAnims[0]);
	log(KFPawn(Instigator).MovementAnims[1]);
	log(KFPawn(Instigator).MovementAnims[2]);
	log(KFPawn(Instigator).MovementAnims[3]);
	log(KFPawn(Instigator).FireAnims[0]);
	log(KFPawn(Instigator).FireAnims[1]);
	log(KFPawn(Instigator).FireAnims[2]);
	log(KFPawn(Instigator).FireAnims[3]);*/
	
	/*
	KFPawn(Instigator).TurnLeftAnim = TurnLeftAnim;
	KFPawn(Instigator).TurnRightAnim = TurnRightAnim;
	KFPawn(Instigator).SwimAnims[0]= SwimAnims[0];
	KFPawn(Instigator).SwimAnims[1]= SwimAnims[1];
	KFPawn(Instigator).SwimAnims[2]= SwimAnims[2];
	KFPawn(Instigator).SwimAnims[3]= SwimAnims[3];
	KFPawn(Instigator).CrouchAnims[0]= CrouchAnims[0];
	KFPawn(Instigator).CrouchAnims[1]= CrouchAnims[1];
	KFPawn(Instigator).CrouchAnims[2]= CrouchAnims[2];
	KFPawn(Instigator).CrouchAnims[3]= CrouchAnims[3];
	KFPawn(Instigator).WalkAnims[0]= WalkAnims[0];
	KFPawn(Instigator).WalkAnims[1]= WalkAnims[1];
	KFPawn(Instigator).WalkAnims[2]= WalkAnims[2];
	KFPawn(Instigator).WalkAnims[3]= WalkAnims[3];
	KFPawn(Instigator).AirAnims[0]= AirAnims[0];
	KFPawn(Instigator).AirAnims[1]= AirAnims[1];
	KFPawn(Instigator).AirAnims[2]= AirAnims[2];
	KFPawn(Instigator).AirAnims[3]= AirAnims[3];
	KFPawn(Instigator).TakeoffAnims[0]= TakeoffAnims[0];
	KFPawn(Instigator).TakeoffAnims[1]= TakeoffAnims[1];
	KFPawn(Instigator).TakeoffAnims[2]= TakeoffAnims[2];
	KFPawn(Instigator).TakeoffAnims[3]= TakeoffAnims[3];
	KFPawn(Instigator).LandAnims[0]= LandAnims[0];
	KFPawn(Instigator).LandAnims[1]= LandAnims[1];
	KFPawn(Instigator).LandAnims[2]= LandAnims[2];
	KFPawn(Instigator).LandAnims[3]= LandAnims[3];
	KFPawn(Instigator).DoubleJumpAnims[0]= DoubleJumpAnims[0];
	KFPawn(Instigator).DoubleJumpAnims[1]= DoubleJumpAnims[1];
	KFPawn(Instigator).DoubleJumpAnims[2]= DoubleJumpAnims[2];
	KFPawn(Instigator).DoubleJumpAnims[3]= DoubleJumpAnims[3];
	KFPawn(Instigator).DodgeAnims[0]= DodgeAnims[0];
	KFPawn(Instigator).DodgeAnims[1]= DodgeAnims[1];
	KFPawn(Instigator).DodgeAnims[2]= DodgeAnims[2];
	KFPawn(Instigator).DodgeAnims[3]= DodgeAnims[3];
	KFPawn(Instigator).AirStillAnim = AirStillAnim;
	KFPawn(Instigator).TakeoffStillAnim = TakeoffStillAnim;
	KFPawn(Instigator).CrouchTurnRightAnim = CrouchTurnRightAnim;
	KFPawn(Instigator).CrouchTurnLeftAnim = CrouchTurnLeftAnim;
	KFPawn(Instigator).IdleCrouchAnim = IdleCrouchAnim;
	KFPawn(Instigator).IdleSwimAnim = IdleSwimAnim;
	KFPawn(Instigator).IdleWeaponAnim = IdleWeaponAnim;
	KFPawn(Instigator).IdleRestAnim = IdleRestAnim;
	KFPawn(Instigator).IdleChatAnim = IdleChatAnim;
	KFPawn(Instigator).FireAnims[0]=FireAnims[0];
	KFPawn(Instigator).FireAnims[1]=FireAnims[1];
	KFPawn(Instigator).FireAnims[2]=FireAnims[2];
	KFPawn(Instigator).FireAnims[3]=FireAnims[3];
	KFPawn(Instigator).FireAltAnims[0]=FireAltAnims[0];
	KFPawn(Instigator).FireAltAnims[1]=FireAltAnims[1];
	KFPawn(Instigator).FireAltAnims[2]=FireAltAnims[2];
	KFPawn(Instigator).FireAltAnims[3]=FireAltAnims[3];
	KFPawn(Instigator).FireCrouchAnims[0]=FireCrouchAnims[0];
	KFPawn(Instigator).FireCrouchAnims[1]=FireCrouchAnims[1];
	KFPawn(Instigator).FireCrouchAnims[2]=FireCrouchAnims[2];
	KFPawn(Instigator).FireCrouchAnims[3]=FireCrouchAnims[3];
	KFPawn(Instigator).FireCrouchAltAnims[0]=FireCrouchAltAnims[0];
	KFPawn(Instigator).FireCrouchAltAnims[1]=FireCrouchAltAnims[1];
	KFPawn(Instigator).FireCrouchAltAnims[2]=FireCrouchAltAnims[2];
	KFPawn(Instigator).FireCrouchAltAnims[3]=FireCrouchAltAnims[3];
	KFPawn(Instigator).HitAnims[0]=HitAnims[0];
	KFPawn(Instigator).HitAnims[1]=HitAnims[1];
	KFPawn(Instigator).HitAnims[2]=HitAnims[2];
	KFPawn(Instigator).HitAnims[3]=HitAnims[3];
	KFPawn(Instigator).PostFireBlendStandAnim = PostFireBlendStandAnim;
	KFPawn(Instigator).PostFireBlendCrouchAnim = PostFireBlendCrouchAnim;
*/	
}
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
defaultproperties
{

	// KFPawn->SetWeaponAttachment() 
	// simulated function SetWeaponAttachment(WeaponAttachment NewAtt)
	MovementAnims(0)="JogF_RPG_Y"
	MovementAnims(1)="JogB_RPG_Y"
	MovementAnims(2)="JogL_RPG_Y"
	MovementAnims(3)="JogR_RPG_Y"
	TurnLeftAnim="TurnL_RPG_Y"
	TurnRightAnim="TurnR_RPG_Y"
	CrouchAnims(0)=CHwalkF_RPG_Y
	CrouchAnims(1)=CHwalkB_RPG_Y
	CrouchAnims(2)=CHwalkL_RPG_Y
	CrouchAnims(3)=CHwalkR_RPG_Y
	//WalkAnims(0)=WalkF_RPG_Y_TEST
	WalkAnims(0)="WalkF_RPG_Y"
	WalkAnims(1)="WalkB_RPG_Y"
	WalkAnims(2)="WalkL_RPG_Y"
	WalkAnims(3)="WalkR_RPG_Y"
	CrouchTurnRightAnim=CH_TurnR_RPG_Y
	CrouchTurnLeftAnim=CH_TurnL_RPG_Y
	IdleCrouchAnim="CHIdle_RPG_Y"
	IdleWeaponAnim="Idle_RPG_Y"
	IdleRestAnim="Idle_RPG_Y"
	IdleChatAnim="Idle_RPG_Y"
	IdleHeavyAnim="Idle_RPG_Y"
	IdleRifleAnim="Idle_RPG_Y"
	FireAnims(0)="Fire_RPG_Y"
	FireAnims(1)="Fire_RPG_Y"
	FireAnims(2)="Fire_RPG_Y"
	FireAnims(3)="Fire_RPG_Y"
	FireAltAnims(0)="Fire_RPG_Y"
	FireAltAnims(1)="Fire_RPG_Y"
	FireAltAnims(2)="Fire_RPG_Y"
	FireAltAnims(3)="Fire_RPG_Y"
	FireCrouchAnims(0)="CHFire_RPG_Y"
	FireCrouchAnims(1)="CHFire_RPG_Y"
	FireCrouchAnims(2)="CHFire_RPG_Y"
	FireCrouchAnims(3)="CHFire_RPG_Y"
	FireCrouchAltAnims(0)="CHFire_RPG_Y"
	FireCrouchAltAnims(1)="CHFire_RPG_Y"
	FireCrouchAltAnims(2)="CHFire_RPG_Y"
	FireCrouchAltAnims(3)="CHFire_RPG_Y"
	HitAnims(0)="HitF_RPG_Y"
	HitAnims(1)="HitB_RPG_Y"
	HitAnims(2)="HitL_RPG_Y"
	HitAnims(3)="HitR_RPG_Y"
	PostFireBlendStandAnim="Blend_RPG_Y"
	PostFireBlendCrouchAnim="CHBlend_RPG_Y"
	bHeavy=True
	
	Mesh=SkeletalMesh'RPG7DTv2_A.RPG7_3rd'
	
	// mTracerClass=Class'RPG7DT.RPGTracer'
	// mTracerClass=Class'kfmod.KFNewTracer'
	
	// mMuzFlashClass=Class'RPG7DT.RGPFlashEmitter'
	// mMuzFlashClass=Class'RPG7DT.KFRpgMuzzFlash'
	mMuzFlashClass=Class'RPG7DT_v2.RGPBackFlashEmitter'
}
