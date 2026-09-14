-- ============================================
-- EXEMPLOS ADICIONAIS - INSTANT TP SYSTEM
-- Use estes scripts para funcionalidades extras
-- ============================================

-- ============================================
-- EXEMPLO 1: TELEPORTE COM EFEITO VISUAL
-- Coloque este código dentro de GUI_InstantTP_Script.lua
-- ============================================

--[[
local function createTeleportEffect(position)
	-- Criar esfera de luz
	local effect = Instance.new("Part")
	effect.Shape = Enum.PartType.Ball
	effect.Size = Vector3.new(2, 2, 2)
	effect.Position = position
	effect.CanCollide = false
	effect.Material = Enum.Material.Neon
	effect.Color = Color3.fromRGB(0, 255, 255)
	effect.TopSurface = Enum.SurfaceType.Smooth
	effect.BottomSurface = Enum.SurfaceType.Smooth
	effect.Parent = workspace
	
	-- Animar
	local tween = TweenService:Create(
		effect,
		TweenInfo.new(0.5),
		{Size = Vector3.new(0, 0, 0), Transparency = 1}
	)
	tween:Play()
	
	-- Remover após animação
	tween.Completed:Connect(function()
		effect:Destroy()
	end)
end
--]]

-- ============================================
-- EXEMPLO 2: SISTEMA DE MÚLTIPLAS POSIÇÕES
-- Salvar até 3 posições diferentes
-- ============================================

--[[
local savedPositions = {
	pos1 = nil,
	pos2 = nil,
	pos3 = nil
}

local function savePositionSlot(slot)
	local currentCharacter = player.Character
	if currentCharacter then
		local hrp = currentCharacter:FindFirstChild("HumanoidRootPart")
		if hrp then
			savedPositions[slot] = hrp.CFrame
			print("✅ Posição salva em slot:", slot)
		end
	end
end

local function teleportToSlot(slot)
	if savedPositions[slot] then
		local currentCharacter = player.Character
		if currentCharacter then
			local hrp = currentCharacter:FindFirstChild("HumanoidRootPart")
			if hrp then
				hrp.CFrame = savedPositions[slot]
				print("🎯 Teleportado para slot:", slot)
			end
		end
	end
end

-- Usar com teclas: F para pos1, G para pos2, H para pos3
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.F then savePositionSlot("pos1")
	elseif input.KeyCode == Enum.KeyCode.G then teleportToSlot("pos1")
	elseif input.KeyCode == Enum.KeyCode.H then savePositionSlot("pos2")
	elseif input.KeyCode == Enum.KeyCode.J then teleportToSlot("pos2")
	end
end)
--]]

-- ============================================
-- EXEMPLO 3: SOM AO TELEPORTAR
-- Adicione efeito sonoro
-- ============================================

--[[
local function teleportWithSound()
	if savedPosition then
		local currentCharacter = player.Character
		if currentCharacter then
			local hrp = currentCharacter:FindFirstChild("HumanoidRootPart")
			if hrp then
				-- Criar som
				local sound = Instance.new("Sound")
				sound.SoundId = "rbxassetid://1197822498"  -- Som de teleporte do Roblox
				sound.Volume = 0.5
				sound.Parent = hrp
				sound:Play()
				
				-- Teleportar
				hrp.CFrame = savedPosition
				
				-- Remover som após terminar
				game:GetService("Debris"):AddItem(sound, 2)
			end
		end
	end
end
--]]

-- ============================================
-- EXEMPLO 4: TELEPORTE COM COOLDOWN
-- Evitar spam de teletransporte
-- ============================================

--[[
local lastTeleportTime = 0
local TELEPORT_COOLDOWN = 1  -- 1 segundo entre teletransportes

local function teleportWithCooldown()
	local currentTime = tick()
	if currentTime - lastTeleportTime < TELEPORT_COOLDOWN then
		print("⏳ Aguarde", TELEPORT_COOLDOWN, "segundos para teleportar novamente")
		return
	end
	
	lastTeleportTime = currentTime
	teleportToSaved()
end
--]]

-- ============================================
-- EXEMPLO 5: MOSTRAR DISTÂNCIA ATÉ POSIÇÃO SALVA
-- Atualizar informação na GUI
-- ============================================

