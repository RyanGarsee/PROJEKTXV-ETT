-- song title/artist lives here
local t = Def.ActorFrame{};

t[#t+1] = StandardDecorationFromFile("SongTitle","SongTitle");
t[#t+1] = StandardDecorationFromFile("Artist","Artist");
t[#t+1] = StandardDecorationFromFile("Genre","Genre");

return t;