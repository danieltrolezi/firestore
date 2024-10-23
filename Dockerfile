FROM node:18-alpine

ENV FIRESTORE_PROJECT_ID=default

RUN apk add --no-cache openjdk11 \
    && npm install -g firebase-tools

WORKDIR /firebase

COPY ./docker/firebase /firebase

EXPOSE 8080
EXPOSE 4000

CMD ["sh", "-c", "firebase emulators:start --only firestore --project ${FIRESTORE_PROJECT_ID}"]
