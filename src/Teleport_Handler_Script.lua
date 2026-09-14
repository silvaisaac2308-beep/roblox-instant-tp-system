-- ============================================
-- TELEPORT HANDLER - CONTROLE DE TELETRANSPORTE
-- LocalScript em StarterPlayer > StarterCharacterScripts
-- ============================================

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = script.Parent

-- Aguardar HumanoidRootPart
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

-- Variável para armazenar a última posição válida
local lastValidPosition = humanoidRootPart.CFrame
local isTeleporting = false

-- Função segura de teletransporte
local function safeTeleport(targetCFrame)
	if isTeleporting then return end
	isTeleporting = true
	
	-- Garantir que o personagem está vivo
	if humanoid.Health > 0 then
		-- Teletransporta usando CFrame (mais seguro)
		humanoidRootPart.CFrame = targetCFrame
		
		-- Aguarda um frame para o servidor sincronizar
		game:GetService("RunService").Heartbeat:Wait()
		
		print("✅ Teletransporte bem-sucedido!")
	else
		print("⚠️ Personagem está morto!")
	end
	
	isTeleporting = false
end

-- Remover script após morrer (para evitar conflitos com novo personagem)
humanoid.Died:Connect(function()
	print("⚠️ Personagem morreu. Limpando scripts...")
	wait(1)
	script:Destroy()
end)

-- Criar RemoteEvent para comunicação com GUI
local teleportEvent = Instance.new("RemoteEvent")
teleportEvent.Name = "TeleportEvent"
teleportEvent.Parent = character

-- Detectar requisições de teletransporte
teleportEvent.OnServerEvent:Connect(function(player, targetPosition)
	if targetPosition then
		safeTeleport(targetPosition)
	end
end)

print("✅ Teleport Handler inicializado para", character.Name)