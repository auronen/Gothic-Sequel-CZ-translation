// 			EXIT

instance  PC_Thief_Exit (C_INFO)
{
	npc			=  PC_Thief;
	nr			=  999;
	condition	=  PC_Thief_Exit_Condition;
	information	=  PC_Thief_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};

FUNC int  PC_Thief_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  PC_Thief_Exit_Info()
{
	AI_StopProcessInfos		(self);
};









//#####################################################################
//##
//##
//##					KAPITEL 1 (Begrüssung)
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance PC_Thief_WELCOME		(C_INFO)
{
	npc		 = 	PC_Thief;
	nr		 = 	1;
	condition	 = 	PC_Thief_WELCOME_Condition;
	information	 = 	PC_Thief_WELCOME_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
	//description  = "(Startsatz)";
};

func int PC_Thief_WELCOME_Condition ()
{
	if	(chapter == 1)
	{
		return TRUE;
	};
};

func void PC_Thief_WELCOME_Info ()
{
//	AI_Output			(self, hero, "PC_Thief_WELCOME_11_01"); //Hey, bist du es wirklich!? Ich dachte du wärst tot!
	AI_Output			(self, hero, "PC_Thief_WELCOME_11_01"); //Hej! Jsi to opravdu ty!? Já myslel, že jsi mrtvý!
//	AI_Output			(hero, self, "PC_Thief_WELCOME_15_02"); //Ja, wäre ich auch beinahe gewesen. Als der Tempel einstürzte, wurde ich unter den Steinen begraben.
	AI_Output			(hero, self, "PC_Thief_WELCOME_15_02"); //Však jsem také málem byl. Jak se chrám zhroutil, zůstal jsem zavalený pod kamením.
//	AI_Output			(hero, self, "PC_Thief_WELCOME_15_03"); //Aber Xardas hat mich rausgeholt.
	AI_Output			(hero, self, "PC_Thief_WELCOME_15_03"); //Ale Xardas mě vynesl ven.
//	AI_Output			(self, hero, "PC_Thief_WELCOME_11_04"); //Der Dämonenbeschwörer also. Immerhin war er es auch, der dich in die Sache reingezogen hat.
	AI_Output			(self, hero, "PC_Thief_WELCOME_11_04"); //Tak nekromant tedy. Konec konců, byl to vlastně on, který tě do celé té věci zatáhl.
//	AI_Output			(self, hero, "PC_Thief_WELCOME_11_05"); //Falls du vorhast abzuhauen, das solltest du schnell wieder vergessen. Aus diesem Tal kommt niemand mehr raus. Die Orks haben uns umzingelt.
//	AI_Output			(self, hero, "PC_Thief_WELCOME_11_05"); //Pokud plánuješ z údolí utéct, tak bys na to měl rychle zapomenout. Z údolí se nikdo nemůže dostat. Střeti nás obklíčili.

	B_SetAttitude		(self,	ATT_FRIENDLY);

	subChapter			= CH1_BEFORE_DIEGO;
};

///////////////////////////////////////////////////////////////////////
//	Info FLEE
///////////////////////////////////////////////////////////////////////
instance PC_Thief_FLEE		(C_INFO)
{
	npc		 	 = 	PC_Thief;
	nr		 	 = 	3;
	condition	 = 	PC_Thief_FLEE_Condition;
	information	 = 	PC_Thief_FLEE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Warum bist du nicht geflohen nachdem die Barriere gefallen ist?";
	description	 = 	"Proč jsi neutekl po té, co se Bariéra zhroutila?";
};

func int PC_Thief_FLEE_Condition ()
{
	if	Npc_KnowsInfo (hero, PC_Thief_WELCOME)
	&&	(chapter == 1)
	{
		return TRUE;
	};
};
func void PC_Thief_FLEE_Info ()
{
//	AI_Output			(hero, self, "PC_Thief_FLEE_15_01"); //Warum bist du nicht geflohen nachdem die Barriere gefallen ist?
	AI_Output			(hero, self, "PC_Thief_FLEE_15_01"); //Proč jsi neutekl po té, co se Bariéra zhroutila?
//	AI_Output			(self, hero, "PC_Thief_FLEE_11_02"); //Weil ich nachgedacht habe.
	AI_Output			(self, hero, "PC_Thief_FLEE_11_02"); //Protože jsem přemýšlel.
//	AI_Output			(self, hero, "PC_Thief_FLEE_11_03"); //Ohne das magische Erz bekommt der König keine Waffen mehr. Und ohne Waffen ...
	AI_Output			(self, hero, "PC_Thief_FLEE_11_03"); //Bez magické rudy se králi nedostane dalších zbraní. A beze zbraní...
//	AI_Output			(hero, self, "PC_Thief_FLEE_15_04"); //...kann er den Krieg gegen die Orcs nicht gewinnen.
	AI_Output			(hero, self, "PC_Thief_FLEE_15_04"); //...nemůže vyhrát válku proti skřetům.
//	AI_Output			(self, hero, "PC_Thief_FLEE_11_05"); //Du sagst es. Die Orks ziehen seitdem plündernd durchs Königreich.
	AI_Output			(self, hero, "PC_Thief_FLEE_11_05"); //Jak říkáš. Skřeti od pádu táhnou královstvím a pludnrují jej.
//	AI_Output			(self, hero, "PC_Thief_FLEE_11_06"); //Die Minenkolonie haben sie komplett umstellt.
	AI_Output			(self, hero, "PC_Thief_FLEE_11_06"); //Trestaneckou kolonii dočista obklopili.
};

///////////////////////////////////////////////////////////////////////
//	Info QUESTION
///////////////////////////////////////////////////////////////////////
instance PC_Thief_QUESTION		(C_INFO)
{
	npc		 	 = 	PC_Thief;
	nr		 	 = 	20;
	condition	 = 	PC_Thief_QUESTION_Condition;
	information	 = 	PC_Thief_QUESTION_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Ich habe einige Fragen...";
	description	 = 	"Měl bych pár otázek...";
};

func int PC_Thief_QUESTION_Condition ()
{
	if	Npc_KnowsInfo	(hero,PC_Thief_WELCOME)
	&&	(Npc_GetDistToWP(self,DIEGO_WP_THRONE) < 500)
	&&	(chapter == 1)
	{
		return TRUE;
	};
};
func void PC_Thief_QUESTION_Info ()
{
//	AI_Output			(hero, self, "PC_Thief_QUESTION_15_01"); //Ich habe einige Fragen...
	AI_Output			(hero, self, "PC_Thief_QUESTION_15_01"); //Měl bych pár otázek...
//	AI_Output			(self, hero, "PC_Thief_QUESTION_11_02"); //Lass hören.
	AI_Output			(self, hero, "PC_Thief_QUESTION_11_02"); //Poslouchám.

		Info_ClearChoices 	(PC_Thief_QUESTION);

	Info_AddChoice		(PC_Thief_QUESTION, DIALOG_BACK, PC_Thief_QUESTION_BACK );
//	Info_AddChoice		(PC_Thief_QUESTION, "Was gibt's Neues?", PC_Thief_QUESTION_NEWS );
	Info_AddChoice		(PC_Thief_QUESTION, "Co je nového?", PC_Thief_QUESTION_NEWS );
//	Info_AddChoice		(PC_Thief_QUESTION, "Wie sieht's im Lager aus?", PC_Thief_QUESTION_CAMP );
	Info_AddChoice		(PC_Thief_QUESTION, "Jak to vypadá v táboře?", PC_Thief_QUESTION_CAMP );

	if	Diego_Answer
	{
//		Info_AddChoice  (PC_Thief_QUESTION, "Ich brauche einen Überblick über das Lager.", PC_Thief_QUESTION_LOOKAROUND );
		Info_AddChoice  (PC_Thief_QUESTION, "Potřeboval bych se seznámit s táborem.", PC_Thief_QUESTION_LOOKAROUND );
//		Info_AddChoice  (PC_Thief_QUESTION, "Was sind die Regeln?", PC_Thief_QUESTION_RULES );
		Info_AddChoice  (PC_Thief_QUESTION, "Jaká jsou pravidla?", PC_Thief_QUESTION_RULES );
	};

};
FUNC VOID PC_Thief_QUESTION_BACK()
{
		Info_ClearChoices 	(PC_Thief_QUESTION);
};
func void PC_Thief_QUESTION_CAMP ()
{
	Info_ClearChoices 	(PC_Thief_QUESTION);

//	AI_Output			(hero, self, "PC_Thief_QUESTION_CAMP_15_01"); //Wie sieht's im Lager aus?
	AI_Output			(hero, self, "PC_Thief_QUESTION_CAMP_15_01"); //Jak to vypadá v táboře?
//	AI_Output			(self, hero, "PC_Thief_QUESTION_CAMP_11_02"); //Ein paar Gefangene sind hiergeblieben, so wie ich. Und es sind auch jede Menge neue Leute angekommen.
	AI_Output			(self, hero, "PC_Thief_QUESTION_CAMP_11_02"); //Několik trestanců tu zůstalo, zrovna jako já. A také sem přišlo pár nových lidí.
//	AI_Output			(self, hero, "PC_Thief_QUESTION_CAMP_11_03"); //Flüchtlinge vor den Orcs, Arbeiter, Herumtreiber, Händler...
	AI_Output			(self, hero, "PC_Thief_QUESTION_CAMP_11_03"); //Uprchlíci od skřetů, dělníci, tuláci, obchodníci...
//	AI_Output			(self, hero, "PC_Thief_QUESTION_CAMP_11_04"); //Seitdem bin ich so'ne Art Führungskraft.
	AI_Output			(self, hero, "PC_Thief_QUESTION_CAMP_11_04"); //Od té doby jsem tu taková vedoucí síla.
// 	AI_Output			(self, hero, "PC_Thief_QUESTION_CAMP_11_05"); //Ich habe eine Miliz auf die Beine gestellt. Die kümmert sich darum, daß die Regeln eingehalten werden.
 	AI_Output			(self, hero, "PC_Thief_QUESTION_CAMP_11_05"); //Domobranu jsem tu postavil na nohy. Ta se nyní stará, aby byla dodržována pravidla.


	Diego_Answer = TRUE;

	Info_AddChoice		(PC_Thief_QUESTION, DIALOG_BACK, PC_Thief_QUESTION_BACK );
//	Info_AddChoice		(PC_Thief_QUESTION, "Was gibt's Neues?", PC_Thief_QUESTION_NEWS );
	Info_AddChoice		(PC_Thief_QUESTION, "Co je nového?", PC_Thief_QUESTION_NEWS );
//	Info_AddChoice		(PC_Thief_QUESTION, "Wie sieht's im Lager aus?", PC_Thief_QUESTION_CAMP );
	Info_AddChoice		(PC_Thief_QUESTION, "Jak to vypadá v táboře?", PC_Thief_QUESTION_CAMP );

	if	Diego_Answer
	{
//		Info_AddChoice  (PC_Thief_QUESTION, "Ich brauche einen Überblick über das Lager.", PC_Thief_QUESTION_LOOKAROUND );
		Info_AddChoice  (PC_Thief_QUESTION, "Potřeboval bych se seznámit s táborem.", PC_Thief_QUESTION_LOOKAROUND );
//		Info_AddChoice  (PC_Thief_QUESTION, "Was sind die Regeln hier im Lager?", PC_Thief_QUESTION_RULES );
		Info_AddChoice  (PC_Thief_QUESTION, "Jaká jsou zde v táboře pravidla?", PC_Thief_QUESTION_RULES );
	};
};

