&"G:\downloads\turboquant-plus-tqp-v0.1.1-windows-x64-cuda12.4\llama-bench.exe" `
  -m "I:\models\unsloth\gemma-4-12B-it-qat-GGUF\gemma-4-12B-it-qat-UD-Q4_K_XL.gguf" `
  -ngl 99 -t 3 -p 4096 -n 64 -b 4096 -ub 256,512 --n-cpu-moe 10 -ctk 'f16' -ctv 'turbo3'
