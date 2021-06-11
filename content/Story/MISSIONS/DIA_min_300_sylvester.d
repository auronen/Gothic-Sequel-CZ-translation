///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance	Info_Sylvester_EXIT (C_INFO)
{
	npc			=  MIN_300_Sylvester;
	nr			=  999;
	condition	=  Info_Sylvester_EXIT_Condition;
	information	=  Info_Sylvester_EXIT_Info;
	important	=  FALSE;
	permanent	=  TRUE;
	description =  DIALOG_ENDE;
};

func int	Info_Sylvester_EXIT_Condition()
{
	return TRUE;
};

func void	Info_Sylvester_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};









//#####################################################################
//##
//##
//##						KAPITEL 1
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info HOWDY
///////////////////////////////////////////////////////////////////////
instance MIN_300_Sylvester_HOWDY		(C_INFO)
{
	npc		 	= 	MIN_300_Sylvester;
	nr			=	10;
	condition	= 	MIN_300_Sylvester_HOWDY_Condition;
	information	= 	MIN_300_Sylvester_HOWDY_Info;
	important	= 	FALSE;
	permanent	= 	TRUE;

//	description	= 	"Wie geht es so?";
	description	= 	"Jakpak to jde?";
};

func int MIN_300_Sylvester_HOWDY_Condition ()
{
	return TRUE;
};

func void MIN_300_Sylvester_HOWDY_Info ()
{
//	AI_Output			(hero, self, "MIN_300_HOWDY_15_01"); //Wie geht es so?
	AI_Output			(hero, self, "MIN_300_HOWDY_15_01"); //Jakpak to jde?

	if	Npc_KnowsInfo(hero,Info_Sylvester_CAVE)
	{
		if	Sylvester_Friend
		{
//			AI_Output	(self, hero, "MIN_300_HOWDY_03_02"); //Dank dir kann ich nun endlich wieder mein Essen selbst verdienen!
			AI_Output	(self, hero, "MIN_300_HOWDY_03_02"); //Díky tobě si mohu vydělat na vlastní jídlo!
		}
		else
		{
//			AI_Output	(self, hero, "MIN_300_HOWDY_03_03"); //Naja, ich kann jetzt weiss ich zwar wo eine neue Erzader ist, aber du hast mich ganz schön dafür bluten lassen!
			AI_Output	(self, hero, "MIN_300_HOWDY_03_03"); //Nojo, vím teď sice, kde je nová rudná žíla, ale dost jsem při tom díky tobě krvácel!
		};
	}
	else
	{
//		AI_Output		(self, hero, "MIN_300_HOWDY_03_04"); //Schlecht! Ich habe zur Zeit keine Arbeit! Und jetzt lass mich in Ruhe!
		AI_Output		(self, hero, "MIN_300_HOWDY_03_04"); //Špatně! Momentálně nemám co na práci! A teď mě nech v klidu!
		AI_StopProcessInfos(self);
	};
};




///////////////////////////////////////////////////////////////////////
//	Info PICK
///////////////////////////////////////////////////////////////////////
instance	Info_Sylvester_PICK (C_INFO)
{
	npc				=	MIN_300_Sylvester;
	nr				=	8;
	condition		=	Info_Sylvester_PICK_Condition;
	information		=	Info_Sylvester_PICK_Info;
	important		=	FALSE;
	permanent		=	FALSE;
//	description		=	"Nette Spitzhacke, die du da hast!";
	description		=	"To je pěkný krumpáč!";
};

func int	Info_Sylvester_PICK_Condition()
{
	if	Npc_HasItems(self, ItMw_Pickaxe)
	&&	Npc_KnowsInfo(hero, Info_Gotmar_PICK2)
	{
		return TRUE;
	};
};

func void	Info_Sylvester_PICK_Info()
{
//	AI_Output			(hero, self,"Info_Sylvester_PICK_15_01"); //Nette Spitzhacke, die du da hast!
	AI_Output			(hero, self,"Info_Sylvester_PICK_15_01"); //To je pěkný krumpáč!
//	AI_Output			(self, hero,"Info_Sylvester_PICK_03_02"); //Pah! Wenn ich blos Verwendung dafür hätte...
	AI_Output			(self, hero,"Info_Sylvester_PICK_03_02"); //Meh! Kdybych tak pro něj měl nějaké využití...
//	AI_Output			(hero, self,"Info_Sylvester_PICK_15_03"); //Wie meinst du das?
	AI_Output			(hero, self,"Info_Sylvester_PICK_15_03"); //Jak to myslíš?
//	AI_Output			(self, hero,"Info_Sylvester_PICK_03_04"); //Der einzige Ort, wo ich meine Silber verdienen kann ist die Mine im Norden.
	AI_Output			(self, hero,"Info_Sylvester_PICK_03_04"); //Jediné místo, kde si mohu vydělat nějaké stříbro je důl na severu.
//	AI_Output			(self, hero,"Info_Sylvester_PICK_03_05"); //Aber meine Kumpels haben den Eingang verrammelt, wegen der Orks die sich da rumtreiben.
	AI_Output			(self, hero,"Info_Sylvester_PICK_03_05"); //Ale moji kamarádi zablokovali vchod kvůli skřetům, kteří se tam potulovali.
//	AI_Output			(self, hero,"Info_Sylvester_PICK_03_06"); //Jetzt sitze ich hier und kann zusehen, wo ich mein Mittagessen herbekomme.
	AI_Output			(self, hero,"Info_Sylvester_PICK_03_06"); //Teď tu sedím a mohu se starat, kde vezmu jídlo k obědu.

	Info_ClearChoices	(Info_Sylvester_PICK);
//	Info_AddChoice		(Info_Sylvester_PICK,	"Ich kenne einen anderen Ort, an dem du Erz finden kannst.",	Info_Sylvester_PICKCAVE);
	Info_AddChoice		(Info_Sylvester_PICK,	"Znám jiné místo, kde se dá natěžit nějaká ruda.",				Info_Sylvester_PICKCAVE);
//	Info_AddChoice		(Info_Sylvester_PICK,	"Dann könntest du mir ja deine Spitzhacke überlassen.",			Info_Sylvester_PICKGIVE);
	Info_AddChoice		(Info_Sylvester_PICK,	"Tak to mi můžeš ten krumpáč přenechat.",						Info_Sylvester_PICKGIVE);
};

