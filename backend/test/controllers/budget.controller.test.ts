import request from 'supertest';
import express from 'express';
// TODO: replace with real controller implementation
import { BudgetController } from '../../src/controllers/budget.controller';
import { BudgetService } from '../../src/services/budget.service';

jest.mock('../../src/services/budget.service');
const mockBudgetService = {
  list: jest.fn(),
  create: jest.fn(),
};
(BudgetService as unknown as jest.Mock).mockImplementation(() => mockBudgetService);

describe('BudgetController', () => {
  const app = express();
  app.use(express.json());
  const controller = new BudgetController();
  app.get('/budget', (req, res, next) => controller.getBudgets(req, res, next));
  app.post('/budget', (req, res, next) => controller.createBudget(req, res, next));

  beforeEach(() => {
    jest.clearAllMocks();
  });

  it('GET /budget returns list', async () => {
    mockBudgetService.list.mockResolvedValue([{ id: 1 }]);

    const res = await request(app).get('/budget');

    expect(res.status).toBe(200);
    expect(Array.isArray(res.body)).toBe(true);
  });

  it('POST /budget creates budget', async () => {
    mockBudgetService.create.mockResolvedValue({ id: 1 });

    const res = await request(app)
      .post('/budget')
      .send({ amount: 100 });

    expect(res.status).toBe(201);
    expect(res.body).toHaveProperty('id');
  });
});
