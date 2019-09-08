local t = Def.ActorFrame{
	LoadFont("ScreenStage","Title")..{
		-- 420,250
		Text=GAMESTATE:GetCurrentSong():GetDisplayFullTitle();
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+100):y(SCREEN_CENTER_Y+10):horizalign(right):maxwidth(SCREEN_WIDTH):zoomy(0.75):zoomx(0.5):shadowlength(0):diffusealpha(0)
		end;
		OnCommand=function(self)
			self:decelerate(0.25):addx(180):diffusealpha(1)
		end;
		OffCommand=function(self)
			self:diffusealpha(0):glow(color("1,1,1,1")):linear(0.2):addy(25):zoomy(0.1):accelerate(.2):addx(-180):glow(color("1,1,1,0")):zoomx(50)
		end;
	};
	LoadFont("ScreenStage","Artist")..{
		-- 420,295
		Text=GAMESTATE:GetCurrentSong():GetDisplayArtist();
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+100):y(SCREEN_CENTER_Y+55):horizalign(right):maxwidth(SCREEN_WIDTH*0.875):zoom(.75):shadowlength(0):diffusealpha(0)
		end;
		OnCommand=function(self)
			self:sleep(.15):decelerate(0.25):addx(180):diffusealpha(1)
		end;
		OffCommand=function(self)
			self:diffusealpha(0):glow(color("1,1,1,1")):linear(0.2):addy(-20):zoomy(0.1):accelerate(.2):addx(-180):glow(color("1,1,1,0")):zoomx(50)
		end;
	};
};

return t;