func void	Info_Sylvester_PICKGIVE ()
{
//	AI_Output			(hero, self,"Info_Sylvester_PICKGIVE_15_01"); //Dann könntest du mir ja deine Spitzhacke überlassen.
	AI_Output			(hero, self,"Info_Sylvester_PICKGIVE_15_01"); //Tak to mi můžeš ten krumpáč přenechat.
//	AI_Output			(self, hero,"Info_Sylvester_PICKGIVE_03_02"); //Ich bin zwar ohne Arbeit aber nicht ohne Verstand.
	AI_Output			(self, hero,"Info_Sylvester_PICKGIVE_03_02"); //Jsem bez práce, ale ne bez rozumu.
//	AI_Output			(self, hero,"Info_Sylvester_PICKGIVE_03_03"); //Wenn du meine Spitzhacke haben willst, will ich Silber sehen!
	AI_Output			(self, hero,"Info_Sylvester_PICKGIVE_03_03"); //Pokud chceš můj krumpáč, chci vidět stříbro!

	Info_ClearChoices	(Info_Sylvester_PICK);

	Sylvester_BuyPick = TRUE;
};

func void	Info_Sylvester_PICKCAVE ()
{
//	AI_Output			(hero, self,"Info_Sylvester_PICKCAVE_15_01"); //Ich kenne einen anderen Ort, an dem du Erz finden kannst.
	AI_Output			(hero, self,"Info_Sylvester_PICKCAVE_15_01"); //Znám jiné místo, kde se dá natěžit nějaká ruda.
//	AI_Output			(self, hero,"Info_Sylvester_PICKCAVE_03_02"); //Was sagst du da? Eine neue Erzader? Wo kann ich sie finden?
	AI_Output			(self, hero,"Info_Sylvester_PICKCAVE_03_02"); //Co to říkáš? Nová rudná žíla? Kde ji najdu?


	Info_ClearChoices	(Info_Sylvester_PICK);
//	Info_AddChoice		(Info_Sylvester_PICK,	"Das kostet dich aber 'ne Kleinigkeit",		Info_Sylvester_PICKCOST);
	Info_AddChoice		(Info_Sylvester_PICK,	"Ale bude tě to stát jednu 'maličkost'",	Info_Sylvester_PICKCOST);
//	Info_AddChoice		(Info_Sylvester_PICK,	"Komm mit, ich führe dich hin.",			Info_Sylvester_PICKCOME);
	Info_AddChoice		(Info_Sylvester_PICK,	"Pojď se mnou, ukážu ti cestu.",			Info_Sylvester_PICKCOME);

};

func void	Info_Sylvester_PICKCOME ()
{
//	AI_Output			(hero, self,"Info_Sylvester_PICKCOME_15_01"); //Komm mit, ich führe dich hin.
	AI_Output			(hero, self,"Info_Sylvester_PICKCOME_15_01"); //Pojď se mnou, ukážu ti cestu.
//	AI_Output			(self, hero,"Info_Sylvester_PICKCOME_03_02"); //Du bist echt in Ordnung. Nichts wie los!
	AI_Output			(self, hero,"Info_Sylvester_PICKCOME_03_02"); //Jsi v pohodě. Můžeme vyrazit!

	B_FollowPC			(self,	"FOLLOW");
	AI_StopProcessInfos	(self);

	Sylvester_Friend = 	TRUE;
};

