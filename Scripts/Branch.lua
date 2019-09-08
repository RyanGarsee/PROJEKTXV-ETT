if not Branch then Branch = {}; end;

Branch.InitialRun = function()
	-- we need to check for the 3D option on first boot and allow the user to
	-- disable 3D models if they crash on their computer.
	return "ScreenTitleMenu"
end;

Branch.PlayerOptions = function()
	local StageScreen = "ScreenStageInformation";
	local OptionsScreen = "ScreenPlayerOptions"
	return SCREENMAN:GetTopScreen():GetGoToOptions() and OptionsScreen or StageScreen;
end;

Branch.StartGame = function()
	multiplayer = false
		if SONGMAN:GetNumSongs() == 0 and SONGMAN:GetNumAdditionalSongs() == 0 and #DLMAN:GetDownloads() == 0 then
			return "ScreenCoreBundleSelect"
		end
		if PROFILEMAN:GetNumLocalProfiles() >= 2 then
			return "ScreenSelectProfile"
		else
			return "ScreenProfileLoad"
		end
end;

Branch.AfterProfileLoad = function()
	return "ScreenSelectMusic"
		--"ScreenSelectPlayMode"
end;
