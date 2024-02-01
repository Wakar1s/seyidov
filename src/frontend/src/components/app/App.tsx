import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';

import News from '../../pages/news/News';
import NewsOpen from '../../pages/news/NewsOpen';
import Home from '../../pages/home/Home';
import Error404 from '../../pages/error/Error404';

import './App.css'

const App: React.FC = () => {
  return (
    <Router>
      <div id='ipad'>
        <Routes>
          <Route path='/news/n/:id.html' element={<NewsOpen />} />
          <Route path='/news/:alias.html' element={<NewsOpen />} />
          <Route path='/news' element={<News />} />
          <Route path='/' element={<Home />} />
          <Route path='*' element={<Error404 />} />
        </Routes>
      </div>
    </Router>
  )
}

export default App
