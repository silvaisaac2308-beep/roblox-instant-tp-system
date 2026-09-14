# Sistema de Teleporte Instant TP para Roblox - Steal a Brainrot Style

Sistema completo de GUI Arcade para teleporte com interface moderna e funcionalidades automáticas de coleta.

## 📋 Funcionalidades

✅ **Salvar Posição** - Armazena a posição atual do jogador
✅ **Instant TP** - Teleporta para a posição salva
✅ **Detecção Automática de Brainrot** - Teleporta automaticamente ao pegar um item
✅ **GUI Arcade Moderna** - Interface estilo Steal a Brainrot
✅ **Compatível com Celular** - Funciona em dispositivos móveis
✅ **Design Escuro com Neon** - Estilo visual moderno
✅ **Sem Reset de Personagem** - Teleporte seguro

## 🎮 Onde Colocar os Scripts

### 1. **GUI Script** (LocalScript)
**Localização:** `StarterGui` → Nova ScreenGui → Dentro dela, coloque este LocalScript
**Arquivo:** `src/GUI_InstantTP_Script.lua`

### 2. **Teleporte Script** (LocalScript)
**Localização:** `StarterPlayer` → `StarterCharacterScripts`
**Arquivo:** `src/Teleport_Handler_Script.lua`

### 3. **Brainrot Detector** (Script no Servidor)
**Localização:** `ServerScriptService` ou dentro de cada Brainrot como Script normal
**Arquivo:** `src/Brainrot_Detector_Script.lua`

## 🛠️ Configuração Passo a Passo

### Passo 1: Criar a ScreenGui
1. Em StarterGui, clique com botão direito
2. Selecione "Insert Object" → "ScreenGui"
3. Renomeie para "InstantTPGui"
4. Propriedades:
   - ResetOnSpawn: false
   - IgnoreGuiInset: false

### Passo 2: Inserir o LocalScript GUI
1. Dentro de InstantTPGui, clique com botão direito
2. Selecione "Insert Object" → "LocalScript"
3. Cole o conteúdo de `GUI_InstantTP_Script.lua`

### Passo 3: Configurar Teleporte Handler
1. Vá para StarterPlayer
2. Clique com botão direito em StarterCharacterScripts
3. Selecione "Insert Object" → "LocalScript"
4. Cole o conteúdo de `Teleport_Handler_Script.lua`

### Passo 4: Configurar Detecção de Brainrot
1. Para cada item Brainrot no seu jogo:
   - Insira um Script normal (não LocalScript) nele
   - Cole o conteúdo de `Brainrot_Detector_Script.lua`
   - Na linha `local BASE_POSITION = Vector3.new(0, 5, 0)` ajuste a posição da sua base

### Passo 5: Testar
1. Clique em "Play" no Roblox Studio
2. Na GUI que aparecer, clique "SALVAR POS"
3. Afaste-se e clique "INSTANT TP"
4. Pegue um Brainrot (deve teleportar automaticamente)

## ⚙️ Personalizações

### Mudar Cor do Neon
Abra `GUI_InstantTP_Script.lua` e procure por:
```lua
backgroundColor = Color3.fromRGB(20, 20, 30)  -- Cor de fundo
neonColor = Color3.fromRGB(0, 255, 255)       -- Cor do neon (Cyan)
buttonColor = Color3.fromRGB(255, 20, 147)    -- Cor dos botões (Pink)
```

### Mudar Posição da Base
Abra `Brainrot_Detector_Script.lua` e altere:
```lua
local BASE_POSITION = Vector3.new(0, 5, 0)  -- Mude para sua base
```

### Mudar Velocidade da Animação
Abra `GUI_InstantTP_Script.lua` e altere:
```lua
game:GetService("TweenService"):Create(
    screenGui,
    TweenInfo.new(0.5),  -- Mude este valor para velocidade
    {Position = UDim2.new(0, 0, 0, 0)}
):Play()
```

## 📱 Compatibilidade Mobile

Os scripts já incluem ajustes automáticos:
- Botões maiores em celular
- TouchInputBegan detectado automaticamente
- GUI se adapta ao tamanho da tela

## 🐛 Troubleshooting

| Problema | Solução |
|----------|---------|
| GUI não aparece | Verifique se o LocalScript está em StarterGui |
| Teleporte não funciona | Confirme que há um LocalScript em StarterCharacterScripts |
| Brainrot não detecta | Verifique se o Script está dentro do objeto e se a rede permite |
| GUI cortada em celular | Ajuste os valores de UDim2 nos códigos |

## 📚 Estrutura do Projeto

```
roblox-instant-tp-system/
├── README.md
├── src/
│   ├── GUI_InstantTP_Script.lua          # Interface Arcade
│   ├── Teleport_Handler_Script.lua       # Sistema de teleporte
│   ├── Brainrot_Detector_Script.lua      # Detecção automática
│   └── CONFIG.lua                         # Configurações globais
└── docs/
    └── INSTALLATION_GUIDE.md              # Guia de instalação detalhado
```

## 🎯 Dicas Importantes

1. **Sempre teste em modo Play** antes de publicar
2. **Use a mesma CFrame para teleportar** sem bugs de respawn
3. **Coloque o Brainrot_Detector em ServerScriptService** se for um item global
4. **Sincronize as posições** entre cliente e servidor para evitar falhas de rede
5. **Ajuste o tamanho dos botões** conforme seu jogo

## 📝 Licença

Livre para uso em seus projetos Roblox!

---

**Criado com ❤️ para Roblox Studio**
