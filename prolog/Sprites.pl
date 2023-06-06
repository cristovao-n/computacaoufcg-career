:- use_module('./Helpers.pl').

sourceColorChars(["▓", "s", "t", "p", "b"]).
paintCharacter(CharacterSprite, [Head | _], 4, Result) :- 
    sourceColorChars(ColorCharsList),
    getElementByIndex(ColorCharsList, 4, ColorChar),
    paintSpritePixels(CharacterSprite, Head, ColorChar, R2),
    paintSpritePixels(R2, "white", "▒", Result).

paintCharacter(CharacterSprite, [Head | Tail], CharIndex, Result) :- 
    sourceColorChars(ColorCharsList),
    getElementByIndex(ColorCharsList, CharIndex, ColorChar),
    paintSpritePixels(CharacterSprite, Head, ColorChar, R2),
    CharIndexInc is CharIndex + 1,
    paintCharacter(R2, Tail, CharIndexInc, Result).

paintSpritePixels([], _, _, Result) :- Result = "", !.
paintSpritePixels('', _, _, Result) :- Result = "", !.
paintSpritePixels(Sprite, Color, Char, Result) :-
    stringToCharList(Sprite, [Head | Tail]),
    charListToString(TailString, Tail),
    (atom_chars(Head, Char) -> (
        paintString(Color, "▓", R2),
        paintSpritePixels(TailString, Color, Char, R3),
        concatenate([R2, R3], Result)
        ) 
    ;   paintSpritePixels(TailString, Color, Char, R2),
        concatenate([Head, R2], Result)
    ).

paintString(_, "", "").
paintString(Color, Content, Result) :-
    getColorPrefix(Color, ColorCode),
    getColorPrefix("default", DefaultColorCode),
    concatenate([ColorCode, Content, DefaultColorCode], Result).



getColorPrefix("black", "\e[30m").
getColorPrefix("red", "\e[31m").
getColorPrefix("green", "\e[32m").
getColorPrefix("yellow", "\e[33m").
getColorPrefix("blue", "\e[34m").
getColorPrefix("magenta", "\e[35m").
getColorPrefix("cyan", "\e[36m").
getColorPrefix("white", "\e[37m").
getColorPrefix("gray", "\e[90m").
getColorPrefix("lightred", "\e[91m").
getColorPrefix("lightgreen", "\e[92m").
getColorPrefix("lightyellow", "\e[93m").
getColorPrefix("lightblue", "\e[94m").
getColorPrefix("lightmagenta", "\e[95m").
getColorPrefix("lightcyan", "\e[96m").
getColorPrefix("lightgray", "\e[97m").
getColorPrefix("default", "\e[0m").

% [hair, skin, tshirt, pants, boots]
% getCharacterSprite("mainCharacter", ["red", "blue", "yellow", "magenta", "green"], Result)

getCharacterSprite("mainCharacter", ColorList, Result) :- 
    unlines([
        "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓▓░░▓▓▓▓▓▓▓▓░░░░░░",
        "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░",
        "░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░",
        "░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░",
        "░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░",
        "░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓ssss▓▓ssssssss▓▓▓▓ss██░░░░░░░░",
        "░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓ssss▓▓ss▒▒▒▒▒▒ss▒▒▒▒██░░░░░░░░",
        "░░░░░░░░░░░░░░░░░░░░░░░░░░██ssssss▒▒▒▒████ss██▒▒██░░░░░░░░",
        "░░░░░░░░░░░░░░░░░░░░░░░░░░░░██ssss▒▒▒▒████ss██▒▒██░░░░░░░░",
        "░░░░░░░░░░░░░░░░░░░░░░░░░░████ssssss▒▒▒▒▒▒ss▒▒▒▒██░░░░░░░░",
        "░░░░░░░░░░░░░░░░░░░░░░████tttt██ssss████████ss██████░░░░░░",
        "░░░░░░░░░░░░░░░░░░░░██tttttttttt██ssssssssss██tttttt██░░░░",
        "░░░░░░░░░░░░░░░░░░░░██tttttttttttt██████████tttttttt██░░░░",
        "░░░░░░░░░░░░░░░░░░██ss██tttt██tttttttttttttt██tttt██ss██░░",
        "░░░░░░░░░░░░░░░░░░██ssss██████tttttttttttttt██████ssss██░░",
        "░░░░░░░░░░░░░░░░░░██ssssss████tttttttttttttt████ssssss██░░",
        "░░░░░░░░░░░░░░░░░░██ssssss████tttttttttttttt████ssssss██░░",
        "░░░░░░░░░░░░░░░░░░░░██████░░██████████████████░░██████░░░░",
        "░░░░░░░░░░░░░░░░░░░░░░░░░░██pppppppppppppppppp██░░░░░░░░░░",
        "░░░░░░░░░░░░░░░░░░░░░░░░██pppppppppp██pppppppppp██░░░░░░░░",
        "░░░░░░░░░░░░░░░░░░░░░░██████pppp████░░████pppp██████░░░░░░",
        "░░░░░░░░░░░░░░░░░░████bbbbbb██████░░░░░░██████bbbbbb████░░",
        "░░░░░░░░░░░░░░░░██bbbbbbbbbbbbbb██░░░░░░██bbbbbbbbbbbbbb██",
        "░░░░░░░░░░░░░░░░██████████████████░░░░░░██████████████████"
        ], Sprite),
    paintCharacter(Sprite, ColorList, 0, Result).

