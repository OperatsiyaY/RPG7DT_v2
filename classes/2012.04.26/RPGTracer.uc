class RPGTracer extends DGVEmitter;

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
     /* Begin Object Class=MeshEmitter Name=MeshEmitter2
         StaticMesh=StaticMesh'BallisticHardware2.G5.BazookaMuzzleFlash'
         UseMeshBlendMode=False
         RenderTwoSided=True
         UseParticleColor=True
         UseColorScale=True
         FadeOut=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         AutomaticInitialSpawning=False
         TriggerDisabled=False
         ColorScale(0)=(Color=(B=255,G=255,R=255))
         ColorScale(1)=(RelativeTime=1.000000,Color=(G=64,R=128))
         FadeOutStartTime=0.100000
         CoordinateSystem=PTCS_Relative
         MaxParticles=1
         SizeScale(1)=(RelativeTime=0.100000,RelativeSize=1.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=2.000000)
         DrawStyle=PTDS_Brighten
         SecondsBeforeInactive=0.000000
         LifetimeRange=(Min=0.800000,Max=0.800000)
         SpawnOnTriggerRange=(Min=1.000000,Max=1.000000)
         SpawnOnTriggerPPS=500000.000000
         StartVelocityRange=(X=(Min=30.000000,Max=30.000000))
     End Object
     Emitters(0)=MeshEmitter'RPG7DT.RPGTracer.MeshEmitter2'
*/
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
     Emitters(0)=SpriteEmitter'RPG7DT_v2.RPGTracer.SpriteEmitter13'    p

     bNoDelete=False
     bHardAttach=True
}
