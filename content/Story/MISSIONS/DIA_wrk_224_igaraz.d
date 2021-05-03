
instance WRK_224_IGARAZ_EXIT(C_Info)
{
	npc = wrk_224_igaraz;
	nr = 999;
	condition = wrk_224_igaraz_exit_condition;
	information = wrk_224_igaraz_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int wrk_224_igaraz_exit_condition()
{
	return TRUE;
};

func void wrk_224_igaraz_exit_info()
{
	AI_StopProcessInfos(self);
};


instance WRK_224_IGARAZ_NEW(C_Info)
{
	npc = wrk_224_igaraz;
	nr = 12;
	condition = wrk_224_igaraz_new_condition;
	information = wrk_224_igaraz_new_info;
	important = TRUE;
	permanent = FALSE;
};


func int wrk_224_igaraz_new_condition()
{
	if(c_npcisinvincible(hero))
	{
		return TRUE;
	};
};

func void wrk_224_igaraz_new_info()
{
	AI_Output(self,hero,"Wrk_224_NEW_02_01");	//Hey, du bist neu hier, nicht wahr? Mein Name ist Igaraz.
	AI_Output(self,hero,"Wrk_224_NEW_02_02");	//Wenn du irgendwas über das Lager wissen willst, dann bist du bei mir genau richtig.
	AI_Output(self,hero,"Wrk_224_NEW_02_03");	//Ich bin schon ziemlich lange hier drin und kenne jeden Winkel und jede Ecke des Lagers.
};


instance WRK_224_IGARAZ_VISITE(C_Info)
{
	npc = wrk_224_igaraz;
	nr = 13;
	condition = wrk_224_igaraz_visite_condition;
	information = wrk_224_igaraz_visite_info;
	important = FALSE;
	permanent = FALSE;
	description = "Dann zeig mir mal das Lager";
};


func int wrk_224_igaraz_visite_condition()
{
	if(Npc_KnowsInfo(hero,wrk_224_igaraz_new) && (KNOWS_IGARAZ == FALSE))
	{
		return TRUE;
	};
};

func void wrk_224_igaraz_visite_info()
{
	AI_Output(hero,self,"Wrk_224_VISITE_15_01");	//Dann zeig mir mal das Lager.
	AI_Output(self,hero,"Wrk_224_VISITE_02_02");	//Das kostet dich allerdings 'ne Kleinigkeit... 20 Silberstücke.
	AI_Output(self,hero,"Wrk_224_VISITE_02_03");	//Sag mir Bescheid, wenn du bereit bist.
};


instance WRK_224_IGARAZ_PAY(C_Info)
{
	npc = wrk_224_igaraz;
	nr = 14;
	condition = wrk_224_igaraz_pay_condition;
	information = wrk_224_igaraz_pay_info;
	important = FALSE;
	permanent = FALSE;
	description = "(20 Silber geben)";
};


func int wrk_224_igaraz_pay_condition()
{
	if(Npc_KnowsInfo(hero,wrk_224_igaraz_visite) && (Npc_HasItems(hero,itmi_silver) >= NAME_IGARAZSILVER))
	{
		return TRUE;
	};
};

func void wrk_224_igaraz_pay_info()
{
	AI_Output(hero,self,"Wrk_224_PAY_15_01");	//Okay, hier ist das Silber
	B_GiveInvItems(hero,self,itmi_silver,NAME_IGARAZSILVER);
	AI_Output(self,hero,"Wrk_224_PAY_02_02");	//Ausgezeichnet. Ich stehe dir jederzeit zur Verfügung. Sag mir einfach Bescheid.
};


instance WRK_224_IGARAZ_DIEGO(C_Info)
{
	npc = wrk_224_igaraz;
	condition = wrk_224_igaraz_diego_condition;
	information = wrk_224_igaraz_diego_info;
	important = FALSE;
	permanent = FALSE;
	description = "Diego schickt mich,...";
};


func int wrk_224_igaraz_diego_condition()
{
	if(KNOWS_IGARAZ == TRUE)
	{
		return TRUE;
	};
};

func void wrk_224_igaraz_diego_info()
{
	AI_Output(hero,self,"Wrk_224_DIEGO_15_01");	//Diego schickt mich , du kannst mir das Lager zeigen?
	AI_Output(self,hero,"Wrk_224_DIEGO_02_02");	//Oh, du bist ein Freund von Diego! Diegos Freunde sind auch meine Freunde.
	AI_Output(self,hero,"Wrk_224_DIEGO_02_03");	//Und es gibt einen besonderen Grund, warum er dich zu mir geschickt hat...
	AI_Output(hero,self,"Wrk_224_DIEGO_15_04");	//Weil du nichts anderes zu tun hast?
	AI_Output(self,hero,"Wrk_224_DIEGO_02_05");	//Nein, weil es keinen Besseren als mich gibt.
	AI_Output(self,hero,"Wrk_224_DIEGO_02_06");	//Ich stehe dir jederzeit zur Verfügung. Sag mir einfach Bescheid.
};


instance WRK_224_IGARAZ_GUIDE(C_Info)
{
	npc = wrk_224_igaraz;
	nr = 20;
	condition = wrk_224_igaraz_guide_condition;
	information = wrk_224_igaraz_guide_info;
	important = FALSE;
	permanent = TRUE;
	description = "Bring mich zu...";
};


func int wrk_224_igaraz_guide_condition()
{
	if(Npc_KnowsInfo(hero,wrk_224_igaraz_diego) || Npc_KnowsInfo(hero,wrk_224_igaraz_pay))
	{
		return TRUE;
	};
};

func void wrk_224_igaraz_guide_info()
{
	AI_Output(hero,self,"Wrk_224_GUIDE_15_01");	//Bring mich zu...
	Info_AddChoice(wrk_224_igaraz_guide,DIALOG_BACK,wrk_224_igaraz_guide_back);
	Info_AddChoice(wrk_224_igaraz_guide,"...der Arena",wrk_224_igaraz_guide_arena);
	Info_AddChoice(wrk_224_igaraz_guide,"...den Händlern",wrk_224_igaraz_guide_trade);
	Info_AddChoice(wrk_224_igaraz_guide,"...den Heilern",wrk_224_igaraz_guide_heal);
	Info_AddChoice(wrk_224_igaraz_guide,"...den Arbeitern",wrk_224_igaraz_guide_worker);
};

func void wrk_224_igaraz_guide_back()
{
	Info_ClearChoices(wrk_224_igaraz_guide);
};

func void wrk_224_igaraz_guide_worker()
{
	AI_Output(hero,self,"Wrk_224_GUIDE_WORKER_15_01");	//...den Arbeitern.
	AI_Output(self,hero,"Wrk_224_GUIDE_WORKER_02_02");	//Es ist mir ein Vergnügen.
	GUIDEPC_DESTINATION = "OCR_OUTSIDE_HUT_77_MOVEMENT";
	Npc_ExchangeRoutine(self,"GUIDEWORKER");
	AI_StopProcessInfos(self);
};

func void wrk_224_igaraz_guide_heal()
{
	AI_Output(hero,self,"Wrk_224_GUIDE_HEAL_15_01");	//...den Heilern.
	AI_Output(self,hero,"Wrk_224_GUIDE_HEAL_02_02");	//Natürlich, sehr gerne.
	GUIDEPC_DESTINATION = "OCR_GHETTO_13";
	Npc_ExchangeRoutine(self,"GUIDEHEALER");
	AI_StopProcessInfos(self);
};

func void wrk_224_igaraz_guide_trade()
{
	AI_Output(hero,self,"Wrk_224_GUIDE_TRADE_15_01");	//...den Händlern.
	AI_Output(self,hero,"Wrk_224_GUIDE_TRADE_02_02");	//Eine meiner leichtesten Übungen.
	GUIDEPC_DESTINATION = "OCR_WASH_8";
	Npc_ExchangeRoutine(self,"GUIDETRADER");
	AI_StopProcessInfos(self);
};

func void wrk_224_igaraz_guide_arena()
{
	AI_Output(hero,self,"Wrk_224_GUIDE_ARENA_15_01");	//...der Arena.
	AI_Output(self,hero,"Wrk_224_GUIDE_ARENA_02_02");	//Wenn's weiter nichts ist.
	GUIDEPC_DESTINATION = "OCR_OUTSIDE_ARENA_01";
	Npc_ExchangeRoutine(self,"GUIDEARENA");
	AI_StopProcessInfos(self);
};


instance WRK_224_IGARAZ_HEALER(C_Info)
{
	npc = wrk_224_igaraz;
	condition = wrk_224_igaraz_healer_condition;
	information = wrk_224_igaraz_healer_info;
	important = TRUE;
	permanent = FALSE;
};


func int wrk_224_igaraz_healer_condition()
{
	if((Npc_GetDistToWP(self,"OCR_GHETTO_13") <= 300) && Npc_IsInRoutine(self,ZS_GuidePC))
	{
		return TRUE;
	};
};

func void wrk_224_igaraz_healer_info()
{
	AI_Output(self,hero,"Wrk_224_HEALER_02_01");	//Hier ist das Viertel der Kranken. Niemand weiß was ihnen fehlt.
	AI_Output(self,hero,"Wrk_224_HEALER_02_02");	//Sie leiden alle an einer seltenen Krankheit. Sogar Die Heiler sind ratlos.
	AI_Output(self,hero,"Wrk_224_HEALER_02_03");	//Ich gehe zurück zum Haupteingang.
	Npc_ExchangeRoutine(self,"PRESTART");
	AI_StopProcessInfos(self);
};


instance WRK_224_IGARAZ_WORKER(C_Info)
{
	npc = wrk_224_igaraz;
	condition = wrk_224_igaraz_worker_condition;
	information = wrk_224_igaraz_worker_info;
	important = TRUE;
	permanent = FALSE;
};


func int wrk_224_igaraz_worker_condition()
{
	if((Npc_GetDistToWP(self,"OCR_OUTSIDE_HUT_77_MOVEMENT") <= 300) && Npc_IsInRoutine(self,ZS_GuidePC))
	{
		return TRUE;
	};
};

func void wrk_224_igaraz_worker_info()
{
	AI_Output(self,hero,"Wrk_224_WORKER_02_01");	//Hier sind die Arbeiter beschäftigt.
	AI_Output(self,hero,"Wrk_224_WORKER_02_02");	//Sie glauben, das sie es schaffen können, das Lager gegen die Orks zu verteidigen.
	AI_Output(self,hero,"Wrk_224_WORKER_02_03");	//Der Baumeister ist Bormor, ein unglaublich brutaler Kerl, halte dich besser fern von ihm...
	AI_Output(self,hero,"Wrk_224_WORKER_02_04");	//Wenn du mich wieder brauchst, ich bin am Haupteingang.
	Npc_ExchangeRoutine(self,"PRESTART");
	AI_StopProcessInfos(self);
};


instance WRK_224_IGARAZ_ARENA(C_Info)
{
	npc = wrk_224_igaraz;
	condition = wrk_224_igaraz_arena_condition;
	information = wrk_224_igaraz_arena_info;
	important = TRUE;
	permanent = FALSE;
};


func int wrk_224_igaraz_arena_condition()
{
	if((Npc_GetDistToWP(self,"OCR_OUTSIDE_ARENA_01") <= 300) && Npc_IsInRoutine(self,ZS_GuidePC))
	{
		return TRUE;
	};
};

func void wrk_224_igaraz_arena_info()
{
	AI_Output(self,hero,"Wrk_224_ARENA_02_01");	//Die Arena ist der einzige Ort wo man ein wenig Abwechslung finden kann.
	AI_Output(self,hero,"Wrk_224_ARENA_02_02");	//Hier gibt es allabendlich gute  Kämpfe  zu sehen.
	AI_Output(self,hero,"Wrk_224_ARENA_02_03");	//Der beste Arenakämpfer ist übrigens eine fremde Schönheit namens Thora.
	AI_Output(self,hero,"Wrk_224_ARENA_02_04");	//Die Frau haut alle anderen Gladiatoren aus den Latschen (hihi)
	AI_Output(self,hero,"Wrk_224_ARENA_02_05");	//Wenn du mich wieder brauchst, ich bin am Haupteingang.
	Npc_ExchangeRoutine(self,"PRESTART");
	AI_StopProcessInfos(self);
};


instance WRK_224_IGARAZ_TRADER(C_Info)
{
	npc = wrk_224_igaraz;
	condition = wrk_224_igaraz_trader_condition;
	information = wrk_224_igaraz_trader_info;
	important = TRUE;
	permanent = FALSE;
};


func int wrk_224_igaraz_trader_condition()
{
	if((Npc_GetDistToWP(self,"OCR_WASH_8") <= 300) && Npc_IsInRoutine(self,ZS_GuidePC))
	{
		return TRUE;
	};
};

func void wrk_224_igaraz_trader_info()
{
	AI_Output(self,hero,"Wrk_224_TRADER_02_01");	//Hier sind wir bei den Händlern. Alle Händler arbeiten für Agon.
	AI_Output(self,hero,"Wrk_224_TRADER_02_02");	//Ruga, der Rüstungsmacher, Gordian der Schreiber, Helvegor der Rüstungsmacher, sie alle beziehen ihre Waren von Agon.
	AI_Output(self,hero,"Wrk_224_TRADER_02_03");	//Und dafür zahlen sie hohe Preise.
	AI_Output(self,hero,"Wrk_224_TRADER_02_04");	//Wenn du mich wieder brauchst, ich bin am Haupteingang.
	Npc_ExchangeRoutine(self,"PRESTART");
	AI_StopProcessInfos(self);
};


instance WRK_224_IGARAZ_CASTLE(C_Info)
{
	npc = wrk_224_igaraz;
	nr = 33;
	condition = wrk_224_igaraz_castle_condition;
	information = wrk_224_igaraz_castle_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was gibt's in der Burg? ";
};


func int wrk_224_igaraz_castle_condition()
{
	if(Npc_KnowsInfo(hero,wrk_224_igaraz_diego) || Npc_KnowsInfo(hero,wrk_224_igaraz_pay))
	{
		return TRUE;
	};
};

func void wrk_224_igaraz_castle_info()
{
	AI_Output(hero,self,"Wrk_224_CASTLE_15_01");	//Was gibt's in der Burg?
	AI_Output(self,hero,"Wrk_224_CASTLE_02_02");	//Zum einen das Haus der Erzbarone.
	AI_Output(self,hero,"Wrk_224_CASTLE_02_03");	//Als hier noch eine Kolonie der Gefangenen war, saßen dort die Männer die den Erzabbau und das Lager kontrollierten.
	AI_Output(self,hero,"Wrk_224_CASTLE_02_04");	//Jetzt hat sich Diego dort niedergelassen.
	AI_Output(self,hero,"Wrk_224_CASTLE_02_05");	//Ansonsten hat sich die Miliz in der Burg breitgemacht. Sie schlafen dort, haben eine eigene Schmiede und Küche.
	AI_Output(self,hero,"Wrk_224_CASTLE_02_06");	//Und dann gibt es noch das Haus der Magier. Die Magier sind alle dort gestorben . Und ich kenne die Wahrheit darüber...
};


instance WRK_224_IGARAZ_MAGE(C_Info)
{
	npc = wrk_224_igaraz;
	nr = 34;
	condition = wrk_224_igaraz_mage_condition;
	information = wrk_224_igaraz_mage_info;
	important = FALSE;
	permanent = FALSE;
	description = "Erzähl mir über die Feuermagier";
};


func int wrk_224_igaraz_mage_condition()
{
	if(Npc_KnowsInfo(hero,wrk_224_igaraz_castle))
	{
		return TRUE;
	};
};

func void wrk_224_igaraz_mage_info()
{
	AI_Output(hero,self,"Wrk_224_MAGE_15_01");	//Erzähl mir über die Feuermagier.
	AI_Output(self,hero,"Wrk_224_MAGE_02_02");	//Die Feuermagier haben einst eine magische Barriere um das gesamte Tal errichtet, damit die Minenarbeiter nicht fliehen konnten.
	AI_Output(self,hero,"Wrk_224_MAGE_02_03");	//Sie unterstanden Gomez, dem stärksten Kämpfer und mächtigsten Mann innerhalb der Barriere.
	AI_Output(self,hero,"Wrk_224_MAGE_02_04");	//Gomez forschte nach einem Weg, die Barriere zu sprengen, denn er wollte seine Freiheit zurück.
	AI_Output(self,hero,"Wrk_224_MAGE_02_05");	//Aber die Feuermagier waren dagegen. Deshalb erließ Gomez den Befehl, sie alle... umzubringen.
	AI_Output(self,hero,"Wrk_224_MAGE_02_06");	//Seine Handlanger warteten also bis die Magier schliefen und erschlugen sie.
	AI_Output(self,hero,"Wrk_224_MAGE_02_07");	//Schließlich wurde die Barriere gesprengt, doch an diesem Tag sind alle, die an der Ermordung der Magier beteiligt waren, gestorben.
	AI_Output(self,hero,"Wrk_224_MAGE_02_08");	//Nur Gomez selber, wurde seit diesem Tag nie wieder gesehen.
};

