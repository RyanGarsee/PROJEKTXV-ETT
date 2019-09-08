return Def.ActorFrame {
	LoadFont("TextBanner text")..{
		InitCommand=function(self)
			self:y(-13)
		end;
		BeginCommand=function(self)
			local SongOrCourse = GAMESTATE:IsCourseMode() and GAMESTATE:GetCurrentCourse() or GAMESTATE:GetCurrentSong()
			if SongOrCourse then self:settext(SongOrCourse:GetDisplayFullTitle()) end
		end;
		OnCommand=function(self)
			self:zoom(0.5):maxwidth(380):horizalign(center):diffuse(color("1,0.9,0.3,1"))
		end;
		OffCommand=function(self)
			self:linear(0.5):diffusealpha(0)
		end;
	};
	Def.SongMeterDisplay {
		StreamWidth=186;
		Stream=Def.Quad { InitCommand=function(self)
			self:diffusealpha(0)
		end;
		Tip=LoadActor( THEME:GetPathG("ScreenGameplay", "song position tip") );
	};
};