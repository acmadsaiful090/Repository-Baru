-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Apr 2023 pada 04.38
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `percobaan_si`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `alat`
--

CREATE TABLE `alat` (
  `id_alat` bigint(20) NOT NULL,
  `alat` int(50) NOT NULL,
  `id_suhu` bigint(20) UNSIGNED NOT NULL,
  `id_kelembaban` bigint(20) UNSIGNED NOT NULL,
  `id_tekananudara` bigint(20) UNSIGNED NOT NULL,
  `id_kecepatanangin` bigint(20) UNSIGNED NOT NULL,
  `id_lokasi` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kecepatanangin`
--

CREATE TABLE `kecepatanangin` (
  `id_kecepatanangin` bigint(20) UNSIGNED NOT NULL,
  `lokasi_id` bigint(20) UNSIGNED NOT NULL,
  `kecepatanangin` double(8,2) NOT NULL,
  `waktu` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelembaban`
--

CREATE TABLE `kelembaban` (
  `id_kelembaban` bigint(20) UNSIGNED NOT NULL,
  `lokasi_id` bigint(20) UNSIGNED NOT NULL,
  `kelembaban` double(8,2) NOT NULL,
  `waktu` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kotas`
--

CREATE TABLE `kotas` (
  `id_kota` bigint(20) UNSIGNED NOT NULL,
  `kota` varchar(50) NOT NULL,
  `id_provinsi` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kotas`
--

INSERT INTO `kotas` (`id_kota`, `kota`, `id_provinsi`, `created_at`, `updated_at`) VALUES
(1, 'Kabupaten Bogor', 1, '2023-04-05 12:00:51', '2023-04-05 12:00:51'),
(2, 'Kabupaten Sukabumi', 1, '2023-04-05 12:04:19', '2023-04-05 12:04:19'),
(3, 'Kabupaten Bandung', 1, '2023-04-05 12:01:09', '2023-04-05 12:01:09'),
(4, 'Kabupaten Garut', 1, '2023-04-05 12:01:09', '2023-04-05 12:01:09'),
(5, 'Kabupaten Sumedang', 1, '2023-04-05 12:04:19', '2023-04-05 12:04:19'),
(6, 'Kabupaten Banjarnegara', 2, '2023-04-05 12:00:51', '2023-04-05 12:00:51'),
(7, 'Kabupaten Banyumas', 2, NULL, NULL),
(8, 'Kabupaten Jepara', 2, '2023-04-05 12:04:19', '2023-04-05 12:04:19'),
(9, 'Kota Tegal', 2, '2023-04-05 12:04:19', '2023-04-05 12:04:19'),
(10, 'Kota Semarang', 2, '2023-04-05 12:10:20', '2023-04-05 12:10:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `log`
--

CREATE TABLE `log` (
  `id_log` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `aktivitas` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lokasi`
--

CREATE TABLE `lokasi` (
  `id_lokasi` bigint(20) UNSIGNED NOT NULL,
  `id_kota` bigint(20) UNSIGNED NOT NULL,
  `lokasi` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `provinsis`
--

CREATE TABLE `provinsis` (
  `id_provinsi` bigint(20) UNSIGNED NOT NULL,
  `provinsi` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `provinsis`
--

INSERT INTO `provinsis` (`id_provinsi`, `provinsi`, `created_at`, `updated_at`) VALUES
(1, 'Jawa Barat', '2023-03-31 13:44:47', '2023-03-31 13:44:47'),
(2, 'Jawa Tengah', '2023-04-05 12:01:09', '2023-04-05 12:01:09'),
(3, 'Jawa Timur', '2023-04-05 12:04:19', '2023-04-05 12:04:19'),
(4, 'Bali', '2023-04-05 12:04:19', '2023-04-05 12:04:19'),
(5, 'Sulawesi Selatan', '2023-04-05 12:10:20', '2023-04-05 12:10:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `ID_session` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `suhu`
--

CREATE TABLE `suhu` (
  `id_suhu` bigint(20) UNSIGNED NOT NULL,
  `lokasi_id` bigint(20) UNSIGNED NOT NULL,
  `suhu` double(8,2) NOT NULL,
  `waktu` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tekananudara`
--

CREATE TABLE `tekananudara` (
  `id_tekananudara` bigint(20) UNSIGNED NOT NULL,
  `lokasi_id` bigint(20) UNSIGNED NOT NULL,
  `tekananudara` double(8,2) NOT NULL,
  `waktu` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` varchar(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `alat`
--
ALTER TABLE `alat`
  ADD PRIMARY KEY (`id_alat`),
  ADD KEY `id_lokasi` (`id_lokasi`),
  ADD KEY `id_kecepatanangin` (`id_kecepatanangin`),
  ADD KEY `id_kelembaban` (`id_kelembaban`),
  ADD KEY `id_suhu` (`id_suhu`),
  ADD KEY `id_tekananudara` (`id_tekananudara`);

--
-- Indeks untuk tabel `kecepatanangin`
--
ALTER TABLE `kecepatanangin`
  ADD PRIMARY KEY (`id_kecepatanangin`),
  ADD KEY `lokasi_id` (`lokasi_id`);

--
-- Indeks untuk tabel `kelembaban`
--
ALTER TABLE `kelembaban`
  ADD PRIMARY KEY (`id_kelembaban`),
  ADD KEY `lokasi_id` (`lokasi_id`);

--
-- Indeks untuk tabel `kotas`
--
ALTER TABLE `kotas`
  ADD PRIMARY KEY (`id_kota`),
  ADD KEY `kotas_id_provinsi_foreign` (`id_provinsi`);

--
-- Indeks untuk tabel `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `log_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`id_lokasi`),
  ADD KEY `id_kota` (`id_kota`);

--
-- Indeks untuk tabel `provinsis`
--
ALTER TABLE `provinsis`
  ADD PRIMARY KEY (`id_provinsi`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`ID_session`),
  ADD KEY `sessions_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `suhu`
--
ALTER TABLE `suhu`
  ADD PRIMARY KEY (`id_suhu`),
  ADD KEY `lokasi_id` (`lokasi_id`);

--
-- Indeks untuk tabel `tekananudara`
--
ALTER TABLE `tekananudara`
  ADD PRIMARY KEY (`id_tekananudara`),
  ADD KEY `lokasi_id` (`lokasi_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `alat`
--
ALTER TABLE `alat`
  MODIFY `id_alat` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kecepatanangin`
--
ALTER TABLE `kecepatanangin`
  MODIFY `id_kecepatanangin` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kelembaban`
--
ALTER TABLE `kelembaban`
  MODIFY `id_kelembaban` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `log`
--
ALTER TABLE `log`
  MODIFY `id_log` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  MODIFY `id_lokasi` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `sessions`
--
ALTER TABLE `sessions`
  MODIFY `ID_session` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `suhu`
--
ALTER TABLE `suhu`
  MODIFY `id_suhu` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tekananudara`
--
ALTER TABLE `tekananudara`
  MODIFY `id_tekananudara` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `alat`
--
ALTER TABLE `alat`
  ADD CONSTRAINT `alat_ibfk_1` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi` (`id_lokasi`),
  ADD CONSTRAINT `alat_ibfk_2` FOREIGN KEY (`id_kecepatanangin`) REFERENCES `kecepatanangin` (`id_kecepatanangin`),
  ADD CONSTRAINT `alat_ibfk_3` FOREIGN KEY (`id_kelembaban`) REFERENCES `kelembaban` (`id_kelembaban`),
  ADD CONSTRAINT `alat_ibfk_4` FOREIGN KEY (`id_suhu`) REFERENCES `suhu` (`id_suhu`),
  ADD CONSTRAINT `alat_ibfk_5` FOREIGN KEY (`id_tekananudara`) REFERENCES `tekananudara` (`id_tekananudara`);

--
-- Ketidakleluasaan untuk tabel `kecepatanangin`
--
ALTER TABLE `kecepatanangin`
  ADD CONSTRAINT `kecepatanangin_ibfk_1` FOREIGN KEY (`lokasi_id`) REFERENCES `lokasi` (`id_lokasi`);

--
-- Ketidakleluasaan untuk tabel `kelembaban`
--
ALTER TABLE `kelembaban`
  ADD CONSTRAINT `kelembaban_ibfk_1` FOREIGN KEY (`lokasi_id`) REFERENCES `lokasi` (`id_lokasi`);

--
-- Ketidakleluasaan untuk tabel `kotas`
--
ALTER TABLE `kotas`
  ADD CONSTRAINT `kotas_id_provinsi_foreign` FOREIGN KEY (`id_provinsi`) REFERENCES `provinsis` (`id_provinsi`);

--
-- Ketidakleluasaan untuk tabel `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `log_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  ADD CONSTRAINT `lokasi_ibfk_1` FOREIGN KEY (`id_kota`) REFERENCES `kotas` (`id_kota`);

--
-- Ketidakleluasaan untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `suhu`
--
ALTER TABLE `suhu`
  ADD CONSTRAINT `suhu_ibfk_1` FOREIGN KEY (`lokasi_id`) REFERENCES `lokasi` (`id_lokasi`);

--
-- Ketidakleluasaan untuk tabel `tekananudara`
--
ALTER TABLE `tekananudara`
  ADD CONSTRAINT `tekananudara_ibfk_1` FOREIGN KEY (`lokasi_id`) REFERENCES `lokasi` (`id_lokasi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
