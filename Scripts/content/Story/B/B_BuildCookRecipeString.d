func string B_BuildCookRecipeString ( 	var string 	string_prefix, var string 	regName)
{
	var string string_recipe;

//	string_recipe = ConcatStrings (string_prefix, "  -=Suppe=- ");
	string_recipe = ConcatStrings (string_prefix, "  POLÉVKA ");
	string_recipe = ConcatStrings (string_recipe, "1x ");
	string_recipe = ConcatStrings (string_recipe, regName);
	string_recipe = ConcatStrings (string_recipe, ", 1x ");
	string_recipe = ConcatStrings (string_recipe, NAME_Loaf);
	string_recipe = ConcatStrings (string_recipe, ", 1x ");
	string_recipe = ConcatStrings (string_recipe, NAME_Salt);

	string_recipe = ConcatStrings (string_recipe, "\n  GULÁŠ ");
	string_recipe = ConcatStrings (string_recipe, "1x ");
	string_recipe = ConcatStrings (string_recipe, regName);
	string_recipe = ConcatStrings (string_recipe, ", 1x ");
	string_recipe = ConcatStrings (string_recipe, NAME_Cheese);
	string_recipe = ConcatStrings (string_recipe, ", 1x ");
	string_recipe = ConcatStrings (string_recipe, NAME_Salt);

	string_recipe = ConcatStrings (string_recipe, "\n  RAGÚ ");
	string_recipe = ConcatStrings (string_recipe, "1x ");
	string_recipe = ConcatStrings (string_recipe, regName);
	string_recipe = ConcatStrings (string_recipe, ", 1x ");
	string_recipe = ConcatStrings (string_recipe, NAME_Ham);
	string_recipe = ConcatStrings (string_recipe, ", 1x ");
	string_recipe = ConcatStrings (string_recipe, NAME_Salt);
	string_recipe = ConcatStrings (string_recipe, ".");

	return string_recipe;
};