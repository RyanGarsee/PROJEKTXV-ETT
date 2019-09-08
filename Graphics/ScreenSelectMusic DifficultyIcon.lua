local Player = ...
assert(Player,"ScreenSelectMusic DifficultyIcon needs player!")

return Def.ActorFrame{
	LoadActor("_difficulty")..{
		InitCommand=function(self)
			self:animate(false):setstate(0):player(Player)
		end;
		BeginCommand=function(self)
			self:playcommand("Set")
		end;
		SetCommand=function(self)
			local sel = GetSongOrCourse()
			if sel then
				local StepsOrTrail = GetStepsOrTrail(Player)
				if StepsOrTrail then
					self:setstate(DifficultyToFrame(StepsOrTrail:GetDifficulty()));
				end;
				self:visible(StepsOrTrail ~= nil)
			else
				self:visible(false)
			end;
		end;
		CurrentSongChangedChangedMessageCommand=function(self)
			self:playcommand("Set")
		end;
		CurrentCourseChangedChangedMessageCommand=function(self)
			self:playcommand("Set")
		end;
		CurrentStepsP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
		CurrentStepsP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
		CurrentTrailP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
		CurrentTrailP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
	};
};