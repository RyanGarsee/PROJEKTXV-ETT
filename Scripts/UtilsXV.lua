-- projektXV utils

local difficultyFrameMap = {
	Difficulty_Beginner	 = 0,
	Difficulty_Easy		 = 1,
	Difficulty_Medium	 = 2,
	Difficulty_Hard		 = 3,
	Difficulty_Challenge = 4,
	Difficulty_Edit		 = 5
};
function DifficultyToFrame(diff) return difficultyFrameMap[diff] end

-- from soms2 21990 main setup file:
function GetSongOrCourse()
	local possible = GAMESTATE:IsCourseMode() and GAMESTATE:GetCurrentCourse() or GAMESTATE:GetCurrentSong()
	return possible or false
end

function GetStepsOrTrail(player)
	if not player then player = GAMESTATE:GetMasterPlayerNumber() end
	local possible = GAMESTATE:IsCourseMode() and GAMESTATE:GetCurrentTrail(player) or GAMESTATE:GetCurrentSteps(player)
	return possible or false
end