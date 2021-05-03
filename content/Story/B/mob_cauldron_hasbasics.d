
func int mob_cauldron_hasbasics()
{
	printdebugmobsi("MOB_Cauldron_HasBasics");
	if((hero.aivar[33] == AIV_AM_CAULDRON) && (Npc_HasItems(hero,itmi_scoop) || Npc_HasItems(hero,itmi_stinkingsalt)))
	{
		printdebugmobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		printdebugmobsi(PD_FALSE);
		return FALSE;
	};
};

func int mob_cauldron_canspoil()
{
	var C_Npc halvor;
	printdebugmobsi("MOB_Cauldron_CanSpoil");
	halvor = Hlp_GetNpc(mil_100_halvor);
	if((Npc_GetDistToWP(hero,HALVOR_WP_COOKING) < HALVOR_COOKING_AREA) && !Npc_CanSeeNpc(halvor,hero) && !HALVOR_STEWSALTED)
	{
		printdebugmobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		printdebugmobsi(PD_FALSE);
		return FALSE;
	};
};

func int mob_cauldron_canproducemeatbugsoup()
{
	printdebugmobsi("MOB_Cauldron_CanProduceMeatbugSoup");
	if((Npc_GetTalentSkill(self,NPC_TALENT_COOK) >= TAL_STEP_1) && (Npc_HasItems(self,itmi_salt) >= 1) && (Npc_HasItems(self,itat_meatbug) >= 1) && (Npc_HasItems(self,itfo_loaf) >= 1) && KNOWS_RECIPEMEATBUG && mob_cauldron_hasbasics())
	{
		printdebugmobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		printdebugmobsi(PD_FALSE);
		return FALSE;
	};
};

func int mob_cauldron_canproducemeatbugstew()
{
	printdebugmobsi("MOB_Cauldron_CanProduceMeatbugStew");
	if((Npc_GetTalentSkill(self,NPC_TALENT_COOK) >= TAL_STEP_2) && (Npc_HasItems(self,itmi_salt) >= 1) && (Npc_HasItems(self,itat_meatbug) >= 1) && (Npc_HasItems(self,itfo_cheese) >= 1) && KNOWS_RECIPEMEATBUG && mob_cauldron_hasbasics())
	{
		printdebugmobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		printdebugmobsi(PD_FALSE);
		return FALSE;
	};
};

func int mob_cauldron_canproducemeatbugpie()
{
	printdebugmobsi("MOB_Cauldron_CanProduceMeatbugPie");
	if((Npc_GetTalentSkill(self,NPC_TALENT_COOK) >= TAL_STEP_3) && (Npc_HasItems(self,itmi_salt) >= 1) && (Npc_HasItems(self,itat_meatbug) >= 1) && (Npc_HasItems(self,itfo_ham) >= 1) && KNOWS_RECIPEMEATBUG && mob_cauldron_hasbasics())
	{
		printdebugmobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		printdebugmobsi(PD_FALSE);
		return FALSE;
	};
};

func int mob_cauldron_canproducemoleratsoup()
{
	printdebugmobsi("MOB_Cauldron_CanProduceMoleratSoup");
	if((Npc_GetTalentSkill(self,NPC_TALENT_COOK) >= TAL_STEP_1) && (Npc_HasItems(self,itmi_salt) >= 1) && (Npc_HasItems(self,itat_moleratgrease) >= 1) && (Npc_HasItems(self,itfo_loaf) >= 1) && KNOWS_RECIPEMOLERAT && mob_cauldron_hasbasics())
	{
		printdebugmobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		printdebugmobsi(PD_FALSE);
		return FALSE;
	};
};

func int mob_cauldron_canproducemoleratstew()
{
	printdebugmobsi("MOB_Cauldron_CanProduceMoleratStew");
	if((Npc_GetTalentSkill(self,NPC_TALENT_COOK) >= TAL_STEP_2) && (Npc_HasItems(self,itmi_salt) >= 1) && (Npc_HasItems(self,itat_moleratgrease) >= 1) && (Npc_HasItems(self,itfo_cheese) >= 1) && KNOWS_RECIPEMOLERAT && mob_cauldron_hasbasics())
	{
		printdebugmobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		printdebugmobsi(PD_FALSE);
		return FALSE;
	};
};

