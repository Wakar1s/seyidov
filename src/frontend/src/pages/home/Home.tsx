import React, { useEffect, useState } from 'react';
import Api from '../../services/Api';
import NewsItem from '../../dto/NewsItem';
import NewsItemComponent from '../../components/news-item/NewsItem';
import './Home.css';

const Home: React.FC = () => {
    const [items, setItems] = useState<NewsItem[]>([]);
    const [currentPage, setCurrentPage] = useState<number>(1);

    useEffect(() => {
        async function fetchNews() {
            try {
                const data = await Api.getNewsList();
                setItems(data);
            } catch (error) {
                console.error(error);
            }
        }

        fetchNews();
    }, []);

    const itemsPerPage = 10;
    const totalPages = Math.ceil(items.length / itemsPerPage);

    const renderNewsItems = () => {
        const startIndex = (currentPage - 1) * itemsPerPage;
        const endIndex = startIndex + itemsPerPage;

        return items.slice(startIndex, endIndex).map((item, index) => (
            <NewsItemComponent key={index} item={item} />
        ));
    };

    const renderPageButtons = () => {
        return Array.from({ length: totalPages }, (_, index) => (
            <button key={index + 1} onClick={() => setCurrentPage(index + 1)}>
                Page {index + 1}
            </button>
        ));
    };

    return (
        <>
            <h1>Home</h1>
            {renderNewsItems()}
            <div>
                {renderPageButtons()}
            </div>
        </>
    );
};

export default Home;
