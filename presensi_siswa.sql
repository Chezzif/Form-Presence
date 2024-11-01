-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 01, 2024 at 02:28 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `presensi_siswa`
--

-- --------------------------------------------------------

--
-- Table structure for table `nama`
--

CREATE TABLE `nama` (
  `nis` int NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `kelas` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `absen` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nama`
--

INSERT INTO `nama` (`nis`, `nama`, `kelas`, `absen`) VALUES
(23109, 'Akbari Abdul Majid', 'XI RPL 1', 1),
(23110, 'Alya Ayu Artanti', 'XI RPL 1', 2),
(23111, 'Angelica Kharacika Palupi', 'XI RPL 1', 3),
(23112, 'Annisa Syahrani Azzahrrah', 'XI RPL 1', 4),
(23113, 'Az-Zahra Tsuraya', 'XI RPL 1', 5),
(23114, 'Davin Satria Rahmatullah', 'XI RPL 1', 6),
(23115, 'Divia Putri Prasetya', 'XI RPL 1', 7),
(23116, 'Eka Deswiyanti', 'XI RPL 1', 8),
(23117, 'Gema Rayhan Putra Pradana', 'XI RPL 1', 9),
(23118, 'Ghina Naila Salsabila', 'XI RPL 1', 10),
(23119, 'Hasna Joan Lutfian', 'XI RPL 1', 11),
(23120, 'Imannuel Julian Diandra', 'XI RPL 1', 12),
(23121, 'Kayla Septyansya', 'XI RPL 1', 13),
(23122, 'Kenzo Rafael', 'XI RPL 1', 14),
(23123, 'Khairoz Praska Novatama', 'XI RPL 1', 15),
(23124, 'Leonard Noveno Putra', 'XI RPL 1', 16),
(23125, 'Mawar Sharron Nathalie Kiani Putri\r\n', 'XI RPL 1', 17),
(23126, 'Maylani Helsya', 'XI RPL 1', 18),
(23127, 'Mirza Failasuf Azka Sefrizal\r\n', 'XI RPL 1', 19),
(23128, 'Mohammad Idam Nafisomi\r\n', 'XI RPL 1', 20),
(23129, 'Monica Khairunnisa', 'XI RPL 1', 21),
(23130, 'Muhammad Evan Luqmanul Hakim', 'XI RPL 1', 22),
(23131, 'Muhammad Luthfi', 'XI RPL 1', 23),
(23132, 'Muhammad Yazid', 'XI RPL 1', 24),
(23133, 'Nadya Destiya Budi', 'XI RPL 1', 25),
(23134, 'Naura Maulinda Mughni', 'XI RPL 1', 26),
(23135, 'Nayarati Kusuma Randhani\r\n', 'XI RPL 1', 27),
(23136, 'Prasista Puspa Nabilah\r\n', 'XI RPL 1', 28),
(23137, 'Rachma choirotun nisa\r\n', 'XI RPL 1', 29),
(23138, 'Rafael Boaz Febrianto', 'XI RPL 1', 30),
(23139, 'Shella Auliya Putri', 'XI RPL 1', 31),
(23140, 'Shyntha Andryana', 'XI RPL 1', 32),
(23141, 'Sinta Nur Fatimah', 'XI RPL 1', 33),
(23142, 'Tenisa Beautyrise Alinsyira\r\n', 'XI RPL 1', 34),
(23143, 'Yulius Setiawan', 'XI RPL 1', 35),
(23144, 'Zahwa Kartika adijaya', 'XI RPL 1', 36);

-- --------------------------------------------------------

--
-- Table structure for table `presensi`
--

CREATE TABLE `presensi` (
  `id` int NOT NULL,
  `nis` int DEFAULT NULL,
  `nama` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `absen` int NOT NULL,
  `kelas` varchar(20) CHARACTER SET armscii8 COLLATE armscii8_general_ci NOT NULL,
  `keterangan` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `waktu` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `presensi`
--

INSERT INTO `presensi` (`id`, `nis`, `nama`, `absen`, `kelas`, `keterangan`, `waktu`) VALUES
(134, 23109, 'Akbari Abdul Majid', 1, 'XI RPL 1', 'Terlambat', '2024-10-05 10:16:06'),
(135, 23109, 'Akbari Abdul Majid', 1, 'XI RPL 1', 'Terlambat', '2024-10-05 10:16:10'),
(136, 23109, 'Akbari Abdul Majid', 1, 'XI RPL 1', 'Terlambat', '2024-10-05 10:16:15'),
(137, 23110, 'Alya Ayu Artanti', 2, 'XI RPL 1', 'Terlambat', '2024-10-05 10:16:21'),
(138, 23110, 'Alya Ayu Artanti', 2, 'XI RPL 1', 'Terlambat', '2024-10-05 10:16:25'),
(139, 23133, 'Nadya Destiya Budi', 25, 'XI RPL 1', 'Terlambat', '2024-10-05 12:06:00'),
(140, 23133, 'Nadya Destiya Budi', 25, 'XI RPL 1', 'Terlambat', '2024-10-05 12:06:59'),
(141, 23133, 'Nadya Destiya Budi', 25, 'XI RPL 1', 'Terlambat', '2024-10-05 12:07:34'),
(142, 23133, 'Nadya Destiya Budi', 25, 'XI RPL 1', 'Terlambat', '2024-10-05 12:07:37'),
(143, 23133, 'Nadya Destiya Budi', 25, 'XI RPL 1', 'Terlambat', '2024-10-05 12:07:45'),
(144, 23133, 'Nadya Destiya Budi', 25, 'XI RPL 1', 'Terlambat', '2024-10-05 12:08:58'),
(145, 23133, 'Nadya Destiya Budi', 25, 'XI RPL 1', 'Terlambat', '2024-10-05 12:29:24'),
(146, 23133, 'Nadya Destiya Budi', 25, 'XI RPL 1', 'Terlambat', '2024-10-05 12:29:30'),
(147, 23133, 'Nadya Destiya Budi', 25, 'XI RPL 1', 'Terlambat', '2024-10-05 12:29:38'),
(148, 23133, 'Nadya Destiya Budi', 25, 'XI RPL 1', 'Terlambat', '2024-10-05 12:29:43'),
(149, 23133, 'Nadya Destiya Budi', 25, 'XI RPL 1', 'Terlambat', '2024-10-05 12:29:50'),
(150, 23133, 'Nadya Destiya Budi', 25, 'XI RPL 1', 'Terlambat', '2024-10-05 12:29:58'),
(151, 23133, 'Nadya Destiya Budi', 25, 'XI RPL 1', 'Terlambat', '2024-10-05 12:30:13'),
(152, 23133, 'Nadya Destiya Budi', 25, 'XI RPL 1', 'Terlambat', '2024-10-05 12:30:19'),
(153, 23133, 'Nadya Destiya Budi', 25, 'XI RPL 1', 'Terlambat', '2024-10-05 12:30:28'),
(154, 23133, 'Nadya Destiya Budi', 25, 'XI RPL 1', 'Terlambat', '2024-10-05 12:30:47'),
(155, 23133, 'Nadya Destiya Budi', 25, 'XI RPL 1', 'Terlambat', '2024-10-05 12:30:52'),
(156, 23133, 'Nadya Destiya Budi', 25, 'XI RPL 1', 'Terlambat', '2024-10-05 12:30:58'),
(157, 23133, 'Nadya Destiya Budi', 25, 'XI RPL 1', 'Terlambat', '2024-10-05 12:31:07'),
(158, 23114, 'Davin Satria Rahmatullah', 6, 'XI RPL 1', 'Hadir', '2024-11-01 02:04:44'),
(159, 23133, 'Nadya Destiya Budi', 25, 'XI RPL 1', 'Hadir', '2024-11-01 02:05:24'),
(160, 23109, 'Akbari Abdul Majid', 1, 'XI RPL 1', 'Hadir', '2024-11-01 02:05:59'),
(161, 23109, 'Akbari Abdul Majid', 1, 'XI RPL 1', 'Hadir', '2024-11-01 02:07:16'),
(162, 23109, 'Akbari Abdul Majid', 1, 'XI RPL 1', 'Hadir', '2024-11-01 02:15:37'),
(163, 23109, 'Akbari Abdul Majid', 1, 'XI RPL 1', 'Hadir', '2024-11-01 02:18:30'),
(164, 23109, 'Akbari Abdul Majid', 1, 'XI RPL 1', 'Hadir', '2024-11-01 02:19:25'),
(165, 23109, 'Akbari Abdul Majid', 1, 'XI RPL 1', 'Terlambat', '2024-11-01 09:20:50'),
(166, 23133, 'Nadya Destiya Budi', 25, 'XI RPL 1', 'Terlambat', '2024-11-01 09:21:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nama`
--
ALTER TABLE `nama`
  ADD PRIMARY KEY (`nis`);

--
-- Indexes for table `presensi`
--
ALTER TABLE `presensi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_nama_nis` (`nis`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `presensi`
--
ALTER TABLE `presensi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `presensi`
--
ALTER TABLE `presensi`
  ADD CONSTRAINT `fk_nama_nis` FOREIGN KEY (`nis`) REFERENCES `nama` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `presensi_ibfk_1` FOREIGN KEY (`nis`) REFERENCES `nama` (`nis`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
