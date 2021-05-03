
func int b_silveramounttosatisfy_int()
{
	var int int_silver;
	int_silver = self.level * 3;
	return int_silver;
};

func int b_hasplayersilvertosatisfy()
{
	var int int_silver;
	int_silver = b_silveramounttosatisfy_int();
	if(Npc_HasItems(hero,itmi_silver) >= int_silver)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func string b_silveramounttosatisfy_string()
{
	var int int_silver;
	var string string_silver;
	int_silver = b_silveramounttosatisfy_int();
	string_silver = IntToString(int_silver);
	return string_silver;
};

