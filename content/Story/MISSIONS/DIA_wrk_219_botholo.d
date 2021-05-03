
instance WRK_219_BOTHOLO_EXIT(C_Info)
{
	npc = wrk_219_botholo;
	nr = 999;
	condition = wrk_219_botholo_exit_condition;
	information = wrk_219_botholo_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int wrk_219_botholo_exit_condition()
{
	return TRUE;
};

func void wrk_219_botholo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance WRK_219_BOTHOLO_HATE(C_Info)
{
	npc = wrk_219_botholo;
	nr = 12;
	condition = wrk_219_botholo_hate_condition;
	information = wrk_219_botholo_hate_info;
	important = FALSE;
	permanent = TRUE;
	description = "Was gibt'S Neues?";
};


func int wrk_219_botholo_hate_condition()
{
	return TRUE;
};

func void wrk_219_botholo_hate_info()
{
	AI_Output(hero,self,"WRK_219_HATE_15_01");	//Was gibt's Neues?
	AI_Output(self,hero,"WRK_219_HATE_09_02");	//Oh Mann, ich hasse dieses Lager! Ich wollte nicht herkommen. Aber die Orks haben mein Dorf überfallen und wir mussten fliehen.
	AI_Output(self,hero,"WRK_219_HATE_09_03");	//Ich habe es allen gesagt, kommt, hab ich gesagt, wir verlassen das Königreich . Aber keiner hat auf mich gehört.
	AI_Output(self,hero,"WRK_219_HATE_09_04");	//Wir gehen ins Tal von Khorinis, haben sie gesagt. Der König zieht auch dorthin. Dort ist es sicher.
	AI_Output(self,hero,"WRK_219_HATE_09_05");	//Und jetzt? Jetzt sitzen wir hier fest und der König schert sich einen Dreck um uns. Und ich klopfe den ganzen Tag Steine.
	AI_Output(self,hero,"WRK_219_HATE_09_06");	//Glaub mir, niemand hasst dieses Lager mehr als ich.
};

