import { Module } from '@nestjs/common';

import { AppController } from './app.controller';
import { AppService } from './app.service';

let a = "2";
a = 5;
console.log(a)

@Module({
  imports: [],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
