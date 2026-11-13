# GKE Airflow가 쓰는 커스텀 이미지.
# 공식 이미지에 dbt와 Cosmos만 얹는다. base 태그는 values.yaml의 차트 appVersion과 맞춘다.
FROM apache/airflow:3.2.2

# airflow 이미지는 airflow 사용자로 설치해야 한다 (root로 깔면 PATH에서 못 찾는다).
# uv는 공식 이미지에 들어 있고 VIRTUAL_ENV(~/.local)가 잡혀 있어 pip와 같은 곳에 깔린다.
# 최상위만 고정한다. 하위까지 lock하면 base 이미지의 airflow 의존성과 부딪힌다.
COPY requirements.txt /tmp/requirements.txt
RUN uv pip install --no-cache -r /tmp/requirements.txt
