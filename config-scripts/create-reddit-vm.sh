gcloud compute instances create reddit-app --zone=europe-west1-b --machine-type=f1-micro --subnet=default --tags=puma-server --image=reddit-base-1548195065 --boot-disk-size=15GB --boot-disk-type=pd-standard --boot-disk-device-name=reddit-app