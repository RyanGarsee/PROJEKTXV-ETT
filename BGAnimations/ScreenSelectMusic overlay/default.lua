local t = Def.ActorFrame{}
t[#t+1]=
	LoadActor("_bgframe")..{ InitCommand=function(self)
		self:Center():zoomtowidth(SCREEN_WIDTH)
	end;
}
t[#t+1]=
	LoadActor("_difficulty")..{ InitCommand=function(self)
		self:Center():hide_if(GAMESTATE:IsCourseMode())
	end;
}
t[#t+1]=LoadActor(THEME:GetPathG("Player","Status"));

return t;
