import { Request, Response, NextFunction } from 'express';

export class AuthController {
  async login(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      // TODO: implement login logic
      res.json({ message: 'login not implemented' });
    } catch (err) {
      next(err);
    }
  }

  async signup(req: Request, res: Response, next: NextFunction): Promise<void> {
    try {
      // TODO: implement signup logic
      res.json({ message: 'signup not implemented' });
    } catch (err) {
      next(err);
    }
  }

  logout(req: Request, res: Response, next: NextFunction): void {
    try {
      // TODO: implement logout logic
      res.json({ message: 'logout not implemented' });
    } catch (err) {
      next(err);
    }
  }
}
