-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 14, 2017 at 02:32 PM
-- Server version: 5.5.52-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Institute`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
  `course_id` int(11) NOT NULL,
  `course_name` text NOT NULL,
  `credit` int(11) NOT NULL,
  `course_type` enum('Theory','Lab','Project') DEFAULT NULL,
  `offered_by_dept` int(11) NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `offered_by_dept` (`offered_by_dept`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `credit`, `course_type`, `offered_by_dept`) VALUES
(1, 'File Organization and Database Structures', 3, 'Theory', 5),
(2, 'Computer Networks', 3, 'Theory', 5),
(3, 'Algorithms I', 3, 'Theory', 1),
(4, 'Fluid Mechanics', 3, 'Theory', 3),
(5, 'Image Processing', 3, 'Theory', 2);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(30) NOT NULL,
  `dept_type` enum('Department','Center','School') NOT NULL DEFAULT 'Department',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`dept_id`, `dept_name`, `dept_type`) VALUES
(1, 'CSE', 'Department'),
(2, 'ECE', 'Department'),
(3, 'ME', 'Department'),
(4, 'EE', 'Department'),
(5, 'MA', 'Department');

-- --------------------------------------------------------

--
-- Table structure for table `performance`
--

CREATE TABLE IF NOT EXISTS `performance` (
  `rollno` varchar(10) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `marks` int(11) DEFAULT NULL,
  KEY `rollno` (`rollno`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `performance`
--

INSERT INTO `performance` (`rollno`, `course_id`, `marks`) VALUES
('13MA20027', 3, 92),
('13ME10000', 3, 85),
('13MF3IM17', 2, 95),
('13CSDP10', 3, 82),
('13CSDP20', 2, 87),
('13CSDP10', 5, 92),
('13MA20023', 1, 85),
('13MA20023', 5, 97),
('13MA20027', 3, 96);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE IF NOT EXISTS `students` (
  `rollno` varchar(10) NOT NULL,
  `student_name` text NOT NULL,
  `dept_id` int(11) NOT NULL,
  `degree` enum('BTech','Msc','MTech') NOT NULL,
  PRIMARY KEY (`rollno`),
  KEY `dept_id` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`rollno`, `student_name`, `dept_id`, `degree`) VALUES
('13CSDP10', 'Mohan', 4, 'MTech'),
('13CSDP20', 'Gyan', 2, 'MTech'),
('13MA20023', 'Mudit', 5, 'Msc'),
('13MA20027', 'Sai Dheeraj', 5, 'Msc'),
('13ME10000', 'Anirudh', 3, 'BTech'),
('13MF3IM17', 'Shubham Waghe', 3, 'BTech');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`offered_by_dept`) REFERENCES `departments` (`dept_id`);

--
-- Constraints for table `performance`
--
ALTER TABLE `performance`
  ADD CONSTRAINT `performance_ibfk_1` FOREIGN KEY (`rollno`) REFERENCES `students` (`rollno`),
  ADD CONSTRAINT `performance_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
