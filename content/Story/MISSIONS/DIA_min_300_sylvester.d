
instance INFO_SYLVESTER_EXIT(C_Info)
{
	npc = min_300_sylvester;
	nr = 999;
	condition = info_sylvester_exit_condition;
	information = info_sylvester_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int info_sylvester_exit_condition()
{
	return TRUE;
};

func void info_sylvester_exit_info()
{
	AI_StopProcessInfos(self);
};


instance MIN_300_SYLVESTER_HOWDY(C_Info)
{
	npc = min_300_sylvester;
	nr = 10;
	condition = min_300_sylvester_howdy_condition;
	information = min_300_sylvester_howdy_info;
	important = FALSE;
	permanent = TRUE;
	description = "Wie geht es so?";
};


func int min_300_sylvester_howdy_condition()
{
	return TRUE;
};

func void min_300_sylvester_howdy_info()
{
	AI_Output(hero,self,"MIN_300_HOWDY_15_01");	//Wie geht es so?
	if(Npc_KnowsInfo(hero,info_sylvester_cave))
	{
		if(SYLVESTER_FRIEND)
		{
			AI_Output(self,hero,"MIN_300_HOWDY_03_02");	//Dank dir kann ich nun endlich wieder mein Essen selbst verdienen!
		}
		else
		{
			AI_Output(self,hero,"MIN_300_HOWDY_03_03");	//Naja, ich kann jetzt weiss ich zwar wo eine neue Erzader ist, aber du hast mich ganz schön dafür bluten lassen!
		};
	}
	else
	{
		AI_Output(self,hero,"MIN_300_HOWDY_03_04");	//Schlecht! Ich habe zur Zeit keine Arbeit! Und jetzt lass mich in Ruhe!
		AI_StopProcessInfos(self);
	};
};


instance INFO_SYLVESTER_PICK(C_Info)
{
	npc = min_300_sylvester;
	nr = 8;
	condition = info_sylvester_pick_condition;
	information = info_sylvester_pick_info;
	important = FALSE;
	permanent = FALSE;
	description = "Nette Spitzhacke, die du da hast!";
};


func int info_sylvester_pick_condition()
{
	if(Npc_HasItems(self,itmw_pickaxe) && Npc_KnowsInfo(hero,info_gotmar_pick2))
	{
		return TRUE;
	};
};

func void info_sylvester_pick_info()
{
	AI_Output(hero,self,"Info_Sylvester_PICK_15_01");	//Nette Spitzhacke, die du da hast!
	AI_Output(self,hero,"Info_Sylvester_PICK_03_02");	//Pah! Wenn ich blos Verwendung dafür hätte...
	AI_Output(hero,self,"Info_Sylvester_PICK_15_03");	//Wie meinst du das?
	AI_Output(self,hero,"Info_Sylvester_PICK_03_04");	//Der einzige Ort, wo ich meine Silber verdienen kann ist die Mine im Norden.
	AI_Output(self,hero,"Info_Sylvester_PICK_03_05");	//Aber meine Kumpels haben den Eingang verrammelt, wegen der Orks die sich da rumtreiben.
	AI_Output(self,hero,"Info_Sylvester_PICK_03_06");	//Jetzt sitze ich hier und kann zusehen, wo ich mein Mittagessen herbekomme.
	Info_ClearChoices(info_sylvester_pick);
	Info_AddChoice(info_sylvester_pick,"Ich kenne einen anderen Ort, an dem du Erz finden kannst.",info_sylvester_pickcave);
	Info_AddChoice(info_sylvester_pick,"Dann könntest du mir ja deine Spitzhacke überlassen.",info_sylvester_pickgive);
};

func void info_sylvester_pickgive()
{
	AI_Output(hero,self,"Info_Sylvester_PICKGIVE_15_01");	//Dann könntest du mir ja deine Spitzhacke überlassen.
	AI_Output(self,hero,"Info_Sylvester_PICKGIVE_03_02");	//Ich bin zwar ohne Arbeit aber nicht ohne Verstand.
	AI_Output(self,hero,"Info_Sylvester_PICKGIVE_03_03");	//Wenn du meine Spitzhacke haben willst, will ich Silber sehen!
	Info_ClearChoices(info_sylvester_pick);
	SYLVESTER_BUYPICK = TRUE;
};

func void info_sylvester_pickcave()
{
	AI_Output(hero,self,"Info_Sylvester_PICKCAVE_15_01");	//Ich kenne einen anderen Ort, an dem du Erz finden kannst.
	AI_Output(self,hero,"Info_Sylvester_PICKCAVE_03_02");	//Was sagst du da? Eine neue Erzader? Wo kann ich sie finden?
	Info_ClearChoices(info_sylvester_pick);
	Info_AddChoice(info_sylvester_pick,"Das kostet dich aber 'ne Kleinigkeit",info_sylvester_pickcost);
	Info_AddChoice(info_sylvester_pick,"Komm mit, ich führe dich hin.",info_sylvester_pickcome);
};

func void info_sylvester_pickcome()
{
	AI_Output(hero,self,"Info_Sylvester_PICKCOME_15_01");	//Komm mit, ich führe dich hin.
	AI_Output(self,hero,"Info_Sylvester_PICKCOME_03_02");	//Du bist echt in Ordnung. Nichts wie los!
	b_followpc(self,"FOLLOW");
	AI_StopProcessInfos(self);
	SYLVESTER_FRIEND = TRUE;
};

func void info_sylvester_pickcost()
{
	AI_Output(hero,self,"Info_Sylvester_PICKCOST_15_01");	//Das kostet dich aber 'ne Kleinigkeit
	AI_Output(self,hero,"Info_Sylvester_PICKCOST_03_02");	//Du bist ein echt eigennütziger Kerl.
	AI_Output(self,hero,"Info_Sylvester_PICKCOST_03_03");	//Aber ich habe keine Wahl.
	AI_Output(self,hero,"Info_Sylvester_PICKCOST_03_04");	//Wenn ich nicht bald eine neue Erzader finde, kann ich mich zu dem bettelnden Lumpenpack gesellen.
	AI_Output(hero,self,"Info_Sylvester_PICKCOST_15_05");	//Tja, jeder ist sich selbst der nächste!
	AI_Output(self,hero,"Info_Sylvester_PICKCOST_03_06");	//OK. wenn du mir die Erzader zeigst, geb ich dir meine Spitzhacke.
	AI_Output(self,hero,"Info_Sylvester_PICKCOST_03_07");	//Hab' noch eine Reservehacke im Rucksack.
	Info_ClearChoices(info_sylvester_pick);
	Info_AddChoice(info_sylvester_pick,"Also wenn du keine Wahl hast, kannst du auch noch was drauflegen!",info_sylvester_pickcostno);
	Info_AddChoice(info_sylvester_pick,"Die Spitzhacke ist OK.",info_sylvester_pickcostyes);
};

func void info_sylvester_pickcostyes()
{
	AI_Output(hero,self,"Info_Sylvester_PICKCOSTYES_15_01");	//Die Spitzhacke ist OK.
	AI_Output(self,hero,"Info_Sylvester_PICKCOSTYES_03_02");	//Hier, und nun zeig mir den Weg zur Ader.
	B_GiveInvItems(self,hero,itmw_pickaxe,1);
	b_followpc(self,"FOLLOW");
	AI_StopProcessInfos(self);
};

func void info_sylvester_pickcostno()
{
	AI_Output(hero,self,"Info_Sylvester_PICKCOSTNO_15_01");	//Also wenn du keine Wahl hast, kannst du auch noch was drauflegen!
	SYLVESTER_SILVER = Npc_HasItems(self,itmi_silver);
	if(SYLVESTER_SILVER > 0)
	{
		AI_Output(self,hero,"Info_Sylvester_PICKCOSTNO_03_02");	//Ich seh schon, du bist auch nicht besser als die anderen Halsabschneider hier.
		AI_Output(self,hero,"Info_Sylvester_PICKCOSTNO_03_03");	//OK, OK, ich kann dir noch das bischen Silber dazugeben, dass ich habe.
		Info_ClearChoices(info_sylvester_pick);
		Info_AddChoice(info_sylvester_pick,"Vergiss es. Ich bin nicht interessiert!",info_sylvester_pickcostnono);
		Info_AddChoice(info_sylvester_pick,"Behalt dein Silber. Die Spitzhacke reicht.",info_sylvester_pickcostyes);
		Info_AddChoice(info_sylvester_pick,"OK, das Geschäft gilt!",info_sylvester_pickcostnosilver);
	}
	else
	{
		AI_Output(self,hero,"Info_Sylvester_PICKCOSTNO_03_04");	//Ich besitzte sonst nichts von Wert.
		AI_Output(self,hero,"Info_Sylvester_PICKCOSTNO_03_05");	//Zeigst du mir die Ader trotzdem?
		Info_ClearChoices(info_sylvester_pick);
		Info_AddChoice(info_sylvester_pick,"Vergiss es. Ich bin nicht interessiert!",info_sylvester_pickcostnono);
		Info_AddChoice(info_sylvester_pick,"Die Spitzhacke ist OK. Ich führ dich zur Ader.",info_sylvester_pickcostyes);
	};
};

func void info_sylvester_pickcostnosilver()
{
	AI_Output(hero,self,"Info_Sylvester_PICKCOSTNOSILVER_15_01");	//OK, das Geschäft gilt!
	AI_Output(self,hero,"Info_Sylvester_PICKCOSTNOSILVER_03_02");	//Du bist ein übler Gauner! Ich sollte die anderen Leute hier vor dir warnen.
	AI_Output(self,hero,"Info_Sylvester_PICKCOSTNOSILVER_03_03");	//Hier ist meine Spitzhacke.
	B_GiveInvItems(self,hero,itmw_pickaxe,1);
	AI_Output(self,hero,"Info_Sylvester_PICKCOSTNOSILVER_03_04");	//Nun führe mich wie abgemacht zur Erzader, dort bekommst du dann das Silber.
	SYLVESTER_BLACKMAILER = TRUE;
	b_adddarkpoints(1);
	b_followpc(self,"FOLLOW");
	AI_StopProcessInfos(self);
};

func void info_sylvester_pickcostnono()
{
	AI_Output(hero,self,"Info_Sylvester_PICKCOSTNONO_15_01");	//Vergiss es. Ich bin nicht interessiert!
	AI_Output(self,hero,"Info_Sylvester_PICKCOSTNONO_03_02");	//Immer diese Aufschneider. Wahrscheinlich gibt es die Ader überhaupt nicht.
	AI_Output(self,hero,"Info_Sylvester_PICKCOSTNONO_03_03");	//Ist wohl ohnehin besser, wenn ich meine Hacke behalte. Wer weiss wann die Orks sich von der Mine verziehen.
	AI_StopProcessInfos(self);
};


instance INFO_SYLVESTER_BUYPICK(C_Info)
{
	npc = min_300_sylvester;
	nr = 10;
	condition = info_sylvester_buypick_condition;
	information = info_sylvester_buypick_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildbuystring(NAME_PICKAXE,SYLVESTER_PRICEPICKAXE);
};


func int info_sylvester_buypick_condition()
{
	if(Npc_HasItems(self,itmw_pickaxe) && SYLVESTER_BUYPICK)
	{
		return TRUE;
	};
};

func void info_sylvester_buypick_info()
{
	if(Npc_HasItems(hero,itmi_silver) >= SYLVESTER_PRICEPICKAXE)
	{
		AI_Output(self,hero,"Info_Sylvester_BUYPICK_03_01");	//OK, hier hast du die Hacke. Konnte die mühselige Schürferei eh nie leiden.
		B_GiveInvItems(hero,self,itmi_silver,SYLVESTER_PRICEPICKAXE);
		B_GiveInvItems(self,hero,itmw_pickaxe,1);
		info_sylvester_buypick.permanent = FALSE;
	}
	else
	{
		AI_Output(self,hero,"Info_Sylvester_BUYPICK_03_02");	//Verarsch mich nicht! Besorg erst das Silber, dann kannst du auch die Hacke haben.
		AI_StopProcessInfos(self);
	};
};


instance INFO_SYLVESTER_CAVE(C_Info)
{
	npc = min_300_sylvester;
	condition = info_sylvester_cave_condition;
	information = info_sylvester_cave_info;
	important = TRUE;
	permanent = FALSE;
};


func int info_sylvester_cave_condition()
{
	if(Npc_GetDistToWP(hero,"OW_CAVE1_OREWOLF_4") < 400)
	{
		return TRUE;
	};
};

func void info_sylvester_cave_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Sylvester_CAVE_03_01");	//Unglaublich, hier gibt es tatsächlich Erz.
	if(SYLVESTER_FRIEND)
	{
		AI_Output(self,hero,"Info_Sylvester_CAVE_03_02");	//Danke nochmal. Leute wie dich gibt es hier sehr wenige.
		AI_Output(self,hero,"Info_Sylvester_CAVE_03_03");	//Wenn du etwas Erz brauchst, komm vorbei. Ich kann bestimmt mal ein paar Brocken abzweigen.
		b_setattitude(self,ATT_FRIENDLY);
		SYLVESTER_LASTORE = Wld_GetDay() - 1;
		b_addfame(1);
		B_GiveXP(XP_SYLVESTER_ORECAVE_FRIENDLY);
		B_LogEntry(CH1_LEARNSMITH,"Sylvester war dankbar, dass ich ihn zur Erzader geführt habe. Ich kann mir ab heute täglich etwas Erz bei ihm abholen.");
	}
	else
	{
		if(SYLVESTER_BLACKMAILER)
		{
			AI_Output(self,hero,"Info_Sylvester_CAVE_03_04");	//Hier ist das Silber! Hoffentlich erstickst du daran, du Erpresser!
			B_GiveInvItems(self,hero,itmi_silver,SYLVESTER_SILVER);
		};
		B_GiveXP(XP_SYLVESTER_ORECAVE_SELFISH);
	};
	if(Npc_IsInRoutine(self,ZS_PickOre))
	{
		AI_Output(self,hero,"Info_Sylvester_CAVE_03_05");	//Dann werde ich mich mal gleich an die Arbeit machen.
	}
	else
	{
		AI_Output(self,hero,"Info_Sylvester_CAVE_03_06");	//Es ist schon spät. Ich werde mich noch etwas ausruhen und mich morgen früh dann an die Arbeit machen.
	};
	b_leavepc(self,"PICK");
	AI_StopProcessInfos(self);
};


