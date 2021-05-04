
func void B_Kapitelwechsel(var int new_chapter)
{
	if(chapter == new_chapter)
	{
		return;
	};
	chapter = new_chapter;
	if(new_chapter == 1)
	{
		PrintDebugNpc(PD_MISSION,"---=== DAS ERSTE KAPITEL ===---");
		//IntroduceChapter("Kapitel 1","Die Rückkehr","chapter1.tga","levelup.wav",5000);
		IntroduceChapter("Kapitola 1","Návrat","chapter1.tga","levelup.wav",5000);
		SUBCHAPTER = CH1_START;
		b_give_agon_chapteritems(new_chapter);
		b_give_gerion_chapteritems(new_chapter);
		b_give_gotmar_chapterweapons(new_chapter);
		b_give_helvegor_chapteritems(new_chapter);
		b_give_isgar_chapteritems(new_chapter);
		b_give_lakarus_chapteritems(new_chapter);
	};
	if(new_chapter == 2)
	{
		PrintDebugNpc(PD_MISSION,"---=== DAS ZWEITE KAPITEL ===---");
		IntroduceChapter("Kapitola 2","Odchod","chapter2.tga","levelup.wav",5000);
		SUBCHAPTER = CH2_START;
		b_give_agon_chapteritems(new_chapter);
		b_give_gerion_chapteritems(new_chapter);
		b_give_gotmar_chapterweapons(new_chapter);
		b_give_helvegor_chapteritems(new_chapter);
		b_give_isgar_chapteritems(new_chapter);
		b_give_lakarus_chapteritems(new_chapter);
	};
};

