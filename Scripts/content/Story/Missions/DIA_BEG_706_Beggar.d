///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
INSTANCE BEG_706_BEGGAR_EXIT   (C_INFO)
{
	npc         = BEG_706_BEGGAR;
	nr          = 999;
	condition   = BEG_706_BEGGAR_EXIT_Condition;
	information = BEG_706_BEGGAR_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT BEG_706_BEGGAR_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID BEG_706_BEGGAR_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 ///////////////////////////////////////////////////////////////////////
//	Info BEG
///////////////////////////////////////////////////////////////////////
instance BEG_706_BEGGAR_BEG		(C_INFO)
{
	npc		 = 	BEG_706_BEGGAR;
	nr		 = 	1;
	condition	 = 	BEG_706_BEGGAR_BEG_Condition;
	information	 = 	BEG_706_BEGGAR_BEG_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};

func int BEG_706_BEGGAR_BEG_Condition ()
{
	if (Npc_GetDistToNpc (self,hero) <= 600)
	{
		return TRUE;
	};
};

func void BEG_706_BEGGAR_BEG_Info ()
{
	AI_GotoNpc			(self,hero);
//	AI_Output			(self, hero, "BEG_706_BEG_00_01"); //Silber für einen Armen, Silber für einen Armen!
	AI_Output			(self, hero, "BEG_706_BEG_00_01"); //Stříbro pro chudáka, stříbro pro chudáka!
	Info_ClearChoices	(BEG_706_BEGGAR_BEG);
//	Info_AddChoice		(BEG_706_BEGGAR_BEG, "Nein, verpiss dich!", BEG_706_BEGGAR_BEG_NO );
	Info_AddChoice		(BEG_706_BEGGAR_BEG, "Ne, vypadni!", BEG_706_BEGGAR_BEG_NO );

	if Npc_HasItems (hero,ItMi_Silver) >= 1
	{
//		Info_AddChoice	(BEG_706_BEGGAR_BEG, "(1 Silbersück geben)", BEG_706_BEGGAR_BEG_ONE );
			Info_AddChoice	(BEG_706_BEGGAR_BEG, "(dát 1 stříbrný)", BEG_706_BEGGAR_BEG_ONE );
	};
	if Npc_HasItems (hero,ItMi_Silver) >= 5
	{
//		Info_AddChoice	(BEG_706_BEGGAR_BEG, "(5 Silberstücke geben)", BEG_706_BEGGAR_BEG_FIVE );
			Info_AddChoice	(BEG_706_BEGGAR_BEG, "(dát 5 stříbrných)", BEG_706_BEGGAR_BEG_FIVE );
	};
//	Info_AddChoice		(BEG_706_BEGGAR_BEG, "Ich habe gerade leider kein Silber dabei", BEG_706_BEGGAR_BEG_SORRY );
	Info_AddChoice		(BEG_706_BEGGAR_BEG, "Bohužel zrovna u sebe žádné stříbro nemám", BEG_706_BEGGAR_BEG_SORRY );

};
func void BEG_706_BEGGAR_BEG_NO ()
{
//	AI_Output			(hero, self, "BEG_706_BEG_NO_15_01"); //Nein, verpiss dich!
	AI_Output			(hero, self, "BEG_706_BEG_NO_15_01"); //Ne, vypadni!

	Beggars_Secrets = Beggars_Secrets - 1;
	AI_StopProcessInfos (self);
};

func void BEG_706_BEGGAR_BEG_FIVE ()
{
//	AI_Output			(hero, self, "BEG_706_BEG_FIVE_15_01"); //Vielleicht bringen dich diese 5 Silberstücke weiter.
	AI_Output			(hero, self, "BEG_706_BEG_FIVE_15_01"); //Snad ti pomůže těchto 5 stříbrných.
	B_GiveInvItems		(hero, self, ITMI_Silver,5);
//	AI_Output			(self, hero, "BEG_706_BEG_FIVE_00_02"); //Überaus großzügig, vielen Dank. Vielleicht bringt dich diese Gabe auch weiter...
	AI_Output			(self, hero, "BEG_706_BEG_FIVE_00_02"); //Velkorysé, moc děkuji. Možná, že ti tento dobrý skutek taky prospěje...

	Beggars_Secrets = Beggars_Secrets + 1;
	Info_ClearChoices	(BEG_706_BEGGAR_BEG);
	AI_StopProcessInfos (self);
};

func void BEG_706_BEGGAR_BEG_SORRY ()
{
//	AI_Output			(hero, self, "BEG_706_BEG_SORRY_15_01"); //Ich habe gerade leider kein Silber dabei.
	AI_Output			(hero, self, "BEG_706_BEG_SORRY_15_01"); //Bohužel zrovna u sebe žádné stříbro nemám.
	AI_StopProcessInfos (self);
};

func void BEG_706_BEGGAR_BEG_ONE ()
{
//	AI_Output			(hero, self, "BEG_706_BEG_ONE_15_01"); //Hier, nimm dieses Silberstück.
	AI_Output			(hero, self, "BEG_706_BEG_ONE_15_01"); //Na, vezmi si tento stříbrňák.
	B_GiveInvItems		(hero, self, ITMI_Silver,1);
//	AI_Output			(self, hero, "BEG_706_BEG_ONE_00_02"); //Danke. Vielleicht bekomme ich dafür sogar etwas zu Essen...
	AI_Output			(self, hero, "BEG_706_BEG_ONE_00_02"); //Díky. Snad za to dostanu něco k jídlu...

	Info_ClearChoices	(BEG_706_BEGGAR_BEG);
	AI_StopProcessInfos (self);
};
 ///////////////////////////////////////////////////////////////////////
//	Info BEG2 (nach einmaligen Ansprechen durch die Bettler kann der Spieler die Bettler immer wieder von sich aus ansprechen
///////////////////////////////////////////////////////////////////////
instance BEG_706_BEGGAR_BEG2		(C_INFO)
{
	npc		 = 	BEG_706_BEGGAR;
	nr		 = 	1;
	condition	 = 	BEG_706_BEGGAR_BEG2_Condition;
	information	 = 	BEG_706_BEGGAR_BEG2_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int BEG_706_BEGGAR_BEG2_Condition ()
{
	if C_NPCisinvincible (hero)
	&& Npc_KnowsInfo (hero,BEG_706_BEGGAR_BEG)
	{
		return TRUE;
	};
};
func int BEG_706_BEGGAR_BEG2_Info ()
{
	AI_GotoNpc (self,hero);
//	AI_Output	(self, hero, "BEG_706_BEG_00_01"); //Silber für einen Armen, Silber für einen Armen!
	AI_Output	(self, hero, "BEG_706_BEG_00_01"); //Stříbro pro chudáka, stříbro pro chudáka!

	Info_ClearChoices (BEG_706_BEGGAR_BEG);
//	Info_AddChoice	(BEG_706_BEGGAR_BEG2, "Nein, verpiss dich!", BEG_706_BEGGAR_BEG_NO );
	Info_AddChoice	(BEG_706_BEGGAR_BEG2, "Ne, vypadni!", BEG_706_BEGGAR_BEG_NO );

	if	(Npc_HasItems (hero,ItMi_Silver) >= 1)
	{
//		Info_AddChoice	(BEG_706_BEGGAR_BEG2, "(1 Silbersück geben)", BEG_706_BEGGAR_BEG_ONE );
			Info_AddChoice	(BEG_706_BEGGAR_BEG2, "(dát 1 stříbrný)", BEG_706_BEGGAR_BEG_ONE );
	};
	if	(Npc_HasItems (hero,ItMi_Silver) >= 5)
	{
//		Info_AddChoice	(BEG_706_BEGGAR_BEG2, "(5 Silberstücke geben)", BEG_706_BEGGAR_BEG_FIVE );
			Info_AddChoice	(BEG_706_BEGGAR_BEG2, "(dát 5 stříbrných)", BEG_706_BEGGAR_BEG_FIVE );
	};
//	Info_AddChoice	(BEG_706_BEGGAR_BEG2, "Ich habe gerade leider kein Silber dabei", BEG_706_BEGGAR_BEG_SORRY );
	Info_AddChoice	(BEG_706_BEGGAR_BEG2, "Bohužel zrovna u sebe žádné stříbro nemám", BEG_706_BEGGAR_BEG_SORRY );

};







