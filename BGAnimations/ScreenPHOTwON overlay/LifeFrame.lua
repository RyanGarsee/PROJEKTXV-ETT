-- this controls the life meter frame stuff
local framePref = ThemePrefs.Get("LifeFrame");
local curIndex = 1; -- was 2

if framePref then
	local _ = { "02","01","03","04" };
	for i,v in ipairs(_) do
		if v == framePref then curIndex = i; end;
	end;
else
	curIndex = 1;
end;

local frames = {
	"02",
	"01",
	"03",
	"04"
};
local numFrames = 4; -- sigh. didn't want to have to do this

local t = Def.ActorFrame{
	Def.Actor{
		Name="LifeFrameController";
		PlayerMenuInputMessageCommand=function(self,param)
			if param.MenuState == "MenuState_LifeFrame" then
				if param.Input == "Start" then
					ThemePrefs.Set("LifeFrame",frames[curIndex]);
					-- okay time to go back to the main menu
					MESSAGEMAN:Broadcast("MenuStateChanged",{NewState = "MenuState_Main"});
				elseif param.Input == "Back" then
					-- go back to main menu
					MESSAGEMAN:Broadcast("MenuStateChanged",{NewState = "MenuState_Main"});
				else
					-- left and right switch frames.
					if param.Input == "Left" or param.Input == "Up" then
						MESSAGEMAN:Broadcast("PreviousLifeFrame");
					elseif param.Input == "Right" or param.Input == "Down" then
						MESSAGEMAN:Broadcast("NextLifeFrame");
					end;
				end;
			end;
		end;
		NextLifeFrameMessageCommand=function(self)
			local prevIndex = curIndex;
			curIndex = curIndex + 1;
			if curIndex > numFrames then curIndex = 1; end;

			MESSAGEMAN:Broadcast("LifeFrameChanged",{NewLifeFrame = frames[curIndex], NewIndex = curIndex, OldIndex = prevIndex});
		end;
		PreviousLifeFrameMessageCommand=function(self)
			local prevIndex = curIndex;
			curIndex = curIndex - 1;
			if curIndex < 1 then curIndex = numFrames; end;

			MESSAGEMAN:Broadcast("LifeFrameChanged",{NewLifeFrame = frames[curIndex], NewIndex = curIndex, OldIndex = prevIndex});
		end;
	};
};

-- preview icon

