
func int B_GiveSkill(var C_Npc typ,var int tal,var int NEW_Wert,var int LP_Cost)
{
	var int TAL_Wert;
	if(tal == NPC_TALENT_1H)
	{
		TAL_Wert = Npc_GetTalentSkill(typ,NPC_TALENT_1H);
	}
	else if(tal == NPC_TALENT_2H)
	{
		TAL_Wert = Npc_GetTalentSkill(typ,NPC_TALENT_2H);
	}
	else if(tal == NPC_TALENT_STAFF)
	{
		TAL_Wert = Npc_GetTalentSkill(typ,NPC_TALENT_STAFF);
	}
	else if(tal == NPC_TALENT_BOW)
	{
		TAL_Wert = Npc_GetTalentSkill(typ,NPC_TALENT_BOW);
	}
	else if(tal == NPC_TALENT_CROSSBOW)
	{
		TAL_Wert = Npc_GetTalentSkill(typ,NPC_TALENT_CROSSBOW);
	}
	else if(tal == NPC_TALENT_PICKLOCK)
	{
		TAL_Wert = Npc_GetTalentSkill(typ,NPC_TALENT_PICKLOCK);
	}
	else if(tal == NPC_TALENT_PICKPOCKET)
	{
		TAL_Wert = Npc_GetTalentSkill(typ,NPC_TALENT_PICKPOCKET);
	}
	else if(tal == NPC_TALENT_MAGE)
	{
		TAL_Wert = Npc_GetTalentSkill(typ,NPC_TALENT_MAGE);
	}
	else if(tal == NPC_TALENT_SNEAK)
	{
		TAL_Wert = Npc_GetTalentSkill(typ,NPC_TALENT_SNEAK);
	}
	else if(tal == NPC_TALENT_SMITH)
	{
		TAL_Wert = Npc_GetTalentSkill(typ,NPC_TALENT_SMITH);
	}
	else if(tal == NPC_TALENT_COOK)
	{
		TAL_Wert = Npc_GetTalentSkill(typ,NPC_TALENT_COOK);
	}
	else if(tal == NPC_TALENT_ACROBAT)
	{
		TAL_Wert = Npc_GetTalentSkill(typ,NPC_TALENT_ACROBAT);
	}
	else if(tal == NPC_TALENT_ALCHEMY)
	{
		TAL_Wert = Npc_GetTalentSkill(typ,NPC_TALENT_ALCHEMY);
	}
	else if(tal == NPC_TALENT_THAUMATURGY)
	{
		TAL_Wert = Npc_GetTalentSkill(typ,NPC_TALENT_THAUMATURGY);
	}
	else if(tal == NPC_TALENT_BOWMAKER)
	{
		TAL_Wert = Npc_GetTalentSkill(typ,NPC_TALENT_BOWMAKER);
	};
	if((TAL_Wert + 1) == NEW_Wert)
	{
		if(typ.lp >= LP_Cost)
		{
			typ.lp = typ.lp - LP_Cost;
			if(tal == NPC_TALENT_1H)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_1H,NEW_Wert);
				Npc_SetTalentValue(typ,NPC_TALENT_1H,Npc_GetTalentValue(typ,NPC_TALENT_1H) + 5);
				ai_printscreen(self,"Lerne: Kampf mit Einhandwaffen",-1,-1,FONT_OLD_BIG,2,TEXT_COLOR_WHITE);
				return 1;
			}
			else if(tal == NPC_TALENT_2H)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_2H,NEW_Wert);
				Npc_SetTalentValue(typ,NPC_TALENT_2H,Npc_GetTalentValue(typ,NPC_TALENT_2H) + 5);
				ai_printscreen(self,"Lerne: Kampf mit Zweihandwaffen",-1,-1,FONT_OLD_BIG,2,TEXT_COLOR_WHITE);
				return 1;
			}
			else if(tal == NPC_TALENT_STAFF)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_STAFF,NEW_Wert);
				Npc_SetTalentValue(typ,NPC_TALENT_STAFF,Npc_GetTalentValue(typ,NPC_TALENT_STAFF) + 5);
				ai_printscreen(self,"Lerne: Kampf mit Stabwaffe",-1,-1,FONT_OLD_BIG,2,TEXT_COLOR_WHITE);
				return 1;
			}
			else if(tal == NPC_TALENT_BOW)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_BOW,NEW_Wert);
				Npc_SetTalentValue(typ,NPC_TALENT_BOW,Npc_GetTalentValue(typ,NPC_TALENT_BOW) + 15);
				ai_printscreen(self,"Lerne: Bogenschießen",-1,-1,FONT_OLD_BIG,2,TEXT_COLOR_WHITE);
				return 1;
			}
			else if(tal == NPC_TALENT_CROSSBOW)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_CROSSBOW,NEW_Wert);
				Npc_SetTalentValue(typ,NPC_TALENT_CROSSBOW,Npc_GetTalentValue(typ,NPC_TALENT_CROSSBOW) + 20);
				ai_printscreen(self,"Lerne: Armbrustschießen",-1,-1,FONT_OLD_BIG,2,TEXT_COLOR_WHITE);
				return 1;
			}
			else if(tal == NPC_TALENT_PICKLOCK)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_PICKLOCK,NEW_Wert);
				if(NEW_Wert == 1)
				{
					Npc_SetTalentValue(typ,NPC_TALENT_PICKLOCK,60);
					ai_printscreen(self,"Lerne: Schlösser knacken",-1,-1,FONT_OLD_BIG,2,TEXT_COLOR_WHITE);
				}
				else
				{
					Npc_SetTalentValue(typ,NPC_TALENT_PICKLOCK,95);
					ai_printscreen(self,"Steigere: Schlösser knacken",-1,-1,FONT_OLD_BIG,2,TEXT_COLOR_WHITE);
				};
				return 1;
			}
			else if(tal == NPC_TALENT_PICKPOCKET)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_PICKPOCKET,NEW_Wert);
				if(NEW_Wert == 1)
				{
					Npc_SetTalentValue(typ,NPC_TALENT_PICKPOCKET,60);
					ai_printscreen(self,"Lerne: Taschendiebstahl",-1,-1,FONT_OLD_BIG,2,TEXT_COLOR_WHITE);
				}
				else
				{
					Npc_SetTalentValue(typ,NPC_TALENT_PICKPOCKET,95);
					ai_printscreen(self,"Steigere: Taschendiebstahl",-1,-1,FONT_OLD_BIG,2,TEXT_COLOR_WHITE);
				};
				return 1;
			}
			else if(tal == NPC_TALENT_MAGE)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_MAGE,NEW_Wert);
				ai_printscreen(self,"Lerne: Nächster Kreis der Magie",-1,-1,FONT_OLD_BIG,2,TEXT_COLOR_WHITE);
				return 1;
			}
			else if(tal == NPC_TALENT_SNEAK)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_SNEAK,NEW_Wert);
				ai_printscreen(self,"Lerne: Schleichen",-1,-1,FONT_OLD_BIG,2,TEXT_COLOR_WHITE);
				return 1;
			}
			else if(tal == NPC_TALENT_SMITH)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_SMITH,NEW_Wert);
				if(NEW_Wert == 1)
				{
					ai_printscreen(self,"Lerne: Schmieden",-1,-1,FONT_OLD_BIG,2,TEXT_COLOR_WHITE);
					b_learnshortsword();
				}
				else
				{
					ai_printscreen(self,"Steigere: Schmieden",-1,-1,FONT_OLD_BIG,2,TEXT_COLOR_WHITE);
				};
				return 1;
			}
			else if(tal == NPC_TALENT_COOK)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_COOK,NEW_Wert);
				if(NEW_Wert == 1)
				{
					ai_printscreen(self,"Lerne: Kochen",-1,-1,FONT_OLD_BIG,2,TEXT_COLOR_WHITE);
				}
				else
				{
					ai_printscreen(self,"Steigere: Kochen",-1,-1,FONT_OLD_BIG,2,TEXT_COLOR_WHITE);
				};
				return 1;
			}
			else if(tal == NPC_TALENT_ACROBAT)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_ACROBAT,NEW_Wert);
				ai_printscreen(self,"Lerne: Akrobatik",-1,-1,FONT_OLD_BIG,2,TEXT_COLOR_WHITE);
				return 1;
			}
			else if(tal == NPC_TALENT_ALCHEMY)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_ALCHEMY,NEW_Wert);
				if(NEW_Wert == 1)
				{
					ai_printscreen(self,"Lerne: Alchemie",-1,-1,FONT_OLD_BIG,2,TEXT_COLOR_WHITE);
				}
				else
				{
					ai_printscreen(self,"Steigere: Alchemie",-1,-1,FONT_OLD_BIG,2,TEXT_COLOR_WHITE);
				};
				return 1;
			}
			else if(tal == NPC_TALENT_THAUMATURGY)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_THAUMATURGY,NEW_Wert);
				if(NEW_Wert == 1)
				{
					ai_printscreen(self,"Lerne: Runen erschaffen",-1,-1,FONT_OLD_BIG,2,TEXT_COLOR_WHITE);
				}
				else
				{
					ai_printscreen(self,"Steigere: Runen erschaffen",-1,-1,FONT_OLD_BIG,2,TEXT_COLOR_WHITE);
				};
				return 1;
			}
			else if(tal == NPC_TALENT_BOWMAKER)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_BOWMAKER,NEW_Wert);
				if(NEW_Wert == 1)
				{
					ai_printscreen(self,"Lerne: Bogenmachen",-1,-1,FONT_OLD_BIG,2,TEXT_COLOR_WHITE);
				}
				else
				{
					ai_printscreen(self,"Steigere: Bogenmachen",-1,-1,FONT_OLD_BIG,2,TEXT_COLOR_WHITE);
				};
				return 1;
			}
			else
			{
				return 0;
			};
		}
		else
		{
			ai_printscreen(self,"Zu wenig Lernpunkte!",-1,-1,FONT_OLD_BIG,2,TEXT_COLOR_WHITE);
			B_Say(self,other,"$NOLEARNNOPOINTS");
			return 0;
		};
	}
	else if(TAL_Wert >= NEW_Wert)
	{
		B_Say(self,other,"$NOLEARNYOUREBETTER");
		return 0;
	}
	else if((TAL_Wert + 1) < NEW_Wert)
	{
		B_Say(self,other,"$NOLEARNYOUALREADYKNOW");
		return 0;
	};
};