func int mob_cauldron_canproducemoleratpie()
{
	printdebugmobsi("MOB_Cauldron_CanProduceMoleratPie");
	if((Npc_GetTalentSkill(self,NPC_TALENT_COOK) >= TAL_STEP_3) && (Npc_HasItems(self,itmi_salt) >= 1) && (Npc_HasItems(self,itat_moleratgrease) >= 1) && (Npc_HasItems(self,itfo_ham) >= 1) && KNOWS_RECIPEMOLERAT && mob_cauldron_hasbasics())
	{
		printdebugmobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		printdebugmobsi(PD_FALSE);
		return FALSE;
	};
};

func int mob_cauldron_canproduceherbsoup()
{
	printdebugmobsi("MOB_Cauldron_CanProduceHerbSoup");
	if((Npc_GetTalentSkill(self,NPC_TALENT_COOK) >= TAL_STEP_1) && (Npc_HasItems(self,itmi_salt) >= 1) && (Npc_HasItems(self,itpl_swampweed) >= 1) && (Npc_HasItems(self,itfo_loaf) >= 1) && KNOWS_RECIPEHERB && mob_cauldron_hasbasics())
	{
		printdebugmobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		printdebugmobsi(PD_FALSE);
		return FALSE;
	};
};

func int mob_cauldron_canproduceherbstew()
{
	printdebugmobsi("MOB_Cauldron_CanProduceHerbStew");
	if((Npc_GetTalentSkill(self,NPC_TALENT_COOK) >= TAL_STEP_2) && (Npc_HasItems(self,itmi_salt) >= 1) && (Npc_HasItems(self,itpl_swampweed) >= 1) && (Npc_HasItems(self,itfo_cheese) >= 1) && KNOWS_RECIPEHERB && mob_cauldron_hasbasics())
	{
		printdebugmobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		printdebugmobsi(PD_FALSE);
		return FALSE;
	};
};

func int mob_cauldron_canproduceherbpie()
{
	printdebugmobsi("MOB_Cauldron_CanProduceHerbPie");
	if((Npc_GetTalentSkill(self,NPC_TALENT_COOK) >= TAL_STEP_3) && (Npc_HasItems(self,itmi_salt) >= 1) && (Npc_HasItems(self,itpl_swampweed) >= 1) && (Npc_HasItems(self,itfo_ham) >= 1) && KNOWS_RECIPEHERB && mob_cauldron_hasbasics())
	{
		printdebugmobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		printdebugmobsi(PD_FALSE);
		return FALSE;
	};
};

func int mob_cauldron_canproducemushroomsoup()
{
	printdebugmobsi("MOB_Cauldron_CanProduceMushroomSoup");
	if((Npc_GetTalentSkill(self,NPC_TALENT_COOK) >= TAL_STEP_1) && (Npc_HasItems(self,itmi_salt) >= 1) && (Npc_HasItems(self,itpl_cavemushroom) >= 1) && (Npc_HasItems(self,itfo_loaf) >= 1) && KNOWS_RECIPEMUSHROOM && mob_cauldron_hasbasics())
	{
		printdebugmobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		printdebugmobsi(PD_FALSE);
		return FALSE;
	};
};

func int mob_cauldron_canproducemushroomstew()
{
	printdebugmobsi("MOB_Cauldron_CanProduceMushroomStew");
	if((Npc_GetTalentSkill(self,NPC_TALENT_COOK) >= TAL_STEP_2) && (Npc_HasItems(self,itmi_salt) >= 1) && (Npc_HasItems(self,itpl_cavemushroom) >= 1) && (Npc_HasItems(self,itfo_cheese) >= 1) && KNOWS_RECIPEMUSHROOM && mob_cauldron_hasbasics())
	{
		printdebugmobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		printdebugmobsi(PD_FALSE);
		return FALSE;
	};
};

