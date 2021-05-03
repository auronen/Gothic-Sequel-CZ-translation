
func void b_exchangememoryattitude()
{
	var string string_npcname;
	self.aivar[36] = AIV_NODEED;
	self.aivar[AIV_BEENATTACKED] = AIV_NODEED;
	b_setattitude(self,ATT_NEUTRAL);
	string_npcname = self.name[0];
	string_npcname = ConcatStrings(string_npcname," nimmt sich ");
	string_npcname = ConcatStrings(string_npcname,b_silveramounttosatisfy_string());
	string_npcname = ConcatStrings(string_npcname," Silber!");
	printscreencolored(string_npcname,-1,_YPOS_MESSAGE_GIVEN,FONT_OLD_SMALL,_TIME_MESSAGE_GIVEN,TEXT_COLOR_YELLOW);
	CreateInvItems(self,itmi_silver,b_silveramounttosatisfy_int());
	Npc_RemoveInvItems(other,itmi_silver,b_silveramounttosatisfy_int());
	b_guilddeassigntheft();
};

