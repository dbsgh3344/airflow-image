# GKE Airflow가 쓰는 커스텀 이미지.
# 공식 이미지에 dbt와 Cosmos만 얹는다. base 태그는 values.yaml의 차트 appVersion과 맞춘다.
FROM apache/airflow:3.2.2

# airflow 이미지는 airflow 사용자로 설치해야 한다 (root로 깔면 PATH에서 못 찾는다).
RUN pip install --no-cache-dir \
      dbt-bigquery \
      astronomer-cosmos