func int mob_cauldron_canproducemushroompie()
{
	printdebugmobsi("MOB_Cauldron_CanProduceMushroomPie");
	if((Npc_GetTalentSkill(self,NPC_TALENT_COOK) >= TAL_STEP_3) && (Npc_HasItems(self,itmi_salt) >= 1) && (Npc_HasItems(self,itpl_cavemushroom) >= 1) && (Npc_HasItems(self,itfo_ham) >= 1) && KNOWS_RECIPEMUSHROOM && mob_cauldron_hasbasics())
	{
		printdebugmobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		printdebugmobsi(PD_FALSE);
		return FALSE;
	};
};

func int mob_cauldron_canproducemeatsoup()
{
	printdebugmobsi("MOB_Cauldron_CanProduceMeatSoup");
	if((Npc_GetTalentSkill(self,NPC_TALENT_COOK) >= TAL_STEP_1) && (Npc_HasItems(self,itmi_salt) >= 1) && (Npc_HasItems(self,itfo_mutton) >= 1) && (Npc_HasItems(self,itfo_loaf) >= 1) && KNOWS_RECIPEMEAT && mob_cauldron_hasbasics())
	{
		printdebugmobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		printdebugmobsi(PD_FALSE);
		return FALSE;
	};
};

func int mob_cauldron_canproducemeatstew()
{
	printdebugmobsi("MOB_Cauldron_CanProduceMeatStew");
	if((Npc_GetTalentSkill(self,NPC_TALENT_COOK) >= TAL_STEP_2) && (Npc_HasItems(self,itmi_salt) >= 1) && (Npc_HasItems(self,itfo_mutton) >= 1) && (Npc_HasItems(self,itfo_cheese) >= 1) && KNOWS_RECIPEMEAT && mob_cauldron_hasbasics())
	{
		printdebugmobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		printdebugmobsi(PD_FALSE);
		return FALSE;
	};
};

func int mob_cauldron_canproducemeatpie()
{
	printdebugmobsi("MOB_Cauldron_CanProduceMeatPie");
	if((Npc_GetTalentSkill(self,NPC_TALENT_COOK) >= TAL_STEP_3) && (Npc_HasItems(self,itmi_salt) >= 1) && (Npc_HasItems(self,itfo_mutton) >= 1) && (Npc_HasItems(self,itfo_ham) >= 1) && KNOWS_RECIPEMEAT && mob_cauldron_hasbasics())
	{
		printdebugmobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		printdebugmobsi(PD_FALSE);
		return FALSE;
	};
};

func int mob_cauldron_canproducemeatbug()
{
	printdebugmobsi("MOB_Cauldron_CanProduceMeatbug");
	if(mob_cauldron_canproducemeatbugsoup() || mob_cauldron_canproducemeatbugstew() || mob_cauldron_canproducemeatbugpie())
	{
		printdebugmobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		printdebugmobsi(PD_FALSE);
		return FALSE;
	};
};

func int mob_cauldron_canproducemolerat()
{
	printdebugmobsi("MOB_Cauldron_CanProduceMolerat");
	if(mob_cauldron_canproducemoleratsoup() || mob_cauldron_canproducemoleratstew() || mob_cauldron_canproducemoleratpie())
	{
		printdebugmobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		printdebugmobsi(PD_FALSE);
		return FALSE;
	};
};

func int mob_cauldron_canproduceherb()
{
	printdebugmobsi("MOB_Cauldron_CanProduceHerb");
	if(mob_cauldron_canproduceherbsoup() || mob_cauldron_canproduceherbstew() || mob_cauldron_canproduceherbpie())
	{
		printdebugmobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		printdebugmobsi(PD_FALSE);
		return FALSE;
	};
};

func int mob_cauldron_canproducemushroom()
{
	printdebugmobsi("MOB_Cauldron_CanProduceMushroom");
	if(mob_cauldron_canproducemushroomsoup() || mob_cauldron_canproducemushroomstew() || mob_cauldron_canproducemushroompie())
	{
		printdebugmobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		printdebugmobsi(PD_FALSE);
		return FALSE;
	};
};

func int mob_cauldron_canproducemeat()
{
	printdebugmobsi("MOB_Cauldron_CanProduceMeat");
	if(mob_cauldron_canproducemeatsoup() || mob_cauldron_canproducemeatstew() || mob_cauldron_canproducemeatpie())
	{
		printdebugmobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		printdebugmobsi(PD_FALSE);
		return FALSE;
	};
};

