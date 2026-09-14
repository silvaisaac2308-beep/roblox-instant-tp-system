# 🚀 Guia Rápido de Instalação - Sistema Instant TP

## Tempo: 5 Minutos ⏱️

---

## Passo 1️⃣: Criar a ScreenGui

1. Abra **Roblox Studio**
2. Vá em **StarterGui**
3. Clique com direita → **Insert Object** → **ScreenGui**
4. Renomeie para: `InstantTPGui`

---

## Passo 2️⃣: Inserir o Script Principal

1. Clique em **InstantTPGui** (a gui que você criou)
2. Clique com direita → **Insert Object** → **LocalScript**
3. **Delete** o código padrão
4. **Copie e Cole** o conteúdo de `src/COMPLETE_UNIFIED_SCRIPT.lua`
5. Salve (Ctrl+S)

---

## Passo 3️⃣: Configurar a Posição da Base

1. Abra o script que você acabou de colar
2. Procure por esta linha:
   ```lua
   local BASE_POSITION = Vector3.new(0, 5, 0)
   ```
3. Mude para a posição da sua base:
   ```lua
   local BASE_POSITION = Vector3.new(100, 50, 200)
   ```
   *(Substitua 100, 50, 200 pelas coordenadas da sua base)*

---

## Passo 4️⃣: Testar

1. Clique em **Play** (F5) no Roblox Studio
2. Você deve ver o painel azul/roxo no canto superior direito
3. Teste os botões!

---

## 🎮 Como Usar

### Desktop
| Ação | Como fazer |
|------|------------|
| **Salvar Posição** | Clique no botão `💾 SALVAR POS` ou Pressione **F** |
| **Teleportar** | Clique no botão `🎯 INSTANT TP` ou Pressione **G** |
| **Coletar Brainrot** | Apenas toque e será teleportado automaticamente! |

### Mobile
| Ação | Como fazer |
|------|------------|
| **Salvar Posição** | Toque no botão `💾 SALVAR POS` |
| **Teleportar** | Toque no botão `🎯 INSTANT TP` |
| **Coletar Brainrot** | Toque no Brainrot e será teleportado! |

---

## ⚠️ Troubleshooting

### ❌ GUI não aparece
- Verifique se LocalScript está em `StarterGui > InstantTPGui`
- Abra o Output (View → Output) e procure por erros (em vermelho)
- Teste com Play (F5)

### ❌ Teleporte não funciona
- Salve uma posição PRIMEIRO (pressione F ou clique em SALVAR POS)
- Certifique-se de que o personagem está vivo
- Verifique se a base está em um lugar acessível

### ❌ Brainrot não teleporta
- O script detecta automaticamente itens chamados "brainrot"
- Certifique-se que a posição da base está correta
- Verifique se `AUTO_TELEPORT_ENABLED = true`

### ❌ GUI cortada em celular
- Ajuste o tamanho em `mainPanel.Size`
- Reduza o tamanho dos botões

---

## 📚 Próximos Passos

✅ Leia `docs/INSTALLATION_GUIDE.md` para guia visual completo  
✅ Veja `docs/EXEMPLOS_ADICIONAIS.lua` para extras (sons, efeitos, etc)  
✅ Edite `src/CONFIG.lua` para personalizar cores e configurações  

---

**Pronto para jogar! 🎮**
