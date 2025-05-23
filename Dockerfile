# 빌드 단계
FROM gradle:8.12-jdk17 AS build

WORKDIR /app

# gradle 캐시를 활용하기 위해 필요한 파일 먼저 복사
COPY build.gradle settings.gradle .
COPY gradle ./gradle
RUN gradle dependencies --no-daemon

# 소스 코드 복사 및 빌드
COPY src ./src
RUN gradle bootJar --no-daemon -x test

# 실행 단계
FROM amazoncorretto:17

WORKDIR /app