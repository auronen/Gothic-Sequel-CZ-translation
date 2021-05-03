
instance THF_401_HULDRYCH_EXIT(C_Info)
{
	npc = thf_401_huldrych;
	nr = 999;
	condition = thf_401_huldrych_exit_condition;
	information = thf_401_huldrych_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int thf_401_huldrych_exit_condition()
{
	return TRUE;
};

func void thf_401_huldrych_exit_info()
{
	AI_StopProcessInfos(self);
};


instance THF_401_HULDRYCH_HI(C_Info)
{
	npc = thf_401_huldrych;
	nr = 1;
	condition = thf_401_huldrych_hi_condition;
	information = thf_401_huldrych_hi_info;
	important = FALSE;
	permanent = TRUE;
	description = "Was machst du hier?";
};


func int thf_401_huldrych_hi_condition()
{
	if(!CASSIAN_BEATHUDRYCH)
	{
		return TRUE;
	};
};

func void thf_401_huldrych_hi_info()
{
	AI_Output(hero,self,"THF_401_HI_15_01");	//Was machst du hier?
	AI_Output(self,hero,"THF_401_HI_05_02");	//Ich sorge dafür, daß ich am Leben bleibe und was warmes zu Essen bekomme.
	AI_Output(hero,self,"THF_401_HI_15_03");	//Warum arbeitest du nicht mit am Aussenwall?
	AI_Output(self,hero,"THF_401_HI_05_04");	//Warum sollte ich? Ich habe den Wall nicht kaputtgemacht.
	AI_Output(self,hero,"THF_401_HI_05_05");	//Ausserdem was bringt das? Falls die Orks wirklich angreifen, wird der Wall sie nicht aufhalten.
};


instance THF_401_HULDRYCH_YOUTHF(C_Info)
{
	npc = thf_401_huldrych;
	condition = thf_401_huldrych_youthf_condition;
	information = thf_401_huldrych_youthf_info;
	important = FALSE;
	permanent = FALSE;
	description = "Du hast Agon bestohlen!";
};


func int thf_401_huldrych_youthf_condition()
{
	if(!Npc_KnowsInfo(hero,wrk_225_agon_warez) && (CASSIAN_BEATHUDRYCH == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void thf_401_huldrych_youthf_info()
{
	AI_Output(hero,self,"THF_401_YOUTHF_15_01");	//Du hast Agon bestohlen!
	AI_Output(self,hero,"THF_401_YOUTHF_05_02");	//Tatsächlich? Und was habe ich ihm gestohlen?
	Info_AddChoice(thf_401_huldrych_youthf,"Das werde ich noch herausfinden!",thf_401_huldrych_youthf_later);
	Info_AddChoice(thf_401_huldrych_youthf,"Sein Schwert!",thf_401_huldrych_youthf_sword);
	Info_AddChoice(thf_401_huldrych_youthf,"Einen Schinken!",thf_401_huldrych_youthf_ham);
};

func void thf_401_huldrych_youthf_ham()
{
	AI_Output(hero,self,"THF_401_YOUTHF_HAM_15_01");	//Einen Schinken!
	AI_Output(self,hero,"THF_401_YOUTHF_HAM_05_02");	//HAHAHA einen Schinken? Das ist gut! Du bist echt witzig!
	if(Npc_HasItems(self,itmi_silver) >= HULDRYCH_STOLENSILVER)
	{
		Npc_RemoveInvItems(self,itmi_silver,HULDRYCH_STOLENSILVER);
		Mob_CreateItems("OCR_HUT_78",itmi_silver,HULDRYCH_STOLENSILVER);
	};
	B_LogEntry(CH1_TRAIN1H,"Vielleicht sollte ich mal mit Agon sprechen.");
	AI_StopProcessInfos(self);
};

func void thf_401_huldrych_youthf_sword()
{
	AI_Output(hero,self,"THF_401_YOUTHF_SWORD_15_01");	//Sein Schwert!
	AI_Output(self,hero,"THF_401_YOUTHF_SWORD_05_02");	//Warst du zu lange im Krankenviertel? Jeder hier weiß doch, das Agon kein Schwert besitzt.
	if(Npc_HasItems(self,itmi_silver) >= HULDRYCH_STOLENSILVER)
	{
		Npc_RemoveInvItems(self,itmi_silver,HULDRYCH_STOLENSILVER);
		Mob_CreateItems("OCR_HUT_78",itmi_silver,HULDRYCH_STOLENSILVER);
	};
	B_LogEntry(CH1_TRAIN1H,"Vielleicht sollte ich mal mit Agon sprechen.");
	AI_StopProcessInfos(self);
};

func void thf_401_huldrych_youthf_later()
{
	AI_Output(hero,self,"THF_401_YOUTHF_LATER_15_01");	//Das werde ich noch herausfinden!
	AI_Output(self,hero,"THF_401_YOUTHF_LATER_05_02");	//Wenn du nichts besseres zu tun hast.
	if(Npc_HasItems(self,itmi_silver) >= HULDRYCH_STOLENSILVER)
	{
		Npc_RemoveInvItems(self,itmi_silver,HULDRYCH_STOLENSILVER);
		Mob_CreateItems("OCR_HUT_78",itmi_silver,HULDRYCH_STOLENSILVER);
	};
	B_LogEntry(CH1_TRAIN1H,"Vielleicht sollte ich mal mit Agon sprechen.");
	AI_StopProcessInfos(self);
};


instance THF_401_HULDRYCH_TOOSLOW(C_Info)
{
	npc = thf_401_huldrych;
	nr = 66;
	condition = thf_401_huldrych_tooslow_condition;
	information = thf_401_huldrych_tooslow_info;
	important = FALSE;
	permanent = FALSE;
	description = "Du hast Agon hundert Silberstücke gestohlen!";
};


func int thf_401_huldrych_tooslow_condition()
{
	if(Npc_KnowsInfo(hero,thf_401_huldrych_youthf) && Npc_KnowsInfo(hero,wrk_225_agon_warez))
	{
		return TRUE;
	};
};

func void thf_401_huldrych_tooslow_info()
{
	AI_Output(hero,self,"THF_401_TOOSLOW_15_01");	//Du hast Agon hundert Silberstücke gestohlen!
	AI_Output(self,hero,"THF_401_TOOSLOW_05_02");	//Wie willst du das beweisen? Selbst wenn ich das Silber hätte, glaubst du ich trage es mit mir herum?
	AI_Output(self,hero,"THF_401_TOOSLOW_05_03");	//Also geh mir nicht auf den Sack!
	AI_TurnAway(hero,self);
	AI_Output(hero,self,"THF_401_TOOSLOW_15_04");	//Ich glaube mit Worten komme ich hier nicht weiter.
	B_LogEntry(CH1_TRAIN1H,"Ich fürchte Huldrych hat das Silber jetzt in Sicherheit gebracht. Bleibt mir nur noch, ihm aufs Maul... ähem ihm eine Lektion zu erteilen.");
};


instance THF_401_HULDRYCH_AFTERBEAT(C_Info)
{
	npc = thf_401_huldrych;
	condition = thf_401_huldrych_afterbeat_condition;
	information = thf_401_huldrych_afterbeat_info;
	important = TRUE;
	permanent = TRUE;
};


func int thf_401_huldrych_afterbeat_condition()
{
	var C_Npc huldrych;
	huldrych = Hlp_GetNpc(thf_401_huldrych);
	if(Npc_KnowsInfo(hero,thf_401_huldrych_youthf) && Npc_KnowsInfo(hero,thf_401_huldrych_tooslow) && c_npcisinvincible(huldrych))
	{
		return TRUE;
	};
};

func void thf_401_huldrych_afterbeat_info()
{
	AI_Output(self,hero,"THF_401_AFTERBEAT_05_01");	//Lass mich in Ruhe! Geh jemand anders auf'n Sack!
	AI_StopProcessInfos(self);
};


instance THF_401_HULDRYCH_GIVEMESILVER(C_Info)
{
	npc = thf_401_huldrych;
	nr = 23;
	condition = thf_401_huldrych_givemesilver_condition;
	information = thf_401_huldrych_givemesilver_info;
	important = FALSE;
	permanent = FALSE;
	description = "Sagst du mir jetzt wo das Silber ist?";
};


func int thf_401_huldrych_givemesilver_condition()
{
	var C_Npc huldrych;
	huldrych = Hlp_GetNpc(thf_401_huldrych);
	if(Npc_KnowsInfo(hero,thf_401_huldrych_tooslow) && huldrych.aivar[12])
	{
		return TRUE;
	};
};

func void thf_401_huldrych_givemesilver_info()
{
	AI_Output(hero,self,"THF_401_GIVEMESILVER_15_01");	//Sagst du mir jetzt wo das Silber ist?
	AI_Output(self,hero,"THF_401_GIVEMESILVER_05_02");	//ICH HAB ES NICHT MEHR!
	AI_Output(hero,self,"THF_401_GIVEMESILVER_15_03");	//Was hast du damit gemacht?
	AI_Output(self,hero,"THF_401_GIVEMESILVER_05_04");	//Meine Schulden bei verschiedenen Leuten bezahlt. Willst du mich jetzt nochmal schlagen?
	AI_Output(hero,self,"THF_401_GIVEMESILVER_15_05");	//Wenn du noch mal jemanden beklaust, komme ich wieder.
	AI_Output(self,hero,"THF_401_GIVEMESILVER_05_06");	//OK, OK. Ich habs kapiert! Aber lass mich jetzt bitte in Ruhe.
};


instance THF_401_HULDRYCH_INSPECTOR(C_Info)
{
	npc = thf_401_huldrych;
	nr = 15;
	condition = thf_401_huldrych_inspector_condition;
	information = thf_401_huldrych_inspector_info;
	important = FALSE;
	permanent = FALSE;
	description = "Agon wurden hundert Silberstücke gestohlen!";
};


func int thf_401_huldrych_inspector_condition()
{
	var C_Npc huldrych;
	huldrych = Hlp_GetNpc(thf_401_huldrych);
	if((CASSIAN_BEATHUDRYCH == LOG_RUNNING) && !huldrych.aivar[12] && !Npc_KnowsInfo(hero,thf_401_huldrych_youthf) && Npc_KnowsInfo(hero,wrk_225_agon_warez))
	{
		return TRUE;
	};
};

func void thf_401_huldrych_inspector_info()
{
	AI_Output(hero,self,"THF_401_INSPECTOR_15_01");	//Agon wurden hundert Silberstücke gestohlen!
	AI_Output(self,hero,"THF_401_INSPECTOR_05_02");	//Was habe ich damit zu tun?
	AI_Output(hero,self,"THF_401_INSPECTOR_15_03");	//DU hast sie gestohlen.
	AI_Output(self,hero,"THF_401_INSPECTOR_05_04");	//Woher willst du das wissen?
	AI_Output(hero,self,"THF_401_INSPECTOR_15_05");	//Agon hat dich gesehen. Und ich möchte wetten, du trägst das Silber noch mit dir herum.
	AI_Output(self,hero,"THF_401_INSPECTOR_05_06");	//Und was hast du jetzt vor?
	Info_AddChoice(thf_401_huldrych_inspector,"Ganz einfach, wir teilen",thf_401_huldrych_inspector_share);
	Info_AddChoice(thf_401_huldrych_inspector,"Ich werde dir eine Lektion erteilen",thf_401_huldrych_inspector_lesson);
};

func void thf_401_huldrych_inspector_lesson()
{
	AI_Output(hero,self,"THF_401_INSPECTOR_lesson_15_01");	//Ich werde dir eine Lektion erteilen!
	AI_Output(self,hero,"THF_401_INSPECTOR_lesson_05_02");	//Versuch es, wenn du kannst!
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,1,"");
};

func void thf_401_huldrych_inspector_share()
{
	AI_Output(hero,self,"THF_401_INSPECTOR_SHARE_15_01");	//Ganz einfach, wir teilen
	AI_Output(self,hero,"THF_401_INSPECTOR_SHARE_05_02");	//hmm...verstehe. Aber woher weiß ich, daß du es ernst meinst?
	AI_Output(hero,self,"THF_401_INSPECTOR_SHARE_15_03");	//Du musst mir vertrauen.
	if(Npc_HasItems(self,itmi_silver) >= HULDRYCH_STOLENSILVER)
	{
		AI_Output(self,hero,"THF_401_INSPECTOR_SHARE_05_04");	//hmm...fünfzig Silberstücke für dich...
		B_GiveInvItems(self,hero,itmi_silver,HULDRYCH_STOLENSILVER / 2);
		AI_Output(self,hero,"THF_401_INSPECTOR_SHARE_05_05");	//Und du sorgst dafür, das Agon und die Miliz mich nicht mehr belästigen!
		AI_Output(hero,self,"THF_401_INSPECTOR_SHARE_15_06");	//Abgemacht!
		HULDRYCH_AWAY = TRUE;
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(self,itmi_silver) < HULDRYCH_STOLENSILVER)
	{
		AI_Output(self,hero,"THF_401_INSPECTOR_SHARE_05_07");	//Ich habe das Silber nicht mehr! Es ist mir abgenommen worden.
		AI_Output(self,hero,"THF_401_INSPECTOR_SHARE_05_08");	//Warte mal, habe ich dich nicht schon irgendwo gesehen...? Du warst das! Du hast mir das Silber abgenommen!
		AI_Output(hero,self,"THF_401_INSPECTOR_SHARE_15_09");	//Ich glaube, ich geh mal wieder.
		AI_Output(self,hero,"THF_401_INSPECTOR_SHARE_05_10");	//Nicht so schnell, Freundchen!
		AI_StopProcessInfos(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,1,"");
	};
};


instance THF_401_HULDRYCH_NOWFIGHT(C_Info)
{
	npc = thf_401_huldrych;
	condition = thf_401_huldrych_nowfight_condition;
	information = thf_401_huldrych_nowfight_info;
	important = TRUE;
	permanent = TRUE;
};


func int thf_401_huldrych_nowfight_condition()
{
	var C_Npc huldrych;
	huldrych = Hlp_GetNpc(thf_401_huldrych);
	if(Npc_KnowsInfo(hero,thf_401_huldrych_inspector) && huldrych.aivar[12] && c_npcisinvincible(hero))
	{
		return TRUE;
	};
};

func void thf_401_huldrych_nowfight_info()
{
	if(HULDRYCH_AWAY)
	{
		AI_Output(self,hero,"THF_401_NOWFIGHT_05_01");	//Du hinterhältiger Drecksack! Ich habe dir vertraut!
		AI_Output(self,hero,"THF_401_NOWFIGHT_05_02");	//Irgendwann, wenn du nicht damit rechnest, wenn du tief in der Scheisse sitzt, dann werde ich da sein!
		AI_Output(self,hero,"THF_401_NOWFIGHT_05_03");	//...und dann rechne ich mit dir ab!
	}
	else
	{
		B_GiveXP(XP_BEATEDUPHULDRYCH);
		AI_Output(hero,self,"THF_401_NOWFIGHT_15_04");	//(bedrohlich) Lass dir das eine Lehre sein, andere Leute um ihre ehrlich verdienten Silberstücke zu bringen, du elender Dieb!
		AI_Output(hero,self,"THF_401_NOWFIGHT_15_05");	//Wenn ich nocheinmal von so einer Aktion höre, besuche ich dich wieder, hast du das verstanden?
		AI_Output(self,hero,"THF_401_NOWFIGHT_05_06");	//(ängstlich) Ja, ist klar, wird nicht wieder vorkommen. Ehrlich!
	};
	AI_StopProcessInfos(self);
};

