# 👟 Online Shoe Store

E-commerce shoe store with AI-powered chatbot, built with Spring Boot, MySQL, and ChromaDB.

## 🚀 Quick Start with Docker

### Prerequisites
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed and running
- Valid API keys for AI features (optional, chatbot will be disabled without keys)

### 1. Clone Repository
```bash
git clone https://github.com/nvbao117/online_shoe_store.git
cd online_shoe_store
```

### 2. Configure Environment Variables
```bash
# Copy example file
cp .env.example .env

# Edit .env and fill in your values (see Configuration section below)
```

### 3. Run with Docker
```bash
docker-compose up -d
```

### 4. Access Application
- **Web App**: http://localhost:8080
- **ChromaDB**: http://localhost:8001

### 5. View Logs
```bash
# All services
docker-compose logs -f

# Only app
docker-compose logs -f app
```

### 6. Stop Application
```bash
# Stop (keep data)
docker-compose down

# Stop and remove all data
docker-compose down -v
```

---

## ⚙️ Configuration

Edit `.env` file with your values:

### Required
| Variable | Description | Example |
|----------|-------------|---------|
| `MYSQL_ROOT_PASSWORD` | MySQL root password | `your_secure_password` |
| `MYSQL_PASSWORD` | MySQL user password | `your_secure_password` |
| `JWT_SECRET` | JWT signing key (32+ chars) | `your_jwt_secret_key_here_32chars` |

### AI Features (Optional)
| Variable | Description | Get from |
|----------|-------------|----------|
| `ANTHROPIC_API_KEY` | Claude API key | [console.anthropic.com](https://console.anthropic.com) |
| `OPENAI_API_KEY` | OpenAI API key | [platform.openai.com](https://platform.openai.com) |

### Email (Optional)
| Variable | Description |
|----------|-------------|
| `MAIL_USERNAME` | Gmail address |
| `MAIL_PASSWORD` | Gmail App Password |

### Google OAuth (Optional)
| Variable | Description |
|----------|-------------|
| `GOOGLE_CLIENT_ID` | Google OAuth Client ID |
| `GOOGLE_CLIENT_SECRET` | Google OAuth Secret |

### Payment - VNPay (Optional)
| Variable | Description |
|----------|-------------|
| `VNPAY_TMN_CODE` | VNPay Terminal Code |
| `VNPAY_HASH_SECRET` | VNPay Hash Secret |

---

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    Docker Network                        │
├─────────────────┬─────────────────┬─────────────────────┤
│     MySQL       │    ChromaDB     │    Spring Boot      │
│   (Database)    │  (Vector Store) │      (App)          │
│   Port: 3306    │   Port: 8001    │   Port: 8080        │
└─────────────────┴─────────────────┴─────────────────────┘
```

### Services
| Service | Image | Purpose |
|---------|-------|---------|
| `mysql` | `mysql:8.0` | Primary database |
| `chromadb` | `chromadb/chroma:0.4.24` | Vector store for AI embeddings |
| `app` | Custom (Dockerfile) | Spring Boot application |

---

## 🛠️ Development

### Run Hybrid Mode (Recommended for Development)
Use Docker for databases, run app locally for hot-reload:

```bash
# Start databases only
docker-compose up -d mysql chromadb

# Run app locally
./mvnw spring-boot:run
```

### Rebuild After Code Changes
```bash
docker-compose down
docker-compose build --no-cache
docker-compose up -d
```

---

## 📁 Project Structure

```
online_shoe_store/
├── src/
│   ├── main/
│   │   ├── java/          # Java source code
│   │   └── resources/
│   │       ├── templates/ # Thymeleaf templates
│   │       └── static/    # CSS, JS, images
│   └── data/
│       ├── images/        # Product images
│       └── script_sql/    # SQL scripts
├── Dockerfile             # Multi-stage Docker build
├── docker-compose.yml     # Docker orchestration
├── .env.example           # Environment template
└── pom.xml                # Maven dependencies
```

---

## 🔧 Troubleshooting

### Port Already in Use
```bash
# Find process using port
netstat -ano | findstr :8080

# Kill process (Windows)
taskkill /PID <PID> /F

# Or change port in .env
APP_PORT=8081
```

### Docker Build Cache Issues
```bash
docker builder prune -f
docker-compose build --no-cache
```

### Reset Database
```bash
docker-compose down -v
docker-compose up -d
```

### View Container Status
```bash
docker-compose ps
```

---

## 🌟 Features

- 🛒 **E-commerce**: Product catalog, cart, checkout
- 🤖 **AI Chatbot**: Powered by Claude (Anthropic) with RAG
- 🔐 **Authentication**: JWT + Google OAuth2
- 💳 **Payment**: VNPay integration (Vietnam)
- 📧 **Email**: Order notifications, password reset
- 📱 **Responsive**: Mobile-friendly design

---

## � Git Workflow

### Branch Naming
- Feature: `feature/feature-name`
- Bugfix: `bugfix/bug-name`
- Hotfix: `hotfix/issue-name`

### Commit Message Format
```
[Type] Description

Examples:
[Feature] Add login page
[Fix] Fix cart calculation
[Refactor] Optimize database queries
```

### Workflow
1. `git checkout dev && git pull`
2. `git checkout -b feature/your-feature`
3. Code and commit
4. `git push origin feature/your-feature`
5. Create Pull Request → Review → Merge

---

## 📝 License

This project is for educational purposes.

---

## 👥 Contributors

- Team 5 Anh Em
