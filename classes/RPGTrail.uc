//=============================================================================
// ROTankROPanzerfaustTrail
//=============================================================================
// Emitter Panzerfaust to leave smoke trail
//=============================================================================
// Red Orchestra Source
// Copyright (C) 2005 Martin "Doh" Behrend
// Copyright (C) 2005 David Hensley
// Copyright (C) 2005 Jon Giblson
//=============================================================================

class RPGTrail extends Emitter;

simulated function HandleOwnerDestroyed()
{
    Emitters[0].ParticlesPerSecond = 0;
    Emitters[0].InitialParticlesPerSecond = 0;
    Emitters[0].RespawnDeadParticles=false;

    Emitters[1].ParticlesPerSecond = 0;
    Emitters[1].InitialParticlesPerSecond = 0;
    Emitters[1].RespawnDeadParticles=false;

    AutoDestroy=true;
}

defaultproperties
{
  Begin Object Class=SpriteEmitter Name=SpriteEmitter0
        FadeOut=True
        SpinParticles=True
        UseSizeScale=True
        UseRegularSizeScale=False
        UniformSize=True
        AutomaticInitialSpawning=False
        UseVelocityScale=True
        Acceleration=(X=70.000000,Z=20.000000)
        ColorScale(0)=(Color=(B=255,G=255,R=255,A=255))
        ColorScale(1)=(RelativeTime=1.000000,Color=(B=255,G=255,R=255,A=255))
        FadeOutStartTime=0.950000
        MaxParticles=150
		Opacity=0.620000
        Name="SpriteEmitter2"
        UseRotationFrom=PTRS_Actor
        SpinsPerSecondRange=(X=(Min=-0.075000,Max=0.075000))
        SizeScale(0)=(RelativeSize=1.000000)
        SizeScale(1)=(RelativeTime=0.070000,RelativeSize=1.000000)
        SizeScale(2)=(RelativeTime=0.370000,RelativeSize=2.200000)
        SizeScale(3)=(RelativeTime=1.000000,RelativeSize=4.000000)
        StartSizeRange=(X=(Min=7.500000,Max=15.000000),Y=(Min=50.000000,Max=50.000000),Z=(Min=50.000000,Max=50.000000))
        ParticlesPerSecond=25.000000
        InitialParticlesPerSecond=25.000000
        DrawStyle=PTDS_AlphaBlend
        Texture=Texture'Effects_Tex.explosions.DSmoke_2'
        LifetimeRange=(Max=5.000000)
        StartVelocityRange=(X=(Min=45.000000,Max=45.000000),Y=(Min=-45.000000,Max=45.000000),Z=(Min=-45.000000,Max=45.000000))
        VelocityLossRange=(X=(Min=1.000000,Max=1.000000),Y=(Min=1.000000,Max=1.000000),Z=(Min=1.000000,Max=1.000000))
        VelocityScale(0)=(RelativeVelocity=(X=1.000000,Y=1.000000,Z=1.000000))
        VelocityScale(1)=(RelativeTime=0.300000,RelativeVelocity=(X=0.200000,Y=1.000000,Z=1.000000))
        VelocityScale(2)=(RelativeTime=1.000000,RelativeVelocity=(Y=0.400000,Z=0.400000))
    End Object
    Emitters(0)=SpriteEmitter'RPG7DT_v2.RPGTrail.SpriteEmitter0'

    Begin Object Class=SpriteEmitter Name=SpriteEmitter1
        UseColorScale=True
        FadeOut=True
        AutoReset=True
        SpinParticles=True
        UseSizeScale=True
        UseRegularSizeScale=False
        UniformSize=True
        AutomaticInitialSpawning=False
        UseVelocityScale=True
        Acceleration=(X=70.000000,Z=20.000000)
		ColorScale(0)=(Color=(B=64,G=165,R=255,A=255))
		ColorScale(1)=(RelativeTime=0.200000,Color=(A=255))
		ColorScale(2)=(RelativeTime=1.000000,Color=(B=128,G=128,R=128,A=255))
        FadeOutStartTime=1.200000
		Opacity=0.620000
        MaxParticles=150
        AutoResetTimeRange=(Min=5.000000,Max=10.000000)
        Name="SpriteEmitter4"
        UseRotationFrom=PTRS_Actor
        SpinsPerSecondRange=(X=(Min=-0.075000,Max=0.075000))
        SizeScale(0)=(RelativeSize=1.000000)
        SizeScale(1)=(RelativeTime=0.070000,RelativeSize=1.000000)
        SizeScale(2)=(RelativeTime=0.370000,RelativeSize=2.200000)
        SizeScale(3)=(RelativeTime=1.000000,RelativeSize=3.000000)
		StartSizeRange=(X=(Min=5.500000,Max=10.500000),Y=(Min=50.000000,Max=50.000000),Z=(Min=50.000000,Max=50.000000))
        ParticlesPerSecond=25.000000
        InitialParticlesPerSecond=25.000000
        DrawStyle=PTDS_AlphaBlend
        Texture=Texture'Effects_Tex.explosions.DSmoke_2'
        LifetimeRange=(Max=4.000000)
        StartVelocityRange=(X=(Min=40.000000,Max=80.000000),Y=(Min=-45.000000,Max=45.000000),Z=(Min=-45.000000,Max=45.000000))
        VelocityLossRange=(X=(Min=2.000000,Max=2.000000),Y=(Min=2.000000,Max=2.000000),Z=(Min=2.000000,Max=2.000000))
        VelocityScale(0)=(RelativeVelocity=(X=1.000000,Y=1.000000,Z=1.000000))
        VelocityScale(1)=(RelativeTime=0.400000,RelativeVelocity=(X=0.150000,Y=1.000000,Z=1.000000))
        VelocityScale(2)=(RelativeTime=1.000000,RelativeVelocity=(Y=0.400000,Z=0.400000))
    End Object
    Emitters(1)=SpriteEmitter'RPG7DT_v2.RPGTrail.SpriteEmitter1'

  /*Begin Object Class=MeshEmitter Name=MeshEmitter2
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
     Emitters(0)=MeshEmitter'RPG7DT.RPGTrail.MeshEmitter2'
	 */
	 //bAutoAlignVelocity=True
     //DisableDGV(0)=1
     //DisableDGV(1)=1
     //bAutoInit=False
	 /*
     Begin Object Class=MeshEmitter Name=MeshEmitterDT4
         StaticMesh=StaticMesh'RPG7DTv2_A.RPG7MuzzleBackFlash'
         UseMeshBlendMode=False
         RenderTwoSided=True
         UseParticleColor=True
         UseColorScale=True
         FadeOut=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         AutomaticInitialSpawning=False
         TriggerDisabled=False
         ColorScale(0)=(Color=(B=255,G=255,R=255))
         ColorScale(1)=(RelativeTime=1.000000,Color=(G=128,R=192))
         FadeOutStartTime=0.100000
         CoordinateSystem=PTCS_Relative
         MaxParticles=1
		 StartLocationRange=(X=(Min=-15.000000,Max=-15.000000),Y=(Min=0.000000,Max=0.000000))
         SpinsPerSecondRange=(Z=(Min=3.000000,Max=3.000000))
         SizeScale(1)=(RelativeSize=0.100000)
         SizeScale(2)=(RelativeTime=0.500000,RelativeSize=0.500000)
		 DrawStyle=PTDS_Brighten
         SecondsBeforeInactive=0.000000
         LifetimeRange=(Min=5.100000,Max=5.100000)
         SpawnOnTriggerRange=(Min=1.000000,Max=1.000000)
         SpawnOnTriggerPPS=500000.000000
		 StartVelocityRange=(X=(Min=-20.000000,Max=-20.000000),Y=(Min=-20.000000,Max=-20.000000),Z=(Min=-20.000000,Max=20.000000))
         VelocityLossRange=(X=(Min=-20.000000,Max=-20.000000),Y=(Min=-20.700000,Max=-20.700000),Z=(Min=-20.700000,Max=-20.700000))
     End Object
     Emitters(2)=MeshEmitter'RPG7DT_v2.RPGTrail.MeshEmitterDT4'
*/
	 bNoDelete=false
	AutoDestroy=False
}