instance INFO_SYLVESTER_GIVEORE(C_Info)
{
	npc = min_300_sylvester;
	nr = 15;
	condition = info_sylvester_giveore_condition;
	information = info_sylvester_giveore_info;
	important = FALSE;
	permanent = TRUE;
	description = "Hast du etwas Erz übrig?";
};


func int info_sylvester_giveore_condition()
{
	if(Npc_KnowsInfo(hero,info_sylvester_cave) && SYLVESTER_FRIEND)
	{
		return TRUE;
	};
};

func void info_sylvester_giveore_info()
{
	AI_Output(hero,self,"Info_Sylvester_GIVEORE_15_01");	//Hast du etwas Erz übrig?
	if(SYLVESTER_LASTORE != Wld_GetDay())
	{
		AI_Output(self,hero,"Info_Sylvester_GIVEORE_03_02");	//Klar. Kannst ein paar Brocken haben, hier!
		B_GiveInvItems(self,hero,itmi_orenugget,SYLVESTER_DAILYORE);
		SYLVESTER_LASTORE = Wld_GetDay();
	}
	else
	{
		AI_Output(self,hero,"Info_Sylvester_GIVEORE_03_03");	//Kann heute leider nichts mehr entbehren, aber vielleicht morgen wieder!
	};
};


