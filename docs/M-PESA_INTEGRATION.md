# M-PESA Integration Guide

This guide outlines how BajetiBuddy interacts with Safaricom's Daraja API using the STK push flow.

## STK Push Overview
1. **Request** – The backend sends a payment request to the `/stkpush/v1/processrequest` endpoint using sandbox credentials.
2. **Callback** – Safaricom calls the configured `callback_url` on success or failure.
3. **Validation** – The backend verifies the callback signature via HMAC and stores the transaction.
4. **Reconciliation** – Periodic checks match M-Pesa statements against internal records.

Sandbox base URL: `https://sandbox.safaricom.co.ke/`

## Example Node.js Usage
```ts
import axios from 'axios';

async function initiateStkPush() {
  const timestamp = new Date().toISOString().replace(/[-T:Z]/g, '');
  const password = Buffer.from(process.env.SHORT_CODE + process.env.PASS_KEY + timestamp).toString('base64');

  const res = await axios.post('https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest', {
    BusinessShortCode: process.env.SHORT_CODE,
    Password: password,
    Timestamp: timestamp,
    TransactionType: 'CustomerPayBillOnline',
    Amount: 10,
    PartyA: '254700000000',
    PartyB: process.env.SHORT_CODE,
    PhoneNumber: '254700000000',
    CallBackURL: 'https://example.com/mpesa/callback',
    AccountReference: 'BajetiBuddy',
    TransactionDesc: 'Budget top up'
  });
  return res.data;
}
```

Ensure each callback is validated using the `X-Hub-Signature` header to guard against spoofing.

