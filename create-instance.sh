
echo "Check .gcp.env file, first!"

source .gcp.env

gcloud beta compute --project=${PROJECT} instances create instance-1 \
                    --zone=europe-west4-a \
                    --machine-type=n1-standard-8 \
                    --subnet=default \
                    --network-tier=PREMIUM --maintenance-policy=MIGRATE \
                    # --service-account=923205623626-compute@developer.gserviceaccount.com \
                    --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
                    --image=cos-69-10895-385-0 \
                    --image-project=cos-cloud \
                    --boot-disk-size=300GB \
                    --boot-disk-type=pd-standard \
                    --boot-disk-device-name=instance-1 \
                    --labels=name=elasticsearch \
                    --reservation-affinity=any


echo "Open firewall ports 9200, 5601, then"
echo "SSH to COS image, then"
echo "Run ./install-elk-stack.sh"
