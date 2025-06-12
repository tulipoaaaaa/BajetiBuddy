import { Router } from 'express';

const router = Router();

// TODO: replace placeholders with real route handlers
router.use('/auth', Router());
router.use('/budget', Router());
router.use('/mpesa', Router());
router.use('/ai', Router());

export default router;
