import { Module } from '@nestjs/common'
import { NewsController } from './modules/news/news.controller'
import { PrismaService } from './prisma.service'

@Module({
  imports: [],
  controllers: [NewsController],
  providers: [PrismaService],
})
export class AppModule {}
