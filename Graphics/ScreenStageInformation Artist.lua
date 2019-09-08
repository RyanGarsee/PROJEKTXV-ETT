-- it may be called "Artist", but here I've also made it do something for courses
return Def.ActorFrame {
	LoadFont("TextBanner text")..{
		InitCommand=function(self)
			self:halign(1):shadowlength(0):maxwidth(SCREEN_WIDTH*0.875)
		end;
		BeginCommand=function(self)
			local finalText, SongOrCourse;
			if GAMESTATE:IsCourseMode() then
				SongOrCourse = GAMESTATE:GetCurrentCourse();
				if SongOrCourse then
					finalText = "aj isn't done with course mode yet";
					-- maybe I should put a list of the artists here.
					-- who knows, you probably have enough space.
					--local trail = GAMESTATE:GetCurrentTrail(GAMESTATE:GetMasterPlayerNumber());
				end;
			else
				SongOrCourse = GAMESTATE:GetCurrentSong();
				if SongOrCourse then
					finalText = SongOrCourse:GetDisplayArtist();
				end;
			end;
			self:settext(finalText);
		end;
		OnCommand=function(self)
			self:zoom(.75):diffusealpha(0):sleep(.15):decelerate(0.25):addx((SCREEN_CENTER_X-140)):diffusealpha(1)
		end;
		OffCommand=function(self)
			self:diffusealpha(0):glow(color("1,1,1,1")):linear(0.2):addy(-20):zoomy(0.1):accelerate(.2):addx(-(SCREEN_CENTER_X-140)):glow(color("1,1,1,0")):zoomx(50)
		end;
	};
};