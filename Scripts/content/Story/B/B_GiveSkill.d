func int B_GiveSkill(var C_NPC typ, var int TAL, var int NEW_Wert, var int LP_Cost) //return 1
{
	// ---------- Umwandeln von var in const
	var int TAL_Wert;
	if 		(TAL == NPC_TALENT_1H)			{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_1H		);	}
	else if (TAL == NPC_TALENT_2H)			{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_2H		);	}
	else if (TAL == NPC_TALENT_STAFF)		{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_STAFF		);	}
	else if (TAL == NPC_TALENT_BOW)			{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_BOW		);	}
	else if (TAL == NPC_TALENT_CROSSBOW)	{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_CROSSBOW	);	}
	else if (TAL == NPC_TALENT_PICKLOCK)	{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_PICKLOCK	);	}
	else if (TAL == NPC_TALENT_PICKPOCKET)	{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_PICKPOCKET);	}
	else if (TAL == NPC_TALENT_MAGE)		{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_MAGE		);	}
	else if (TAL == NPC_TALENT_SNEAK)		{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_SNEAK		);	}
	else if (TAL == NPC_TALENT_SMITH)		{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_SMITH		);	}
	else if (TAL == NPC_TALENT_COOK)		{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_COOK		);	}
	else if (TAL == NPC_TALENT_ACROBAT)		{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_ACROBAT	);	}
	else if (TAL == NPC_TALENT_ALCHEMY)		{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_ALCHEMY	);	}
	else if (TAL == NPC_TALENT_THAUMATURGY)	{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_THAUMATURGY);	}
	else if (TAL == NPC_TALENT_BOWMAKER)	{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_BOWMAKER	);	};

	// ----------- Bedingungen/LP checken, dann ggf. vergeben
	if ((TAL_Wert+1) == NEW_Wert)
	{
		if (typ.lp >= LP_cost)
		{
			typ.lp = typ.lp - LP_cost;

			if (tal == NPC_TALENT_1H)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_1H, NEW_Wert);
				Npc_SetTalentValue(typ, NPC_TALENT_1H, Npc_GetTalentValue(typ, NPC_TALENT_1H)+5);
//				AI_PrintScreen	(self, "Lerne: Kampf mit Einhandwaffen", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
				AI_PrintScreen	(self, "Nau??il jsem se bojovat s jednoru??n??mi zbran??mi", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
				return 1;
			}
			else if (tal == NPC_TALENT_2H)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_2H, NEW_Wert);
				Npc_SetTalentValue(typ, NPC_TALENT_2H, Npc_GetTalentValue(typ, NPC_TALENT_2H)+5);
//				AI_PrintScreen	(self, "Lerne: Kampf mit Zweihandwaffen", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
				AI_PrintScreen	(self, "Nau??il jsem se bojovat s obouru??n??mi zbran??mi", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
				return 1;
			}
			else if (tal == NPC_TALENT_STAFF)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_STAFF, NEW_Wert);
				Npc_SetTalentValue(typ, NPC_TALENT_STAFF, Npc_GetTalentValue(typ, NPC_TALENT_STAFF)+5);
//				AI_PrintScreen	(self, "Lerne: Kampf mit Stabwaffe", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
				AI_PrintScreen	(self, "Nau??il jsem se bojovat s bojov??mi holemi", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
				return 1;
			}
			else if (tal == NPC_TALENT_BOW)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_BOW, NEW_Wert);
				Npc_SetTalentValue(typ, NPC_TALENT_BOW, Npc_GetTalentValue(typ, NPC_TALENT_BOW)+15);
//				AI_PrintScreen	(self, "Lerne: Bogenschie??en", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
				AI_PrintScreen	(self, "Nau??il jsem se st????let z luku", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
				return 1;
			}
			else if (tal == NPC_TALENT_CROSSBOW)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_CROSSBOW, NEW_Wert);
				Npc_SetTalentValue(typ, NPC_TALENT_CROSSBOW, Npc_GetTalentValue(typ, NPC_TALENT_CROSSBOW)+20);
//				AI_PrintScreen	(self, "Lerne: Armbrustschie??en", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
				AI_PrintScreen	(self, "Nau??il jsem se st????let z ku??e", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
				return 1;
			}
			else if (tal == NPC_TALENT_PICKLOCK)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_PICKLOCK, NEW_Wert);
				if (NEW_Wert == 1)
				{
					Npc_SetTalentValue(typ, NPC_TALENT_PICKLOCK, 60);
//					AI_PrintScreen	(self, "Lerne: Schl??sser knacken", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
					AI_PrintScreen	(self, "Nau??il jsem se otev??rat z??mky", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
				}
				else
				{
					Npc_SetTalentValue(typ, NPC_TALENT_PICKLOCK, 95);
//					AI_PrintScreen	(self, "Steigere: Schl??sser knacken", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
					AI_PrintScreen	(self, "Zlep??il jsem se v otev??r??n?? z??mk??", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
				};
				return 1;
			}
			else if (tal == NPC_TALENT_PICKPOCKET)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_PICKPOCKET, NEW_Wert);
				if (NEW_Wert == 1)
				{
					Npc_SetTalentValue(typ, NPC_TALENT_PICKPOCKET, 60);
//					AI_PrintScreen	(self, "Lerne: Taschendiebstahl", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
					AI_PrintScreen	(self, "Nau??il jsem se vyb??rat kapsy", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
				}
				else
				{
					Npc_SetTalentValue(typ, NPC_TALENT_PICKPOCKET, 95);
//					AI_PrintScreen	(self, "Steigere: Taschendiebstahl", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
					AI_PrintScreen	(self, "Zlep??il jsem se ve vyb??r??n?? kapes", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
				};
				return 1;
			}
			else if (tal == NPC_TALENT_MAGE)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_MAGE, NEW_Wert);
