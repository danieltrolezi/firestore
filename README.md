# :fire: firestore
Firestore Emulator Docker image for local development and Github Actions.

### Examples

#### Docker Compose
```
services:
  firestore:
    container_name: firestore
    image: danieltrolezi/firestore:latest
    ports:
      - '8080:8080'
      - '4000:4000'
    environment:
      - GOOGLE_APPLICATION_CREDENTIALS=/firebase/credentials.json
      - FIRESTORE_PROJECT_ID=${FIRESTORE_PROJECT_ID}
    volumes:
      - './docker/firebase/credentials.json:/firebase/credentials.json'
    healthcheck:
      test: ["CMD", "wget", "--spider", "http://localhost:8080"]
      interval: 30s
      timeout: 10s
      retries: 3
      start_period: 10s
    networks:
      - bridge

networks:
  bridge:
```

#### Github Actions
```
name: Example Workflow

on:
  workflow_call:

jobs:
  example-job:
    runs-on: ubuntu-latest

    services:
      firestore:
        image: danieltrolezi/firestore:latest
        ports: 
          - 8080:8080
        env:
          FIRESTORE_PROJECT_ID: ${{ vars.GCP_PROJECT_ID }}
```

### Pushing image to repository

1. Authenticate
```
docker login
```

2. Build Docker image and tag it locally
```
docker build -t firestore:latest .
```

3. Tag the image using repository URL
```
docker tag firestore:latest danieltrolezi/firestore:latest
```

4. Push the Image to repository
```
docker push danieltrolezi/firestore:latest
```