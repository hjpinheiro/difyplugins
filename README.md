# Vertex AI Plugin for Dify

Este plugin permite integrar o Dify com o Google Cloud Vertex AI, incluindo suporte para modelos Claude via Anthropic on Vertex AI.

## Modelos Suportados

### Claude Models (Anthropic on Vertex AI)

- **Claude Sonnet 4** (`claude-sonnet-4@20250514`) - Modelo mais recente e avançado
  - Regiões disponíveis: `us-east5`, `europe-west4`, `GLOBAL`
  - Context window: 200K tokens
  - Max output: 64K tokens
  - Recursos: Agent-thought, Vision

- **Claude Opus 4** (`claude-opus-4@20250514`)
  - Regiões disponíveis: `us-east5`, `europe-west4`
  - Context window: 200K tokens
  - Max output: 64K tokens

- **Claude 3.7 Sonnet** (`claude-3-7-sonnet@20250219`)
  - Regiões disponíveis: `us-east5`, `europe-west1`, `europe-west4`, `GLOBAL`

- **Claude 3.5 Sonnet v2** (`claude-3-5-sonnet-v2@20241022`)
  - Regiões disponíveis: `us-east5`, `europe-west1`, `GLOBAL`

- **Claude 3 Opus** (`claude-3-opus@20240229`)
  - Regiões disponíveis: `us-east5`

- **Claude 3 Haiku** (`claude-3-haiku@20240307`)
  - Regiões disponíveis: `us-east5`, `europe-west1`, `asia-southeast1`

## Configuração

### Credenciais Necessárias

1. **Project ID** (obrigatório): ID do projeto no Google Cloud
2. **Location** (obrigatório): Região do Vertex AI (ex: `us-east5`, `europe-west4`)
3. **Service Account Key** (opcional): Chave da conta de serviço em formato base64
4. **Anthropic Models Location** (opcional): Região específica para modelos Claude
5. **Global-only Models** (opcional): Lista de modelos que devem usar endpoint global

### Regiões Recomendadas

Para o **Claude Sonnet 4** (modelo principal deste plugin):
- `us-east5` (US East - Columbus)
- `europe-west4` (Holanda)
- `GLOBAL` (endpoint global)

## Instalação

### Opção 1: Importar via ZIP (Recomendado)

1. **Construir o pacote do plugin:**
   ```bash
   chmod +x build.sh
   ./build.sh v0.0.1
   ```
   Isto irá criar um ficheiro `vertex-ai-plugin-v0.0.1.zip` com a estrutura correta.

2. **Importar no Dify:**
   - Aceda à secção de Plugins no Dify
   - Clique em "Install Plugin" ou "Add Plugin"
   - Selecione "Import from local file"
   - Faça upload do ficheiro `vertex-ai-plugin-v0.0.1.zip`

3. **Configurar credenciais:**
   - No Dify, vá às configurações do plugin
   - Configure as credenciais do Google Cloud (Project ID, Location, Service Account Key)

### Opção 2: Importar via GitHub Release

1. **Preparar a Release:**
   - Faça build do plugin: `./build.sh v0.0.1`
   - Crie uma Release no GitHub
   - **Anexe manualmente** o ficheiro `vertex-ai-plugin-v0.0.1.zip` aos assets da Release
   - Não use o "Source code (zip)" automático - ele tem estrutura incorreta!

2. **Importar no Dify:**
   - No Dify, use "Import from URL"
   - Cole o URL do repositório GitHub
   - Selecione a Release
   - Selecione o asset `vertex-ai-plugin-v0.0.1.zip` (não o Source code!)

### Estrutura Correta do ZIP

⚠️ **IMPORTANTE:** O Dify requer que o `manifest.yaml` esteja na raiz do ZIP:

```
✅ Correto:
vertex-ai-plugin.zip
├── manifest.yaml          ← Na raiz!
├── provider/
├── models/
└── requirements.txt

❌ Incorreto:
plugin.zip
└── difyplugins/           ← Pasta extra!
    ├── manifest.yaml
    └── ...
```

O script `build.sh` garante a estrutura correta automaticamente.

## Características

- Suporte completo para modelos Claude via Vertex AI
- Context window de até 200K tokens
- Suporte para Vision (análise de imagens)
- Agent-thought capabilities
- Streaming de respostas
- Text embeddings

## Preços (USD)

**Claude Sonnet 4:**
- Input: $0.003 por 1K tokens
- Output: $0.015 por 1K tokens

## Requisitos

- Python 3.12+
- Google Cloud Project com Vertex AI habilitado
- Permissões adequadas para acessar a API do Vertex AI
- Credenciais válidas (Service Account ou Application Default Credentials)

## Documentação

Para mais informações sobre o Vertex AI e os modelos Claude:
- [Vertex AI Documentation](https://cloud.google.com/vertex-ai/)
- [Anthropic on Vertex AI](https://cloud.google.com/vertex-ai/generative-ai/docs/partner-models/use-claude)
