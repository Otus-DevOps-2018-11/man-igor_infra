# man-igor_infra
man-igor Infra repository
bastion_IP = 35.187.175.110
someinternalhost_IP = 10.128.0.2
#Homework №6
testapp_IP = 34.76.242.53
testapp_port = 9292
#startup_script
gcloud compute instances create reddit-app  --boot-disk-size=10GB   --image-family ubuntu-1604-lts   --image-project=ubuntu-os-cloud   --machine-type=g1-small   --tags puma-server   --restart-on-failure --metadata-from-file startup-script=/opt/man-igor_infra/startup_scripts.sh
#create firewall rule
gcloud compute firewall-rules create default-puma-server --action allow --target-tags puma-server --source-ranges 0.0.0.0/0 --rules tcp:9292