func void	Info_Sylvester_PICKCOST ()
{
//	AI_Output			(hero, self,"Info_Sylvester_PICKCOST_15_01"); //Das kostet dich aber 'ne Kleinigkeit
	AI_Output			(hero, self,"Info_Sylvester_PICKCOST_15_01"); //Ale bude tě to stát jednu 'maličkost'
//	AI_Output			(self, hero,"Info_Sylvester_PICKCOST_03_02"); //Du bist ein echt eigennütziger Kerl.
	AI_Output			(self, hero,"Info_Sylvester_PICKCOST_03_02"); //Ty jsi opravdu sobec.
//	AI_Output			(self, hero,"Info_Sylvester_PICKCOST_03_03"); //Aber ich habe keine Wahl.
	AI_Output			(self, hero,"Info_Sylvester_PICKCOST_03_03"); //Ale nemám na výběr.
//	AI_Output			(self, hero,"Info_Sylvester_PICKCOST_03_04"); //Wenn ich nicht bald eine neue Erzader finde, kann ich mich zu dem bettelnden Lumpenpack gesellen.
	AI_Output			(self, hero,"Info_Sylvester_PICKCOST_03_04"); //Pokud brzy nenajdu novou rudnou žílu, budu se moci rovnou přidat k těm otrhaným pobudům.
//	AI_Output			(hero, self,"Info_Sylvester_PICKCOST_15_05"); //Tja, jeder ist sich selbst der nächste!
	AI_Output			(hero, self,"Info_Sylvester_PICKCOST_15_05"); //Ano, miluj bližního svého jako sebe sama!
//	AI_Output			(self, hero,"Info_Sylvester_PICKCOST_03_06"); //OK. wenn du mir die Erzader zeigst, geb ich dir meine Spitzhacke.
	AI_Output			(self, hero,"Info_Sylvester_PICKCOST_03_06"); //OK. Když mi ukážeš novou rudnou žílu, dám ti svůj krumpáč.
//	AI_Output			(self, hero,"Info_Sylvester_PICKCOST_03_07"); //Hab' noch eine Reservehacke im Rucksack.
	AI_Output			(self, hero,"Info_Sylvester_PICKCOST_03_07"); //Mám ještě jeden záložní schovaný v batohu.

	Info_ClearChoices	(Info_Sylvester_PICK);
//	Info_AddChoice		(Info_Sylvester_PICK,	"Also wenn du keine Wahl hast, kannst du auch noch was drauflegen!",Info_Sylvester_PICKCOSTNO);
	Info_AddChoice		(Info_Sylvester_PICK,	"Pokud tedy nemáš na výběr, můžeš také ještě něco přihodit!",			Info_Sylvester_PICKCOSTNO);
//	Info_AddChoice		(Info_Sylvester_PICK,	"Die Spitzhacke ist OK.",											Info_Sylvester_PICKCOSTYES);
	Info_AddChoice		(Info_Sylvester_PICK,	"Ten krumpáč bude stačit.",												Info_Sylvester_PICKCOSTYES);
};

func void	Info_Sylvester_PICKCOSTYES ()
{
//	AI_Output			(hero, self,"Info_Sylvester_PICKCOSTYES_15_01"); //Die Spitzhacke ist OK.
	AI_Output			(hero, self,"Info_Sylvester_PICKCOSTYES_15_01"); //Ten krumpáč bude stačit.
//	AI_Output			(self, hero,"Info_Sylvester_PICKCOSTYES_03_02"); //Hier, und nun zeig mir den Weg zur Ader.
	AI_Output			(self, hero,"Info_Sylvester_PICKCOSTYES_03_02"); //Tady a teď mi ukaž cestu k té žíle.

	B_GiveInvItems		(self, hero, ItMw_Pickaxe, 1);
	B_FollowPC			(self, "FOLLOW");
	AI_StopProcessInfos	(self);
};

