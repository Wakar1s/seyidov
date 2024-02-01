import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    return '<h4>Hello World!</h4>';
  }
  getTest(): string {
    return '<h1>Test</h1>';
  }
}
