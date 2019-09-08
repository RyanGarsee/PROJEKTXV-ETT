local t = LoadFallbackB();

t[#t+1] = StandardDecorationFromFileOptional("VersionInfo","VersionInfo");
t[#t+1] = StandardDecorationFromFileOptional("SongsInfo","SongsInfo");

t[#t+1] = Def.Actor{
	OnCommand=function(self)
		if not FILEMAN:DoesFileExist("Save/ThemePrefs.ini") then
			Trace("ThemePrefs doesn't exist; creating file")
			ThemePrefs.ForceSave()
		end

		ThemePrefs.Save()
	end;
};

return t;