# airflow-image

GKE에서 도는 Airflow의 커스텀 이미지. 공식 `apache/airflow` 이미지에 dbt와 Cosmos를 얹는다.

- `main`에 푸시하면 GitHub Actions가 `linux/amd64`로 빌드해 Artifact Registry에 올린다
- 태그는 `<airflow 버전>-<git sha 7자리>`. `latest`는 쓰지 않는다 — 어떤 이미지가 떠 있는지 배포 설정만 보고 알 수 있어야 한다
- GCP 인증은 Workload Identity Federation. 서비스 계정 키를 Secret에 두지 않는다
- 배포 쪽 설정은 `airflow-kustomize` 레포의 `overlays/gke-dev/values.yaml`
