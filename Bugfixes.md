# Bug fixes
Even though we didn't intend to fix any bugs (since the game is not finished), we did it anyway.

## Bugs
### Npc_KnowsInfo() bug
`Npc_KnowsInfo()` function doesn't properly return, if the input `C_INFO` instance has atribute `permanent = TRUE`
### Attribute save persistency
Setting `C_INFO.permanent` in game works only during a session, it is not saved in a save file. 
```
class oCInfo {
    //Achtung: Nur "name" und "told" wandert in ein Savegame!
```
source: [Ikarus](https://forum.worldofplayers.de/forum/threads/1299679-Skriptpaket-Ikarus-4)

## Bug fix list
- BEG_701_Jose.d - fixed Npc_KnowsInfo() bug
- WRK_227_Snaf.d - fixed attribute save persistency
- THF_403_Gerion.d - fixed a bug with Wylfern's ring, Npc_KnowsInfo() bug
- B_AssignAmbientInfos_MIL_4.d - fixed Npc_KnowsInfo() bug
- B_AssignAmbientInfos_MIL_6.d - fixed Npc_KnowsInfo() bug
- B_AssignAmbientInfos_MIL_7.d - fixed Npc_KnowsInfo() bug
- B_AssignAmbientInfos_MIL_9.d - fixed Npc_KnowsInfo() bug
- B_FindNpx_MIL.d - fixed Npc_KnowsInfo() bug
- MIL_103_BERENGAR - fixed Npc_KnowsInfo() bug
- MIL_122_ARENAMASTER - fixed Npc_KnowsInfo() bug
- Mst_Molerat.d - added DMolerat instance for Diegos quest - these molerats drop meat now
- DIA_PC_Thief.d - quest spawns molerats with meat