instance INFO_SYLVESTER_BUYPICKFRIEND(C_Info)
{
	npc = min_300_sylvester;
	nr = 12;
	condition = info_sylvester_buypickfriend_condition;
	information = info_sylvester_buypickfriend_info;
	important = FALSE;
	permanent = FALSE;
	description = "Hast du eine Spitzhacke für mich?";
};


func int info_sylvester_buypickfriend_condition()
{
	if(Npc_KnowsInfo(hero,info_sylvester_cave) && SYLVESTER_FRIEND)
	{
		return TRUE;
	};
};

func void info_sylvester_buypickfriend_info()
{
	AI_Output(hero,self,"Info_Sylvester_BUYPICKFRIEND_15_01");	//Hast du eine Spitzhacke für mich?
	if(Npc_HasItems(self,itmw_pickaxe) >= 2)
	{
		AI_Output(self,hero,"Info_Sylvester_BUYPICKFRIEND_03_02");	//Ich hab noch eine Reservehacke, die kannst du haben. Hier nimm!
		B_GiveInvItems(self,hero,itmw_pickaxe,1);
	}
	else
	{
		AI_Output(self,hero,"Info_Sylvester_BUYPICKFRIEND_03_03");	//Ich habe nur noch diese eine Hacke. Tut mir leid!
	};
};


