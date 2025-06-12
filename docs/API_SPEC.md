# BajetiBuddy API Specification

This document describes the main REST endpoints exposed by the backend service. All endpoints are prefixed with `/api`.

Authentication is performed using JSON Web Tokens (JWT). Clients must send an `Authorization: Bearer <token>` header for protected routes. Rate limits default to **60 requests/minute** per IP unless specified.

## Endpoints

### POST `/auth/login`
Authenticate a user and obtain a JWT.

**Request Body**
```json
{
  "email": "user@example.com",
  "password": "yourPassword"
}
```

**Response**
```json
{
  "token": "<jwt>"
}
```

### GET `/budget/`
Retrieve the current budget for the authenticated user.

**Response**
```json
{
  "id": "budget123",
  "month": "2025-06",
  "items": []
}
```

### POST `/mpesa/stkpush`
Initiate an M-Pesa STK push.

**Request Body**
```json
{
  "amount": 1000,
  "phone": "254700000000",
  "accountReference": "BajetiBuddy"
}
```

**Response**
```json
{
  "requestId": "ABC123",
  "status": "pending"
}
```

### POST `/ai/advise`
Ask the AI engine for budgeting advice.

**Request Body**
```json
{
  "monthlyIncome": 45000,
  "expenses": [
    {"category": "rent", "amount": 15000},
    {"category": "food", "amount": 8000}
  ]
}
```

**Response**
```json
{
  "recommendations": [
    {"category": "food", "suggested": 6500}
  ]
}
```

