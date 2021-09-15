-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Jun 13, 2021 at 08:40 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `app`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `updationDate`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', '18-10-2016 04:18:16');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) NOT NULL,
  `categoryDescription` longtext NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(1, 'Transact', 'Transactions', '2021-06-12 19:42:40', ''),
(2, 'Bank Accounts', 'Personal Banking', '2021-06-12 19:52:58', ''),
(3, 'Digital Banking', 'Online Services', '2021-06-12 19:52:58', ''),
(4, 'Savings And Investments', 'Savings', '2021-06-12 19:52:58', ''),
(5, 'International Banking', 'International Solutions', '2021-06-12 19:52:58', ''),
(6, 'Financial Planning', 'Financial Wellness', '2021-06-12 19:52:58', ''),
(7, 'Borrow', 'Credit', '2021-06-12 19:52:58', ''),
(8, 'Forex', 'Foreign Exchange', '2021-06-12 19:52:58', ''),
(9, 'Family Banking', 'Future Banking', '2021-06-12 19:52:58', ''),
(10, 'Rewards', 'Banking Rewards', '2021-06-12 19:52:58', ''),
(11, 'Insurance', 'Protect Your Future', '2021-06-12 20:38:51', '');

-- --------------------------------------------------------

--
-- Table structure for table `complaintremark`
--

CREATE TABLE `complaintremark` (
  `id` int(11) NOT NULL,
  `complaintNumber` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `remarkDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaintremark`
--

INSERT INTO `complaintremark` (`id`, `complaintNumber`, `status`, `remark`, `remarkDate`) VALUES
(8, 112, 'in process', 'Currently investigating the ATM logs ', '2021-06-12 21:15:33'),
(9, 114, 'closed', 'Good Day\r\n\r\nDelivery is on its way, please be on the lookout in the next 24 hours. \r\n\r\nPlease ensure that you check your phone regularly for delivery notifications.  \r\n\r\nRegards\r\n\r\nCCS', '2021-06-12 21:19:16');

-- --------------------------------------------------------

--
-- Table structure for table `management`
--

CREATE TABLE `management` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `updationDate` varchar(255) NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `management`
--

INSERT INTO `management` (`id`, `username`, `password`, `updationDate`) VALUES
(1, 'manager', 'f925916e2754e5e03f75dd58a5733251', '18-10-2016 04:18:16'),
(2, 'mie', 'c4ca4238a0b923820dcc509a6f75849b', '2021-06-07 19:21:52');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `employee` int(10) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` bigint(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `indicator` varchar(255) DEFAULT NULL,
  `userImage` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `employee`, `firstname`, `lastname`, `password`, `phone`, `email`, `indicator`, `userImage`, `regDate`, `updationDate`, `status`) VALUES
(1, 2021, 'mm', 'mm', 'f925916e2754e5e03f75dd58a5733251', 793653889, 'mm@gmail.com', '0', NULL, '2021-06-07 17:32:38', NULL, 1),
(6, 2020, 'Test', 'Testing', 'f925916e2754e5e03f75dd58a5733251', 1234567890, 'testing@gmail.com', '0', NULL, '2021-06-13 18:20:23', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `staff_indicator`
--

CREATE TABLE `staff_indicator` (
  `Staff_indicator` bit(1) NOT NULL,
  `Description` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff_indicator`
--

INSERT INTO `staff_indicator` (`Staff_indicator`, `Description`) VALUES
(b'0', 'Staff'),
(b'1', 'Management');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `stateName` varchar(255) NOT NULL,
  `stateDescription` tinytext NOT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `stateName`, `stateDescription`, `postingDate`, `updationDate`) VALUES
