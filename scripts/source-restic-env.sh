export RESTIC_K8S_SECRET_NAME=$(kubectl get schedules -o yaml | yq e ".items[0].spec.backend.repoPasswordSecretRef.name")
export RESTIC_K8S_PASSWORD_KEY=$(kubectl get schedules -o yaml | yq e ".items[0].spec.backend.repoPasswordSecretRef.key")

export RESTIC_K8S_S3_ACCESS_KEY_REF=$(kubectl get schedules -o yaml | yq e ".items[0].spec.backend.s3.accessKeyIDSecretRef.key")
export RESTIC_K8S_S3_SECRET_KEY_REF=$(kubectl get schedules -o yaml | yq e ".items[0].spec.backend.s3.secretAccessKeySecretRef.key")

export RESTIC_K8S_S=$(kubectl get schedules -o yaml | yq e ".items[0].spec.backend.repoPasswordSecretRef.key")
export RESTIC_K8S_PASSWORD_KEY=$(kubectl get schedules -o yaml | yq e ".items[0].spec.backend.repoPasswordSecretRef.key")


export RESTIC_REPOSITORY=s3:$(kubectl get schedules -o yaml | yq e ".items[0].spec.backend.s3.endpoint")/$(kubectl get schedules -o yaml | yq e ".items[0].spec.backend.s3.bucket")
export RESTIC_PASSWORD=$(kubectl get secret -o yaml ${RESTIC_K8S_SECRET_NAME} | yq e ".data.${RESTIC_K8S_PASSWORD_KEY} | @base64d")

export AWS_ACCESS_KEY_ID=$(kubectl get secret -o yaml ${RESTIC_K8S_SECRET_NAME} | yq e ".data.${RESTIC_K8S_S3_ACCESS_KEY_REF} | @base64d")
export AWS_SECRET_ACCESS_KEY=$(kubectl get secret -o yaml ${RESTIC_K8S_SECRET_NAME} | yq e ".data.${RESTIC_K8S_S3_SECRET_KEY_REF} | @base64d")