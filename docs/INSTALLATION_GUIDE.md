## 📘 GUIA COMPLETO DE INSTALAÇÃO - INSTANT TP SYSTEM

---

## 🚀 INÍCIO RÁPIDO (5 MINUTOS)

### Passo 1️⃣: Criar a ScreenGui
```
StarterGui (clique direito)
  ↓
Insert Object
  ↓
ScreenGui
  ↓
Renomear para: "InstantTPGui"
```

**Propriedades da ScreenGui:**
- Name: `InstantTPGui`
- ResetOnSpawn: `false`
- IgnoreGuiInset: `false`

---

### Passo 2️⃣: Inserir o Script GUI

**Dentro de InstantTPGui:**
```
InstantTPGui (clique direito)
  ↓
Insert Object
  ↓
LocalScript
```

**Cole o código de:** `src/GUI_InstantTP_Script.lua`

✅ A GUI deve aparecer automaticamente quando você entrar no jogo!

---

### Passo 3️⃣: Configurar Teleporte Handler

**Vá para StarterPlayer:**
```
StarterPlayer (clique direito)
  ↓
StarterCharacterScripts (clique direito)
  ↓
Insert Object
  ↓
LocalScript
```

**Cole o código de:** `src/Teleport_Handler_Script.lua`

---

### Passo 4️⃣: Configurar Detecção de Brainrot

#### Opção A: Cada Brainrot tem um Script (RECOMENDADO)

Para cada item Brainrot no seu jogo:
```
[Seu Brainrot] (clique direito)
  ↓
Insert Object
  ↓
Script (⚠️ NÃO LocalScript!)
```

**Cole o código de:** `src/Brainrot_Detector_Script.lua`

**⚙️ IMPORTANTE:** Edite a linha 8:
```lua
local BASE_POSITION = Vector3.new(0, 5, 0)  -- Mude para sua base!
```

Para encontrar as coordenadas da sua base:
1. Vá até a posição desejada no jogo
2. Olhe o Console Output
3. Procure por mensagens do teleporte
4. Use as coordenadas X, Y, Z

#### Opção B: Um Script Global (ServerScriptService)

Se preferir apenas um script detectar todos os Brainrots:

```
ServerScriptService (clique direito)
  ↓
Insert Object
  ↓
Script
```

Cole o código de: `src/Brainrot_Detector_Script.lua`

**Descomente** a seção "ALTERNATIVA: DETECTOR GLOBAL" (remova `--[[` e `--]]`)

---

## 🎮 COMO USAR

### Desktop
| Ação | Botão/Tecla |
|------|-------------|
| Salvar Posição | Clique em "💾 SALVAR POS" ou Pressione **F** |
| Teletransportar | Clique em "🎯 INSTANT TP" ou Pressione **G** |

### Mobile
| Ação | Toque |
|------|-------|
| Salvar Posição | Toque em "💾 SALVAR POS" |
| Teletransportar | Toque em "🎯 INSTANT TP" |

### Coleta Automática de Brainrot
Simplesmente pegue um Brainrot e será teleportado automaticamente!

---

## 🎨 PERSONALIZAR CORES

Abra `src/GUI_InstantTP_Script.lua` e procure por:

```lua
-- Cores do tema Arcade/Neon
local backgroundColor = Color3.fromRGB(20, 20, 30)      -- Fundo escuro
local neonColor = Color3.fromRGB(0, 255, 255)           -- Cyan neon
local buttonColor = Color3.fromRGB(255, 20, 147)        -- Rosa/Pink
local textColor = Color3.fromRGB(255, 255, 255)         -- Branco
local accentColor = Color3.fromRGB(138, 43, 226)        -- Roxo
```

### Exemplos de Cores RGB Legais:
```lua
-- Verde Neon
Color3.fromRGB(0, 255, 0)

-- Laranja Quente
Color3.fromRGB(255, 127, 0)

-- Azul Elétrico
Color3.fromRGB(0, 100, 255)

-- Vermelho Intenso
Color3.fromRGB(255, 0, 50)

-- Amarelo Brilhante
Color3.fromRGB(255, 255, 0)
```

---

## 📍 ENCONTRAR COORDENADAS DA SUA BASE

### Método 1: Console Output
1. Vá até a posição da sua base
2. Clique em "💾 SALVAR POS"
3. Abra o **Output** (View → Output)
4. Procure por: `✅ Posição salva: CFrame.new(...)`
5. Anote os números X, Y, Z

### Método 2: Inspetor do Roblox
1. Selecione um objeto na sua base
2. No Properties, procure por "Position"
3. Copie os valores X, Y, Z