func void PC_Thief_QUESTION_NEWS ()
{
	Info_ClearChoices 	(PC_Thief_QUESTION);

//	AI_Output			(hero, self, "PC_Thief_QUESTION_NEWS_15_01"); //Was gibt's Neues?
	AI_Output			(hero, self, "PC_Thief_QUESTION_NEWS_15_01"); //Co je nového?
//	AI_Output			(self, hero, "PC_Thief_QUESTION_NEWS_11_02"); //Nach dem Zusammenbruch der Barriere, bevor die Orcs alles abgeriegelt hatten, ist der König ins Tal gekommen.
	AI_Output			(self, hero, "PC_Thief_QUESTION_NEWS_11_02"); //Po rozbití Bariéry, než tady vše skřeti obklíčili, dorazil do údolí král.
//	AI_Output			(self, hero, "PC_Thief_QUESTION_NEWS_11_03"); //Zusammen mit seinen Paladinen und Magiern hat er sich in der Felsenfestung eingenistet.
	AI_Output			(self, hero, "PC_Thief_QUESTION_NEWS_11_03"); //Společně se svými paladiny a mágy se usadil v Horské pevnosti.
//	AI_Output			(hero, self, "PC_Thief_QUESTION_NEWS_15_04"); //Was will Er hier?
	AI_Output			(hero, self, "PC_Thief_QUESTION_NEWS_15_04"); //Co tu chce?
//	AI_Output			(self, hero, "PC_Thief_QUESTION_NEWS_11_05"); //Keine Ahnung was er vorhat. Aber dieses Lager will er nicht. In seinen Augen sind wir hier Futter für die Orks.
	AI_Output			(self, hero, "PC_Thief_QUESTION_NEWS_11_05"); //Nemám tušení, co plánuje. Ale tenhle tábor nechce. V jeho očích jsme tu jen potrava pro skřety.

	Info_AddChoice		(PC_Thief_QUESTION, DIALOG_BACK, PC_Thief_QUESTION_BACK );
//	Info_AddChoice		(PC_Thief_QUESTION, "Was gibt's Neues?", PC_Thief_QUESTION_NEWS );
	Info_AddChoice		(PC_Thief_QUESTION, "Co je nového?", PC_Thief_QUESTION_NEWS );
//	Info_AddChoice		(PC_Thief_QUESTION, "Wie sieht's im Lager aus?", PC_Thief_QUESTION_CAMP );
	Info_AddChoice		(PC_Thief_QUESTION, "Jak to vypadá v táboře?", PC_Thief_QUESTION_CAMP );

	if	Diego_Answer
	{
//		Info_AddChoice  (PC_Thief_QUESTION, "Ich brauche einen Überblick über das Lager.", PC_Thief_QUESTION_LOOKAROUND );
		Info_AddChoice  (PC_Thief_QUESTION, "Potřeboval bych se seznámit s táborem.", PC_Thief_QUESTION_LOOKAROUND );
//		Info_AddChoice  (PC_Thief_QUESTION, "Was sind die Regeln hier im Lager?", PC_Thief_QUESTION_RULES );
		Info_AddChoice  (PC_Thief_QUESTION, "Jaká jsou zde v táboře pravidla?", PC_Thief_QUESTION_RULES );
	};

};

FUNC VOID PC_Thief_QUESTION_LOOKAROUND()
{
	Info_ClearChoices 	(PC_Thief_QUESTION);

//	AI_Output			(hero, self, "PC_Thief_QUESTION_LOOKAROUND_15_01"); //Ich brauche einen Überblick über das Lager.
	AI_Output			(hero, self, "PC_Thief_QUESTION_LOOKAROUND_15_01"); //Potřeboval bych se seznámit s táborem.
//	AI_Output			(self, hero, "PC_Thief_QUESTION_LOOKAROUND_11_02"); //Igaraz kann dir alles zeigen. Der hat sowieso den ganzen Tag nichts zu tun.
	AI_Output			(self, hero, "PC_Thief_QUESTION_LOOKAROUND_11_02"); //Igaraz ti tu může vše ukázat. Beztak nemá celý den co na práci.
//	AI_Output			(self, hero, "PC_Thief_QUESTION_LOOKAROUND_11_03"); //Meistens treibt er sich am Eingang des Lagers herum.
	AI_Output			(self, hero, "PC_Thief_QUESTION_LOOKAROUND_11_03"); //Většinou bloumá někde u vstupu do tábora.

	Knows_Igaraz = TRUE;

	Info_AddChoice		(PC_Thief_QUESTION, DIALOG_BACK, PC_Thief_QUESTION_BACK );
//	Info_AddChoice		(PC_Thief_QUESTION, "Was gibt's Neues?", PC_Thief_QUESTION_NEWS );
	Info_AddChoice		(PC_Thief_QUESTION, "Co je nového?", PC_Thief_QUESTION_NEWS );
//	Info_AddChoice		(PC_Thief_QUESTION, "Wie sieht's im Lager aus?", PC_Thief_QUESTION_CAMP );
	Info_AddChoice		(PC_Thief_QUESTION, "Jak to vypadá v táboře?", PC_Thief_QUESTION_CAMP );

	if	Diego_Answer
	{
//		Info_AddChoice  (PC_Thief_QUESTION, "Ich brauche einen Überblick über das Lager.", PC_Thief_QUESTION_LOOKAROUND );
		Info_AddChoice  (PC_Thief_QUESTION, "Potřeboval bych se seznámit s táborem.", PC_Thief_QUESTION_LOOKAROUND );
//		Info_AddChoice  (PC_Thief_QUESTION, "Was sind die Regeln hier im Lager?", PC_Thief_QUESTION_RULES );
		Info_AddChoice  (PC_Thief_QUESTION, "Jaká jsou zde v táboře pravidla?", PC_Thief_QUESTION_RULES );
	};
};

FUNC VOID PC_Thief_QUESTION_RULES()
{
	Info_ClearChoices 	(PC_Thief_QUESTION);

//	AI_Output			(hero, self, "PC_Thief_QUESTION_RULES_15_01"); //Was sind die Regeln hier im Lager?
	AI_Output			(hero, self, "PC_Thief_QUESTION_RULES_15_01"); //Jaká jsou zde v táboře pravidla?
//	AI_Output			(self, hero, "PC_Thief_QUESTION_RULES_11_02"); //Die Miliz achtet darauf, daß hier alles ruhig bleibt. Keine Kämpfe, kein Faustrecht! Wir brauchen jeden Mann!
	AI_Output			(self, hero, "PC_Thief_QUESTION_RULES_11_02"); //Domobrana dává pozor na to, aby se tu udržoval pořádek. Žádné souboje, žádné pěstní právo! Potřebujeme každého muže!
//	AI_Output			(self, hero, "PC_Thief_QUESTION_RULES_11_03"); //Wird jemand beim Klauen oder Morden erwischt, wird er bestraft.
	AI_Output			(self, hero, "PC_Thief_QUESTION_RULES_11_03"); //Pokud bude někdo přistižen při krádeži nebo chycen při vraždě, bude potrestán.
//	AI_Output			(self, hero, "PC_Thief_QUESTION_RULES_11_04"); //Die Zeiten, als ich mir selbst noch die Taschen gefüllt habe, sind vorbei! Jetzt geht es um andere Dinge!
	AI_Output			(self, hero, "PC_Thief_QUESTION_RULES_11_04"); //Časy, kdy jsem se staral jen o naplnění vlastní kapsy, jsou už pryč! Teď jde o jiné věci!

	Info_AddChoice		(PC_Thief_QUESTION, DIALOG_BACK, PC_Thief_QUESTION_BACK );
//	Info_AddChoice		(PC_Thief_QUESTION, "Was gibt's Neues?", PC_Thief_QUESTION_NEWS );
//	Info_AddChoice		(PC_Thief_QUESTION, "Wie sieht's im Lager aus?", PC_Thief_QUESTION_CAMP );
	Info_AddChoice		(PC_Thief_QUESTION, "Co je nového?", PC_Thief_QUESTION_NEWS );
	Info_AddChoice		(PC_Thief_QUESTION, "Jak to vypadá v táboře?", PC_Thief_QUESTION_CAMP );

	if	Diego_Answer
	{
//		Info_AddChoice  (PC_Thief_QUESTION, "Ich brauche einen Überblick über das Lager.", PC_Thief_QUESTION_LOOKAROUND );
		Info_AddChoice  (PC_Thief_QUESTION, "Potřeboval bych se seznámit s táborem.", PC_Thief_QUESTION_LOOKAROUND );
//		Info_AddChoice  (PC_Thief_QUESTION, "Was sind die Regeln hier im Lager?", PC_Thief_QUESTION_RULES );
		Info_AddChoice  (PC_Thief_QUESTION, "Jaká jsou zde v táboře pravidla?", PC_Thief_QUESTION_RULES );
	};
};

//////////////////////////////////////////////////////////////////////
//	Info ROOM
///////////////////////////////////////////////////////////////////////
instance PC_Thief_ROOM		(C_INFO)
{
	npc		 	 = 	PC_Thief;
	condition	 = 	PC_Thief_ROOM_Condition;
	information	 = 	PC_Thief_ROOM_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Kann ich hier irgendwo pennen?";
	description	 = 	"Mohu tu někde přespat?";
};

