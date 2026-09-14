-- ============================================
-- EXEMPLOS ADICIONAIS - EXTRAS E RECURSOS
-- Use esses exemplos para expandir o sistema
-- ============================================

-- ============================================
-- EXEMPLO 1: EFEITOS VISUAIS DE TELEPORTE
-- ============================================

local function teleportWithEffects(targetCFrame)
	local character = game.Players.LocalPlayer.Character
	local hrp = character:FindFirstChild("HumanoidRootPart")
	
	if hrp then
		-- Criar partícula de saída
		local particles = Instance.new("ParticleEmitter")
		particles.Parent = hrp
		particles.Enabled = true
		particles.Rate = 50
		particles.Speed = NumberRange.new(10, 20)
		particles.Lifetime = NumberRange.new(0.5, 1)
		particles.Color = ColorSequence.new(Color3.fromRGB(0, 255, 255))
		
		-- Aguardar um pouco
		wait(0.3)
		
		-- Desabilitar partículas
		particles.Enabled = false
		
		-- Teletransportar
		hrp.CFrame = targetCFrame
		
		-- Efeito pós-teleporte
		particles.Enabled = true
		wait(0.5)
		particles.Enabled = false
	end
end

-- ============================================
-- EXEMPLO 2: SONS AO TELEPORTAR
-- ============================================

local function teleportWithSound(targetCFrame)
	local character = game.Players.LocalPlayer.Character
	local hrp = character:FindFirstChild("HumanoidRootPart")
	
	if hrp then
		-- Som de saída
		local soundOut = Instance.new("Sound")
		soundOut.Parent = hrp
		soundOut.SoundId = "rbxassetid://553641081" -- Som neon
		soundOut.Volume = 0.5
		soundOut:Play()
		
		wait(0.2)
		
		-- Teletransportar
		hrp.CFrame = targetCFrame
		
		-- Som de entrada
		local soundIn = Instance.new("Sound")
		soundIn.Parent = hrp
		soundIn.SoundId = "rbxassetid://553641081"
		soundIn.Volume = 0.5
		soundIn.PlayOnRemove = true
		game:GetService("Debris"):AddItem(soundIn, 2)
	end
end

-- ============================================
-- EXEMPLO 3: SISTEMA DE COOLDOWN
-- ============================================

local lastTeleportTime = 0
local TELEPORT_COOLDOWN = 1 -- 1 segundo de cooldown

local function teleportWithCooldown(targetCFrame)
	local currentTime = tick()
	
	if currentTime - lastTeleportTime < TELEPORT_COOLDOWN then
		print("⏳ Aguarde " .. string.format("%.1f", TELEPORT_COOLDOWN - (currentTime - lastTeleportTime)) .. "s")
		return false
	end
	
	lastTeleportTime = currentTime
	
	local character = game.Players.LocalPlayer.Character
	local hrp = character:FindFirstChild("HumanoidRootPart")
	
	if hrp then
		hrp.CFrame = targetCFrame
		print("✅ Teleportado!")
		return true
	end
	
	return false
end

-- ============================================
-- EXEMPLO 4: MOSTRAR DISTÂNCIA ATÉ POSIÇÃO
-- ============================================

local function showDistanceToPosition(targetPosition)
	local character = game.Players.LocalPlayer.Character
	local hrp = character:FindFirstChild("HumanoidRootPart")
	
	if hrp then
		local distance = (hrp.Position - targetPosition).Magnitude
		print("📍 Distância: " .. string.format("%.2f", distance) .. " studs")
		return distance
	end
end

-- ============================================
-- EXEMPLO 5: MÚLTIPLAS POSIÇÕES SALVAS
-- ============================================

local savedPositions = {}

local function savPositionWithName(name)
	local character = game.Players.LocalPlayer.Character
	local hrp = character:FindFirstChild("HumanoidRootPart")
	
	if hrp then
		savedPositions[name] = hrp.CFrame
		print("✅ Posição '" .. name .. "' salva!")
	end
end

local function teleportToNamedPosition(name)
	if savedPositions[name] then
		local character = game.Players.LocalPlayer.Character
		local hrp = character:FindFirstChild("HumanoidRootPart")
		
		if hrp then
			hrp.CFrame = savedPositions[name]
			print("🎯 Teleportado para '" .. name .. "'!")
		end
	else
		print("⚠️ Posição '" .. name .. "' não encontrada!")
	end
