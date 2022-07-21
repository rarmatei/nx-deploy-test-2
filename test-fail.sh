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

FAIL=0

echo "starting"

npm run nx affected -- --target=test --base=origin/main --skip-nx-cache &
npm run nx affected -- --target=60s-delay-fail --base=origin/main &
npm run nx affected -- --target=20s-delay-fail --base=origin/main &

for job in `jobs -p`
do
echo $job
    wait $job || let "FAIL+=1"
done

echo $FAIL

if [ "$FAIL" == "0" ];
then
echo "YAY!"
else
echo "FAIL! ($FAIL)"
fi