//				AI_PrintScreen	(self, "Lerne: N??chster Kreis der Magie", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
				AI_PrintScreen	(self, "Nau??il jsem se dal???? kruh magie", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
				return 1;
			}
			else if (tal == NPC_TALENT_SNEAK)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_SNEAK, NEW_Wert);
//				AI_PrintScreen	(self, "Lerne: Schleichen", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
				AI_PrintScreen	(self, "Nau??il jsem se pl????it", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
				return 1;
			}
			else if (tal == NPC_TALENT_SMITH)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_SMITH, NEW_Wert);
				if (NEW_Wert == 1)
				{
//					AI_PrintScreen	(self, "Lerne: Schmieden", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
					AI_PrintScreen	(self, "Nau??il jsem se kov????sk??mu ??emeslu", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
					B_LearnShortsword();
				}
				else
				{
//					AI_PrintScreen	(self, "Steigere: Schmieden", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
					AI_PrintScreen	(self, "Zlep??il jsem se v kova??in??", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
				};

				return 1;
			}
			else if (tal == NPC_TALENT_COOK)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_COOK, NEW_Wert);
				if (NEW_Wert == 1)
				{
//					AI_PrintScreen	(self, "Lerne: Kochen", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
					AI_PrintScreen	(self, "Nau??il jsem se va??it", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
				}
				else
				{
//					AI_PrintScreen	(self, "Steigere: Kochen", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
					AI_PrintScreen	(self, "Zlep??il jsem se ve va??en??", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
				};

				return 1;
			}
			else if (tal == NPC_TALENT_ACROBAT)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_ACROBAT, NEW_Wert);
//				AI_PrintScreen	(self, "Lerne: Akrobatik", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
				AI_PrintScreen	(self, "Nau??il jsem se akrobacii", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
				return 1;
			}
			else if ( tal == NPC_TALENT_ALCHEMY)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_ALCHEMY, NEW_Wert);
				if (NEW_Wert == 1)
				{
//					AI_PrintScreen	(self, "Lerne: Alchemie", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
					AI_PrintScreen	(self, "Nau??il jsem se alchymii", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
				}
				else
				{
//					AI_PrintScreen	(self, "Steigere: Alchemie", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
					AI_PrintScreen	(self, "Zlep??il jsem se v alchymii", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
				};
				return 1;
			}
			else if ( tal == NPC_TALENT_THAUMATURGY)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_THAUMATURGY, NEW_Wert);
				if (NEW_Wert == 1)
				{
//					AI_PrintScreen	(self, "Lerne: Runen erschaffen", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
					AI_PrintScreen	(self, "Nau??il jsem se vytv????et magick?? runy", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
				}
				else
				{
	//				AI_PrintScreen	(self, "Steigere: Runen erschaffen", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
					AI_PrintScreen	(self, "Zlep??il jsem se ve v??rob?? magick??ch run", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
				};
				return 1;
			}
			else if ( tal == NPC_TALENT_BOWMAKER)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_BOWMAKER, NEW_Wert);
				if (NEW_Wert == 1)
				{
//					AI_PrintScreen	(self, "Lerne: Bogenmachen", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
					AI_PrintScreen	(self, "Nau??il jsem se vyr??b??t luky", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
				}
				else
				{
//					AI_PrintScreen	(self, "Steigere: Bogenmachen", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
					AI_PrintScreen	(self, "Zlep??il jsem se ve v??rob?? luk??", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
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
//			AI_PrintScreen	(self, "Zu wenig Lernpunkte!", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
			AI_PrintScreen	(self, "M??lo zku??enostn??ch bod??!", -1,-1,FONT_OLD_BIG,2, TEXT_COLOR_WHITE);
			B_Say (self, other, "$NOLEARNNOPOINTS");
			return 0;
		};
	}
	else // NICHT eine Stufe davor
	{
		if (TAL_Wert >= NEW_Wert)
		{
//			B_Say (self, other, "$NOLEARNYOUREBETTER"); //Du bist jetzt schon besser!
			B_Say (self, other, "$NOLEARNYOUREBETTER"); //Zlep??uje?? se!
			return 0;
		}
		else if ((TAL_Wert+1) < NEW_Wert) //d.h. i.d.R. TAL_Wert=2 und NEW_Wert=0, au??er bei TALENT_MAGE
		{
//			B_Say (self, other, "$NOLEARNYOUALREADYKNOW"); //Du mu??t erst Fortgeschritten sein, bevor du ein Meister werden kannst!
			B_Say (self, other, "$NOLEARNYOUALREADYKNOW"); //Mus???? b??t nejd????ve pokro??il??, aby ses stal mistrem!
			return 0;
		};
	};
};























