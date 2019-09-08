local t = Def.ActorFrame {}
t[#t+1] =
	LoadActor("_dlist frame")..{ InitCommand=function(self)
		self:Center():hide_if(GAMESTATE:IsCourseMode())
	end;
}

return t;
