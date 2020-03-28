Create a bucket and a service account to access it
--------------------------------------------------

```
gsutil mb -l europe-west4 gs://marfle-share
gsutil ubla set on gs://marfle-share
gcloud iam service-accounts create marfle-share --description "access for bucket marfle-share"
gsutil iam ch serviceAccount:marfle-share@marfle-development.iam.gserviceaccount.com:objectViewer gs://marfle-share
gcloud iam service-accounts keys create marfle-share.json --iam-account=marfle-share@marfle-develoment.iam.gserviceaccount.com
```
