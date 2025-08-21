
# 🚀 Laravel API Backend for FlutterViz

This is the official open-source **Laravel API backend** for FlutterViz, a visual Flutter UI builder.  
This backend powers the mobile application by providing RESTful APIs, user authentication, and data management.

---

## ✨ Features

- 🔧 Built with Laravel 10+
- 🔐 API Authentication using Laravel Sanctum
- 📁 Clean and modular code structure
- 📡 RESTful APIs ready to consume from Flutter
- 📂 API routes defined in `routes/api.php`

---

## 🛠️ Tech Stack

- **Laravel** - PHP backend framework
- **MySQL**  - Relational database
- **Sanctum** - Lightweight API token authentication
- **Flutter** - Frontend (in a separate repository)

---

## 📁 Project Structure

app/             - Core application logic (Models, Controllers, etc.)
routes/api.php   - All API routes for Flutter integration
config/          - Configuration files
database/        - Migrations and seeders
.env.example     - Example environment config

---

## ⚙️ Getting Started

Follow these steps to set up the project locally:

### 1. Clone the Repository

```bash
git clone https://github.com/iqonic-design/flutter_viz.git
cd flutter_viz
git checkout backend
```


### 2. Install Dependencies
composer install


### 3. Create and Configure Environment File
cp .env.example .env


Update `.env` with your database and other configuration:

APP_NAME=FlutterVizAPI
APP_URL=http://localhost:8000

```bash
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=your_database
DB_USERNAME=your_username
DB_PASSWORD=your_password
```


### 4. Generate Application Key
php artisan key:generate


### 5. Run Migrations
php artisan migrate


### 6. (Optional) Seed the Database
php artisan db:seed


### 7. Start the Development Server
php artisan serve


Your backend API will now be running at:
📡 `http://localhost:8000/api`

---

## 🔐 Authentication

This project uses **Laravel Sanctum** for API authentication.

After running `php artisan migrate`, Sanctum is ready to use.
API routes that require auth are protected using middleware like:

Route::middleware('auth:sanctum')->group(function () {
    // Protected routes here
});


Refer to the [Sanctum Documentation](https://laravel.com/docs/10.x/sanctum) for more info.

---

## 📱 Flutter Frontend

The Flutter frontend that consumes this backend is available here:

🔗 [FlutterViz Mobile App Repository](https://github.com/your-username/flutterviz-app) *(Replace with actual link)*

---

## 🧪 API Testing

Use Postman or any API client to test the endpoints.


