class RPGBackpackProj extends Nade;

#exec OBJ LOAD FILE=kf_generic_sm.usx
#exec OBJ LOAD FILE=Asylum_SM.usx
#exec OBJ LOAD FILE=Asylum_T.utx

function TakeDamage( int Damage, Pawn InstigatedBy, Vector Hitlocation, Vector Momentum, class<DamageType> damageType, optional int HitIndex)
{
	//nope
}

simulated function PostBeginPlay()
{
	Super(Nade).PostBeginPlay();
}

simulated function Explode(vector HitLocation, vector HitNormal)
{
	bHasExploded = True;
	Destroy();
}


function PostNetBeginPlay()
{
	Super(Nade).PostNetBeginPlay();
	Stick(Instigator,Instigator.Location);
}

simulated function Stick(actor HitActor, vector HitLocation)
{
	//local name NearestBone;
	//local float dist;
	local Rotator rot;
	local Vector loc;

	if (pawn(HitActor) != none)
	{
		//NearestBone = GetClosestBone(HitLocation, HitLocation, dist , 'CHR_Neck' , 1 );
		HitActor.AttachToBone(self,'CHR_Spine3');
		
		//need to SetRelativeLocation and SetRelativeRotation so it doesn't point sideways out of their neck
		rot.Yaw=0;
		rot.Pitch=0; //-16384; looks 99% perfect
		rot.Roll=0; //6144; //+ is tilt wire towards player's back
		SetRelativeRotation(rot);
		
		loc.X=10; //+ is up, - is down
		loc.Y=0; //+ is back, - is front?
		loc.Z=-10; //+ is left, - is right
		SetRelativeLocation(loc);
	}
	//else
		//SetBase(HitActor);
}

defaultproperties
{
     Speed=1.000000
     MaxSpeed=1.000000
     StaticMesh=StaticMesh'RPG7DTv2_A.RPG7_backpack'
     Physics=PHYS_Projectile
     DrawScale=2.00000
     CollisionRadius=0.000000
     CollisionHeight=0.000000
	 ExplodeTimer=300.000000
     LifeSpan=301.000000
     //AmbientGlow=50
     bUnlit=False
     Damage=1.000000
     DamageRadius=1.000000
     //bDynamicLight=True
    // bFullVolume=True
     //SoundVolume=255
     //SoundRadius=400.000000
     bCollideActors=False
}
