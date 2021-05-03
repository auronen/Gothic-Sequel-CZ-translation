
func int mob_lab_hasbasics()
{
	printdebugmobsi("MOB_Lab_HasBasics");
	if(hero.aivar[33] == AIV_AM_LAB)
	{
		return TRUE;
	};
};

func int mob_lab_canproducehealth1()
{
	printdebugmobsi("MOB_Lab_CanProduceHealth1");
	if((Npc_GetTalentSkill(self,NPC_TALENT_ALCHEMY) >= TAL_STEP_1) && (Npc_HasItems(self,itmi_alcohol) >= 1) && (Npc_HasItems(self,itpl_mountainmoss) >= 1) && (Npc_HasItems(self,itpl_orcleaf) >= 1) && KNOWS_HEALINGPOTIONS && mob_lab_hasbasics())
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

func int mob_lab_canproducemana1()
{
	printdebugmobsi("MOB_Lab_CanProduceMana1");
	if((Npc_GetTalentSkill(self,NPC_TALENT_ALCHEMY) >= TAL_STEP_1) && (Npc_HasItems(self,itmi_alcohol) >= 1) && (Npc_HasItems(self,itpl_stoneroot) >= 1) && (Npc_HasItems(self,itpl_orcleaf) >= 1) && KNOWS_MANAPOTIONS && mob_lab_hasbasics())
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

func int mob_lab_canproducespeed1()
{
	printdebugmobsi("MOB_Lab_CanProduceSpeed1");
	if((Npc_GetTalentSkill(self,NPC_TALENT_ALCHEMY) >= TAL_STEP_1) && (Npc_HasItems(self,itmi_alcohol) >= 1) && (Npc_HasItems(self,itpl_bloodthistle) >= 1) && (Npc_HasItems(self,itpl_orcleaf) >= 1) && KNOWS_SPEEDPOTIONS && mob_lab_hasbasics())
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

func int mob_lab_canproducehealth2()
{
	printdebugmobsi("MOB_Lab_CanProduceHealth2");
	if((Npc_GetTalentSkill(self,NPC_TALENT_ALCHEMY) >= TAL_STEP_2) && (Npc_HasItems(self,itmi_alcohol) >= 1) && (Npc_HasItems(self,itpl_mountainmoss) >= 1) && (Npc_HasItems(self,itpl_ravenherb) >= 1) && KNOWS_HEALINGPOTIONS && mob_lab_hasbasics())
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

func int mob_lab_canproducemana2()
{
	printdebugmobsi("MOB_Lab_CanProduceMana2");
	if((Npc_GetTalentSkill(self,NPC_TALENT_ALCHEMY) >= TAL_STEP_2) && (Npc_HasItems(self,itmi_alcohol) >= 1) && (Npc_HasItems(self,itpl_stoneroot) >= 1) && (Npc_HasItems(self,itpl_ravenherb) >= 1) && KNOWS_MANAPOTIONS && mob_lab_hasbasics())
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

func int mob_lab_canproducespeed2()
{
	printdebugmobsi("MOB_Lab_CanProduceSpeed2");
	if((Npc_GetTalentSkill(self,NPC_TALENT_ALCHEMY) >= TAL_STEP_2) && (Npc_HasItems(self,itmi_alcohol) >= 1) && (Npc_HasItems(self,itpl_bloodthistle) >= 1) && (Npc_HasItems(self,itpl_ravenherb) >= 1) && KNOWS_SPEEDPOTIONS && mob_lab_hasbasics())
	{
		printdebugmobsi(PD_TRUE);
		return TRUE;
	}
	else
	{
		printdebugmobsi(".,.FALSE");
		return FALSE;
	};
};

func int mob_lab_canproducehealth3()
{
	printdebugmobsi("MOB_Lab_CanProduceHealth3");
	if((Npc_GetTalentSkill(self,NPC_TALENT_ALCHEMY) >= TAL_STEP_3) && (Npc_HasItems(self,itmi_alcohol) >= 1) && (Npc_HasItems(self,itpl_mountainmoss) >= 1) && (Npc_HasItems(self,itpl_nightshade) >= 1) && KNOWS_HEALINGPOTIONS && mob_lab_hasbasics())
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

func int mob_lab_canproducemana3()
{
	printdebugmobsi("MOB_Lab_CanProduceMana3");
	if((Npc_GetTalentSkill(self,NPC_TALENT_ALCHEMY) >= TAL_STEP_3) && (Npc_HasItems(self,itmi_alcohol) >= 1) && (Npc_HasItems(self,itpl_stoneroot) >= 1) && (Npc_HasItems(self,itpl_nightshade) >= 1) && KNOWS_MANAPOTIONS && mob_lab_hasbasics())
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

func int mob_lab_canproducespeed3()
{
	printdebugmobsi("MOB_Lab_CanProduceSpeed3");
	if((Npc_GetTalentSkill(self,NPC_TALENT_ALCHEMY) >= TAL_STEP_3) && (Npc_HasItems(self,itmi_alcohol) >= 1) && (Npc_HasItems(self,itpl_bloodthistle) >= 1) && (Npc_HasItems(self,itpl_nightshade) >= 1) && KNOWS_SPEEDPOTIONS && mob_lab_hasbasics())
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

func int mob_lab_canproducehealth()
{
	printdebugmobsi("MOB_Lab_CanProduceHealth");
	if(mob_lab_canproducehealth1() || mob_lab_canproducehealth2() || mob_lab_canproducehealth3())
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

func int mob_lab_canproducemana()
{
	printdebugmobsi("MOB_Lab_CanProduceMana");
	if(mob_lab_canproducemana1() || mob_lab_canproducemana2() || mob_lab_canproducemana3())
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

func int mob_lab_canproducespeed()
{
	printdebugmobsi("MOB_Lab_CanProduceSpeed");
	if(mob_lab_canproducespeed1() || mob_lab_canproducespeed2() || mob_lab_canproducespeed3())
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

func int mob_lab_canproduce()
{
	printdebugmobsi("MOB_Lab_CanProduce");
	if(mob_lab_canproducehealth() || mob_lab_canproducemana() || mob_lab_canproducespeed())
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

func string mob_lab_getcantstring()
{
	printdebugmobsi("MOB_Lab_GetCantString");
	if(Npc_GetTalentSkill(self,NPC_TALENT_ALCHEMY) < 1)
	{
		printdebugmobsi("...no Talent");
		return _STR_MESSAGE_MOBSI_LAB_TAL;
	}
	else
	{
		printdebugmobsi("...no Material");
		return _STR_MESSAGE_MOBSI_LAB_MAT;
	};
};

func int mob_lab_condition()
{
	printdebugmobsi("MOB_Lab_CONDITION");
	self.aivar[33] = AIV_AM_LAB;
	if(Npc_IsPlayer(self))
	{
		if(mob_lab_canproduce())
		{
			printdebugmobsi(PD_TRUE);
			return TRUE;
		}
		else
		{
			PrintScreen(mob_lab_getcantstring(),-1,_YPOS_MESSAGE_MOBSI,FONT_OLD_SMALL,_TIME_MESSAGE_MOBSI);
			AI_PlayAni(self,"T_DONTKNOW");
			printdebugmobsi(PD_FALSE);
			return FALSE;
		};
	}
	else
	{
		printdebugmobsi(PD_TRUE);
		return TRUE;
	};
};

func void mob_lab_s0()
{
	if(B_CompareNpcInstance(self,hero))
	{
		ai_removeitemfromslot(self,"ZS_RIGHTHAND");
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
	};
	printdebugmobsi("MOB_LAB_S0");
};

func void mob_lab_s1()
{
	printdebugmobsi("MOB_Lab_S1");
	if(B_CompareNpcInstance(self,hero))
	{
		printdebugmobsi("...vom SC benutzt");
		PrintGlobals(PD_ITEM_MOBSI);
		self.aivar[24] = TRUE;
		self.aivar[33] = AIV_AM_LAB;
		AI_ProcessInfos(self);
	};
};


instance MOB_LAB_EXIT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = mob_lab_exit_condition;
	information = mob_lab_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int mob_lab_exit_condition()
{
	return hero.aivar[33] == AIV_AM_LAB;
};

func void mob_lab_exit_info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[24] = FALSE;
	AI_UseMob(self,SCEMENAME_LAB,-1);
};

func void mob_lab_autoexit()
{
	printdebugmobsi("MOB_Lab_AutoExit");
	if(!mob_lab_canproduce())
	{
		mob_lab_exit_info();
	};
};


instance MOB_LAB_PRODUCEHEALTH1(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_lab_canproducehealth1;
	information = mob_lab_producehealth1_info;
	important = FALSE;
	permanent = TRUE;
	description = NAME_HEALTHPOTION1;
};


func void mob_lab_producehealth1_info()
{
	b_produceitem3(1,4777,NAME_HEALTHPOTION1,1,4595,1,5055,1,5061);
	mob_lab_autoexit();
};


instance MOB_LAB_PRODUCEHEALTH2(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_lab_canproducehealth2;
	information = mob_lab_producehealth2_info;
	important = FALSE;
	permanent = TRUE;
	description = NAME_HEALTHPOTION2;
};


func void mob_lab_producehealth2_info()
{
	b_produceitem3(1,4779,NAME_HEALTHPOTION2,1,4595,1,5055,1,5063);
	mob_lab_autoexit();
};


instance MOB_LAB_PRODUCEHEALTH3(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_lab_canproducehealth3;
	information = mob_lab_producehealth3_info;
	important = FALSE;
	permanent = TRUE;
	description = NAME_HEALTHPOTION3;
};


func void mob_lab_producehealth3_info()
{
	b_produceitem3(1,4781,NAME_HEALTHPOTION3,1,4595,1,5055,1,5065);
	mob_lab_autoexit();
};


instance MOB_LAB_PRODUCEMANA1(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_lab_canproducemana1;
	information = mob_lab_producemana1_info;
	important = FALSE;
	permanent = TRUE;
	description = NAME_MANAPOTION1;
};


func void mob_lab_producemana1_info()
{
	b_produceitem3(1,4771,NAME_MANAPOTION1,1,4595,1,5057,1,5061);
	mob_lab_autoexit();
};


instance MOB_LAB_PRODUCEMANA2(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_lab_canproducemana2;
	information = mob_lab_producemana2_info;
	important = FALSE;
	permanent = TRUE;
	description = NAME_MANAPOTION2;
};


func void mob_lab_producemana2_info()
{
	b_produceitem3(1,4773,NAME_MANAPOTION2,1,4595,1,5057,1,5063);
	mob_lab_autoexit();
};


instance MOB_LAB_PRODUCEMANA3(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_lab_canproducemana3;
	information = mob_lab_producemana3_info;
	important = FALSE;
	permanent = TRUE;
	description = NAME_MANAPOTION3;
};


func void mob_lab_producemana3_info()
{
	b_produceitem3(1,4775,NAME_MANAPOTION3,1,4595,1,5057,1,5065);
	mob_lab_autoexit();
};


instance MOB_LAB_PRODUCESPEED1(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_lab_canproducespeed1;
	information = mob_lab_producespeed1_info;
	important = FALSE;
	permanent = TRUE;
	description = NAME_SPEEDPOTION1;
};


func void mob_lab_producespeed1_info()
{
	b_produceitem3(1,4813,NAME_SPEEDPOTION1,1,4595,1,5059,1,5061);
	mob_lab_autoexit();
};


instance MOB_LAB_PRODUCESPEED2(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_lab_canproducespeed2;
	information = mob_lab_producespeed2_info;
	important = FALSE;
	permanent = TRUE;
	description = NAME_SPEEDPOTION2;
};


func void mob_lab_producespeed2_info()
{
	b_produceitem3(1,4815,NAME_SPEEDPOTION2,1,4595,1,5059,1,5063);
	mob_lab_autoexit();
};


instance MOB_LAB_PRODUCESPEED3(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_lab_canproducespeed3;
	information = mob_lab_producespeed3_info;
	important = FALSE;
	permanent = TRUE;
	description = NAME_SPEEDPOTION3;
};


func void mob_lab_producespeed3_info()
{
	b_produceitem3(1,4817,NAME_SPEEDPOTION3,1,4595,1,5059,1,5065);
	mob_lab_autoexit();
};