func int mob_cauldron_canproduce()
{
	printdebugmobsi("MOB_CAULDRON_CanProduce");
	if(mob_cauldron_canproducemeatbug() || mob_cauldron_canproducemolerat() || mob_cauldron_canproduceherb() || mob_cauldron_canproducemushroom() || mob_cauldron_canproducemeat() || mob_cauldron_canspoil())
	{
		printdebugmobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		printdebugmobsi(PD_FALSE);
		return FALSE;
	};
};

func string mob_cauldron_getcantstring()
{
	var C_Npc halvor;
	printdebugmobsi("MOB_CAULDRON_GetCantString");
	if(Npc_GetTalentSkill(self,NPC_TALENT_COOK) < 1)
	{
		halvor = Hlp_GetNpc(mil_100_halvor);
		if((Npc_GetDistToWP(hero,HALVOR_WP_COOKING) < HALVOR_COOKING_AREA) && Npc_CanSeeNpc(halvor,hero) && !HALVOR_STEWSALTED && Npc_HasItems(hero,itmi_stinkingsalt))
		{
			printdebugmobsi("MOB_CAULDRON_GetCantString ...Halvor can see");
			return _STR_MESSAGE_MOBSI_CAULDRON_HALVOR;
		}
		else
		{
			printdebugmobsi("MOB_CAULDRON_GetCantString ...no Talent");
			return _STR_MESSAGE_MOBSI_CAULDRON_TAL;
		};
	}
	else if(Npc_HasItems(self,itmi_scoop) < 1)
	{
		printdebugmobsi("MOB_CAULDRON_GetCantString... no Tool");
		return _STR_MESSAGE_MOBSI_CAULDRON_TOOL;
	}
	else
	{
		printdebugmobsi("MOB_CAULDRON_GetCantString no Material");
		return _STR_MESSAGE_MOBSI_CAULDRON_MAT;
	};
};

func int mob_cauldron_condition()
{
	printdebugmobsi("MOB_CAULDRON_CONDITION");
	self.aivar[33] = AIV_AM_CAULDRON;
	if(Npc_IsPlayer(self))
	{
		if(mob_cauldron_canproduce())
		{
			printdebugmobsi(PD_TRUE);
			return TRUE;
		}
		else
		{
			PrintScreen(mob_cauldron_getcantstring(),-1,_YPOS_MESSAGE_MOBSI,FONT_OLD_SMALL,_TIME_MESSAGE_MOBSI);
			AI_PlayAni(self,"T_DONTKNOW");
			printdebugmobsi("...FALSE");
			return FALSE;
		};
	}
	else
	{
		printdebugmobsi(PD_TRUE);
		return TRUE;
	};
};

func void mob_cauldron_s1()
{
	printdebugmobsi("MOB_Cauldron_S1");
	if(B_CompareNpcInstance(self,hero))
	{
		printdebugmobsi("...vom SC benutzt");
		PrintGlobals(PD_ITEM_MOBSI);
		self.aivar[24] = TRUE;
		self.aivar[33] = AIV_AM_CAULDRON;
		ai_createiteminslot(self,"ZS_RIGHTHAND",4700);
		AI_ProcessInfos(self);
	}
	else
	{
		printdebugmobsi("... von Nsc benutzt");
		ai_createiteminslot(self,"ZS_RIGHTHAND",4700);
	};
};


instance MOB_CAULDRON_EXIT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = mob_cauldron_hasbasics;
	information = mob_cauldron_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func void mob_cauldron_exit_info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[24] = FALSE;
	ai_removeitemfromslot(self,"ZS_RIGHTHAND");
	AI_UseMob(self,SCEMENAME_CAULDRON,-1);
};

func void mob_cauldron_autoexit()
{
	printdebugmobsi("MOB_Cauldron_AutoExit");
	if(!mob_cauldron_canproduce())
	{
		mob_cauldron_exit_info();
	};
};


instance MOB_CAULDRON_SPOIL(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_cauldron_canspoil;
	information = mob_cauldron_spoil_info;
	important = 0;
	permanent = 0;
	description = "(Müffelsalz hineinrühren)";
};