getCharacterSprite("admBoss", _, Result) :-
    unlines([
        "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░▓▓▓▓▓▓▓ssss▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░▓▓▓▓▓▓ss▒▒▒▒▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░▓▓▓▓ppsspppp▒▒▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░██▒▒ppsspppp▒▒▒▒ss▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░██▒▒▒▒ss▒▒▒▒▒▒ssssss████░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░██████ss████████ssss██tttt████░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░██ttpptt██ssssssssss██ttttpptttt██░░░░░░░░░░░░░░░░░░░░",
        "░░░░██ttttpptt██████████ttttpptttttt██░░░░░░░░░░░░░░░░░░░░",
        "░░██ss██tttt██pppppppppppppp██tttt██ss██░░░░░░░░░░░░░░░░░░",
        "░░██ssss██████tttttttttttttt██████ssss██░░░░░░░░░░░░░░░░░░",
        "░░██ssssss████pppppppppppppp████ssssss██░░░░░░░░░░░░░░░░░░",
        "░░██ssssss████tttttttttttttt████ssssss██░░░░░░░░░░░░░░░░░░",
        "░░░░██████░░██████████████████░░██████░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░░░██pppppppppppppppppp██░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░██pppppppppp██pppppppppp██░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░██████████████░░██████████████░░░░░░░░░░░░░░░░░░░░░░",
        "░░████bbbbbbbbbb██░░░░░░██bbbbbbbbbb████░░░░░░░░░░░░░░░░░░",
        "██bbbbbbbbbbbbbb██░░░░░░██bbbbbbbbbbbbbb██░░░░░░░░░░░░░░░░",
        "██████████████████░░░░░░██████████████████░░░░░░░░░░░░░░░░"
        ], Sprite),
    paintCharacter(Sprite, ["gray", "lightyellow", "white", "blue", "gray"], 0, Result).

getCharacterSprite("p1Boss", _, Result) :-
    unlines([
        "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░░░░░██████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░░░██████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░██████████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░████ssssssssss████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░██▓▓▓▓ss▓▓▓▓▓▓ssss████░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░██▓▓██▓▓████▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░██▓▓██▓▓████▓▓ssssss▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░██▓▓▓▓ss▓▓▓▓▓▓ssssss████░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░██████ss████████ssss██tttt████░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░██tttttt██ssssssssss██tttttttttt██░░░░░░░░░░░░░░░░░░░░",
        "░░░░██tttttttt██████████tttttttttttt██░░░░░░░░░░░░░░░░░░░░",
        "░░██ss██tttt██tttttttttttttt██tttt██ss██░░░░░░░░░░░░░░░░░░",
        "░░██ssss██████tttttttttttttt██████ssss██░░░░░░░░░░░░░░░░░░",
        "░░██ssssss████tttttttttttttt████ssssss██░░░░░░░░░░░░░░░░░░",
        "░░██ssssss████tttttttttttttt████ssssss██░░░░░░░░░░░░░░░░░░",
        "░░░░██████░░██████████████████░░██████░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░░░██pppppppppppppppppp██░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░██pppppppppp██pppppppppp██░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░██████████████░░██████████████░░░░░░░░░░░░░░░░░░░░░░",
        "░░████bbbbbbbbbb██░░░░░░██bbbbbbbbbb████░░░░░░░░░░░░░░░░░░",
        "██bbbbbbbbbbbbbb██░░░░░░██bbbbbbbbbbbbbb██░░░░░░░░░░░░░░░░",
        "██████████████████░░░░░░██████████████████░░░░░░░░░░░░░░░░"
        ], Sprite),
    paintCharacter(Sprite, ["default", "lightgray", "gray", "default", "gray"], 0, Result). 

