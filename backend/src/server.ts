import express from 'express';
import compression from 'compression';
import helmet from 'helmet';
import cors from 'cors';

import env from './config/env';
import apiRouter from './routes/api';
import { errorHandler } from './middleware/error.middleware';

const app = express();

app.use(express.json());
app.use(compression());
app.use(helmet());
app.use(cors());

app.get('/api/health', (_req, res) => {
  res.json({ status: 'ok' });
});

app.use('/api', apiRouter);

app.use(errorHandler);

app.listen(env.PORT, () => {
  // eslint-disable-next-line no-console
  console.log(`Server listening on port ${env.PORT}`);
});

export default app;