instance MIN_300_SYLVESTER_BLOODORE(C_Info)
{
	npc = min_300_sylvester;
	nr = 1;
	condition = min_300_sylvester_bloodore_condition;
	information = min_300_sylvester_bloodore_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich bin auf der Suche nach Bluterz!";
};


func int min_300_sylvester_bloodore_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_findbloodore))
	{
		return TRUE;
	};
};

func void min_300_sylvester_bloodore_info()
{
	AI_Output(hero,self,"MIL_101_BLOODORE_15_01");	//Ich bin auf der Suche nach Bluterz!
	AI_Output(self,hero,"MIL_101_BLOODORE_03_02");	//In der Mine gibt es eine Bluterzader. Allerdings ist dieses besondere Erz sehr selten. Warum willst du das wissen?
	AI_Output(hero,self,"MIL_101_BLOODORE_15_03");	//Ich brauche Bluterz, um einen Runenstein zu gießen.
	AI_Output(self,hero,"MIL_101_BLOODORE_03_04");	//Damit kenne ich mich nicht aus, aber ich besitze noch ein paar Brocken.
	AI_Output(self,hero,"MIL_101_BLOODORE_03_05");	//Ich schlage dir ein Geschäft vor.
	AI_Output(hero,self,"MIL_101_BLOODORE_15_06");	//Was für ein Geschäft?
	AI_Output(self,hero,"MIL_101_BLOODORE_03_07");	//Ich brauche eine bessere Waffe, eines dieser handlichen Kurzschwerter!
	AI_Output(self,hero,"MIL_101_BLOODORE_03_08");	//Aber Gotmar verkauft seine Waffen nur an die Miliz.
	AI_Output(self,hero,"MIL_101_BLOODORE_03_09");	//Wenn du mir ein Kurzschwert besorgst, bekommst du mein Bluterz.
	Info_AddChoice(min_300_sylvester_bloodore,"Vergiss es!",min_300_sylvester_bloodore_no);
	Info_AddChoice(min_300_sylvester_bloodore,"Ich schau mal, ob ich ein Kurzschwert bekomme",min_300_sylvester_bloodore_yes);
	Info_AddChoice(min_300_sylvester_bloodore,"Ich überlege es mir",min_300_sylvester_bloodore_maybe);
};

