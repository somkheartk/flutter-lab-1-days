import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getStatus() {
    return {
      name: 'Flutter Lab Backend API',
      version: '1.0.0',
      description: 'NestJS + MongoDB Backend for Flutter Lab',
      status: 'running',
      endpoints: {
        auth: '/api/auth',
        products: '/api/products',
        health: '/api/health',
      },
    };
  }
}
