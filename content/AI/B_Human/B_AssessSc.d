
func void B_CheckStolenEquipment()
{
	var C_Item melee;
	var C_Item ranged;
	var C_Item armor;
	melee = Npc_GetEquippedMeleeWeapon(other);
	ranged = Npc_GetEquippedRangedWeapon(other);
	armor = Npc_GetEquippedArmor(other);
	PrintDebugNpc(PD_ZS_Check,".B_CheckStolenEquipment");
	if(Npc_OwnedByNpc(melee,self))
	{
		PrintDebugNpc(PD_ZS_Check,"...SC trägt Nahkampf-Waffe des NSCs offen!");
		self.aivar[AIV_WANTEDITEM] = Hlp_GetInstanceID(melee);
		Npc_ClearAIQueue(self);
		C_LookAtNpc(self,other);
		self.aivar[42] = TRUE;
		b_getbackpersonalweapon(self);
		return;
	}
	else if(Npc_OwnedByNpc(ranged,self))
	{
		PrintDebugNpc(PD_ZS_Check,"...SC trägt Fernkampf-Waffe des NSCs offen!");
		self.aivar[AIV_WANTEDITEM] = Hlp_GetInstanceID(ranged);
		Npc_ClearAIQueue(self);
		C_LookAtNpc(self,other);
		self.aivar[42] = TRUE;
		b_getbackpersonalweapon(self);
		return;
	};
	if(self.aivar[42] == TRUE)
	{
		b_getbackpersonalweapon(self);
	};
};

