class RPGTracer extends DGVEmitter;

#exec OBJ LOAD FILE=RPG7DTv2_A.ukx
//#exec OBJ LOAD FILE=..\Textures\AW-2004Particles.utx

simulated function SpawnParticle( int Amount )
{
    local PlayerController PC;
    local vector Dir, LineDir, LinePos, RealLocation;

    Super.SpawnParticle(Amount);

    if ( (Instigator == None) || Instigator.IsFirstPerson() )
        return;

    // see if local player controller near bullet, but missed
    PC = Level.GetLocalPlayerController();
    if ( (PC != None) && (PC.Pawn != None) )
    {
        Dir.X = Emitters[0].StartVelocityRange.X.Min;
        Dir.Y = Emitters[0].StartVelocityRange.Y.Min;
        Dir.Z = Emitters[0].StartVelocityRange.Z.Min;
        Dir = Normal(Dir);
        LinePos = (Location + (Dir dot (PC.Pawn.Location - Location)) * Dir);
        LineDir = PC.Pawn.Location - LinePos;
        if ( VSize(LineDir) < 150 )
        {
            RealLocation = Location;
            SetLocation(LinePos);
            PlaySound(sound'ProjectileSounds.Bullets.Impact_Dirt',,,,80);
            SetLocation(RealLocation);
        }
    }
}

defaultproperties
{
     Begin Object Class=MeshEmitter Name=MeshEmitter0
		StaticMesh=StaticMesh'RPG7DTv2_A.RPG7MuzzleBackFlash'
		UseMeshBlendMode=False
		RespawnDeadParticles=False
		SpinParticles=True
		AutomaticInitialSpawning=False
		ColorScale(0)=(Color=(B=255,G=255,R=255,A=255))
		ColorScale(1)=(RelativeTime=1.000000,Color=(B=255,G=255,R=255,A=255))
		MaxParticles=1
		Name="MeshEmitter0"
		SpinsPerSecondRange=(Z=(Min=-22.972000,Max=-22.972000))
		StartSpinRange=(Z=(Min=-0.960000,Max=0.960000))
		InitialParticlesPerSecond=500.000000
		DrawStyle=PTDS_Brighten
		LifetimeRange=(Min=5.000000,Max=5.000000)
	 End Object
     Emitters(0)=MeshEmitter'RPG7DT_v2.RPGTracer.MeshEmitter0'

	  Begin Object Class=SpriteEmitter Name=SpriteEmitter13
         UseDirectionAs=PTDU_Right
         RespawnDeadParticles=False
         UseAbsoluteTimeForSizeScale=True
         UseRegularSizeScale=False
         ScaleSizeXByVelocity=True
         AutomaticInitialSpawning=False
         ExtentMultiplier=(X=0.200000)
         ColorMultiplierRange=(Y=(Min=0.800000,Max=0.800000),Z=(Min=0.500000,Max=0.500000))
         MaxParticles=100
         StartSizeRange=(X=(Min=500.000000,Max=500.000000),Y=(Min=90.000000,Max=90.000000))
         ScaleSizeByVelocityMultiplier=(X=0.001000)
         DrawStyle=PTDS_Brighten
         Texture=Texture'kf_fx_trip_t.Misc.KFTracerShot'
         LifetimeRange=(Min=5.100000,Max=5.100000)
         StartVelocityRange=(X=(Min=10000.000000,Max=10000.000000))
     End Object
     Emitters(1)=SpriteEmitter'RPG7DT_v2.RPGTracer.SpriteEmitter13'   

     bNoDelete=False
     bHardAttach=True
	 Physics=PHYS_Trailer
}