func void min_300_sylvester_bloodore_maybe()
{
	AI_Output(hero,self,"MIL_101_BLOODORE_MAYBE_15_01");	//Ich überlege es mir.
	AI_Output(self,hero,"MIL_101_BLOODORE_MAYBE_03_02");	//Wenn du ein Kurzschwert hast, tausche ich es gegen mein Bluterz.
	SYLVESTER_SWORD = LOG_RUNNING;
	B_LogEntry(CH1_BLOODORE,"Sylvester ist im Besitz von Bluterz. Er überlässt es mir, wenn ich ihm ein Kurzschwert besorge.");
	Info_ClearChoices(min_300_sylvester_bloodore);
};

func void min_300_sylvester_bloodore_yes()
{
	AI_Output(hero,self,"MIL_101_BLOODORE_YES_15_01");	//Ich schau mal, ob ich ein Kurzschwert bekomme
	AI_Output(self,hero,"MIL_101_BLOODORE_YES_03_02");	//Gut, wenn du eins hast, bekommst du mein Bluterz.
	SYLVESTER_SWORD = LOG_RUNNING;
	B_LogEntry(CH1_BLOODORE,"Sylvester ist im Besitz von Bluterz. Er überlässt es mir, wenn ich ihm ein Kurzschwert besorge.");
	Info_ClearChoices(min_300_sylvester_bloodore);
};