func void mob_cauldron_spoil_info()
{
	PrintScreen("Müffelsalz eingerührt!",-1,_YPOS_MESSAGE_PRODUCE,FONT_OLD_SMALL,_TIME_MESSAGE_PRODUCE);
	Npc_RemoveInvItem(hero,itmi_stinkingsalt);
	HALVOR_STEWSALTED = TRUE;
	b_snaf_salted();
	ai_createiteminslot(self,"ZS_RIGHTHAND",4700);
	ai_createiteminslot(self,"ZS_LEFTHAND",4975);
	AI_PlayAni(self,"T_CAULDRON_DROP_1");
	ai_removeitemfromslot(self,"ZS_LEFTHAND");
	AI_PlayAni(self,"T_CAULDRON_DROP_2");
	AI_PlayAni(self,"T_CAULDRON_MIX_1");
	ai_removeitemfromslot(self,"ZS_RIGHTHAND");
	mob_cauldron_autoexit();
};


instance MOB_CAULDRON_PRODUCEMEATBUGSOUP(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_cauldron_canproducemeatbugsoup;
	information = mob_cauldron_producemeatbugsoup_info;
	important = FALSE;
	permanent = TRUE;
	description = NAME_MEATBUGSOUP;
};


func void mob_cauldron_producemeatbugsoup_info()
{
	b_produceitem3(1,4540,NAME_MEATBUGSOUP,1,4284,1,4067,1,4268);
	mob_cauldron_autoexit();
};


instance MOB_CAULDRON_PRODUCEMEATBUGSTEW(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_cauldron_canproducemeatbugstew;
	information = mob_cauldron_producemeatbugstew_info;
	important = FALSE;
	permanent = TRUE;
	description = NAME_MEATBUGSTEW;
};


func void mob_cauldron_producemeatbugstew_info()
{
	b_produceitem3(1,4550,NAME_MEATBUGSTEW,1,4284,1,4067,1,4276);
	mob_cauldron_autoexit();
};


instance MOB_CAULDRON_PRODUCEMEATBUGPIE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_cauldron_canproducemeatbugpie;
	information = mob_cauldron_producemeatbugpie_info;
	important = FALSE;
	permanent = TRUE;
	description = NAME_MEATBUGPIE;
};


func void mob_cauldron_producemeatbugpie_info()
{
	b_produceitem3(1,4560,NAME_MEATBUGPIE,1,4284,1,4067,1,4276);
	mob_cauldron_autoexit();
};


instance MOB_CAULDRON_PRODUCEMOLERATSOUP(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_cauldron_canproducemoleratsoup;
	information = mob_cauldron_producemoleratsoup_info;
	important = FALSE;
	permanent = TRUE;
	description = NAME_MOLERATSOUP;
};


func void mob_cauldron_producemoleratsoup_info()
{
	b_produceitem3(1,4542,NAME_MOLERATSOUP,1,4284,1,4069,1,4268);
	mob_cauldron_autoexit();
};


instance MOB_CAULDRON_PRODUCEMOLERATSTEW(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_cauldron_canproducemoleratstew;
	information = mob_cauldron_producemoleratstew_info;
	important = FALSE;
	permanent = TRUE;
	description = NAME_MOLERATSTEW;
};


func void mob_cauldron_producemoleratstew_info()
{
	b_produceitem3(1,4552,NAME_MOLERATSTEW,1,4284,1,4069,1,4276);
	mob_cauldron_autoexit();
};


instance MOB_CAULDRON_PRODUCEMOLERATPIE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_cauldron_canproducemoleratpie;
	information = mob_cauldron_producemoleratpie_info;
	important = FALSE;
	permanent = TRUE;
	description = NAME_MOLERATPIE;
};


func void mob_cauldron_producemoleratpie_info()
{
	b_produceitem3(1,4562,NAME_MOLERATPIE,1,4284,1,4069,1,4276);
	mob_cauldron_autoexit();
};


