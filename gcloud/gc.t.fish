function gc.t
  set -l HOST $argv[1]
  set -l PORT $argv[2]
  gcloud compute ssh (gcloud compute instances list | grep $HOST | awk '{print $1}') -- -N -L $PORT:localhost:$PORT
end

