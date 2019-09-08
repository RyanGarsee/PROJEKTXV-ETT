-- play _swoosh.ogg
local t = Def.ActorFrame{
	--[[
	LoadActor( THEME:GetPathG("Common fallback","background") )..{
		InitCommand=function(self)
			self:Center():diffusealpha(0.5)
		end;
		OffCommand=function(self)
			self:diffusealpha(1)
		end;
	};
	--]]
	--scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT;
	Def.Sprite{
		InitCommand=function(self)
			self:Center();
			self:diffuse(color("0,0,0,1"));
			if GAMESTATE:IsCourseMode() then
				self:Load(THEME:GetPathG("Common fallback","background"));
			else
				self:LoadFromSongBackground( GAMESTATE:GetCurrentSong() );
			end;
			self:scale_or_crop_background();
		end;
		OnCommand=function(self)
			self:linear(0.5):diffuse(color("0.3,0.3,0.3,1")):sleep(0.25):linear(0.4):diffuse(color("1,1,1,1"))
		end;
	};

	Def.Sprite{
		InitCommand=function(self)
			self:Center();
			self:diffuse(color("0,0,0,1"));
			if not GAMESTATE:IsCourseMode() then
				self:LoadFromSongBackground( GAMESTATE:GetCurrentSong() );
			else
				self:Load(THEME:GetPathG("Common fallback","background"));
			end;
			self:scale_or_crop_background();
		end;
		OnCommand=function(self)
			self:linear(0.5):diffuse(color("0.3,0.3,0.3,1")):sleep(0.25):linear(0.4):diffuse(color("0.3,0.3,0.3,0"))
		end;
	};
	--[[
	Def.ActorFrame{
		Name="CourseBackgroundFrame";
		InitCommand=function(self)
			self:hide_if(not GAMESTATE:IsCourseMode())
		end;
		LoadActor( THEME:GetPathG("Common fallback","background") )..{
			InitCommand=function(self)
				self:Center()
			end;
			OnCommand=function(self)
				self:diffuse(color("0,0,0,1")):linear(.3):diffuse(color(".3,.3,.3,1"))
			end;
			OffCommand=function(self)
				self:diffusealpha(1)
			end;
		};
		LoadActor( THEME:GetPathG("Common fallback","background") )..{
			InitCommand=function(self)
				self:Center()
			end;
			OnCommand=function(self)
				self:diffuse(color("0,0,0,1")):linear(.3):diffuse(color(".3,.3,.3,1"))
			end;
			OffCommand=function(self)
				self:diffuse(color(".3,.3,.3,1")):linear(.4):diffuse(color(".3,.3,.3,0"))
			end;
		};
	};
	--]]
	LoadActor("right")..{
		InitCommand=function(self)
			self:x(SCREEN_RIGHT*2):y(SCREEN_CENTER_Y):horizalign(right)
		end;
		OnCommand=function(self)
			self:decelerate(0.4):x(SCREEN_RIGHT)
		end;
		OffCommand=function(self)
			self:accelerate(0.4):addx(SCREEN_WIDTH):diffusealpha(0)
		end;
	};
};

return t;