func int PC_Thief_ROOM_Condition ()
{
	if	Diego_Answer
	&&	(chapter == 1)
	{
		return TRUE;
	};
};
func void PC_Thief_ROOM_Info ()
{
//	AI_Output			(hero, self, "PC_Thief_ROOM_15_01"); //Kann ich hier irgendwo pennen?
	AI_Output			(hero, self, "PC_Thief_ROOM_15_01"); //Mohu tu někde přespat?
//	AI_Output			(self, hero, "PC_Thief_ROOM_11_02"); //Im Erzbaronhaus ist genug Platz, auch ich wohne jetzt da.
	AI_Output			(self, hero, "PC_Thief_ROOM_11_02"); //V domě rudobaronů je dost místa, bydlím tam i já.
//	AI_Output			(self, hero, "PC_Thief_ROOM_11_03"); //Wie klingt das?
	AI_Output			(self, hero, "PC_Thief_ROOM_11_03"); //Jak to zní?
//	AI_Output			(hero, self, "PC_Thief_ROOM_15_04"); //Klingt verdammt gut.
	AI_Output			(hero, self, "PC_Thief_ROOM_15_04"); //Zatraceně dobře!
//	AI_Output			(self, hero, "PC_Thief_ROOM_11_05"); //Die Miliz beansprucht auch ein paar Räume.
	AI_Output			(self, hero, "PC_Thief_ROOM_11_05"); //Některé místnosti si vyžaduje i domobrana.
//	AI_Output			(self, hero, "PC_Thief_ROOM_11_06"); //Du wirst schon rausfinden, wo du pennen kannst.
	AI_Output			(self, hero, "PC_Thief_ROOM_11_06"); //Sám uvidíš, kde můžeš přespat.
};














//#####################################################################
//##
//##
//##					TRAINING
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info NEEDTRAINING
///////////////////////////////////////////////////////////////////////
instance  PC_Thief_NEEDTRAINING (C_INFO)
{
	npc				= PC_Thief;
	nr				= 5;
	condition		= PC_Thief_NEEDTRAINING_Condition;
	information		= PC_Thief_NEEDTRAINING_Info;
//	description		= "Ich muss meine Fähigkeiten trainieren";
	description		= "Potřebuji trénovat své dovednosti.";
};

FUNC int  PC_Thief_NEEDTRAINING_Condition()
{
	return TRUE;
};

FUNC void  PC_Thief_NEEDTRAINING_Info()
{
	Log_CreateTopic 	(GE_TeacheroC,LOG_NOTE);

//	AI_Output			(other, self,"PC_Thief_NEEDTRAINING_Info_15_01"); //Ich muss meine Fähigkeiten trainieren.
	AI_Output			(other, self,"PC_Thief_NEEDTRAINING_Info_15_01"); //Potřebuji trénovat své dovednosti.
//	AI_Output			(self, other,"PC_Thief_NEEDTRAINING_Info_11_02"); //Ich kann dir helfen, was Geschicklichkeit und Bogenschiessen angeht.
	AI_Output			(self, other,"PC_Thief_NEEDTRAINING_Info_11_02"); //Mohu ti pomoci s tvou obratností a střelbou z luku.
	
//	B_LogEntry			(GE_TeacheroC,"Diego wird mir helfen, meine GESCHICKLICHKEIT und BOGENTALENTE zu trainieren. Ich kann ihn im Erzbaronhaus finden.");
	B_LogEntry			(GE_TeacheroC,"Diego mi pomůže zlepšit moji OBRATNOST a STŘELBU Z LUKU. Najdu ho v domě rudobaronů.");
	
//	AI_Output			(self, other,"PC_Thief_NEEDTRAINING_Info_11_03"); //Magie ist Lesters Spezialität. Er experimentiert im alten Magierhaus in der Burg herum.
	AI_Output			(self, other,"PC_Thief_NEEDTRAINING_Info_11_03"); //Magie je Lesterovat specialita. Provádí pokusy ve starém domě mágů tady na hradě.
	
//	B_LogEntry			(GE_TeacheroC,"Lester wird mir helfen, meine MANA zu verbessern und neue ZAUBERSPRÜCHE zu erlernen. Er ist im alten Magierhaus in der Burg zu finden.");
	B_LogEntry			(GE_TeacheroC,"Lester mi pomůže zvýšit moji MANU a naučí mě nová KOUZLA. Vyskytuje se ve bývalém sídle mágů na hradě.");
	
//	AI_Output			(self, other,"PC_Thief_NEEDTRAINING_Info_11_04"); //Und dann ist da noch Cassian, der Leutnant der Miliz. Er wird dir mit Freuden alle Kampftechniken einprügeln.
	AI_Output			(self, other,"PC_Thief_NEEDTRAINING_Info_11_04"); //A pak je tu ještě Cassian, poručík domobrany. S přáteli tě prověří ve všech technikách boje.
//	AI_Output			(self, other,"PC_Thief_NEEDTRAINING_Info_11_05"); //Tagsüber trainiert er im Burginnenhof die Soldaten der Miliz.
	AI_Output			(self, other,"PC_Thief_NEEDTRAINING_Info_11_05"); //Přes den trénuje na vnitřním nádvoří s vojáky z domobrany.
	
//	B_LogEntry			(GE_TeacheroC,"Cassian wird mir helfen, meine STÄRKE sowie das Kampftalent EINHÄNDER zu trainieren. Er trainiert tagsüber Soldaten im Burginnenhof.");
	B_LogEntry			(GE_TeacheroC,"Cassian mi pomůže zvýšit moji SÍLU a zrovna BOJ S JEDNORUČNÍM MEČEM. Během dne trénuje s vojáky na vnitřním nádvoří.");

//	AI_Output			(self, other,"PC_Thief_NEEDTRAINING_Info_11_06"); //Wie ich sehe, brauchst du auch eine neue Ausrüstung.
	AI_Output			(self, other,"PC_Thief_NEEDTRAINING_Info_11_06"); //Jak tak koukám, potřebuješ taky nové vybavení.
//	AI_Output			(self, other,"PC_Thief_NEEDTRAINING_Info_11_07"); //Nimm erstmal dieses Schwert. Bessere Waffen wirst du schon alleine auftreiben.
	AI_Output			(self, other,"PC_Thief_NEEDTRAINING_Info_11_07"); //Vezmi si pro začátek tento meč. K lepším zbraním se už jistě dostaneš sám.

	B_GiveInvItems		(self,hero,	ItMw_RustySword,1);
	AI_EquipBestMeleeWeapon	(hero);

//	AI_Output			(self, other,"PC_Thief_NEEDTRAINING_Info_11_08"); //Ich geb dir auch etwas Silber. Das ist die neue Währung hier, seit die Barriere weg ist.
	AI_Output			(self, other,"PC_Thief_NEEDTRAINING_Info_11_08"); //Dám ti taky trochu stříbra. To je tu teď nová měna, co se Bariéra zhroutila.
	B_GiveInvItems		(self,hero,	ItMi_Silver,	30);

//	AI_Output			(self, other,"PC_Thief_NEEDTRAINING_Info_11_09"); //Es gibt hier viele Möglichkeiten etwas zu verdienen.
	AI_Output			(self, other,"PC_Thief_NEEDTRAINING_Info_11_09"); //Je tu mnoho příležitostí, jak si něco vydělat.

};

///////////////////////////////////////////////////////////////////////
//	Info WHYBOW
///////////////////////////////////////////////////////////////////////
instance PC_Thief_WHYBOW		(C_INFO)
{
	npc		 	 = 	PC_Thief;
	condition	 = 	PC_Thief_WHYBOW_Condition;
	information	 = 	PC_Thief_WHYBOW_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wofür brauche ich Bogentalent?";
	description	 = 	"K čemu mi je cvičit lukostřelbu?";
};

func int PC_Thief_WHYBOW_Condition ()
{
	if	Npc_KnowsInfo(hero, PC_Thief_NEEDTRAINING)
	{
		return TRUE;
	};
};

func void PC_Thief_WHYBOW_Info ()
{
//	AI_Output			(hero, self, "PC_Thief_WHYBOW_15_01"); //Wofür brauche ich Bogentalent?
	AI_Output			(hero, self, "PC_Thief_WHYBOW_15_01"); //K čemu mi je cvičit lukostřelbu?
//	AI_Output			(self, hero, "PC_Thief_WHYBOW_11_02"); //Je mehr Talent du im Umgang mit dieser Waffe erlernst, desto schneller kannst du Pfeile abfeuern.
	AI_Output			(self, hero, "PC_Thief_WHYBOW_11_02"); //Čím lépe ovládáš tuto zbraň, tím rychleji dokážeš střílet šípy.
//	AI_Output			(self, hero, "PC_Thief_WHYBOW_11_03"); //Ausserdem kann nur ein talentierter Bogenschütze ungeschütze Stellen treffen und so manchmal tiefere Wunden verursachen.
	AI_Output			(self, hero, "PC_Thief_WHYBOW_11_03"); //Kromě toho jen trénovaný lukostřelec zasáhnout nechráněná místa a občas způsobit i hluboká zranění.
};

///////////////////////////////////////////////////////////////////////
//	Info WHYDEX
///////////////////////////////////////////////////////////////////////
instance PC_Thief_WHYDEX		(C_INFO)
{
	npc		 	 = 	PC_Thief;
	condition	 = 	PC_Thief_WHYDEX_Condition;
	information	 = 	PC_Thief_WHYDEX_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wofür brauche ich Geschicklichkeit?";
	description	 = 	"K čemu potřebuji obratnost?";
};

func int PC_Thief_WHYDEX_Condition ()
{
	if	Npc_KnowsInfo(hero, PC_Thief_NEEDTRAINING)
	{
		return TRUE;
	};
};

func void PC_Thief_WHYDEX_Info ()
{
//	AI_Output			(hero, self, "PC_Thief_WHYDEX_15_01"); //Wofür brauche ich Geschicklichkeit?
	AI_Output			(hero, self, "PC_Thief_WHYDEX_15_01"); //K čemu potřebuji obratnost?
//	AI_Output			(self, hero, "PC_Thief_WHYDEX_11_02"); //Je geschickter du bist, desto häufiger triffst du ein Ziel mit dem Bogen.
	AI_Output			(self, hero, "PC_Thief_WHYDEX_11_02"); //Čím jsi obratnější, tím častěji zasáhneš lukem cíl.
//	AI_Output			(self, hero, "PC_Thief_WHYDEX_11_03"); //Besonders ungeschickte Bogenschützen geben manchmal ein halbes Dutzend Schüsse ab, ohne ihr Ziel auch nur ein einziges Mal zu treffen.
	AI_Output			(self, hero, "PC_Thief_WHYDEX_11_03"); //Kromě toho těžkopádní lukostřelci mohou někdy vystřílet i půltucet šípů, aniž by aspoň jednou trefili cíl.
//	AI_Output			(self, hero, "PC_Thief_WHYDEX_11_04"); //Die besseren Bögen sind darüberhinaus so schwer zu handhaben, dass nur sehr geschickte Schützen überhaupt damit umgehen können.
	AI_Output			(self, hero, "PC_Thief_WHYDEX_11_04"); //Navíc lepší luky je obtížnější ovládat, takže s nimi mohou zacházet pouze obratní střelci.
};

