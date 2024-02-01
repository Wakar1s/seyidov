import NewsItem from "../dto/NewsItem";

const BASE_URL = 'http://localhost:8080';

class ApiService {
    async getNewsList(): Promise<NewsItem[]> {
        return fetch(BASE_URL + '/news')
            .then(response => {
                return response.json();
            })
            .then((json: Array<NewsItem>) => {
                return json.map(item => {
                    return new NewsItem(
                        item.id,
                        item.alias,
                        item.title,
                        item.anonce,
                        item.description,
                        new Date(item.public_at),
                        item.image
                    );
                });
            })
            .catch(() => {
                return [];
            });
    }
    async getNewsByAlias(alias:string): Promise<NewsItem|null> {
        return fetch(BASE_URL + '/news/get_by_alias/' + alias)
            .then(response => {
                return response.json();
            })
            .then((item: NewsItem) => {
                return new NewsItem(
                    item.id,
                    item.alias,
                    item.title,
                    item.anonce,
                    item.description,
                    new Date(item.public_at),
                    item.image
                );
            })
            .catch(()=>{
                return null;
            });
    }
    async getNewsById(id:number): Promise<NewsItem|null> {
        return fetch(BASE_URL + '/news/get_by_id/' + id)
            .then(response => {
                return response.json();
            })
            .then((item: NewsItem) => {
                return new NewsItem(
                    item.id,
                    item.alias,
                    item.title,
                    item.anonce,
                    item.description,
                    new Date(item.public_at),
                    item.image
                );
            })
            .catch(()=>{
                return null;
            });
    }
}

const Api = new ApiService();

export default Api;