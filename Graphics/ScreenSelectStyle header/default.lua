return Def.ActorFrame{
	LoadActor("stuff")..{ InitCommand=function(self)
		self:Center()
	end;
};