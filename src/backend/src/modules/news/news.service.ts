import { Injectable, OnModuleInit, INestApplication } from '@nestjs/common';
import { PrismaService } from 'src/prisma.service';
import { NewsItem, Prisma } from '@prisma/client';


@Injectable()
export class NewsItemService {
    constructor(
      private readonly prisma: PrismaService) {}
    
  

    async NewsItemGetAll(limit: number, offset: number): Promise<NewsItem[]> {
      console.log(`Received limit: ${limit}, offset: ${offset}`);
      return await this.prisma.newsItem.findMany({
        take: limit,
        skip: offset,
      });
    }

  async NewsItemGetById(id: number): Promise<NewsItem> {
      const element = await this.prisma.newsItem.findUnique({
          where: { id },
      });
      return element; 
  }

  async NewsItemByAlias(alias: string): Promise<NewsItem> {
      const element = await this.prisma.newsItem.findUnique({
        where: { alias },
      });
  
      return element;
    }
}


