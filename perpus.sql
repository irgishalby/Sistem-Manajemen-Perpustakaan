-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2025 at 08:20 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpus`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `id_akun` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('member','librarian') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`id_akun`, `username`, `password`, `role`) VALUES
(0, 'admin', '1234', 'librarian'),
(1, 'irgi', '1234', 'member'),
(2, 'alif', '1234', 'member'),
(3, 'made', '1234', 'member'),
(4, 'sela', '1234', 'member'),
(5, 'derfiola', '1234', 'member'),
(6, 'aby', '1234', 'member'),
(7, 'hanma', '1234', 'member'),
(8, 'luffy', 'mugiwara', 'member'),
(9, 'gojo', 'nahidwin', 'member'),
(10, 'kendrick', 'lamar', 'member');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `bookID` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`bookID`, `title`, `available`, `category`) VALUES
(1, 'The Great Gatsby', 1, 'Fiksi'),
(2, 'Brief History of Time', 1, 'Ilmiah'),
(3, 'Clean Code', 1, 'Teknologi'),
(4, 'World War II', 1, 'Sejarah'),
(5, 'Pride and Prejudice', 1, 'Fiksi'),
(6, 'Harry Potter', 1, 'Fiksi'),
(7, 'Narnia', 0, 'Fiksi'),
(8, 'The Witcher', 1, 'Fantasi'),
(9, 'The Batman: Year One', 0, 'komik'),
(10, 'Spiderman', 1, 'Komik'),
(11, 'Superman: Man of Steel', 0, 'Komik'),
(14, 'Atomics Habit', 1, 'Edukasi'),
(15, 'One Piece', 1, 'Edukasi');

-- --------------------------------------------------------

--
-- Table structure for table `librarian`
--

CREATE TABLE `librarian` (
  `librarianID` int(60) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `kontak` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `librarian`
--

INSERT INTO `librarian` (`librarianID`, `name`, `kontak`) VALUES
(0, 'admin1', '0811223344');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `memberID` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`memberID`, `nama`, `email`, `phone`) VALUES
(1, 'irgi', 'irgi@email.com', '081340310700'),
(2, 'alif', 'alif@gmail.com', '08114575523'),
(3, 'made', 'made@yahoo.co.id', '081250075911'),
(4, 'sela', 'sela@gmail.com', '081080067123'),
(5, 'derfiola', 'derfiola@email.com', '081367661008'),
(6, 'aby', 'aby@gmail.com', '081007013043'),
(7, 'hanma', 'hanma@yahoo.co.id', '081624577900'),
(8, 'luffy', 'pirateking@op.co.id', '0820102004'),
(9, 'gojo', 'satorou@gmail.com', '0890111311'),
(10, 'kendrick', 'kendricklamar@gmail.com', '081020423043');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `loanID` int(11) NOT NULL,
  `loanDate` date DEFAULT NULL,
  `dueDate` date DEFAULT NULL,
  `returnDate` date DEFAULT NULL,
  `memberID` int(11) DEFAULT NULL,
  `bookID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`loanID`, `loanDate`, `dueDate`, `returnDate`, `memberID`, `bookID`) VALUES
(19, '2025-01-05', '2025-01-19', '2025-01-05', 2, 15),
(20, '2024-12-17', '2024-12-31', '2025-01-05', 3, 10),
(21, '2024-12-16', '2024-12-30', '2025-01-05', 1, 8),
(22, '2025-01-12', '2024-12-29', '2025-01-05', 4, 6),
(23, '2025-01-05', '2025-01-19', NULL, 5, 7),
(24, '2025-01-05', '2025-01-19', NULL, 2, 11),
(25, '2025-01-05', '2025-01-19', NULL, 1, 9);

-- --------------------------------------------------------

--
-- Table structure for table `penalty`
--

CREATE TABLE `penalty` (
  `penaltyID` int(11) NOT NULL,
  `memberID` int(11) DEFAULT NULL,
  `loanID` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penalty`
--

INSERT INTO `penalty` (`penaltyID`, `memberID`, `loanID`, `amount`) VALUES
(5, 3, 20, 80000),
(6, 1, 21, 90000),
(7, 4, 22, 100000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id_akun`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`bookID`);

--
-- Indexes for table `librarian`
--
ALTER TABLE `librarian`
  ADD PRIMARY KEY (`librarianID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`memberID`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`loanID`),
  ADD KEY `memberID` (`memberID`),
  ADD KEY `bookID` (`bookID`);

--
-- Indexes for table `penalty`
--
ALTER TABLE `penalty`
  ADD PRIMARY KEY (`penaltyID`),
  ADD KEY `memberID` (`memberID`),
  ADD KEY `loanID` (`loanID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akun`
--
ALTER TABLE `akun`
  MODIFY `id_akun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `bookID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `memberID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `loanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `penalty`
--
ALTER TABLE `penalty`
  MODIFY `penaltyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`memberID`) REFERENCES `member` (`memberID`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`bookID`) REFERENCES `buku` (`bookID`);

--
-- Constraints for table `penalty`
--
ALTER TABLE `penalty`
  ADD CONSTRAINT `penalty_ibfk_1` FOREIGN KEY (`memberID`) REFERENCES `member` (`memberID`),
  ADD CONSTRAINT `penalty_ibfk_2` FOREIGN KEY (`loanID`) REFERENCES `peminjaman` (`loanID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
