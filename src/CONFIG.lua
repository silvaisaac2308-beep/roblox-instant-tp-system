-- ============================================
-- CONFIGURAÇÕES GLOBAIS DO SISTEMA INSTANT TP
-- ============================================

local CONFIG = {}

-- 🎨 CORES DO TEMA
CONFIG.Colors = {
	backgroundColor = Color3.fromRGB(20, 20, 30),
	neonColor = Color3.fromRGB(0, 255, 255),
	buttonColor = Color3.fromRGB(255, 20, 147),
	textColor = Color3.fromRGB(255, 255, 255),
	accentColor = Color3.fromRGB(138, 43, 226),
	successColor = Color3.fromRGB(0, 255, 100),
	warningColor = Color3.fromRGB(255, 100, 50),
}

-- 📍 POSIÇÕES
CONFIG.Positions = {
	basePosition = Vector3.new(0, 5, 0),  -- MUDE AQUI para a posição da sua base
	spawnPosition = Vector3.new(0, 10, 0),  -- Posição de spawn padrão
}

-- ⚙️ TELEPORTE
CONFIG.Teleport = {
	enabled = true,
	delay = 0.5,  -- Tempo antes de teletransportar (segundos)
	autoTeleportOnBrainrot = true,  -- Teletransporte automático ao pegar Brainrot
	safeMode = true,  -- Modo seguro (não resetar personagem)
}

-- 🎮 GUI
CONFIG.GUI = {
	panelSize = UDim2.new(0, 300, 0, 250),
	panelPosition = UDim2.new(1, -320, 0, 20),
	cornerRadius = 15,
	strokeThickness = 3,
	animationSpeed = 0.2,
	isMobileOptimized = true,
}

-- 🔑 ATALHOS DE TECLADO
CONFIG.Keybinds = {
	save = Enum.KeyCode.F,  -- Pressione F para salvar posição
	teleport = Enum.KeyCode.G,  -- Pressione G para teletransportar
}

-- 🎯 BRAINROT
CONFIG.Brainrot = {
	name = "Brainrot",
	detectRadius = 10,
	autoRemoveAfterCollect = false,  -- Remove o Brainrot após coletar?
	cooldown = 0.1,  -- Cooldown entre detecções (segundos)
}

-- 📝 MENSAGENS
CONFIG.Messages = {
	savedPosition = "POS: SALVA ✓",
	notSavedPosition = "POS: NÃO SALVA",
	warningNoPosition = "⚠️ SALVE UMA POS PRIMEIRO",
	teleported = "🎯 Teleportado para posição salva!",
	collected = "✅ Brainrot coletado!",
	dead = "⚠️ Personagem está morto!",
}

return CONFIG