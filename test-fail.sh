#pids=()
#npm run nx affected -- --target=test --base=origin/main --skip-nx-cache &
#pids+=($!)
#npm run nx affected -- --target=60s-delay-fail --base=origin/main &
#pids+=($!)
#npm run nx affected -- --target=20s-delay-fail --base=origin/main &
#pids+=($!)
#for pid in "${pids[@]}"; do
#wait "$pid"
#done

failed=0

npm run nx affected -- --target=test --base=origin/main --skip-nx-cache &
npm run nx affected -- --target=60s-delay-fail --base=origin/main &
npm run nx affected -- --target=20s-delay-fail --base=origin/main &

for job in `jobs -p`
do
  wait $job || let "failed+=1"
done

if [ "$failed" == "0" ];
then
  exit 0
else
  exit 1
fi
