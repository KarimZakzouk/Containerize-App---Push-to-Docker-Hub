## Running the Docker Image

1. **Pull the image from Docker Hub**

```bash
docker pull karimzakzouk/app:latest
```

or for a specific version tag:

```bash
docker pull karimzakzouk/app:v1.0.0
```

2. **Run the container**

```bash
docker run -d --name my-app -p 3000:3000 karimzakzouk/app:latest
```

* `-d` → run in detached mode (in background)
* `--name my-app` → optional container name
* `-p 3000:3000` → map container port 3000 to host port 3000 (adjust if your app uses a different port)

3. **Check logs**

```bash
docker logs -f my-app
```

4. **Stop the container**

```bash
docker stop my-app
docker rm my-app
```