func void	Info_Sylvester_PICKCOSTNO ()
{
//	AI_Output			(hero, self,"Info_Sylvester_PICKCOSTNO_15_01"); //Also wenn du keine Wahl hast, kannst du auch noch was drauflegen!
	AI_Output			(hero, self,"Info_Sylvester_PICKCOSTNO_15_01"); //Pokud tedy nemáš na výběr, můžeš také ještě něco přihodit!

	Sylvester_Silver = Npc_HasItems(self, ItMi_Silver);
	if	(Sylvester_Silver > 0)
	{
//		AI_Output			(self, hero,"Info_Sylvester_PICKCOSTNO_03_02"); //Ich seh schon, du bist auch nicht besser als die anderen Halsabschneider hier.
		AI_Output			(self, hero,"Info_Sylvester_PICKCOSTNO_03_02"); //Vidím, že nejsi o nic lepší, než ti hrdlořezové tady v táboře.
//		AI_Output			(self, hero,"Info_Sylvester_PICKCOSTNO_03_03"); //OK, OK, ich kann dir noch das bischen Silber dazugeben, dass ich habe.
		AI_Output			(self, hero,"Info_Sylvester_PICKCOSTNO_03_03"); //OK, OK, mohu ti dát to málo stříbra, co mám u sebe.

		Info_ClearChoices	(Info_Sylvester_PICK);
//		Info_AddChoice		(Info_Sylvester_PICK,	"Vergiss es. Ich bin nicht interessiert!",			Info_Sylvester_PICKCOSTNONO);
		Info_AddChoice		(Info_Sylvester_PICK,	"Na to zapomeň. Nemám zájem!",						Info_Sylvester_PICKCOSTNONO);
//		Info_AddChoice		(Info_Sylvester_PICK,	"Behalt dein Silber. Die Spitzhacke reicht.",		Info_Sylvester_PICKCOSTYES);
		Info_AddChoice		(Info_Sylvester_PICK,	"Nech si to stříbro, ten krumpáč mi stačí.",		Info_Sylvester_PICKCOSTYES);
//		Info_AddChoice		(Info_Sylvester_PICK,	"OK, das Geschäft gilt!",							Info_Sylvester_PICKCOSTNOSILVER);
		Info_AddChoice		(Info_Sylvester_PICK,	"OK, platí!",										Info_Sylvester_PICKCOSTNOSILVER);
	}
	else
	{
//		AI_Output			(self, hero,"Info_Sylvester_PICKCOSTNO_03_04"); //Ich besitzte sonst nichts von Wert.
		AI_Output			(self, hero,"Info_Sylvester_PICKCOSTNO_03_04"); //Nic jiného hodnotného nemám.
//		AI_Output			(self, hero,"Info_Sylvester_PICKCOSTNO_03_05"); //Zeigst du mir die Ader trotzdem?
		AI_Output			(self, hero,"Info_Sylvester_PICKCOSTNO_03_05"); //Ukážeš mi tu žílu i tak?

		Info_ClearChoices	(Info_Sylvester_PICK);
//		Info_AddChoice		(Info_Sylvester_PICK,	"Vergiss es. Ich bin nicht interessiert!",			Info_Sylvester_PICKCOSTNONO);
		Info_AddChoice		(Info_Sylvester_PICK,	"Na to zapomeň. Nemám zájem!",						Info_Sylvester_PICKCOSTNONO);
//		Info_AddChoice		(Info_Sylvester_PICK,	"Die Spitzhacke ist OK. Ich führ dich zur Ader.",	Info_Sylvester_PICKCOSTYES);
		Info_AddChoice		(Info_Sylvester_PICK,	"Ten krumpáč mi stačí. Zavedu tě k té žíle.",		Info_Sylvester_PICKCOSTYES);
	};
};

func void	Info_Sylvester_PICKCOSTNOSILVER ()
{
//	AI_Output			(hero, self,"Info_Sylvester_PICKCOSTNOSILVER_15_01"); //OK, das Geschäft gilt!
	AI_Output			(hero, self,"Info_Sylvester_PICKCOSTNOSILVER_15_01"); //OK, platí!
//	AI_Output			(self, hero,"Info_Sylvester_PICKCOSTNOSILVER_03_02"); //Du bist ein übler Gauner! Ich sollte die anderen Leute hier vor dir warnen.
	AI_Output			(self, hero,"Info_Sylvester_PICKCOSTNOSILVER_03_02"); //Ty jsi ale gauner! Měl bych před tebou varovat ostatní lidi.
//	AI_Output			(self, hero,"Info_Sylvester_PICKCOSTNOSILVER_03_03"); //Hier ist meine Spitzhacke.
	AI_Output			(self, hero,"Info_Sylvester_PICKCOSTNOSILVER_03_03"); //Tady je můj krumpáč.
	B_GiveInvItems		(self, hero, ItMw_Pickaxe, 1);
//	AI_Output			(self, hero,"Info_Sylvester_PICKCOSTNOSILVER_03_04"); //Nun führe mich wie abgemacht zur Erzader, dort bekommst du dann das Silber.
	AI_Output			(self, hero,"Info_Sylvester_PICKCOSTNOSILVER_03_04"); //A teď mě zaveď k té rundé žíle, tam dostaneš to stříbro.

	Sylvester_Blackmailer = TRUE;
	B_AddDarkPoints		(1);

	B_FollowPC			(self, "FOLLOW");
	AI_StopProcessInfos	(self);
};

