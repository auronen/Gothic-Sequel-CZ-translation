# Gothic-Sequel-CZ-translation
Originální německé skripty poskytl VaanaCZ, moc děkujeme!

## Překlad 
Protože překládáme z originálu, tedy z němčiny :de:, doporučil bych zachovat ve skritpech původní německé texty, pro kontrolu. A to tak, že se původní řádek zkopíruje a zakomentuje - na začátek řádku se vloží `//`. Ukázka:
```c++
instance WRK_203_Bromor_TROPHYS		(C_INFO)
{
	npc		 	 = 	WRK_203_Bromor;
	nr		 	 = 	23;
	condition	 = 	WRK_203_Bromor_TROPHYS_Condition;
	information	 = 	WRK_203_Bromor_TROPHYS_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich hörte, du sammelst Trophäen?";
	description	 = 	"Slyšel jsem, že sbíráš trofeje..?";
};

func void WRK_203_Bromor_TROPHYS_Info ()
{
//	AI_Output (hero, self, "WRK_203_TROPHYS_15_01"); //Ich hörte, du sammelst Trophäen?
	AI_Output (hero, self, "WRK_203_TROPHYS_15_01"); //Slyšel jsem, že sbíráš trofeje..?
//	AI_Output (self, hero, "WRK_203_TROPHYS_09_02"); //Das stimmt. Aber nicht dieses Wolfs- und Scavenger Zeug. Davon habe ich schon genug.
	AI_Output (self, hero, "WRK_203_TROPHYS_09_02"); //Ano, tak. Ale ne tyhle cetky z vlků nebo mrchožroutů. Těch už mám až dost.
//	AI_Output (self, hero, "WRK_203_TROPHYS_09_03"); //Aber wenn du mir ein SchattenläuferHorn oder -Fell bringst, dafür zahle ich hundert Silberstücke!
	AI_Output (self, hero, "WRK_203_TROPHYS_09_03"); //Ale kdybys mi přinesl roh nebo kůži stínové šelmy, dal bych ti za ně sto stříbrných!
};
```

## Stav projektu
- [x] Menu
- [ ] Dialogy - `Content\Story\Missions`
- [x] Předměty - `Content\Items`
- [x] Ostatní - soubor `Content\Story\Text.d`
- [x] Fonty

## Snímky ze hry
### Menu
![hlavní nabídka](https://github.com/auronen/Gothic-Sequel-CZ-translation/blob/main/screenshots/Sequel_menu_cz.png?raw=true)

### Titulky
![hlavní nabídka](https://github.com/auronen/Gothic-Sequel-CZ-translation/blob/main/screenshots/Sequel_titulek.png?raw=true)

## Předpokládaný čas vydání
Až to bude, tak to bude™