///////////////////////////////////////////////////////////////////////
//	Info STARTRAINING
///////////////////////////////////////////////////////////////////////
instance  PC_Thief_STARTRAINING (C_INFO)
{
	npc				= PC_Thief;
	nr				= 4;
	condition		= PC_Thief_STARTRAINING_Condition;
	information		= PC_Thief_STARTRAINING_Info;
	important		= 0;
	permanent		= 1;
//	description		= "Ich will trainieren";
	description		= "Chci trénovat!";
};
FUNC int  PC_Thief_STARTRAINING_Condition()
{
	if Npc_KnowsInfo (hero,PC_Thief_NEEDTRAINING)
	{
		return TRUE;
	};
};
FUNC void  PC_Thief_STARTRAINING_Info()
{
//	AI_Output			(other, self,"PC_Thief_STARTRAINING_Info_15_01"); //Ich will trainieren.
	AI_Output			(other, self,"PC_Thief_STARTRAINING_Info_15_01"); //Chci trénovat!

	Info_ClearChoices	(PC_Thief_STARTRAINING);
	Info_AddChoice 		(PC_Thief_STARTRAINING,DIALOG_BACK,PC_Thief_STARTRAINING_BACK);
//	Info_AddChoice		(PC_Thief_STARTRAINING,"Ich will geschickter werden",PC_Thief_STARTRAINING_DEX);
	Info_AddChoice		(PC_Thief_STARTRAINING,"Chci se stát obratnějším.",PC_Thief_STARTRAINING_DEX);
	if  (Npc_GetTalentSkill (other, NPC_TALENT_BOW) == 0)
	{
		Info_AddChoice (PC_Thief_STARTRAINING,B_BuildLearnString(NAME_LearnBow_1,LPCOST_TALENT_BOW_1,0),PC_Thief_STARTRAINING_BOW1);
	};

	//-------- Bogenschiessen Talent 2 --------
	if  (LearnBow_1 == LOG_SUCCESS)
	&&  (Npc_GetTalentSkill (other, NPC_TALENT_BOW) == 1)
	{
		Info_AddChoice (PC_Thief_STARTRAINING,B_BuildLearnString(NAME_LearnBow_2,LPCOST_TALENT_BOW_2,0),PC_Thief_STARTRAINING_BOW2);
	};
};

// Geschicklichkeit, Bogenschiessen
FUNC VOID PC_Thief_STARTRAINING_BACK()
{
	Info_ClearChoices	(PC_Thief_STARTRAINING);
};

FUNC VOID PC_Thief_STARTRAINING_DEX()
{
//	AI_Output(hero,self,"PC_Thief_STARTRAINING_DEX_15_01"); //Ich will geschickter werden.
	AI_Output(hero,self,"PC_Thief_STARTRAINING_DEX_15_01"); //Chci se stát obratnějším.


	Info_ClearChoices	(PC_Thief_STARTRAINING);
	Info_AddChoice		(PC_Thief_STARTRAINING,DIALOG_BACK								,PC_Thief_STARTRAINING_DEX_BACK);
	Info_AddChoice		(PC_Thief_STARTRAINING,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),PC_Thief_STARTRAINING_DEX_DEX_5);
	Info_AddChoice		(PC_Thief_STARTRAINING,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),PC_Thief_STARTRAINING_DEX_DEX_1);
};

FUNC VOID PC_Thief_STARTRAINING_DEX_BACK()
{
	Info_ClearChoices	(PC_Thief_STARTRAINING);
};

FUNC VOID PC_Thief_STARTRAINING_DEX_DEX_1()
{
	B_BuyAttributePoints (hero, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(PC_Thief_STARTRAINING);
	Info_AddChoice		(PC_Thief_STARTRAINING,DIALOG_BACK								,PC_Thief_STARTRAINING_DEX_BACK);
	Info_AddChoice		(PC_Thief_STARTRAINING,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),PC_Thief_STARTRAINING_DEX_DEX_5);
	Info_AddChoice		(PC_Thief_STARTRAINING,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),PC_Thief_STARTRAINING_DEX_DEX_1);
};

FUNC VOID PC_Thief_STARTRAINING_DEX_DEX_5()
{
	B_BuyAttributePoints (hero, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(PC_Thief_STARTRAINING);
	Info_AddChoice		(PC_Thief_STARTRAINING,DIALOG_BACK								,PC_Thief_STARTRAINING_DEX_BACK);
	Info_AddChoice		(PC_Thief_STARTRAINING,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),PC_Thief_STARTRAINING_DEX_DEX_5);
	Info_AddChoice		(PC_Thief_STARTRAINING,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),PC_Thief_STARTRAINING_DEX_DEX_1);
};

FUNC VOID PC_Thief_STARTRAINING_BOW1()
{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 1, LPCOST_TALENT_BOW_1))
	{
//		AI_Output			(other, self,"PC_Thief_STARTRAINING_BOW1_15_01"); //Zeig mir den Umgang mit dem Bogen.
		AI_Output			(other, self,"PC_Thief_STARTRAINING_BOW1_15_01"); //Ukaž mi jak zacházet s lukem.
//		AI_Output			(self, other,"PC_Thief_STARTRAINING_BOW1_11_02"); //Zunächst die Haltung. Es ist wichtig dass du sicheren Stand hast, wenn du ruhig schiessen willst.
		AI_Output			(self, other,"PC_Thief_STARTRAINING_BOW1_11_02"); //Nejprve držení. Abys v klidu střílel, je důležité, abys měl pevný postoj.
//		AI_Output			(self, other,"PC_Thief_STARTRAINING_BOW1_11_03"); //Visiere dein Ziel über den gestreckten Arm an.
		AI_Output			(self, other,"PC_Thief_STARTRAINING_BOW1_11_03"); //Dívej se na svůj cíl přes nataženou paži.
//		AI_Output			(self, other,"PC_Thief_STARTRAINING_BOW1_11_04"); //Dann spanne den Bogen mit ganzer Kraft. Lass das Ziel dabei nicht aus den Augen.
		AI_Output			(self, other,"PC_Thief_STARTRAINING_BOW1_11_04"); //Pak vší silou natáhni luk. Nespouštěj svůj cíl z očí.
//		AI_Output			(self, other,"PC_Thief_STARTRAINING_BOW1_11_05"); //Du wirst nicht mit jedem Schuss treffen. Aber je talentierter du bist, desto öfter triffst du.
		AI_Output			(self, other,"PC_Thief_STARTRAINING_BOW1_11_05"); //Ne každým výstřelem zasáhneš. Ale čím budeš zkušenější, tím častěji se to podaří.
//		AI_Output			(self, other,"PC_Thief_STARTRAINING_BOW1_11_06"); //Soviel zur Theorie. Mal sehen, wie gut du mit dem Bogen umgehst.
		AI_Output			(self, other,"PC_Thief_STARTRAINING_BOW1_11_06"); //Tolik teorie. Uvidíme, jak dobře si s lukem poradíš.
//		AI_Output			(self, other,"PC_Thief_STARTRAINING_BOW1_11_07"); //Draussen im Burghof ist die Mauer gebrochen. Auf dem Wehrgang und auf dem Vordach der Schmiede haben sich FLEISCHWANZEN eingenistet.
		AI_Output			(self, other,"PC_Thief_STARTRAINING_BOW1_11_07"); //Venku na nádvoří je rozbitá zeď. Na cimbuří a přístřešku kovárny se usadily ŽRAVÉ ŠTĚNICE.
//		AI_Output			(self, other,"PC_Thief_STARTRAINING_BOW1_11_08"); //Die Mistviecher machen die Mauern kaputt. Suche dir eine gute Position und erledige mindestens 5 Stück.
		AI_Output			(self, other,"PC_Thief_STARTRAINING_BOW1_11_08"); //Ty potvory nám ničí zeď. Najdi si dobrou pozici a sejmi aspoň pět kusů.


		// Auftrags "Monster" setzen
		Wld_InsertNpc (Acid_Meatbug_1,"FP_MEATBUG_SPAWN_05");
		Wld_InsertNpc (Acid_Meatbug_2,"FP_MEATBUG_SPAWN_06");
		Wld_InsertNpc (Acid_Meatbug_3,"FP_MEATBUG_SPAWN_06");
		Wld_InsertNpc (Acid_Meatbug_4,"FP_MEATBUG_SPAWN_13");
		Wld_InsertNpc (Acid_Meatbug_5,"FP_MEATBUG_SPAWN_14");
		Wld_InsertNpc (Acid_Meatbug_6,"FP_MEATBUG_SPAWN_15");
		Wld_InsertNpc (Acid_Meatbug_7,"FP_MEATBUG_SPAWN_13");
		Wld_InsertNpc (Acid_Meatbug_8,"FP_MEATBUG_SPAWN_14");
		Wld_InsertNpc (Acid_Meatbug_9,"FP_MEATBUG_SPAWN_15");

		// Log initialisieren und füllen : CH1_TrainBow_1

		LearnBow_1 = LOG_RUNNING;
		Log_CreateTopic (CH1_TrainBow_1,LOG_MISSION);
		Log_SetTopicStatus (CH1_TrainBow_1,LOG_RUNNING);
//		B_LogEntry		(CH1_TrainBow_1,"Auf dem unzugänglichen Stück Wehrgang an der Burgschmiede und auf dem Vordach sind ein paar Fleischwanzen. Davon soll ich mindestens fünf erledigen.");
		B_LogEntry		(CH1_TrainBow_1,"Na nepřístupné části hradby a na přístřešku kovárny jsou nějaké žravé štěnice. Měl bych jich aspoň pět odstranit.");

	};
};
//-------------------------------------------------------------------------------------------------------------//
instance  PC_Thief_BOW1RUNNING (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_BOW1RUNNING_Condition;
	information		= PC_Thief_BOW1RUNNING_Info;
//	description		= "Ich habe noch keinen Bogen";
	description		= "Ještě nemám luk.";
	permanent		= FALSE;
};

