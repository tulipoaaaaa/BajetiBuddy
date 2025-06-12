import request from 'supertest';
import express from 'express';

// TODO: wire up actual Mpesa routes and controllers
const app = express();
app.use(express.json());

app.post('/mpesa/stkpush', (req, res) => {
  // TODO: use MPESA sandbox URL and validate callback HMAC
  res.status(200).json({ checkoutRequestID: 'placeholder' });
});

describe('MPESA Integration', () => {
  it('POST /mpesa/stkpush returns 200', async () => {
    const res = await request(app)
      .post('/mpesa/stkpush')
      .send({ phoneNumber: '254712345678', amount: 10 });
    expect(res.status).toBe(200);
    expect(res.body).toHaveProperty('checkoutRequestID');
  });
});
