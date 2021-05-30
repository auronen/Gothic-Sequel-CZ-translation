//#####################################################################
//##
//##
//##							Instanz
//##
//##
//#####################################################################
INSTANCE CzH(NPC_DEFAULT)
// PlayerInstanz
{
	//-------- primary data --------
	name 			= "Čeština Helper";
	Npctype			= Npctype_Main;
	guild			= GIL_NONE;
	level			= 10;
	voice			= 15;
	id				= 0;


	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody	(self,"hum_body_Naked0",	4,			1,			"Hum_Head_Pony",	9, 			0,			-1);

	//-------- ai ----------
	start_aistate = ZS_CH_Hangaround;
};


//***************************************************************************
//	Exit
//***************************************************************************
instance  CzH_Exit (C_INFO)
{
	npc			=  CzH;
	nr			=  999;
	condition	=  CzH_Exit_Condition;
	information	=  CzH_Exit_Info;
	important	=  0;
	permanent	=  1;
	description =  "Konec";
};

FUNC int  CzH_Exit_Condition()
{
	return 1;
};

FUNC VOID  CzH_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Plants
//***************************************************************************

INSTANCE CzH_Plants (C_INFO)
{
	npc				= CzH;
	nr				=  20;
	condition		= CzH_Plants_Condition;
	information		= CzH_Plants_Info;
	important		= 0;
	permanent		= 1;
	description		= "Nauč mě všechny rostlinky!";
};

FUNC INT CzH_Plants_Condition()
{
	if (!Knows_Nightshade)
	{
		return TRUE;
	};
};

func VOID CzH_Plants_Info()
{
	B_LearnWoodberry();
	B_LearnFlameberry();
	B_LearnTrollberry();
	B_LearnCaveMushroom();
	B_LearnMountainMoss();
	B_LearnStoneroot();
	B_LearnBloodThistle();
	B_LearnOrcLeaf();
	B_LearnRavenHerb();
	B_LearnNightshade();
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Weapons
//***************************************************************************

INSTANCE CzH_Weapons (C_INFO)
{
	npc				= CzH;
	nr				=  30;
	condition		= CzH_Weapons_Condition;
	information		= CzH_Weapons_Info;
	important		= 0;
	permanent		= 1;
	description		= "Nauč mě všechny zbraně!";
};

FUNC INT CzH_Weapons_Condition()
{
	if (!Knows_Shortsword)
	{
		return TRUE;
	};
};

func VOID CzH_Weapons_Info()
{
	B_LearnShortsword();
	B_LearnLongsword();
	B_LearnBroadsword();
	B_LearnBastardsword();
	B_Learn2HSword();
	B_LearnOrcSword();
	B_LearnHatchet();
	B_LearnBattleaxe();
	B_LearnDoublebladedAxe();
	B_LearnBerserkAxe();
	B_LearnOrcAxe();
	B_LearnIronclub();
	B_LearnMace();
	B_LearnMorningstar();
	B_LearnWarhammer();
	B_LearnOrcHammer();

	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Potions
//***************************************************************************

INSTANCE CzH_Potions (C_INFO)
{
	npc				= CzH;
	nr				=  20;
	condition		= CzH_Potions_Condition;
	information		= CzH_Potions_Info;
	important		= 0;
	permanent		= 1;
	description		= "Nauč mě všechny lektvary!";
};

FUNC INT CzH_Potions_Condition()
{
	if (!Knows_HealingPotions)
	{
		return TRUE;
	};
};

func VOID CzH_Potions_Info()
{
	B_LearnRecipeHealingPotions();
	B_LearnRecipeManaPotions();
	B_LearnRecipeSpeedPotions();

	AI_StopProcessInfos	(self);
};

INSTANCE CzH_FixGerion (C_INFO)
{
	npc				= CzH;
	condition		= CzH_FixGerion_Condition;
	information		= CzH_FixGerion_Info;
	important		= 0;
	permanent		= 1;
	description		= "Prsten pro Geriona!";
};

FUNC INT CzH_FixGerion_Condition()
{
		return TRUE;
};

func VOID CzH_FixGerion_Info()
{
	CreateInvItem(hero,	ItRi_Fire_01);
    LearnPickpocket_1 = LOG_RUNNING;
	AI_StopProcessInfos	(self);
};

INSTANCE CzH_PhoenixDebug (C_INFO)
{
	npc				= CzH;
	nr				=  50;
	condition		= CzH_PhoenixDebug_Condition;
	information		= CzH_PhoenixDebug_Info;
	important		= 0;
	permanent		= 1;
	description		= "Úkol Fénixova pouť!";
};

FUNC INT CzH_PhoenixDebug_Condition()
{
		return TRUE;
};

func VOID CzH_PhoenixDebug_Info()
{
	Info_AddChoice		(CzH_PhoenixDebug, "Dej mi všechny knihy!", CzH_PhoenixBooks );
	Info_AddChoice		(CzH_PhoenixDebug, "Spusť úkol!", HLR_501_Talamon_STINKINGSALT_MEATBUGS );
};

func VOID CzH_PhoenixLaunch ()
{
	Wld_InsertItem		(ItWr_Phoenix1,		"FP_SPAWN_PHOENIX_1");
	AI_StopProcessInfos	(self);
};

func VOID CzH_PhoenixBooks ()
{
	CreateInvItem(hero,	ItWr_Phoenix1);
	CreateInvItem(hero,	ItWr_Phoenix2);
	CreateInvItem(hero,	ItWr_Phoenix3);
	CreateInvItem(hero,	ItWr_Phoenix4);
	CreateInvItem(hero,	ItWr_Phoenix5);
	CreateInvItem(hero,	ItWr_Phoenix6);
	CreateInvItem(hero,	ItWr_Phoenix7);
	CreateInvItem(hero,	ItWr_Phoenix8);
	AI_StopProcessInfos	(self);
};

