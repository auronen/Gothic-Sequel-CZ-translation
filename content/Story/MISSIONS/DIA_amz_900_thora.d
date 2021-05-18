///////////////////////////////////////////////

instance  AMZ_900_Thora_Exit (C_INFO)
{
	npc			=	AMZ_900_Thora;
	nr			=	999;
	condition	=	AMZ_900_Thora_Exit_Condition;
	information	=	AMZ_900_Thora_Exit_Info;
	important	=	FALSE;
	permanent	=	TRUE;
	description =	DIALOG_ENDE;
};

FUNC int  AMZ_900_Thora_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  AMZ_900_Thora_Exit_Info()
{
	AI_StopProcessInfos	( self );
};









//#####################################################################
//##
//##
//##					KAPITEL 1 (Erste Begegnung)
//##
//##
//#####################################################################

instance AMZ_900_Thora_GREETING (C_INFO)
{
	npc				= AMZ_900_Thora;
	condition		= AMZ_900_Thora_GREETING_Condition;
	information		= AMZ_900_Thora_GREETING_Info;
	important		= TRUE;
	permanent		= FALSE;
	//description		= "(Startsatz)";
};

FUNC int  AMZ_900_Thora_GREETING_Condition()
{
	if	(subChapter < CH1_ARRIVED_AT_OC)
	{
		return TRUE;
	};
};

func void  AMZ_900_Thora_GREETING_Info()
{
//	AI_Output 			(self, hero, "AMZ_900_GREETING_16_01"); //Verdammt, woher kommst du so plötzlich? Wer bist du?
	AI_Output 			(self, hero, "AMZ_900_GREETING_16_01"); //Zatraceně, odkud ses tu takhle vzal? Kdo jsi?
//	AI_Output 			(self, hero, "AMZ_900_GREETING_16_02"); //Beinahe hätte ich Dich niedergeschlagen!
	AI_Output 			(self, hero, "AMZ_900_GREETING_16_02"); //Málem bych tě srazila!
	Npc_ExchangeRoutine (self,"ArenaWait");
};


instance  AMZ_900_Thora_WHO (C_INFO)
{
	npc				= AMZ_900_Thora;
	condition		= AMZ_900_Thora_WHO_Condition;
	information		= AMZ_900_Thora_WHO_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Immer langsam! Sag mir doch erstmal wer du bist.";
	description		= "Jen hezky pomalu! Pověz mi nejdřív, kdo jsi.";
};

FUNC int  AMZ_900_Thora_WHO_Condition()
{
	if	!Npc_KnowsInfo (hero, AMZ_900_Thora_TRAINING)
	&&	(subChapter < CH1_ARRIVED_AT_OC)
	{
		return TRUE;
	};
};

FUNC void  AMZ_900_Thora_WHO_Info()
{
//	AI_Output (hero, self,"AMZ_900_Thora_WHO_Info_15_01"); //Immer langsam! Sag mir doch erstmal wer du bist.
	AI_Output (hero, self,"AMZ_900_Thora_WHO_Info_15_01"); //Jen hezky pomalu! Pověz mi nejdřív, kdo jsi.
//	AI_Output (self, hero,"AMZ_900_Thora_WHO_Info_16_02"); //Ich bin Thora. Und ich frage mich, wo du so plötzlich herkommst!
	AI_Output (self, hero,"AMZ_900_Thora_WHO_Info_16_02"); //Jsem Thora. A ráda bych věděla, jak ses tu najednou takhle objevil!
//	Info_AddChoice		(AMZ_900_Thora_WHO,	"Ich bin vom Himmel gefallen!",				AMZ_900_Thora_WHO_SKY);
	Info_AddChoice		(AMZ_900_Thora_WHO,	"Spadnul jsem z nebe!",				AMZ_900_Thora_WHO_SKY);
//	Info_AddChoice		(AMZ_900_Thora_WHO,	"Das kann ich dir leider nicht sagen.",		AMZ_900_Thora_WHO_CANTSAY);
	Info_AddChoice		(AMZ_900_Thora_WHO,	"To ti bohužel nemůžu říct.",		AMZ_900_Thora_WHO_CANTSAY);
};

FUNC VOID AMZ_900_Thora_WHO_SKY()
{
//	AI_Output (hero, self,"AMZ_900_Thora_WHO_SKY_Info_15_01"); //Ich bin vom Himmel gefallen!
	AI_Output (hero, self,"AMZ_900_Thora_WHO_SKY_Info_15_01"); //Spadnul jsem z nebe!
//	AI_Output (self, hero,"AMZ_900_Thora_WHO_SKY_Info_16_02"); //Wirklich wahr? Dann sieh mal zu, daß du wieder heil nach oben kommst, mein Vögelchen!
	AI_Output (self, hero,"AMZ_900_Thora_WHO_SKY_Info_16_02"); //Opravdu? Tak koukej zase vyletět nahoru, ty můj ptáčku!
//	AI_Output (self, hero,"AMZ_900_Thora_WHO_SKY_Info_16_03"); //Und falls du mal wieder landest, solltest du etwas freundlicher sein!
	AI_Output (self, hero,"AMZ_900_Thora_WHO_SKY_Info_16_03"); //A jestli znova přistaneš, tak bys měl být trochu přátelštější!

	Info_ClearChoices	(AMZ_900_Thora_WHO);
	AI_StopProcessInfos (self);
};

FUNC VOID AMZ_900_Thora_WHO_CANTSAY()
{
//	AI_Output (hero, self,"AMZ_900_Thora_WHO_CANTSAY_Info_15_01"); //Das kann ich dir leider nicht sagen.
	AI_Output (hero, self,"AMZ_900_Thora_WHO_CANTSAY_Info_15_01"); //To ti bohužel nemůžu říct.
//	AI_Output (self, hero,"AMZ_900_Thora_WHO_CANTSAY_Info_16_02"); //Das war doch ein Teleport-Zauber, aber wie ein Magier siehst du nicht gerade aus.
	AI_Output (self, hero,"AMZ_900_Thora_WHO_CANTSAY_Info_16_02"); //To bylo určitě teleportační kouzlo, jenže jako mág ty zrovna nevypadáš.

	Info_ClearChoices	(AMZ_900_Thora_WHO);
//	Info_AddChoice 		(AMZ_900_Thora_WHO,	"Beurteilst du jeden nach dem Äusseren?",					AMZ_900_Thora_WHO_JUDGE);
	Info_AddChoice 		(AMZ_900_Thora_WHO,	"Soudíš každého podle zevnějšku?",					AMZ_900_Thora_WHO_JUDGE);
};

FUNC VOID AMZ_900_Thora_WHO_JUDGE()
{
//	AI_Output (other, self,"AMZ_900_Thora_WHO_JUDGE_Info_15_01"); //Beurteilst du jeden nach dem Äusseren?
	AI_Output (other, self,"AMZ_900_Thora_WHO_JUDGE_Info_15_01"); //Soudíš každého podle zevnějšku?
//	AI_Output (self, other,"AMZ_900_Thora_WHO_JUDGE_Info_16_02"); //Nicht jeden. Nur die, die nichts zu sagen haben!
	AI_Output (self, other,"AMZ_900_Thora_WHO_JUDGE_Info_16_02"); //Každého ne. Jen ty, co nemají co říct!
//	AI_Output (self, other,"AMZ_900_Thora_WHO_JUDGE_Info_16_03"); //Was hast du denn hier vor?
	AI_Output (self, other,"AMZ_900_Thora_WHO_JUDGE_Info_16_03"); //Takže o co ti tu jde?

//	Info_AddChoice 		(AMZ_900_Thora_WHO,	"Sagst du mir auch, was Du hier machst?",					AMZ_900_Thora_WHO_WHAT);
	Info_AddChoice 		(AMZ_900_Thora_WHO,	"A ty mi taky řekneš, co tu děláš?",					AMZ_900_Thora_WHO_WHAT);
//	Info_AddChoice 		(AMZ_900_Thora_WHO,	"Was ich hier vorhabe, kann ich dir nicht erzählen.",		AMZ_900_Thora_WHO_SECRET);
	Info_AddChoice 		(AMZ_900_Thora_WHO,	"O svých plánech ti říct nemohu.",		AMZ_900_Thora_WHO_SECRET);
//	Info_AddChoice 		(AMZ_900_Thora_WHO,	"Ich will ins Lager.",										AMZ_900_Thora_WHO_WHATELSE);
	Info_AddChoice 		(AMZ_900_Thora_WHO,	"Chci do tábora.",										AMZ_900_Thora_WHO_WHATELSE);
};

FUNC VOID AMZ_900_Thora_WHO_WHAT()
{
//	AI_Output (other, self,"AMZ_900_Thora_WHO_WHAT_Info_15_01"); //Sagst du mir auch, was Du hier machst?
	AI_Output (other, self,"AMZ_900_Thora_WHO_WHAT_Info_15_01"); //A ty mi taky řekneš, co tu děláš?
//	AI_Output (self, other,"AMZ_900_Thora_WHO_WHAT_Info_16_02"); //...also gerade versuche ich etwas über dich zu erfahren.
	AI_Output (self, other,"AMZ_900_Thora_WHO_WHAT_Info_16_02"); //...takže se snažím o tobě něco zjistit.
//	AI_Output (other, self,"AMZ_900_Thora_WHO_WHAT_Info_15_03"); //und sonst?
	AI_Output (other, self,"AMZ_900_Thora_WHO_WHAT_Info_15_03"); //A co teda?
//	AI_Output (self, other,"AMZ_900_Thora_WHO_WHAT_Info_16_04"); //Ich bin Kämpferin.
	AI_Output (self, other,"AMZ_900_Thora_WHO_WHAT_Info_16_04"); //Jsem bojovnice.

//	Info_ClearChoices	(AMZ_900_Thora_WHO);
//	Info_AddChoice 		(AMZ_900_Thora_WHO,	"Eine Frau als Kämpferin?",		AMZ_900_Thora_WHO_FIGHTER);
	Info_AddChoice 		(AMZ_900_Thora_WHO,	"Žena a bojovnice?",		AMZ_900_Thora_WHO_FIGHTER);
	
};

FUNC VOID AMZ_900_Thora_WHO_SECRET()
{
//	AI_Output (hero, self,"AMZ_900_Thora_WHO_SECRET_Info_15_01"); //Was ich hier vorhabe, kann ich dir nicht erzählen.
	AI_Output (hero, self,"AMZ_900_Thora_WHO_SECRET_Info_15_01"); //O svých plánech ti říct nemohu.
//	AI_Output (self, hero,"AMZ_900_Thora_WHO_SECRET_Info_16_02"); //Na dann!
	AI_Output (self, hero,"AMZ_900_Thora_WHO_SECRET_Info_16_02"); //Tak ať!


	Info_ClearChoices	(AMZ_900_Thora_WHO);
	AI_StopProcessInfos (self);
};

