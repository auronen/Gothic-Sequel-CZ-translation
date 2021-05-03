
func int b_ramirez_tradecheck(var int num_arrows)
{
	var C_Npc ramirez;
	ramirez = Hlp_GetNpc(wrk_205_ramirez);
	if((Npc_HasItems(hero,itam_arrow) >= num_arrows) && ((num_arrows + GIVEN_ARROWS) <= ENOUGH_ARROWS) && (Npc_HasItems(ramirez,itfo_muttonraw) >= (num_arrows * 2)))
	{
		return 0;
	};
	if(Npc_HasItems(hero,itam_arrow) < num_arrows)
	{
		return 1;
	};
	if((num_arrows + GIVEN_ARROWS) > ENOUGH_ARROWS)
	{
		return 2;
	};
	if(Npc_HasItems(ramirez,itfo_muttonraw) < (num_arrows * 2))
	{
		return 3;
	};
};

func void b_ramirez_proceedtrade(var int num_arrows)
{
	var C_Npc ramirez;
	ramirez = Hlp_GetNpc(wrk_205_ramirez);
	GIVEN_ARROWS += num_arrows;
	B_GiveInvItems(hero,ramirez,itam_arrow,num_arrows);
	B_GiveInvItems(ramirez,hero,itfo_muttonraw,num_arrows * 2);
};