(1, 'Polokwane', 'Limpopo', '2021-06-12 20:40:14', ''),
(2, 'Witbank', 'Mpumalang', '2021-06-12 20:45:46', ''),
(3, 'Tshwane', 'Gauteng', '2021-06-12 20:45:46', ''),
(4, 'Bloemfontein', 'Freestate', '2021-06-12 20:45:46', ''),
(5, 'Mahikeng', 'Northwest', '2021-06-12 20:45:46', ''),
(6, 'Durban', 'Kwazulu-Natal', '2021-06-12 20:45:46', ''),
(7, 'Gqeberha', 'Eastern Cape', '2021-06-12 20:45:46', ''),
(8, 'Kimberly', 'Northen Cape', '2021-06-12 20:45:46', ''),
(9, 'CapeTown', 'Western Cap', '2021-06-12 20:45:46', ''),
(10, 'Johannesburg', 'Gauteng', '2021-06-12 20:45:46', '');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `subcategory` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(1, 1, 'Cash Withdrawls', '2021-06-12 20:22:03', ''),
(2, 1, 'Cardless Transactions', '2021-06-12 20:22:03', ''),
(3, 1, 'Card Transactions', '2021-06-12 20:22:03', ''),
(4, 1, 'eCashSend', '2021-06-12 20:22:03', ''),
(5, 1, 'Double Transactions', '2021-06-12 20:22:03', ''),
(6, 1, 'Cash Reversals', '2021-06-12 20:22:03', ''),
(7, 2, 'Card', '2021-06-12 20:22:03', ''),
(8, 2, 'New Accounts', '2021-06-12 20:22:03', ''),
(9, 2, 'Banking Fees', '2021-06-12 20:22:03', ''),
(10, 2, 'Debit Orders', '2021-06-12 20:22:04', ''),
(11, 2, 'Account Statements', '2021-06-12 20:22:04', ''),
(13, 3, 'Mobile Banking', '2021-06-12 20:22:04', ''),
(14, 3, 'Internet Banking', '2021-06-12 20:22:04', ''),
(15, 3, 'Telephone Banking', '2021-06-12 20:22:04', ''),
(16, 3, 'ATM Banking', '2021-06-12 20:22:04', ''),
(17, 3, 'Branch Banking', '2021-06-12 20:22:04', ''),
(18, 4, 'Tax-Free Investment', '2021-06-12 20:22:04', ''),
(19, 4, 'Unit-Trust', '2021-06-12 20:22:04', ''),
(20, 4, 'Savings', '2021-06-12 20:22:04', ''),
(21, 4, 'Cash Investment', '2021-06-12 20:22:04', ''),
(22, 4, 'Off-shore Investment', '2021-06-12 20:22:04', ''),
(23, 5, 'Global Account', '2021-06-12 20:22:04', ''),
(24, 5, 'Stock Broking', '2021-06-12 20:22:04', ''),
(26, 5, 'International Trustees', '2021-06-12 20:22:04', ''),
(27, 6, 'Education', '2021-06-12 20:22:04', ''),
(28, 6, 'Retirement', '2021-06-12 20:22:04', ''),
(29, 6, 'Estate Planning', '2021-06-12 20:22:04', ''),
(30, 6, 'Employee Benefits', '2021-06-12 20:22:04', ''),
(31, 6, 'Emergencies', '2021-06-12 20:22:04', ''),
(32, 7, 'Home Loan', '2021-06-12 20:36:00', ''),
(33, 7, 'Car Loan', '2021-06-12 20:36:00', ''),
(34, 7, 'Personal Loan', '2021-06-12 20:36:01', ''),
(35, 7, 'Revolving Loan', '2021-06-12 20:36:01', ''),
(36, 7, 'Credit Card', '2021-06-12 20:36:01', ''),
(37, 7, 'Overdraft', '2021-06-12 20:36:01', ''),
(38, 7, 'Temporary Loan', '2021-06-12 20:36:01', ''),
(39, 7, 'Student Loan', '2021-06-12 20:36:01', ''),
(40, 8, 'Imports/Exports', '2021-06-12 20:36:01', ''),
(41, 8, 'Foreign Exchange', '2021-06-12 20:36:01', ''),
(42, 9, 'Youth Account', '2021-06-12 20:36:01', ''),
(43, 9, 'University Funds', '2021-06-12 20:36:01', ''),
(44, 9, 'Young Professionals', '2021-06-12 20:36:01', ''),
(45, 9, 'Will', '2021-06-12 20:36:01', ''),
(46, 9, 'Insurance', '2021-06-12 20:36:01', ''),
(47, 10, 'Rewards Benefits', '2021-06-12 20:36:01', ''),
(48, 10, 'Rewards Amount', '2021-06-12 20:36:01', ''),
(49, 10, 'Rewards Qualifications', '2021-06-12 20:36:01', ''),
(50, 10, 'Rewards Account', '2021-06-12 20:36:02', ''),
(51, 11, 'Car Insurance', '2021-06-12 20:39:08', ''),
(52, 11, 'Home Insurance', '2021-06-12 20:39:09', ''),
(53, 11, 'Life Insurance', '2021-06-12 20:39:09', ''),
(54, 11, 'Income Protector', '2021-06-12 20:39:09', ''),
(55, 11, 'Credit Insurance', '2021-06-12 20:39:09', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblcomplaints`
--

CREATE TABLE `tblcomplaints` (
  `complaintNumber` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subcategory` varchar(255) NOT NULL,
  `complaintType` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `noc` varchar(255) NOT NULL,
  `complaintDetails` mediumtext NOT NULL,
  `complaintFile` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT NULL,
  `Employee_Id` varchar(60) NOT NULL,
  `lastUpdationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcomplaints`
--

INSERT INTO `tblcomplaints` (`complaintNumber`, `userId`, `category`, `subcategory`, `complaintType`, `state`, `noc`, `complaintDetails`, `complaintFile`, `regDate`, `status`, `Employee_Id`, `lastUpdationDate`) VALUES
(1, 3, 1, 'Cash Withdrawls', ' Complaint', 'Polokwane', 'General', 'Hi, \r\n\r\nI tried to withdrawal money from one of the ATMs in Polokwane Complex, \r\n\r\nThe ATM went offline during the process and later reflected that the money was withdrawn from my account. \r\n\r\nsee slips attached. ', 'pdf-test.pdf', '2021-06-12 21:02:50', 'in process', '1', '2021-06-13 18:37:56'),
(2, 3, 2, 'Card', 'General Query', 'Witbank', 'General', 'Good Day, \r\n\r\nI have not yet received my bank card since applied two month ago.\r\n\r\n', 'page_1.jpg', '2021-06-12 21:06:06', NULL, '1', '2021-06-13 18:38:08'),
(3, 3, 2, 'Card', 'General Query', 'Witbank', 'General', 'Good Day, \r\n\r\nI have not yet received my bank card since applied two month ago.\r\n\r\n', 'page_1.jpg', '2021-06-12 21:07:01', 'closed', '1', '2021-06-13 18:38:18'),
(4, 4, 9, 'Will', ' Complaint', 'Gqeberha', 'General', 'Hi, My Will is not reflecting on my banking portal ', 'Sample-doc-file-5000kb.doc', '2021-06-13 18:22:43', NULL, '', '2021-06-13 18:38:28'),
(5, 4, 6, 'Estate Planning', ' Complaint', 'CapeTown', 'General', 'My Estate reflects on arrear as of today', '', '2021-06-13 18:24:20', NULL, '', '2021-06-13 18:38:40'),
(6, 4, 8, 'Foreign Exchange', 'General Query', 'Mahikeng', 'General', 'How much is the dollar against the rand ', 'page_1.jpg', '2021-06-13 18:23:44', NULL, '', '2021-06-13 18:38:50'),
(7, 3, 4, 'Unit-Trust', ' Complaint', 'Durban', 'General', 'Unit Trust did not grow as expected last month ', '', '2021-06-13 18:26:10', NULL, '', '2021-06-13 18:38:59'),
(8, 3, 7, 'Credit Card', ' Complaint', 'Johannesburg', 'General', 'Closed my credit card two month ago, but today i was charged an amount of R2000 for credit fee. ', '', '2021-06-13 18:27:58', NULL, '', '2021-06-13 18:39:10'),
(9, 2, 6, 'Education', 'General Query', 'Durban', 'General', 'My account was deducted last month, i have now closed the education account, \r\n\r\nplease advice when will this reflect on your side? ', '', '2021-06-13 18:30:27', NULL, '', '2021-06-13 18:39:21');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userip` binary(16) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `logout` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(26, 5, 'mm@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-07 17:32:51', '', 1),
(27, 5, 'mm@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-07 17:35:55', '', 1),
(28, 5, 'mm@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-07 17:43:14', '', 1),
(29, 5, 'mm@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-07 17:45:16', '', 1),
(30, 5, 'mm@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-07 17:52:28', '', 1),
(31, 5, 'mm@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-07 17:59:48', '', 1),
(32, 2, 'mm@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-07 19:32:39', '', 1),
(33, 5, 'mm@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-07 19:47:04', '', 1),
(34, 5, 'mm@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-07 19:47:19', '', 1),
(35, 5, 'mm@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-07 19:48:34', '', 1),
(36, 5, 'mm@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-07 20:03:37', '', 1),
(37, 5, 'mm@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-07 20:05:06', '', 1),
(38, 5, 'mm@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-10 14:25:10', '', 1),
(39, 5, 'mm@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-12 11:16:26', '', 1),
(40, 5, 'mm@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-12 11:41:02', '', 1),
(41, 5, 'mm@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-12 16:28:45', '', 1),
(42, 5, 'mm@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-12 18:34:10', '', 1),
(43, 3, 'mm@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-12 20:50:27', '12-06-2021 11:07:57 PM', 1),
(44, 1, 'mm@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-12 21:08:09', '', 1),
(45, 1, 'mm@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-12 21:12:28', '', 1),
(46, 1, 'mm@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-13 15:42:23', '', 1),
(47, 0, 'nkati@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-13 15:48:32', '', 0),
(48, 3, 'nkati@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-13 15:48:46', '', 1),
(49, 1, 'mm@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-13 16:03:11', '13-06-2021 06:53:43 PM', 1),
(50, 1, 'mm@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-13 17:05:03', '', 1),
(51, 1, 'mm@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-13 17:14:51', '', 1),
(52, 6, 'testing@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-13 18:20:37', '', 1),
(53, 4, 'mie@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-13 18:21:57', '13-06-2021 08:24:28 PM', 1),
(54, 3, 'nkati@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-13 18:25:35', '13-06-2021 08:28:04 PM', 1),
(55, 0, 'mm@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-13 18:28:20', '', 0),
(56, 0, 'mm@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-13 18:28:44', '', 0),
(57, 2, 'mm@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-13 18:29:14', '13-06-2021 08:36:49 PM', 1),
(58, 4, 'mie@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-13 18:37:00', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `contactNo` bigint(11) DEFAULT NULL,
  `address` tinytext DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `pincode` int(6) DEFAULT NULL,
  `userImage` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `userEmail`, `password`, `contactNo`, `address`, `State`, `country`, `pincode`, `userImage`, `regDate`, `updationDate`, `status`) VALUES
(2, 'jj', 'mm@gmail.com', 'f925916e2754e5e03f75dd58a5733251', 79, NULL, NULL, NULL, NULL, NULL, '2021-05-19 11:04:18', '2021-06-13 18:29:07', 1),
(3, 'nk', 'nkati@gmail.com', 'f925916e2754e5e03f75dd58a5733251', 793653889, NULL, NULL, NULL, NULL, NULL, '2021-06-12 20:50:06', '0000-00-00 00:00:00', 1),
(4, 'mie', 'mie@gmail.com', 'f925916e2754e5e03f75dd58a5733251', 12345, NULL, NULL, NULL, NULL, NULL, '2021-06-13 18:21:42', '0000-00-00 00:00:00', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaintremark`
--
ALTER TABLE `complaintremark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `management`
--
ALTER TABLE `management`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_indicator`
--
ALTER TABLE `staff_indicator`
  ADD PRIMARY KEY (`Staff_indicator`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  ADD PRIMARY KEY (`complaintNumber`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `complaintremark`
--
ALTER TABLE `complaintremark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `management`
--
ALTER TABLE `management`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  MODIFY `complaintNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
