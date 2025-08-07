# FlutterViz UI Builder (Open Source)

> **Note:** The backend code for this project is available in the [`backend` branch](https://github.com/iqonic-design/flutter_viz/tree/backend). Please switch to the `backend` branch to access and work with the backend source code.

**FlutterViz** is a visual UI builder built using Flutter. It allows developers to design stunning Flutter UIs with a drag-and-drop interface, export clean Dart code, and accelerate the development process.

> 🚀 This open-source project aims to empower developers by providing a free and extensible visual Flutter UI builder.

[![Watch on YouTube](https://img.shields.io/badge/Watch%20Demo-YouTube-red?logo=youtube&style=for-the-badge)](https://www.youtube.com/watch?v=CgIGPKeWYB0)

---

## ✨ Features

- 🔧 **Drag-and-drop editor** to build Flutter UIs visually
- 📦 50+ Built-in Flutter widgets
- 🎨 Real-time property customization (padding, color, font, etc.)
- 💾 Export clean, readable, and production-ready Dart code
- 📱 Mobile-first layout builder
- 💡 Light and fast, optimized for performance
- 🌍 Cross-platform (Web, Desktop, and Mobile with Flutter)

---

## 🔧 Installation

### 🚀 Run Locally

1. **Clone the repository**

```bash
git clone https://github.com/iqonic-design/flutter_viz.git
cd flutterviz

```
---
## 🔑 Environment Variables

To unlock the full power of **FlutterViz**, you’ll need to set up a `.env` file in your project’s root directory.  
This file holds your private configuration keys—keeping your app secure, flexible, and ready for production.

**Here’s what each variable does:**

- **`BASE_URL`**: The root URL of the backend API that your application communicates with for all data operations and services.
- **`CAPTACHA_SITE_KEY`**: Your Google reCAPTCHA site key, protecting your forms from spam and abuse.
- **`CAPTACHA_SECRET_KEY`**: The secret key for verifying reCAPTCHA responses on the backend.
- **`INVITE_CODE`**: A required code that users must enter during account creation to register and access the application.

**Sample `.env` file:**
```properties
BASE_URL=YOUR_BASE_URL
CAPTACHA_SITE_KEY=YOUR_CAPTACHA_SITE_KEY
CAPTACHA_SECRET_KEY=YOUR_CAPTACHA_SECRET_KEY
INVITE_CODE=YOUR_INVITE_CODE
```
---

## 🤝 Contributing

We welcome contributions from everyone! Whether you're fixing bugs, improving documentation, or adding new features — your help is appreciated.

### 📌 Getting Started

1. **Fork the repository** to your GitHub account.

2. **Clone your forked repository**:

    ```bash
    git clone https://github.com/your-username/flutterviz.git
    cd flutterviz
    ```

3. **Create a new branch** with a descriptive name:

    ```bash
    git checkout -b feature/your-feature-name
    ```

4. **Make your changes**, then commit:

    ```bash
    git add .
    git commit -m "Add: Short description of your feature"
    ```

5. **Push to your forked repository**:

    ```bash
    git push origin feature/your-feature-name
    ```

> ✨ **Tip:** Keep your pull requests focused. Submit separate PRs for unrelated features or fixes.

### 🐛 Creating Issues

Found a bug? Have a feature request?

1. Go to the [Issues](https://github.com/iqonic-design/flutter_viz/issues) tab.
2. Click **New Issue**.
3. Choose the relevant template (e.g., Bug Report, Feature Request).
4. Fill in the details clearly and concisely.

We use labels to organize and prioritize — be sure to use appropriate tags when possible.

### 📤 Submitting Pull Requests

Before submitting a pull request:

1. **Ensure your branch is up to date** with the latest `main`:

    ```bash
    git pull origin main
    ```

2. **Test your changes** and ensure they meet the project's coding standards.
3. **Create a pull request**:
   * Push your branch to GitHub
   * Navigate to the original repo
   * Click **Compare & pull request**
   * Add a **clear title and description** explaining your changes
4. **Reference related issues**, if any:

    ```
    Closes #issue-number
    ```

Our team will review your PR and provide feedback or suggestions. Please be responsive and respectful during the review process.

> ⭐ If you find this project useful, don't forget to **star** the repo and **share** it!
