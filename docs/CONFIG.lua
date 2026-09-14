-- ============================================
-- CONFIGURAÇÕES GLOBAIS DO SISTEMA
-- Edite este arquivo para personalizar tudo
-- ============================================

local CONFIG = {}

-- ============================================
-- CONFIGURAÇÕES DE CORES (RGB)
-- ============================================

CONFIG.Colors = {
	Background = Color3.fromRGB(20, 20, 30),
	Neon = Color3.fromRGB(0, 255, 255),
	ButtonPrimary = Color3.fromRGB(255, 20, 147),
	ButtonSecondary = Color3.fromRGB(138, 43, 226),
	Text = Color3.fromRGB(255, 255, 255),
	Success = Color3.fromRGB(0, 255, 100),
	Warning = Color3.fromRGB(255, 100, 50),
	Error = Color3.fromRGB(255, 50, 50),
}

-- ============================================
-- CONFIGURAÇÕES DE TELEPORTE
-- ============================================

CONFIG.Teleport = {
	BASE_POSITION = Vector3.new(0, 5, 0),
	TELEPORT_DELAY = 0.5,
	AUTO_TELEPORT_ENABLED = true,
	COOLDOWN = 1.0,
	USE_SOUND_EFFECTS = true,
	USE_PARTICLE_EFFECTS = true,
}

-- ============================================
-- CONFIGURAÇÕES DE GUI
-- ============================================

CONFIG.GUI = {
	PANEL_WIDTH = 300,
	PANEL_HEIGHT = 250,
	PANEL_POSITION_X = -320,
	PANEL_POSITION_Y = 20,
	BORDER_THICKNESS = 3,
	CORNER_RADIUS = 15,
	BUTTON_HEIGHT = 40,
	BUTTON_SPACING = 10,
}

-- ============================================
-- CONFIGURAÇÕES DE ATALHOS
-- ============================================

CONFIG.Hotkeys = {
	SAVE_POSITION = Enum.KeyCode.F,
	INSTANT_TP = Enum.KeyCode.G,
	TOGGLE_GUI = Enum.KeyCode.H,
}

-- ============================================
-- CONFIGURAÇÕES DE BRAINROT
-- ============================================

CONFIG.Brainrot = {
	DETECT_NAME = "brainrot",
	AUTO_DESTROY = false,
	GLOBAL_DETECTION = true,
	DETECTION_DELAY = 0.1,
}

-- ============================================
-- CONFIGURAÇÕES DE SONS
-- ============================================

CONFIG.Sounds = {
	SAVE_SOUND_ID = "rbxassetid://553641081",
	TP_SOUND_ID = "rbxassetid://553641081",
	SUCCESS_SOUND_ID = "rbxassetid://260417668",
	ERROR_SOUND_ID = "rbxassetid://151322429",
	VOLUME = 0.5,
}

-- ============================================
-- CONFIGURAÇÕES DE PARTÍCULAS
-- ============================================

CONFIG.Particles = {
	PARTICLE_RATE = 50,
	PARTICLE_SPEED_MIN = 10,
	PARTICLE_SPEED_MAX = 20,
	PARTICLE_LIFETIME = 0.5,
	PARTICLE_COLOR = Color3.fromRGB(0, 255, 255),
}

-- ============================================
-- CONFIGURAÇÕES DE DEBUG
-- ============================================

CONFIG.Debug = {
	ENABLE_CONSOLE = true,
	PRINT_ALL_EVENTS = false,
	PRINT_PERFORMANCE = false,
}

-- ============================================
-- FUNÇÃO PARA CARREGAR CONFIGURAÇÕES
-- ============================================

local function loadConfig()
	print("⚙️ Carregando configurações...")
	return CONFIG
end

-- ============================================
-- FUNÇÃO PARA RESETAR CONFIGURAÇÕES
-- ============================================

local function resetConfig()
	print("🔄 Resetando configurações para padrão...")
	-- Implementar reset se necessário
end

-- ============================================
-- EXPORTAR CONFIGURAÇÕES
-- ============================================

return {
	Config = CONFIG,
	LoadConfig = loadConfig,
	ResetConfig = resetConfig,
}