FUNC int  PC_Thief_BOW1RUNNING_Condition()
{
	if (LearnBow_1 == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC void  PC_Thief_BOW1RUNNING_Info()
{
//	AI_Output			(other, self,"PC_Thief_BOW1RUNNING_Info_15_01"); //Ich habe noch keinen Bogen. Womit soll ich sie erledigen?
	AI_Output			(other, self,"PC_Thief_BOW1RUNNING_Info_15_01"); //Ještě nemám luk. Kde bych se k nějakému dostal?
//	AI_Output			(self, other,"PC_Thief_BOW1RUNNING_Info_11_02"); //Geh zu Helvegor am Marktplatz. Er kann dir bestimmt einen Bogen verkaufen.
	AI_Output			(self, other,"PC_Thief_BOW1RUNNING_Info_11_02"); //Zadi za Helvegorem na tržiště.  Určitě by ti mohl nějaký luk prodat.

	Log_CreateTopic (GE_TraderOC , LOG_NOTE);
//	B_LogEntry 		(GE_TraderOC,"Helvegor, der Bogenmacher verkauft seine Waren am Marktplatz");
	B_LogEntry 		(GE_TraderOC,"Helvegor, výrobce luků, prodává své zboží na tržišti.");
};
//-------------------------------------------------------------------------------------------------------------//
// Genug Meatbugs für den Bogenauftrag sind tot
instance  PC_Thief_BOW1SUCCESS (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_BOW1SUCCESS_Condition;
	information		= PC_Thief_BOW1SUCCESS_Info;
	important		= FALSE;
	permanent		= TRUE;
	description		= "Štěnice už nechroustají.";
};

FUNC int  PC_Thief_BOW1SUCCESS_Condition()
{
	// Meatbugs für den Auftrag initialisieren und Abfragen ob sie tot sind
	var C_NPC meatbug_1;
	meatbug_1 = Hlp_GetNpc (Acid_Meatbug_1);

	var C_NPC meatbug_2;
	meatbug_2 = Hlp_GetNpc (Acid_Meatbug_2);

	var C_NPC meatbug_3;
	meatbug_3 = Hlp_GetNpc (Acid_Meatbug_3);

	var C_NPC meatbug_4;
	meatbug_4 =	Hlp_GetNpc (Acid_Meatbug_4);

	var C_NPC meatbug_5;
	meatbug_5 =	Hlp_GetNpc (Acid_Meatbug_5);

	var C_NPC meatbug_6;
	meatbug_6 =	Hlp_GetNpc (Acid_Meatbug_6);

	var C_NPC meatbug_7;
	meatbug_7 =	Hlp_GetNpc (Acid_Meatbug_7);

	var C_NPC meatbug_8;
	meatbug_8 =	Hlp_GetNpc (Acid_Meatbug_8);

	var C_NPC meatbug_9;
	meatbug_9 =	Hlp_GetNpc (Acid_Meatbug_9);


	var int int_deadcounter;
	int_Deadcounter	= 0;

	if Npc_IsDead (meatbug_1)
	{
		int_deadcounter += 1;
	};
	if Npc_IsDead (meatbug_2)
	{
		int_deadcounter += 1;
	};
	if Npc_IsDead (meatbug_3)
	{
		int_deadcounter += 1;
	};
	if Npc_IsDead (meatbug_4)
	{
		int_deadcounter += 1;
	};
	if Npc_IsDead (meatbug_5)
	{
		int_deadcounter += 1;
	};
	if Npc_IsDead (meatbug_6)
	{
		int_deadcounter += 1;
	};
	if Npc_IsDead (meatbug_7)
	{
		int_deadcounter += 1;
	};
	if Npc_IsDead (meatbug_8)
	{
		int_deadcounter += 1;
	};
	if Npc_IsDead (meatbug_9)
	{
		int_deadcounter += 1;
	};

	// Genug Meatbugs tot und die Mission läuft
	if (LearnBow_1 == LOG_RUNNING)
	&& (int_deadcounter >= 5)
	{
		return TRUE;
	};

};

FUNC void  PC_Thief_BOW1SUCCESS_Info()
{

	Info_ClearChoices	(PC_Thief_BOW1SUCCESS);

//	AI_Output			(other, self,"PC_Thief_BOW1SUCCESS_Info_Ready_15_01"); //Die Fleischwanzen knabbern nichts mehr an.
	AI_Output			(other, self,"PC_Thief_BOW1SUCCESS_Info_Ready_15_01"); //Štěnice už nechroustají.
//	AI_Output			(self, other,"PC_Thief_BOW1SUCCESS_Info_Ready_11_02"); //Ausgezeichnet.
	AI_Output			(self, other,"PC_Thief_BOW1SUCCESS_Info_Ready_11_02"); //Výtečně.

	// Loghandling : CH1_TrainBow_1 / Experience vergeben / Mission auf erfüllt setzen
	LearnBow_1			= LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_TrainBow_1,LOG_SUCCESS);
//	B_LogEntry		   	(CH1_TrainBow_1,"Die Fleischwanzen sind erledigt.");
	B_LogEntry		   	(CH1_TrainBow_1,"Štěnice jsou vyřízeny.");
	B_GiveXP			(XP_Bow1);
};
// Es sind noch nicht Genug MEatbugs für den Bogenauftrag tot
instance  PC_Thief_BOW1RunningMeatBug (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_BOW1RunningMeatBug_Condition;
	information		= PC_Thief_BOW1RunningMeatBug_Info;
	important		= 0;
	permanent		= 1;
//	description		= "Wo treiben sich die Meatbugs nochmal rum?";
	description		= "Kde se tak ty štěnice obvykle pohybují?";
};

FUNC int  PC_Thief_BOW1RunningMeatBug_Condition()
{
	// Meatbugs für den Auftrag initialisieren und Abfragen ob sie tot sind
	var C_NPC meatbug_1;	meatbug_1 = Hlp_GetNpc (Acid_Meatbug_1);

	var C_NPC meatbug_2;	meatbug_2 = Hlp_GetNpc (Acid_Meatbug_2);

	var C_NPC meatbug_3;	meatbug_3 = Hlp_GetNpc (Acid_Meatbug_3);

	var C_NPC meatbug_4;	meatbug_4 =	Hlp_GetNpc (Acid_Meatbug_4);

	var C_NPC meatbug_5;	meatbug_5 =	Hlp_GetNpc (Acid_Meatbug_5);

	var C_NPC meatbug_6;	meatbug_6 =	Hlp_GetNpc (Acid_Meatbug_6);

	var C_NPC meatbug_7;	meatbug_7 =	Hlp_GetNpc (Acid_Meatbug_7);

	var C_NPC meatbug_8;	meatbug_8 =	Hlp_GetNpc (Acid_Meatbug_8);

	var C_NPC meatbug_9;	meatbug_9 =	Hlp_GetNpc (Acid_Meatbug_9);

	// Zähler für die toten Meatbugs
	var int int_deadcounter;
	int_Deadcounter	= 0;

	if Npc_IsDead (meatbug_1)
	{
		int_deadcounter += 1;
	};
	if Npc_IsDead (meatbug_2)
	{
		int_deadcounter += 1;
	};
	if Npc_IsDead (meatbug_3)
	{
		int_deadcounter += 1;
	};
	if Npc_IsDead (meatbug_4)
	{
		int_deadcounter += 1;
	};
	if Npc_IsDead (meatbug_5)
	{
		int_deadcounter += 1;
	};
	if Npc_IsDead (meatbug_6)
	{
		int_deadcounter += 1;
	};
	if Npc_IsDead (meatbug_7)
	{
		int_deadcounter += 1;
	};
	if Npc_IsDead (meatbug_8)
	{
		int_deadcounter += 1;
	};
	if Npc_IsDead (meatbug_9)
	{
		int_deadcounter += 1;
	};

	// Zu wenig Meatbugs tot und die Mission läuft
	if (LearnBow_1 == LOG_RUNNING)
	&& (int_deadcounter < 5)
	{
		return TRUE;
	};

};

FUNC void  PC_Thief_BOW1RunningMeatBug_Info()
{

//	AI_Output			(other, self,"PC_Thief_BOW1SUCCESS_Info_Running_15_01"); //Wo treiben sich die Meatbugs nochmal rum?
	AI_Output			(other, self,"PC_Thief_BOW1SUCCESS_Info_Running_15_01"); //Kde se tak ty štěnice obvykle pohybují?
//	AI_Output			(self, other,"PC_Thief_BOW1SUCCESS_Info_Running_11_02"); //Hörst Du mir überhaupt zu? Auf dem Vordach der Schmiede und dem Wehrgang.
	AI_Output			(self, other,"PC_Thief_BOW1SUCCESS_Info_Running_11_02"); //Posloucháš mě vůbec? Na přístřešku kovárny a na hradbách.
	AI_StopProcessInfos	(self);
};

// Talentstufe 2 Bogenschießen
//	------- Die Scavengerfalle ---------

FUNC VOID PC_Thief_STARTRAINING_BOW2()
{
//	AI_Output			(other, self,"PC_Thief_STARTRAINING_BOW2_15_01"); //Ich will Meister des Bogenschiessens werden.
	AI_Output			(other, self,"PC_Thief_STARTRAINING_BOW2_15_01"); //Chci se stát mistrem střelby z luku.

	if (B_GiveSkill(other, NPC_TALENT_BOW, 2, LPCOST_TALENT_BOW_2))
	{
//			AI_Output			(self, other,"PC_Thief_STARTRAINING_BOW2_11_02"); //Sehr gut! Die Grundlagen kennst du ja schon. Kommen wir als zu den Feinheiten.
			AI_Output			(self, other,"PC_Thief_STARTRAINING_BOW2_11_02"); //Velmi dobře! Základy už znáš. Podívejme se teď na věc blíže.
//			AI_Output			(self, other,"PC_Thief_STARTRAINING_BOW2_11_03"); //Den ersten Schuss solltest du aus großer Entfernung abgeben, damit Du mehrere Treffer landen kannst, bevor der Gegner dich erreicht.
			AI_Output			(self, other,"PC_Thief_STARTRAINING_BOW2_11_03"); //První výstřel proveď z větší vzdálenosti, abys mohl protivníka víckrát zasáhnout, než se k tobě přiblíží.
//			AI_Output			(self, other,"PC_Thief_STARTRAINING_BOW2_11_04"); //Um auch weiter entfernte Ziele zu treffen, musst du höher zielen. Bewegt sich das Ziel seitlich, musst Du ausserdem vorhalten, damit es in deinen Schuss reinläuft.
			AI_Output			(self, other,"PC_Thief_STARTRAINING_BOW2_11_04"); //Abys zasáhl také vzdálenější cíle, musíš výše mířit. Když se přiblížíš k cíli ze strany, musíš taky čekat na to, až ti půjde do střely.
//			AI_Output			(self, other,"PC_Thief_STARTRAINING_BOW2_11_05"); //Wenn du das beachtest, wirst du ab jetzt viel öfter treffen.
			AI_Output			(self, other,"PC_Thief_STARTRAINING_BOW2_11_05"); //Když si budeš tohle hlídat, budeš od teď cíle zasahovat mnohem častěji.
//			AI_Output			(self, other,"PC_Thief_STARTRAINING_BOW2_11_06"); //Ich hab auch eine Idee, wie du das Ganze üben kannst.
			AI_Output			(self, other,"PC_Thief_STARTRAINING_BOW2_11_06"); //A mám taky nápad, kdy be ses v tom mohl trochu pocvičit.
//			AI_Output			(self, other,"PC_Thief_STARTRAINING_BOW2_11_07"); //Vor dem Lager, in der Nähe der Brücke, treiben sich oft Molerats herum. Versuche 5 zu erlegen und bring mir das Fleisch.
			AI_Output			(self, other,"PC_Thief_STARTRAINING_BOW2_11_07"); //Před táborem, poblíž mostu, se často vyskytují krysokrti. Pět z nich zlikviduj a přines mi jejich maso.
//			AI_Output			(other, self,"PC_Thief_STARTRAINING_BOW2_15_08"); //Dann werd ich mich mal um die Biester kümmern.
			AI_Output			(other, self,"PC_Thief_STARTRAINING_BOW2_15_08"); //Tak se tedy postarám o tu zvěř.
			LearnBow_2 = LOG_RUNNING;

			// Auftragsmonster spawnen
			Wld_InsertNpc (Molerat,"OW_PATH_193");
			Wld_InsertNpc (Molerat,"OW_PATH_193");
			Wld_InsertNpc (Molerat,"OW_PATH_193");
			Wld_InsertNpc (Molerat,"OW_PATH_193");
			Wld_InsertNpc (Molerat,"OW_PATH_193");
			Wld_InsertNpc (Molerat,"OW_PATH_193");

			// Log für die Mission : CH1_TrainBow_2
			Log_CreateTopic (CH1_TrainBow_2, LOG_MISSION);
			Log_SetTopicStatus (CH1_TrainBow_2,LOG_RUNNING);
//			B_LogEntry (CH1_TrainBow_2,"Ich soll Diego das Fleisch von 5 Molerats bringen");
			B_LogEntry (CH1_TrainBow_2,"Měl bych Diegovi přinést maso pěti krysokrtů.");


	};
};

///////////////////////////////////////////////////////////////////////
//	Info Bow2Running
///////////////////////////////////////////////////////////////////////
instance PC_Thief_BOW2RUNNING		(C_INFO)
{
	npc		 	 = 	PC_Thief;
	condition	 = 	PC_Thief_BOW2RUNNING_Condition;
	information	 = 	PC_Thief_BOW2RUNNING_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Gibt es noch etwas, daß ich über die Molerats wissen muß?";
	description	 = 	"Je tu ještě něco, co bych měl vědět o krysokrtech?";
};

func int PC_Thief_BOW2RUNNING_Condition ()
{
	 // Mission läuft und der Spieler hat noch nicht genug Fleisch ?
	if (LearnBow_2 == LOG_RUNNING)
	&& ( Npc_HasItems	(other, ItFo_MuttonRaw) < 10)
	{
		return TRUE;
	};
	return FALSE;
};

func void PC_Thief_BOW2RUNNING_Info ()
{
//	AI_Output			(hero, self, "PC_Thief_BOW2RUNNING_15_01"); //Gibt es noch etwas, daß ich über die Molerats wissen muß?
	AI_Output			(hero, self, "PC_Thief_BOW2RUNNING_15_01"); //Je tu ještě něco, co bych měl vědět o krysokrtech?
//	AI_Output			(self, hero, "PC_Thief_BOW2RUNNING_11_02"); //Sie sind langsam und können nicht klettern. Sollte nicht so schwer werden, ein paar zu erlegen, wenn Du vorsichtig bist.
	AI_Output			(self, hero, "PC_Thief_BOW2RUNNING_11_02"); //Jsou pomalí a neumějí šplhat. Jestli si jsi alespoň trochu jistý, nemělo by být vůbec těžké jich pár zabít.
};


//-------------------------------------------------------------------------------------------------------------//
// Der Spieler hat das Fleisch der Molerats besorgt
instance  PC_Thief_BOW2SUCCESS (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_BOW2SUCCESS_Condition;
	information		= PC_Thief_BOW2SUCCESS_Info;
	important		= 0;
	permanent		= 0;
//	description		= "Ich hab das Fleisch der Molerats";
	description		= "Mám maso z krysokrtů.";
};

FUNC int  PC_Thief_BOW2SUCCESS_Condition()
{


	// Das Fleisch (der Molerats) ist vorhanden und die Mission läuft ?
	if (LearnBow_2 == LOG_RUNNING)
	&& (Npc_HasItems ( other, ItFo_MuttonRaw) >= 10)
	{
		return TRUE;
	};
};

FUNC void  PC_Thief_BOW2SUCCESS_Info()
{
//	AI_Output			(other, self,"PC_Thief_BOW2SUCCESS_Info_15_01"); //Ich hab das Fleisch der Molerats
	AI_Output			(other, self,"PC_Thief_BOW2SUCCESS_Info_15_01"); //Mám maso z krysokrtů.
//	AI_Output			(self, other,"PC_Thief_BOW2SUCCESS_Info_11_02"); //Gute Arbeit. Du bist schon wieder besser in Form!
	AI_Output			(self, other,"PC_Thief_BOW2SUCCESS_Info_11_02"); //Dobrá práce. Už jsi zase v lepší formě!
//	AI_Output			(other, self,"PC_Thief_BOW2SUCCESS_Info_15_03"); //Wenn ich mit meinem Trainig fertig bin, kann ich überall als Kammerjäger anheuern.
	AI_Output			(other, self,"PC_Thief_BOW2SUCCESS_Info_15_03"); //Až skončím se svým výcvikem, budu všude kolem známý, jako mistr 'deratizátor'.

	B_GiveInvItems			(other, self, ItFo_MuttonRaw, 10);
	// Loghandling : CH1_TrainBow_2 / Experience vergeben / Mission auf erfüllt setzen
	LearnBow_2			= LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_TrainBow_2,LOG_SUCCESS);
//	B_LogEntry			(CH1_TrainBow_2,"Diego hat das Fleisch der Molerats. Damit habe ich alles über den Umgang mit dem Bogen gelernt.");
	B_LogEntry			(CH1_TrainBow_2,"Diego dostal krysokrtí maso. A já jsem se naučil vše o zacházení s lukem.");
	B_GiveXP			(XP_Bow2);
};
//-------------------------------------------------------------------------------------------------------------//
instance  PC_Thief_STARTRAINING_THIEF (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_STARTRAINING_THIEF_Condition;
	information		= PC_Thief_STARTRAINING_THIEF_Info;
	important		= 0;
	permanent		= 0;
//	description		= "Ich möchte Diebes-Talente lernen.";
	description		= "Rád bych získal zlodějské dovednosti.";
};

