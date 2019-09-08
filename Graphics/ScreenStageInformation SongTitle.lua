-- Song _OR_ CourseTitle (I just used SongTitle for ease of transition.)
return Def.ActorFrame {
	LoadFont("ScreenStage Title")..{
		InitCommand=function(self)
			self:halign(1):shadowlength(0):maxwidth(SCREEN_WIDTH)
		end;
		BeginCommand=function(self)
			local finalText = "";
			local SongOrCourse;
			if GAMESTATE:IsCourseMode() then
				SongOrCourse = GAMESTATE:GetCurrentCourse();
			else
				SongOrCourse = GAMESTATE:GetCurrentSong();
			end;
			if SongOrCourse then
				finalText = SongOrCourse:GetDisplayFullTitle();
			end;
			self:settext(finalText);
		end;
		OnCommand=function(self)
			self:zoomy(.75):zoomx(.5):diffusealpha(0):decelerate(0.25):addx((SCREEN_CENTER_X-140)):diffusealpha(1)
		end;
		OffCommand=function(self)
			self:diffusealpha(0):glow(color("1,1,1,1")):linear(0.2):addy(25):zoomy(0.1):accelerate(.2):addx(-(SCREEN_CENTER_X-140)):glow(color("1,1,1,0")):zoomx(50)
		end;
	};
};