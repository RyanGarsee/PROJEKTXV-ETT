local mainMaxWidth = 256;
local subMaxWidth = mainMaxWidth*1.33333;

--[[
This is where you'll find the metrics that were

[TextBanner]
TwoLinesTitleCommand=zoom,1;maxwidth,195;y,-9
TwoLinesSubtitleCommand=hidden,1
TwoLinesArtistCommand=zoom,0.6;maxwidth,296;y,8
ThreeLinesTitleCommand=zoom,.8;maxwidth,240;y,-10
ThreeLinesSubtitleCommand=hidden,0;zoom,.5;maxwidth,360
ThreeLinesArtistCommand=zoom,0.5;maxwidth,296;y,9

in case you didn't know sm-ssc/sm5 theming.
--]]

function TextBannerAfterSet(self,param) 
	local Title=self:GetChild("Title");
	local Subtitle=self:GetChild("Subtitle");
	local Artist=self:GetChild("Artist");

	if Subtitle:GetText() == "" then
		Title:maxwidth(195):y(-9):zoom(1);
		Subtitle:visible(false);
		Artist:zoom(0.6):maxwidth(296):y(8);
	else
		-- subtitle below
		Title:maxwidth(240):y(-10):zoom(0.8);
		Subtitle:maxwidth(360):visible(true):zoom(0.5);
		Artist:zoom(0.5):maxwidth(296):y(9);
	end
end