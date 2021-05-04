func string B_BuildAlchemieRecipeString ( 	var string 	string_prefix, var string 	regName)
{
	var string string_recipe;

	string_recipe = ConcatStrings (string_prefix, "  -=Extrakt=- ");
	string_recipe = ConcatStrings (string_recipe, "1x ");
	string_recipe = ConcatStrings (string_recipe, regName);
	string_recipe = ConcatStrings (string_recipe, ", 1x ");
	string_recipe = ConcatStrings (string_recipe, NAME_OrcLeaf);
	string_recipe = ConcatStrings (string_recipe, ", 1x ");
	string_recipe = ConcatStrings (string_recipe, NAME_Alcohol);

	string_recipe = ConcatStrings (string_recipe, ".  -=Extrakt=- ");
	string_recipe = ConcatStrings (string_recipe, "1x ");
	string_recipe = ConcatStrings (string_recipe, regName);
	string_recipe = ConcatStrings (string_recipe, ", 1x ");
	string_recipe = ConcatStrings (string_recipe, NAME_RavenHerb);
	string_recipe = ConcatStrings (string_recipe, ", 1x ");
	string_recipe = ConcatStrings (string_recipe, NAME_Alcohol);

	string_recipe = ConcatStrings (string_recipe, ".  -=Elixier=- ");
	string_recipe = ConcatStrings (string_recipe, "1x ");
	string_recipe = ConcatStrings (string_recipe, regName);
	string_recipe = ConcatStrings (string_recipe, ", 1x ");
	string_recipe = ConcatStrings (string_recipe, NAME_Nightshade);
	string_recipe = ConcatStrings (string_recipe, ", 1x ");
	string_recipe = ConcatStrings (string_recipe, NAME_Alcohol);
	string_recipe = ConcatStrings (string_recipe, ".");

	return string_recipe;
};