func void	Info_Sylvester_PICKCOSTNONO ()
{
//	AI_Output			(hero, self,"Info_Sylvester_PICKCOSTNONO_15_01"); //Vergiss es. Ich bin nicht interessiert!
	AI_Output			(hero, self,"Info_Sylvester_PICKCOSTNONO_15_01"); //Na to zapomeň. Nemám zájem!
//	AI_Output			(self, hero,"Info_Sylvester_PICKCOSTNONO_03_02"); //Immer diese Aufschneider. Wahrscheinlich gibt es die Ader überhaupt nicht.
	AI_Output			(self, hero,"Info_Sylvester_PICKCOSTNONO_03_02"); //Zase ten chvástal. Ta rudná žíla stejně pravděpodobně neexistuje.
//	AI_Output			(self, hero,"Info_Sylvester_PICKCOSTNONO_03_03"); //Ist wohl ohnehin besser, wenn ich meine Hacke behalte. Wer weiss wann die Orks sich von der Mine verziehen.
	AI_Output			(self, hero,"Info_Sylvester_PICKCOSTNONO_03_03"); //Myslím, že bude lepší, když si svůj krumpáč nechám. Kdo ví, kdy skřeti opustí důl.
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info BUYPICK
///////////////////////////////////////////////////////////////////////
instance	Info_Sylvester_BUYPICK (C_INFO)
{
	npc				= MIN_300_Sylvester;
	nr				=	10;
	condition		= Info_Sylvester_BUYPICK_Condition;
	information		= Info_Sylvester_BUYPICK_Info;
	important		= FALSE;
	permanent		= TRUE;
	description		= B_BuildBuyString(NAME_Pickaxe, SYLVESTER_PRICEPICKAXE);
};

func int	Info_Sylvester_BUYPICK_Condition()
{
	if	Npc_HasItems(self, ItMw_Pickaxe)
	&&	Sylvester_BuyPick
	{
		return TRUE;
	};
};

func void	Info_Sylvester_BUYPICK_Info ()
{
	if	(Npc_HasItems(hero, ItMi_Silver) >= SYLVESTER_PRICEPICKAXE)
	{
//		AI_Output			(self, hero,"Info_Sylvester_BUYPICK_03_01"); //OK, hier hast du die Hacke. Konnte die mühselige Schürferei eh nie leiden.
		AI_Output			(self, hero,"Info_Sylvester_BUYPICK_03_01"); //Dobře, tady je ten krumpáč. Nemusel by snést namáhavou těžbu.

		B_GiveInvItems		(hero, self,	ItMi_Silver,	SYLVESTER_PRICEPICKAXE);
		B_GiveInvItems		(self, hero,	ItMw_Pickaxe, 	1);
		Info_Sylvester_BUYPICK.permanent = FALSE;
	}
	else
	{
//		AI_Output			(self, hero,"Info_Sylvester_BUYPICK_03_02"); //Verarsch mich nicht! Besorg erst das Silber, dann kannst du auch die Hacke haben.
		AI_Output			(self, hero,"Info_Sylvester_BUYPICK_03_02"); //Nedělej si ze mě srandu! Obstarej stříbro a potom dostaneš krumpáč.
		AI_StopProcessInfos	(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info CAVE
///////////////////////////////////////////////////////////////////////
instance	Info_Sylvester_CAVE (C_INFO)
{
	npc				= MIN_300_Sylvester;
	condition		= Info_Sylvester_CAVE_Condition;
	information		= Info_Sylvester_CAVE_Info;
	important		= TRUE;
	permanent		= FALSE;
};

func int	Info_Sylvester_CAVE_Condition()
{
	if	(Npc_GetDistToWP(hero, "OW_CAVE1_OREWOLF_4") < 400)
	{
		return TRUE;
	};
};

func void	Info_Sylvester_CAVE_Info ()
{
	AI_GotoNpc				(self, hero);

//	AI_Output				(self, hero,"Info_Sylvester_CAVE_03_01"); //Unglaublich, hier gibt es tatsächlich Erz.
	AI_Output				(self, hero,"Info_Sylvester_CAVE_03_01"); //Neuvěřetlné, ta ruda tu skutečně je!

	if	Sylvester_Friend
	{
//		AI_Output			(self, hero,"Info_Sylvester_CAVE_03_02"); //Danke nochmal. Leute wie dich gibt es hier sehr wenige.
		AI_Output			(self, hero,"Info_Sylvester_CAVE_03_02"); //JEště jednou děkuji. Lidí, jako jsi ty, tu máme málo.
//		AI_Output			(self, hero,"Info_Sylvester_CAVE_03_03"); //Wenn du etwas Erz brauchst, komm vorbei. Ich kann bestimmt mal ein paar Brocken abzweigen.
		AI_Output			(self, hero,"Info_Sylvester_CAVE_03_03"); //Pokud budeš potřebovat trochu rudy, klidně si přijď. Určitě budu moci pár kouksů postrádat.

		B_SetAttitude		(self, ATT_FRIENDLY);
		Sylvester_LastOre	= Wld_GetDay()-1;
		B_AddFame			(1);
		B_GiveXP			(XP_Sylvester_OreCave_Friendly);
//		B_LogEntry			(CH1_LearnSmith,	"Sylvester war dankbar, dass ich ihn zur Erzader geführt habe. Ich kann mir ab heute täglich etwas Erz bei ihm abholen.");
		B_LogEntry			(CH1_LearnSmith,	"Sylvester byl vděčný, že jsem ho dovedl k rundé žíle. Od dnešního dne si u něj budu moci každý den vyzvednout trošku rudy.");
	}
	else
	{
		if	Sylvester_Blackmailer
		{
//			AI_Output		(self, hero, "Info_Sylvester_CAVE_03_04"); //Hier ist das Silber! Hoffentlich erstickst du daran, du Erpresser!
			AI_Output		(self, hero, "Info_Sylvester_CAVE_03_04"); //Tady je to stříbro! Doufám, že se s ním zadusíš, ty vyděrači!
			B_GiveInvItems	(self, hero, ItMi_Silver, Sylvester_Silver);
		};

		B_GiveXP			(XP_Sylvester_OreCave_selfish);
	};

	if	Npc_IsInRoutine(self, ZS_PickOre)
	{
//		AI_Output			(self, hero,"Info_Sylvester_CAVE_03_05"); //Dann werde ich mich mal gleich an die Arbeit machen.
		AI_Output			(self, hero,"Info_Sylvester_CAVE_03_05"); //Pak se hned pustím do práce.
	}
	else
	{
//		AI_Output			(self, hero,"Info_Sylvester_CAVE_03_06"); //Es ist schon spät. Ich werde mich noch etwas ausruhen und mich morgen früh dann an die Arbeit machen.
		AI_Output			(self, hero,"Info_Sylvester_CAVE_03_06"); //Už je pozdě. Trošku si odpočinu a zítra ráno se pustím do práce.
	};

	B_LeavePC				(self,	"PICK");
	AI_StopProcessInfos		(self);
};

///////////////////////////////////////////////////////////////////////
//	Info GIVEORE
///////////////////////////////////////////////////////////////////////
instance	Info_Sylvester_GIVEORE (C_INFO)
{
	npc				= MIN_300_Sylvester;
	nr				=	15;
	condition		= Info_Sylvester_GIVEORE_Condition;
	information		= Info_Sylvester_GIVEORE_Info;
	important		= FALSE;
	permanent		= TRUE;
//	description		= "Hast du etwas Erz übrig?";
	description		= "Zbyla ti ještě nějaká ruda?";
};

func int	Info_Sylvester_GIVEORE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Sylvester_CAVE)
	&&	Sylvester_Friend
	{
		return TRUE;
	};
};

func void	Info_Sylvester_GIVEORE_Info ()
{
//	AI_Output				(hero, self,"Info_Sylvester_GIVEORE_15_01"); //Hast du etwas Erz übrig?
	AI_Output				(hero, self,"Info_Sylvester_GIVEORE_15_01"); //Zbyla ti ještě nějaká ruda?

	if	(Sylvester_LastOre != Wld_GetDay())
	{
//		AI_Output			(self, hero,"Info_Sylvester_GIVEORE_03_02"); //Klar. Kannst ein paar Brocken haben, hier!
		AI_Output			(self, hero,"Info_Sylvester_GIVEORE_03_02"); //Jasně. Můžeš vzít pár kouksů, tady!

		B_GiveInvItems		(self, hero,	ItMi_OreNugget,	SYLVESTER_DAILYORE);
		Sylvester_LastOre = Wld_GetDay();
	}
	else
	{
//		AI_Output			(self, hero,"Info_Sylvester_GIVEORE_03_03"); //Kann heute leider nichts mehr entbehren, aber vielleicht morgen wieder!
		AI_Output			(self, hero,"Info_Sylvester_GIVEORE_03_03"); //Dnes už nic nemám, ale zítra možná budu zase pár nugetů mít!
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BUYPICKFRIEND
///////////////////////////////////////////////////////////////////////
instance	Info_Sylvester_BUYPICKFRIEND (C_INFO)
{
	npc				= MIN_300_Sylvester;
	nr				=	12;
	condition		= Info_Sylvester_BUYPICKFRIEND_Condition;
	information		= Info_Sylvester_BUYPICKFRIEND_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Hast du eine Spitzhacke für mich?";
	description		= "Máš pro mě nějaký krumpáč?";
};

func int	Info_Sylvester_BUYPICKFRIEND_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Sylvester_CAVE)
	&&	Sylvester_Friend
	{
		return TRUE;
	};
};

func void	Info_Sylvester_BUYPICKFRIEND_Info ()
{
//	AI_Output			(hero, self,"Info_Sylvester_BUYPICKFRIEND_15_01"); //Hast du eine Spitzhacke für mich?
	AI_Output			(hero, self,"Info_Sylvester_BUYPICKFRIEND_15_01"); //Máš pro mě nějaký krumpáč?

	if	(Npc_HasItems(self, ItMw_Pickaxe) >= 2)
	{
//		AI_Output		(self, hero,"Info_Sylvester_BUYPICKFRIEND_03_02"); //Ich hab noch eine Reservehacke, die kannst du haben. Hier nimm!
		AI_Output		(self, hero,"Info_Sylvester_BUYPICKFRIEND_03_02"); //Mám tu ještě jeden záložní krumpáč, na, vezmi si ho!

		B_GiveInvItems	(self, hero,	ItMw_Pickaxe, 	1);
	}
	else
	{
//		AI_Output		(self, hero,"Info_Sylvester_BUYPICKFRIEND_03_03"); //Ich habe nur noch diese eine Hacke. Tut mir leid!
		AI_Output		(self, hero,"Info_Sylvester_BUYPICKFRIEND_03_03"); //Je mi líto, ale mám pouze tento krumpáč.
	};
};


///////////////////////////////////////////////////////////////////////
//	Info BLOODORE
///////////////////////////////////////////////////////////////////////
instance MIN_300_Sylvester_BLOODORE		(C_INFO)
{
	npc		 	= 	MIN_300_Sylvester;
	nr		 	= 	1;
	condition	= 	MIN_300_Sylvester_BLOODORE_Condition;
	information	= 	MIN_300_Sylvester_BLOODORE_Info;
	important	= 	FALSE;
	permanent	= 	FALSE;

//	description	= 	"Ich bin auf der Suche nach Bluterz!";
	description	= 	"Hledám krvavou rudu!";
};

func int MIN_300_Sylvester_BLOODORE_Condition ()
{
	if	Npc_KnowsInfo(hero,PC_Psionic_FINDBLOODORE)
	{
		return TRUE;
	};
};

func void MIN_300_Sylvester_BLOODORE_Info ()
{
//	AI_Output			(hero, self, "MIL_101_BLOODORE_15_01"); //Ich bin auf der Suche nach Bluterz!
	AI_Output			(hero, self, "MIL_101_BLOODORE_15_01"); //Hledám krvavou rudu!
//	AI_Output			(self, hero, "MIL_101_BLOODORE_03_02"); //In der Mine gibt es eine Bluterzader. Allerdings ist dieses besondere Erz sehr selten. Warum willst du das wissen?
	AI_Output			(self, hero, "MIL_101_BLOODORE_03_02"); //V dole je žíla krvavé rudy. Tato ruda je však velice vzácná. Na co ji potřebuješ?
//	AI_Output			(hero, self, "MIL_101_BLOODORE_15_03"); //Ich brauche Bluterz, um einen Runenstein zu gießen.
	AI_Output			(hero, self, "MIL_101_BLOODORE_15_03"); //Potřebuji ji na výrobu runového kamene.
//	AI_Output			(self, hero, "MIL_101_BLOODORE_03_04"); //Damit kenne ich mich nicht aus, aber ich besitze noch ein paar Brocken.
	AI_Output			(self, hero, "MIL_101_BLOODORE_03_04"); //O tom nic nevím, ale stále tu mám pár kousků.
//	AI_Output			(self, hero, "MIL_101_BLOODORE_03_05"); //Ich schlage dir ein Geschäft vor.
	AI_Output			(self, hero, "MIL_101_BLOODORE_03_05"); //Nabízím ti obchod.
//	AI_Output			(hero, self, "MIL_101_BLOODORE_15_06"); //Was für ein Geschäft?
	AI_Output			(hero, self, "MIL_101_BLOODORE_15_06"); //Jaký obchod?
//	AI_Output			(self, hero, "MIL_101_BLOODORE_03_07"); //Ich brauche eine bessere Waffe, eines dieser handlichen Kurzschwerter!
	AI_Output			(self, hero, "MIL_101_BLOODORE_03_07"); //Potřebuji novou zbraň, jeden z těch šikovných krátkých mečů!
//	AI_Output			(self, hero, "MIL_101_BLOODORE_03_08"); //Aber Gotmar verkauft seine Waffen nur an die Miliz.
	AI_Output			(self, hero, "MIL_101_BLOODORE_03_08"); //Ale Gotmar prodává své zbraně pouze milici.
//	AI_Output			(self, hero, "MIL_101_BLOODORE_03_09"); //Wenn du mir ein Kurzschwert besorgst, bekommst du mein Bluterz.
	AI_Output			(self, hero, "MIL_101_BLOODORE_03_09"); //Když mi obstaráš krátký meč, dostaneš mou krvavou rudu.

//	Info_AddChoice	(MIN_300_Sylvester_BLOODORE, "Vergiss es!", MIN_300_Sylvester_BLOODORE_NO );
	Info_AddChoice	(MIN_300_Sylvester_BLOODORE, "Na to zapomeň!", MIN_300_Sylvester_BLOODORE_NO );
//	Info_AddChoice	(MIN_300_Sylvester_BLOODORE, "Ich schau mal, ob ich ein Kurzschwert bekomme", MIN_300_Sylvester_BLOODORE_YES );
	Info_AddChoice	(MIN_300_Sylvester_BLOODORE, "Uvidím, jestli se mi podaří sehnat krátký meč.", MIN_300_Sylvester_BLOODORE_YES );
//	Info_AddChoice	(MIN_300_Sylvester_BLOODORE, "Ich überlege es mir", MIN_300_Sylvester_BLOODORE_MAYBE );
	Info_AddChoice	(MIN_300_Sylvester_BLOODORE, "Budu o tom přemýšlet.", MIN_300_Sylvester_BLOODORE_MAYBE );


};
func void MIN_300_Sylvester_BLOODORE_MAYBE ()
{
//	AI_Output			(hero, self, "MIL_101_BLOODORE_MAYBE_15_01"); //Ich überlege es mir.
	AI_Output			(hero, self, "MIL_101_BLOODORE_MAYBE_15_01"); //Budu o tom přemýšlet.
//	AI_Output			(self, hero, "MIL_101_BLOODORE_MAYBE_03_02"); //Wenn du ein Kurzschwert hast, tausche ich es gegen mein Bluterz.
	AI_Output			(self, hero, "MIL_101_BLOODORE_MAYBE_03_02"); //Pokud ho získáš, vyměním ho s tebou za mojí krvavou rudu.

	Sylvester_Sword		= LOG_RUNNING;

//	B_LogEntry 			(CH1_Bloodore, "Sylvester ist im Besitz von Bluterz. Er überlässt es mir, wenn ich ihm ein Kurzschwert besorge.");
	B_LogEntry 			(CH1_Bloodore, "Sylvester má nějakou krvavou rudu. Přenechá mi ji, když mu přinesu krátký meč.");

	Info_ClearChoices 	(MIN_300_Sylvester_BLOODORE);
};

func void MIN_300_Sylvester_BLOODORE_YES ()
{
//	AI_Output			(hero, self, "MIL_101_BLOODORE_YES_15_01"); //Ich schau mal, ob ich ein Kurzschwert bekomme
	AI_Output			(hero, self, "MIL_101_BLOODORE_YES_15_01"); //Uvidím, jestli se mi podaří sehnat krátký meč.
//	AI_Output			(self, hero, "MIL_101_BLOODORE_YES_03_02"); //Gut, wenn du eins hast, bekommst du mein Bluterz.
	AI_Output			(self, hero, "MIL_101_BLOODORE_YES_03_02"); //Dobře, hned jak ho získáš, přines mi ho a dostaneš mou krvavou rudu.

	Sylvester_Sword		= LOG_RUNNING;

//	B_LogEntry 			(CH1_Bloodore, "Sylvester ist im Besitz von Bluterz. Er überlässt es mir, wenn ich ihm ein Kurzschwert besorge.");
	B_LogEntry 			(CH1_Bloodore, "Sylvester má nějakou krvavou rudu. Přenechá mi ji, když mu přinesu krátký meč.");

	Info_ClearChoices	(MIN_300_Sylvester_BLOODORE);
};

func void MIN_300_Sylvester_BLOODORE_NO ()
{
//	AI_Output			(hero, self, "MIL_101_BLOODORE_NO_15_01"); //Vergiss es!
	AI_Output			(hero, self, "MIL_101_BLOODORE_NO_15_01"); //Na to zapomeň!
//	AI_Output			(self, hero, "MIL_101_BLOODORE_NO_03_02"); //Dann gibt's auch kein Bluterz!
	AI_Output			(self, hero, "MIL_101_BLOODORE_NO_03_02"); //Pak nedostaneš krvavou rudu!

	Sylvester_Sword = LOG_OBSOLETE;

	Info_ClearChoices (MIN_300_Sylvester_BLOODORE);
};

///////////////////////////////////////////////////////////////////////
//	Info SWORD
///////////////////////////////////////////////////////////////////////
instance MIL_101_Sylvester_Sword		(C_INFO)
{
	npc		 = 	MIN_300_Sylvester;
	nr		 = 	23;
	condition	 = 	MIL_101_Sylvester_Sword_Condition;
	information	 = 	MIL_101_Sylvester_Sword_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich habe ein Kurzschwert für dich";
	description	 = 	"Mám tu pro tebe krátký meč.";
};

func int MIL_101_Sylvester_Sword_Condition ()
{
	if	(Sylvester_Sword == LOG_RUNNING)
	&&	Npc_HasItems (hero,ItMw_Shortsword)
	{
		return TRUE;
	};
};
func void MIL_101_Sylvester_Sword_Info ()
{
//	AI_Output			(hero, self, "MIL_101_SWORD_15_01"); //Ich habe ein Kurzschwert für dich.
	AI_Output			(hero, self, "MIL_101_SWORD_15_01"); //Mám tu pro tebe krátký meč.

	B_GiveInvItems		(hero, self, ItMw_Shortsword,1);
	B_GiveInvItems		(self, hero, ItMi_BloodOreNugget,30);

	AI_CreateItemInSlot	(self,"ZS_RIGHTHAND",ItMw_Shortsword);
	AI_PlayAni			(self,"T_1HSINSPECT");
	AI_RemoveItemFromSlot(self,"ZS_RIGHTHAND");

	AI_EquipBestMeleeWeapon (self); //Kurzschwert anlegen

//	AI_Output			(self, hero, "MIL_101_SWORD_03_02"); //Ausgezeichnet. Hier, nimm mein Bluterz. Wenn du noch mehr brauchst, dann sprich mal mit Wylfern.
	AI_Output			(self, hero, "MIL_101_SWORD_03_02"); //Vynikající. Tady, vezmi si tu krvavou rudu. Pokud potřebuješ víc, promluv si s Wylfernem.
//	AI_Output			(self, hero, "MIL_101_SWORD_03_03"); //Er ist Rekrut bei der Miliz und war vorher auch in der Mine.
	AI_Output			(self, hero, "MIL_101_SWORD_03_03"); //Je to rekrut milice a dřív sloužil v dole.

	Npc_RemoveInvItems	(self,ItMi_BloodOreNugget,30);

//	B_LogEntry			(CH1_Bloodore, "Sylvester hat mir sein Bluterz überlassen. Er gab mir noch den Tip Wylfern auch auf Bluterz anzusprechen. Er ist Rekrut in der Miliz und war ebenfalls in der Mine.");
	B_LogEntry			(CH1_Bloodore, "Sylvester mi přenechal svou krvavou rudu. Také mi poradil, abych se zeptal Wylferna na krvavou rudu. Wylfern je rekrutem milice a dříve sloužil v dole.");

	Sylvester_Sword		= LOG_SUCCESS;
};