getCharacterSprite("p2Boss", _, Result) :-
    unlines([
        "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░░░░░░░▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓░░▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░▓▓▓▓ssssssssss▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░▓▓▒▒▒▒ss▒▒▒▒ssssss▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░▓▓▒▒██ss████▒▒ssss▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░██▒▒██ss████▒▒sspp▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░██▒▒▒▒ss▒▒▒▒sspppppp████░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░██████pp████████pppp██tttt████░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░██tttttt██pppppppppp██tttttttttt██░░░░░░░░░░░░░░░░░░░░",
        "░░░░██tttttttt██████████tttttttttttt██░░░░░░░░░░░░░░░░░░░░",
        "░░██ss██tttt██tttttttttttttt██tttt██ss██░░░░░░░░░░░░░░░░░░",
        "░░██ssss██████tttttttttttttt██████ssss██░░░░░░░░░░░░░░░░░░",
        "░░██ssssss████tttttttttttttt████ssssss██░░░░░░░░░░░░░░░░░░",
        "░░██ssssss████tttttttttttttt████ssssss██░░░░░░░░░░░░░░░░░░",
        "░░░░██████░░██████████████████░░██████░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░░░██pppppppppppppppppp██░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░██pppppppppp██pppppppppp██░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░██████████████░░██████████████░░░░░░░░░░░░░░░░░░░░░░",
        "░░████bbbbbbbbbb██░░░░░░██bbbbbbbbbb████░░░░░░░░░░░░░░░░░░",
        "██bbbbbbbbbbbbbb██░░░░░░██bbbbbbbbbbbbbb██░░░░░░░░░░░░░░░░",
        "██████████████████░░░░░░██████████████████░░░░░░░░░░░░░░░░"
        ], Sprite),
    paintCharacter(Sprite, ["gray", "lightyellow", "white", "black", "green"], 0, Result). 

getCharacterSprite("edaBoss", _, Result) :-
    unlines([
        "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░░░░░██████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░░░██████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░██████ssssssss████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░████ssssssssssssss████░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░██ssssssssssssssss████░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░██▓▓▓▓ss▓▓▓▓▓▓ssssss██░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░██▓▓██▓▓████▓▓▓▓▓▓▓▓██░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░██▓▓██▓▓████▓▓ssssbb▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░██▓▓▓▓ss▓▓▓▓▓▓ssbbbb████░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░██████bb████████bbbb██tttt████░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░██tttttt██bbbbbbbbbb██tttttttttt██░░░░░░░░░░░░░░░░░░░░",
        "░░░░██tttttttt██████████tttttttttttt██░░░░░░░░░░░░░░░░░░░░",
        "░░██ss██tttt██tttpptttpttptt██tttt██ss██░░░░░░░░░░░░░░░░░░",
        "░░██ssss██████ttpttpttpttptt██████ssss██░░░░░░░░░░░░░░░░░░",
        "░░██ssssss████ttpttpttpttptt████ssssss██░░░░░░░░░░░░░░░░░░",
        "░░██ssssss████ttpttptttppttt████ssssss██░░░░░░░░░░░░░░░░░░",
        "░░░░██████░░██████████████████░░██████░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░░░██pppppppppppppppppp██░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░██pppppppppp██pppppppppp██░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░██████████████░░██████████████░░░░░░░░░░░░░░░░░░░░░░",
        "░░████bbbbbbbbbb██░░░░░░██bbbbbbbbbb████░░░░░░░░░░░░░░░░░░",
        "██bbbbbbbbbbbbbb██░░░░░░██bbbbbbbbbbbbbb██░░░░░░░░░░░░░░░░",
        "██████████████████░░░░░░██████████████████░░░░░░░░░░░░░░░░"
        ], Sprite),
    paintCharacter(Sprite, ["default", "lightyellow", "lightmagenta", "magenta", "gray"], 0, Result). 

