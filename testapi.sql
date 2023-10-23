-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 23, 2023 at 08:09 AM
-- Server version: 8.0.34-0ubuntu0.22.04.1
-- PHP Version: 8.1.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_10_20_102833_create_shop_categories_table', 1),
(9, '2023_10_20_102848_create_offers_table', 2),
(10, '2023_10_20_102809_create_shops_table', 3),
(11, '2023_10_23_025918_create_jobs_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `user_id`, `name`, `description`, `shop_id`, `created_at`, `updated_at`) VALUES
(1, '4', 'My first Offer', 'My first Offer Description', 2, '2023-10-22 16:52:26', '2023-10-22 16:52:26'),
(2, '4', 'My Second Offer', 'My Second Offer Description', 6, '2023-10-22 17:01:20', '2023-10-22 17:01:20'),
(3, '4', 'My Third Offer', 'My Third Offer Description', 6, '2023-10-22 17:03:07', '2023-10-22 17:03:07'),
(4, '4', 'My eight Offer', 'My eight ffer Description', 5, '2023-10-22 21:41:42', '2023-10-22 21:41:42'),
(5, '4', 'New mitsos offer', 'Mitsos offer', 5, '2023-10-23 01:33:20', '2023-10-23 01:33:20'),
(6, '4', 'New mitsos offer tm', 'Mitsos offer', 5, '2023-10-23 01:45:26', '2023-10-23 01:45:26'),
(7, '4', 'New mitsos offer tm', 'Mitsos offer', 5, '2023-10-23 01:49:01', '2023-10-23 01:49:01');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 4, 'AuthToken', 'fddc072d239f7327ac7917091c3fbf38139665006d04bf43f17a77c12da6ca46', '[\"*\"]', NULL, NULL, '2023-10-20 18:08:28', '2023-10-20 18:08:28'),
(2, 'App\\Models\\User', 5, 'AuthToken', '01f705e788ecf00d79e1a270ba185f7ac70d914683da8cbe35e293c5e33e8e5e', '[\"*\"]', NULL, NULL, '2023-10-20 18:12:43', '2023-10-20 18:12:43'),
(3, 'App\\Models\\User', 4, 'ApiToken', '91e12ce13ede7076e49e71b28d7542b5c11de2dfb23137376aeae4b76e9022cd', '[\"*\"]', NULL, NULL, '2023-10-20 19:02:10', '2023-10-20 19:02:10'),
(4, 'App\\Models\\User', 4, 'ApiToken', '29c1e50cd584e3a75508a81df76f6b0db8a4d672568b87adf395ada7c3664b0b', '[\"*\"]', NULL, NULL, '2023-10-20 19:02:33', '2023-10-20 19:02:33'),
(5, 'App\\Models\\User', 4, 'ApiToken', 'e060b87684c4bf52e40cb2eb97348620fa572ee9a7125f82c4d6e044b46af306', '[\"*\"]', NULL, NULL, '2023-10-20 19:09:06', '2023-10-20 19:09:06'),
(6, 'App\\Models\\User', 4, 'ApiToken', 'd05cff91abb97201ffd21236ba3924e1c57a677738da601b80ffdf04cc9c1c60', '[\"*\"]', NULL, NULL, '2023-10-20 19:09:26', '2023-10-20 19:09:26'),
(7, 'App\\Models\\User', 4, 'ApiToken', 'c73dc7eda7aad28d224c420e7b2c801f12dcb850afdac04540d1325244977b56', '[\"*\"]', '2023-10-20 20:00:26', NULL, '2023-10-20 19:29:38', '2023-10-20 20:00:26'),
(8, 'App\\Models\\User', 4, 'ApiToken', '0d56e77068319d065224288d6c3305c13b647b49af743e3efd0260d5322f9362', '[\"*\"]', '2023-10-23 01:49:01', NULL, '2023-10-22 16:39:13', '2023-10-23 01:49:01'),
(9, 'App\\Models\\User', 6, 'ApiToken', '5c8b6282f99107ba27bf9edc20fecfa2b821f7bdaead20601200f29ca201b1a9', '[\"*\"]', '2023-10-23 01:28:16', NULL, '2023-10-23 01:25:26', '2023-10-23 01:28:16');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shopcategory_id` int NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `open_hours` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `user_id`, `name`, `shopcategory_id`, `description`, `open_hours`, `city`, `address`, `created_at`, `updated_at`) VALUES
(1, 4, 'Test 5', 1, 'New desc', '09:00 - 16:00', 'Iraklio', 'Georgiou 25235', '2023-10-22 18:50:47', '2023-10-22 18:50:47'),
(2, 2, 'Test 8', 2, 'New desc 8', '09:00 - 21:00', 'Patra', 'Irwwn Politexniou 25235', '2023-10-22 18:52:25', '2023-10-22 18:52:25'),
(3, 4, 'Test 16', 2, 'New desc 8', '09:00 - 21:00', 'Patra', 'Irwwn Politexniou 25235', '2023-10-22 19:33:49', '2023-10-22 19:33:49'),
(5, 4, 'Test 25', 1, 'New desc 8', '09:00 - 21:00', 'Patra', NULL, '2023-10-22 20:22:47', '2023-10-22 20:22:47'),
(6, 4, 'Test 52', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.', '09:00 - 17:00', 'Iraklio', 'Ermou 1555', '2023-10-22 23:44:02', '2023-10-22 23:44:02'),
(7, 4, 'Test 5265', 1, 'Lorem Ipsum is simply dummy text of the printiasdasdasdng and typesetting industry. Lorem Ipsum has beenasdasdas the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambleasdadasdasdd it to make a type speciasdasdasdmen book. It has survived not onlasdasdasdasdasdasdy five centuries.', '09:00 - 21:00', 'Athena', 'Politexniou 1555', '2023-10-23 01:20:20', '2023-10-23 01:20:20'),
(8, 6, 'Mitsos new shop', 1, 'Mitsos Desc', '09:00 - 15:00', 'ioannina', 'Ioanninon 1555', '2023-10-23 01:28:16', '2023-10-23 01:28:16');

-- --------------------------------------------------------

--
-- Table structure for table `shop_categories`
--

CREATE TABLE `shop_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_categories`
--

INSERT INTO `shop_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Clothes', NULL, NULL),
(2, 'Motorcycles', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Shyann Braun II', 'greenfelder.reva@example.net', '2023-10-20 09:44:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'quest', NULL, '2023-10-20 09:44:03', '2023-10-20 09:44:03'),
(2, 'Vaggelis Karanikolos', 'vagg.karanikolos@gmail.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'owner', NULL, NULL, NULL),
(4, 'Vaggelis', 'vag@test.gr', NULL, '$2y$10$aTgtNFNL5.aWLIc683TKr.T8tvzxvqNaZ8X3iNo/8V2AnDCXV62LK', 'owner', NULL, '2023-10-20 18:08:28', '2023-10-20 18:08:28'),
(5, 'Vaggelis 4', 'vag2@test.gr', NULL, '$2y$10$YaFR2fvtw4lGuHDGXeCX1elpFlgwIcDslOvoTIvSuVt1PrldXI8J2', 'owner', NULL, '2023-10-20 18:12:43', '2023-10-20 18:12:43'),
(6, 'Vaggelis Mp', 'vag156@test.gr', NULL, '$2y$10$1OicCSihJuUDLVtiMrTme.cGLb06v2SsQrRUeVlCVnJ4lr0JFvCv.', 'owner', NULL, '2023-10-23 01:25:26', '2023-10-23 01:25:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_categories`
--
ALTER TABLE `shop_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shop_categories`
--
ALTER TABLE `shop_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
