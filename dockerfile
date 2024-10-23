# 베이스 이미지 설정
FROM node:14

# 작업 디렉토리 생성
WORKDIR /usr/src/app

# 패키지 파일 복사
COPY package*.json ./

# 패키지 설치
RUN npm install

# 애플리케이션 소스 복사
COPY . .

# 애플리케이션 포트 노출
EXPOSE 3000

# 애플리케이션 시작
CMD ["node", "app.js"]
