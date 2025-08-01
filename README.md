# CodeIgniter 4 Docker Starter

A ready-to-go CodeIgniter 4 development environment using Docker, MySQL, and phpMyAdmin.

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/nikelioum/CodeIgniterDocker.git
cd CodeIgniterDocker
```

### 2. Configure the Environment

```bash
cp env .env
```

Then edit `.env` and ensure these settings are correct:

```ini
CI_ENVIRONMENT = development

app.baseURL = 'http://localhost:8082'
app.forceGlobalSecureRequests = false
app.CSPEnabled = false

database.default.hostname = db
database.default.database = codeigniter
database.default.username = ciuser
database.default.password = cipassword
database.default.DBDriver = MySQLi
database.default.port = 3306
database.default.charset = utf8mb4
database.default.DBCollat = utf8mb4_general_ci
database.default.DBDebug = true

encryption.key = base64:VrWcF9PrB2U8Hh9I/9hJdqfTPy5BtWYqdp+ey8Zt0Oo=

session.driver = 'CodeIgniter\Session\Handlers\FileHandler'
session.savePath = writable/session

logger.threshold = 4
logger.path = writable/logs/
```

### 3. Build & Start Containers

```bash
docker compose up -d --build
```

### 4. Install Dependencies

```bash
docker compose exec app composer install
```

### 5. Generate Encryption Key

```bash
docker compose exec app php spark key:generate
```

### 6. Set Writable Permissions

```bash
docker compose exec app chmod -R 777 writable
```

### 7. Run Migrations

```bash
docker compose exec app php spark migrate
```

---

## ✅ Application Access

- App: [http://localhost:8082](http://localhost:8082)
- phpMyAdmin: [http://localhost:8081](http://localhost:8081)
  - **Username**: `ciuser`
  - **Password**: `cipassword`

---

## 🔧 Common Commands

| Task              | Command                                         |
|-------------------|--------------------------------------------------|
| Stop containers   | `docker compose down`                           |
| Restart containers| `docker compose restart`                        |
| Clear cache       | `docker compose exec app php spark cache:clear` |
| New migration     | `docker compose exec app php spark migrate`     |
| Run artisan task  | `docker compose exec app php spark <command>`   |

---

## 🛠 Technologies Used

- CodeIgniter 4
- Docker & Docker Compose
- MySQL 8
- phpMyAdmin
- Composer

---

Happy coding! 🎉
