return Def.ActorFrame{
	Def.BPMDisplay{
		Name="BPMDisplay";
		File=THEME:GetPathF("BPMDisplay", "bpm");
		CurrentSongChangedMessageCommand=function(self)
			self:SetFromGameState()
		end;
	};
};