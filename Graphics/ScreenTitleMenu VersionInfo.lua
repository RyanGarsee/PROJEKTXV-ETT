return LoadFont("Common Normal")..{
	Text=ProductID().." "..ProductVersion();
	BeginCommand=function(self)
		self:uppercase(true)
	end;
};