--[[
local function updateDistanceDisplay()
	if savedPosition then
		local currentCharacter = player.Character
		if currentCharacter then
			local hrp = currentCharacter:FindFirstChild("HumanoidRootPart")
			if hrp then
				local distance = (hrp.Position - savedPosition.Position).Magnitude
				statusLabel.Text = "DIST: " .. math.floor(distance) .. " stud"
				statusLabel.TextColor3 = neonColor
			end
		end
	end
end

-- Atualizar a cada frame
RunService.RenderStepped:Connect(updateDistanceDisplay)
--]]

-- ============================================
-- EXEMPLO 6: NOTIFICAÇÃO VISUAL DE TELEPORTE
-- Mostrar mensagem na tela
-- ============================================

--[[
local function showNotification(text, duration)
	duration = duration or 3
	
	local notif = Instance.new("TextLabel")
	notif.Size = UDim2.new(0, 300, 0, 50)
	notif.Position = UDim2.new(0.5, -150, 0, 20)
	notif.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
	notif.TextColor3 = Color3.fromRGB(0, 255, 255)
	notif.TextScaled = true
	notif.Font = Enum.Font.GothamBold
	notif.Text = text
	notif.Parent = screenGui
	
	wait(duration)
	notif:Destroy()
end

-- Uso:
-- showNotification("✅ Teleportado!", 2)
--]]

-- ============================================
-- EXEMPLO 7: VERIFICAR SE POSIÇÃO É SEGURA
-- Evitar teleportar para lugares com dano
-- ============================================

--[[
local function isSafePosition(position)
	-- Verificar se há lava, picos ou perigos perto
	local region = Region3.new(position - Vector3.new(5, 5, 5), position + Vector3.new(5, 5, 5))
	region = region:ExpandToGrid(4)
	
	local dangerParts = workspace:FindPartBoundsInRegion3(region, nil, 100)
	
	for _, part in pairs(dangerParts) do
		if part.Name:find("Lava") or part.Name:find("Spike") or part.Name:find("Danger") then
			return false
		end
	end
	
	return true
end
--]]

-- ============================================
-- EXEMPLO 8: LIMPAR BUFFER DE POSIÇÕES
-- Quando o jogo reinicia
-- ============================================

--[[
local function clearAllSavedPositions()
	savedPosition = nil
	savedPositions = {pos1 = nil, pos2 = nil, pos3 = nil}
	statusLabel.Text = "🔄 POSIÇÕES LIMPAS"
	print("🔄 Todas as posições foram limpas")
end

-- Chamar ao começar novo jogo
clearAllSavedPositions()
--]]

-- ============================================
-- EXEMPLO 9: EXPORTAR POSIÇÕES PARA JSON
-- Salvar e carregar posições persistentes
-- ============================================

--[[
local function exportPositions()
	local positions = {
		["pos1"] = {x = savedPosition.X, y = savedPosition.Y, z = savedPosition.Z}
	}
	
	-- Em um jogo real, você enviaria para um servidor/database
	print("Posições exportadas:", positions)
	return positions
end

local function importPositions(data)
	if data.pos1 then
		savedPosition = CFrame.new(data.pos1.x, data.pos1.y, data.pos1.z)
		print("✅ Posições carregadas do arquivo")
	end
end
--]]

-- ============================================
-- EXEMPLO 10: MODO GHOST (ATRAVESSAR PAREDES)
-- Teleporte super seguro
-- ============================================

--[[
local function ghostTeleport()
	if savedPosition then
		local currentCharacter = player.Character
		if currentCharacter then
			local hrp = currentCharacter:FindFirstChild("HumanoidRootPart")
			if hrp then
				-- Desativar colisão temporariamente
				hrp.CanCollide = false
				
				-- Teletransportar
				hrp.CFrame = savedPosition
				
				-- Reativar colisão após um frame
				game:GetService("RunService").Heartbeat:Wait()
				hrp.CanCollide = true
				
				print("👻 Teleporte Ghost concluído")
			end
		end
	end
end
--]]

print("✅ Exemplos carregados com sucesso!")
print("📚 Descomente os exemplos que deseja usar")