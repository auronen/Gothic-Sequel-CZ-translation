
func string b_buildcookrecipestring(var string string_prefix,var string regname)
{
	var string string_recipe;
	string_recipe = ConcatStrings(string_prefix,"  -=Suppe=- ");
	string_recipe = ConcatStrings(string_recipe,"1x ");
	string_recipe = ConcatStrings(string_recipe,regname);
	string_recipe = ConcatStrings(string_recipe,", 1x ");
	string_recipe = ConcatStrings(string_recipe,NAME_LOAF);
	string_recipe = ConcatStrings(string_recipe,", 1x ");
	string_recipe = ConcatStrings(string_recipe,NAME_SALT);
	string_recipe = ConcatStrings(string_recipe,".  -=Eintopf=- ");
	string_recipe = ConcatStrings(string_recipe,"1x ");
	string_recipe = ConcatStrings(string_recipe,regname);
	string_recipe = ConcatStrings(string_recipe,", 1x ");
	string_recipe = ConcatStrings(string_recipe,NAME_CHEESE);
	string_recipe = ConcatStrings(string_recipe,", 1x ");
	string_recipe = ConcatStrings(string_recipe,NAME_SALT);
	string_recipe = ConcatStrings(string_recipe,".  -=Ragout=- ");
	string_recipe = ConcatStrings(string_recipe,"1x ");
	string_recipe = ConcatStrings(string_recipe,regname);
	string_recipe = ConcatStrings(string_recipe,", 1x ");
	string_recipe = ConcatStrings(string_recipe,NAME_HAM);
	string_recipe = ConcatStrings(string_recipe,", 1x ");
	string_recipe = ConcatStrings(string_recipe,NAME_SALT);
	string_recipe = ConcatStrings(string_recipe,".");
	return string_recipe;
};

