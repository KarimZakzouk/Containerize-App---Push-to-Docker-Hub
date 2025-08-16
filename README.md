# Containerize App & Push to Docker Hub

A simple Node.js Express application with Docker containerization and automated CI/CD pipeline using GitHub Actions.

## Features

- 🚀 Simple Express.js REST API
- 🐳 Production-ready Dockerfile with multi-stage optimization
- 🔒 Security best practices (non-root user, health checks)
- 🤖 Automated CI/CD with GitHub Actions
- 📦 Multi-architecture Docker builds (AMD64, ARM64)
- ✅ Health checks and proper logging

## Quick Start

### Local Development

1. **Clone the repository:**
   ```bash
   git clone https://github.com/KarimZakzouk/Containerize-App---Push-to-Docker-Hub.git
   cd Containerize-App---Push-to-Docker-Hub
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Run the application:**
   ```bash
   npm start
   ```

4. **Test the API:**
   ```bash
   curl http://localhost:3000
   # Response: Hello, World!
   ```

### Docker Usage

#### Build and Run Locally

1. **Build the Docker image:**
   ```bash
   docker build -t containerize-app:latest .
   ```

2. **Run the container:**
   ```bash
   docker run -d -p 3000:3000 --name my-app containerize-app:latest
   ```

3. **Test the containerized app:**
   ```bash
   curl http://localhost:3000
   ```

4. **Check container health:**
   ```bash
   docker inspect --format='{{.State.Health.Status}}' my-app
   ```

5. **View logs:**
   ```bash
   docker logs my-app
   ```

6. **Stop and remove:**
   ```bash
   docker stop my-app && docker rm my-app
   ```

#### Run from Docker Hub

Once the CI/CD pipeline pushes the image to Docker Hub, you can run it directly:

```bash
# Run the latest version
docker run -d -p 3000:3000 --name my-app karimzakzouk/containerize-app:latest

# Or run a specific version
docker run -d -p 3000:3000 --name my-app karimzakzouk/containerize-app:v1.0.0
```

## CI/CD Pipeline

The project includes a GitHub Actions workflow that automatically:

1. **Builds** the Docker image on every push to `main`
2. **Tests** the build process
3. **Tags** images appropriately (latest, version tags)
4. **Pushes** to Docker Hub with multi-architecture support
5. **Updates** Docker Hub repository description

### Setup Requirements

To enable the CI/CD pipeline, configure these secrets in your GitHub repository:

1. Go to **Settings** → **Secrets and variables** → **Actions**
2. Add the following secrets:
   - `DOCKERHUB_USERNAME`: Your Docker Hub username
   - `DOCKERHUB_TOKEN`: Your Docker Hub access token

### Supported Tags

- `latest`: Always points to the latest main branch
- `v1.0.0`, `v1.0`, `v1`: Semantic version tags
- `main`: Latest main branch build

## Docker Image Details

### Multi-Stage Build
- Based on `node:20-alpine` for minimal size
- Non-root user for security
- Health checks included
- Multi-architecture builds (AMD64, ARM64)

### Security Features
- Runs as non-root user (`nextjs:nodejs`)
- Minimal attack surface with Alpine Linux
- No unnecessary packages installed
- Proper file permissions

### Optimization
- Docker layer caching
- Efficient `.dockerignore`
- Build cache optimization in CI
- Small image size (~100MB)

## API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET    | `/`      | Returns "Hello, World!" |

## Development

### Project Structure
```
.
├── Dockerfile              # Production-ready Docker configuration
├── .dockerignore          # Docker build context exclusions
├── .github/
│   └── workflows/
│       └── docker.yml     # CI/CD pipeline configuration
├── index.js               # Main application file
├── package.json           # Node.js dependencies and scripts
├── package-lock.json      # Locked dependency versions
└── README.md             # This file
```

### Scripts

- `npm start`: Start the production server
- `npm run dev`: Start development server

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test locally with Docker
5. Submit a pull request

## License

This project is licensed under the MIT License.
