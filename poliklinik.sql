-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Des 2024 pada 17.04
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poliklinik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_periksa`
--

CREATE TABLE `detail_periksa` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_periksa` int(11) UNSIGNED DEFAULT NULL,
  `id_obat` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `detail_periksa`
--

INSERT INTO `detail_periksa` (`id`, `id_periksa`, `id_obat`) VALUES
(69, 11, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokter`
--

CREATE TABLE `dokter` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_hp` varchar(50) DEFAULT NULL,
  `spesialis` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dokter`
--

INSERT INTO `dokter` (`id`, `nama`, `alamat`, `no_hp`, `spesialis`) VALUES
(3, 'Aryadila Dewi', 'Jln Arwana Rupawan No 21 Semarang Barat', '0812323132', 'Dokter Spesialis'),
(5, 'Arkani Widjaya', 'Jln Kidul Ngawur No 18 Gunung Pati', '0812901596', 'Dokter Gigi'),
(12, 'hasan', 'budayana', '08123131222', 'dokter umum'),
(13, 'babat', 'cendaya', '08123314342', 'Dokter Gigi'),
(16, 'turat', 'turatin', '081239129', 'Dokter Umum');

-- --------------------------------------------------------

--
-- Struktur dari tabel `obat`
--

CREATE TABLE `obat` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama_obat` varbinary(50) DEFAULT NULL,
  `kemasan` varchar(35) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `kandungan_obat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `obat`
--

INSERT INTO `obat` (`id`, `nama_obat`, `kemasan`, `harga`, `kandungan_obat`) VALUES
(2, 0x50616e61646f6c204578747261203130204b61706c6574, 'Tablet', 12000, 'Paracetamol 500mg dan caffeine 65g'),
(3, 0x4365666164726f78696c20353030206d67203130204b617073756c, 'Tablet', 20000, 'Cefadroxil 500 mg'),
(4, 0x766974616d696e206320313030306d67, 'Tablet', 45000, 'Vitamin C 1000 mg'),
(5, 0x416d6f786963696c6c696e, 'Tablet dan Suntik', 36000, 'Antibiotik penisilin'),
(6, 0x417370696c657473203830206d67203130205461626c6574, 'Strip Tablet', 20000, 'Acetylsalicylic acid 80 mg / aspirin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_hp` varchar(50) DEFAULT NULL,
  `alergi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`id`, `nama`, `alamat`, `no_hp`, `alergi`) VALUES
(15, 'Reyhan Ismail ', 'jln Cendana Raya No 1 Sumatera Barat ', '0821234510', 'Penisilin dan Aspirin '),
(16, 'Agung Pandu ', 'Jln Cendrawasih No 12 Semarang Utara', '0812855734', 'Anti-radang (antiinflamasi) nonsteroid'),
(17, 'Rovie William', 'jln Boulevard Indah No 45 Jakarta Selatan', '0812555789', 'Insulin'),
(18, 'Wayne Rooney ', 'Jln Inggris Raya No 15 Jakarta Utara', '081315786', 'aspirin'),
(19, 'arhan', 'butayaro', '08123456', 'kuningan'),
(22, 'megawati', 'asmaara', '0812839189', 'banyak'),
(26, 'gustaf', 'gustafi', '0812393930', 'aspirin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `periksa`
--

CREATE TABLE `periksa` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_pasien` int(11) UNSIGNED DEFAULT NULL,
  `id_dokter` int(11) UNSIGNED DEFAULT NULL,
  `tgl_periksa` datetime DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `obat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `periksa`
--

INSERT INTO `periksa` (`id`, `id_pasien`, `id_dokter`, `tgl_periksa`, `catatan`, `obat`) VALUES
(11, 16, 12, '2024-09-25 12:00:00', 'sakit', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `usertable`
--

CREATE TABLE `usertable` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `code` mediumint(50) NOT NULL,
  `status` text NOT NULL,
  `role` enum('admin','pasien','dokter') DEFAULT 'pasien'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `usertable`
--

INSERT INTO `usertable` (`id`, `username`, `password`, `code`, `status`, `role`) VALUES
(18, 'reyhan ismail', '$2y$10$WW/0x/7gbol9vw1KDO9Nlubod9Km0wno6Zlfd3DFwotWZibAluV3y', 0, '', 'pasien'),
(19, 'reyhannn', '$2y$10$iRoAQuONhRt3Cwmof6bBPOhqRrmW3sWOFURDntqRAF8kpplPR46..', 0, '', 'pasien'),
(20, 'agungpandu', '$2y$10$2EXL7cTKhZczmyFDt5vN6eSwrH8sbiHLvww2K1XZAWDOQB4GC1SOC', 0, '', 'pasien'),
(21, 'agungpan', '$2y$10$LuzdJoLDzGYKRs1u9rvNtekZQMYd78OnWRrLa5rjD.dvcpswwIo0y', 0, '', 'pasien'),
(22, 'agungpandu123', '$2y$10$ybXvBmssEYHwlVy6PfzRUOvoOjUaLcpoD8djkNHQvf0j6AzABwhei', 0, '', 'pasien'),
(23, 'king', '$2y$10$BDLkWVSUwkzVHH8FgrcvfuV5MKHFJuBOaQkP6tLDS5ItWgAjl3zy.', 0, '', 'pasien'),
(24, 'king12', '$2y$10$io3DnerFLevk5bAzUzWOreBiNZxcnYt4NH1xGB6htMtvrnUxBGy5a', 0, '', 'pasien'),
(26, 'king123', '$2y$10$1wS9oVl2iPKgMuRCN7POVeERaEZ2yyrS9T4ZbIOnJLytaabFyzm4O', 0, '', 'pasien'),
(27, 'user', '$2y$10$UXdQox.TvP3Xf1pd.mNzUuZLrQMTBsDmBp5UeCZ5U8WrVwKrLf2Lq', 0, '', 'pasien'),
(28, 'KONG', '$2y$10$QM7fLzORQmGMPH1dG4rmP.FzYLYU/DJyprXP.Rh0ZzOPlHgRa4otq', 0, '', 'pasien'),
(29, 'kingo', '$2y$10$SoOLisbaYmzaBzD.0RxEnOeqDt3r7iduhaI.77jAZLTApe.Q5Zfzi', 0, '', 'pasien'),
(30, 'loba', '$2y$10$y/LQZie7Y/72ll2AodwzGeQiJbxUhQrL7ZBJwQ.rN.QpJJXunTtpa', 0, '', 'pasien'),
(31, 'loba1', '$2y$10$b5l.DbyVrLiZ0o0MWKTuUOGv8U/8KjUgggKbmSYYro2pi0TumoHsm', 0, '', 'pasien'),
(32, 'kinga', '$2y$10$/0ML8UNRHTY.QNH5A7/j9.Lc9.JSRErKQpsfsUTP8TAf6ZEdWobTy', 0, '', 'pasien'),
(33, 'agung', '$2y$10$I4nk6731wQfK7gzygfUWwet/BmUAH0zVuQMQhgRnAvizdRn5dh35O', 0, '', 'pasien'),
(34, 'pandu', '$2y$10$q/NRixSkMZsF3ASAtVFkceKosbeJYa1KD/7MvqIa20mfHcLcAMi7G', 0, '', 'pasien'),
(35, 'kingq', '$2y$10$6t5/LtqC2FdziLVwMQaY1uWg3lAWPVaiwXVkYBg5joRi3TTQXTc1S', 0, '', 'pasien'),
(36, 'panda', '$2y$10$c0amzq/7jiPDm1Kq.l0l8O8kLqmNuN3kxLsGRuDX2cqxWGf5oq5xi', 0, '', 'admin'),
(37, 'pende', '$2y$10$rRH9Cq/KtiNAB5Eu9nJf6OGqzXhiEyYfiTeILQBGMreSZwXXw3lTi', 0, '', 'dokter'),
(38, 'pendek', '$2y$10$xKkitITdeBv8YJ6uOO.vIegETh5QT4ZPBR3zvUILic3YbGVWXX1YO', 0, '', 'dokter'),
(39, 'tobey', '$2y$10$bbIaG5nqUJjLnlXcQJYeTOIWYyzO/wQWD9vSIuQCweZ.zZ4pQPsBW', 0, '', 'pasien'),
(40, 'tobay', '$2y$10$dhBEeLLsk8OE4QEp5Ua5nuMLbICwZBX1vFPY1ub4s1ATeaXeBNOz6', 0, '', 'dokter'),
(41, 'tobiy', '$2y$10$thivB3ateX4sETBR.HVp6.cUrLLzzp1LJ6XN91hy34qVjQaOzeR.e', 0, '', 'admin'),
(42, 'maga', '$2y$10$ZsselNCeGS/nB1aiwEmUDuX9sn/oCpNYTxhd7OcufxgTuHsZomtcC', 0, '', 'admin'),
(43, 'bebet', '$2y$10$vtoNG2anCTncD1B3xsE17.yhoEGx29NNJW4gdgK//G0czw3Gu0SCm', 0, '', 'admin'),
(44, 'pona', '$2y$10$E2esnmu5bNMN4eUR1aA7nuoUrwzi35t02dCscZCHqg0dRtlG6rjKq', 0, '', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_periksa` (`id_periksa`),
  ADD KEY `id_obat` (`id_obat`);

--
-- Indeks untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `periksa`
--
ALTER TABLE `periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indeks untuk tabel `usertable`
--
ALTER TABLE `usertable`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_periksa`
--
ALTER TABLE `detail_periksa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT untuk tabel `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `periksa`
--
ALTER TABLE `periksa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `usertable`
--
ALTER TABLE `usertable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD CONSTRAINT `detail_periksa_ibfk_1` FOREIGN KEY (`id_periksa`) REFERENCES `periksa` (`id`),
  ADD CONSTRAINT `detail_periksa_ibfk_2` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id`);

--
-- Ketidakleluasaan untuk tabel `periksa`
--
ALTER TABLE `periksa`
  ADD CONSTRAINT `periksa_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id`),
  ADD CONSTRAINT `periksa_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
