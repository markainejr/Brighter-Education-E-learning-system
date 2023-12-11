-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2020 at 04:36 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `admin_email` varchar(255) COLLATE utf8_bin NOT NULL,
  `admin_pass` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_email`, `admin_pass`) VALUES
(1, 'Admin Kumar', 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `course_name` text COLLATE utf8_bin NOT NULL,
  `course_desc` text COLLATE utf8_bin NOT NULL,
  `course_author` varchar(255) COLLATE utf8_bin NOT NULL,
  `course_img` text COLLATE utf8_bin NOT NULL,
  `course_duration` text COLLATE utf8_bin NOT NULL,
  `course_price` int(11) NOT NULL,
  `course_original_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`Geography', 'Geography, the study of the diverse environments, places, and spaces of Earth’s surface and their interactions. ', 'Samalie Birungi', '../image/courseimg/Geography.jpg', '4 Months', 800, 1800),
(11, ', `course_desc`, `course_author`, `course_img`, `course_duration`, `course_price`, `course_original_price`) VALUES
(8, 'Physics', 'Physics is the branch of science that deals with the structure of matter and how the fundamental constituents of the universe interact. . It is the most direct and to the point complete online Physics course.', '', '../image/courseimg/physics.jpg', '3 Hours', 1655, 1800),
(9, 'Mathematics', 'Mathematics is the science and study of quality, structure, space, and change.', 'Lomer Timothy', '../image/courseimg/php.jpg', '3 Months', 700, 1700),
(10, 'Biology', 'This course examines science as a process to understand basic biological concepts of cells, genetics, evolution, and ecology. Students will examine current biological research and how that impacts their lives and the future of humankind.\r\nlives in this Course.', 'Moses Ndibamwe', '../image/courseimg/ai.jpg', '6 Months', 900, 1900),
(12, 'Computer Studies', 'The main goal of this course is to introduce students to the basic data structures needed to efficiently implement common programming problems. Students will also learn to analyze the run-time of the algorithms that manipulate these data structures.', 'Baluku Jimmy', '../image/courseimg/vue.jpg', '2 Months', 100, 1000),
(13, 'Chemistry', 'Angular is one of the most popular frameworks for building client apps with HTML, CSS and TypeScript.', 'Sonam Gupta', '../image/courseimg/angular.jpg', '4 Month', 800, 1600),
(16, 'History', 'This is complete History  COurse that teaches about African, European and American History', 'Barasa Moses', '../image/courseimg/Python.jpg', '4 hours', 500, 4000),
(17, 'Economics', 'Economics is the study of scarcity and its implications for the use of resources, production of goods and services, growth of production and welfare over time, and a great variety of other complex issues of vital concern to society.', '../image/courseimg/.jpg', '2 months', 200, 3000);

-- --------------------------------------------------------

CREATE TABLE contact_us (
    c_id INT AUTO_INCREMENT PRIMARY KEY,
    contact_content_id INT,
    contact_id INT,
    name VARCHAR(255),
    subjects VARCHAR(255),
    e_mail VARCHAR(255),
    feedback TEXT
);
-- INSERT INTO contact_us (contact_content_id, contact_id, name, subjects, e_mail, feedback)
-- VALUES (1, 'John peter', 2'General Inquiry', 3'johngmail.com', 4'how am i going to enroll.');


--
-- Table structure for table `courseorder`
--

CREATE TABLE `courseorder` (
  `co_id` int(11) NOT NULL,
  `order_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `stu_email` varchar(255) COLLATE utf8_bin NOT NULL,
  `course_id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8_bin NOT NULL,
  `respmsg` text COLLATE utf8_bin NOT NULL,
  `amount` int(11) NOT NULL,
  `order_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `courseorder`
--

