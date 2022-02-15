// This variable is a workaround for a bug -> function Npc_KnowsInfo() doesn't work on permanent = TRUE dialogues
// BF_ prefix is used on all newly introduced variables
const int BF_Berengar_About = FALSE; 

instance  MIL_103_Berengar_Exit (C_INFO)
{
	npc			=  MIL_103_Berengar;
	nr			=  999;
	condition	=  MIL_103_Berengar_Exit_Condition;
	information	=  MIL_103_Berengar_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};

FUNC int  MIL_103_Berengar_Exit_Condition()
{
	return 1;
};
FUNC VOID  MIL_103_Berengar_Exit_Info()
{
	AI_StopProcessInfos	( self );
};


///////////////////////////////////////////////////////////////////////
//	Info KINGANGRY
///////////////////////////////////////////////////////////////////////
instance MIL_103_Berengar_KINGANGRY		(C_INFO)
{
	npc		 = 	MIL_103_Berengar;
	condition	 = 	MIL_103_Berengar_KINGANGRY_Condition;
	information	 = 	MIL_103_Berengar_KINGANGRY_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int MIL_103_Berengar_KINGANGRY_Condition ()
{
	if C_NPCisinvincible (self)
	{
		return TRUE;
	};
};
func void MIL_103_Berengar_KINGANGRY_Info ()
{
//	AI_Output			(self, hero, "MIL_103_KINGANGRY_08_01"); //Was willst DU von mir? (aggresiv)
	AI_Output			(self, hero, "MIL_103_KINGANGRY_08_01"); //Co po mě chceš? (agresivně)

};

///////////////////////////////////////////////////////////////////////
//	Info WHOAREYOU
///////////////////////////////////////////////////////////////////////
instance MIL_103_Berengar_WHOAREYOU		(C_INFO)
{
	npc		 = 	MIL_103_Berengar;
	condition	 = 	MIL_103_Berengar_WHOAREYOU_Condition;
	information	 = 	MIL_103_Berengar_WHOAREYOU_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wer bist du?";
	description	 = 	"Kdo jsi?";
};

func int MIL_103_Berengar_WHOAREYOU_Condition ()
{
	return TRUE;
};

func void MIL_103_Berengar_WHOAREYOU_Info ()
{
//	AI_Output			(hero, self, "MIL_103_WHOAREYOU_15_01"); //Wer bist du?
	AI_Output			(hero, self, "MIL_103_WHOAREYOU_15_01"); //Kdo jsi?
//	AI_Output			(self, hero, "MIL_103_WHOAREYOU_08_02"); //(aggressiv) Was für eine dämliche Frage!
	AI_Output			(self, hero, "MIL_103_WHOAREYOU_08_02"); //(agresivně) To je ale hloupá otázka!
//	AI_Output			(self, hero, "MIL_103_WHOAREYOU_08_03"); //Jeder weis doch, dass ich der Hauptmann der Miliz bin.
	AI_Output			(self, hero, "MIL_103_WHOAREYOU_08_03"); //Každý ví, že jsem kapitán milice!
//	AI_Output			(self, hero, "MIL_103_WHOAREYOU_08_04"); //Und ich bin niemandem Rechenschaft schuldig, schon garnicht diesem nichtsnutzigen König Rhobar.
	AI_Output			(self, hero, "MIL_103_WHOAREYOU_08_04"); //A nikomu nejsem nic dlužný, a už vůbec ne králi Rhobarovi!
//	AI_Output			(self, hero, "MIL_103_WHOAREYOU_08_05"); //Ist das klar!
	AI_Output			(self, hero, "MIL_103_WHOAREYOU_08_05"); //Je to jasný!
};


///////////////////////////////////////////////////////////////////////
//	Info KING
///////////////////////////////////////////////////////////////////////
instance MIL_103_Berengar_KING		(C_INFO)
{
	npc		 = 	MIL_103_Berengar;
	nr		 = 	1;
	condition	 = 	MIL_103_Berengar_KING_Condition;
	information	 = 	MIL_103_Berengar_KING_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Kannst du mir was über den König erzählen?";
	description	 = 	"Můžeš mi o králi něco říct?";
};

func int MIL_103_Berengar_KING_Condition ()
{
	if	Npc_KnowsInfo(hero, MIL_103_Berengar_WHOAREYOU)
	{
		return TRUE;
	};
};

func void MIL_103_Berengar_KING_Info ()
{
//	AI_Output			(hero, self, "MIL_103_KING_15_01"); //Kannst du mir was über den König erzählen?
	AI_Output			(hero, self, "MIL_103_KING_15_01"); //Můžeš mi o králi něco říct?
//	AI_Output			(self, hero, "MIL_103_KING_08_02"); //(laut) Du willst was über den König wissen?...VON MIR?
	AI_Output			(self, hero, "MIL_103_KING_08_02"); //(hlasitě) Ty se chceš něco dozvědět o králi?...ODE MĚ?
//	AI_Output			(self, hero, "MIL_103_KING_08_03"); //Dann will ich dir was über den König sagen.
	AI_Output			(self, hero, "MIL_103_KING_08_03"); //Pak ti tedy o králi něco řeknu.
//	AI_Output			(self, hero, "MIL_103_KING_08_04"); //Der taucht hier mit seinen gestriegelten Affen auf und steckt seinen Kopf mitsamt seiner Krone ganz tief in den Sand!
	AI_Output			(self, hero, "MIL_103_KING_08_04"); //Objevil se tu se svými naparáděnými gorilami a strčil hlavu, i se svou korunou, hluboko do písku!  
//	AI_Output			(self, hero, "MIL_103_KING_08_05"); //Der soll mir mal im Dunkeln begegnen, der König! Den werde ich noch ganz woanders reinstecken den König!
	AI_Output			(self, hero, "MIL_103_KING_08_05"); //Král by mě měl někde ve tmě potkat! Pak bych krále strčil někam jinam!

};

///////////////////////////////////////////////////////////////////////
//	Info ABOUT
///////////////////////////////////////////////////////////////////////
instance MIL_103_Berengar_ABOUT		(C_INFO)
{
	npc		 	 = 	MIL_103_Berengar;
	nr		 	 = 	13;
	condition	 = 	MIL_103_Berengar_ABOUT_Condition;
	information	 = 	MIL_103_Berengar_ABOUT_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Kannst du mich im Kampf trainieren?";
	description	 = 	"Můžu s tebou trénovat?";
};

func int MIL_103_Berengar_ABOUT_Condition ()
{
	if	Npc_KnowsInfo(hero, MIL_103_Berengar_WHOAREYOU)
	{
		return TRUE;
	};
};

func void MIL_103_Berengar_ABOUT_Info ()
{
//	AI_Output			(hero, self, "MIL_103_ABOUT_15_01"); //Kannst du mich im Kampf trainieren?
	AI_Output			(hero, self, "MIL_103_ABOUT_15_01"); //Můžu s tebou trénovat?
//	AI_Output			(self, hero, "MIL_103_ABOUT_08_02"); //(laut) NEIN, ich bin beschäftigt, siehst du das nicht?
	AI_Output			(self, hero, "MIL_103_ABOUT_08_02"); //(hlasitě) NE, jsem zaneprázdněný, copak to nevidíš?
//	AI_Output			(self, hero, "MIL_103_ABOUT_08_03"); //Besorg dir eine Waffe und wende dich an Cassian. Er kümmert sich um Typen wie dich!
	AI_Output			(self, hero, "MIL_103_ABOUT_08_03"); //Obstarej si zbraň a hlas se u Cassiana. On se stará o lidi, jako jsi ty!
	
	BF_Berengar_About = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info WHERECASSIAN
///////////////////////////////////////////////////////////////////////
instance MIL_103_Berengar_WHERECASSIAN		(C_INFO)
{
	npc		 = 	MIL_103_Berengar;
	condition	 = 	MIL_103_Berengar_WHERECASSIAN_Condition;
	information	 = 	MIL_103_Berengar_WHERECASSIAN_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wo finde ich diesen Cassian?";
	description	 = 	"Kde Cassiana najdu?";
};

func int MIL_103_Berengar_WHERECASSIAN_Condition ()
{
//	if	Npc_KnowsInfo(hero, MIL_103_Berengar_ABOUT)
	if	(BF_Berengar_About
	&&	!Npc_KnowsInfo(hero, Mil_119_Cassian_HI))
	{
		return TRUE;
	};
};

func void MIL_103_Berengar_WHERECASSIAN_Info ()
{
//	AI_Output			(hero, self, "MIL_103_WHERECASSIAN_15_01"); //Wo finde ich diesen Cassian?
	AI_Output			(hero, self, "MIL_103_WHERECASSIAN_15_01"); //Kde Cassiana najdu?
//	AI_Output			(self, hero, "MIL_103_WHERECASSIAN_08_02"); //Bei den Rekruten im Burghof. Kannst ihn nicht verfehlen, er trägt eine sehr auffällige Rüstung.
	AI_Output			(self, hero, "MIL_103_WHERECASSIAN_08_02"); //U rekrutů na nádvoří. Nemůžeš ho minout, nosí nápadné brnění.
};












