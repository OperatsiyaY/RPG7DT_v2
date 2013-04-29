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
	Stick();
}

simulated function Stick()
{
	local Rotator rot;
	local Vector loc;

	Instigator.AttachToBone(self,'CHR_Spine3');
		
	rot.Yaw=0;
	rot.Pitch=0; //-16384; //looks 99% perfect
	rot.Roll=0; // 6144; //+ is tilt wire towards player's back
	SetRelativeRotation(rot);
		
	loc.X=10; //+ is up, - is down
	loc.Y=0; //+ is back, - is front?
	loc.Z=-10; //+ is left, - is right
	SetRelativeLocation(loc);
}

simulated function UnStick()
{
	Instigator.DetachFromBone(Self);
	Explode(Location,VRand()*0.0); // ”ничтожаем объект
}

simulated function Tick(float DeltaTime)
{
/*
	if (MagAmmoRemaining == 0)
		{
			SetBoneScale (0, 0.0, 'Rock1');
			SetBoneScale (1, 0.0, 'Rock2');
			SetBoneScale (2, 0.0, 'Rock3');
		}
	else if (MagAmmoRemaining == 1)
		{		
			SetBoneScale (0, 0.0, 'Rock1');
			SetBoneScale (1, 0.0, 'Rock2');
			SetBoneScale (2, 1.0, 'Rock3');
		}
	else if (MagAmmoRemaining == 2)
		{	
			SetBoneScale (0, 0.0, 'Rock1');
			SetBoneScale (1, 1.0, 'Rock2');
			SetBoneScale (2, 1.0, 'Rock3');
		}
	else if (MagAmmoRemaining >= 3)
		{	
			SetBoneScale (0, 1.0, 'Rock1');
			SetBoneScale (1, 1.0, 'Rock2');
			SetBoneScale (2, 1.0, 'Rock3');
		}
*/
	LifeSpan = default.LifeSpan; // он не исчезает
	Super.Tick(DeltaTime);
}

defaultproperties
{
     Speed=1.000000
     MaxSpeed=1.000000
	 Mesh=SkeletalMesh'RPG7DTv2_A.RPG7DT_BackPack'
     //StaticMesh=StaticMesh'RPG7DTv2_A.RPG7_backpack'
	 DrawType=DT_Mesh
     Physics=PHYS_Projectile
     DrawScale=2.00000
     CollisionRadius=0.000000
     CollisionHeight=0.000000
	 ExplodeTimer=300.000000
     LifeSpan=100.000000
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