FUNC VOID AMZ_900_Thora_WHO_WHATELSE()
{
//	AI_Output (other, self,"AMZ_900_Thora_WHO_WHATELSE_Info_15_01"); //Ich will ins Lager.
	AI_Output (other, self,"AMZ_900_Thora_WHO_WHATELSE_Info_15_01"); //Chci do tábora.
//	AI_Output (self, other,"AMZ_900_Thora_WHO_WHATELSE_Info_16_02"); //Das hast du schon fast geschafft. Da hinten ist es.
	AI_Output (self, other,"AMZ_900_Thora_WHO_WHATELSE_Info_16_02"); //To už se ti skoro povedlo. Je támhle vzadu
	Info_ClearChoices	(AMZ_900_Thora_WHO);
};

FUNC VOID AMZ_900_Thora_WHO_FIGHTER()
{
//	AI_Output (other, self,"AMZ_900_Thora_WHO_FIGHTER_Info_15_01"); //Eine Frau als Kämpferin?
	AI_Output (other, self,"AMZ_900_Thora_WHO_FIGHTER_Info_15_01"); //Žena a bojovnice?
//	AI_Output (self, other,"AMZ_900_Thora_WHO_FIGHTER_Info_16_02"); //Auch Du solltest nicht nach dem Äusseren urteilen.
	AI_Output (self, other,"AMZ_900_Thora_WHO_FIGHTER_Info_16_02"); //Ani ty bys neměl soudit podle zevnějšku.
//	AI_Output (self, other,"AMZ_900_Thora_WHO_FIGHTER_Info_16_03"); //Einige hier mussten das erst schmerzvoll lernen!
	AI_Output (self, other,"AMZ_900_Thora_WHO_FIGHTER_Info_16_03"); //Někteří se tu o tom dozvěděli teprv bolestivou cestou!
//	Info_ClearChoices	(AMZ_900_Thora_WHO);
};

////////////////////////////////////////////////
instance  AMZ_900_Thora_TRAINING (C_INFO)
{
	npc				= AMZ_900_Thora;
	condition		= AMZ_900_Thora_TRAINING_Condition;
	information		= AMZ_900_Thora_TRAINING_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Ich bin hier um zu trainieren und zu lernen.";
	description		= "Jsem tu, abych se potrénoval a něco naučil.";
};

FUNC int  AMZ_900_Thora_TRAINING_Condition()
{
	if	Npc_KnowsInfo (hero, AMZ_900_Thora_WHO)
	&&	(Npc_GetDistToWP(self, THORA_WP_OUT) < 300)
	&&	!Wld_IsTime(THORA_OUT_H, THORA_OUT_M+30, THORA_IN_H, THORA_IN_M)
	{
		return TRUE;
	};
};

FUNC void  AMZ_900_Thora_TRAINING_Info()
{
//	AI_Output (other, self,"AMZ_900_Thora_TRAINING_Info_15_01"); //Ich bin hier um zu trainieren und zu lernen.
	AI_Output (other, self,"AMZ_900_Thora_TRAINING_Info_15_01"); //Jsem tu, abych se potrénoval a něco naučil.
//	AI_Output (self, other,"AMZ_900_Thora_TRAINING_Info_16_02"); //Sieht so aus, als ob du das auch nötig hast!
	AI_Output (self, other,"AMZ_900_Thora_TRAINING_Info_16_02"); //Však bys to taky očividně potřeboval!

	Info_ClearChoices 	(AMZ_900_Thora_TRAINING);
//	Info_AddChoice 		(AMZ_900_Thora_TRAINING,	"Mit dir werde ich auch ohne Training fertig!",	AMZ_900_Thora_TRAINING_HOSTILE);
	Info_AddChoice 		(AMZ_900_Thora_TRAINING,	"S tebou se vypořádám i bez tréninku!",	AMZ_900_Thora_TRAINING_HOSTILE);
//	Info_AddChoice 		(AMZ_900_Thora_TRAINING,	"Wer hat dich denn um deine Meinung gefragt?",	AMZ_900_Thora_TRAINING_ANGRY);
	Info_AddChoice 		(AMZ_900_Thora_TRAINING,	"Kdo se ptal na tvůj názor?",	AMZ_900_Thora_TRAINING_ANGRY);
//	Info_AddChoice 		(AMZ_900_Thora_TRAINING,	"Ich war wirklich schon mal besser in Form.",	AMZ_900_Thora_TRAINING_FRIENDLY);
	Info_AddChoice 		(AMZ_900_Thora_TRAINING,	"Upřímně, opravdu nejsem zrovna ve formě.",	AMZ_900_Thora_TRAINING_FRIENDLY);
};

FUNC VOID AMZ_900_Thora_TRAINING_FRIENDLY()
{
//	AI_Output (other, self,"AMZ_900_Thora_TRAINING_FRIENDLY_Info_15_01"); //Ich war wirklich schon mal besser in Form.
	AI_Output (other, self,"AMZ_900_Thora_TRAINING_FRIENDLY_Info_15_01"); //Upřímně, opravdu nejsem zrovna ve formě.
//	AI_Output (self, other,"AMZ_900_Thora_TRAINING_FRIENDLY_Info_16_02"); //Im Lager gibt es viel zu lernen. Du kannst dich sicher irgendwo nützlich machen!
	AI_Output (self, other,"AMZ_900_Thora_TRAINING_FRIENDLY_Info_16_02"); //V táboře je toho hodně, co se můžeš naučit. Určitě můžeš být někde užitečný.
//	AI_Output (self, other,"AMZ_900_Thora_TRAINING_FRIENDLY_Info_16_03"); //Ich muß los, wir sehen uns bestimmt später noch.
	AI_Output (self, other,"AMZ_900_Thora_TRAINING_FRIENDLY_Info_16_03"); //Už musím jít, určitě se později ještě uvidíme.

	AI_StopProcessInfos (self);
};

FUNC VOID AMZ_900_Thora_TRAINING_ANGRY()
{
//	AI_Output (other, self,"AMZ_900_Thora_TRAINING_ANGRY_Info_15_01"); //Wer hat dich denn um deine Meinung gefragt?
	AI_Output (other, self,"AMZ_900_Thora_TRAINING_ANGRY_Info_15_01"); //Kdo se ptal na tvůj názor?
//	AI_Output (self, other,"AMZ_900_Thora_TRAINING_ANGRY_Info_16_02"); //Du scheinst einen schlechten Tag zu haben.
	AI_Output (self, other,"AMZ_900_Thora_TRAINING_ANGRY_Info_16_02"); //Dneska máš asi špatný den.
//	AI_Output (self, other,"AMZ_900_Thora_TRAINING_ANGRY_Info_16_03"); //Wenn du mal Hilfe brauchst, solltest du etwas freundlicher sein!
	AI_Output (self, other,"AMZ_900_Thora_TRAINING_ANGRY_Info_16_03"); //Kdybys někdy potřeboval pomoc, měl bys být o něco přátelštější!

	AI_StopProcessInfos (self);
};

FUNC VOID AMZ_900_Thora_TRAINING_HOSTILE()
{
//	AI_Output (other, self,"AMZ_900_Thora_TRAINING_HOSTILE_Info_15_01"); //Mit dir werde ich auch ohne Training fertig!
	AI_Output (other, self,"AMZ_900_Thora_TRAINING_HOSTILE_Info_15_01"); //S tebou se vypořádám i bez tréninku!
//	AI_Output (self, other,"AMZ_900_Thora_TRAINING_HOSTILE_Info_16_02"); //Tatsächlich? Dann zeig doch mal, was du kannst!
	AI_Output (self, other,"AMZ_900_Thora_TRAINING_HOSTILE_Info_16_02"); //Opravdu? No tak ukaž, co umíš!

	AI_StopProcessInfos (self);

	Npc_SetTarget		(self,other);
	AI_StartState		(self,ZS_ATTACK,1,"");
};

