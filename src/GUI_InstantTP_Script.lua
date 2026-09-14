-- ============================================
-- GUI INSTANT TP - INTERFACE ARCADE
-- LocalScript em StarterGui > ScreenGui
-- ============================================

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Cores do tema Arcade/Neon
local backgroundColor = Color3.fromRGB(20, 20, 30)
local neonColor = Color3.fromRGB(0, 255, 255)
local buttonColor = Color3.fromRGB(255, 20, 147)
local textColor = Color3.fromRGB(255, 255, 255)
local accentColor = Color3.fromRGB(138, 43, 226)

-- Variável para armazenar posição
local savedPosition = nil

-- Detectar se é mobile
local isMobile = UserInputService.TouchEnabled and not UserInputService.MouseEnabled

-- Criar ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "InstantTPGui"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Container principal (painel)
local mainPanel = Instance.new("Frame")
mainPanel.Name = "MainPanel"
mainPanel.Size = UDim2.new(0, 300, 0, 250)
mainPanel.Position = UDim2.new(1, -320, 0, 20)
mainPanel.BackgroundColor3 = backgroundColor
mainPanel.BorderSizePixel = 0
mainPanel.Parent = screenGui

-- Efeito de borda neon
local borderGlow = Instance.new("UIStroke")
borderGlow.Color = neonColor
borderGlow.Thickness = 3
borderGlow.Parent = mainPanel

-- Canto arredondado
local cornerRadius = Instance.new("UICorner")
cornerRadius.CornerRadius = UDim.new(0, 15)
cornerRadius.Parent = mainPanel

-- Título com estilo Arcade
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundColor3 = accentColor
titleLabel.TextColor3 = textColor
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Text = "⚡ INSTANT TP ⚡"
titleLabel.BorderSizePixel = 0
titleLabel.Parent = mainPanel

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 15)
titleCorner.Parent = titleLabel

-- Texto de status
local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "Status"
statusLabel.Size = UDim2.new(1, -20, 0, 30)
statusLabel.Position = UDim2.new(0, 10, 0, 60)
statusLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
statusLabel.TextColor3 = neonColor
statusLabel.TextScaled = true
statusLabel.Font = Enum.Font.GothamMonospace
statusLabel.Text = "POS: NÃO SALVA"
statusLabel.BorderSizePixel = 0
statusLabel.Parent = mainPanel

local statusCorner = Instance.new("UICorner")
statusCorner.CornerRadius = UDim.new(0, 8)
statusCorner.Parent = statusLabel

-- Função para criar botão
local function createButton(name, text, posY)
	local button = Instance.new("TextButton")
	button.Name = name
	button.Size = UDim2.new(1, -20, 0, 40)
	button.Position = UDim2.new(0, 10, 0, posY)
	button.BackgroundColor3 = buttonColor
	button.TextColor3 = textColor
	button.TextScaled = true
	button.Font = Enum.Font.GothamBold
	button.Text = text
	button.BorderSizePixel = 0
	button.Parent = mainPanel
	
	-- Canto arredondado
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 10)
	corner.Parent = button
	
	-- Borda neon
	local stroke = Instance.new("UIStroke")
	stroke.Color = neonColor
	stroke.Thickness = 2
	stroke.Parent = button
	
	-- Efeito hover
	button.MouseEnter:Connect(function()
		TweenService:Create(
			button,
			TweenInfo.new(0.2),
			{BackgroundColor3 = Color3.fromRGB(255, 50, 180)}
		):Play()
	end)
	
	button.MouseLeave:Connect(function()
		TweenService:Create(
			button,
			TweenInfo.new(0.2),
			{BackgroundColor3 = buttonColor}
		):Play()
	end)
	
	-- Efeito de clique
	local function onButtonClick()
		TweenService:Create(
			button,
			TweenInfo.new(0.1),
			{BackgroundColor3 = Color3.fromRGB(255, 100, 200)}
		):Play()
		
		wait(0.1)
		TweenService:Create(
			button,
			TweenInfo.new(0.1),
			{BackgroundColor3 = buttonColor}
		):Play()
	end
	
	button.MouseButton1Click:Connect(onButtonClick)
	
	return button
end

-- Criar botões
local saveButton = createButton("SaveButton", "💾 SALVAR POS", 100)
local tpButton = createButton("TPButton", "🎯 INSTANT TP", 150)

-- Função: Salvar Posição
local function savePosition()
	local currentCharacter = player.Character
	if currentCharacter then
		local hrp = currentCharacter:FindFirstChild("HumanoidRootPart")
		if hrp then
			savedPosition = hrp.CFrame
			statusLabel.Text = "POS: SALVA ✓"
			statusLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
			print("✅ Posição salva:", savedPosition)
		end
	end
end

-- Função: Teleportar
local function teleportToSaved()
	if savedPosition then
		local currentCharacter = player.Character
		if currentCharacter then
			local hrp = currentCharacter:FindFirstChild("HumanoidRootPart")
			if hrp then
				-- Usa CFrame para teletransporte seguro
				hrp.CFrame = savedPosition
				print("🎯 Teleportado para posição salva!")
			end
		end
	else
		statusLabel.Text = "⚠️ SALVE UMA POS PRIMEIRO"
		statusLabel.TextColor3 = Color3.fromRGB(255, 100, 50)
		print("⚠️ Nenhuma posição salva!")
	end
end

-- Conectar botões
saveButton.MouseButton1Click:Connect(savePosition)
tpButton.MouseButton1Click:Connect(teleportToSaved)

-- Atalhos de teclado (Desktop)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	if input.KeyCode == Enum.KeyCode.F then
		savePosition()
	elseif input.KeyCode == Enum.KeyCode.G then
		teleportToSaved()
	end
end)

-- Atualizar status quando morrer
player.CharacterAdded:Connect(function(newCharacter)
	statusLabel.Text = "POS: NÃO SALVA"
	statusLabel.TextColor3 = neonColor
	print("⚠️ Personagem recriado. Posição foi resetada.")
end)

print("✅ GUI Instant TP carregada com sucesso!")
print("📋 Comandos:")
print("  • Botão SALVAR POS ou tecla F: Salvar posição")
print("  • Botão INSTANT TP ou tecla G: Teletransportar")