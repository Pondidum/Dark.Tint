local addon, ns = ...

local model = {

	new = function()

		local this = {}

		this.map = Minimap
		this.header = MinimapZoneTextButton
		this.headerText = MinimapZoneText
		this.border = MinimapBorderTop
		this.background = MinimapBackdrop
		this.cluster = MinimapCluster

		this.buttons = {}
		this.buttons.worldMap = MiniMapWorldMapButton
		this.buttons.zoomIn = MinimapZoomIn
		this.buttons.zoomOut = MinimapZoomOut
		this.buttons.recording = MiniMapRecordingButton

		local clock = TimeManagerClockButton
		local clockBorder, clockText, clockAlarmTexture = clock:GetRegions()

		this.clock = {
			button = clock,
			border = clockBorder,
			text = clockText,
			alarm = clockAlarmTexture,
		}

		this.mail = {
			button = MiniMapMailFrame,
			icon = MiniMapMailIcon,
			border = MiniMapMailBorder,
		}

		this.queue = {
			button = QueueStatusMinimapButton,
			icon = QueueStatusMinimapButtonIcon,
			border = QueueStatusMinimapButtonBorder,
		}

		this.tracking = {
			button = MiniMapTracking,
			background = MiniMapTrackingBackground,
			border = MiniMapTrackingButtonBorder,
			icon = MiniMapTrackingIcon,
			overlay = MiniMapTrackingButton
		}

		this.icons = {}
		this.icons.instanceDifficulty = MiniMapInstanceDifficulty
		this.icons.guildDifficulty = GuildInstanceDifficulty
		this.icons.challengeMode = MiniMapChallengeMode

		return this

	end,

}

ns.mapping.model = model