getCharacterSprite("plpBoss", _, Result) :-
    unlines([
        "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░▓▓▓▓░░▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░▓▓ssssssssssssssss▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░██▒▒▒▒ss▒▒▒▒▒▒ssssss▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░██▒▒██ss████▒▒▒▒ssss▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░██▒▒██ss████▒▒▒▒ssss██░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░██▒▒▒▒ss▒▒▒▒▒▒ssssss████░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░██████ss████████ssss██tttt████░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░██tttttt██ssssssssss██tttttttttt██░░░░░░░░░░░░░░░░░░░░",
        "░░░░██tttttttt██████████tttttttttttt██░░░░░░░░░░░░░░░░░░░░",
        "░░██ss██tttt██tttttttttttttt██tttt██ss██░░░░░░░░░░░░░░░░░░",
        "░░██ssss██████tttttttttttttt██████ssss██░░░░░░░░░░░░░░░░░░",
        "░░██ssssss████tttttttttttttt████ssssss██░░░░░░░░░░░░░░░░░░",
        "░░██ssssss████tttttttttttttt████ssssss██░░░░░░░░░░░░░░░░░░",
        "░░░░██████░░██████████████████░░██████░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░░░██pppppppppppppppppp██░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░██pppppppppp██pppppppppp██░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░██████████████░░██████████████░░░░░░░░░░░░░░░░░░░░░░",
        "░░████bbbbbbbbbb██░░░░░░██bbbbbbbbbb████░░░░░░░░░░░░░░░░░░",
        "██bbbbbbbbbbbbbb██░░░░░░██bbbbbbbbbbbbbb██░░░░░░░░░░░░░░░░",
        "██████████████████░░░░░░██████████████████░░░░░░░░░░░░░░░░"
        ], Sprite),
    paintCharacter(Sprite, ["default", "lightyellow", "white", "blue", "cyan"], 0, Result). 

getCardSprite(-2, Result) :- unlines([
  "░░██████████████████░░",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░█▀▀▄░░░░░░░░░░░░██",
  "██░░█  █░░░░░░░░░░░░██",
  "██░░█▄▄▀░░░░░░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░░░░▄██▄▄██▄░░░░░██",
  "██░░░░░▀██████▀░░░░░██",
  "██░░░░░░░▀██▀░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "░░██████████████████░░"
    ], Result).

getCardSprite(-1, Result) :- unlines([
  "██",
  "██",
  "██",
  "██",
  "██",
  "██",
  "██",
  "██",
  "██",
  "██",
  "██",
  "██"
  ], Result).

getCardSprite(0, Result) :- unlines([
  "░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░",
  "░░░░░░░░░░░░░░░░░░░░░░"
    ], Result).

getCardSprite(1, Result) :- unlines([
  "░░██████████████████░░",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░▄▀▀▄░░░░░░░░░░░░██",
  "██░░█■■█░░░░░░░░░░░░██",
  "██░░█  █░░░░░░░░░░░░██",
  "██░░░░░░░░▄▄░░░░░░░░██",
  "██░░░░░░▄▄██▄▄░░░░░░██",
  "██░░░░░░██████░░░░░░██",
  "██░░░░░░▄▄▀▀▄▄░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "░░██████████████████░░"
    ], Result).

getCardSprite(2, Result) :- unlines([
  "░░██████████████████░░",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░▀▀▀█░░░░░░░░░░░░██",
  "██░░█▀▀▀░░░░░░░░░░░░██",
  "██░░█▄▄▄░░░░░░░░░░░░██",
  "██░░░░░░░░▄▄░░░░░░░░██",
  "██░░░░░░▄▄██▄▄░░░░░░██",
  "██░░░░░░██████░░░░░░██",
  "██░░░░░░▄▄▀▀▄▄░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "░░██████████████████░░"
    ], Result).