FUNC int  PC_Thief_STARTRAINING_THIEF_Condition()
{
	if Npc_KnowsInfo (hero,PC_Thief_NEEDTRAINING)
	{
		return TRUE;
	};
};
FUNC void  PC_Thief_STARTRAINING_THIEF_Info()
{
//	AI_Output			(other, self,"PC_Thief_STARTRAINING_THIEF_Info_15_01"); //Ich möchte Diebes-Talente lernen.
	AI_Output			(other, self,"PC_Thief_STARTRAINING_THIEF_Info_15_01"); //Rád bych získal zlodějské dovednosti.
//	AI_Output			(self, other,"PC_Thief_STARTRAINING_THIEF_Info_11_02"); //Schleichen, Schlösser knacken, Taschendiebstahl? Aus der Nummer bin ich raus. Muß dafür sorgen, daß hier im Lager ein paar Regeln eingehalten werden.
	AI_Output			(self, other,"PC_Thief_STARTRAINING_THIEF_Info_11_02"); //Plížení, páčení zámků a kapsářství? V mnohém jsem už vyšel ze cviku. Musím se starat o to, aby se tady v táboře dodržovala nějaká pravidla.
//	AI_Output			(self, other,"PC_Thief_STARTRAINING_THIEF_Info_11_03"); //Es gibt aber jemanden, der dir weiterhelfen könnte. Gerion. Du findest ihn irgendwo in der Gegend des hinteren Tores.
	AI_Output			(self, other,"PC_Thief_STARTRAINING_THIEF_Info_11_03"); //Je tu ale někdo, kdo by ti mohl pomoci. Gerion. Najdeš ho někde naproti zadní bráně.

	Log_CreateTopic 	(GE_TeacheroC,LOG_NOTE);
//	B_LogEntry 			(GE_TeacheroC, "Gerion kann mir die Talente SCHLEICHEN, SCHLÖSSER KNACKEN und TASCHENDIEBSTAHL beibringen. Er hält sich irgendwo am hinteren Tor auf.");
	B_LogEntry 			(GE_TeacheroC, "Gerion mi může pomoci s dovednostmi PLÍŽENÍ, PÁČENÍ ZÁMKŮ a KAPSÁŘSTVÍ. Zdržuje se někde u zadní brány.");
};

///////////////////////////////////////////////////////////////////////
//	Info GERIONTHIEF
///////////////////////////////////////////////////////////////////////
instance PC_Thief_GERIONTHIEF		(C_INFO)
{
	npc		 	 = 	PC_Thief;
	condition	 = 	PC_Thief_GERIONTHIEF_Condition;
	information	 = 	PC_Thief_GERIONTHIEF_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Und wenn Gerion mir nicht helfen will?";
	description	 = 	"A když mi nebude chtít Gerion pomoci?";
};

