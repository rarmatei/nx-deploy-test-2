   pids=()
           npm run nx affected -- --target=60s-delay-okay --base=origin/main &
           pids+=($!)
           npm run nx affected -- --target=20s-delay-fail --base=origin/main &
           pids+=($!)
           for pid in "${pids[@]}"; do
             wait "$pid"
           done