getCardSprite(3, Result) :- unlines([
  "░░██████████████████░░",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░▀▀▀█░░░░░░░░░░░░██",
  "██░░■■■█░░░░░░░░░░░░██",
  "██░░▄▄▄█░░░░░░░░░░░░██",
  "██░░░░░░░░▄▄░░░░░░░░██",
  "██░░░░░░▄▄██▄▄░░░░░░██",
  "██░░░░░░██████░░░░░░██",
  "██░░░░░░▄▄▀▀▄▄░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "░░██████████████████░░"
    ], Result).

getCardSprite(4, Result) :- unlines([
  "░░██████████████████░░",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░█  █░░░░░░░░░░░░██",
  "██░░█▄▄█░░░░░░░░░░░░██",
  "██░░   █░░░░░░░░░░░░██",
  "██░░░░░░░░▄▄░░░░░░░░██",
  "██░░░░░░▄▄██▄▄░░░░░░██",
  "██░░░░░░██████░░░░░░██",
  "██░░░░░░▄▄▀▀▄▄░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "░░██████████████████░░"
    ], Result).

getCardSprite(5, Result) :- unlines([
  "░░██████████████████░░",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░█▀▀▀░░░░░░░░░░░░██",
  "██░░▀▀▀█░░░░░░░░░░░░██",
  "██░░▄▄▄█░░░░░░░░░░░░██",
  "██░░░░░░░░▄▄░░░░░░░░██",
  "██░░░░░░▄▄██▄▄░░░░░░██",
  "██░░░░░░██████░░░░░░██",
  "██░░░░░░▄▄▀▀▄▄░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "░░██████████████████░░"
    ], Result).

getCardSprite(6, Result) :- unlines([
  "░░██████████████████░░",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░█▀▀▀░░░░░░░░░░░░██",
  "██░░█▀▀█░░░░░░░░░░░░██",
  "██░░█▄▄█░░░░░░░░░░░░██",
  "██░░░░░░░░▄▄░░░░░░░░██",
  "██░░░░░░▄▄██▄▄░░░░░░██",
  "██░░░░░░██████░░░░░░██",
  "██░░░░░░▄▄▀▀▄▄░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "░░██████████████████░░"
    ], Result).

getCardSprite(7, Result) :- unlines([
  "░░██████████████████░░",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░▀▀▀█░░░░░░░░░░░░██",
  "██░░  █ ░░░░░░░░░░░░██",
  "██░░ █  ░░░░░░░░░░░░██",
  "██░░░░░░░░▄▄░░░░░░░░██",
  "██░░░░░░▄▄██▄▄░░░░░░██",
  "██░░░░░░██████░░░░░░██",
  "██░░░░░░▄▄▀▀▄▄░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "░░██████████████████░░"
    ], Result).

getCardSprite(8, Result) :- unlines([
  "░░██████████████████░░",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░█▀▀█░░░░░░░░░░░░██",
  "██░░█■■█░░░░░░░░░░░░██",
  "██░░█▄▄█░░░░░░░░░░░░██",
  "██░░░░░░░░▄▄░░░░░░░░██",
  "██░░░░░░▄▄██▄▄░░░░░░██",
  "██░░░░░░██████░░░░░░██",
  "██░░░░░░▄▄▀▀▄▄░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "░░██████████████████░░"
    ], Result).

getCardSprite(9, Result) :- unlines([
  "░░██████████████████░░",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░█▀▀█░░░░░░░░░░░░██",
  "██░░█▄▄█░░░░░░░░░░░░██",
  "██░░▄▄▄█░░░░░░░░░░░░██",
  "██░░░░░░░░▄▄░░░░░░░░██",
  "██░░░░░░▄▄██▄▄░░░░░░██",
  "██░░░░░░██████░░░░░░██",
  "██░░░░░░▄▄▀▀▄▄░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "░░██████████████████░░"
    ], Result).

getCardSprite(10, Result) :- unlines([
  "░░██████████████████░░",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░█░█▀▀█░░░░░░░░░░██",
  "██░░█░█▄▀█░░░░░░░░░░██",
  "██░░█░█▄▄█░░░░░░░░░░██",
  "██░░░░░░░░▄▄░░░░░░░░██",
  "██░░░░░░▄▄██▄▄░░░░░░██",
  "██░░░░░░██████░░░░░░██",
  "██░░░░░░▄▄▀▀▄▄░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "░░██████████████████░░"
    ], Result).

