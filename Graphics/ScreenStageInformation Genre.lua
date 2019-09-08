return Def.ActorFrame {
	LoadFont("TextBanner text")..{
		InitCommand=function(self)
			self:halign(1):shadowlength(0):maxwidth(SCREEN_WIDTH*0.875)
		end;
		BeginCommand=function(self)
			local finalText, Song
			Song = GAMESTATE:GetCurrentSong()
			if Song then finalText = Song:GetGenre() else finalText = "" end
			self:settext(finalText)
		end;
		OnCommand=function(self)
			self:zoom(.75):diffusealpha(0):sleep(.15):decelerate(0.25):addx((SCREEN_CENTER_X-140)):diffusealpha(1)
		end;
		OffCommand=function(self)
			self:diffusealpha(0):glow(color("1,1,1,1")):linear(0.2):addy(-20):zoomy(0.1):accelerate(.2):addx(-(SCREEN_CENTER_X-140)):glow(color("1,1,1,0")):zoomx(50)
		end;
	};
};