end

-- Exemplo de uso:
-- savPositionWithName("base")
-- savPositionWithName("loja")
-- teleportToNamedPosition("base")

-- ============================================
-- EXEMPLO 6: MODO GHOST (ATRAVESSAR PAREDES)
-- ============================================

local isGhostMode = false

local function toggleGhostMode()
	local character = game.Players.LocalPlayer.Character
	
	for _, part in pairs(character:GetDescendants()) do
		if part:IsA("BasePart") then
			if isGhostMode then
				part.CanCollide = true
			else
				part.CanCollide = false
			end
		end
	end
	
	isGhostMode = not isGhostMode
	print("👻 Modo Ghost: " .. (isGhostMode and "ATIVADO" or "DESATIVADO"))
end

-- ============================================
-- EXEMPLO 7: TELEPORTE COM ANIMAÇÃO SUAVE
-- ============================================

local function smoothTeleport(targetCFrame, duration)
	duration = duration or 0.5
	
	local character = game.Players.LocalPlayer.Character
	local hrp = character:FindFirstChild("HumanoidRootPart")
	
	if hrp then
		local tweenService = game:GetService("TweenService")
		local tweenInfo = TweenInfo.new(
			duration,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.InOut
		)
		
		local tween = tweenService:Create(hrp, tweenInfo, {CFrame = targetCFrame})
		tween:Play()
	end
end

-- ============================================
-- EXEMPLO 8: TELEPORTE COM CONFIRMAÇÃO
-- ============================================

local function teleportWithConfirmation(targetCFrame, timeoutSeconds)
	timeoutSeconds = timeoutSeconds or 5
	
	print("❓ Teleportar? Digite 'sim' no chat em " .. timeoutSeconds .. "s...")
	
	local answered = false
	local confirmed = false
	
	local startTime = tick()
	
	-- Simular confirmação (em um jogo real, usaria eventos de chat)
	wait(1) -- Aguardar resposta
	confirmed = true
	answered = true
	
	if confirmed then
		local character = game.Players.LocalPlayer.Character
		local hrp = character:FindFirstChild("HumanoidRootPart")
		
		if hrp then
			hrp.CFrame = targetCFrame
			print("✅ Teleportado!")
		end
	else
		print("❌ Teleporte cancelado!")
	end
end

-- ============================================
-- EXEMPLO 9: TELEPORTE PARA JOGADOR
-- ============================================

local function teleportToPlayer(playerName)
	local targetPlayer = game.Players:FindFirstChild(playerName)
	
	if targetPlayer and targetPlayer.Character then
		local targetHrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
		
		if targetHrp then
			local character = game.Players.LocalPlayer.Character
			local hrp = character:FindFirstChild("HumanoidRootPart")
			
			if hrp then
				hrp.CFrame = targetHrp.CFrame + Vector3.new(5, 0, 0)
				print("🎯 Teleportado para " .. playerName .. "!")
			end
		end
	else
		print("⚠️ Jogador '" .. playerName .. "' não encontrado!")
	end
end

-- ============================================
-- EXEMPLO 10: MACRO DE TELEPORTE RÁPIDO
-- ============================================

local UserInputService = game:GetService("UserInputService")

local teleportMacros = {
	[Enum.KeyCode.One] = Vector3.new(0, 5, 0),
	[Enum.KeyCode.Two] = Vector3.new(50, 5, 0),
	[Enum.KeyCode.Three] = Vector3.new(-50, 5, 0),
}

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	if teleportMacros[input.KeyCode] then
		local targetPosition = teleportMacros[input.KeyCode]
		local character = game.Players.LocalPlayer.Character
		local hrp = character:FindFirstChild("HumanoidRootPart")
		
		if hrp then
			hrp.CFrame = CFrame.new(targetPosition)
			print("⚡ Macro TP: " .. tostring(targetPosition))
		end
	end
end)

print("✅ Exemplos adicionais carregados!")
print("📚 Use as funções acima em seus scripts para expandir as funcionalidades.")
