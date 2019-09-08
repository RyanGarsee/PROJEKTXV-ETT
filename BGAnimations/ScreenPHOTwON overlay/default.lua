local curState = "MenuState_Main";
-- curState can be one of:
local MenuStates = {
	MenuState_Main,				-- choose one of the menu options
	MenuState_LifeFrame,		-- changing life frame
	MenuState_LifeMeterBarOver,	-- changing life meter bar over style (norm/squish)
	MenuState_Judgment,			-- changing jugment
	MenuState_Finished,			-- game overs
};

local curIndex = 1;
local MenuChoices = {
	"LifeFrame",
	"LifeMeterBarOver",
	"Judgment"
};

local menuC;

local t = Def.ActorFrame{
	InitCommand=function(self)
		menuC = self:GetChildren();
	end;
	Def.Actor{
		Name="MenuController";
		MenuInputMessageCommand=function(self,param)
			if GAMESTATE:IsHumanPlayer(param.Player) then
				if curState == "MenuState_Main" then
					if param.Input == "Start" then
						--[[
						if curIndex == #MenuChoices then -- exit at end
							SCREENMAN:GetTopScreen():playcommand("Off");
							SCREENMAN:GetTopScreen():playcommand("End");
							curState = "MenuState_Finished";
							menuC["Exit"]:playcommand("LoseFocus");
							SCREENMAN:GetTopScreen():PostScreenMessage('SM_GoToNextScreen',0.5)
						else
							-- current code goes here
						end;
						--]]
						if curIndex == 1 then
							curState = "MenuState_LifeFrame";
						elseif curIndex == 2 then
							curState = "MenuState_LifeMeterBarOver";
						elseif curIndex == 3 then
							curState = "MenuState_Judgment";
						end;

						MESSAGEMAN:Broadcast("MenuStateChanged",{ NewState = curState; });
					elseif param.Input == "Back" then
						-- in MenuState_Main, we quit.
						SCREENMAN:GetTopScreen():Cancel()
					elseif param.Input == "Up" then
						if curIndex == 1 then curIndex = #MenuChoices;
						else curIndex = curIndex - 1;
						end;

						local curItemName = MenuChoices[curIndex];
						local lastIndex = (curIndex == #MenuChoices) and 1 or curIndex+1;
						local prevItemName = MenuChoices[lastIndex];

						MESSAGEMAN:Broadcast("MainMenuFocusChanged",{Gain = curItemName, Lose = prevItemName});
						menuC[curItemName]:playcommand("GainFocus");
						menuC[prevItemName]:playcommand("LoseFocus");
					elseif param.Input == "Down" then
						if curIndex == #MenuChoices then curIndex = 1;
						else curIndex = curIndex + 1;
						end;

						local curItemName = MenuChoices[curIndex];
						local lastIndex = (curIndex == 1) and #MenuChoices or curIndex-1;
						local prevItemName = MenuChoices[lastIndex];

						MESSAGEMAN:Broadcast("MainMenuFocusChanged",{Gain = curItemName, Lose = prevItemName});
						menuC[curItemName]:playcommand("GainFocus");
						menuC[prevItemName]:playcommand("LoseFocus");
					else
						--Trace("Input ".. param.Input .." not implemented on main menu");
					end;
				else
					-- if we're not on the main menu, we want to send the
					-- input messages so effort isn't duplicated elsewhere.
					local inputParam = {
						Player = param.Player,
						Input = param.Input,
						Choice = curChoice,
						MenuState = curState
					};
					-- broadcast an input message so other elements can access it
					MESSAGEMAN:Broadcast("PlayerMenuInput",inputParam);
				end;
			end;
		end;
		MenuUpP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Up", }); end;
		MenuUpP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Up", }); end;
		MenuDownP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Down", }); end;
		MenuDownP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Down", }); end;
		MenuLeftP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Left", }); end;
		MenuLeftP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Left", }); end;
		MenuRightP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Right", }); end;
		MenuRightP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Right", }); end;
		-- via codes
		CodeMessageCommand=function(self,param)
			--[[
			if param.Name == "ToggleEditMode" then
				-- special edit mode: frame = HSV frame; meter = streamdisplay.
				local specialEditMode = getenv("PHOTwONSpecialEditMode")
				setenv("PHOTwONSpecialEditMode",not specialEditMode);
				if getenv("PHOTwONSpecialEditMode") then
					MESSAGEMAN:Broadcast("SpecialEditMode",{Enabled = true})
				else
					MESSAGEMAN:Broadcast("SpecialEditMode",{Enabled = false})
				end;
			else
				MESSAGEMAN:Broadcast("MenuInput", { Player = param.PlayerNumber, Input = param.Name })
			end;
			--]]
			MESSAGEMAN:Broadcast("MenuInput", { Player = param.PlayerNumber, Input = param.Name })
		end;
		MenuStateChangedMessageCommand=function(self,param)
			local curItemName = MenuChoices[curIndex];
			if param.NewState == 'MenuState_Main' then
				menuC[curItemName]:playcommand("FinishedEditing");
				-- restore all dimmed items
				for idx, nam in pairs(MenuChoices) do
					if nam ~= "Exit" and nam ~= curItemName then
						menuC[nam]:playcommand("UnfocusedOut");
					end;
				end;
			else
				menuC[curItemName]:playcommand("StartedEditing");
				-- dim all non-selected items
				for idx, nam in pairs(MenuChoices) do
					if nam ~= "Exit" and nam ~= curItemName then
						menuC[nam]:playcommand("UnfocusedIn");
					end;
				end;
			end;
			curState = param.NewState;
		end;
		OffCommand=function(self) setenv("PHOTwONSpecialEditMode",false); end;
	};
};

-- Preview
t[#t+1] = LoadActor("Preview");

-- Life Frame Styles
t[#t+1] = LoadActor("LifeFrame");
t[#t+1] = LoadActor("_menuitem frame")..{
	Name="LifeFrame";
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X*1.675):y(SCREEN_CENTER_Y-32)
	end;
	OnCommand=function(self)
		self:queuecommand("GainFocus")
	end;
	GainFocusCommand=function(self)
		self:stoptweening():diffuse(color("1,1,1,1"))
	end;
	LoseFocusCommand=function(self)
		self:stoptweening():diffuse(color("1,1,1,0.5"))
	end;
	-- prototype version:
	--[[
	StartedEditingCommand=function(self)
		self:glowshift():effectcolor1(color("1,1,1,.7")):effectcolor2(color("1,.9,.5,0"))
	end;
	FinishedEditingCommand=function(self)
		self:stopeffect()
	end;
	UnfocusedInCommand=function(self)
		self:stoptweening():linear(0.3):diffuse(color("0.5,0.5,0.5,0.35"))
	end;
	UnfocusedOutCommand=function(self)
		self:stoptweening():linear(0.3):diffuse(color("1,1,1,0.5"))
	end;
	--]]
	-- final/production version:
	StartedEditingCommand=function(self)
		self:stoptweening():decelerate(0.3):y(SCREEN_CENTER_Y-136)
	end;
	FinishedEditingCommand=function(self)
		self:stoptweening():decelerate(0.3):y(SCREEN_CENTER_Y-32)
	end;
	UnfocusedInCommand=function(self)
		self:stoptweening():accelerate(0.3):x(SCREEN_CENTER_X*2.5)
	end;
	UnfocusedOutCommand=function(self)
		self:stoptweening():decelerate(0.3):x(SCREEN_CENTER_X*1.675)
	end;
};

-- Life Meter Bar Styles
t[#t+1] = LoadActor("LifeMeterBarOver");
t[#t+1] = LoadActor("_menuitem lifebar")..{
	Name="LifeMeterBarOver";
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X*1.675):y(SCREEN_CENTER_Y+18)
	end;
	OnCommand=function(self)
		self:queuecommand("LoseFocus")
	end;
	GainFocusCommand=function(self)
		self:diffuse(color("1,1,1,1"))
	end;
	LoseFocusCommand=function(self)
		self:diffuse(color("1,1,1,0.5"))
	end;
	-- prototype version:
	--[[
	StartedEditingCommand=function(self)
		self:glowshift():effectcolor1(color("1,1,1,.7")):effectcolor2(color("1,.9,.5,0"))
	end;
	FinishedEditingCommand=function(self)
		self:stopeffect()
	end;
	UnfocusedInCommand=function(self)
		self:stoptweening():linear(0.3):diffuse(color("0.5,0.5,0.5,0.35"))
	end;
	UnfocusedOutCommand=function(self)
		self:stoptweening():linear(0.3):diffuse(color("1,1,1,0.5"))
	end;
	--]]
	-- final/production version:
	StartedEditingCommand=function(self)
		self:stoptweening():decelerate(0.3):y(SCREEN_CENTER_Y-136)
	end;
	FinishedEditingCommand=function(self)
		self:stoptweening():decelerate(0.3):y(SCREEN_CENTER_Y+18)
	end;
	UnfocusedInCommand=function(self)
		self:stoptweening():accelerate(0.3):x(SCREEN_CENTER_X*2.5)
	end;
	UnfocusedOutCommand=function(self)
		self:stoptweening():decelerate(0.3):x(SCREEN_CENTER_X*1.675)
	end;
};

-- Judgment Styles
t[#t+1] = LoadActor("Judgment");
t[#t+1] = LoadActor("_menuitem judge")..{
	Name="Judgment";
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X*1.675):y(SCREEN_CENTER_Y+68)
	end;
	OnCommand=function(self)
		self:queuecommand("LoseFocus")
	end;
	GainFocusCommand=function(self)
		self:diffuse(color("1,1,1,1"))
	end;
	LoseFocusCommand=function(self)
		self:diffuse(color("1,1,1,0.5"))
	end;
	-- prototype version:
	--[[
	StartedEditingCommand=function(self)
		self:glowshift():effectcolor1(color("1,1,1,.7")):effectcolor2(color("1,.9,.5,0"))
	end;
	FinishedEditingCommand=function(self)
		self:stopeffect()
	end;
	UnfocusedInCommand=function(self)
		self:stoptweening():linear(0.3):diffuse(color("0.5,0.5,0.5,0.35"))
	end;
	UnfocusedOutCommand=function(self)
		self:stoptweening():linear(0.3):diffuse(color("1,1,1,0.5"))
	end;
	--]]
	-- final/production version:
	StartedEditingCommand=function(self)
		self:stoptweening():decelerate(0.3):y(SCREEN_CENTER_Y-136)
	end;
	FinishedEditingCommand=function(self)
		self:stoptweening():decelerate(0.3):y(SCREEN_CENTER_Y+68)
	end;
	UnfocusedInCommand=function(self)
		self:stoptweening():accelerate(0.3):x(SCREEN_CENTER_X*2.5)
	end;
	UnfocusedOutCommand=function(self)
		self:stoptweening():decelerate(0.3):x(SCREEN_CENTER_X*1.675)
	end;
};

return t;