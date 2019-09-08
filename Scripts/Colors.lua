-- k//eternal made both players white.
-- NO BLACK PEOPLE IN K//ETERNAL THEMES, I CALL DISCRIMINATION
function PlayerColor( pn ) return color("1,1,1,1"); end
-- I'm pretty sure that goes for this too, but thanks for caring enough, chris.
function PlayerScoreColor( pn ) return color("1,1,1,1") end

-- "let driving themes override just this table"
-- WITH PLEASURE!
local GameCustomDifficultyColors = {
	Beginner	= color("0.5,1,1,1"),
	Easy		= color("1,0.85,0,1"),
	Medium		= color("1,0,0,1"),
	Hard		= color("0.6,1,0,1"),
	Challenge	= color("0,0,1,1"),
	Edit		= color("1,1,1,1"),
};

function CustomDifficultyToColor(cd) return GameCustomDifficultyColors[cd] end;