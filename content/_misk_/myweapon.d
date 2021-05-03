
instance MYWEAPON(C_Info)
{
	nr = 1;
	condition = myweapon_condition;
	information = myweapon_info;
	permanent = TRUE;
	important = TRUE;
};


func int myweapon_condition()
{
	var int int_day;
	var int int_hour;
	var int int_compare;
	PrintDebugNpc(PD_ZS_Check,"MyWeapon_Condition");
	int_day = b_getday() * 25;
	int_hour = b_gethour();
	int_compare = int_day + int_hour;
	if((int_compare >= self.aivar[41]) && self.aivar[42])
	{
		PrintDebugNpc(PD_ZS_Check,"MyWeapon_Condition ...TRUE");
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func void myweapon_info()
{
	var int int_day;
	var int int_hour;
	PrintDebugNpc(PD_ZS_Check,"MyWeapon_Info");
	int_day = b_getday() * 25;
	int_hour = b_gethour();
	self.aivar[41] = int_day + int_hour + 2;
	Info_ClearChoices(myweapon);
	b_pointandshout(self,other,"$THATSMYWEAPON");
	Info_AddChoice(myweapon,"Das war ein Versehen, hier hast Du Deine Waffe zurück.",myweapon_lieb);
	Info_AddChoice(myweapon,"Hol sie Dir, wenn Du kannst",myweapon_hauab);
};

func void b_getbackpersonalweapon(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_Check,"AssignMyWeaponInfos");
	myweapon.npc = Hlp_GetInstanceID(slf);
};

func void myweapon_lieb()
{
	var C_Item melee;
	var C_Item ranged;
	var int int_melee;
	var int int_ranged;
	PrintDebugNpc(PD_ZS_Check,"MyWeapon_Lieb");
	melee = Npc_GetEquippedMeleeWeapon(other);
	ranged = Npc_GetEquippedRangedWeapon(other);
	int_melee = Hlp_GetInstanceID(melee);
	int_ranged = Hlp_GetInstanceID(ranged);
	AI_Output(hero,self,"MyWeapon_Info_15_01");	//Das war ein Versehen, hier hast Du Deine Waffe zurück.
	B_Say(self,hero,"$WISEMOVE");
	if(B_CompareNpcInstance(self,min_306_grim))
	{
		B_GiveInvItems(other,self,itmw_grim_pickaxe,1);
	};
	if(B_CompareNpcInstance(self,wrk_216_goliath))
	{
		B_GiveInvItems(other,self,itmw_goliath_sledgehammer,1);
	};
	if(B_CompareNpcInstance(self,dmh_1302_malgar))
	{
		B_GiveInvItems(other,self,itmw_malgar_broadsword,1);
	};
	if(B_CompareNpcInstance(self,amz_900_thora))
	{
		B_GiveInvItems(other,self,itmw_thora_battlestaff,1);
	};
	if(B_CompareNpcInstance(self,mil_121_brutus))
	{
		B_GiveInvItems(other,self,itmw_brutus_longsword,1);
	};
	if(Npc_OwnedByNpc(melee,self))
	{
		B_GiveInvItems(other,self,int_melee,1);
	};
	if(Npc_OwnedByNpc(ranged,self))
	{
		B_GiveInvItems(other,self,int_ranged,1);
	};
	self.aivar[42] = FALSE;
	AI_StopProcessInfos(self);
};

func void myweapon_hauab()
{
	AI_Output(hero,self,"MyWeapon_Info_15_02");	//Hol sie Dir, wenn Du kannst
	B_Say(self,hero,"$YOUASKEDFORIT");
	AI_StopProcessInfos(self);
	b_attackquick(self,other);
};

