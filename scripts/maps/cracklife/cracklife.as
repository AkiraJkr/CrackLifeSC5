// Crack-Life Stuff
#include "weapons/weapon_clmp5"
#include "weapons/weapon_clcrowbar"
#include "weapons/weapon_clglock"
#include "weapons/weapon_clshotgun"
#include "weapons/weapon_clpython"
#include "weapons/weapon_clhornetgun"
#include "weapons/weapon_clgauss"
#include "logo"

// HLSP Stuff
#include "hlsp/trigger_suitcheck"

// Crack-Life mode.
// True: Original
// False: Campaign Mode
const bool g_bCrackLifeMode = true;

// Weapon behaviour/mode (bIsMultiplayer function)
// Like the singleplayer/multiplayer differences in vanilla HL
// True: Multiplayer
// False: Singleplayer
const bool g_WeaponMode = false;

// inb4 mapping for unused weapons
array<ItemMapping@> g_ItemMappings =
{
	ItemMapping( "weapon_357",				CLPYTHON::GetName() ),
	ItemMapping( "weapon_9mmAR",			CLMP5::g_WeaponName ),
	ItemMapping( "weapon_9mmhandgun",		CLGLOCK::g_WeaponName ),
	ItemMapping( "weapon_crowbar",			CLCROWBAR::g_WeaponName ),
	ItemMapping( "weapon_displacer",		"weapon_rpg" ),
	ItemMapping( "weapon_eagle",			CLPYTHON::GetName() ),
	ItemMapping( "weapon_gauss",			CLGAUSS::GetName() ),
	ItemMapping( "weapon_glock",			CLGLOCK::g_WeaponName ),
	ItemMapping( "weapon_grapple",			CLCROWBAR::g_WeaponName ),
	ItemMapping( "weapon_hornetgun",		CLHORNETGUN::GetName() ),
	ItemMapping( "weapon_m16",				CLMP5::g_WeaponName ),
	ItemMapping( "weapon_m249",				CLMP5::g_WeaponName ),
	ItemMapping( "weapon_minigun",			CLMP5::g_WeaponName ),
	ItemMapping( "weapon_pipewrench",		CLCROWBAR::g_WeaponName ),
	ItemMapping( "weapon_python",			CLPYTHON::GetName() ),
	ItemMapping( "weapon_shockrifle",		CLMP5::g_WeaponName ),
	ItemMapping( "weapon_shotgun",			CLSHOTGUN::GetName() ),
	ItemMapping( "weapon_sniperrifle",		"weapon_crossbow" ),
	ItemMapping( "weapon_sporelauncher",	"weapon_rpg" ),
	ItemMapping( "weapon_uzi",				CLMP5::g_WeaponName ),
	ItemMapping( "weapon_uziakimbo",		CLMP5::g_WeaponName ),
	
	ItemMapping( "ammo_9mmAR",				CLMP5::g_AmmoName ),
	ItemMapping( "ammo_9mmbox",				CLMP5::g_AmmoName ),
	ItemMapping( "ammo_9mmclip",			CLMP5::g_AmmoName ),
	ItemMapping( "ammo_uziclip",			CLMP5::g_AmmoName ),
	ItemMapping( "ammo_mp5grenades",		CLMP5::g_SecAmmoName ),
	ItemMapping( "ammo_ARgrenades",			CLMP5::g_SecAmmoName )
};

void MapInit()
{
	// HLSP Stuff
	RegisterTriggerSuitcheckEntity();
	g_EngineFuncs.CVarSetFloat( "mp_hevsuit_voice", 1 );

	//Crack-Life
	CLMP5::Register();			// Crack Life MP5
	CLCROWBAR::Register();		// Crack Life punchs
	CLGLOCK::Register();		// Penis gun
	CLSHOTGUN::Register();		// shotgun
	CLPYTHON::Register();		// POW! 357
	CLHORNETGUN::Register();	// JOJ
	CLGAUSS::Register();		// walk in the dinosaur

	// Initialize classic mode (item mapping only)
	g_ClassicMode.SetItemMappings( @g_ItemMappings );
	g_ClassicMode.ForceItemRemap( true );
}
