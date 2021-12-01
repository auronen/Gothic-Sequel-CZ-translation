/*( (amb_self.npctype==NPCTYPE_AMBIENT) // Ambient GIL_WORKER (Abhänger), GIL_HEALER, GIL_POS, GIL_BEGGAR, GIL_THF
	||(amb_self.npctype==NPCTYPE_GUARD)// GIL_MILITIA (Lagerwachen)
	|| (amb_self.npctype==NPCTYPE_WRK_AMBIENT)) // GIL_WORKER (Arbeiter im Sinne des Wortes)
	||(amb_self.npctype==NPCTYPE_TRD_AMBIENT) ) // GIL_WORKER (Händler im Lager)
*/


FUNC VOID B_AssignAmbientInfos(var c_NPC amb_self)
{


	if 	(  (amb_self.npctype == NPCTYPE_AMBIENT)
		|| (amb_self.npctype == NPCTYPE_GUARD) )
		{	
		if (amb_self.guild == GIL_WORKER) 
		{
	   		if (amb_self.voice == 1) 
			{
				B_AssignAmbientInfos_Wrk_1(amb_self);// Malocher
			}
	   		else if (amb_self.voice == 2) 
			{
				B_AssignAmbientInfos_Wrk_2(amb_self);// misstrauisch
			}
			else if (amb_self.voice == 6) 
			{
				B_AssignAmbientInfos_Wrk_6(amb_self);// Raufbold
			}
			else if (amb_self.voice == 11) 
			{
				B_AssignAmbientInfos_Wrk_11(amb_self);// Profi // eventuell noch in stimme 8 ändern?
			};
		}
		else if (amb_self.guild == GIL_MILITIA) // Nur die Lager Miliz
		{
			if (amb_self.voice == 4)
			{
				B_AssignAmbientInfos_Mil_4(amb_self); // alter Sack
			}
			else if (amb_self.voice == 7)
			{
				B_AssignAmbientInfos_Mil_7(amb_self);//Sadist
			}
			else if (amb_self.voice == 6)
			{
				B_AssignAmbientInfos_Mil_6(amb_self);// Raufbold
			}
			else if (amb_self.voice == 9)
			{
				B_AssignAmbientInfos_Mil_9(amb_self);	// brummig
			};
		}
		else if (amb_self.guild == GIL_THIEF)
		{
			if (amb_self.voice == 5)
			{
				B_AssignAmbientInfos_Thf_5(amb_self);// lebenskünstler, offen
			}
			else if (amb_self.voice == 10)
			{
				B_AssignAmbientInfos_Thf_10(amb_self); //still und heimlich
			}
			else if (amb_self.voice == 11)
			{
				B_AssignAmbientInfos_Thf_11(amb_self);// Profi
			};
		
		};
	}
	if ( (amb_self.npctype == NPCTYPE_MINE_AMBIENT)
	||   (amb_self.npctype == NPCTYPE_MINE_GUARD) ) //Alle Ambient-NPCs in den Minen
	{	
		if (amb_self.guild == GIL_MINER)
		{
			if (amb_self.voice == 1)
			{
				B_AssignAmbientInfos_Mine_Min_1(amb_self);
			}
			else if (amb_self.voice == 4)
			{
				B_AssignAmbientInfos_Mine_Min_4(amb_self);
			}
			else if (amb_self.voice == 9)
			{
				B_AssignAmbientInfos_Mine_Min_9(amb_self);
			};
		}
		else if (amb_self.guild == GIL_MILITIA) // Die Minen Miliz
		{
			if (amb_self.voice == 4)
			{
				B_AssignAmbientInfos_Mine_Mil_4(amb_self);
			}
			else if (amb_self.voice == 7)
			{
				B_AssignAmbientInfos_Mine_Mil_7(amb_self);
			}
			else if (amb_self.voice == 8)
			{
				B_AssignAmbientInfos_Mine_Mil_8(amb_self);
			};
		};
	}
	if  (amb_self.npctype == NPCTYPE_OW_AMBIENT) // versteckte Flüchtlinge in der Oberwelt, bisher nur GIL_WORKER , andere Planung?? M.F.
	{	
		if (amb_self.guild == GIL_WORKER)
		{
			if (amb_self.voice == 2)
			{
				B_AssignAmbientInfos_OW_Wrk_2(amb_self);
			}
			else if (amb_self.voice == 3)
			{
				B_AssignAmbientInfos_OW_Wrk_3(amb_self);
			}
			else if (amb_self.voice == 4)
			{
				B_AssignAmbientInfos_OW_Wrk_4(amb_self);
			};
		};
	};	
};



