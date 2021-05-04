# Gothic-Sequel-CZ-translation
Německé skripty byly dekompilovány z `GOTHIC.DAT`, pomocí [GothicSourcer 3.14](https://worldofplayers.ru/threads/38318/)


## Kde co je
Protože nemáme k dispozici oficiální skripty, ale pouze ty dekompilované, je v nich trošku čurbes. Dialogy se nachází v adresáři `content\Story\MISSIONS` a všechno ostatní, jako jsou hlášky v aréně, předměty a ostatní věci k přeložení se nachází v adresáři `content\_misk_`.

## Překlad 
Protože překládáme z originálu, tedy z němčiny :de:, doporučil bych zachovat ve skritpech původní německé texty pro kontrolu. A to tak, že se původní řádek zkopíruje a zakomentuje - na začátek řádku se vloží `//`. Ukázka:
```c++
func void pc_psionic_halloagain_info()
{
 // AI_Output(self,hero,"PC_Psionic_HALLOAGAIN_23_01");	//Hey, ich dachte du wärst tot!
	AI_Output(self,hero,"PC_Psionic_HALLOAGAIN_23_01");	//Hej, myslel jsem, že jsi mrtvý!
 // AI_Output(hero,self,"PC_Psionic_HALLOAGAIN_15_02");	//Das kommt mir bekannt vor.
	AI_Output(hero,self,"PC_Psionic_HALLOAGAIN_15_02");	//To už jsem někdy slyšel. #Protože už to slyšel od Diega
 // AI_Output(self,hero,"PC_Psionic_HALLOAGAIN_23_03");	//Was ist geschehen?
	AI_Output(self,hero,"PC_Psionic_HALLOAGAIN_23_03");	//Co se stalo?
 // AI_Output(hero,self,"PC_Psionic_HALLOAGAIN_15_04");	//Der Kampf gegen den Schläfer hat mich geschwächt. Das bedeutet ich muss wieder 'ne Menge lernen.
	AI_Output(hero,self,"PC_Psionic_HALLOAGAIN_15_04");	//Boj proti Spáči mě oslabil. To znamená, že se toho budu muset zase hodně naučit.
 // AI_Output(self,hero,"PC_Psionic_HALLOAGAIN_23_05");	//Ich kann dir zeigen, wie du deine magische Kraft steigerst und dir die Kreise der Magie lehren.
	AI_Output(self,hero,"PC_Psionic_HALLOAGAIN_23_05");	//Můžu ti ukázat, jak posílit svou magickou moc a také tě uvést do kruhů magie.
	b_setattitude(self,ATT_FRIENDLY);
};

instance PC_PSIONIC_FORTRESS(C_Info)
{
	npc = PC_Psionic;
	nr = 5;
	condition = pc_psionic_fortress_condition;
	information = pc_psionic_fortress_info;
	important = FALSE;
	permanent = FALSE;
//	description = "Wolltest Du nicht von der Felsenfestung Besitz nehmen?";
	description = "Nechtěl jsi obsadit Horskou penvost?";
};
```

## Stav projektu
- [x] Menu
- [ ] Dialogy - `content\Story\MISSIONS`
- [ ] Předměty - `content\_misk_\*`
- [ ] Ostatní - soubor `content\Story\Text.d` a `content\_misk_\*` 

## Předpokládaný čas vydání
Až to bude, tak to bude™
