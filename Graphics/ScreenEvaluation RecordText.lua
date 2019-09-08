local Player = ...
assert(Player,"RecordText needs Player")
local stats = STATSMAN:GetCurStageStats():GetPlayerStageStats(Player);
local pRecord = stats:GetPersonalHighScoreIndex()
local hasPersonalRecord = pRecord ~= -1

local mRecord = stats:GetMachineHighScoreIndex()
local hasMachineRecord = mRecord ~= -1

return LoadActor(THEME:GetPathG("","_record"))..{ BeginCommand=function(self)
	self:visible(hasMachineRecord)
end;
