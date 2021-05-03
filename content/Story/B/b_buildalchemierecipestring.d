
func string b_buildalchemierecipestring(var string string_prefix,var string regname)
{
	var string string_recipe;
	string_recipe = ConcatStrings(string_prefix,"  -=Extrakt=- ");
	string_recipe = ConcatStrings(string_recipe,"1x ");
	string_recipe = ConcatStrings(string_recipe,regname);
	string_recipe = ConcatStrings(string_recipe,", 1x ");
	string_recipe = ConcatStrings(string_recipe,NAME_ORCLEAF);
	string_recipe = ConcatStrings(string_recipe,", 1x ");
	string_recipe = ConcatStrings(string_recipe,NAME_ALCOHOL);
	string_recipe = ConcatStrings(string_recipe,".  -=Extrakt=- ");
	string_recipe = ConcatStrings(string_recipe,"1x ");
	string_recipe = ConcatStrings(string_recipe,regname);
	string_recipe = ConcatStrings(string_recipe,", 1x ");
	string_recipe = ConcatStrings(string_recipe,NAME_RAVENHERB);
	string_recipe = ConcatStrings(string_recipe,", 1x ");
	string_recipe = ConcatStrings(string_recipe,NAME_ALCOHOL);
	string_recipe = ConcatStrings(string_recipe,".  -=Elixier=- ");
	string_recipe = ConcatStrings(string_recipe,"1x ");
	string_recipe = ConcatStrings(string_recipe,regname);
	string_recipe = ConcatStrings(string_recipe,", 1x ");
	string_recipe = ConcatStrings(string_recipe,NAME_NIGHTSHADE);
	string_recipe = ConcatStrings(string_recipe,", 1x ");
	string_recipe = ConcatStrings(string_recipe,NAME_ALCOHOL);
	string_recipe = ConcatStrings(string_recipe,".");
	return string_recipe;
};

