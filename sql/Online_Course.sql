-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: Online_Course
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment` (
  `ASSIGN_ID` int(11) NOT NULL,
  `ASSIGN_TITLE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ASSIGN_DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ASSIGN_DUE_DATE` date DEFAULT NULL,
  `CRS_CODE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ASSIGN_ID`),
  KEY `FK_ASSIGNMENT_COURSE` (`CRS_CODE`),
  CONSTRAINT `FK_ASSIGNMENT_COURSE` FOREIGN KEY (`CRS_CODE`) REFERENCES `course` (`CRS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (1,'Assignment 1','Basic Calculus Problems','2025-02-01',101),(2,'Assignment 2','Python Programming Basics','2025-02-05',102),(3,'Assignment 3','Classical Mechanics Exercise','2025-02-10',103),(4,'Assignment 4','Economic Principles Case Study','2025-02-15',104),(5,'Assignment 5','Linked List Implementation','2025-02-20',105);
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `CRS_CODE` int(11) NOT NULL,
  `CRS_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CRS_DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CRS_TIME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CRS_START_DATE` date DEFAULT NULL,
  `CRS_END_DATE` date DEFAULT NULL,
  `LECTURE_LINK` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CRS_FEES` float DEFAULT NULL,
  `INSTR_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`CRS_CODE`),
  KEY `FK_COURSE_INSTRUCTOR` (`INSTR_ID`),
  CONSTRAINT `FK_COURSE_INSTRUCTOR` FOREIGN KEY (`INSTR_ID`) REFERENCES `instructor` (`INSTR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (101,'Calculus I','Introduction to differential and integral calculus.','08:00 AM - 10:00 AM','2025-01-01','2025-06-01','http://lecture1.MMU.edu.my',1500,1),(102,'Introduction to Programming','Basics of programming using Python.','10:30 AM - 12:30 PM','2025-01-01','2025-06-01','http://lecture2.MMU.edu.my',1800,2),(103,'Physics I','Fundamentals of classical mechanics.','01:00 PM - 03:00 PM','2025-01-01','2025-06-01','http://lecture3.MMU.edu.my',1700,3),(104,'Macroeconomics','Overview of macroeconomic principles.','03:30 PM - 05:30 PM','2025-01-01','2025-06-01','http://lecture4.MMU.edu.my',1600,4),(105,'Data Structures','Introduction to data structures in programming.','06:00 PM - 08:00 PM','2025-01-01','2025-06-01','http://lecture5.MMU.edu.my',2000,2);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollment` (
  `STUDENT_ID` int(11) NOT NULL,
  `CRS_CODE` int(11) NOT NULL,
  `ENROL_DATE` date DEFAULT NULL,
  `COMPLETION_STATE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `GRADE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PAYMENT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`STUDENT_ID`,`CRS_CODE`),
  KEY `FK_ENROLLMENT_COURSE` (`CRS_CODE`),
  CONSTRAINT `FK_ENROLLMENT_COURSE` FOREIGN KEY (`CRS_CODE`) REFERENCES `course` (`CRS_CODE`),
  CONSTRAINT `FK_ENROLLMENT_STUDENT` FOREIGN KEY (`STUDENT_ID`) REFERENCES `student` (`STUDENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (1,101,'2025-01-10','In Progress',NULL,'Paid'),(2,102,'2025-01-12','In Progress',NULL,'Paid'),(3,103,'2025-01-15','In Progress',NULL,'Paid'),(4,104,'2025-01-20','In Progress',NULL,'Paid'),(5,105,'2025-01-25','In Progress',NULL,'Paid'),(6,101,'2025-01-26','In Progress',NULL,'Paid'),(7,102,'2025-01-26','In Progress',NULL,'Paid'),(8,103,'2025-01-26','In Progress',NULL,'Paid'),(9,104,'2025-01-26','In Progress',NULL,'Paid'),(10,105,'2025-01-26','In Progress',NULL,'Paid'),(11,101,'2025-01-26','In Progress',NULL,'Paid'),(12,102,'2025-01-26','In Progress',NULL,'Paid'),(13,103,'2025-01-26','In Progress',NULL,'Unpaid'),(14,104,'2025-01-26','In Progress',NULL,'Unpaid'),(15,105,'2025-01-26','In Progress',NULL,'Unpaid');
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_prevent_duplicate_enrollment
BEFORE INSERT ON ENROLLMENT
FOR EACH ROW
BEGIN
    
    DECLARE count_enrollments INT;

    
    SELECT COUNT(*) INTO count_enrollments
    FROM ENROLLMENT
    WHERE STUDENT_ID = NEW.STUDENT_ID AND CRS_CODE = NEW.CRS_CODE;

    
    IF count_enrollments > 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Duplicate enrollment detected.'; 
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_prevent_future_enrollment
BEFORE INSERT ON ENROLLMENT
FOR EACH ROW
BEGIN
    
    IF NEW.ENROL_DATE > CURDATE() THEN
        
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Enrollment date cannot be in the future.'; 
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor` (
  `INSTR_ID` int(11) NOT NULL,
  `INSTR_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INSTR_EMAIL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INSTR_PHONE` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EXPERTISE_LEVEL` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`INSTR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (1,'Dr. Hassan Al-Sayed','hassan@mmu.edu.my','0502233445','Advanced Mathematics'),(2,'Prof. Layla Mahmoud','layla@mmu.edu.my','0503344556','Computer Science'),(3,'Dr. Faisal Al-Harbi','faisal@mmu.edu.my','0504455667','Physics'),(4,'Dr. Mona Al-Qassem','mona@mmu.edu.my','0505566778','Economics');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_material`
--

DROP TABLE IF EXISTS `learning_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_material` (
  `MATER_ID` int(11) NOT NULL,
  `MATER_TITLE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MATER_TYPE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MATER_UPLOAD_DATE` date DEFAULT NULL,
  `CRS_CODE` int(11) DEFAULT NULL,
  `ACCESS_PERMISSION` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`MATER_ID`),
  KEY `FK_MATERIAL_COURSE` (`CRS_CODE`),
  CONSTRAINT `FK_MATERIAL_COURSE` FOREIGN KEY (`CRS_CODE`) REFERENCES `course` (`CRS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_material`
--

LOCK TABLES `learning_material` WRITE;
/*!40000 ALTER TABLE `learning_material` DISABLE KEYS */;
INSERT INTO `learning_material` VALUES (1,'Calculus Lecture Notes','PDF','2025-01-05',101,'Public'),(2,'Python Code Examples','ZIP','2025-01-10',102,'Restricted'),(3,'Mechanics Problem Sets','PDF','2025-01-15',103,'Public'),(4,'Economics Charts','PPT','2025-01-20',104,'Public'),(5,'Data Structures Diagrams','PDF','2025-01-25',105,'Restricted');
/*!40000 ALTER TABLE `learning_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `STUDENT_ID` int(11) NOT NULL,
  `STUDENT_FNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `STUDENT_LNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `STUDENT_EMAIL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `STUDENT_PHONE` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `STUDENT_DOB` date DEFAULT NULL,
  `STUDENT_GENDER` char(1) DEFAULT NULL,
  `STUDENT_ADDRESS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`STUDENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Mohammed','Ali','mohammed1@mmu.edu.my','0501234567','2002-05-15','M','Riyadh'),(2,'Ahmed','Saleh','ahmed2@mmu.edu.my','0502345678','2001-03-10','M','Jeddah'),(3,'Fatima','Sharif','fatima3@mmu.edu.my','0503456789','2003-07-20','F','Mecca'),(4,'Khalid','Saeed','khalid4@mmu.edu.my','0504567890','2000-01-01','M','Dammam'),(5,'Noor','Hashimi','noor5@mmu.edu.my','0505678901','2002-12-31','F','Medina'),(6,'Abdullah','Ghamdi','abdullah6@mmu.edu.my','0506789012','1999-09-15','M','Riyadh'),(7,'Hind','Otaibi','hind7@mmu.edu.my','0507890123','2004-11-25','F','Jeddah'),(8,'Badr','Dosari','badr8@mmu.edu.my','0508901234','2001-08-14','M','Mecca'),(9,'Layla','Shahrani','layla9@mmu.edu.my','0509012345','2003-05-05','F','Dammam'),(10,'Saud','Zaid','saud10@mmu.edu.my','0511234567','2000-06-30','M','Riyadh'),(11,'Mona','Khalid','mona11@mmu.edu.my','0512345678','2002-03-22','F','Jeddah'),(12,'Abdulrahman','Tamimi','abrahman12@mmu.edu.my','0513456789','2001-02-28','M','Mecca'),(13,'Noura','Mutairi','nora13@mmu.edu.my','0514567890','1999-07-17','F','Dammam'),(14,'Salem','Qahtani','salem14@mmu.edu.my','0515678901','2004-10-13','M','Medina'),(15,'Jamila','Anzi','jamila15@mmu.edu.my','0516789012','2003-01-05','F','Jeddah');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission`
--

DROP TABLE IF EXISTS `submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission` (
  `STUDENT_ID` int(11) NOT NULL,
  `ASSIGNMENT_ID` int(11) NOT NULL,
  `SUBM_DATE` date DEFAULT NULL,
  `SUBM_GRADE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`STUDENT_ID`,`ASSIGNMENT_ID`),
  KEY `FK_SUBMISSION_ASSIGNMENT` (`ASSIGNMENT_ID`),
  CONSTRAINT `FK_SUBMISSION_ASSIGNMENT` FOREIGN KEY (`ASSIGNMENT_ID`) REFERENCES `assignment` (`ASSIGN_ID`),
  CONSTRAINT `FK_SUBMISSION_STUDENT` FOREIGN KEY (`STUDENT_ID`) REFERENCES `student` (`STUDENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission`
--

LOCK TABLES `submission` WRITE;
/*!40000 ALTER TABLE `submission` DISABLE KEYS */;
INSERT INTO `submission` VALUES (1,1,'2025-01-26','A'),(2,1,'2025-01-26','B'),(3,1,'2025-01-26','C');
/*!40000 ALTER TABLE `submission` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_prevent_late_submission
BEFORE INSERT ON SUBMISSION
FOR EACH ROW
BEGIN
    
    DECLARE due_date DATE;

    
    SELECT ASSIGN_DUE_DATE INTO due_date
    FROM ASSIGNMENT
    WHERE ASSIGN_ID = NEW.ASSIGNMENT_ID;

    
    IF NEW.SUBM_DATE > due_date THEN
        
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Assignment submission is past the due date.'; 
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-26 22:57:14