getCardSprite(11, Result) :- unlines([
  "░░██████████████████░░",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░   █░░░░░░░░░░░░██",
  "██░░   █░░░░░░░░░░░░██",
  "██░░▀▄▄▀░░░░░░░░░░░░██",
  "██░░░░░░░░▄▄░░░░░░░░██",
  "██░░░░░░▄▄██▄▄░░░░░░██",
  "██░░░░░░██████░░░░░░██",
  "██░░░░░░▄▄▀▀▄▄░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "░░██████████████████░░"
    ], Result).

getCardSprite(12, Result) :- unlines([
  "░░██████████████████░░",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░▄▀▀▄░░░░░░░░░░░░██",
  "██░░█  █░░░░░░░░░░░░██",
  "██░░ ▀▀▄░░░░░░░░░░░░██",
  "██░░░░░░░░▄▄░░░░░░░░██",
  "██░░░░░░▄▄██▄▄░░░░░░██",
  "██░░░░░░██████░░░░░░██",
  "██░░░░░░▄▄▀▀▄▄░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "░░██████████████████░░"
    ], Result).

getCardSprite(13, Result) :- unlines([
  "░░██████████████████░░",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░█ ▄▀░░░░░░░░░░░░██",
  "██░░██  ░░░░░░░░░░░░██",
  "██░░█ ▀▄░░░░░░░░░░░░██",
  "██░░░░░░░░▄▄░░░░░░░░██",
  "██░░░░░░▄▄██▄▄░░░░░░██",
  "██░░░░░░██████░░░░░░██",
  "██░░░░░░▄▄▀▀▄▄░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "██░░░░░░░░░░░░░░░░░░██",
  "░░██████████████████░░"
    ], Result).

getCharSprite("a", Result) :- unlines([
  "▄▀▀▄",
  "█■■█",
  "█  █"
  ], Result), !.

getCharSprite("b", Result) :- unlines([
  "█▀▀▄",
  "█■■█",
  "█▄▄▀"
  ], Result), !.

getCharSprite("c", Result) :- unlines([
  "▄▀▀▄",
  "█   ",
  "▀▄▄▀"
  ], Result), !.

getCharSprite("d", Result) :- unlines([
  "█▀▀▄",
  "█  █",
  "█▄▄▀"
  ], Result), !.

getCharSprite("e", Result) :- unlines([
  "▄▀▀▀",
  "█■■ ",
  "▀▄▄▄"
  ], Result), !.

getCharSprite("f", Result) :- unlines([
  "▄▀▀▀",
  "█■■ ",
  "█   "
  ], Result), !.

getCharSprite("g", Result) :- unlines([
  "▄▀▀ ",
  "█ ▀█",
  "▀▄▄▀"
  ], Result), !.

getCharSprite("h", Result) :- unlines([
  "█  █",
  "█■■█",
  "█  █"
  ], Result), !.

getCharSprite("i", Result) :- unlines([
  " ▐▌ ",
  " ▐▌ ",
  " ▐▌ "
  ], Result), !.

getCharSprite("j", Result) :- unlines([
  "   █",
  "   █",
  "▀▄▄▀"
  ], Result), !.

getCharSprite("k", Result) :- unlines([
  "█ ▄▀",
  "██  ",
  "█ ▀▄"
  ], Result), !.

getCharSprite("l", Result) :- unlines([
  "█   ",
  "█   ",
  "▀▄▄▄"
  ], Result), !.

getCharSprite("m", Result) :- unlines([
  "█▄▄█",
  "█▐▌█",
  "█  █"
  ], Result), !.

getCharSprite("n", Result) :- unlines([
  "█▄ █",
  "█ ▀█",
  "█  █"
  ], Result), !.

getCharSprite("o", Result) :- unlines([
  "▄▀▀▄",
  "█  █",
  "▀▄▄▀"
  ], Result), !.

getCharSprite("p", Result) :- unlines([
  "█▀▀▄",
  "█▄▄▀",
  "█   "
  ], Result), !.

getCharSprite("q", Result) :- unlines([
  "▄▀▀▄",
  "█  █",
  " ▀▀▄"
  ], Result), !.

