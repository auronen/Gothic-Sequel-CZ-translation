///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
INSTANCE BEG_703_BEGGAR_EXIT   (C_INFO)
{
	npc         = BEG_703_BEGGAR;
	nr          = 999;
	condition   = BEG_703_BEGGAR_EXIT_Condition;
	information = BEG_703_BEGGAR_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT BEG_703_BEGGAR_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID BEG_703_BEGGAR_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 ///////////////////////////////////////////////////////////////////////
//	Info BEG
///////////////////////////////////////////////////////////////////////
instance BEG_703_BEGGAR_BEG		(C_INFO)
{
	npc		 = 	BEG_703_BEGGAR;
	nr		 = 	1;
	condition	 = 	BEG_703_BEGGAR_BEG_Condition;
	information	 = 	BEG_703_BEGGAR_BEG_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};

func int BEG_703_BEGGAR_BEG_Condition ()
{
	if (Npc_GetDistToNpc (self,hero) <= 600)
	{
		return TRUE;
	};
};
func void BEG_703_BEGGAR_BEG_Info ()
{
	AI_GotoNpc (self,hero);
//	AI_Output	(self, hero, "BEG_703_BEG_00_01"); //Hast du vielleicht ein bisschen Silber?
	AI_Output	(self, hero, "BEG_703_BEG_00_01"); //Neměl bys trochu stříbra?

	Info_ClearChoices (BEG_703_BEGGAR_BEG);
//	Info_AddChoice	(BEG_703_BEGGAR_BEG, "Nein, verpiss dich!", BEG_703_BEGGAR_BEG_NO );
	Info_AddChoice	(BEG_703_BEGGAR_BEG, "Ne, vypadni!", BEG_703_BEGGAR_BEG_NO );

	if Npc_HasItems (hero,ItMi_Silver) >= 1
	{
//		Info_AddChoice	(BEG_703_BEGGAR_BEG, "(1 Silbersück geben)", BEG_703_BEGGAR_BEG_ONE );
		Info_AddChoice	(BEG_703_BEGGAR_BEG, "(dát 1 stříbrný)", BEG_703_BEGGAR_BEG_ONE );
	};
	if Npc_HasItems (hero,ItMi_Silver) >= 5
	{
//		Info_AddChoice	(BEG_703_BEGGAR_BEG, "(5 Silberstücke geben)", BEG_703_BEGGAR_BEG_FIVE );
			Info_AddChoice	(BEG_703_BEGGAR_BEG, "(dát 5 stříbrných)", BEG_703_BEGGAR_BEG_FIVE );
	};
//	Info_AddChoice	(BEG_703_BEGGAR_BEG, "Ich habe gerade leider kein Silber dabei", BEG_703_BEGGAR_BEG_SORRY );
	Info_AddChoice	(BEG_703_BEGGAR_BEG, "Bohužel zrovna u sebe nemám žádné stříbro.", BEG_703_BEGGAR_BEG_SORRY );

};
func void BEG_703_BEGGAR_BEG_NO ()
{
//	AI_Output			(hero, self, "BEG_703_BEG_NO_15_01"); //Nein, verpiss dich!
	AI_Output			(hero, self, "BEG_703_BEG_NO_15_01"); //Ne, vypadni!

	Beggars_Secrets = Beggars_Secrets - 1;
	Info_ClearChoices (BEG_703_BEGGAR_BEG);
	AI_StopProcessInfos (self);
};

func void BEG_703_BEGGAR_BEG_FIVE ()
{
//	AI_Output			(hero, self, "BEG_703_BEG_FIVE_15_01"); //Reichen diese 5 Silberstücke?
	AI_Output			(hero, self, "BEG_703_BEG_FIVE_15_01"); //Stačí těchhle 5 stříbrných?
	B_GiveInvItems		(hero, self, ITMI_Silver,5);
//	AI_Output			(self, hero, "BEG_703_BEG_FIVE_00_02"); //Das ist weit mehr als genug, danke! Wenn du Neuigkeiten erfahren willst, sei weiterhin so großzügig!
	AI_Output			(self, hero, "BEG_703_BEG_FIVE_00_02"); //To je víc než dost, díky! Pokud bys chtěl vědět novinky, buď dále tak velkorysý!

	Beggars_Secrets = Beggars_Secrets + 1;
	Info_ClearChoices	(BEG_703_BEGGAR_BEG);
	AI_StopProcessInfos (self);
};

func void BEG_703_BEGGAR_BEG_SORRY ()
{
//	AI_Output			(hero, self, "BEG_703_BEG_SORRY_15_01"); //Ich habe gerade leider kein Silber dabei.
	AI_Output			(hero, self, "BEG_703_BEG_SORRY_15_01"); //Bohužel zrovna u sebe nemám žádné stříbro.
	Info_ClearChoices	(BEG_703_BEGGAR_BEG);
	AI_StopProcessInfos (self);
};

func void BEG_703_BEGGAR_BEG_ONE ()
{
//	AI_Output			(hero, self, "BEG_703_BEG_ONE_15_01"); //Nimm erstmal dieses Silberstück.
	AI_Output			(hero, self, "BEG_703_BEG_ONE_15_01"); //Vem si zatím tenhle stříbrňák.
	B_GiveInvItems		(hero,self,ITMI_Silver,1);
//	AI_Output			(self, hero, "BEG_703_BEG_ONE_00_02"); //Wer ein Silber nicht ehrt..jaja ich kenne die Sprüche. // Ale já to rčení neznám, tak nevím, jestli by to nešlo přeložit líp.
	AI_Output			(self, hero, "BEG_703_BEG_ONE_00_02"); //Kdo nectí stříbro...ano, znám to rčení.

	Info_ClearChoices	(BEG_703_BEGGAR_BEG);
	AI_StopProcessInfos (self);
};
 ///////////////////////////////////////////////////////////////////////
//	Info BEG2 (nach einmaligen Ansprechen durch die Bettler kann der Spieler die Bettler immer wieder von sich aus ansprechen
///////////////////////////////////////////////////////////////////////
instance BEG_703_BEGGAR_BEG2		(C_INFO)
{
	npc		 = 	BEG_703_BEGGAR;
	nr		 = 	1;
	condition	 = 	BEG_703_BEGGAR_BEG2_Condition;
	information	 = 	BEG_703_BEGGAR_BEG2_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int BEG_703_BEGGAR_BEG2_Condition ()
{
	if C_NPCisinvincible (hero)
	&& Npc_KnowsInfo (hero,BEG_703_BEGGAR_BEG)
	{
		return TRUE;
	};
};
func void BEG_703_BEGGAR_BEG2_Info ()
{
	AI_GotoNpc (self,hero);
//	AI_Output	(self, hero, "BEG_703_BEG_00_01"); //Hast du vielleicht ein bisschen Silber?
	AI_Output	(self, hero, "BEG_703_BEG_00_01"); //Neměl bys trochu stříbra?
	Info_ClearChoices (BEG_703_BEGGAR_BEG);
//	Info_AddChoice	(BEG_703_BEGGAR_BEG2, "Nein, verpiss dich!", BEG_703_BEGGAR_BEG_NO );
	Info_AddChoice	(BEG_703_BEGGAR_BEG2, "Ne, vypadni!", BEG_703_BEGGAR_BEG_NO );

	if Npc_HasItems (hero,ItMi_Silver) >= 1
	{
//		Info_AddChoice	(BEG_703_BEGGAR_BEG2, "(1 Silbersück geben)", BEG_703_BEGGAR_BEG_ONE );
		Info_AddChoice	(BEG_703_BEGGAR_BEG2, "(dát 1 stříbrný)", BEG_703_BEGGAR_BEG_ONE );
	};
	if Npc_HasItems (hero,ItMi_Silver) >= 5
	{
//		Info_AddChoice	(BEG_703_BEGGAR_BEG2, "(5 Silberstücke geben)", BEG_703_BEGGAR_BEG_FIVE );
		Info_AddChoice	(BEG_703_BEGGAR_BEG2, "(dát 5 stříbrných)", BEG_703_BEGGAR_BEG_FIVE );
	};
//	Info_AddChoice	(BEG_703_BEGGAR_BEG2, "Ich habe gerade leider kein Silber dabei", BEG_703_BEGGAR_BEG_SORRY );
	Info_AddChoice	(BEG_703_BEGGAR_BEG2, "Bohužel zrovna u sebe nemám žádné stříbro.", BEG_703_BEGGAR_BEG_SORRY );

};







