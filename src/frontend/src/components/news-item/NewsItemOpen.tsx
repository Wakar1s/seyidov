import React from "react";
import dayjs from "dayjs";
import "dayjs/locale/ru";
import {Link} from "react-router-dom";
import NewsItem from "../../dto/NewsItem";
import './NewsItem.css';

interface NewsItemProps {
    item: NewsItem
}

const NewsItemOpenComponent: React.FC<NewsItemProps> = ({ item }) => {
    if (!item)
        return null;
    return (
        <article className="news-item">
            <h1 className="news-item__title">
                {item.title}
            </h1>
            <div className="news-item__date">
                Дата публикации: {dayjs(item.public_at).locale('ru').format('DD MMMM YYYY')}
            </div>
            {item.image && (
                <div className="news-item__image">
                    <picture className="adaptive">
                        <img src={item.image} className="adaptive__img" alt={item.title}/>
                    </picture>
                </div>
            )}
            <div className="news-item__content" dangerouslySetInnerHTML={{__html: item.description}} />
        </article>
    );
}

export default NewsItemOpenComponent;