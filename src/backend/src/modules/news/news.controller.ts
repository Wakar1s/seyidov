import { Controller, Get, Res, HttpStatus, Param, Query } from '@nestjs/common';
import { NewsItemService } from './news.service';

@Controller('/news')
export class NewsController {
  constructor(private readonly storage: NewsItemService) {}

  @Get('/')
  async getAll(
    @Res() response,
    @Query('page') page: number = 1,
    @Query('limit') limit: string = '100',
  ) {
    const numericLimit = +limit;

    const validLimit = [10, 30, 60, 100].includes(numericLimit) ? numericLimit : 100;

    const offset: number = (page - 1) * validLimit;
  
    const items = await this.storage.NewsItemGetAll(validLimit, offset);
  
    return response.status(HttpStatus.OK).json(items);
  }

  @Get('/get_by_alias/:alias')
  async getByAlias(@Res() response, @Param('alias') alias) {
    const item = await this.storage.NewsItemByAlias(alias);
    if (!item) {
      return response.status(HttpStatus.NOT_FOUND).send();
    }
    return response.status(HttpStatus.OK).json(item);
  }
}
