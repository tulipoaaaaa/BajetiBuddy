import request from 'supertest';
import express from 'express';
import { AuthController } from '../../src/controllers/auth.controller';
// TODO: replace with real AuthService implementation
import { AuthService } from '../../src/services/auth.service';

jest.mock('../../src/services/auth.service');
const mockAuthService = {
  login: jest.fn(),
};
(AuthService as unknown as jest.Mock).mockImplementation(() => mockAuthService);

describe('AuthController', () => {
  const app = express();
  app.use(express.json());
  const controller = new AuthController();
  app.post('/auth/login', (req, res, next) => controller.login(req, res, next));

  beforeEach(() => {
    jest.clearAllMocks();
  });

  it('returns 200 and json on successful login', async () => {
    mockAuthService.login.mockResolvedValue({ token: 'jwt' });

    const res = await request(app)
      .post('/auth/login')
      .send({ email: 'user@test.com', password: 'pass' });

    expect(res.status).toBe(200);
    expect(res.headers['content-type']).toMatch(/json/);
  });

  it('returns 500 when login fails', async () => {
    mockAuthService.login.mockRejectedValue(new Error('invalid'));

    const res = await request(app)
      .post('/auth/login')
      .send({ email: 'bad@test.com', password: 'bad' });

    expect(res.status).toBe(500);
  });
});
