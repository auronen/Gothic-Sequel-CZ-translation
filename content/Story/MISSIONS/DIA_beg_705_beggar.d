///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
INSTANCE BEG_705_BEGGAR_EXIT   (C_INFO)
{
	npc         = BEG_705_BEGGAR;
	nr          = 999;
	condition   = BEG_705_BEGGAR_EXIT_Condition;
	information = BEG_705_BEGGAR_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT BEG_705_BEGGAR_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID BEG_705_BEGGAR_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 ///////////////////////////////////////////////////////////////////////
//	Info BEG
///////////////////////////////////////////////////////////////////////
instance BEG_705_BEGGAR_BEG		(C_INFO)
{
	npc		 = 	BEG_705_BEGGAR;
	nr		 = 	1;
	condition	 = 	BEG_705_BEGGAR_BEG_Condition;
	information	 = 	BEG_705_BEGGAR_BEG_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};

func int BEG_705_BEGGAR_BEG_Condition ()
{
	if (Npc_GetDistToNpc (self,hero) <= 600)
	{
		return TRUE;
	};
};

func VOID BEG_705_BEGGAR_BEG_Info ()
{
	AI_GotoNpc (self,hero);
//	AI_Output	(self, hero, "BEG_705_BEG_00_01"); //Hey, du hast doch bestimmt ein bisschen Silber für mich...!?
	AI_Output	(self, hero, "BEG_705_BEG_00_01"); //Hej, určitě bys pro mě měl trochu stříbra...!?

	Info_ClearChoices (BEG_705_BEGGAR_BEG);
//	Info_AddChoice	(BEG_705_BEGGAR_BEG, "Nein, verpiss dich!", BEG_705_BEGGAR_BEG_NO );
	Info_AddChoice	(BEG_705_BEGGAR_BEG, "Neměl, vypadni!", BEG_705_BEGGAR_BEG_NO );

	if Npc_HasItems (hero,ItMi_Silver) >= 1
	{
//		Info_AddChoice	(BEG_705_BEGGAR_BEG, "(1 Silbersück geben)", BEG_705_BEGGAR_BEG_ONE );
			Info_AddChoice	(BEG_705_BEGGAR_BEG, "(dát 1 stříbrný)", BEG_705_BEGGAR_BEG_ONE );
	};
	if Npc_HasItems (hero,ItMi_Silver) >= 5
	{
//		Info_AddChoice	(BEG_705_BEGGAR_BEG, "(5 Silberstücke geben)", BEG_705_BEGGAR_BEG_FIVE );
			Info_AddChoice	(BEG_705_BEGGAR_BEG, "(dát 5 stříbrných)", BEG_705_BEGGAR_BEG_FIVE );
	};
//	Info_AddChoice	(BEG_705_BEGGAR_BEG, "Ich habe gerade leider kein Silber dabei", BEG_705_BEGGAR_BEG_SORRY );
	Info_AddChoice	(BEG_705_BEGGAR_BEG, "Bohužel u sebe zrovna nemám žádné stříbro", BEG_705_BEGGAR_BEG_SORRY );

};
func void BEG_705_BEGGAR_BEG_NO ()
{
//	AI_Output			(hero, self, "BEG_700_BEG_NO_15_01"); //Nein, verpiss dich!
	AI_Output			(hero, self, "BEG_700_BEG_NO_15_01"); //Neměl, vypadni!
	Info_ClearChoices	(BEG_705_BEGGAR_BEG);
	AI_StopProcessInfos (self);
};

func void BEG_705_BEGGAR_BEG_FIVE ()
{
//	AI_Output			(hero, self, "BEG_700_BEG_FIVE_15_01"); //Hier, nimm diese 5 Silberstücke.
	AI_Output			(hero, self, "BEG_700_BEG_FIVE_15_01"); //Na, vezmi si 5 stříbrných.
	B_GiveInvItems		(hero, self, ITMI_Silver,5);
//	AI_Output			(self, hero, "BEG_700_BEG_FIVE_00_02"); //Danke Mann, vielleicht können wir Bettler dir ja auch mal helfen...
	AI_Output			(self, hero, "BEG_700_BEG_FIVE_00_02"); //Díky, snad bychom ti my, žebráci, mohli taky někdy pomoct...

	Beggars_Secrets = Beggars_Secrets + 1;
	Info_ClearChoices	(BEG_705_BEGGAR_BEG);
	AI_StopProcessInfos (self);
};

func void BEG_705_BEGGAR_BEG_SORRY ()
{
//	AI_Output			(hero, self, "BEG_700_BEG_SORRY_15_01"); //Ich habe gerade leider kein Silber dabei.
	AI_Output			(hero, self, "BEG_700_BEG_SORRY_15_01"); //Bohužel u sebe zrovna nemám žádné stříbro.

	AI_StopProcessInfos (self);
};

func void BEG_705_BEGGAR_BEG_ONE ()
{
//	AI_Output			(hero, self, "BEG_700_BEG_ONE_15_01"); //Hier, nimm dieses Silberstück.
	AI_Output			(hero, self, "BEG_700_BEG_ONE_15_01"); //Na, vezmi si tenhle stříbrný.
	B_GiveInvItems		(hero, self, ITMI_Silver,1);
//	AI_Output			(self, hero, "BEG_700_BEG_ONE_00_02"); //Damit hast du mir wirklich geholfen.
	AI_Output			(self, hero, "BEG_700_BEG_ONE_00_02"); //Tím jsi mi opravdu pomohl.

	Info_ClearChoices	(BEG_705_BEGGAR_BEG);
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info BEG2 (nach einmaligen Ansprechen durch die Bettler kann der Spieler die Bettler immer wieder von sich aus ansprechen
///////////////////////////////////////////////////////////////////////
instance BEG_705_BEGGAR_BEG2		(C_INFO)
{
	npc		 	 = 	BEG_705_BEGGAR;
	nr		 	 = 	1;
	condition	 = 	BEG_705_BEGGAR_BEG2_Condition;
	information	 = 	BEG_705_BEGGAR_BEG2_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int BEG_705_BEGGAR_BEG2_Condition ()
{
	if C_NPCisinvincible (hero)
	&& Npc_KnowsInfo (hero,BEG_705_BEGGAR_BEG)
	{
		return TRUE;
	};
};
func void BEG_705_BEGGAR_BEG2_Info ()
{
	AI_GotoNpc			(self,hero);
//	AI_Output			(self, hero, "BEG_705_BEG_00_01"); //Hey, du hast doch bestimmt ein bisschen Silber für mich...!?
	AI_Output			(self, hero, "BEG_705_BEG_00_01"); //Hej, určitě bys pro mě měl trochu stříbra...!?
	Info_ClearChoices	(BEG_705_BEGGAR_BEG);
//	Info_AddChoice		(BEG_705_BEGGAR_BEG2, "Nein, verpiss dich!", BEG_705_BEGGAR_BEG_NO );
	Info_AddChoice		(BEG_705_BEGGAR_BEG2, "Neměl, vypadni!", BEG_705_BEGGAR_BEG_NO );

	if Npc_HasItems (hero,ItMi_Silver) >= 1
	{
//		Info_AddChoice	(BEG_705_BEGGAR_BEG2, "(1 Silbersück geben)", BEG_705_BEGGAR_BEG_ONE );
			Info_AddChoice	(BEG_705_BEGGAR_BEG2, "(dát 1 stříbrný)", BEG_705_BEGGAR_BEG_ONE );
	};
	if Npc_HasItems (hero,ItMi_Silver) >= 5
	{
//		Info_AddChoice	(BEG_705_BEGGAR_BEG2, "(5 Silberstücke geben)", BEG_705_BEGGAR_BEG_FIVE );
		Info_AddChoice	(BEG_705_BEGGAR_BEG2, "(dát 5 stříbrných)", BEG_705_BEGGAR_BEG_FIVE );
	};
//	Info_AddChoice		(BEG_705_BEGGAR_BEG2, "Ich habe gerade leider kein Silber dabei", BEG_705_BEGGAR_BEG_SORRY );
	Info_AddChoice		(BEG_705_BEGGAR_BEG2, "Bohužel u sebe zrovna nemám žádné stříbro", BEG_705_BEGGAR_BEG_SORRY );

};

