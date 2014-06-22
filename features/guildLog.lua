local addon, ns = ...

local customiseguildLog = function()

	GUILDEVENT_TYPE_INVITE = "%s |cffE7E716invites|r %s";
	GUILDEVENT_TYPE_JOIN = "%s |cff298F00joins|r the guild";
	GUILDEVENT_TYPE_QUIT = "%s |cffff0000leaves|r the guild";

end

ns.features.guildLog = customiseguildLog
