
instance PC_Nyul(Npc_Default)
{
	name[0] = "PC_Nyul";
	npcType = npctype_main;
	guild = GIL_None;
	level = 10;
	voice = 15;
	id = 0;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 50;
	attribute[ATR_MANA] = 50;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
	EquipItem(self,itrw_longbow);
	CreateInvItem(self,itrw_lightcrossbow);
	CreateInvItems(self,itam_arrow,100);
	CreateInvItems(self,itam_bolt,100);
	CreateInvItem(self,ebr_armor_h2);
	CreateInvItem(self,itar_runelight);
	CreateInvItem(self,itar_runefirebolt);
	CreateInvItem(self,itar_runefireball);
	CreateInvItem(self,itar_runefirestorm);
	CreateInvItem(self,itar_runefirerain);
	CreateInvItem(self,itar_runeteleport1);
	CreateInvItem(self,itar_runeteleport2);
	CreateInvItem(self,itar_runeteleport3);
	CreateInvItems(self,ItArScrollTeleport4,20);
	CreateInvItem(self,itar_runeteleport5);
	CreateInvItem(self,itar_runeheal);
	CreateInvItem(self,itar_runechainlightning);
	CreateInvItem(self,itar_runethunderbolt);
	CreateInvItem(self,itar_runethunderball);
	CreateInvItem(self,itar_runeicecube);
	CreateInvItem(self,itar_runeicewave);
	CreateInvItem(self,itar_runedestroyundead);
	CreateInvItems(self,itar_scrolltrfbloodfly,20);
	CreateInvItems(self,itar_scrolltrfcrawler,20);
	CreateInvItems(self,itar_scrolltrflurker,20);
	CreateInvItems(self,itar_scrolltrfmeatbug,20);
	CreateInvItems(self,itar_scrolltrfmolerat,20);
	CreateInvItems(self,itar_scrolltrforcdog,20);
	CreateInvItems(self,itar_scrolltrfscavenger,20);
	CreateInvItems(self,itar_scrolltrfshadowbeast,20);
	CreateInvItems(self,itar_scrolltrfsnapper,20);
	CreateInvItems(self,itar_scrolltrfwaran,20);
	CreateInvItems(self,itar_scrolltrfwolf,20);
	CreateInvItems(self,itar_scrollsummondemon,20);
	CreateInvItems(self,itar_scrollsummonskeletons,20);
	CreateInvItems(self,itar_scrollsummongolem,20);
	CreateInvItems(self,itar_scrollarmyofdarkness,20);
	CreateInvItem(self,itar_runewindfist);
	CreateInvItem(self,itar_runestormfist);
	CreateInvItem(self,itar_runetelekinesis);
	CreateInvItem(self,itar_runecharm);
	CreateInvItem(self,itar_runesleep);
	CreateInvItem(self,itar_runepyrokinesis);
	CreateInvItem(self,itar_runecontrol);
	CreateInvItem(self,itar_runebreathofdeath);
	CreateInvItems(self,itar_scrollfear,20);
	CreateInvItems(self,itar_scrollberzerk,20);
	CreateInvItems(self,itar_scrollshrink,20);
	CreateInvItems(self,itfo_ham,20);
	CreateInvItems(self,itfo_beer,20);
	CreateInvItems(self,itke_lockpick,20);
	CreateInvItems(self,ItLsTorch,20);
	CreateInvItems(self,itmi_silver,2000);
	CreateInvItem(self,itwr_worldmap);
	CreateInvItem(self,itwr_phoenix1);
	CreateInvItem(self,itwr_phoenix2);
	CreateInvItem(self,itwr_phoenix3);
	CreateInvItem(self,itwr_phoenix4);
	CreateInvItem(self,itwr_phoenix5);
	CreateInvItem(self,itwr_phoenix6);
	CreateInvItem(self,itwr_phoenix7);
	CreateInvItem(self,itwr_phoenix8);
	CreateInvItems(self,ItFo_Potion_Mana_01,10);
	CreateInvItems(self,ItFo_Potion_Health_01,10);
};