func int PC_Thief_GERIONTHIEF_Condition ()
{
	if Npc_KnowsInfo (hero,PC_Thief_STARTRAINING_THIEF)
	{
		return TRUE;
	};
};
func void PC_Thief_GERIONTHIEF_Info ()
{
	var C_NPC Berengar; Berengar = Hlp_GetNpc (MIL_103_Berengar);

//	AI_Output			(hero, self, "PC_Thief_GERIONTHIEF_15_01"); //Und wenn Gerion mir nicht helfen will?
	AI_Output			(hero, self, "PC_Thief_GERIONTHIEF_15_01"); //A když mi nebude chtít Gerion pomoci?
//	AI_Output			(self, hero, "PC_Thief_GERIONTHIEF_11_02"); //Sag ihm, daß du mir von seinen kleinen Raubzügen erzählen könntest, wenn er dir nicht hilft.
	AI_Output			(self, hero, "PC_Thief_GERIONTHIEF_11_02"); //Když nebudeš chtít, tak mu řekneš, že mi můžeš říct o všech jeho malých loupežích.
//	AI_Output			(hero, self, "PC_Thief_GERIONTHIEF_15_03"); //Du weißt, daß er ein Dieb ist?
	AI_Output			(hero, self, "PC_Thief_GERIONTHIEF_15_03"); //Ty víš, že je zloděj?
//	AI_Output			(self, hero, "PC_Thief_GERIONTHIEF_11_04"); //Natürlich! Aber er weiß nicht, daß ich es weiß!
	AI_Output			(self, hero, "PC_Thief_GERIONTHIEF_11_04"); //Ovšemže! Ale on neví, že to vím já!
//	AI_Output			(self, hero, "PC_Thief_GERIONTHIEF_11_05"); //Manchmal ist es eben besser nichts zu unternehmen.
	AI_Output			(self, hero, "PC_Thief_GERIONTHIEF_11_05"); //Občas je prostě lepší nic nepodnikat.
//	AI_Output			(hero, self, "PC_Thief_GERIONTHIEF_15_06"); //Stimmt, mir hast du damit geholfen!
	AI_Output			(hero, self, "PC_Thief_GERIONTHIEF_15_06"); //To sedí, mně jsi tím teď pomohl!
//	AI_Output			(self, hero, "PC_Thief_GERIONTHIEF_11_07"); //Das ist aber kein Freibrief die Regeln zu brechen! Wenn du krumme Dinger machst, laß dich wenigstens nicht erwischen!
	AI_Output			(self, hero, "PC_Thief_GERIONTHIEF_11_07"); //Ale není na to žádná licence - na porušování pravidel! Pokud děláš neplechu, prostě se nesmíš nechat chytit!

};









//#####################################################################
//##
//##
//##		Botschaft von XARDAS  -> Übergang zum 2. Kapitel
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info XARDASLETTER
///////////////////////////////////////////////////////////////////////
instance PC_Thief_XARDASLETTER		(C_INFO)
{
	npc		 	 = 	PC_Thief;
	condition	 = 	PC_Thief_XARDASLETTER_Condition;
	information	 = 	PC_Thief_XARDASLETTER_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Xardas gab mir eine Botschaft für dich mit!";
	description	 = 	"Xardas mi pro tebe dal zprávu!";
};

func int PC_Thief_XARDASLETTER_Condition ()
{
	if	(Npc_HasItems(hero, ItWr_Xardas_Letter_Sealed) || Npc_HasItems(hero, ItWr_Xardas_Letter))
	&&	(chapter == 1)
	{
		return TRUE;
	};
};

