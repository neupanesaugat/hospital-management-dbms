SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Table structure for table `doctors`

CREATE TABLE `doctors` (
  `did` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `doctorname` varchar(50) NOT NULL,
  `dept` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `doctors`

INSERT INTO `doctors` (`did`, `email`, `doctorname`, `dept`) VALUES
(1, 'smarika@gmail.com', 'Smarika', 'Cardiologists'),
(2, 'suyasha@gmail.com', 'Suyasha', 'Dermatologists'),
(3, 'pranav@gmail.com', 'Pranav', 'Anesthesiologists'),
(4, 'shyama@gmail.com', 'Shyama', 'Endocrinologists'),
(5, 'subham@gmail.com', 'Subham', 'corona');


-- Table structure for table `patients`


CREATE TABLE `patients` (
  `pid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `slot` varchar(50) NOT NULL,
  `disease` varchar(50) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL,
  `dept` varchar(50) NOT NULL,
  `number` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`pid`, `email`, `name`, `gender`, `slot`, `disease`, `time`, `date`, `dept`, `number`) VALUES
(2, 'ram1@gmail.com', 'Ram Poudel', 'Male1', 'evening1', 'cold1', '21:20:00', '2020-02-02', 'ortho11predict', '9874561110'),
(5, 'hari@gmail.com', 'Hari', 'Male', 'morning', 'fevr', '18:06:00', '2020-11-18', 'Cardiologists', '9874563210'),
(7, 'gopal@gmail.com', 'Gopal', 'Male', 'evening', 'cold', '22:18:00', '2020-11-05', 'Dermatologists', '9874563210'),
(8, 'bhim@gmail.com', 'Bhim', 'Male', 'evening', 'cold', '22:18:00', '2020-11-05', 'Dermatologists', '9874563210'),
(9, 'tej@gmail.com', 'Tej', 'Male', 'morning', 'cold', '17:27:00', '2020-11-26', 'Anesthesiologists', '9874563210'),
(10, 'kashyap@gmail.com', 'kashyap', 'Male', 'evening', 'fever', '16:25:00', '2020-12-09', 'Cardiologists', '9874589654'),
(15, 'khushi@gmail.com', 'Khushi', 'Female', 'morning', 'corona', '20:42:00', '2021-01-23', 'Anesthesiologists', '9874563210'),
(16, 'shilpa@gmail.com', 'Shilpa', 'Female', 'evening', 'fever', '15:46:00', '2021-01-31', 'Endocrinologists', '9874587496'),
(17, 'sita@gmail.com', 'Sita', 'Female', 'evening', 'fever', '15:48:00', '2021-01-23', 'Endocrinologists', '9874563210');


-- Triggers `patients`

DELIMITER $$
CREATE TRIGGER `PatientDelete` BEFORE DELETE ON `patients` FOR EACH ROW INSERT INTO trigr VALUES(null,OLD.pid,OLD.email,OLD.name,'PATIENT DELETED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `PatientUpdate` AFTER UPDATE ON `patients` FOR EACH ROW INSERT INTO trigr VALUES(null,NEW.pid,NEW.email,NEW.name,'PATIENT UPDATED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `patientinsertion` AFTER INSERT ON `patients` FOR EACH ROW INSERT INTO trigr VALUES(null,NEW.pid,NEW.email,NEW.name,'PATIENT INSERTED',NOW())
$$
DELIMITER ;


-- Table structure for table `test`

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- Dumping data for table `test`


INSERT INTO `test` (`id`, `name`, `email`) VALUES
(1, 'Kusum', 'kusum@gmail.com'),
(2, 'Dev', 'dev@gmail.com');


-- Table structure for table `trigr`

CREATE TABLE `trigr` (
  `tid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- Dumping data for table `trigr`


INSERT INTO `trigr` (`tid`, `pid`, `email`, `name`, `action`, `timestamp`) VALUES
(1, 12, 'gopal@gmail.com', 'ANEES', 'PATIENT INSERTED', '2020-12-02 16:35:10');


-- Table structure for table `user`

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `usertype` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- Dumping data for table `user`


INSERT INTO `user` (`id`, `username`, `usertype`, `email`, `password`) VALUES
(13, 'Pranav', 'Doctor', 'pranav@gmail.com', 'Pranav@123'),
(14, 'Gopal', 'Patient', 'gopal@gmail.com', 'Gopal@123'),
(15, 'Khushi', 'Patient', 'khushi@gmail.com', 'Khusi@123');


-- Indexes for table `doctors`

ALTER TABLE `doctors`
  ADD PRIMARY KEY (`did`);


-- Indexes for table `patients`

ALTER TABLE `patients`
  ADD PRIMARY KEY (`pid`);


-- Indexes for table `test`

ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);


-- Indexes for table `trigr`

ALTER TABLE `trigr`
  ADD PRIMARY KEY (`tid`);


-- Indexes for table `user`

ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);


-- AUTO_INCREMENT for table `doctors`

ALTER TABLE `doctors`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


-- AUTO_INCREMENT for table `patients`

ALTER TABLE `patients`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;


-- AUTO_INCREMENT for table `test`

ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;


-- AUTO_INCREMENT for table `trigr`

ALTER TABLE `trigr`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;


-- AUTO_INCREMENT for table `user`

ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;
