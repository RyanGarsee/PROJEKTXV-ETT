return LoadFont("Common Normal") .. {
	BeginCommand=function(self)
		self:uppercase(true);
		local text = string.format("%d songs in %d groups, %d courses", SONGMAN:GetNumSongs(), SONGMAN:GetNumSongGroups(), SONGMAN:GetNumCourses() );
		if PREFSMAN:GetPreference("UseUnlockSystem") then
			text = text .. ssprintf(", %d unlocks", UNLOCKMAN:GetNumUnlocks() );
		end;
		self:settext(text);
	end;
};