func void PC_Thief_XARDASLETTER_Info ()
{
//	AI_Output			(hero, self, "PC_Thief_XARDASLETTER_15_01"); //Xardas gab mir eine Botschaft für dich mit!
	AI_Output			(hero, self, "PC_Thief_XARDASLETTER_15_01"); //Xardas mi dal pro tebe zprávu!
//	AI_Output			(self, hero, "PC_Thief_XARDASLETTER_11_02"); //Xardas...? Eine Botschaft...? Für mich...?
	AI_Output			(self, hero, "PC_Thief_XARDASLETTER_11_02"); //Xardas...? Zprávu...? Pro mě...?
//	AI_Output			(hero, self, "PC_Thief_XARDASLETTER_15_03"); //Ja hier ist sie!
	AI_Output			(hero, self, "PC_Thief_XARDASLETTER_15_03"); //Ano, tady je!
	if	Npc_HasItems(hero, ItWr_Xardas_Letter_Sealed)
	{
		B_GiveInvItems	(hero, self, ItWr_Xardas_Letter_Sealed, 1);
		B_UseFakeScroll	();
//		AI_Output		(self, hero, "PC_Thief_XARDASLETTER_11_04"); //Hmmm....
		AI_Output		(self, hero, "PC_Thief_XARDASLETTER_11_04"); //Hmmm....
//		AI_Output		(self, hero, "PC_Thief_XARDASLETTER_11_05"); //Sieht verdammt übel aus. Hier, lies selbst!
		AI_Output		(self, hero, "PC_Thief_XARDASLETTER_11_05"); //To vůbec nezní dobře. Koukni se sám!
		B_GiveInvItems	(self, hero, ItWr_Xardas_Letter, 1);
		AI_StopProcessInfos	(self);
	}
	else
	{
		B_GiveInvItems	(hero, self, ItWr_Xardas_Letter, 1);
		B_UseFakeScroll	();
//		AI_Output		(self, hero, "PC_Thief_XARDASLETTER_11_06"); //Offenbar hast du die Nachricht schon gelesen! Dann weisst du ja Bescheid.
		AI_Output		(self, hero, "PC_Thief_XARDASLETTER_11_06"); //Zjevně jsi ten dopis už četl! Potom tedy víš, o čem je řeč.
		B_GiveInvItems	(self, hero, ItWr_Xardas_Letter, 1);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info WHATNOW
///////////////////////////////////////////////////////////////////////
instance PC_Thief_WHATNOW		(C_INFO)
{
	npc		 	 = 	PC_Thief;
	condition	 = 	PC_Thief_WHATNOW_Condition;
	information	 = 	PC_Thief_WHATNOW_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Was meint Xardas mit ...wenn ich bereit bin... ?";
	description	 = 	"Co myslel Xardas tím ...až budu připraven... ?";
};

func int PC_Thief_WHATNOW_Condition ()
{
	if	Npc_KnowsInfo(hero, PC_Thief_XARDASLETTER)
	&&	Diego_LetterRead
	&&	(chapter == 1)
	{
		return TRUE;
	};
};

func void PC_Thief_WHATNOW_Info ()
{
//	AI_Output			(hero, self, "PC_Thief_WHATNOW_15_01"); //Was meint Xardas mit ...wenn ich bereit bin... ?
	AI_Output			(hero, self, "PC_Thief_WHATNOW_15_01"); //Co myslel Xardas tím ...až budu připraven... ?

	if	(hero.level < HERO_LEVEL_CH2)
	{
//		AI_Output		(self, hero, "PC_Thief_WHATNOW_11_02"); //Du musst erst mal wieder in Form kommen, sonst bist du Futter da draussen!
		AI_Output		(self, hero, "PC_Thief_WHATNOW_11_02"); //Musíš se znovu dostat do formy, zatím jsi venku snadnou kořistí!
//		AI_Output		(self, hero, "PC_Thief_WHATNOW_11_03"); //Ich werde dich schon bald brauchen. Es gibt einfach zu wenig gute Leute hier!
		AI_Output		(self, hero, "PC_Thief_WHATNOW_11_03"); //Budu tě ještě brzy potřebovat. Je tu zkrátka příliš málo dobrých lidí!
//		AI_Output		(hero, self, "PC_Thief_WHATNOW_15_04"); //Und ich dachte, dieser ganze Mist sei endgültig vorbei!
		AI_Output		(hero, self, "PC_Thief_WHATNOW_15_04"); //A já doufal, že už jsem se z toho hnoje dostal ven!
//		AI_Output		(self, hero, "PC_Thief_WHATNOW_11_05"); //Wohl kaum! Erst die Orks und nun kommen auch noch Dämonen dazu! Schöne Scheisse!
		AI_Output		(self, hero, "PC_Thief_WHATNOW_11_05"); //To stěží! Nejdříve skřeti a teď do toho ještě přijdou démoni! Jsme v pěknejch sračkách!
//		AI_Output		(self, hero, "PC_Thief_WHATNOW_11_06"); //Wenn das durchsickert ist hier im Lager die Hölle los. Die Leute machen sich ja schon wegen der Orks in die Hose...
		AI_Output		(self, hero, "PC_Thief_WHATNOW_11_06"); //Když se pořádně podíváš, uvidíš, jaké je tady v táboře peklo. Lidi maj kvůli skřetům naděláno v kalhotách...
//		AI_Output		(self, hero, "PC_Thief_WHATNOW_11_07"); //Also schau zu, dass du wieder fit wirst und trainiere soviel du nur kannst.
		AI_Output		(self, hero, "PC_Thief_WHATNOW_11_07"); //Tak si dej záležet, abys byl zase v kondici a trénuj, jak jen můžeš.
//		B_LogEntry		(CH1_DemonThreat, "Diego hält mich noch nicht wieder für überlebensfähig. Ich muss im Lager meine Fähigkeiten trainiere und wieder fit werden.");
		B_LogEntry		(CH1_DemonThreat, "Diego mě ještě nemá schopného přežití. Musím si v táboře rozvinou svoje dovednosti a dostat se do kondice.");
	}
	else
	{
//		AI_Output		(self, hero, "PC_Thief_WHATNOW_11_08"); //Wie ich sehe, bist du gut in Form für jemanden der so lange tot und begraben war. Ich glaube du hast da draussen jetzt wieder eine Chance.
		AI_Output		(self, hero, "PC_Thief_WHATNOW_11_08"); //Jak tak koukám, jsi celkem v dobré formě na člověka, který byl tak dlouho pohřbený. Řekl bych, že jsou venku pro tebe zase příležitosti.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info ITSOK
///////////////////////////////////////////////////////////////////////
instance PC_Thief_ITSOK		(C_INFO)
{
	npc		 	 = 	PC_Thief;
	condition	 = 	PC_Thief_ITSOK_Condition;
	information	 = 	PC_Thief_ITSOK_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Bereit oder nicht! Ich kann dir helfen...";
	description	 = 	"Připravený nebo ne! Mohu ti pomoct...";
};

func int PC_Thief_ITSOK_Condition ()
{
	if	(Npc_KnowsInfo(hero, PC_Thief_WHATNOW) || (chapter == 2))
	&&	(hero.level < HERO_LEVEL_CH2)
	{
		return TRUE;
	};
};

func void PC_Thief_ITSOK_Info ()
{
//	AI_Output			(hero, self, "PC_Thief_ITSOK_15_01"); //Bereit oder nicht! Ich kann dir helfen...
	AI_Output			(hero, self, "PC_Thief_ITSOK_15_01"); //Připravený nebo ne! Mohu ti pomoct...
//	AI_Output			(self, hero, "PC_Thief_ITSOK_11_02"); //Sie dich doch an. Du wirst ja nicht mal mehr mit einem Rudel Snapper fertig und wir werden es bald mit Dämonen zu tun bekommen.
	AI_Output			(self, hero, "PC_Thief_ITSOK_11_02"); //Podívej se na sebe. Sotva se postaráš o skupinu chňapavců a už se chceš starat o démony.
//	AI_Output			(self, hero, "PC_Thief_ITSOK_11_03"); //Lerne und trainiere so viel wie möglich hier im Lager, sonst bist du nicht mehr als Futter für die Wölfe.
	AI_Output			(self, hero, "PC_Thief_ITSOK_11_03"); //Uč se a cvič tady v táboře jak jen budeš moci, jinak nebudeš nic než sousto pro vlky.
//	AI_Output			(self, hero, "PC_Thief_ITSOK_11_04"); //Wenn du erfahren genug bist, komm zu mir zurück.
	AI_Output			(self, hero, "PC_Thief_ITSOK_11_04"); //Až budeš dostatečně zkušený, vrať se sem za mnou.
	B_PrintLevelTooLow	(HERO_LEVEL_CH2);
	AI_StopProcessInfos	(self);
};



///////////////////////////////////////////////////////////////////////
//	Info IAMREADY
///////////////////////////////////////////////////////////////////////
instance PC_Thief_IAMREADY		(C_INFO)
{
	npc		 	 = 	PC_Thief;
	condition	 = 	PC_Thief_IAMREADY_Condition;
	information	 = 	PC_Thief_IAMREADY_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich bin wieder in Form. Es kann losgehen!";
	description	 = 	"Už jsem zase při síle. Teď už to půjde!";
};

func int PC_Thief_IAMREADY_Condition ()
{
	if	(Npc_KnowsInfo(hero, PC_Thief_WHATNOW) || (chapter == 2))
	&&	(hero.level >= HERO_LEVEL_CH2)
	{
		return TRUE;
	};
};

func void PC_Thief_IAMREADY_Info ()
{
//	AI_Output			(hero, self, "PC_Thief_IAMREADY_15_01"); //Ich bin wieder in Form. Es kann losgehen!
	AI_Output			(hero, self, "PC_Thief_IAMREADY_15_01"); //Už jsem zase při síle. Teď už to půjde!
//	AI_Output			(self, hero, "PC_Thief_IAMREADY_11_02"); //Gut, denn ich brauche dich jetzt!
	AI_Output			(self, hero, "PC_Thief_IAMREADY_11_02"); //Dobře. Teď tě potřebuju!
//	AI_Output			(hero, self, "PC_Thief_IAMREADY_15_03"); //Worum geht es?
	AI_Output			(hero, self, "PC_Thief_IAMREADY_15_03"); //O co jde?
//	AI_Output			(self, hero, "PC_Thief_IAMREADY_11_05"); //Milten, unser alter Freund, ist bei den Feuermagiern in der Bergfestung.
	AI_Output			(self, hero, "PC_Thief_IAMREADY_11_05"); //Milten, náš starý přítel, je s mágy ohně v Horské pevnosti.
//	AI_Output			(hero, self, "PC_Thief_IAMREADY_15_06"); //Milten ist hier?
	AI_Output			(hero, self, "PC_Thief_IAMREADY_15_06"); //Milten je tu?
//	AI_Output			(self, hero, "PC_Thief_IAMREADY_11_07"); //Ja! Wenn es stimmt, was Xardas schreibt, brauchen wir hier im Lager sehr bald seine Hilfe.
	AI_Output			(self, hero, "PC_Thief_IAMREADY_11_07"); //Ano! Pokud je vše tak, jak psal Xardas, budeme tady v táboře brzy potřebovat jeho pomoc.
//	AI_Output			(self, hero, "PC_Thief_IAMREADY_11_04"); //Ich habe keine Ahnung von Dämonen und ausserdem kann ich auch nicht von hier weg.
	AI_Output			(self, hero, "PC_Thief_IAMREADY_11_04"); //Já o démonech nic nevím a kromě toho se odtud nemohu hnout.
//	AI_Output			(self, hero, "PC_Thief_IAMREADY_11_08"); //Geh in die Bergfestung und sprich mit Milten über Xardas' Warnung. Er wird dir zuhören.
	AI_Output			(self, hero, "PC_Thief_IAMREADY_11_08"); //Jdi do Horské pevnosti a promluv s Miltenem o Xardasovu varování. Vyslechne tě.
//	AI_Output			(self, hero, "PC_Thief_IAMREADY_11_09"); //Du musst einen Weg finden, diese dämonische Brut aufzuhalten.
	AI_Output			(self, hero, "PC_Thief_IAMREADY_11_09"); //Musíš najít způsob, jak tuhle démonskou havět zadržet.

	Log_CreateTopic		(CH1_Demonthreat,LOG_MISSION);
	Log_SetTopicStatus	(CH1_Demonthreat,LOG_RUNNING);
//	B_LogEntry			(CH1_DemonThreat, "Nach ausreichend Training werde ich nun zu Milten, meinem Weggefährten von früher, aufbrechen. Er ist einer der Feuermagier in der Bergfestung. Diego braucht seine Hilfe gegen die dämonische Bedrohung.");
	B_LogEntry			(CH1_DemonThreat, "Po dostatečném výcviku se teď vydám za Miltenem, mým starým známým. Je teď mágem ohně ve Skalní pevnosti. Diego potřebuje jeho pomoc proti hrozbě démonů.");
};

///////////////////////////////////////////////////////////////////////
//	Info PROBLEM
///////////////////////////////////////////////////////////////////////
instance PC_Thief_PROBLEM		(C_INFO)
{
	npc		 	 = 	PC_Thief;
	condition	 = 	PC_Thief_PROBLEM_Condition;
	information	 = 	PC_Thief_PROBLEM_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Sieht aus, als ob ich meine alte Arbeit zurück habe!";
	description	 = 	"Vypadá to, jako bych znovu dostal svoji starou práci!";
};

func int PC_Thief_PROBLEM_Condition ()
{
	if	Npc_KnowsInfo(hero, PC_Thief_IAMREADY)
	{
		return TRUE;
	};
};

func void PC_Thief_PROBLEM_Info ()
{
//	AI_Output			(hero, self, "PC_Thief_PROBLEM_15_01"); //(sarkastisch) Sieht aus, als ob ich meine alte Arbeit zurück habe!
	AI_Output			(hero, self, "PC_Thief_PROBLEM_15_01"); //(sarkasticky) Vypadá to, jako bych znovu dostal svoji starou práci!
//	AI_Output			(self, hero, "PC_Thief_PROBLEM_11_02"); //(grinst) Das Leben ist hart und ungerecht...
	AI_Output			(self, hero, "PC_Thief_PROBLEM_11_02"); //(usmívá se) Život je tvrdý a nespravedlivý...
//	AI_Output			(self, hero, "PC_Thief_PROBLEM_11_03"); //(wieder ernst) Allerdings gibt es da noch ein Problem!
	AI_Output			(self, hero, "PC_Thief_PROBLEM_11_03"); //(opět vážný) Každopádně tu máme ještě jeden problém!
//	AI_Output			(hero, self, "PC_Thief_PROBLEM_15_04"); //(ironisch) Wiese wundert mich das nicht?
	AI_Output			(hero, self, "PC_Thief_PROBLEM_15_04"); //(ironicky) Proč mě to jen nepřekvapuje?
//	AI_Output			(self, hero, "PC_Thief_PROBLEM_11_05"); //Rhobars' Paladine haben die Bergfestung völlig abgeschottet.
	AI_Output			(self, hero, "PC_Thief_PROBLEM_11_05"); //Rhobarovi paladinové Horskou pevnost dočista utěsnili.
//	AI_Output			(self, hero, "PC_Thief_PROBLEM_11_06"); //Nicht mal eine Fleischwanze würde es schaffen, auch nur einen Fuss in das Gemäuer zu setzen.
	AI_Output			(self, hero, "PC_Thief_PROBLEM_11_06"); //Ani žravé štěnici by se nepodařilo prostrčit byť jen nohu za zdi pevnosti.
//	AI_Output			(hero, self, "PC_Thief_PROBLEM_15_07"); //Wie komme ich dann hinein?
	AI_Output			(hero, self, "PC_Thief_PROBLEM_15_07"); //Jak se tam teda dostanu?
//	AI_Output			(self, hero, "PC_Thief_PROBLEM_11_08"); //Thora ist eine Kundschafterin der Paladine.
	AI_Output			(self, hero, "PC_Thief_PROBLEM_11_08"); //Thora s nimi má něco do činění.
//	AI_Output			(self, hero, "PC_Thief_PROBLEM_11_09"); //Wenn dich jemand in die Festung bringen kann, dann ist sie es.
	AI_Output			(self, hero, "PC_Thief_PROBLEM_11_09"); //Jestli tě do pevnosti může někdo dostat, pak je to ona.
//	AI_Output			(hero, self, "PC_Thief_PROBLEM_15_10"); //Ich werde mit ihr sprechen. Wir sehen uns wieder!
	AI_Output			(hero, self, "PC_Thief_PROBLEM_15_10"); //Promluvím s ní. Ještě se uvidíme!
//	AI_Output			(self, hero, "PC_Thief_PROBLEM_11_11"); //Viel Erfolg, mein Freund!
	AI_Output			(self, hero, "PC_Thief_PROBLEM_11_11"); //Zlom vaz, můj příteli!

//	B_LogEntry			(CH1_DemonThreat, "Die Bergfestung wird von den Paladinen des Königs abgeschottet. Thora arbeitet als Kundschafterin für die Paladine. Sie ist der einzige Weg für mich, in die Festung zu gelangen.");
	B_LogEntry			(CH1_DemonThreat, "Skalní pevnost je uzavřená paladiny. Thora pracuje jako zvěd pro paladiny. Je pro mě jedinou cestou do pevnosti.");

	B_KapitelWechsel	(2);
};

