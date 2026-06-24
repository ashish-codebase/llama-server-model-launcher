# 🦙 llama-server-model-launcher

Local [llama.cpp](https://github.com/ggerganov/llama.cpp) server launcher with pre-built presets for open-source LLMs.

## 📋 Overview

This project provides PowerShell scripts and INI configuration files to quickly launch [llama.cpp](https://github.com/ggerganov/llama.cpp) servers with different model configurations. It supports:

- **Multiple model families**: Qwen, Gemma, GPTOSS, VibeThinker
- **Advanced architectures**: MTP (Multi-Token Prediction), QAT (Quantization-Aware Training), REAP variants
- **Optimized inference**: Flash attention, unified KV cache, mixed precision caching
- **Easy preset management**: Centralized `presets.ini` for all model configurations

## 📁 Structure

```
llama-server-model-launcher/
├── LLAMA_Server_PI.ps1      # Main launcher with preset file support
├── presets.ini              # Model preset configurations (INI format)
├── *.ps1                    # Individual model launcher scripts
├── bench.csv                # Benchmark results
└── .gitignore               # Git ignore rules
```

## 🚀 Quick Start

### 1. Launch with Presets

Use the main launcher script to start the server with a preset configuration:

```powershell
.\LLAMA_Server_PI.ps1
```

This launches `llama-server.exe` with:
- Host: `127.0.0.1`
- Port: `8080`
- Models directory: `I:\models`
- Presets from `presets.ini`
- Max concurrent models: 1

### 2. Launch Individual Models

Each PowerShell script launches a specific model with optimized settings:

```powershell
# Gemma 4 12B MTP QAT
.\Gemma_4_12B_qat_mtp.ps1

# Qwen 3.6 35B MTP
.\qwen3_6_mtp.ps1

# Gemma 26B A4B QAT MTP
.\Gemma_26B_A4B_qat_mtp.ps1
```

## ⚙️ Preset Configurations

The `presets.ini` file defines reusable model configurations:

| Section | Model Family | Key Features |
|---------|--------------|--------------|
| `Qwen-36-REAP20` | Qwen 3.6 28B REAP | MoE, 23 experts, large context (128k) |
| `Qwen-36-MTP` | Qwen 3.6 35B MTP | Multi-token prediction, Jinja template |
| `Gemma4-MTP-QAT` | Gemma 4 26B A4B | QAT quantized, MTP acceleration |

### Key Parameters

- `--spec-type draft-mtp`: Enables MTP speculative decoding
- `--ctx-size`: Context window size (up to 164k tokens)
- `--cache-type-k/v`: KV cache precision (`q8_0`, `f16`)
- `--fa on`: Flash attention enabled
- `--jinja`: Use Jinja chat templates
- `presence-penalty`: Controls repetition (default: 1.5)

## 🛠️ Requirements

- **llama.cpp**: Clone and build from [github.com/ggerganov/llama.cpp](https://github.com/ggerganov/llama.cpp)
- **PowerShell 7+**: For running launcher scripts
- **GGUF Models**: Download quantized models to `I:\models\` (or update paths in scripts/presets)

## 📊 Benchmarks

Run benchmarks with:

```powershell
.\llama-bench-gemma4.ps1
```

Results are logged to `bench.csv`.

## 🔧 Customization

### Add a New Model Preset

Edit `presets.ini` and add a new section:

```ini
[MyModel]
model = path\to\model.gguf
ctx-size = 8192
temp = 0.7
# ... other parameters
```

### Modify Launch Parameters

Each `.ps1` script can be edited to change:
- `--host` / `--port`: Server address
- `-m`: Model path
- `--alias`: Display name in the server UI
- Quantization and performance settings

## 📝 Notes

- Update model paths (`I:\models\...`) to match your local setup
- Ensure `llama-server.exe` is at `D:\llama_server\` or update the path in scripts
- Use `--no-mmap` if you encounter memory mapping issues
- Set `ngl = 999` to offload all layers to GPU

## 📄 License

This project is provided as-is for personal and research use. llama.cpp is licensed under [MIT](https://github.com/ggerganov/llama.cpp/blob/master/LICENSE).
