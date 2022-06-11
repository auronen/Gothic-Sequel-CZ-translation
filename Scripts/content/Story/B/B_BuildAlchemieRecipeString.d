func string B_BuildAlchemieRecipeString ( 	var string 	string_prefix, var string 	regName)
{
	var string string_recipe;

//	string_recipe = ConcatStrings (string_prefix, "  -=Extrakt=- ");
//	string_recipe = ConcatStrings (string_prefix, "\nESENCE ");
	string_recipe = ConcatStrings (string_prefix, "\n");
	string_recipe = ConcatStrings (string_recipe, NAME_Essence);
	string_recipe = ConcatStrings (string_recipe, " ");
	string_recipe = ConcatStrings (string_recipe, "1x ");
	string_recipe = ConcatStrings (string_recipe, regName);
	string_recipe = ConcatStrings (string_recipe, ", 1x ");
	string_recipe = ConcatStrings (string_recipe, NAME_OrcLeaf);
	string_recipe = ConcatStrings (string_recipe, ", 1x ");
	string_recipe = ConcatStrings (string_recipe, NAME_Alcohol);

//	string_recipe = ConcatStrings (string_recipe, ".  -=Extrakt=- ");
//	string_recipe = ConcatStrings (string_recipe, "\nEXTRAKT ");
	string_recipe = ConcatStrings (string_prefix, "\n");
	string_recipe = ConcatStrings (string_recipe, NAME_Extract);
	string_recipe = ConcatStrings (string_recipe, " ");
	string_recipe = ConcatStrings (string_recipe, "1x ");
	string_recipe = ConcatStrings (string_recipe, regName);
	string_recipe = ConcatStrings (string_recipe, ", 1x ");
	string_recipe = ConcatStrings (string_recipe, NAME_RavenHerb);
	string_recipe = ConcatStrings (string_recipe, ", 1x ");
	string_recipe = ConcatStrings (string_recipe, NAME_Alcohol);

//	string_recipe = ConcatStrings (string_recipe, ".  -=Elixier=- ");
//	string_recipe = ConcatStrings (string_recipe, "\nELIXÍR ");
	string_recipe = ConcatStrings (string_prefix, "\n");
	string_recipe = ConcatStrings (string_recipe, NAME_Elixir);
	string_recipe = ConcatStrings (string_recipe, " ");
	string_recipe = ConcatStrings (string_recipe, "1x ");
	string_recipe = ConcatStrings (string_recipe, regName);
	string_recipe = ConcatStrings (string_recipe, ", 1x ");
	string_recipe = ConcatStrings (string_recipe, NAME_Nightshade);
	string_recipe = ConcatStrings (string_recipe, ", 1x ");
	string_recipe = ConcatStrings (string_recipe, NAME_Alcohol);
	string_recipe = ConcatStrings (string_recipe, ".");

	return string_recipe;
};