### Método 3: Script de Teste
Coloque este código em um Script para ver sua posição:
```lua
local player = game.Players.LocalPlayer
player.CharacterAdded:Connect(function(character)
	local hrp = character:WaitForChild("HumanoidRootPart")
	print("Sua posição:", hrp.Position)
end)
```

---

## 🔧 CONFIGURAÇÕES AVANÇADAS

### Mudar Tempo de Teleporte
Em `src/Brainrot_Detector_Script.lua`:
```lua
local TELEPORT_DELAY = 0.5  -- Mude para 0.1 (mais rápido) ou 1.0 (mais lento)
```

### Desativar Teleporte Automático
Em `src/Brainrot_Detector_Script.lua`:
```lua
local AUTO_TELEPORT_ENABLED = false  -- Mude para true/false
```

### Remover Brainrot Após Coletar
Em `src/Brainrot_Detector_Script.lua`, descomente:
```lua
-- brainrot:Destroy()  -- Remova os -- para ativar
```

---

## 🐛 TROUBLESHOOTING

### ❌ GUI Não Aparece
**Solução:**
- ✅ Verifique se o LocalScript está em `StarterGui > InstantTPGui`
- ✅ Verifique se o script não tem erros (abra o Output)
- ✅ Teste com `game.StarterGui:WaitForChild("InstantTPGui")`

### ❌ Teleporte Não Funciona
**Solução:**
- ✅ Confirme que há um LocalScript em `StarterCharacterScripts`
- ✅ Salve uma posição ANTES de teletransportar
- ✅ Verifique se o personagem está vivo
- ✅ Procure por erros no Output

### ❌ Brainrot Não Teleporta
**Solução:**
- ✅ O Script deve estar DENTRO do objeto Brainrot
- ✅ Deve ser um `Script` (não LocalScript)
- ✅ Verifique se `AUTO_TELEPORT_ENABLED = true`
- ✅ Confirme que a BASE_POSITION está correta

### ❌ Personagem Resetou/Morreu
**Solução:**
- ✅ O sistema usa CFrame (seguro), não deve resetar
- ✅ Verifique se o personagem não caiu do mapa
- ✅ Aumente `TELEPORT_DELAY` para 1.0

### ❌ GUI Cortada em Celular
**Solução:**
- ✅ Em `src/GUI_InstantTP_Script.lua`, ajuste:
```lua
mainPanel.Size = UDim2.new(0, 250, 0, 200)  -- Menor para mobile
```

---

## 📊 ESTRUTURA DE PASTAS

```
seu-jogo/
├── StarterGui
│   └── InstantTPGui (ScreenGui)
│       └── LocalScript (GUI_InstantTP_Script.lua)
│
├── StarterPlayer
│   └── StarterCharacterScripts
│       └── LocalScript (Teleport_Handler_Script.lua)
│
├── Workspace
│   ├── Brainrot1 (Part)
│   │   └── Script (Brainrot_Detector_Script.lua)
│   ├── Brainrot2 (Part)
│   │   └── Script (Brainrot_Detector_Script.lua)
│   └── Base (Folder)
│       └── SpawnPart
│
└── ServerScriptService
    └── Script (Brainrot_Detector_Script.lua) [OPCIONAL - alternativa global]
```

---

## ✅ CHECKLIST DE INSTALAÇÃO

- [ ] ScreenGui criada em StarterGui com nome "InstantTPGui"
- [ ] LocalScript dentro de InstantTPGui com GUI_InstantTP_Script.lua
- [ ] LocalScript em StarterCharacterScripts com Teleport_Handler_Script.lua
- [ ] Script (não LocalScript) em cada Brainrot com Brainrot_Detector_Script.lua
- [ ] BASE_POSITION alterada na linha 8 do Brainrot_Detector_Script.lua
- [ ] Testado em modo Play (F5)
- [ ] Botões aparecem na tela
- [ ] Tecla F salva posição
- [ ] Tecla G teletransporta
- [ ] Pegar Brainrot teleporta automaticamente

---

## 🎯 DICAS PRO

1. **Teste em modo Play** antes de publicar o jogo
2. **Use a mesma CFrame** para evitar bugs de respawn
3. **Sincronize posições** entre cliente e servidor
4. **Adicione animações** de teleporte para visual legal
5. **Crie som** ao teleportar para feedback auditivo
6. **Testes com amigos** para verificar sincronização de rede

---

## 📞 SUPORTE

Dúvidas? Verifique:
- O arquivo README.md na raiz do projeto
- O Console Output (View → Output) para erros
- Que todos os scripts estão nos lugares corretos
- Que nenhum script foi acidentalmente deletado

---

**🎉 Pronto! Seu sistema Instant TP está funcionando!**

Divirta-se criando seu jogo inspirado em Steal a Brainrot! 🚀