&"G:\downloads\turboquant-plus-tqp-v0.1.1-windows-x64-cuda12.4\llama-bench.exe" `
  -m "I:\models\barozp\Qwen3.6-28B-REAP20-A3B-GGUF\Qwen3.6-28B-REAP20-A3B-Q4_K_M.gguf" `
  -ngl 99 -t 8,12 -p 4096 -n 64 -b 2048,4096 -ub 512,1024 -ctk 'q8_0' -ctv 'turbo3' -ncmoe 17
