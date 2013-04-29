class RPGTracer extends Emitter;

#exec OBJ LOAD FILE=RPG7DTv2_A.ukx
//#exec OBJ LOAD FILE=..\Textures\AW-2004Particles.utx
/*
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
*/

simulated function HandleOwnerDestroyed()
{
    Emitters[0].ParticlesPerSecond = 0;
    Emitters[0].InitialParticlesPerSecond = 0;
    Emitters[0].RespawnDeadParticles=false;

    AutoDestroy=true;
}

defaultproperties
{
     Begin Object Class=MeshEmitter Name=MeshEmitter0
		StaticMesh=StaticMesh'RPG7DTv2_A.RPG7MuzzleBackFlash'
		UseMeshBlendMode=False
		RespawnDeadParticles=True
		SpinParticles=True
		AutomaticInitialSpawning=False
		CoordinateSystem=PTCS_Relative
		ColorScale(0)=(Color=(B=255,G=255,R=255,A=255))
		ColorScale(1)=(RelativeTime=1.000000,Color=(B=255,G=255,R=255,A=255))
		MaxParticles=1
		Name="MeshEmitter0"
		SpinsPerSecondRange=(Z=(Min=-22.972000,Max=-22.972000))
		StartSpinRange=(Z=(Min=-0.960000,Max=0.960000))
		InitialParticlesPerSecond=500.000000
		StartSizeRange=(X=(Min=0.150000,Max=0.150000),Y=(Min=0.150000,Max=0.150000),Z=(Min=0.150000,Max=0.150000))
		DrawStyle=PTDS_Brighten
		LifetimeRange=(Max=1.000000)
	 End Object
     Emitters(0)=MeshEmitter'RPGTracer.MeshEmitter0'

     bNoDelete=False
     bHardAttach=True
	 Physics=PHYS_Trailer
}