getCharSprite("r", Result) :- unlines([
  "█▀▀▄",
  "█▄▄▀",
  "█  █"
  ], Result), !.

getCharSprite("s", Result) :- unlines([
  "▄▀▀▀",
  " ▀▀▄",
  "▄▄▄▀"
  ], Result), !.

getCharSprite("t", Result) :- unlines([
  "▀▐▌▀",
  " ▐▌ ",
  " ▐▌ "
  ], Result), !.

getCharSprite("u", Result) :- unlines([
  "█  █",
  "█  █",
  "▀▄▄▀"
  ], Result), !.

getCharSprite("v", Result) :- unlines([
  "█  █",
  "▐▌▐▌",
  " ▐▌ "
  ], Result), !.

getCharSprite("w", Result) :- unlines([
  "█  █",
  "█▐▌█",
  "█▀▀█"
  ], Result), !.

getCharSprite("x", Result) :- unlines([
  "▀▄▄▀",
  " ▐▌ ",
  "▄▀▀▄"
  ], Result), !.

getCharSprite("y", Result) :- unlines([
  "▀▄▄▀",
  " ▐▌ ",
  " ▐▌ "
  ], Result), !.

getCharSprite("z", Result) :- unlines([
  "▀▀▀█",
  " ▄▀ ",
  "█▄▄▄"
  ], Result), !.

getCharSprite("0", Result) :- unlines([
  "█▀▀█",
  "█▄▀█",
  "█▄▄█"
  ], Result), !.

getCharSprite("1", Result) :- unlines([
  " ▄█ ",
  "  █ ",
  " ▄█▄"
  ], Result), !.

getCharSprite("2", Result) :- unlines([
  "▀▀▀█",
  "█▀▀▀",
  "█▄▄▄"
  ], Result), !.

getCharSprite("3", Result) :- unlines([
  "▀▀▀█",
  " ■■█",
  "▄▄▄█"
  ], Result), !.

getCharSprite("4", Result) :- unlines([
  "█  █",
  "█▄▄█",
  "   █"
  ], Result), !.

getCharSprite("5", Result) :- unlines([
  "█▀▀▀",
  "▀▀▀█",
  "▄▄▄█"
  ], Result), !.

getCharSprite("6", Result) :- unlines([
  "█▀▀▀",
  "█▀▀█",
  "█▄▄█"
  ], Result), !.

getCharSprite("7", Result) :- unlines([
  "▀▀▀█",
  "  █ ",
  " █  "
  ], Result), !.

getCharSprite("8", Result) :- unlines([
  "█▀▀█",
  "█■■█",
  "█▄▄█"
  ], Result), !.

getCharSprite("9", Result) :- unlines([
  "█▀▀█",
  "█▄▄█",
  "▄▄▄█"
  ], Result), !.

getCharSprite(" ", Result) :- unlines([
  "    ",
  "    ",
  "    "
  ], Result), !.

getCharSprite("-", Result) :- unlines([
  "    ",
  " ■■ ",
  "    "
  ], Result), !.

getCharSprite(".", Result) :- unlines([
  "    ",
  "    ",
  " ▄  "
  ], Result), !.

getCharSprite(",", Result) :- unlines([
  "    ",
  "    ",
  "▄▀  "
  ], Result), !.

getCharSprite("!", Result) :- unlines([
  " █  ",
  " █  ",
  " ▄  "
  ], Result), !.

getCharSprite("?", Result) :- unlines([
  "▀▀▀█",
  " █▀▀",
  " ▄  "
  ], Result), !.

getCharSprite(":", Result) :- unlines([
  " ▄  ",
  "    ",
  " ▀  "
  ], Result), !.

getCharSprite("=", Result) :- unlines([
  " ▄▄▄",
  "    ",
  " ▀▀▀"
  ], Result), !.

getCharSprite("#", Result) :- unlines([
  "░░░░",
  "░░░░",
  "░░░░"
  ], Result), !.

getCharSprite("(", Result) :- unlines([
  "██░░░░",
  "██░░░░",
  "██░░░░"
  ], Result), !.

getCharSprite(")", Result) :- unlines([
  "░░██",
  "░░██",
  "░░██"
  ], Result), !.

getCharSprite(_, Result) :- unlines([
  "░░░░",
  "░░░░",
  "░░░░"
  ], Result).

