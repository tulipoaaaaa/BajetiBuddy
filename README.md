# BajetiBuddy

<!-- CODEX_CONTEXT_BEGIN
Whenever you generate or modify code:
1. Read context.json for current flags, inputs, outputs.
2. Read plan.md for the authoritative task table.
3. Append a summary of what you changed to log.md.
4. Keep all TODOs in plan.md up-to-date.
CODEX_CONTEXT_END -->

## ✨ Project Overview

BajetiBuddy is a mobile budgeting companion that delivers personalized AI-driven 
financial advice tailored specifically for users in Kenya and similar 
developing-country contexts. The app provides intelligent budget optimization, 
expense tracking, and savings recommendations while working seamlessly on 
low-end Android devices with intermittent connectivity.

## 🎯 Objectives

- Deliver contextually relevant budgeting advice for East African financial 
  patterns
- Integrate seamlessly with M-Pesa and mobile money ecosystems
- Provide offline-capable core functionality for users with limited connectivity
- Maintain sub-3-second response times on entry-level Android devices
- Ensure complete user privacy with local-first data processing
- Achieve 70%+ budgeting accuracy through culturally-aware AI recommendations

## 🛠 Tech Stack

- **Mobile Framework**: Flutter 3.x for cross-platform compatibility
- **Backend**: Node.js with Express, deployed on Railway/Render
- **LLM Services**: OpenAI GPT-3.5-turbo with custom fine-tuning for local 
  context
- **Embedding Services**: Sentence Transformers for expense categorization
- **Data Store**: SQLite (local) + PostgreSQL (cloud sync)
- **Payment Integration**: M-Pesa Daraja API, Equity Bank API

## 🔒 Key Constraints

- **Hardware**: Optimized for Android 7+ devices with 2GB RAM minimum
- **Connectivity**: Core features must work offline; sync when available
- **Integration**: M-Pesa transaction import and budget reconciliation required
- **Privacy**: All personal financial data encrypted locally; no cloud PII 
  storage
- **Localization**: Support for English and Swahili languages
- **Performance**: <3s app launch time, <1s navigation between screens

## ✅ Success Criteria

- **Daily Active Users**: 1,000+ within 6 months of launch
- **Budgeting Accuracy**: 70%+ user-reported accuracy on spending predictions
- **Retention**: 40%+ monthly active user retention
- **Performance**: <3s average loading latency for all core features
- **Cost Efficiency**: <$0.10 per user per month in LLM inference costs
- **User Satisfaction**: 4.2+ stars in Google Play Store

## 🗺 Repository Structure

BajetiBuddy/
├── README.md # This file - project overview and setup
├── plan.md # Project roadmap and task management
├── context.json # Machine-readable project state for Codex
├── log.md # Development changelog and decisions
├── LICENSE # Apache 2.0 license
├── mobile/ # Flutter mobile app (to be created)
├── backend/ # Node.js API server (to be created)
├── ml-models/ # Custom AI models and training scripts (to be created)
├── docs/ # Additional documentation (to be created)
└── deploy/ # Deployment configurations (to be created)
text

## 🖥 Development Quick Start

### Prerequisites
- Flutter SDK 3.10+
- Node.js 18+
- Docker Desktop
- VS Code with Flutter/Dart extensions

### Setup Commands
Clone and enter repository
git clone https://github.com/tulipoaaaaa/BajetiBuddy.git
cd BajetiBuddy

Set up Flutter mobile app
cd mobile
flutter pub get
flutter run

Set up backend (in new terminal)
cd ../backend
npm install
npm run dev

Environment variables (create .env files)
mobile/.env: BACKEND_URL, MPESA_CONSUMER_KEY
backend/.env: DATABASE_URL, OPENAI_API_KEY, MPESA_SECRET
text

### VS Code Configuration
- Install Flutter and Dart extensions
- Open workspace: `code BajetiBuddy.code-workspace` 
- Use `F5` to launch mobile app with debugger attached
- Backend auto-reloads via nodemon

## 🤖 Codex Integration

This repository is optimized for AI-assisted development. When working with 
code generation tools:

- Always check `context.json` for current feature flags and system state
- Refer to `plan.md` for the authoritative task list and priorities  
- Update `log.md` with a summary of changes made
- Keep all TODOs synchronized in `plan.md`

For detailed development context and current task status, see the Codex Context 
Header at the top of this file.