INSERT INTO `courseorder` (`co_id`, `order_id`, `stu_email`, `course_id`, `status`, `respmsg`, `amount`, `order_date`) VALUES
(3, 'ORDS98956453', 'jamiaTrevor@gmail.com', 10, 'TXN_SUCCESS', 'Txn Success', 800, '2019-09-12'),
(7, 'ORDS57717951', 'muwayasharif@gmail.com', 14, 'TXN_SUCCESS', 'Txn Success', 400, '2019-09-13'),
(8, 'ORDS22968322', 'aburagrace@gmail.com', 10, 'TXN_SUCCESS', 'Txn Success', 800, '2019-09-13'),
(9, 'ORDS78666589', 'sekandienock@gmail.com', 10, 'TXN_SUCCESS', 'Txn Success', 800, '2019-09-19'),
(10, 'ORDS59885531', 'joshuakerry@.com', 10, 'TXN_SUCCESS', 'Txn Success', 800, '2020-07-04');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `f_id` int(11) NOT NULL,
  `f_content` text COLLATE utf8_bin NOT NULL,
  `stu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`f_id`, `f_content`, `stu_id`) VALUES
(3, 'My life at iSchool made me stronger and took me a step ahead for being an independent women. I am thankful to all the teachers who supported us and corrected us throughout our career. I am very grateful to the iSchool for providing us the best of placement opportunities and finally I got placed in DC Marvel.', 171),
(8, 'I am grateful to iSchool - both the faculty and the Training & Placement Department. They have made efforts ensuring maximum number of placed students. Due to the efforts made by the faculty and placement cell. I was able to bag a job in the second company.', 172),
(9, 'iSchool is a place of learning, fun, culture, lore, literature and many such life preaching activities. Studying at the iSchool brought an added value to my life.', 173),
(10, 'Think Magical, that is one thing that iSchool urges in and to far extent succeed in teaching to its students which invariably helps to achieve what you need.', 174),
(12, 'Knowledge is power. Information is liberating. Education is the premise of progress, in every society, in every family.', 180),
(13, 'This is Awesome GeekySHows Jindabaad', 182);

-- --------------------------------------------------------

--
-- Table structure for table `lesson`
--

CREATE TABLE `lesson` (
  `lesson_id` int(11) NOT NULL,
  `lesson_name` text COLLATE utf8_bin NOT NULL,
  `lesson_desc` text COLLATE utf8_bin NOT NULL,
  `lesson_link` text COLLATE utf8_bin NOT NULL,
  `course_id` int(11) NOT NULL,
  `course_name` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `lesson`
--

INSERT INTO `lesson` (`lesson_id`, `lesson_name`, `lesson_desc`, `lesson_link`, `course_id`, `course_name`) VALUES
(32, 'Introduction to History', 'Introduction to History Desc', '../lessonvid/video2.mp4', 10, 'Learn History A-Z'),
(33, 'How Geography Works', 'How Geography Works Descc', '../lessonvid/video3.mp4', 10, 'Learn Geography A-Z'),
(34, 'Why Chemistry is powerful', 'Why Chemistry is powerful Desc', '../lessonvid/video9.mp4', 10, 'Learn Chemistry A-Z'),
(35, 'Everyone should learn Biology ', 'Everyone should learn Biology  Desc', '../lessonvid/video1.mp4', 10, 'Learn Biology A-Z'),
(36, 'Introduction to Enterpreneuership', 'Introduction to Enterpreneuership Desc', '../lessonvid/video4.mp4', 9, 'Complete Enterpreneuership Bootcamp'),
(37, 'How Enterpreneuership works', 'How Enterpreneuership works Desc', '../lessonvid/video5.mp4', 9, 'Complete Enterpreneuership Bootcamp'),
(38, 'is Enterpreneuership really easy ?', 'is Enterpreneuership really easy ? desc', '../lessonvid/video6.mp4', 9, 'Complete Enterpreneuership Bootcamp'),
(39, 'Introduction to Mathematics', 'Introduction to Mathematics desc1', '../lessonvid/video7.mp4', 8, 'Learn Mathematics The Easy Way'),
(40, 'Algebra', 'Type of Guitar Desc2', '../lessonvid/video8.mp4', 8, 'Mathematics'),
(41, 'Intro Hands-on Geography', 'Intro Hands-on Geography desc', '../lessonvid/video10.mp4', 11, 'Hands-on Geography'),
(42, 'How it works', 'How it works descccccc', '../lessonvid/video11.mp4', 11, 'Hands-on Geography'),
(43, 'Inro Computer studies', 'Inro Learn Computer studies desc', '../lessonvid/video12.mp4', 12, 'Learn Computer studies'),
(44, 'intro Angular JS', 'intro Angular JS desc', '../lessonvid/video13.mp4', 13, 'Angular JS'),
(48, 'Intro to Economics Complete', 'This is lesson number 1', '../lessonvid/video11.mp4', 16, 'Economics Complete'),
(49, 'Introduction to Economics', 'This intro video of Economics', '../lessonvid/video11.mp4', 17, 'Learn Economics');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `stu_id` int(11) NOT NULL,
  `stu_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `stu_email` varchar(255) COLLATE utf8_bin NOT NULL,
  `stu_pass` varchar(255) COLLATE utf8_bin NOT NULL,
  `stu_occ` varchar(255) COLLATE utf8_bin NOT NULL,
  `stu_img` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`stu_id`, `stu_name`, `stu_email`, `stu_pass`, `stu_occ`, `stu_img`) VALUES
(171, 'Abura grace', 'aburagrace@gmail.com', '123456', ' Historaian', '../image/stu/student2.jpg'),
(172, 'Muwaya Sharif', 'muwayasharif@gmail.com', '123456', ' Geography', '../image/stu/student4.jpg'),
(173, ' Ngabire Jane', 'ngabirejane@gmail.com', '123456', ' Biology', '../image/stu/student1.jpg'),
(174, 'Nabukenya Mary', 'nabukenyamary@gmail.com', '123456', 'Chemistry', '../image/stu/student3.jpg'),
(176, ' Wamala Micheal', 'wmicheal@gmail.com', '123456', 'Economics', '../image/stu/shaktiman.jpg'),
(178, ' ', 'mario@ischool.com', '1234567', ' Web Dev', '../image/stu/super-mario-2690254_1280.jpg'),
(182, 'Nansikombi Sharifa', 'nsharifa@gmail.com', '123456', ' Enterpreneurship', '../image/stu/student2.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `courseorder`
--
ALTER TABLE `courseorder`
  ADD PRIMARY KEY (`co_id`),
  ADD UNIQUE KEY `order_id` (`order_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`f_id`);

--
-- Indexes for table `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`lesson_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`stu_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `courseorder`
--
ALTER TABLE `courseorder`
  MODIFY `co_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `lesson`
--
ALTER TABLE `lesson`
  MODIFY `lesson_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `stu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
