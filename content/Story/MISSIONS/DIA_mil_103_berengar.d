
instance MIL_103_BERENGAR_EXIT(C_Info)
{
	npc = mil_103_berengar;
	nr = 999;
	condition = mil_103_berengar_exit_condition;
	information = mil_103_berengar_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int mil_103_berengar_exit_condition()
{
	return 1;
};

func void mil_103_berengar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance MIL_103_BERENGAR_KINGANGRY(C_Info)
{
	npc = mil_103_berengar;
	condition = mil_103_berengar_kingangry_condition;
	information = mil_103_berengar_kingangry_info;
	important = TRUE;
	permanent = TRUE;
};


func int mil_103_berengar_kingangry_condition()
{
	if(c_npcisinvincible(self))
	{
		return TRUE;
	};
};

func void mil_103_berengar_kingangry_info()
{
	AI_Output(self,hero,"MIL_103_KINGANGRY_08_01");	//Was willst DU von mir? (aggresiv)
};


instance MIL_103_BERENGAR_WHOAREYOU(C_Info)
{
	npc = mil_103_berengar;
	condition = mil_103_berengar_whoareyou_condition;
	information = mil_103_berengar_whoareyou_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wer bist du?";
};


func int mil_103_berengar_whoareyou_condition()
{
	return TRUE;
};

func void mil_103_berengar_whoareyou_info()
{
	AI_Output(hero,self,"MIL_103_WHOAREYOU_15_01");	//Wer bist du?
	AI_Output(self,hero,"MIL_103_WHOAREYOU_08_02");	//(aggressiv) Was für eine dämliche Frage!
	AI_Output(self,hero,"MIL_103_WHOAREYOU_08_03");	//Jeder weis doch, dass ich der Hauptmann der Miliz bin.
	AI_Output(self,hero,"MIL_103_WHOAREYOU_08_04");	//Und ich bin niemandem Rechenschaft schuldig, schon garnicht diesem nichtsnutzigen König Rhobar.
	AI_Output(self,hero,"MIL_103_WHOAREYOU_08_05");	//Ist das klar!
};


instance MIL_103_BERENGAR_KING(C_Info)
{
	npc = mil_103_berengar;
	nr = 1;
	condition = mil_103_berengar_king_condition;
	information = mil_103_berengar_king_info;
	important = FALSE;
	permanent = FALSE;
	description = "Kannst du mir was über den König erzählen?";
};


func int mil_103_berengar_king_condition()
{
	if(Npc_KnowsInfo(hero,mil_103_berengar_whoareyou))
	{
		return TRUE;
	};
};

func void mil_103_berengar_king_info()
{
	AI_Output(hero,self,"MIL_103_KING_15_01");	//Kannst du mir was über den König erzählen?
	AI_Output(self,hero,"MIL_103_KING_08_02");	//(laut) Du willst was über den König wissen?...VON MIR?
	AI_Output(self,hero,"MIL_103_KING_08_03");	//Dann will ich dir was über den König sagen.
	AI_Output(self,hero,"MIL_103_KING_08_04");	//Der taucht hier mit seinen gestriegelten Affen auf und steckt seinen Kopf mitsamt seiner Krone ganz tief in den Sand!
	AI_Output(self,hero,"MIL_103_KING_08_05");	//Der soll mir mal im Dunkeln begegnen, der König! Den werde ich noch ganz woanders reinstecken den König!
};


instance MIL_103_BERENGAR_ABOUT(C_Info)
{
	npc = mil_103_berengar;
	nr = 13;
	condition = mil_103_berengar_about_condition;
	information = mil_103_berengar_about_info;
	important = FALSE;
	permanent = TRUE;
	description = "Kannst du mich im Kampf trainieren?";
};


func int mil_103_berengar_about_condition()
{
	if(Npc_KnowsInfo(hero,mil_103_berengar_whoareyou))
	{
		return TRUE;
	};
};

func void mil_103_berengar_about_info()
{
	AI_Output(hero,self,"MIL_103_ABOUT_15_01");	//Kannst du mich im Kampf trainieren?
	AI_Output(self,hero,"MIL_103_ABOUT_08_02");	//(laut) NEIN, ich bin beschäftigt, siehst du das nicht?
	AI_Output(self,hero,"MIL_103_ABOUT_08_03");	//Besorg dir eine Waffe und wende dich an Cassian. Er kümmert sich um Typen wie dich!
};


instance MIL_103_BERENGAR_WHERECASSIAN(C_Info)
{
	npc = mil_103_berengar;
	condition = mil_103_berengar_wherecassian_condition;
	information = mil_103_berengar_wherecassian_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wo finde ich diesen Cassian?";
};


func int mil_103_berengar_wherecassian_condition()
{
	if(Npc_KnowsInfo(hero,mil_103_berengar_about) && !Npc_KnowsInfo(hero,mil_119_cassian_hi))
	{
		return TRUE;
	};
};

func void mil_103_berengar_wherecassian_info()
{
	AI_Output(hero,self,"MIL_103_WHERECASSIAN_15_01");	//Wo finde ich diesen Cassian?
	AI_Output(self,hero,"MIL_103_WHERECASSIAN_08_02");	//Bei den Rekruten im Burghof. Kannst ihn nicht verfehlen, er trägt eine sehr auffällige Rüstung.
};

