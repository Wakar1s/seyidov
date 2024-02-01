import { Module } from '@nestjs/common';
import { NewsController } from './modules/news/news.controller';
import { NewsItemService } from './modules/news/news.service';
import { PrismaService } from './prisma.service';

@Module({
  imports: [],
  controllers: [NewsController],
  providers: [NewsItemService, PrismaService],
  exports: [PrismaService],
})
export class EntrypointModule {}