-- the menu
local menu = Def.ActorFrame{
	Name="LifeFrameMenu";
	InitCommand=function(self)
		self:x(SCREEN_WIDTH+SCREEN_CENTER_X):y((SCREEN_CENTER_Y*0.5)+8)
	end;
	--InitCommand=cmd(x,SCREEN_WIDTH+SCREEN_CENTER_X;y,SCREEN_CENTER_Y*0.5); -- scroller
	ShowCommand=function(self)
		self:stoptweening():bounceend(0.5):x(math.floor(WideScale(SCREEN_CENTER_X*1.425,SCREEN_CENTER_X*1.35)))
	end;
	HideCommand=function(self)
		self:stoptweening():bouncebegin(0.5):x(SCREEN_WIDTH+SCREEN_CENTER_X)
	end;
	MenuStateChangedMessageCommand=function(self,param)
		if param.NewState == "MenuState_LifeFrame" then
			self:playcommand("Show")
		elseif param.NewState == "MenuState_Main" then
			self:playcommand("Hide")
		end;
	end;

	LoadActor("_lifeframe 02")..{
		-- prototype:
		--[[
		BeginCommand=function(self)
			self:hide_if(curIndex ~= 2)
		end;
		GainFocusCommand=function(self)
			self:stoptweening():visible(true):glowshift():effectperiod(0.5):effectcolor1(color("1,1,1,0.375")):effectcolor2(color("1,1,1,0"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():stopeffect():visible(false)
		end;
		--]]
		-- production:
		InitCommand=function(self)
			self:y(40)
		end;
		BeginCommand=function(self)
			self:playcommand(curIndex == 1 and "GainFocus" or "LoseFocus");
		end;
		GainFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("1,1,1,1"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("0.8,0.8,0.8,0.5"))
		end;
		LifeFrameChangedMessageCommand=function(self,param)
			if param.OldIndex == 1 then
				self:playcommand("LoseFocus");
			end;
			if param.NewIndex == 1 then
				self:playcommand("GainFocus");
			end;
		end;
	};

	LoadActor("_lifeframe 01")..{
		-- prototype:
		--[[
		BeginCommand=function(self)
			self:hide_if(curIndex ~= 1)
		end;
		GainFocusCommand=function(self)
			self:stoptweening():visible(true):glowshift():effectperiod(0.5):effectcolor1(color("1,1,1,0.375")):effectcolor2(color("1,1,1,0"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():stopeffect():visible(false)
		end;
		--]]
		-- production:
		InitCommand=function(self)
			self:y(100)
		end;
		BeginCommand=function(self)
			self:playcommand(curIndex == 2 and "GainFocus" or "LoseFocus");
		end;
		GainFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("1,1,1,1"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("0.8,0.8,0.8,0.5"))
		end;
		LifeFrameChangedMessageCommand=function(self,param)
			if param.OldIndex == 2 then
				self:playcommand("LoseFocus");
			end;
			if param.NewIndex == 2 then
				self:playcommand("GainFocus");
			end;
		end;
	};

	LoadActor("_lifeframe 03")..{
		-- prototype:
		--[[
		BeginCommand=function(self)
			self:hide_if(curIndex ~= 3)
		end;
		GainFocusCommand=function(self)
			self:stoptweening():visible(true):glowshift():effectperiod(0.5):effectcolor1(color("1,1,1,0.375")):effectcolor2(color("1,1,1,0"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():stopeffect():visible(false)
		end;
		--]]
		-- production:
		InitCommand=function(self)
			self:y(160)
		end;
		BeginCommand=function(self)
			self:playcommand(curIndex == 3 and "GainFocus" or "LoseFocus");
		end;
		GainFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("1,1,1,1"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("0.8,0.8,0.8,0.5"))
		end;
		LifeFrameChangedMessageCommand=function(self,param)
			if param.OldIndex == 3 then
				self:playcommand("LoseFocus");
			end;
			if param.NewIndex == 3 then
				self:playcommand("GainFocus");
			end;
		end;
	};

	LoadActor("_lifeframe 04")..{
		-- prototype:
		--[[
		BeginCommand=function(self)
			self:hide_if(curIndex ~= 4)
		end;
		GainFocusCommand=function(self)
			self:stoptweening():visible(true):glowshift():effectperiod(0.5):effectcolor1(color("1,1,1,0.375")):effectcolor2(color("1,1,1,0"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():stopeffect():visible(false)
		end;
		--]]
		-- production:
		InitCommand=function(self)
			self:y(220)
		end;
		BeginCommand=function(self)
			self:playcommand(curIndex == 4 and "GainFocus" or "LoseFocus");
		end;
		GainFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("1,1,1,1"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("0.8,0.8,0.8,0.5"))
		end;
		LifeFrameChangedMessageCommand=function(self,param)
			if param.OldIndex == 4 then
				self:playcommand("LoseFocus");
			end;
			if param.NewIndex == 4 then
				self:playcommand("GainFocus");
			end;
		end;
	};

	-- scroller version
	--[[
	Def.ActorScroller{
		SecondsPerItem=0;
		NumItemsToShow=3;
		InitCommand=function(self)
			self:y(8):SetCurrentAndDestinationItem(curIndex-1):setmask(320,80)
		end;
		TransformFunction=function(self, offset, itemIndex, numItems)
			self:y(offset*80);
		end;
		OnCommand=function(self)
			self:PositionItems()
		end;
		LifeFrameChangedMessageCommand=function(self,param)
			-- param.NewIndex
			self:SetCurrentAndDestinationItem(param.NewIndex-1);
		end;
		children = {
			Def.ActorFrame{
				LoadActor("_lifeframe 01")..{
					-- run stuff here ok
				};
			};
			Def.ActorFrame{
				LoadActor("_lifeframe 02")..{
					-- run stuff here ok
				};
			};
			Def.ActorFrame{
				LoadActor("_lifeframe 03")..{
					-- run stuff here ok
				};
			};
			Def.ActorFrame{
				LoadActor("_lifeframe 04")..{
					-- run stuff here ok
				};
			};
		};
	};
	--]]
};

t[#t+1] = menu;

return t;