func void min_300_sylvester_bloodore_no()
{
	AI_Output(hero,self,"MIL_101_BLOODORE_NO_15_01");	//Vergiss es!
	AI_Output(self,hero,"MIL_101_BLOODORE_NO_03_02");	//Dann gibt's auch kein Bluterz!
	SYLVESTER_SWORD = LOG_OBSOLETE;
	Info_ClearChoices(min_300_sylvester_bloodore);
};


instance MIL_101_SYLVESTER_SWORD(C_Info)
{
	npc = min_300_sylvester;
	nr = 23;
	condition = mil_101_sylvester_sword_condition;
	information = mil_101_sylvester_sword_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe ein Kurzschwert für dich";
};


func int mil_101_sylvester_sword_condition()
{
	if((SYLVESTER_SWORD == LOG_RUNNING) && Npc_HasItems(hero,itmw_shortsword))
	{
		return TRUE;
	};
};

func void mil_101_sylvester_sword_info()
{
	AI_Output(hero,self,"MIL_101_SWORD_15_01");	//Ich habe ein Kurzschwert für dich.
	B_GiveInvItems(hero,self,itmw_shortsword,1);
	B_GiveInvItems(self,hero,itmi_bloodorenugget,30);
	ai_createiteminslot(self,"ZS_RIGHTHAND",4394);
	AI_PlayAni(self,"T_1HSINSPECT");
	ai_removeitemfromslot(self,"ZS_RIGHTHAND");
	AI_EquipBestMeleeWeapon(self);
	AI_Output(self,hero,"MIL_101_SWORD_03_02");	//Ausgezeichnet. Hier, nimm mein Bluterz. Wenn du noch mehr brauchst, dann sprich mal mit Wylfern.
	AI_Output(self,hero,"MIL_101_SWORD_03_03");	//Er ist Rekrut bei der Miliz und war vorher auch in der Mine.
	Npc_RemoveInvItems(self,itmi_bloodorenugget,30);
	B_LogEntry(CH1_BLOODORE,"Sylvester hat mir sein Bluterz überlassen. Er gab mir noch den Tip Wylfern auch auf Bluterz anzusprechen. Er ist Rekrut in der Miliz und war ebenfalls in der Mine.");
	SYLVESTER_SWORD = LOG_SUCCESS;
};

