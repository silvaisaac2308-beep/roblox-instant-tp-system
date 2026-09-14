-- ============================================
-- BRAINROT DETECTOR - DETECÇÃO AUTOMÁTICA DE COLETA
-- Script normal em cada Brainrot ou em ServerScriptService
-- ============================================

local Players = game:GetService("Players")

-- ⚙️ CONFIGURAÇÕES
local BASE_POSITION = Vector3.new(0, 5, 0)  -- Mude para a posição da sua base
local BRAINROT_NAME = "Brainrot"  -- Nome do objeto do Brainrot
local TELEPORT_DELAY = 0.5  -- Tempo antes de teleportar (em segundos)
local AUTO_TELEPORT_ENABLED = true  -- Ativar teleporte automático

-- Se este script estiver DENTRO do Brainrot
local brainrot = script.Parent
local touchConnection

-- Função para teleportar o jogador
local function teleportPlayerToBase(character)
	if not character then return end
	
	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	if humanoidRootPart then
		wait(TELEPORT_DELAY)
		
		-- Teletransporta para a base
		humanoidRootPart.CFrame = CFrame.new(BASE_POSITION + Vector3.new(0, 3, 0))
		
		print("🎯 Jogador teleportado para a base!")
		return true
	end
	return false
end

-- Função para detectar o jogador que tocou
local function onBrainrotTouched(hit)
	-- Verificar se quem tocou foi um jogador
	local humanoid = hit.Parent:FindFirstChild("Humanoid")
	if not humanoid then return end
	
	local character = hit.Parent
	local player = Players:GetPlayerFromCharacter(character)
	
	if player and AUTO_TELEPORT_ENABLED then
		print("✅ Brainrot coletado por:", player.Name)
		
		-- Teleportar o jogador
		teleportPlayerToBase(character)
		
		-- Remover o Brainrot (opcional)
		-- brainrot:Destroy()
	end
end

-- Conectar evento de toque
if brainrot then
	touchConnection = brainrot.Touched:Connect(onBrainrotTouched)
	print("✅ Brainrot Detector ativado para:", brainrot.Name)
end

-- Limpeza ao deletar
script.AncestryChanged:Connect(function()
	if touchConnection then
		touchConnection:Disconnect()
	end
end)

-- ============================================
-- ALTERNATIVA: DETECTOR GLOBAL (para todos os Brainrots)
-- Coloque este código em ServerScriptService se preferir
-- ============================================

--[[
local function setupBrainrotDetector()
	-- Procurar por todos os Brainrots na workspace
	local function scanForBrainrots(parent)
		for _, obj in pairs(parent:GetChildren()) do
			if obj.Name:find(BRAINROT_NAME) or obj.Name:lower():find("brainrot") then
				if obj:FindFirstChild("Humanoid") == nil then
					-- É um item, não um personagem
					obj.Touched:Connect(onBrainrotTouched)
					print("✅ Detector conectado a:", obj.Name)
				end
			end
			
			-- Recursivamente procurar em subpastas
			scanForBrainrots(obj)
		end
	end
	
	scanForBrainrots(workspace)
	
	-- Monitorar novos Brainrots que forem adicionados
	workspace.DescendantAdded:Connect(function(descendant)
		if descendant.Name:find(BRAINROT_NAME) or descendant.Name:lower():find("brainrot") then
			if descendant:FindFirstChild("Humanoid") == nil then
				wait(0.1)
				descendant.Touched:Connect(onBrainrotTouched)
				print("✅ Novo Brainrot detectado:", descendant.Name)
			end
		end
	end)
end

setupBrainrotDetector()
--]]