///////////////////////////////////////////////////////////////////////
//	Info NOTENOUGH
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_NOTENOUGH		(C_INFO)
{
	npc		 = 	AMZ_900_Thora;
	condition	 = 	AMZ_900_Thora_NOTENOUGH_Condition;
	information	 = 	AMZ_900_Thora_NOTENOUGH_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int AMZ_900_Thora_NOTENOUGH_Condition ()
{
	if	self.aivar[AIV_HASDEFEATEDSC]
	&&	(Npc_GetDistToWP(self, "OCR_ARENABATTLE_BENCH") >= 500)
	&&	!Npc_KnowsInfo(hero, AMZ_900_Thora_GLADIATOR)
	&&	C_NpcIsInvincible(hero)
	&&	(subChapter < CH1_ARRIVED_AT_OC)
	{
		return TRUE;
	};
};

func void AMZ_900_Thora_NOTENOUGH_Info ()
{
//	AI_Output			(self, hero, "AMZ_900_NOTENOUGH_16_01"); //(fröhlich) Na, ich kämpfe nicht so schlecht, oder?
	AI_Output			(self, hero, "AMZ_900_NOTENOUGH_16_01"); //(radostně) No, nebojuju tak zle, co?
//	Info_AddChoice	(AMZ_900_Thora_NOTENOUGH, "Ich hab dich gewinnen lassen. Hab garnicht richtig zugeschlagen!", AMZ_900_Thora_NOTENOUGH_YES );
	Info_AddChoice	(AMZ_900_Thora_NOTENOUGH, "Nechal jsem tě vyhrát. Jen jsem tak bezmyšlenkovitě bouchal!", AMZ_900_Thora_NOTENOUGH_YES );
//	Info_AddChoice	(AMZ_900_Thora_NOTENOUGH, "Stimmt. Wirklich nicht so schlecht!", AMZ_900_Thora_NOTENOUGH_NO );
	Info_AddChoice	(AMZ_900_Thora_NOTENOUGH, "Jo, to sedí. Vůbec ne zle!", AMZ_900_Thora_NOTENOUGH_NO );
};

func void AMZ_900_Thora_NOTENOUGH_NO ()
{
//	AI_Output			(hero, self, "AMZ_900_NOTENOUGH_NO_15_01"); //Stimmt. Wirklich nicht so schlecht!
	AI_Output			(hero, self, "AMZ_900_NOTENOUGH_NO_15_01"); //Jo, to sedí. Vůbec ne zle!
//	AI_Output			(self, hero, "AMZ_900_NOTENOUGH_NO_16_02"); //(freundlich) Na dann, bis später!
	AI_Output			(self, hero, "AMZ_900_NOTENOUGH_NO_16_02"); //(přátelsky) Tak jo, zatím!

	Info_ClearChoices 	(AMZ_900_Thora_NOTENOUGH);
	AMZ_900_Thora_NOTENOUGH.permanent = FALSE;
	AI_StopProcessInfos (self);
};

func void AMZ_900_Thora_NOTENOUGH_YES ()
{
//	AI_Output			(hero, self, "AMZ_900_NOTENOUGH_YES_15_01"); //Ich hab dich gewinnen lassen. Hab garnicht richtig zugeschlagen!
	AI_Output			(hero, self, "AMZ_900_NOTENOUGH_YES_15_01"); //Nechal jsem tě vyhrát. Jen jsem tak bezmyšlenkovitě bouchal!
//	AI_Output			(self, hero, "AMZ_900_NOTENOUGH_YES_16_02"); //Na wenn das so ist... tu das besser jetzt, sonst schluckst du nochmal Staub!
	AI_Output			(self, hero, "AMZ_900_NOTENOUGH_YES_16_02"); //No, jestli to tak je... tak se teď víc snaž, jinak budeš zase rýt hubou v zemi!

	Info_ClearChoices 	(AMZ_900_Thora_NOTENOUGH);
	AI_StopProcessInfos (self);

	Npc_SetTarget		(self,hero);
	AI_StartState		(self,ZS_ATTACK,1,"");
};

///////////////////////////////////////////////////////////////////////
//	Info SEEYA
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_SEEYA		(C_INFO)
{
	npc		 	 = 	AMZ_900_Thora;
	condition	 = 	AMZ_900_Thora_SEEYA_Condition;
	information	 = 	AMZ_900_Thora_SEEYA_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wohin gehst du?";
	description	 = 	"Kam jdeš?";
};

func int AMZ_900_Thora_SEEYA_Condition ()
{
	if	Npc_IsInRoutine(self, ZS_SitAround)
	&&	(Npc_GetDistToWP(self, "OCR_ARENABATTLE_BENCH") >= 500)
	&&	(Npc_GetDistToWP(self, THORA_WP_OUT) >= 500)
	&&	!Npc_KnowsInfo(hero, AMZ_900_Thora_GLADIATOR)
	&&	Npc_KnowsInfo(hero, AMZ_900_Thora_WHO)
	{
		return TRUE;
	};
};

func void AMZ_900_Thora_SEEYA_Info ()
{
//	AI_Output			(hero, self, "AMZ_900_SEEYA_15_01"); //Wohin gehst du?
	AI_Output			(hero, self, "AMZ_900_SEEYA_15_01"); //Kam jdeš?
//	AI_Output			(self, hero, "AMZ_900_SEEYA_16_02"); //Zur Arena. Ich kämpfe dort. Tagsüber bin ich meistens da.
	AI_Output			(self, hero, "AMZ_900_SEEYA_16_02"); //Do arény. Bojuju tam. Přes den tam většinou jsem.
};

///////////////////////////////////////////////////////////////////////
//	Info WHERENIGHT
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_WHERENIGHT		(C_INFO)
{
	npc		 = 	AMZ_900_Thora;
	condition	 = 	AMZ_900_Thora_WHERENIGHT_Condition;
	information	 = 	AMZ_900_Thora_WHERENIGHT_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Und wo bist du... nachts?";
	description	 = 	"A kde jsi... přes noc?";
};

func int AMZ_900_Thora_WHERENIGHT_Condition ()
{
	if	Npc_KnowsInfo(hero, AMZ_900_Thora_SEEYA)
	{
		return TRUE;
	};
};

func void AMZ_900_Thora_WHERENIGHT_Info ()
{
//	AI_Output			(hero, self, "AMZ_900_WHERENIGHT_15_01"); //Und wo bist du... nachts?
	AI_Output			(hero, self, "AMZ_900_WHERENIGHT_15_01"); //A kde jsi... přes noc?
//	AI_Output			(self, hero, "AMZ_900_WHERENIGHT_16_02"); //(Lacht) Du bist zwar schlecht in Form, aber dafür ganz schön dreist!
	AI_Output			(self, hero, "AMZ_900_WHERENIGHT_16_02"); //(Směje se) Ty sice vůbec nejseš ve formě, ale jseš na to docela drzej!

	AI_StopProcessInfos		(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HEYWAIT
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_HEYWAIT		(C_INFO)
{
	npc		 	 = 	AMZ_900_Thora;
	condition	 = 	AMZ_900_Thora_HEYWAIT_Condition;
	information	 = 	AMZ_900_Thora_HEYWAIT_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Warte mal!";
	description	 = 	"Počkej chvilku!";
};

func int AMZ_900_Thora_HEYWAIT_Condition ()
{
	if	Npc_KnowsInfo(hero, AMZ_900_Thora_WHERENIGHT)
	&&	(Npc_GetDistToWP(self, "OCR_ARENABATTLE_BENCH") >= 500)
	&&	(Npc_GetDistToWP(self, THORA_WP_OUT) >= 500)
	{
		return TRUE;
	};
};

func void AMZ_900_Thora_HEYWAIT_Info ()
{
//	AI_Output			(hero, self, "AMZ_900_HEYWAIT_15_01"); //Warte mal!
	AI_Output			(hero, self, "AMZ_900_HEYWAIT_15_01"); //Počkej chvilku!
//	AI_Output			(self, hero, "AMZ_900_HEYWAIT_16_02"); //(fröhlich) Wir sehen uns später!
	AI_Output			(self, hero, "AMZ_900_HEYWAIT_16_02"); //(radostně) Uvidíme se později!

	AI_StopProcessInfos		(self);
};










//#####################################################################
//##
//##
//##						STERNENGUCKEREI
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info NIGHT
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_NIGHT		(C_INFO)
{
	npc		 = 	AMZ_900_Thora;
	condition	 = 	AMZ_900_Thora_NIGHT_Condition;
	information	 = 	AMZ_900_Thora_NIGHT_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Was tust du hier draussen?";
	description	 = 	"Co tady venku děláš?";
};

func int AMZ_900_Thora_NIGHT_Condition ()
{
	if	Wld_IsTime(THORA_OUT_H, THORA_OUT_M+30, THORA_IN_H, THORA_IN_M)
	&&	(subChapter < CH2_THORA_CONVINCED)
	{
		return TRUE;
	};
};

func void AMZ_900_Thora_NIGHT_Info ()
{
//	AI_Output			(hero, self, "AMZ_900_NIGHT_15_01"); //Was tust du hier draussen?
	AI_Output			(hero, self, "AMZ_900_NIGHT_15_01"); //Co tady venku děláš?
//	AI_Output			(self, hero, "AMZ_900_NIGHT_16_02"); //Ich betrachte die Sterne. Sie sind erfüllt von der Macht des Feuers.
	AI_Output			(self, hero, "AMZ_900_NIGHT_16_02"); //Pozoruji hvězdy. Jsou plné moci ohně.
//	AI_Output			(self, hero, "AMZ_900_NIGHT_16_03"); //Das Feuer bestimmt mein Schicksal, so wie es das der Sterne bestimmt.
	AI_Output			(self, hero, "AMZ_900_NIGHT_16_03"); //Stejně jako utváří oheň hvězdy, utváří i můj osud.
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info NIGHTAGAIN
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_NIGHTAGAIN		(C_INFO)
{
	npc		 = 	AMZ_900_Thora;
	condition	 = 	AMZ_900_Thora_NIGHTAGAIN_Condition;
	information	 = 	AMZ_900_Thora_NIGHTAGAIN_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Betrachtest du immer noch die Sterne?";
	description	 = 	"Pozoruješ pořád hvězdy?";
};

func int AMZ_900_Thora_NIGHTAGAIN_Condition ()
{
	if	AMZ_900_Thora_NIGHT_Condition()
	&&	Npc_KnowsInfo(hero, AMZ_900_Thora_NIGHT)
	&&	(subChapter < CH2_THORA_CONVINCED)
	{
		return TRUE;
	};
};

func void AMZ_900_Thora_NIGHTAGAIN_Info ()
{
//	AI_Output			(hero, self, "AMZ_900_NIGHTAGAIN_15_01"); //Betrachtest du immer noch die Sterne?
	AI_Output			(hero, self, "AMZ_900_NIGHTAGAIN_15_01"); //Pozoruješ pořád hvězdy?
//	AI_Output			(self, hero, "AMZ_900_NIGHTAGAIN_16_02"); //Die Sterne reflektieren das Feuer in mir. Ich liebe die Sterne.
	AI_Output			(self, hero, "AMZ_900_NIGHTAGAIN_16_02"); //Hvězdy odrážejí oheň v mém nitru. Miluji hvězdy.
	AI_StopProcessInfos	(self);
};







//#####################################################################
//##
//##
//##						ARENA-KAMPF
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info MYWEAPON
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_MYWEAPON		(C_INFO)
{
	npc			= AMZ_900_Thora;
	nr			= 1;
	condition	= AMZ_900_Thora_MYWEAPON_Condition;
	information	= AMZ_900_Thora_MYWEAPON_Info;
	important	= TRUE;
	permanent	= TRUE;
};

func int AMZ_900_Thora_MYWEAPON_Condition ()
{
	if	Npc_HasItems(hero, ItMw_Thora_Battlestaff)
	{
		if	Arena_FightRunning
		&&	Arena_PlayerFight
		&&	Thora_Challenged
		&&	!Arena_PlayerStoleWeapon
		{
			return			TRUE;
		}
		else
		{
			//self.aivar		[AIV_PLAYERHASMYWEAPON]	=	TRUE;
			return 			FALSE;
		};
	};
};

func int AMZ_900_Thora_MYWEAPON_Info ()
{
	AI_SetWalkmode			(self, NPC_RUN);
	AI_GotoNpc				(self, hero);
//	AI_Output				(self, hero, "AMZ_900_MYWEAPON_Info_16_01"); //(wütend) Gib mir den Kampfstab!
	AI_Output				(self, hero, "AMZ_900_MYWEAPON_Info_16_01"); //(naštvaně) Dej mi tu bojovou hůl!

	Info_ClearChoices		(AMZ_900_Thora_MYWEAPON);
//	Info_AddChoice			(AMZ_900_Thora_MYWEAPON, "Ich glaube, ich behalte ihn lieber.",	AMZ_900_Thora_MYWEAPON_TAKEN );
	Info_AddChoice			(AMZ_900_Thora_MYWEAPON, "Řekl bych, že si ji radši nechám.",	AMZ_900_Thora_MYWEAPON_TAKEN );
//	Info_AddChoice			(AMZ_900_Thora_MYWEAPON, "Hier hast du das Ding zurück!",	AMZ_900_Thora_MYWEAPON_GIVEBACK );
	Info_AddChoice			(AMZ_900_Thora_MYWEAPON, "Tady ti to vracím!",	AMZ_900_Thora_MYWEAPON_GIVEBACK );
};

func void AMZ_900_Thora_MYWEAPON_GIVEBACK ()
{
	Info_ClearChoices		(AMZ_900_Thora_MYWEAPON);
//	AI_Output				(hero, self, "AMZ_900_MYWEAPON_GIVEBACK_15_01"); //Hier hast du das Ding zurück!
	AI_Output				(hero, self, "AMZ_900_MYWEAPON_GIVEBACK_15_01"); //Tady ti to vracím!
	B_GiveInvItems			(hero, self, ItMw_Thora_Battlestaff, 1);
//	AI_Output				(self, hero, "AMZ_900_MYWEAPON_GIVEBACK_16_02"); //Dann zeig mal, ob du noch was anderes drauf hast, ausser Waffenstehlen.
	AI_Output				(self, hero, "AMZ_900_MYWEAPON_GIVEBACK_16_02"); //Tak předveď, jestli umíš ještě něco jiného, kromě kradení zbraní.

	AI_StopProcessInfos		(self);

};

func void AMZ_900_Thora_MYWEAPON_TAKEN ()
{
	Info_ClearChoices		(AMZ_900_Thora_MYWEAPON);
//	AI_Output				(hero, self, "AMZ_900_MYWEAPON_TAKEN_15_01"); //Ich glaube, ich behalte ihn lieber.
	AI_Output				(hero, self, "AMZ_900_MYWEAPON_TAKEN_15_01"); //Řekl bych, že si ji radši nechám.
//	AI_Output				(self, hero, "AMZ_900_MYWEAPON_TAKEN_16_02"); //(wütender) Du kannst dich nicht mal in der Arena an die Regeln halten!
	AI_Output				(self, hero, "AMZ_900_MYWEAPON_TAKEN_16_02"); //(naštvaněji) Ty nedokážeš dodržovat pravidla ani v aréně!
	AI_StopProcessInfos		(self);

	B_Arena_AbortFight		(AF_PLAYERSTOLEWEAPON);
};

///////////////////////////////////////////////////////////////////////
//	Info CHALLENGED
///////////////////////////////////////////////////////////////////////
instance	AMZ_900_Thora_CHALLENGED (C_INFO)
{
	npc				= AMZ_900_Thora;
	nr				= 2;
	condition		= AMZ_900_Thora_CHALLENGED_Condition;
	information		= AMZ_900_Thora_CHALLENGED_Info;
	important		= TRUE;
	permanent		= TRUE;
};

func int	AMZ_900_Thora_CHALLENGED_Condition()
{
	if	Thora_Challenged
	&&	Arena_PlayerFight
	&&	C_NpcIsInvincible(self)
	{
		return TRUE;
	};
};

func void	AMZ_900_Thora_CHALLENGED_Info()
{
	if	Wld_IsTime(0,0,	ARENABEGIN_H, ARENABEGIN_M)
	{
		if	(Npc_GetDistToWP	(self, ARENA_WP_RIGHT_CHAMBER) > ARENA_DIST_PRECHAMBER)
		{
//			AI_Output			(self, hero,"AMZ_900_CHALLENGED_16_01"); //Bin gespannt, was du draufhast.
			AI_Output			(self, hero,"AMZ_900_CHALLENGED_16_01"); //Jsem zvědavá, co máš přichystáno.
//			AI_Output			(self, hero,"AMZ_900_CHALLENGED_16_02"); //Wir sehen uns heute Abend in der Arena!
			AI_Output			(self, hero,"AMZ_900_CHALLENGED_16_02"); //Uvidíme se večer v aréně!
		}
		else
		{
//			AI_Output			(self, hero,"AMZ_900_CHALLENGED_16_03"); //Das ist MEINE Vorbereitungskammer.
			AI_Output			(self, hero,"AMZ_900_CHALLENGED_16_03"); //Tohle je MOJE šatna.
			B_AttackProper		(self, hero);
		};

		AI_StopProcessInfos		(self);
		return;
	};

	if	Npc_IsInRoutine(self, ZS_ArenaFight)
	{
//		AI_Output				(self, hero,"AMZ_900_CHALLENGED_16_04"); //Bist du nervös, oder warum redest du soviel?
		AI_Output				(self, hero,"AMZ_900_CHALLENGED_16_04"); //Jsi nervózní, nebo proč tolik mluvíš?
		AI_StopProcessInfos		(self);
		return;
	}
	else
	{
//		AI_Output				(self, hero,"MIL_121_CHALLENGED_16_05"); //Wir sehen uns in der Arena. Morgen Abend!
		AI_Output				(self, hero,"MIL_121_CHALLENGED_16_05"); //Uvidíme se v aréně. Zítra večer!
		AI_StopProcessInfos		(self);
		return;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PRENPC
///////////////////////////////////////////////////////////////////////
instance	AMZ_900_Thora_PRENPC (C_INFO)
{
	npc				= AMZ_900_Thora;
	condition		= AMZ_900_Thora_PRENPC_Condition;
	information		= AMZ_900_Thora_PRENPC_Info;
	important		= TRUE;
	permanent		= TRUE;
};

func int	AMZ_900_Thora_PRENPC_Condition()
{
	if	Arena_NpcFight
	&&	(Arena_NpcCombo == AC_MALGAR_THORA)
	&&	Wld_IsTime(ARENAPRE_H, ARENAPRE_M, ARENABEGIN_H, ARENABEGIN_M)
	&&	C_NpcIsInvincible(self)
	{
		return TRUE;
	};
};

func void	AMZ_900_Thora_PRENPC_Info()
{
//	AI_Output			(self, hero,"AMZ_900_PRENPC_16_01"); //Du hast in meiner Vorbereitungskammer nichts zu suchen. Verschwinde!
	AI_Output			(self, hero,"AMZ_900_PRENPC_16_01"); //V mojí šatně nemáš co dělat! Padej!
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info GLADIATOR
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_GLADIATOR		(C_INFO)
{
	npc		 	= 	AMZ_900_Thora;
	nr			=	5;
	condition	= 	AMZ_900_Thora_GLADIATOR_Condition;
	information	= 	AMZ_900_Thora_GLADIATOR_Info;
	important	=	FALSE;
	permanent	=	FALSE;

//	description	=	"Du kämpfst in der Arena?";
	description	=	"Ty bojuješ v aréně?";
};

func int AMZ_900_Thora_GLADIATOR_Condition ()
{
	if	(Npc_GetDistToWP(self, "OCR_ARENABATTLE_BENCH") < 500)
	&&	(subChapter < CH2_THORA_CONVINCED)
	{
		return TRUE;
	};
};

func int AMZ_900_Thora_GLADIATOR_Info ()
{
//	AI_Output			(hero, self, "AMZ_900_GLADIATOR_15_01"); //(ungläubig) Du kämpfst in der Arena?
	AI_Output			(hero, self, "AMZ_900_GLADIATOR_15_01"); //(nevěřícně) Ty bojuješ v aréně?

	if	self.aivar[AIV_HASDEFEATEDSC]
	{
//		AI_Output		(self, hero, "AMZ_900_GLADIATOR_16_02"); //(spöttisch)Du solltest wissen, daß ich mit Waffen umgehen kann.
		AI_Output		(self, hero, "AMZ_900_GLADIATOR_16_02"); //(posměšně) Ty bys ale měl vědět, že já se zbraněmi zacházet umím.
//		AI_Output		(hero, self, "AMZ_900_GLADIATOR_15_03"); //ja... ich erinnere mich!
		AI_Output		(hero, self, "AMZ_900_GLADIATOR_15_03"); //Ano... pamatuju si!

	}
	else
	{
//		AI_Output		(self, hero, "AMZ_900_GLADIATOR_16_04"); //Du glaubst wohl immer noch, daß nur Männer mit Waffen umgehen können!
		AI_Output		(self, hero, "AMZ_900_GLADIATOR_16_04"); //Ty pořád ještě věřím tomu, že se zbraněmi to umí jen muži.
//		AI_Output		(self, hero, "AMZ_900_GLADIATOR_16_05"); //Ich kann dir beweisen, daß das nicht stimmt!
//		AI_Output		(self, hero, "AMZ_900_GLADIATOR_16_05"); //Můžu ti dokázat, že tomu tak není!
	};

};

///////////////////////////////////////////////////////////////////////
//	Info WEAPON
///////////////////////////////////////////////////////////////////////
instance	AMZ_900_Thora_WEAPON (C_INFO)
{
	npc				= AMZ_900_Thora;
	nr				= 5;
	condition		= AMZ_900_Thora_WEAPON_Condition;
	information		= AMZ_900_Thora_WEAPON_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Was hast du da für eine seltsame Waffe?";
	description		= "Copak to máš za zvláštní zbraň?";
};

func int	AMZ_900_Thora_WEAPON_Condition()
{
	if	Npc_KnowsInfo(hero, AMZ_900_Thora_GLADIATOR)
	&&	Npc_HasItems (self, ItMw_Thora_Battlestaff)
	{
		return TRUE;
	};
};

func void	AMZ_900_Thora_WEAPON_Info()
{
//	AI_Output			(hero, self, "AMZ_900_WEAPON_15_01"); //Was hast du da für eine seltsame Waffe?
	AI_Output			(hero, self, "AMZ_900_WEAPON_15_01"); //Copak to máš za zvláštní zbraň?

	AI_ReadyMeleeWeapon	(self);
	AI_TurnToNpc		(self, hero);

	AI_Wait				(self, 0.5);
//	AI_Output			(self, hero, "AMZ_900_WEAPON_16_02"); //Einen thyrianischer Kampfstab.
	AI_Output			(self, hero, "AMZ_900_WEAPON_16_02"); //Thyrianskou bojovou hůl.
//	AI_Output			(self, hero, "AMZ_900_WEAPON_16_03"); //Ist schnell wie ein Pfeil und hat eine grosse Reichweite.
	AI_Output			(self, hero, "AMZ_900_WEAPON_16_03"); //Je rychlá jako šíp a má velký dosah.
//	AI_Output			(self, hero, "AMZ_900_WEAPON_16_04"); //Diese Waffe zu meistern ist sehr schwierig.
	AI_Output			(self, hero, "AMZ_900_WEAPON_16_04"); //Osvojit si tuhle zbraň je dost obtížné.

	AI_RemoveWeapon		(self);
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info VICTORIES
///////////////////////////////////////////////////////////////////////
instance	AMZ_900_Thora_VICTORIES (C_INFO)
{
	npc				= AMZ_900_Thora;
	nr				= 5;
	condition		= AMZ_900_Thora_VICTORIES_Condition;
	information		= AMZ_900_Thora_VICTORIES_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Wieviele Arenakämpfe hast du gewonnen?";
	description		= "Kolik soubojů v aréně jsi už vyhrála?";
};

func int	AMZ_900_Thora_VICTORIES_Condition()
{
	if	Npc_KnowsInfo(hero, AMZ_900_Thora_GLADIATOR)
	&&	(subChapter < CH2_THORA_CONVINCED)
	{
		return TRUE;
	};
};

func void	AMZ_900_Thora_VICTORIES_Info()
{
//	AI_Output			(hero, self, "AMZ_900_VICTORIES_15_01"); //Wieviele Arenakämpfe hast du gewonnen?
	AI_Output			(hero, self, "AMZ_900_VICTORIES_15_01"); //Kolik soubojů v aréně jsi už vyhrála?
//	AI_Output			(self, hero, "AMZ_900_VICTORIES_16_02"); //Also bis jetzt... Alle.
	AI_Output			(self, hero, "AMZ_900_VICTORIES_16_02"); //Tak až doposud... Všechny.
//	AI_Output			(self, hero, "AMZ_900_VICTORIES_16_03"); //(gelangweilt) Die Kämpfer hier sind wirklich keine Gegner für mich!
	AI_Output			(self, hero, "AMZ_900_VICTORIES_16_03"); //(znuděně) Místní bojovníci pro mě vážně nejsou soupeři!
};

///////////////////////////////////////////////////////////////////////
//	Info CHALLENGE
///////////////////////////////////////////////////////////////////////
instance	AMZ_900_Thora_CHALLENGE (C_INFO)
{
	npc				= AMZ_900_Thora;
	nr				= 5;
	condition		= AMZ_900_Thora_CHALLENGE_Condition;
	information		= AMZ_900_Thora_CHALLENGE_Info;
	important		= FALSE;
	permanent		= TRUE;
//	description		= "Ich fordere dich zu einem Arenakampf heraus!";
	description		= "Vyzývám tě k souboji v aréně!";
};

func int	AMZ_900_Thora_CHALLENGE_Condition()
{
	if	Npc_KnowsInfo(hero, AMZ_900_Thora_VICTORIES)
	&&	!Grim_Challenged
	&&	!Goliath_Challenged
	&&	!Brutus_Challenged
	&&	!Malgar_Challenged
	&&	!Thora_Challenged
	&&	Arenamaster_Accepted
	&&	Wld_IsTime(0,0, ARENAPRE_H,ARENAPRE_M)
	&&	(subChapter < CH2_THORA_CONVINCED)
	{
		return TRUE;
	};
};

func void	AMZ_900_Thora_CHALLENGE_Info()
{
//	AI_Output			(hero, self, "AMZ_900_CHALLENGE_15_01"); //Ich fordere dich zu einem Arenakampf heraus!
	AI_Output			(hero, self, "AMZ_900_CHALLENGE_15_01"); //Vyzývám tě k souboji v aréně!

	if	!Npc_HasItems(self, ItMw_Thora_Battlestaff)
	{
//		AI_Output		(self, hero,"AMZ_900_CHALLENGE_16_02"); //Sobald ich meinen Kampfstab wiederhabe, werde ich gegen dich antreten.
		AI_Output		(self, hero,"AMZ_900_CHALLENGE_16_02"); //Dokud nebudu mít zpátky svoji bojovou hůl, tak proti tobě nenastoupím.

		if	Npc_HasItems(hero, ItMw_Thora_Battlestaff)
		{
			Info_ClearChoices	(AMZ_900_Thora_CHALLENGE);
//			Info_AddChoice		(AMZ_900_Thora_CHALLENGE, "Ich habe deine Waffe... ähem... gefunden! Hier!",AMZ_900_Thora_CHALLENGE_FOUND);
			Info_AddChoice		(AMZ_900_Thora_CHALLENGE, "Já tu tvoji zbraň... ehm... našel! Tady!",AMZ_900_Thora_CHALLENGE_FOUND);
		};
		return;
	};

	if	!Thora_PlayerWonBefore
	{
//		AI_Output		(hero, self, "AMZ_900_CHALLENGE_15_03"); //Wird doch Zeit, daß du mal einen Kampf verlierst!
		AI_Output		(hero, self, "AMZ_900_CHALLENGE_15_03"); //Je na čase, abys zase jednou prohrál v souboji!
	};

	if	Arena_PlayerBanned
	{
//		AI_Output		(self, hero, "AMZ_900_CHALLENGE_16_04"); //Du hast Mist gebaut, in der Arena.
		AI_Output		(self, hero, "AMZ_900_CHALLENGE_16_04"); //Udělal jsi v aréně pěknou kravinu.
//		AI_Output		(self, hero, "AMZ_900_CHALLENGE_16_05"); //Klär das mit dem Arenameister, sonst kann ich nicht gegen dich kämpfen!
		AI_Output		(self, hero, "AMZ_900_CHALLENGE_16_05"); //Ujasni si to vedoucím arény, jinak proti tobě nemůžu bojovat!
		AI_StopProcessInfos	(self);
	}
	else
	{
		if	!Malgar_PlayerWonBefore
		{

//			AI_Output	(self, hero, "AMZ_900_CHALLENGE_16_06"); //Solange du nicht mal Malgar besiegt hast, kämpfe ich nicht gegen dich!
			AI_Output	(self, hero, "AMZ_900_CHALLENGE_16_06"); //Dokud neporazíš Malgara, nebudu proti tobě bojovat!
//			AI_Output	(self, hero, "AMZ_900_CHALLENGE_16_07"); //Er ist nach mir der zweitbeste Kämpfer hier.
			AI_Output	(self, hero, "AMZ_900_CHALLENGE_16_07"); //Je tu po mně druhý nejlepší bojovník.
			return;
		};

		//else
//		AI_Output		(self, hero, "AMZ_900_CHALLENGE_16_08"); //Es wird mir eine Freude sein, gegen dich zu kämpfen.
		AI_Output		(self, hero, "AMZ_900_CHALLENGE_16_08"); //Bude mi potěšením se s tebou utkat.
//		AI_Output		(self, hero, "AMZ_900_CHALLENGE_16_09"); //Gib dein Preisgeld beim Arenameister ab, dann können wir heute abend zusammen... (neckisch) TANZEN!!!
		AI_Output		(self, hero, "AMZ_900_CHALLENGE_16_09"); //Dej svoje peníze vedoucímu arény, pak si můžeme večer... (směle) ZATANČIT!!!

		Thora_Challenged = TRUE;
	};
};

func void AMZ_900_Thora_CHALLENGE_FOUND ()
{
	Info_ClearChoices	(AMZ_900_Thora_CHALLENGE);
//	AI_Output			(hero, self,"AMZ_900_CHALLENGE_FOUND_15_01"); //Ich habe deine Waffe... ähem... gefunden! Hier!
	AI_Output			(hero, self,"AMZ_900_CHALLENGE_FOUND_15_01"); //Já tu tvoji zbraň... ehm... našel! Tady!
	B_GiveInvItems		(hero, self, ItMw_Thora_Battlestaff, 1);
//	AI_Output			(self, hero,"AMZ_900_CHALLENGE_FOUND_16_02"); //Kann nur für dich hoffen, dass du sie wirklich GEFUNDEN hast.
	AI_Output			(self, hero,"AMZ_900_CHALLENGE_FOUND_16_02"); //Pro tvoje vlastní dobro doufám, že jsi ji opravdu NAŠEL.
	AI_StopProcessInfos	(self);
};







//#####################################################################
//##
//##
//##						KAMPF-STAB
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info TEACHME
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_TEACHME		(C_INFO)
{
	npc		 	 = 	AMZ_900_Thora;
	nr		 	 = 	1;
	condition	 = 	AMZ_900_Thora_TEACHME_Condition;
	information	 = 	AMZ_900_Thora_TEACHME_Info;
//	description	 = 	"Kannst du mir den Umgang mit dem Kampfstab beibringen?";
	description	 = 	"Mohla bys mě naučit zacházet s bojovou holí?";
};

func int AMZ_900_Thora_TEACHME_Condition ()
{
	if	Npc_KnowsInfo(hero, AMZ_900_Thora_WEAPON)
	{
		return TRUE;
	};
};

func int AMZ_900_Thora_TEACHME_Info ()
{
//	AI_Output			(hero, self, "AMZ_900_TEACHME_15_01"); //Kannst du mir den Umgang mit dem Kampfstab beibringen?
	AI_Output			(hero, self, "AMZ_900_TEACHME_15_01"); //Mohla bys mě naučit zacházet s bojovou holí?
//	AI_Output			(self, hero, "AMZ_900_TEACHME_16_02"); //Ich könnte schon. Aber die Waffe ist schwer zu führen, nichts für Anfänger!
	AI_Output			(self, hero, "AMZ_900_TEACHME_16_02"); //Mohla bych. Ale ovládat tuhle zbraň je náročné, nic pro začátečníky!
//	AI_Output			(self, hero, "AMZ_900_TEACHME_16_03"); //Solange Du kein gleichwertiger Gegner für mich bist, wäre das reine Zeitverschwendung!
	AI_Output			(self, hero, "AMZ_900_TEACHME_16_03"); //Dokud pro mě nebudeš rovnocenným protivníkem, byla by to jen ztráta času!
};

///////////////////////////////////////////////////////////////////////
//	Info TEACHWHAT
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_TEACHWHAT		(C_INFO)
{
	npc		 	= 	AMZ_900_Thora;
	nr		 	= 	1;
	condition	= 	AMZ_900_Thora_TEACHWHAT_Condition;
	information	= 	AMZ_900_Thora_TEACHWHAT_Info;

	permanent	=	TRUE;
//	description	= 	"Was muss ich tun, damit du mich am Kampfstab unterrichtest?";
	description	= 	"Co musím udělat, abys mě učila bojovat s holí?";
};

func int AMZ_900_Thora_TEACHWHAT_Condition ()
{
	if	Npc_KnowsInfo(hero, AMZ_900_Thora_TEACHME)
	{
		return TRUE;
	};
};

func int AMZ_900_Thora_TEACHWHAT_Info ()
{
//	AI_Output			(hero, self, "AMZ_900_TEACHWHAT_15_01"); //Was muss ich tun, damit du mich am Kampfstab unterrichtest?
	AI_Output			(hero, self, "AMZ_900_TEACHWHAT_15_01"); //Co musím udělat, abys mě učila bojovat s holí?
//	AI_Output			(self, hero, "AMZ_900_TEACHWHAT_16_02"); //Du musst dir meinen Respekt verdienen! Bisher hat das noch keiner der Gladiatoren hier geschafft.
	AI_Output			(self, hero, "AMZ_900_TEACHWHAT_16_02"); //Musíš si vysloužit moje uznání! Což se tu doposud nepodařilo nikomu z gladiátorů.
};

///////////////////////////////////////////////////////////////////////
//	Info TEACHNOW
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_TEACHNOW		(C_INFO)
{
	npc		 	= 	AMZ_900_Thora;
	nr		 	= 	1;
	condition	= 	AMZ_900_Thora_TEACHNOW_Condition;
	information	= 	AMZ_900_Thora_TEACHNOW_Info;

//	description	= 	"Zeigst du mir jetzt den Umgang mit dem Kampfstab?";
	description	= 	"Ukážeš mi teď jak zacházet s bojovou holí?";
};

func int AMZ_900_Thora_TEACHNOW_Condition ()
{
	if	Thora_PlayerWonBefore
	{
		return TRUE;
	};
};

func int AMZ_900_Thora_TEACHNOW_Info ()
{
//	AI_Output			(hero, self, "AMZ_900_TEACHNOW_15_01"); //Zeigst du mir jetzt den Umgang mit dem Kampfstab?
	AI_Output			(hero, self, "AMZ_900_TEACHNOW_15_01"); //Ukážeš mi teď jak zacházet s bojovou holí?
	if	(B_Arena_GetGladiatorRanking(PC_Hero) == 1)
	{
//		AI_Output		(self, hero, "AMZ_900_TEACHNOW_16_02"); //Du hast mich in der Arena besiegt, aber vielleicht hast du nur Glück gehabt.
		AI_Output		(self, hero, "AMZ_900_TEACHNOW_16_02"); //Porzail jsi mě v aréně, ale to jsi měl možná jen štěstí.
//		AI_Output		(self, hero, "AMZ_900_TEACHNOW_16_03"); //Wenn du es schaffst, mich als Champion abzulösen, werde dich in die Kunst des Kampfstabes einführen.
		AI_Output		(self, hero, "AMZ_900_TEACHNOW_16_03"); //Pokud se ti podaří mě jako šampionku nahradit, uvedu tě do umění boje s holí.
	}
	else
	{
//		AI_Output		(self, hero, "AMZ_900_TEACHNOW_16_04"); //Du hast es geschafft. Du bist Champion dieser Arena.
		AI_Output		(self, hero, "AMZ_900_TEACHNOW_16_04"); //Dokázal jsi to. Jsi šampionem této arény.
//		AI_Output		(self, hero, "AMZ_900_TEACHNOW_16_05"); //Wie versprochen werde ich dich nun im Stabkampf unterrichten. Sag mir, wenn du bereit dafür bist.
		AI_Output		(self, hero, "AMZ_900_TEACHNOW_16_05"); //Jak jsem slíbila, budu tě teď učit boji s holí. Řekni mi, až k tomu budeš připraven.
	};

};









//#####################################################################
//##
//##
//##				KAPITEL 2 (Weg zur Bergfestung)
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info NEEDTOFORTRESS
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_NEEDTOFORTRESS		(C_INFO)
{
	npc		 	 = 	AMZ_900_Thora;
	condition	 = 	AMZ_900_Thora_NEEDTOFORTRESS_Condition;
	information	 = 	AMZ_900_Thora_NEEDTOFORTRESS_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Ich muss mit den Feuermagiern in der Bergfestung sprechen!";
	description	 = 	"Musím mluvit s mágy ohně ve Skalní pevnosti!";
};

func int AMZ_900_Thora_NEEDTOFORTRESS_Condition ()
{
	if	Npc_KnowsInfo(hero, PC_Thief_PROBLEM)
	&&	(subChapter < CH2_THORA_CONVINCED)
	{
		return TRUE;
	};
};

func void AMZ_900_Thora_NEEDTOFORTRESS_Info ()
{
//	AI_Output			(hero, self, "AMZ_900_NEEDTOFORTRESS_15_01"); //Ich muss mit den Feuermagiern in der Bergfestung sprechen!
	AI_Output			(hero, self, "AMZ_900_NEEDTOFORTRESS_15_01"); //Musím mluvit s mágy ohně ve Skalní pevnosti!
//	AI_Output			(self, hero, "AMZ_900_NEEDTOFORTRESS_16_02"); //Du bist ja ein Spassvogel, warum erzählst du mir das?
	AI_Output			(self, hero, "AMZ_900_NEEDTOFORTRESS_16_02"); //Ty jsi ale vtipálek, proč mi to povídáš?

//	Info_AddChoice		(AMZ_900_Thora_NEEDTOFORTRESS, "Ich hörte, du bist eine Kundschafterin der Paladine!", AMZ_900_Thora_NEEDTOFORTRESS_NEAR );
	Info_AddChoice		(AMZ_900_Thora_NEEDTOFORTRESS, "Slyšel jsem, že pracuješ pro paladiny jako zvěd!", AMZ_900_Thora_NEEDTOFORTRESS_NEAR );
//	Info_AddChoice		(AMZ_900_Thora_NEEDTOFORTRESS, "Kein Wort mehr Weib! Du wirst mich dorthinbringen.", AMZ_900_Thora_NEEDTOFORTRESS_INSULT );
	Info_AddChoice		(AMZ_900_Thora_NEEDTOFORTRESS, "Už ani slovo, ženo! Dostaneš mě tam.", AMZ_900_Thora_NEEDTOFORTRESS_INSULT );
//	Info_AddChoice		(AMZ_900_Thora_NEEDTOFORTRESS, "Diego schickt mich! Du sollst mich dorthinbringen.", AMZ_900_Thora_NEEDTOFORTRESS_DIEGO );
	Info_AddChoice		(AMZ_900_Thora_NEEDTOFORTRESS, "Posílá mě Diego! Máš mě tam dostat.", AMZ_900_Thora_NEEDTOFORTRESS_DIEGO );
};

func void AMZ_900_Thora_NEEDTOFORTRESS_NEAR ()
{
	Info_ClearChoices	(AMZ_900_Thora_NEEDTOFORTRESS);

//	AI_Output			(hero, self, "AMZ_900_NEEDTOFORTRESS_NEAR_15_01"); //Ich hörte, du bist eine Kundschafterin der Paladine!
	AI_Output			(hero, self, "AMZ_900_NEEDTOFORTRESS_NEAR_15_01"); //Slyšel jsem, že pracuješ pro paladiny jako zvěd!
//	AI_Output			(self, hero, "AMZ_900_NEEDTOFORTRESS_NEAR_16_02"); //Scheint sich ja mittlerweile herumgesprochen zu haben.
	AI_Output			(self, hero, "AMZ_900_NEEDTOFORTRESS_NEAR_16_02"); //Vypadá to, že už se to stihlo rozkřiknout.
//	AI_Output			(self, hero, "AMZ_900_NEEDTOFORTRESS_NEAR_16_03"); //Aber warum sollte ich dich zur Bergfestung bringen?
	AI_Output			(self, hero, "AMZ_900_NEEDTOFORTRESS_NEAR_16_03"); //Ale proč bych tě měla brát do Skalní pevnosti?
//	AI_Output			(hero, self, "AMZ_900_NEEDTOFORTRESS_NEAR_15_04"); //Es ist von grösster Wichtigkeit. Ich habe Informationen über die dämonische Bedrohung nach der die Feuermagier forschen.
	AI_Output			(hero, self, "AMZ_900_NEEDTOFORTRESS_NEAR_15_04"); //Je to mimořádně důležité. Mám informace o démoní hrozbě, po které se ohniví mágové pídí.
	AI_StandUp			(self);
	AI_TurnToNpc		(self, hero);
	AI_TurnToNpc		(hero, self);
//	AI_Output			(self, hero, "AMZ_900_NEEDTOFORTRESS_NEAR_16_05"); //(überrascht) Was weist DU über die Dämonen?
	AI_Output			(self, hero, "AMZ_900_NEEDTOFORTRESS_NEAR_16_05"); //(překvapená) Co TY víš o démonech?
//	AI_Output			(hero, self, "AMZ_900_NEEDTOFORTRESS_NEAR_15_06"); //Bringe mich zur Festung, es ist wichtig.
	AI_Output			(hero, self, "AMZ_900_NEEDTOFORTRESS_NEAR_15_06"); //Doveď mě do pevnosti, je to důležité.
//	AI_Output			(self, hero, "AMZ_900_NEEDTOFORTRESS_NEAR_16_07"); //Nun gut, ich werde dich an den Wachen vorbeibringen, aber ich kann dir nicht alle Türen öffnen. Du wirst allerhand Überzeugungsarbeit leisten müssen.
	AI_Output			(self, hero, "AMZ_900_NEEDTOFORTRESS_NEAR_16_07"); //No dobře, dostanu tě přes stráže, ale všude ti otevřít nemohu. Budeš muset každopádně muset hodně přesvědčovat.
//	B_LogEntry			(CH1_DemonThreat, "Ich konnte Thora dazu bringen, mich zur Bergfestung zu führen. Allerdings wird sie mich nur an den ersten Wachen vorbeibringen. Danach bin ich auf mich allein gestellt.");
	B_LogEntry			(CH1_DemonThreat, "Dokázal jsem Thoru přesvědčit, aby mě vzala do Skalní pevnosti. Každopádně mě dostane jen přes první strážné. Potom se už musím spolehnout na sebe.");
	subChapter			= CH2_THORA_CONVINCED;
};

func void AMZ_900_Thora_NEEDTOFORTRESS_DIEGO ()
{
//	AI_Output			(hero, self, "AMZ_900_NEEDTOFORTRESS_DIEGO_15_01"); //Diego schickt mich! Du sollst mich dorthinbringen.
	AI_Output			(hero, self, "AMZ_900_NEEDTOFORTRESS_DIEGO_15_01"); //Posílá mě Diego! Máš mě tam dostat.
//	AI_Output			(self, hero, "AMZ_900_NEEDTOFORTRESS_DIEGO_16_02"); //Ja und?? Diego hat mir garnichts zu sagen!
	AI_Output			(self, hero, "AMZ_900_NEEDTOFORTRESS_DIEGO_16_02"); //No a?? Diego mě nemá vůbec nic co říkat!
};

func void AMZ_900_Thora_NEEDTOFORTRESS_INSULT ()
{
	Info_ClearChoices	(AMZ_900_Thora_NEEDTOFORTRESS);

//	AI_Output			(hero, self, "AMZ_900_NEEDTOFORTRESS_INSULT_15_01"); //Kein Wort mehr Weib! Du wirst mich dorthinbringen.
	AI_Output			(hero, self, "AMZ_900_NEEDTOFORTRESS_INSULT_15_01"); //Už ani slovo, ženo! Dostaneš mě tam.

	if	self.aivar[AIV_HASDEFEATEDSC]
	{
//		AI_Output		(self, hero, "AMZ_900_NEEDTOFORTRESS_INSULT_16_02"); //(seufzt) Sind die blauen Flecken, die ich dir verpasst habe etwa schon wieder verheilt?
		AI_Output		(self, hero, "AMZ_900_NEEDTOFORTRESS_INSULT_16_02"); //(vzdychne) Jsou už ty modřiny, kterými jsem tě nedávno ozdobila, zase uzdravené?
//		AI_Output		(self, hero, "AMZ_900_NEEDTOFORTRESS_INSULT_16_03"); //Kein Problem, ich kann dir gerne ein paar neue verabreichen.
		AI_Output		(self, hero, "AMZ_900_NEEDTOFORTRESS_INSULT_16_03"); //Žádný problém, ráda ti udělám pár nových.
	}
	else
	{
//		AI_Output		(self, hero, "AMZ_900_NEEDTOFORTRESS_INSULT_16_04"); //(seufzt) Ich glaube du brauchst eine Lektion in guten Manieren.
		AI_Output		(self, hero, "AMZ_900_NEEDTOFORTRESS_INSULT_16_04"); //(vzdychne) Řekla bych, že potřebuješ lekci slušného chování.
	};

	AI_StopProcessInfos	(self);
	B_AttackProper		(self, hero);
};

///////////////////////////////////////////////////////////////////////
//	Info LETSGO
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_LETSGO		(C_INFO)
{
	npc		 	 = 	AMZ_900_Thora;
	condition	 = 	AMZ_900_Thora_LETSGO_Condition;
	information	 = 	AMZ_900_Thora_LETSGO_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Dann lass uns zur Bergfestung aufbrechen.";
	description	 = 	"Tak se vydejme do Skalní pevnosti.";
};

func int AMZ_900_Thora_LETSGO_Condition ()
{
	if	(subChapter >= CH2_THORA_CONVINCED)

	{
		return TRUE;
	};
};

func void AMZ_900_Thora_LETSGO_Info ()
{
//	AI_Output			(hero, self, "AMZ_900_LETSGO_15_01"); //Dann lass uns zur Bergfestung aufbrechen.
	AI_Output			(hero, self, "AMZ_900_LETSGO_15_01"); //Tak se vydejme do Skalní pevnosti.
//	AI_Output			(self, hero, "AMZ_900_LETSGO_16_02"); //Ich bin bereit. Etwas Abwechslung ist mir ohnehin willkommen.
	AI_Output			(self, hero, "AMZ_900_LETSGO_16_02"); //Jsem připravena. Beztak uvítám nějakou změnu.
//	AI_Output			(self, hero, "AMZ_900_LETSGO_16_03"); //Sollten wir uns unterwegs verlieren, treffen wir uns wieder an der Arena, klar?
	AI_Output			(self, hero, "AMZ_900_LETSGO_16_03"); //Kdybychom se jeden druhému ztratili, setkáme se znovu u arény, jasné?
//	AI_Output			(hero, self, "AMZ_900_LETSGO_15_04"); //An der Arena! Klar!
	AI_Output			(hero, self, "AMZ_900_LETSGO_15_04"); //U arény! Jasné!
//	AI_Output			(self, hero, "AMZ_900_LETSGO_16_05"); //Dann folge mir, wenn du es schaffst an mir dranzubleiben.
	AI_Output			(self, hero, "AMZ_900_LETSGO_16_05"); //Tak pojď za mnou, jestli teda dokážeš se mnou držet krok.
//	B_LogEntry			(CH1_DemonThreat, "Sollte wir auf dem Weg in die Bergfestung getrennt werden, treffen wir uns an der Arena im Alten Lager wieder.");
	B_LogEntry			(CH1_DemonThreat, "Kdybychom se na cestě do Skalní pevnosti rozdělili, potkáme se znovu u arény ve Starém táboře..");

	AI_StopProcessInfos	(self);
	B_SetAttitude		(self, ATT_FRIENDLY);

	// 1. Abschnitt
	B_GuidePC			(self, "GuideToBF", TOBF_SCAV);
	Wld_InsertNpc		(Scavenger,			"FP_ROAM_OW_WARAN_OC_PSI1");
	Wld_InsertNpc		(Scavenger,			"FP_ROAM_OW_WARAN_OC_PSI3");
	Wld_InsertNpc		(Scavenger,			"FP_ROAM_OW_WARAN_OC_PSI5");
};

///////////////////////////////////////////////////////////////////////
//	Info ONWAYTOBF
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_ONWAYTOBF		(C_INFO)
{
	npc		 = 	AMZ_900_Thora;
	condition	 = 	AMZ_900_Thora_ONWAYTOBF_Condition;
	information	 = 	AMZ_900_Thora_ONWAYTOBF_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Von mir aus kanns weiter gehen!";
	description	 = 	"Pokud jde o mě, můžeme pokračovat!";
};

func int AMZ_900_Thora_ONWAYTOBF_Condition ()
{
	if	Npc_KnowsInfo(hero, AMZ_900_Thora_LETSGO)
	&&	!Npc_KnowsInfo(hero, AMZ_900_Thora_SQUARE)
	{
		return TRUE;
	};
};

func void AMZ_900_Thora_ONWAYTOBF_Info ()
{
//	AI_Output			(hero, self, "AMZ_900_ONWAYTOBF_15_01"); //Von mir aus kanns weiter gehen!
	AI_Output			(hero, self, "AMZ_900_ONWAYTOBF_15_01"); //Pokud jde o mě, můžeme pokračovat!
//	AI_Output			(self, hero, "AMZ_900_ONWAYTOBF_16_02"); //Gut! Wir sind bald da!
	AI_Output			(self, hero, "AMZ_900_ONWAYTOBF_16_02"); //Dobře! Brzo už tam budeme!
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info KILLEDSCAV
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_KILLEDSCAV		(C_INFO)
{
	npc		 = 	AMZ_900_Thora;
	condition	 = 	AMZ_900_Thora_KILLEDSCAV_Condition;
	information	 = 	AMZ_900_Thora_KILLEDSCAV_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};

func int AMZ_900_Thora_KILLEDSCAV_Condition ()
{
	if	Npc_KnowsInfo(hero, AMZ_900_Thora_LETSGO)
	&&	(Npc_GetDistToWP(self, TOBF_SCAV) < 500)
	{
		return TRUE;
	};
};

func void AMZ_900_Thora_KILLEDSCAV_Info ()
{
//	AI_Output			(self, hero, "AMZ_900_KILLEDSCAV_16_01"); //Diese Scavanger sind wirklich lästig.
	AI_Output			(self, hero, "AMZ_900_KILLEDSCAV_16_01"); //Tihle mrchožrouti jsou vážně otravní.
//	AI_Output			(self, hero, "AMZ_900_KILLEDSCAV_16_02"); //Die vermehren sich schneller, als man sie zu Essbarem verarbeiten kann.
	AI_Output			(self, hero, "AMZ_900_KILLEDSCAV_16_02"); //Množí se rychleji, než se z nich dá udělat něco stravitelného.
	AI_StopProcessInfos	(self);

	B_GuidePC			(self, "GuideToBF", TOBF_DEMONSCAV);
	Wld_InsertNpc		(ScavengerDemon,	"SPAWN_OW_SCAVENGER_GOBBOCAVE_03_01");
	Wld_InsertNpc		(ScavengerDemon,	"SPAWN_OW_SCAVENGER_GOBBOCAVE_03_01");
};

///////////////////////////////////////////////////////////////////////
//	Info KILLEDDEMONSCAV
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_KILLEDDEMONSCAV		(C_INFO)
{
	npc		 = 	AMZ_900_Thora;
	condition	 = 	AMZ_900_Thora_KILLEDDEMONSCAV_Condition;
	information	 = 	AMZ_900_Thora_KILLEDDEMONSCAV_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};

func int AMZ_900_Thora_KILLEDDEMONSCAV_Condition ()
{
	if	Npc_KnowsInfo(hero, AMZ_900_Thora_KILLEDSCAV)
	&&	(Npc_GetDistToWP(self, TOBF_DEMONSCAV) < 500)
	{
		return TRUE;
	};
};

func void AMZ_900_Thora_KILLEDDEMONSCAV_Info ()
{
//	AI_Output			(self, hero, "AMZ_900_KILLEDDEMONSCAV_16_01"); //Verdammte dämonische Brut!
	AI_Output			(self, hero, "AMZ_900_KILLEDDEMONSCAV_16_01"); //Zatracená démoní mláďata!
//	AI_Output			(hero, self, "AMZ_900_KILLEDDEMONSCAV_15_02"); //Was waren das für monströse Scavenger?
	AI_Output			(hero, self, "AMZ_900_KILLEDDEMONSCAV_15_02"); //Co to bylo za obludné mrchožrouty?
//	AI_Output			(self, hero, "AMZ_900_KILLEDDEMONSCAV_16_03"); //Die Magier sagen, dies seien von Dämonen besessene Tiere.
	AI_Output			(self, hero, "AMZ_900_KILLEDDEMONSCAV_16_03"); //Mágové říkají, že tohle jsou démony posedlá zvířata.
//	AI_Output			(self, hero, "AMZ_900_KILLEDDEMONSCAV_16_04"); //Viel stärker und widerstandsfähiger als normale Exemplare ihrer Art.
	AI_Output			(self, hero, "AMZ_900_KILLEDDEMONSCAV_16_04"); //Mnohem silnější a odolnější než běžní jedinci jejich druhu.
//	AI_Output			(self, hero, "AMZ_900_KILLEDDEMONSCAV_16_05"); //Sie sollten bald was dagegen unternehmen, sonst werden sie uns noch überrollen.
	AI_Output			(self, hero, "AMZ_900_KILLEDDEMONSCAV_16_05"); //Měli by s nimi rychle něco udělat, jinak nás tu ještě zavalí.

	B_GuidePC			(self, "GuideToBF", TOBF_RECCETOWER);
};

///////////////////////////////////////////////////////////////////////
//	Info WHATBRIDGE
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_WHATBRIDGE		(C_INFO)
{
	npc		 = 	AMZ_900_Thora;
	condition	 = 	AMZ_900_Thora_WHATBRIDGE_Condition;
	information	 = 	AMZ_900_Thora_WHATBRIDGE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Was ist auf der anderen Seite der Brücke dort hinten.";
	description	 = 	"Co je na druhé straně toho mostu tamhle?";
};

func int AMZ_900_Thora_WHATBRIDGE_Condition ()
{
	if	Npc_KnowsInfo(hero, AMZ_900_Thora_KILLEDDEMONSCAV)
	&&	(Npc_GetDistToWP(self, TOBF_DEMONSCAV) < 500)
	{
		return TRUE;
	};
};

func void AMZ_900_Thora_WHATBRIDGE_Info ()
{
//	AI_Output			(hero, self, "AMZ_900_WHATBRIDGE_15_01"); //Was ist auf der anderen Seite der Brücke dort hinten.
	AI_Output			(hero, self, "AMZ_900_WHATBRIDGE_15_01"); //Co je na druhé straně toho mostu tamhle?
//	AI_Output			(self, hero, "AMZ_900_WHATBRIDGE_16_02"); //Ein kleines Höhlensystem. Dort soll früher eine ganze Horde schwarzer Goblins gehaust haben.
	AI_Output			(self, hero, "AMZ_900_WHATBRIDGE_16_02"); //Malý systém jeskyň. Dříve se tam zabydlela celá horda černých goblinů.
//	AI_Output			(self, hero, "AMZ_900_WHATBRIDGE_16_03"); //Aber hüte dich vor der Höhle.
	AI_Output			(self, hero, "AMZ_900_WHATBRIDGE_16_03"); //Ale dej si na tu jeskyni pozor.
//	AI_Output			(hero, self, "AMZ_900_WHATBRIDGE_15_04"); //Warum?
	AI_Output			(hero, self, "AMZ_900_WHATBRIDGE_15_04"); //Proč?
//	AI_Output			(self, hero, "AMZ_900_WHATBRIDGE_16_05"); //Die untoten Gebeine dieser heimtückischen Geschöpfe streifen noch immer durch die Höhlenstollen.
	AI_Output			(self, hero, "AMZ_900_WHATBRIDGE_16_05"); //Nemrtví kostlivci těch zákeřných tvorů stále bloudí jeskynními tunely.
//	AI_Output			(self, hero, "AMZ_900_WHATBRIDGE_16_06"); //Nun aber weiter.
	AI_Output			(self, hero, "AMZ_900_WHATBRIDGE_16_06"); //Teď ale dále.

	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info RECCETOWER
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_RECCETOWER		(C_INFO)
{
	npc		 	 = 	AMZ_900_Thora;
	condition	 = 	AMZ_900_Thora_RECCETOWER_Condition;
	information	 = 	AMZ_900_Thora_RECCETOWER_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};

func int AMZ_900_Thora_RECCETOWER_Condition ()
{
	if	Npc_KnowsInfo(hero, AMZ_900_Thora_KILLEDDEMONSCAV)
	&&	(Npc_GetDistToWP(self, TOBF_RECCETOWER) < 500)
	{
		return TRUE;
	};
};

func void AMZ_900_Thora_RECCETOWER_Info ()
{
//	AI_Output			(self, hero, "AMZ_900_RECCETOWER_16_01"); //Hier ist einer unserer Aussenposten.
	AI_Output			(self, hero, "AMZ_900_RECCETOWER_16_01"); //Tady je jedna z našich základen.
//	AI_Output			(self, hero, "AMZ_900_RECCETOWER_16_02"); //Die Kundschafter halten nach Orks Ausschau und melden regelmässig alle Aktivitäten an die Paladine in der Bergfestung.
	AI_Output			(self, hero, "AMZ_900_RECCETOWER_16_02"); //Zvědové dávají pozor na skřety a pravidelně hlásí všechny jejich aktivity paladinům v pevnosti.
//	AI_Output			(hero, self, "AMZ_900_RECCETOWER_15_03"); //Euch scheint nichts zu entgehen!
	AI_Output			(hero, self, "AMZ_900_RECCETOWER_15_03"); //Vám prostě nic neunikne!
//	AI_Output			(self, hero, "AMZ_900_RECCETOWER_16_04"); //Garwog hat noch mehr Kundschafter hier im Tal, auch ich bin einer von ihnen.
	AI_Output			(self, hero, "AMZ_900_RECCETOWER_16_04"); //Garwog má ještě více zvědů v údolí, i já jsem jedna z nich.
//	AI_Output			(hero, self, "AMZ_900_RECCETOWER_15_05"); //Wer ist Garwog?
	AI_Output			(hero, self, "AMZ_900_RECCETOWER_15_05"); //Kdo je Garwog?
//	AI_Output			(self, hero, "AMZ_900_RECCETOWER_16_06"); //Er ist der Paladin, der für die Kundschafter und Aussenposten verantwortlich ist.
	AI_Output			(self, hero, "AMZ_900_RECCETOWER_16_06"); //Je to paladin, který je zodpovědný za zvědy a základny.
//	AI_Output			(self, hero, "AMZ_900_RECCETOWER_16_07"); //Mein Auftraggeber, wenn du so willst.
	AI_Output			(self, hero, "AMZ_900_RECCETOWER_16_07"); //Ten, co mi dává úkoly, jestli to chceš takhle.

	AI_StopProcessInfos	(self);

	B_GuidePC			(self, "GuideToBF", TOBF_OUTERGATE);
};

///////////////////////////////////////////////////////////////////////
//	Info OUTERGATE
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_OUTERGATE		(C_INFO)
{
	npc		 = 	AMZ_900_Thora;
	condition	 = 	AMZ_900_Thora_OUTERGATE_Condition;
	information	 = 	AMZ_900_Thora_OUTERGATE_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};

func int AMZ_900_Thora_OUTERGATE_Condition ()
{
	if	Npc_KnowsInfo(hero, AMZ_900_Thora_RECCETOWER)
	&&	(Npc_GetDistToWP(self, TOBF_OUTERGATE) < 500)
	{
		return TRUE;
	};
};

func void AMZ_900_Thora_OUTERGATE_Info ()
{
//	AI_Output			(self, hero, "AMZ_900_OUTERGATE_16_01"); //Ab hier beginnt das abgeriegelte Gebiet der Felsenfestung. Nur Gefolgsleute des Königs dürfen es betreten.
	AI_Output			(self, hero, "AMZ_900_OUTERGATE_16_01"); //Zde začíná uzavřené území Skalní pevnosti. Jenom následovníci krále tam mohou vstoupit.
//	AI_Output			(hero, self, "AMZ_900_OUTERGATE_15_02"); //Diese Torwachen dort... sind Soldaten des Königs ???
	AI_Output			(hero, self, "AMZ_900_OUTERGATE_15_02"); //Ti strážní u brány támhle... jsou vojáci krále???
//	AI_Output			(self, hero, "AMZ_900_OUTERGATE_16_03"); //(zögerlich) Nicht wirklich... genau genommen sind es nur Hilfstruppen.
	AI_Output			(self, hero, "AMZ_900_OUTERGATE_16_03"); //(váhavě) Ne tak docela... přísně vzato to jsou jen pomocná vojska.
//	AI_Output			(self, hero, "AMZ_900_OUTERGATE_16_04"); //Billig angeworben und hastig ausgebildet, um den ersten Ansturm der Orks zu bremsen.
	AI_Output			(self, hero, "AMZ_900_OUTERGATE_16_04"); //Najatí zalevno a narychlo vycvičení, aby zbrzdili první skřetí útok.
//	AI_Output			(self, hero, "AMZ_900_OUTERGATE_16_05"); //Sie wissen das selbst aber sie hören es nicht gerne. Also sprich sie nicht darauf an, wenn du Ärger vermeiden willst.
	AI_Output			(self, hero, "AMZ_900_OUTERGATE_16_05"); //Sami to dobře vědí, ale neslyší to rádi. Takže s nimi o tom nemluv, pokud se chceš vyhnout hádkám.
//	AI_Output			(hero, self, "AMZ_900_OUTERGATE_15_06"); //(zu sich selbst, sarkastisch) Das wird ein richtiger Spass werden.
	AI_Output			(hero, self, "AMZ_900_OUTERGATE_15_06"); //(sám k sobě, sarkasticky) To by byla vážně sranda.

	AI_StopProcessInfos	(self);

	B_GuidePC			(self, "GuideToBF", TOBF_SQUARE);
};

///////////////////////////////////////////////////////////////////////
//	Info SQUARE
///////////////////////////////////////////////////////////////////////
instance AMZ_900_Thora_SQUARE		(C_INFO)
{
	npc		 = 	AMZ_900_Thora;
	condition	 = 	AMZ_900_Thora_SQUARE_Condition;
	information	 = 	AMZ_900_Thora_SQUARE_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};

func int AMZ_900_Thora_SQUARE_Condition ()
{
	if	Npc_KnowsInfo(hero, AMZ_900_Thora_OUTERGATE)
	&&	(Npc_GetDistToWP(self, TOBF_SQUARE) < 500)
	{
		return TRUE;
	};
};

func void AMZ_900_Thora_SQUARE_Info ()
{
//	AI_Output			(self, hero, "AMZ_900_SQUARE_16_01"); //Hier sind wir. Weiter kann ich dich nicht bringen, ab jetzt bist du auf dich allein gestellt.
	AI_Output			(self, hero, "AMZ_900_SQUARE_16_01"); //A jsme tu. Dále už tě dostat nemohu, od teď jsi odkázán sám na sebe.
//	AI_Output			(self, hero, "AMZ_900_SQUARE_16_02"); //Ich bin unten bei Garwog, meinen Bericht erstatten. du kannst mich dort finden, wenn du mich brauchst.
	AI_Output			(self, hero, "AMZ_900_SQUARE_16_02"); //Budu dole u Garwoga, abych mu podala hlášení. Kdybys mě potřeboval, tak mě tam najdeš.

	B_LeavePC			(self, "ReportToGarwog");
	B_ExchangeRoutine	(PAL_1003_Garwog, "ReportFromThora");
};




























































































































