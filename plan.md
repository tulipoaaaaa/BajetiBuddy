# BajetiBuddy Development Plan

## Milestones Timeline

| ID | Goal | Owner | ETA |
|----|------|-------|-----|
| M1 | MVP Mobile App with Core Budgeting | @tulipoaaaaa | 2025-08-15 |
| M2 | M-Pesa Integration & Transaction Import | @tulipoaaaaa | 2025-09-30 |
| M3 | AI-Powered Budget Recommendations | @tulipoaaaaa | 2025-11-15 |
| M4 | Offline Mode & Data Sync | @tulipoaaaaa | 2025-12-31 |
| M5 | Beta Launch & User Testing | @tulipoaaaaa | 2026-02-28 |

## Task Decomposition

### Phase 1: Foundation (M1)
- [x] `setup-flutter` - Initialize Flutter project structure
- [x] `setup-backend` - Initialize Node.js API skeleton
- [ ] `ui-mockups` - Create Figma designs for core screens  
- [ ] `auth-system` - Implement user registration/login *(in progress)*
- [ ] `expense-tracker` - Build manual expense entry interface
- [ ] `budget-calculator` - Core budget calculation logic
- [ ] `local-storage` - SQLite integration for offline data

### Phase 2: Payment Integration (M2)  
- [ ] `mpesa-sdk` - Integrate M-Pesa Daraja API
- [ ] `transaction-import` - Auto-import M-Pesa transactions
- [ ] `expense-categorization` - ML-based expense classification
- [ ] `bank-integration` - Connect additional Kenyan banks

-### Phase 3: AI Intelligence (M3)
- [ ] `openai-integration` - Connect GPT-3.5 for advice generation *(in progress)*
- [ ] `context-training` - Fine-tune model on Kenyan financial patterns *(in progress)*
  - [ ] `training-script` - Convert CSV dataset and initiate model fine-tuning
  - [ ] `dvc-pipeline` - Set up DVC workflow for model training
  - [x] `model-versioning` - Save model metadata and version tag
- [ ] `recommendation-engine` - Personalized budget suggestions
- [ ] `spending-insights` - AI-generated financial insights

### Phase 4: Robustness (M4)
- [ ] `offline-core` - Ensure core features work without internet
- [ ] `data-sync` - Bi-directional cloud synchronization
- [ ] `performance-opt` - Optimize for low-end Android devices
- [ ] `security-audit` - Comprehensive security review

### Phase 5: Deployment & CI/CD (M5)
- [x] `docker-compose` - Docker Compose stack for production
- [x] `github-actions-backend` - Backend CI pipeline
- [x] `github-actions-mobile` - Mobile CI pipeline
- [x] `deploy-automation` - Remote deploy workflow

## Architecture Overview

Mobile App (Flutter)
↓ HTTPS/REST
Backend API (Node.js)
↓ SQL/Redis
Database Layer (PostgreSQL + Redis)
↓ HTTP
External Services
├── OpenAI GPT-3.5 (Budget Advice)
├── M-Pesa Daraja API (Transactions)
└── Equity Bank API (Account Data)

text

### Data Flow Sequence
1. User enters expense → Local SQLite storage
2. App syncs with backend when online → PostgreSQL  
3. Backend calls OpenAI for budget analysis → AI recommendations
4. M-Pesa webhook updates transactions → Real-time budget adjustment
5. Recommendations delivered to mobile → User notification

## Interface Specifications

### REST API Endpoints

**Authentication**
POST /v1/auth/register
POST /v1/auth/login
POST /v1/auth/refresh

text

**Budget Management** 
GET /v1/budgets/current
POST /v1/budgets/create
PUT /v1/budgets/:id
DELETE /v1/budgets/:id

text

**Expense Tracking**
GET /v1/expenses?from=2025-01-01&to=2025-01-31
POST /v1/expenses/create
PUT /v1/expenses/:id
DELETE /v1/expenses/:id

text

**AI Recommendations**
POST /v1/ai/budget-advice
GET /v1/ai/spending-insights/:user_id
POST /v1/ai/categorize-expense

text

### Expected JSON Schemas

**Budget Advice Request**
{
"user_id": "uuid",
"monthly_income": 45000,
"expenses": [
{"category": "rent", "amount": 15000},
{"category": "food", "amount": 8000},
{"category": "transport", "amount": 3000}
],
"savings_goal": 10000,
"currency": "KES"
}

text

**AI Advice Response**
{
"recommendations": [
{
"category": "food",
"current_spend": 8000,
"suggested_spend": 6500,
"rationale": "Based on similar users in Nairobi, you can reduce food costs by 19% through bulk shopping at local markets."
}
],
"total_savings_potential": 3500,
"confidence_score": 0.84
}

text

## Testing Strategy

### Unit Tests
- Budget calculation logic validation
- Expense categorization accuracy  
- Currency conversion functions
- AI response parsing

### Integration Tests  
- M-Pesa API webhook handling
- OpenAI API integration stability
- Database transaction consistency
- Authentication flow end-to-end

### End-to-End Test Cases
E2E-001: User Registration → Expense Entry → Budget Creation → AI Advice
E2E-002: M-Pesa Transaction Import → Auto-categorization → Budget Update
E2E-003: Offline Mode → Data Entry → Online Sync → Cloud Backup
E2E-004: Multi-language UI → Swahili Input → English AI Response

text

### Performance Testing
- App launch time <3s on Samsung Galaxy A12
- Budget calculation response <1s for 100 expenses
- AI advice generation <5s for complex queries
- Offline-to-online sync <10s for 30-day transaction history

## Risks & Mitigations

### Model Cost Risk
**Risk**: OpenAI API costs exceed $0.10/user/month  
**Mitigation**: Implement request caching, batch processing, and local model 
fallback for simple queries

### Data Privacy Risk  
**Risk**: Sensitive financial data exposure or regulatory non-compliance
**Mitigation**: End-to-end encryption, local-first architecture, GDPR compliance 
audit, no PII in cloud logs

### Offline Mode Risk
**Risk**: Core functionality breaks without internet connection
**Mitigation**: SQLite local storage, background sync queue, graceful degradation 
of AI features when offline

### M-Pesa Integration Risk
**Risk**: API changes break transaction import functionality  
**Mitigation**: Abstraction layer for payment providers, manual entry fallback, 
comprehensive API monitoring

### Low-End Device Performance Risk
**Risk**: App unusable on target hardware (2GB RAM Android devices)
**Mitigation**: Performance budgets, progressive loading, background processing 
limits, extensive device testing matrix