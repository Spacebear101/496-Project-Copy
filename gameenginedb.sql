-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2019 at 11:58 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gameenginedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `optionID` int(11) NOT NULL,
  `sceneID` int(11) NOT NULL,
  `nextSceneID` int(11) NOT NULL,
  `oText` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `projectID` int(11) NOT NULL,
  `projectName` varchar(16) NOT NULL,
  `ownerID` int(11) NOT NULL,
  `firstSceneID` int(11) NOT NULL,
  `isPublished` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `saves`
--

CREATE TABLE `saves` (
  `saveID` int(11) NOT NULL,
  `uID` int(11) NOT NULL,
  `projectID` int(11) NOT NULL,
  `sceneID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `scene`
--

CREATE TABLE `scene` (
  `sceneID` int(11) NOT NULL,
  `projectID` int(11) NOT NULL,
  `description` text NOT NULL,
  `imgDir` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uName` varchar(16) NOT NULL,
  `pWord` varchar(255) NOT NULL,
  `uID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`optionID`),
  ADD KEY `sceneID` (`sceneID`),
  ADD KEY `nextSceneID` (`nextSceneID`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`projectID`),
  ADD KEY `ownerID` (`ownerID`),
  ADD KEY `firstSceneID` (`firstSceneID`);

--
-- Indexes for table `saves`
--
ALTER TABLE `saves`
  ADD PRIMARY KEY (`saveID`),
  ADD KEY `uID` (`uID`),
  ADD KEY `projectID` (`projectID`),
  ADD KEY `sceneID` (`sceneID`);

--
-- Indexes for table `scene`
--
ALTER TABLE `scene`
  ADD PRIMARY KEY (`sceneID`),
  ADD KEY `projectID` (`projectID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uID`),
  ADD UNIQUE KEY `USERNAME` (`uName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `optionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `projectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `saves`
--
ALTER TABLE `saves`
  MODIFY `saveID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `scene`
--
ALTER TABLE `scene`
  MODIFY `sceneID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_ibfk_1` FOREIGN KEY (`sceneID`) REFERENCES `scene` (`sceneID`),
  ADD CONSTRAINT `options_ibfk_2` FOREIGN KEY (`nextSceneID`) REFERENCES `scene` (`sceneID`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`ownerID`) REFERENCES `user` (`uID`),
  ADD CONSTRAINT `project_ibfk_2` FOREIGN KEY (`firstSceneID`) REFERENCES `scene` (`sceneID`);

--
-- Constraints for table `saves`
--
ALTER TABLE `saves`
  ADD CONSTRAINT `saves_ibfk_1` FOREIGN KEY (`sceneID`) REFERENCES `scene` (`sceneID`),
  ADD CONSTRAINT `saves_ibfk_2` FOREIGN KEY (`projectID`) REFERENCES `project` (`projectID`),
  ADD CONSTRAINT `saves_ibfk_3` FOREIGN KEY (`uID`) REFERENCES `user` (`uID`);

--
-- Constraints for table `scene`
--
ALTER TABLE `scene`
  ADD CONSTRAINT `scene_ibfk_1` FOREIGN KEY (`projectID`) REFERENCES `project` (`projectID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
