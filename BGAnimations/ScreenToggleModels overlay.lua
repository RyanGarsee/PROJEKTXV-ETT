local t = Def.ActorFrame{
	LoadFont("_eurostile lt std ext two Bold 24px")..{
		InitCommand=function(self)
			self:CenterX():y(SCREEN_CENTER_Y-32):zoom(0.75):wrapwidthpixels(SCREEN_WIDTH/0.75):strokecolor(color("0.25,0.25,0.25,1"))
		end;
		BeginCommand=function(self)
			self:settext(THEME:GetString("ScreenToggleModels","Question"))
		end;
	};

	LoadFont("_eurostile lt std ext two Bold 24px")..{
		InitCommand=function(self)
			self:CenterX():y(SCREEN_CENTER_Y+64):zoom(0.75):wrapwidthpixels(SCREEN_WIDTH/0.75):strokecolor(color("0.25,0.25,0.25,1"))
		end;
		BeginCommand=function(self)
			self:settext(THEME:GetString("ScreenToggleModels","Note"))
		end;
	};
};

return t;