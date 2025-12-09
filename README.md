# Minecraft Java Server

A fully containerized deployment of a **Minecraft Java Edition Server**.

This project demonstrates:

- Running a Minecraft Java server inside Docker  
- Managing persistent world data using Docker volumes  
- Secure and reproducible deployment on a remote VM  
- Environment-based configuration  
- Usage of a custom startup script (`start.sh`)  

---

## Table of Contents

- [Description](#description)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Quickstart](#quickstart)
  - [Prerequisites](#prerequisites)
- [Deployment (Server)](#deployment-server)
- [Configuration](#configuration)
  - [Environment Variables](#environment-variables)
- [Usage](#usage)
- [Testing Checklist](#testing-checklist)
- [Security Notes](#security-notes)
- [Author](#author)

---

## Description

The **Minecraft Server Project** demonstrates how to containerize, configure, and deploy a standalone game server using Docker and Docker Compose.

This includes:

- A Java-based Minecraft server (1.21.10)
- Persistent world storage using a named Docker volume  
- Environment configuration (EULA, JVM memory)  
- Uploading official `server.jar` manually  
- Running the server behind port forwarding (`8888 → 25565`)  

---

## Tech Stack

- **Java 21 (Eclipse Temurin Base Image)**  
- **Minecraft Java Edition Server**  
- **Docker & Docker Compose**  
- **Persistent Storage via Docker Volumes**  

---

## Project Structure

```
minecraft-server/
├─ docs/
│  └─ Minecraft_Server_Checkliste
├─ docker-compose.yaml
├─ Dockerfile
├─ example.env
├─ start.sh
├─ server.jar
├─ .gitignore
└─ README.md
```

---

## Quickstart

### Prerequisites

Check Docker:

```bash
docker --version
```

Check Docker Compose:

```bash
docker compose version
```

Check Git:

```bash
git --version
```

---

## Deployment (Server)

### 1. Connect to your VM

```bash
ssh <username>@<server-ip>
```

### 2. Clone your repository

```bash
git clone https://github.com/<your-username>/minecraft-server.git
```

```bash
cd minecraft-server
```

### 3. Copy environment template

```bash
cp example.env .env
```

### 4. Upload the Minecraft server JAR

From your local machine:

```bash
scp /path/to/server.jar <username>@<server-ip>:~/minecraft-server/server.jar
```

### 5. Build image

```bash
docker compose build
```

### 6. Start server

```bash
docker compose up -d
```

### 7. View logs

```bash
docker compose logs -f mc-server
```

### 8. Connect via Minecraft Java Edition

```
<server-ip>:8888
```

---

## Configuration

All configuration is done via `.env`.

### Environment Variables

```env
EULA=TRUE
MC_MEMORY=1024M
```

---

## Usage

Start server:

```bash
docker compose up -d
```

Stop server:

```bash
docker compose down
```

View logs:

```bash
docker compose logs -f mc-server
```

Rebuild image:

```bash
docker compose build
```

---

## Testing Checklist

- [x] Docker image builds successfully  
- [x] Server starts without errors  
- [x] World persists across restarts  
- [x] Server reachable at `<server-ip>:8888`  
- [x] `mcstatus` returns valid status  
- [x] `.env` excluded from Git  

---

## Security Notes

- Never commit `server.jar`  
- `.env` must stay private  
- Avoid exposing unnecessary ports  
- Use SSH keys for deployment  
- Keep your Minecraft server updated  

---

## Author

**Ognjen Manojlovic**

- Instagram: https://instagram.com/0gisha  
- LinkedIn: https://www.linkedin.com/in/ognjen-manojlovic