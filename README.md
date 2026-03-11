# Gemini Tax Co-Pilot 🧾

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy)

The world's smartest AI-powered tax document assistant. Built with **Gemini 1.5 Pro** and **Streamlit**.

## ✨ Features
- **Landing Page**: Modern, high-conversion UI to start your tax journey.
- **AI OCR**: Extract data from W-2s, 1099s, and receipts with precision.
- **2025 Tax Law**: Pre-configured with the latest IRS rules and deductions.
- **Smart Savings**: Automatically identifies potential credits (Energy, Student Loan, etc.).
- **Privacy First**: No database, no logs. Your data is processed in-memory.
- **Export**: Generate clean CSVs and PDF summaries for filing.

---

## 🚀 Instant Deployment (Render)

1. **Fork** this repository.
2. Click the **Deploy to Render** button above or connect your repo to a new **Blueprint** service on Render.
3. Add your `GEMINI_API_KEY` in the environment variables.
4. Done! Your app will be live at `https://your-app.onrender.com`.

---

## 💻 Local Setup

### 1. Prerequisites
- Python 3.10+
- A Google Gemini API Key ([Get one here](https://aistudio.google.com/))

### 2. Installation
```bash
# Clone the repo
git clone https://github.com/your-username/gemini-tax-copilot.git
cd gemini-tax-copilot

# Install dependencies
pip install -r requirements.txt
```

### 3. Environment Variables
Create a `.env` file in the root directory:
```text
GEMINI_API_KEY=your_actual_api_key_here
```

### 4. Run the App
```bash
streamlit run app.py
```

---

## 🐳 Docker Support

```bash
# Build and run with Docker Compose
docker-compose up --build
```

---

## 📂 Project Structure
```text
.
├── app.py                # Main Streamlit Application
├── requirements.txt      # Python Dependencies
├── .env.example          # Environment Template
├── .gitignore            # Git Ignore Rules
├── Dockerfile            # Multi-stage Docker Build
├── docker-compose.yml    # Local Docker Setup
├── render.yaml           # Render Blueprint Configuration
├── README.md             # Documentation
└── screenshots/          # App Preview Images
    ├── landing.png
    ├── analysis.png
    └── export.png
```

---

## ⚖️ Disclaimer
This tool is for **informational purposes only**. It is not a substitute for professional tax advice from a CPA or qualified tax professional. Always verify AI-generated data against your original documents.
