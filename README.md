# :fire: firestore
:whale: Firestore Emulator Docker image for local development and Github Actions.

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