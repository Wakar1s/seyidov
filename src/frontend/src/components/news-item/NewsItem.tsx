import React from "react";
import dayjs from "dayjs";
import "dayjs/locale/ru";
import {Link} from "react-router-dom";
import NewsItem from "../../dto/NewsItem";
import './NewsItem.css';

interface NewsItemProps {
    item: NewsItem
}

const NewsItemComponent: React.FC<NewsItemProps> = ({ item }) => {
    if (!item)
        return null;
    return (
        <article className="news-item">
            <Link to={`/news/${item.alias || `n/${item.id}`}.html`} className="news-item__title">
                {item.title}
            </Link>
            <div className="news-item__date">
                Дата публикации: {dayjs(item.public_at).locale('ru').format('DD MMMM YYYY')}
            </div>
            <div className="news-item__anonce">
                {item.image && (
                    <div className="news-item__image-anonce">
                        <div className="adaptive">
                            <img src={item.image} className="adaptive__img" alt={item.title}/>
                        </div>
                    </div>
                )}
                <div className="news-item__content">
                    {item.anonce}
                </div>
            </div>
        </article>
    );
}

export default NewsItemComponent;