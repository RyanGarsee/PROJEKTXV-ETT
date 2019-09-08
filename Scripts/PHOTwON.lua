--[[
PHOTwON v2 for PROJEKT XV (using vyhd's new ThemePrefs system)

Specification:
PHOTwON normally writes to various text files for persisting information:
Graphics/
 * 1.txt: Life Meter Frame (1-4)
 * 2.txt: Judgment (1-4)

and some files for telling StepMania what to use:
Graphics /
 * Judgment 1x6.redir
 * LifeMeterBar frame.redir (normal or shrink)
 * LifeMeterBar normal.redir, LifeMeterBar hot.redir (unused in current PHOTwON)
 * ScreenGameplay life frame.redir
 * ScreenGameplay difficulty icons 2x6.redir (difficulty meters matching life frame)
--]]
local function OptionNameString(str) return THEME:GetString('OptionNames',str) end

local Prefs = {
	-- these don't need option rows:
	Judgment = {
		Default = "01",
		Choices = { "01", "02", "03", "04" },
		Values = { "01", "02", "03", "04" }
	},
	LifeFrame = {
		Default = "02",
		Choices = { "01", "02", "03", "04" },
		Values = { "01", "02", "03", "04" }
	},
	LifeMeterBarOver = {
		Default = "shrink",
		Choices = { OptionNameString('Normal'), OptionNameString('Shrink') },
		Values = { "norm", "shrink" }
	},
	LifeFrameCustomColor = {
		Default = "#FFFFFF",
		Choices = { OptionNameString('White') },
		Values = { "#FFFFFF" }
	},
	-- this is the only one I want to have an actual options row
	Use3DModels = {
		Default = true,
		Choices = { OptionNameString('Off'), OptionNameString('On') },
		Values = { false, true }
	},
}
ThemePrefs.InitAll(Prefs)
