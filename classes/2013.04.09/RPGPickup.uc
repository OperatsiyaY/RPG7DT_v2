class RPGPickup extends KFWeaponPickup;

#exec OBJ LOAD FILE=KillingFloorWeapons.utx
//#exec OBJ LOAD FILE=WeaponStaticMesh.usx
//#exec OBJ LOAD FILE=RPG7DTv2_A.usx

defaultproperties
{
     Weight=10.000000
     cost=4500
     AmmoCost=30
	 SellValue=300
     BuyClipSize=1
     PowerValue=100
     SpeedValue=20
     RangeValue=64
     Description="Гранатомёт РПГ-7 — легендарный советский / российский многоразовый реактивный противотанковый гранатомёт для стрельбы активно-реактивными гранатами, разработки ГСКБ-47 (ныне ГНПП «Базальт»). Предназначен для борьбы с танками, самоходными артиллерийскими установками и другой бронетехникой противника, может быть использован для уничтожения живой силы противника в укрытиях, а также для борьбы с низколетящими воздушными целями. Принят на вооружение в 1961 году. Выпущено более 9 000 000 РПГ-7. Эффективно использовался практически во всех вооружённых конфликтах с момента его появления. Является наиболее распространённым и узнаваемым ручным противотанковым гранатомётом в мире."
     ItemName="РПГ-7"
     ItemShortName="РПГ-7"
	 AmmoItemName="Граната ПГ-7"
     showMesh=SkeletalMesh'RPG7DTv2_A.RPG7_3rd'
     AmmoMesh=StaticMesh'RPG7DTv2_A.Grenade'
     CorrespondingPerkIndex=6
     EquipmentCategoryID=3
     MaxDesireability=0.790000
     InventoryType=Class'RPG7DT_v2.RPG'
     RespawnTime=60.000000
     PickupMessage="Вы взяли РПГ-7"
     PickupSound=Sound'RPG7DTv2_A.Select'
     PickupForce="AssaultRiflePickup"
     StaticMesh=StaticMesh'RPG7DTv2_A.rpg7_static'
     CollisionRadius=35.000000
     CollisionHeight=6.000000
}
