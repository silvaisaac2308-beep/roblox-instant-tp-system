# 🚀 Sistema de Teleporte Instant TP para Roblox
## Estilo Steal a Brainrot com GUI Arcade Moderna

![Roblox](https://img.shields.io/badge/Roblox-Lua-red?logo=roblox)
![License](https://img.shields.io/badge/License-Free-green)
![Status](https://img.shields.io/badge/Status-Completo-brightgreen)

---

## 📋 O que é?

Sistema completo e funcional de **Teleporte Instant TP** inspirado no jogo "Steal a Brainrot" do Roblox. Inclui:

✅ **GUI Arcade Moderna** - Interface com neon brilhante
✅ **Salvar Posição** - Guarde sua posição atual
✅ **Instant TP** - Teletransporte instantâneo
✅ **Detecção Automática** - Teleporte ao coletar Brainrot
✅ **Compatível com Mobile** - Funciona perfeitamente em celular
✅ **Design Escuro com Neon** - Visual futurista
✅ **Sem Reset de Personagem** - Teleporte 100% seguro
✅ **Atalhos de Teclado** - F para salvar, G para teleportar

---

## 🎮 Features Principais

### 1️⃣ Interface GUI
- Painel flutuante com botões coloridos
- Efeitos hover e animações suaves
- Status em tempo real
- Adaptável para desktop e mobile

### 2️⃣ Sistema de Teleporte
- Usa CFrame (método mais seguro)
- Sem bugs de respawn
- Teleporte instantâneo
- Sincronização de rede

### 3️⃣ Detecção de Brainrot
- Funciona com toque/colisão
- Teleporte automático ao coletar
- Configurável por item
- Detecção global opcional

### 4️⃣ Personalização
- Cores RGB ajustáveis
- Tempo de teleporte configurável
- Posição da base customizável
- Atalhos de teclado modificáveis

---

## 🛠️ Instalação Rápida

### Passo 1: Clonar os Scripts
Baixe os arquivos do repositório:
```bash
git clone https://github.com/silvaisaac2308-beep/roblox-instant-tp-system.git
```

### Passo 2: Inserir no Roblox Studio

**GUI Script** → `StarterGui > InstantTPGui > LocalScript`
- Arquivo: `src/GUI_InstantTP_Script.lua`

**Teleport Handler** → `StarterPlayer > StarterCharacterScripts > LocalScript`
- Arquivo: `src/Teleport_Handler_Script.lua`

**Brainrot Detector** → `Workspace > Brainrot > Script` (para cada item)
- Arquivo: `src/Brainrot_Detector_Script.lua`

### Passo 3: Configurar
Edite em `src/Brainrot_Detector_Script.lua`:
```lua
local BASE_POSITION = Vector3.new(0, 5, 0)  -- Mude para sua base!
```

### Passo 4: Testar
Clique em Play (F5) no Roblox Studio e teste!

---

## 📚 Estrutura do Projeto

```
roblox-instant-tp-system/
│
├── README.md                          # Este arquivo
├── GUIA_INSTALACAO.md                 # Guia básico rápido
│
├── src/
│   ├── GUI_InstantTP_Script.lua       # ⭐ Interface Arcade
│   ├── Teleport_Handler_Script.lua    # ⭐ Controle de teleporte
│   ├── Brainrot_Detector_Script.lua   # ⭐ Detecção de coleta
│   └── CONFIG.lua                     # Configurações globais
│
└── docs/
    ├── INSTALLATION_GUIDE.md          # Guia visual detalhado
    └── EXEMPLOS_ADICIONAIS.lua        # Extras: efeitos, sons, etc
```

---

## 🎯 Como Usar

### Desktop
| Ação | Entrada |
|------|----------|
| Salvar Posição | Clique em "💾 SALVAR POS" ou **Tecla F** |
| Teletransportar | Clique em "🎯 INSTANT TP" ou **Tecla G** |
| Coletar Brainrot | Apenas toque e será teleportado automaticamente! |

### Mobile
| Ação | Entrada |
|------|----------|
| Salvar Posição | Toque em "💾 SALVAR POS" |
| Teletransportar | Toque em "🎯 INSTANT TP" |
| Coletar Brainrot | Toque no Brainrot e será teleportado! |

---

## 🎨 Personalização

### Mudar Cores
Abra `src/GUI_InstantTP_Script.lua`:
```lua
local backgroundColor = Color3.fromRGB(20, 20, 30)    -- Fundo
local neonColor = Color3.fromRGB(0, 255, 255)         -- Neon
local buttonColor = Color3.fromRGB(255, 20, 147)      -- Botões
```

### Mudar Velocidade
Abra `src/GUI_InstantTP_Script.lua`:
```lua
TweenInfo.new(0.5)  -- Mude 0.5 para velocidade desejada
```

### Mudar Posição da Base
Abra `src/Brainrot_Detector_Script.lua`:
```lua
local BASE_POSITION = Vector3.new(0, 5, 0)  -- Suas coordenadas aqui
```

---

## 📂 Arquivos Principais Explicados

### 1. GUI_InstantTP_Script.lua (280 linhas)
**O quê faz:** Cria a interface visual com botões
**Onde vai:** LocalScript em `StarterGui > InstantTPGui`
**Funciona:** No lado do cliente (LocalScript)

```lua
-- Cria painel com botões
-- Detecta cliques e teclado
-- Salva e carrega posições
-- Animações e efeitos visuais
```

### 2. Teleport_Handler_Script.lua (60 linhas)
**O quê faz:** Controla o teletransporte seguro
**Onde vai:** LocalScript em `StarterPlayer > StarterCharacterScripts`
**Funciona:** No lado do cliente (LocalScript)

```lua
-- Função de teleporte seguro
-- Usa CFrame para evitar bugs
-- Sincroniza com o servidor
```

### 3. Brainrot_Detector_Script.lua (90 linhas)
**O quê faz:** Detecta quando um Brainrot é coletado
**Onde vai:** Script em cada Brainrot ou em ServerScriptService
**Funciona:** No lado do servidor (Script)

```lua
-- Detecta toque no Brainrot
-- Teleporta jogador para base
-- Configurável por item
```

---

## 🐛 Troubleshooting

### ❌ GUI não aparece
✅ Verifique se LocalScript está em `StarterGui > InstantTPGui`
✅ Abra o Output (View → Output) e procure por erros
✅ Teste com Play (F5)

### ❌ Teleporte não funciona
✅ Confirme que há LocalScript em `StarterCharacterScripts`
✅ Salve uma posição ANTES de teleportar
✅ Verifique se o personagem está vivo

### ❌ Brainrot não teleporta
✅ Script deve estar DENTRO do objeto Brainrot
✅ Deve ser um `Script` (não LocalScript)
✅ Verifique se `AUTO_TELEPORT_ENABLED = true`
✅ Confirme coordenadas da base estão corretas

### ❌ GUI cortada em celular
✅ Ajuste `mainPanel.Size = UDim2.new(0, 250, 0, 200)`
✅ Reduza tamanho dos botões

---

## 🎁 Extras Inclusos

Veja `docs/EXEMPLOS_ADICIONAIS.lua` para:
- ✨ Efeitos visuais de teleporte
- 🔊 Sons ao teleportar
- ⏱️ Sistema de cooldown
- 📊 Mostrar distância até posição
- 🎯 Múltiplas posições salvas
- 👻 Modo ghost (atravessar paredes)
- E muito mais!

---

## 📖 Documentação Completa

- **GUIA_INSTALACAO.md** - Guia rápido de 5 minutos
- **docs/INSTALLATION_GUIDE.md** - Guia visual detalhado passo a passo
- **docs/EXEMPLOS_ADICIONAIS.lua** - 10 exemplos extras prontos para usar
- **src/CONFIG.lua** - Todas as configurações em um lugar

---

## 🎓 O que Você Aprenderá

Ao usar este projeto, você aprenderá:
- ✅ Como criar GUIs em Roblox com Lua
- ✅ Eventos e conexões (InputBegan, TouchInputBegan)
- ✅ Tween Service para animações
- ✅ CFrame para teletransportes seguros
- ✅ LocalScript vs Script (cliente vs servidor)
- ✅ Sincronização de rede no Roblox
- ✅ Boas práticas de organização de código

---

## 💡 Dicas Pro

1. **Teste em modo Play** antes de publicar
2. **Use mesma CFrame** para evitar bugs de respawn
3. **Sincronize posições** entre cliente e servidor
4. **Adicione animações** para visual legal
5. **Crie sons** para feedback auditivo
6. **Teste com amigos** para verificar sincronização

---

## 🤝 Contribuições

Deseja melhorar este projeto? Sinta-se livre para:
- Fork o repositório
- Adicionar novas funcionalidades
- Melhorar a documentação
- Reportar bugs

---

## 📝 Licença

Este projeto é **100% livre para usar** em seus jogos Roblox!

---

## 🎉 Pronto para Começar?

1. ✅ Clone/baixe o repositório
2. ✅ Siga o guia de instalação
3. ✅ Coloque os scripts nos lugares corretos
4. ✅ Configure a posição da sua base
5. ✅ Teste e divirta-se! 🚀

---

## 📞 Suporte

Dúvidas? Confira:
- `docs/INSTALLATION_GUIDE.md` para guia visual
- `docs/EXEMPLOS_ADICIONAIS.lua` para extras
- Console Output (View → Output) para erros
- Certifique-se que todos os scripts estão nos lugares corretos

---

**Desenvolvido com ❤️ para Roblox Studio**

*Versão 1.0 - Setembro 2026*

🌟 Se este projeto te ajudou, deixe uma ⭐ no GitHub!