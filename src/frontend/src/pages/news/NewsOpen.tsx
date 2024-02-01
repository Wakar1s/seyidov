import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import Api from '../../services/Api';
import NewsItem from '../../dto/NewsItem';
import Error404 from '../error/Error404';
import NewsItemOpenComponent from '../../components/news-item/NewsItemOpen';

const NewsOpen: React.FC = () => {
  const { alias, id } = useParams<{alias?: string, id?: string}>();
  const [item, setItem] = useState<NewsItem|null>();
  useEffect(() => {
    async function fetchNews(id?: string, alias?: string) {
        try {
            let data;
            if (alias)
              data = await Api.getNewsByAlias(alias);
            else if (id)
              data = await Api.getNewsById(+id);
            setItem(data);
        } catch (error) {
            console.error(error);
        }
    }

    fetchNews(id, alias);
  }, [])
  if (!item)
    return (<Error404 />);
  return (<NewsItemOpenComponent item={item}/>)
}

export default NewsOpen