instance MOB_CAULDRON_PRODUCEHERBSOUP(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_cauldron_canproduceherbsoup;
	information = mob_cauldron_produceherbsoup_info;
	important = FALSE;
	permanent = TRUE;
	description = NAME_HERBSOUP;
};


func void mob_cauldron_produceherbsoup_info()
{
	b_produceitem3(1,4544,NAME_HERBSOUP,1,4284,1,5069,1,4268);
	mob_cauldron_autoexit();
};


instance MOB_CAULDRON_PRODUCEHERBSTEW(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_cauldron_canproduceherbstew;
	information = mob_cauldron_produceherbstew_info;
	important = FALSE;
	permanent = TRUE;
	description = NAME_HERBSTEW;
};


func void mob_cauldron_produceherbstew_info()
{
	b_produceitem3(1,4554,NAME_HERBSTEW,1,4284,1,5069,1,4276);
	mob_cauldron_autoexit();
};


instance MOB_CAULDRON_PRODUCEHERBPIE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_cauldron_canproduceherbpie;
	information = mob_cauldron_produceherbpie_info;
	important = FALSE;
	permanent = TRUE;
	description = NAME_HERBPIE;
};


func void mob_cauldron_produceherbpie_info()
{
	b_produceitem3(1,4564,NAME_HERBPIE,1,4284,1,5069,1,4276);
	mob_cauldron_autoexit();
};


instance MOB_CAULDRON_PRODUCEMUSHROOMSOUP(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_cauldron_canproducemushroomsoup;
	information = mob_cauldron_producemushroomsoup_info;
	important = FALSE;
	permanent = TRUE;
	description = NAME_MUSHROOMSOUP;
};


func void mob_cauldron_producemushroomsoup_info()
{
	b_produceitem3(1,4546,NAME_MUSHROOMSOUP,1,4284,1,5067,1,4268);
	mob_cauldron_autoexit();
};


instance MOB_CAULDRON_PRODUCEMUSHROOMSTEW(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_cauldron_canproducemushroomstew;
	information = mob_cauldron_producemushroomstew_info;
	important = FALSE;
	permanent = TRUE;
	description = NAME_MUSHROOMSTEW;
};


func void mob_cauldron_producemushroomstew_info()
{
	b_produceitem3(1,4556,NAME_MUSHROOMSTEW,1,4284,1,5067,1,4276);
	mob_cauldron_autoexit();
};


instance MOB_CAULDRON_PRODUCEMUSHROOMPIE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_cauldron_canproducemushroompie;
	information = mob_cauldron_producemushroompie_info;
	important = FALSE;
	permanent = TRUE;
	description = NAME_MUSHROOMPIE;
};


func void mob_cauldron_producemushroompie_info()
{
	b_produceitem3(1,4566,NAME_MUSHROOMPIE,1,4284,1,5067,1,4276);
	mob_cauldron_autoexit();
};


instance MOB_CAULDRON_PRODUCEMEATSOUP(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_cauldron_canproducemeatsoup;
	information = mob_cauldron_producemeatsoup_info;
	important = FALSE;
	permanent = TRUE;
	description = NAME_MEATSOUP;
};


func void mob_cauldron_producemeatsoup_info()
{
	b_produceitem3(1,4548,NAME_MEATSOUP,1,4284,1,4270,1,4268);
	mob_cauldron_autoexit();
};


instance MOB_CAULDRON_PRODUCEMEATSTEW(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_cauldron_canproducemeatstew;
	information = mob_cauldron_producemeatstew_info;
	important = FALSE;
	permanent = TRUE;
	description = NAME_MEATSTEW;
};


func void mob_cauldron_producemeatstew_info()
{
	b_produceitem3(1,4558,NAME_MEATSTEW,1,4284,1,4270,1,4276);
	mob_cauldron_autoexit();
};


instance MOB_CAULDRON_PRODUCEMEATPIE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_cauldron_canproducemeatpie;
	information = mob_cauldron_producemeatpie_info;
	important = FALSE;
	permanent = TRUE;
	description = NAME_MEATPIE;
};


func void mob_cauldron_producemeatpie_info()
{
	b_produceitem3(1,4568,NAME_MEATPIE,1,4284,1,4270,1,4276);
	mob_cauldron_autoexit();
};

