-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2017 at 12:31 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `comment_author` int(11) NOT NULL,
  `comment_cont` varchar(255) NOT NULL,
  `post_id` int(11) NOT NULL,
  `date_deleted` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_author`, `comment_cont`, `post_id`, `date_deleted`) VALUES
(1, 1, 'Hello', 4, '0000-00-00'),
(2, 1, 'Hello', 4, '0000-00-00'),
(3, 1, 'asasas', 4, '0000-00-00'),
(4, 1, 'Hello world', 3, '0000-00-00'),
(5, 1, 'Whats up', 2, '0000-00-00'),
(6, 1, 'Hello', 1, '0000-00-00'),
(7, 1, 'asasas', 2, '0000-00-00'),
(8, 1, 'Hello', 4, '0000-00-00'),
(9, 1, 'world', 4, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `file_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `type` enum('photo','video') NOT NULL,
  `post_id` int(11) NOT NULL,
  `date_deleted` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`file_id`, `file_name`, `type`, `post_id`, `date_deleted`) VALUES
(1, 'file0.jpg', 'photo', 1, '0000-00-00'),
(2, 'file1.jpg', 'photo', 1, '0000-00-00'),
(3, 'file2.jpg', 'photo', 2, '0000-00-00'),
(4, 'file3.jpg', 'photo', 2, '0000-00-00'),
(5, 'file4.jpg', 'photo', 3, '0000-00-00'),
(6, 'file5.jpg', 'photo', 3, '0000-00-00'),
(7, 'file6.jpg', 'photo', 4, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) NOT NULL,
  `author_id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `category` varchar(20) NOT NULL,
  `date_publish` date NOT NULL,
  `date_deleted` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `content`, `category`, `date_publish`, `date_deleted`) VALUES
(1, 1, 'Hello world', 'None', '2017-03-11', '0000-00-00'),
(2, 1, 'Hello world', 'None', '2017-03-11', '0000-00-00'),
(3, 1, 'Hello world', 'None', '2017-03-11', '0000-00-00'),
(4, 1, 'Great', 'None', '2017-03-11', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `profile_pictures`
--

CREATE TABLE `profile_pictures` (
  `picture_id` int(11) NOT NULL,
  `img` mediumblob NOT NULL,
  `type` varchar(15) NOT NULL,
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profile_pictures`
--

INSERT INTO `profile_pictures` (`picture_id`, `img`, `type`, `user`) VALUES
(1, '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_fname` varchar(12) NOT NULL,
  `user_lname` varchar(12) NOT NULL,
  `user_pass` varchar(12) NOT NULL,
  `user_email` varchar(20) NOT NULL,
  `user_region` varchar(20) NOT NULL,
  `user_key` varchar(255) NOT NULL,
  `type` enum('a','b','c') NOT NULL DEFAULT 'a',
  `activated` enum('no','yes') NOT NULL DEFAULT 'no',
  `date_deleted` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_fname`, `user_lname`, `user_pass`, `user_email`, `user_region`, `user_key`, `type`, `activated`, `date_deleted`) VALUES
(1, 'Tseko', 'Garkov', '12345678', 'tsetsig@abv.bg', 'Vratsa', 'f3facc66f3bbbade8c7b5ad8eea387f6', 'a', 'no', '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `comment_author` (`comment_author`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `post` (`post_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author` (`author_id`);

--
-- Indexes for table `profile_pictures`
--
ALTER TABLE `profile_pictures`
  ADD PRIMARY KEY (`picture_id`),
  ADD KEY `user` (`user`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD UNIQUE KEY `user_key` (`user_key`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `profile_pictures`
--
ALTER TABLE `profile_pictures`
  MODIFY `picture_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
