-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 04, 2023 lúc 09:43 AM
-- Phiên bản máy phục vụ: 10.4.19-MariaDB
-- Phiên bản PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webphim_laravel`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `title`, `description`, `status`, `slug`, `position`, `created_at`, `updated_at`) VALUES
(1, 'Phim mới', 'Phim mới cập nhật hằng ngày', 1, 'phim-moi', 0, '2023-04-15 16:29:04', '2023-04-24 01:45:19'),
(2, 'Phim chiếu rạp', 'Phim chiếu rạp cập nhật hằng ngày', 1, 'phim-chieu-rap', 1, '2023-04-16 00:11:05', '2023-04-24 01:45:19'),
(3, 'Phim thuyết minh', 'Phim thuyết minh cập nhật hằng ngày', 1, 'phim-thuyet-minh', 2, '2023-04-16 00:11:34', '2023-04-24 01:45:19'),
(4, 'Phim bộ', 'Phim bộ cập nhật hằng ngày', 1, 'phim-bo', 3, '2023-04-16 00:11:59', '2023-04-24 01:45:19'),
(6, 'Phim bộ mới', 'Phim bộ mới cập nhật hằng ngày', 0, 'phim-bo-moi', 4, '2023-04-16 00:13:04', '2023-04-16 14:36:57'),
(7, 'Phim lẻ', 'Phim hành động cập nhật mỗi ngày', 1, 'phim-le', 4, '2023-04-16 14:10:26', '2023-04-24 01:45:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `countries`
--

INSERT INTO `countries` (`id`, `title`, `description`, `status`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Việt Nam', 'Quốc gia Việt Nam', 1, 'phim-viet-nam', '2023-04-16 01:18:58', '2023-04-16 18:01:21'),
(3, 'Nhật Bản', 'Quốc gia Nhật Bản', 1, 'phim-nhat-ban', '2023-04-16 14:16:42', '2023-04-16 18:01:33'),
(4, 'Mỹ', 'Quốc gia Mỹ', 1, 'phim-my', '2023-04-16 18:00:01', '2023-04-16 18:00:01'),
(5, 'Hàn Quốc', 'Quốc gia Hàn Quốc', 1, 'phim-han-quoc', '2023-04-16 18:00:40', '2023-04-17 01:33:45'),
(6, 'Trung Quốc', 'Quốc gia Trung Quốc', 1, 'phim-trung-quoc', '2023-04-16 18:01:12', '2023-04-16 18:01:12'),
(7, 'Anh', 'Quốc gia Anh', 1, 'phim-anh', '2023-04-16 19:21:18', '2023-04-16 19:21:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `episodes`
--

CREATE TABLE `episodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `movie_id` int(11) NOT NULL,
  `link` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `episode` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `episodes`
--

INSERT INTO `episodes` (`id`, `movie_id`, `link`, `episode`, `status`, `created_at`, `updated_at`) VALUES
(12, 28, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://hd.hdbophim.com/share/c22abfa379f38b5b0411bc11fa9bf92f\" width=\"100%\"></iframe></p>', '1', 1, '2023-04-23 01:49:07', '2023-04-28 14:52:40'),
(13, 28, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://hd.hdbophim.com/share/ca75910166da03ff9d4655a0338e6b09\" width=\"100%\"></iframe></p>', '2', 1, '2023-04-23 01:49:50', '2023-04-28 14:53:13'),
(14, 28, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://hd.hdbophim.com/share/4311359ed4969e8401880e3c1836fbe1\" width=\"100%\"></iframe></p>', '3', 1, '2023-04-23 01:50:33', '2023-04-28 14:54:10'),
(16, 28, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://hd.hdbophim.com/share/92977ae4d2ba21425a59afb269c2a14e\" width=\"100%\"></iframe></p>', '4', 1, '2023-04-23 15:00:02', '2023-04-28 14:54:50'),
(19, 4, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://hd.1080phim.com/share/6654ce00c34e725d8517c795abb11cdc\" width=\"100%\"></iframe></p>', 'HD', 1, '2023-04-24 07:26:40', '2023-04-30 06:05:02'),
(20, 18, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/JQSTm1r0_1A\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>', 'Cam', 1, '2023-04-24 07:41:04', '2023-04-24 07:41:04'),
(21, 28, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://hd.hdbophim.com/share/9c01802ddb981e6bcfbec0f0516b8e35\" width=\"100%\"></iframe></p>', '5', 1, '2023-04-24 10:06:43', '2023-04-28 14:55:18'),
(22, 12, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://kd.hd-bophim.com/share/212ad7bb06e34ce8eff54540c30efdff\" width=\"100%\"></iframe></p>', '1', 1, '2023-04-28 14:41:41', '2023-04-28 14:41:41'),
(23, 28, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://hd.hdbophim.com/share/cc1aa436277138f61cda703991069eaf\" width=\"100%\"></iframe></p>', '6', 1, '2023-04-28 14:55:57', '2023-04-28 14:55:57'),
(24, 28, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://hd.hdbophim.com/share/2ab56412b1163ee131e1246da0955bd1\" width=\"100%\"></iframe></p>', '7', 1, '2023-04-28 14:56:24', '2023-04-28 14:56:24'),
(25, 30, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://aa.nguonphimmoi.com/share/8d6a06b2f1208b59454a9a749928b0c0\" width=\"100%\"></iframe></p>', 'FullHD', 1, '2023-05-03 01:59:16', '2023-05-03 01:59:16'),
(26, 22, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://hd.1080phim.com/share/b9792b35b9148b438119e2fec2d67804\" width=\"100%\"></iframe></p>', 'HD', 1, '2023-05-03 06:18:43', '2023-05-03 06:18:43'),
(27, 10, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://aa.nguonphimmoi.com/share/0fd4b8a8354a77a3fa75e3d97e7a34e6\" width=\"100%\"></iframe></p>', 'HD', 1, '2023-05-03 06:20:08', '2023-05-03 06:20:08'),
(28, 27, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://kd.hd-bophim.com/share/be3e9d3f7d70537357c67bb3f4086846\" width=\"100%\"></iframe></p>', 'HD', 1, '2023-05-03 06:22:10', '2023-05-03 06:22:10'),
(29, 24, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://1080.hdphimonline.com/share/d709f38ef758b5066ef31b18039b8ce5\" width=\"100%\"></iframe></p>', 'HD', 1, '2023-05-03 06:23:23', '2023-05-03 06:23:23'),
(30, 21, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://playhydrax.com/?v=Um-oR3W3jQ\" width=\"100%\"></iframe></p>', 'HD', 1, '2023-05-03 06:33:58', '2023-05-03 06:33:58'),
(31, 16, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://hd.1080phim.com/share/322842c2ab91400f806ddb8a8f0647c0\" width=\"100%\"></iframe></p>', '1', 1, '2023-05-03 06:40:15', '2023-05-03 06:40:15'),
(32, 16, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://hd.1080phim.com/share/871035ec5613dfdd75b913890257f0f8\" width=\"100%\"></iframe></p>', '2', 1, '2023-05-03 06:40:48', '2023-05-03 06:40:48'),
(33, 20, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://kd.hd-bophim.com/share/b3f634f6e02425702178395dfe6f062a\" width=\"100%\"></iframe></p>', '1', 1, '2023-05-03 06:42:37', '2023-05-03 06:42:37'),
(34, 20, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://kd.hd-bophim.com/share/81452dc1589504edc2134b4b0c9d40fc\" width=\"100%\"></iframe></p>', '2', 1, '2023-05-03 06:43:54', '2023-05-03 06:43:54'),
(35, 20, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://kd.hd-bophim.com/share/d59ec4d93d959f651ed743c75192723e\" width=\"100%\"></iframe></p>', '3', 1, '2023-05-03 06:45:10', '2023-05-03 06:45:10'),
(36, 20, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://kd.hd-bophim.com/share/a6e541f4abdd89b30649ca4e7f47ec24\" width=\"100%\"></iframe></p>', '4', 1, '2023-05-03 06:45:39', '2023-05-03 06:45:39'),
(37, 20, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://kd.hd-bophim.com/share/8b2239fca6fd9c03161a015801fe0b43\" width=\"100%\"></iframe></p>', '5', 1, '2023-05-03 06:46:13', '2023-05-03 06:46:13'),
(38, 19, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://kd.hd-bophim.com/share/0b668d973688aeb13be05aab06902066\" width=\"100%\"></iframe></p>', '1', 1, '2023-05-03 10:18:19', '2023-05-03 10:18:19'),
(39, 19, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://kd.hd-bophim.com/share/0718aac22ecc8481c33c38f79ba7f5bb\" width=\"100%\"></iframe></p>', '2', 1, '2023-05-03 10:19:14', '2023-05-03 10:19:14'),
(40, 19, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://kd.hd-bophim.com/share/0ee7cdb0c30e70bdb04b5c35d009d541\" width=\"100%\"></iframe></p>', '3', 1, '2023-05-03 10:20:11', '2023-05-03 10:20:11'),
(41, 19, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://kd.hd-bophim.com/share/74b4db7ecf4ff1770156d20fd45a7a6e\" width=\"100%\"></iframe></p>', '4', 1, '2023-05-03 10:20:42', '2023-05-03 10:20:42'),
(42, 7, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://hd.hdbophim.com/share/7bfe9bbb5c6f3e338caea40379659556\" width=\"100%\"></iframe></p>', '1', 1, '2023-05-03 23:30:11', '2023-05-03 23:30:11'),
(43, 7, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://hd.hdbophim.com/share/8a4032b5acf0ee3b57dd489ce6a672c1\" width=\"100%\"></iframe></p>', '2', 1, '2023-05-03 23:30:50', '2023-05-03 23:30:50'),
(44, 7, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://hd.hdbophim.com/share/7438845b5943e3d61cb4964f2bc218ad\" width=\"100%\"></iframe></p>', '3', 1, '2023-05-03 23:31:22', '2023-05-03 23:31:22'),
(45, 7, '<p><iframe allowfullscreen frameborder=\"0\" height=\"360\" scrolling=\"0\" src=\"https://kd.hd-bophim.com/share/d6d5125f2d5e36115d2fe90d1a4d4225\" width=\"100%\"></iframe></p>', '4', 1, '2023-05-03 23:31:57', '2023-05-03 23:31:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `genres`
--

CREATE TABLE `genres` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `genres`
--

INSERT INTO `genres` (`id`, `title`, `description`, `status`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Hành động', 'Phim hành động cập nhật', 1, 'hanh-đong', '2023-04-16 01:16:10', '2023-04-16 14:16:10'),
(3, 'Hoạt hình', 'Phim hoạt hình cập nhật', 1, 'hoat-hinh', '2023-04-16 14:16:02', '2023-04-16 14:16:02'),
(4, 'Hình sự', 'Phim hình sự cập nhật mỗi ngày', 1, 'hinh-su', '2023-04-16 19:10:16', '2023-04-16 19:10:16'),
(5, 'Chiến Tranh', 'Phim chiến tranh cập nhật mỗi ngày', 1, 'chien-tranh', '2023-04-16 19:11:09', '2023-04-16 19:11:09'),
(6, 'Cổ trang', 'Phim cổ trang cập nhật mỗi ngày', 1, 'co-trang', '2023-04-16 19:11:50', '2023-04-16 19:11:50'),
(7, 'Gia đình', 'Phim gia đình cập nhật mỗi ngày', 1, 'gia-đinh', '2023-04-16 19:12:13', '2023-04-16 19:12:13'),
(8, 'Hài hước', 'Phim hài hước cập nhật mỗi ngày', 1, 'hai-huoc', '2023-04-16 19:12:45', '2023-04-16 19:12:45'),
(9, 'Tâm lý', 'Phim tâm lý cập nhật mỗi ngày', 1, 'tam-ly', '2023-04-16 19:19:45', '2023-04-16 19:19:45'),
(10, 'Tình cảm', 'Phim tình cảm cập nhật mỗi ngày', 1, 'tinh-cam', '2023-04-16 19:20:05', '2023-04-16 19:20:05'),
(11, 'Kinh dị', 'Phim kinh dị cập nhật mới nhất', 1, 'kinh-di', '2023-04-16 19:22:40', '2023-04-16 19:22:40'),
(12, 'Viễn tưởng', 'Phim viễn tưởng cập nhật mỗi ngày', 1, 'vien-tuong', '2023-04-21 02:07:03', '2023-04-21 02:07:03'),
(13, 'Thần thoại', 'Phim thần thoại cập nhật mỗi ngày', 1, 'than-thoai', '2023-04-21 02:07:26', '2023-04-21 02:07:26'),
(14, 'Giả tưởng', 'Phim giả tưởng cập nhật mỗi ngày', 1, 'gia-tuong', '2023-04-21 02:08:14', '2023-04-21 02:08:14'),
(15, 'Phiêu lưu', 'Phim phiêu lưu cập nhật mỗi ngày', 1, 'phieu-luu', '2023-04-21 02:08:38', '2023-04-21 02:08:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `info`
--

CREATE TABLE `info` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `copyright` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `info`
--

INSERT INTO `info` (`id`, `title`, `description`, `logo`, `copyright`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Phim Hay | Phim Mới | Phim HD VietSub | Xem Phim Online', 'Xem phim mới nhất 2023, câp nhật nhanh nhất, Xem phim Online HD VietSub - Thuyết Minh trên nhiều thiết bị', 'LOGO-PNG4063.webp', 'Copyright © 2011-2023 Provid Films.', 1, '2023-04-30 01:11:26', '2023-04-30 19:32:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_04_15_213147_create_categories_table', 2),
(6, '2023_04_15_213842_create_genres_table', 3),
(7, '2023_04_15_214015_create_countries_table', 4),
(8, '2023_04_15_214156_create_movies_table', 5),
(9, '2023_04_15_214922_create_episodes_table', 6),
(10, '2023_04_21_082727_create_movie_genres_table', 7),
(11, '2023_04_27_013315_create_ratings_table', 8),
(12, '2023_04_30_063312_create_info_table', 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `movies`
--

CREATE TABLE `movies` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `movie_duration` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `trailer` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `episode` int(50) NOT NULL DEFAULT 1,
  `tags` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `format` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `phim_hot` int(11) NOT NULL,
  `resolution` int(11) NOT NULL DEFAULT 0,
  `subtitle` int(11) NOT NULL DEFAULT 0,
  `name_eng` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `top_view` int(11) DEFAULT NULL,
  `season` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `movies`
--

INSERT INTO `movies` (`id`, `title`, `slug`, `movie_duration`, `description`, `trailer`, `episode`, `tags`, `status`, `image`, `format`, `category_id`, `genre_id`, `country_id`, `phim_hot`, `resolution`, `subtitle`, `name_eng`, `year`, `top_view`, `season`, `created_at`, `updated_at`) VALUES
(4, 'SHAZAM! CƠN THỊNH NỘ CỦA CÁC VỊ THẦN', 'shazam-con-thinh-no-cua-cac-vi-than', '130 phút', 'Shazam! Cơn Thịnh Nộ Của Các Vị Thần 2023, Shazam! Fury of the Gods HD Vietsub + Thuyết minh\r\nBộ phim tiếp tục câu chuyện về cậu thiếu niên Billy Batson, khi đọc thuộc lòng từ ma thuật \"SHAZAM!\" được biến thành Siêu anh hùng thay thế bản ngã trưởng thành của anh ấy, Shazam.', '4YqsFvQcp0M', 2, 'Shazam! Cơn Thịnh Nộ Của Các Vị Thần Shazam! Fury of the Gods\r\nxem phim Shazam! Cơn Thịnh Nộ Của Các Vị Thần viesub, xem Bí Shazam! Cơn Thịnh Nộ Của Các Vị Thần vietsub online tap 1, tap 2, tap 3, tap 4, tap 5 phim Shazam! Fury of the Gods ep 5, ep 6, ep 7, ep 8, ep 9, ep 10, Lịch chiếu phim Shazam! Cơn Thịnh Nộ Của Các Vị Thần, xem Shazam! Cơn Thịnh Nộ Của Các Vị Thần tập 11, tập 12, tập 13, tập 14, tập 15, phim Shazam! Cơn Thịnh Nộ Của Các Vị Thần tap 16, tap 17, tap 18, tap 19, tap 20, xem phim Shazam! Cơn Thịnh Nộ Của Các Vị Thần tập 21, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, Shazam! Cơn Thịnh Nộ Của Các Vị Thần tap cuoi, Shazam! Fury of the Gods vietsub tron bo, Shazam! Cơn Thịnh Nộ Của Các Vị Thần phim3s, Shazam! Cơn Thịnh Nộ Của Các Vị Thần motphim,vtv16, khoaitv, phimgi, hatdetv, xemphimso, hdo, topphimhd, khoaitv, vungtv, dongphim, fptplay, zingtv, xemphimgi Shazam! Cơn Thịnh Nộ Của Các Vị Thần youtube,vietsubtv, bomtan, Shazam! Cơn Thịnh Nộ Của Các Vị Thần phimmoi, hdonline, phimbathu, bilutv, banhtv, goldphim, bongngotv, bilutvs, phimmoizz, fullphim, 247phim, dongphym, xemphimvui, phimhay.co, galaxyplay, fptplay, hdviet, hdonline, hdo.tv, netflix, xemphimplus,phimmoiz, iphimmoi, phimchill, xemphimchill, ephimmoi, ezphimmoi, azphimmoi, phimmoichill, phimgii, xemphimgii, billuu, bichill, motchill, khophim18, zaphim, 2phimhay, iphimhay, iphim, VTVGiaitri, PhimHD7, Hplus, Kphim, Cliptv, yeuphimmoi, Vietsubtv, Bomtan, Biphim, Khophimplus, Shazam! Cơn Thịnh Nộ Của Các Vị Thần full, Shazam! Fury of the Gods online, Shazam! Cơn Thịnh Nộ Của Các Vị Thần Thuyết Minh, Shazam! Cơn Thịnh Nộ Của Các Vị Thần Vietsub, Shazam! Cơn Thịnh Nộ Của Các Vị Thần Lồng Tiếng', 1, 'shazam-con-thinh-no-cua-cac-vi-than5572.jpg', 'phimle', 2, 8, 4, 1, 0, 1, 'Shazam! Fury of the Gods (2023)', '2023', 1, 0, '2023-04-16 17:59:18', '2023-04-26 08:35:39'),
(5, 'BẢY VIÊN NGỌC RỒNG', 'bay-vien-ngoc-rong', '25 phút / tập', 'Bảy Viên Ngọc Rồng , Dragon Ball Tập 534 / 534 HD Vietsub\r\nMột cậu bé có đuôi khỉ tên là Goku được tìm thấy bởi một ông lão sống một mình trong rừng, ông lão xem đứa bé như là cháu của mình. Một ngày nọ Goku tình cờ gặp một cô gái tên là Bulma trên đường đi bắt cá về, Goku và Bulma đã cùng nhau truy tìm bảy viên ngọc rồng. Bảy viên ngọc rồng chứa đựng một bí mật có thể triệu hồi một con rồng và ban điều ước cho ai sở hữu chúng.Trên cuộc hành trình dài đi tìm bảy viên ngọc rồng, họ gặp những người bạn và những đấu sĩ huyền thoại cũng như nhiều ác quỷ. Họ trải qua những khó khăn và học hỏi các chiêu thức võ thuật đặc biệt để tham gia thi đấu trong đại hội võ thuật thế giới được tổ chức hằng năm. Ngoài các sự kiện đại hội võ thuật, Goku và các bạn còn phải đối phó với các thế lực độc ác như Đại vương Pilaf, Quân đoàn khăn đỏ của Độc nhãn tướng quân, Đại ma vương Piccolo và những đứa con của hắn.Phần này kéo dài cho đến lúc Goku đánh bại Đại ma vương Piccolo. Phần còn lại là Dragon Ball KAI (hoặc Gragon Ball Z) và Dragon Ball GT.', NULL, 1, 'Dragon ball, xem phim Bảy Viên Ngọc Rồng viesub, xem Bí Bảy Viên Ngọc Rồng vietsub online tap 1, tap 2, tap 3, tap 4, tap 5 phim Dragon Ball ep 5, ep 6, ep 7, ep 8, ep 9, ep 10, Lịch chiếu phim Bảy Viên Ngọc Rồng, xem Bảy Viên Ngọc Rồng tập 11, tập 12, tập 13, tập 14, tập 15, phim Bảy Viên Ngọc Rồng tap 16, tap 17, tap 18, tap 19, tap 20, xem phim Bảy Viên Ngọc Rồng tập 21, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, Bảy Viên Ngọc Rồng tap cuoi, Dragon Ball vietsub tron bo, Bảy Viên Ngọc Rồng phim3s, Bảy Viên Ngọc Rồng motphim,vtv16, khoaitv, phimgi, hatdetv, xemphimso, hdo, topphimhd, khoaitv, vungtv, dongphim, fptplay, zingtv, xemphimgi Bảy Viên Ngọc Rồng youtube,vietsubtv, bomtan, Bảy Viên Ngọc Rồng phimmoi, hdonline, phimbathu, bilutv, banhtv, goldphim, bongngotv, bilutvs, phimmoizz, fullphim, 247phim, dongphym, xemphimvui, phimhay.co, galaxyplay, fptplay, hdviet, hdonline, hdo.tv, netflix, xemphimplus,phimmoiz, iphimmoi, phimchill, xemphimchill, ephimmoi, ezphimmoi, azphimmoi, phimmoichill, phimgii, xemphimgii, billuu, bichill, motchill, khophim18, zaphim, 2phimhay, iphimhay, iphim, VTVGiaitri, PhimHD7, Hplus, Kphim, Cliptv, yeuphimmoi, Vietsubtv, Bomtan, Biphim, Khophimplus, Bảy Viên Ngọc Rồng full, Dragon Ball online, Bảy Viên Ngọc Rồng Thuyết Minh, Bảy Viên Ngọc Rồng Vietsub, Bảy Viên Ngọc Rồng Lồng Tiếng', 1, '604b30b7e4ca6_super-dragon-ball-heroes-season-2-big-bang-mission-poster8255.jpg', 'phimbo', 3, 3, 3, 1, 0, 1, 'Dragon Ball', '2021', 2, 7, '2023-04-16 18:54:13', '2023-04-21 09:50:07'),
(6, 'NGƯỜI KIẾN VÀ CHIẾN BINH ONG: THẾ GIỚI LƯỢNG TỬ', 'nguoi-kien-va-chien-binh-ong-the-gioi-luong-tu', '122 phút', 'Người Kiến Và Chiến Binh Ong: Thế Giới Lượng Tử 2023, Ant-Man and the Wasp: Quantumania HD Vietsub + Thuyết minh\r\nScott Lang và Hope Van Dyne cùng với Hank Pym và Janet Van Dyne khám phá Vương quốc lượng tử, nơi họ tiếp xúc với những sinh vật kỳ lạ và dấn thân vào một cuộc phiêu lưu vượt qua giới hạn của những gì họ nghĩ là có thể.', 's3UD3qvJdao', 1, 'Ant-Man and the Wasp: Quantumania Người Kiến Và Chiến Binh Ong: Thế Giới Lượng Tử\r\nxem phim Người Kiến Và Chiến Binh Ong: Thế Giới Lượng Tử viesub, xem Bí Người Kiến Và Chiến Binh Ong: Thế Giới Lượng Tử vietsub online tap 1, tap 2, tap 3, tap 4, tap 5 phim Ant-Man and the Wasp: Quantumania ep 5, ep 6, ep 7, ep 8, ep 9, ep 10, Lịch chiếu phim Người Kiến Và Chiến Binh Ong: Thế Giới Lượng Tử, xem Người Kiến Và Chiến Binh Ong: Thế Giới Lượng Tử tập 11, tập 12, tập 13, tập 14, tập 15, phim Người Kiến Và Chiến Binh Ong: Thế Giới Lượng Tử tap 16, tap 17, tap 18, tap 19, tap 20, xem phim Người Kiến Và Chiến Binh Ong: Thế Giới Lượng Tử tập 21, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, Người Kiến Và Chiến Binh Ong: Thế Giới Lượng Tử tap cuoi, Ant-Man and the Wasp: Quantumania vietsub tron bo, Người Kiến Và Chiến Binh Ong: Thế Giới Lượng Tử phim3s, Người Kiến Và Chiến Binh Ong: Thế Giới Lượng Tử motphim,vtv16, khoaitv, phimgi, hatdetv, xemphimso, hdo, topphimhd, khoaitv, vungtv, dongphim, fptplay, zingtv, xemphimgi Người Kiến Và Chiến Binh Ong: Thế Giới Lượng Tử youtube,vietsubtv, bomtan, Người Kiến Và Chiến Binh Ong: Thế Giới Lượng Tử phimmoi, hdonline, phimbathu, bilutv, banhtv, goldphim, bongngotv, bilutvs, phimmoizz, fullphim, 247phim, dongphym, xemphimvui, phimhay.co, galaxyplay, fptplay, hdviet, hdonline, hdo.tv, netflix, xemphimplus,phimmoiz, iphimmoi, phimchill, xemphimchill, ephimmoi, ezphimmoi, azphimmoi, phimmoichill, phimgii, xemphimgii, billuu, bichill, motchill, khophim18, zaphim, 2phimhay, iphimhay, iphim, VTVGiaitri, PhimHD7, Hplus, Kphim, Cliptv, yeuphimmoi, Vietsubtv, Bomtan, Biphim, Khophimplus, Người Kiến Và Chiến Binh Ong: Thế Giới Lượng Tử full, Ant-Man and the Wasp: Quantumania online, Người Kiến Và Chiến Binh Ong: Thế Giới Lượng Tử Thuyết Minh, Người Kiến Và Chiến Binh Ong: Thế Giới Lượng Tử Vietsub, Người Kiến Và Chiến Binh Ong: Thế Giới Lượng Tử Lồng Tiếng', 1, 'nguoi-kien-va-chien-binh-ong-the-gioi-luong-tu1085.jpg', 'phimle', 2, 1, 4, 0, 0, 0, 'Ant-Man and the Wasp: Quantumania (2023)', '2023', 1, 2, '2023-04-16 19:03:07', '2023-04-21 09:51:51'),
(7, 'VÔ GIAN', 'vo-gian', '45 phút / tập', 'Vô Gian 2023, Infernal Affairs  FHD Vietsub\r\nPhim kể lại câu chuyện vào năm 1944, trong cuộc kháng chiến giữa Quốc dân đảng và Đảng Cộng sản, đội trưởng Quốc dân đảng Mu Liang Feng, vốn là một thợ săn, được lệnh lãnh đạo một đội đặc biệt để phá hủy viện nghiên cứu vũ khí bí mật của quân đội Nhật Bản đã phát triển lựu đạn xyanate. .\r\nVới sự giúp đỡ của Zhang Jue và Liu Xiao Xian, các thành viên của đảng ngầm của Đảng Cộng sản Trung Quốc, anh đã trải qua rất nhiều khó khăn và nguy hiểm để hoàn thành nhiệm vụ. Nhưng trong thời kỳ này, cha của anh, Mu Da Ming, một người Cộng sản kiên trung, đã bị giết, và vợ anh, Liu Yan, cũng bị bức hại và mất trí nhớ. Mu Liang Feng bị kích thích sâu sắc và tùy tiện tin rằng Đảng Cộng sản đã gây ra tất cả những điều này, và bắt đầu căm ghét Đảng Cộng sản...', NULL, 40, 'infernal affairs Vô Gian\r\nxem phim Vô Gian viesub, xem Bí Vô Gian vietsub online tap 1, tap 2, tap 3, tap 4, tap 5 phim Infernal Affairs ep 5, ep 6, ep 7, ep 8, ep 9, ep 10, Lịch chiếu phim Vô Gian, xem Vô Gian tập 11, tập 12, tập 13, tập 14, tập 15, phim Vô Gian tap 16, tap 17, tap 18, tap 19, tap 20, xem phim Vô Gian tập 21, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, Vô Gian tap cuoi, Infernal Affairs vietsub tron bo, Vô Gian phim3s, Vô Gian motphim,vtv16, khoaitv, phimgi, hatdetv, xemphimso, hdo, topphimhd, khoaitv, vungtv, dongphim, fptplay, zingtv, xemphimgi Vô Gian youtube,vietsubtv, bomtan, Vô Gian phimmoi, hdonline, phimbathu, bilutv, banhtv, goldphim, bongngotv, bilutvs, phimmoizz, fullphim, 247phim, dongphym, xemphimvui, phimhay.co, galaxyplay, fptplay, hdviet, hdonline, hdo.tv, netflix, xemphimplus,phimmoiz, iphimmoi, phimchill, xemphimchill, ephimmoi, ezphimmoi, azphimmoi, phimmoichill, phimgii, xemphimgii, billuu, bichill, motchill, khophim18, zaphim, 2phimhay, iphimhay, iphim, VTVGiaitri, PhimHD7, Hplus, Kphim, Cliptv, yeuphimmoi, Vietsubtv, Bomtan, Biphim, Khophimplus, Vô Gian full, Infernal Affairs online, Vô Gian Thuyết Minh, Vô Gian Vietsub, Vô Gian Lồng Tiếng', 1, 'vo-gian1455.jpg', 'phimbo', 4, 4, 6, 0, 0, 0, 'Infernal Affairs (2023)', '2023', 0, 5, '2023-04-16 19:14:14', '2023-05-03 23:29:04'),
(8, 'NGÀI ALEX FERGUSON: KHÔNG BAO GIỜ BỎ CUỘC', 'ngai-alex-ferguson-khong-bao-gio-bo-cuoc', '108 phút', 'Ngài Alex Ferguson: Không Bao Giờ Bỏ Cuộc 2021, Sir Alex Ferguson: Never Give In HD Vietsub\r\nNhìn lại cuộc đời và huyền thoại của huấn luyện viên Manchester United, Alex Ferguson.', NULL, 1, 'ngài alex ferguson không bao giờ bỏ cuộc sir alex ferguson never give in\r\nxem phim Ngài Alex Ferguson: Không Bao Giờ Bỏ Cuộc viesub, xem Bí Ngài Alex Ferguson: Không Bao Giờ Bỏ Cuộc vietsub online tap 1, tap 2, tap 3, tap 4, tap 5 phim Sir Alex Ferguson: Never Give In ep 5, ep 6, ep 7, ep 8, ep 9, ep 10, Lịch chiếu phim Ngài Alex Ferguson: Không Bao Giờ Bỏ Cuộc, xem Ngài Alex Ferguson: Không Bao Giờ Bỏ Cuộc tập 11, tập 12, tập 13, tập 14, tập 15, phim Ngài Alex Ferguson: Không Bao Giờ Bỏ Cuộc tap 16, tap 17, tap 18, tap 19, tap 20, xem phim Ngài Alex Ferguson: Không Bao Giờ Bỏ Cuộc tập 21, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, Ngài Alex Ferguson: Không Bao Giờ Bỏ Cuộc tap cuoi, Sir Alex Ferguson: Never Give In vietsub tron bo, Ngài Alex Ferguson: Không Bao Giờ Bỏ Cuộc phim3s, Ngài Alex Ferguson: Không Bao Giờ Bỏ Cuộc motphim,vtv16, khoaitv, phimgi, hatdetv, xemphimso, hdo, topphimhd, khoaitv, vungtv, dongphim, fptplay, zingtv, xemphimgi Ngài Alex Ferguson: Không Bao Giờ Bỏ Cuộc youtube,vietsubtv, bomtan, Ngài Alex Ferguson: Không Bao Giờ Bỏ Cuộc phimmoi, hdonline, phimbathu, bilutv, banhtv, goldphim, bongngotv, bilutvs, phimmoizz, fullphim, 247phim, dongphym, xemphimvui, phimhay.co, galaxyplay, fptplay, hdviet, hdonline, hdo.tv, netflix, xemphimplus,phimmoiz, iphimmoi, phimchill, xemphimchill, ephimmoi, ezphimmoi, azphimmoi, phimmoichill, phimgii, xemphimgii, billuu, bichill, motchill, khophim18, zaphim, 2phimhay, iphimhay, iphim, VTVGiaitri, PhimHD7, Hplus, Kphim, Cliptv, yeuphimmoi, Vietsubtv, Bomtan, Biphim, Khophimplus, Ngài Alex Ferguson: Không Bao Giờ Bỏ Cuộc full, Sir Alex Ferguson: Never Give In online, Ngài Alex Ferguson: Không Bao Giờ Bỏ Cuộc Thuyết Minh, Ngài Alex Ferguson: Không Bao Giờ Bỏ Cuộc Vietsub, Ngài Alex Ferguson: Không Bao Giờ Bỏ Cuộc Lồng Tiếng', 1, 'ngai-alex-ferguson-khong-bao-gio-bo-cuoc1926.jpg', 'phimle', 7, 1, 7, 0, 0, 0, 'Sir Alex Ferguson: Never Give In (2021)', '2021', 2, 0, '2023-04-16 19:20:53', '2023-04-21 09:54:16'),
(9, 'ĐẢO ĐỘC ĐẮC – TỬ MẪU THIÊN LINH CÁI', 'đao-đoc-đac-–-tu-mau-thien-linh-cai', '1giờ 32phút', 'Đảo Độc Đắc – Tử Mẫu Thiên Linh Cái 2022, Kumanthong 2: Jackpot Island HD\r\nMột chuyến đi nhân dịp sinh nhật đưa 6 người bạn đến một hòn đảo kỳ quái. Tại đây, họ sớm nhận ra mình rơi vào vòng xoáy của các sự kiện hiểm ác và cuộc đụng độ chết chóc.', NULL, 1, 'Đảo Độc Đắc – Tử Mẫu Thiên Linh Cái Kumanthong 2: Jackpot Island\r\nxem phim Đảo Độc Đắc – Tử Mẫu Thiên Linh Cái viesub, xem Bí Đảo Độc Đắc – Tử Mẫu Thiên Linh Cái vietsub online tap 1, tap 2, tap 3, tap 4, tap 5 phim Kumanthong 2: Jackpot Island ep 5, ep 6, ep 7, ep 8, ep 9, ep 10, Lịch chiếu phim Đảo Độc Đắc – Tử Mẫu Thiên Linh Cái, xem Đảo Độc Đắc – Tử Mẫu Thiên Linh Cái tập 11, tập 12, tập 13, tập 14, tập 15, phim Đảo Độc Đắc – Tử Mẫu Thiên Linh Cái tap 16, tap 17, tap 18, tap 19, tap 20, xem phim Đảo Độc Đắc – Tử Mẫu Thiên Linh Cái tập 21, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, Đảo Độc Đắc – Tử Mẫu Thiên Linh Cái tap cuoi, Kumanthong 2: Jackpot Island vietsub tron bo, Đảo Độc Đắc – Tử Mẫu Thiên Linh Cái phim3s, Đảo Độc Đắc – Tử Mẫu Thiên Linh Cái motphim,vtv16, khoaitv, phimgi, hatdetv, xemphimso, hdo, topphimhd, khoaitv, vungtv, dongphim, fptplay, zingtv, xemphimgi Đảo Độc Đắc – Tử Mẫu Thiên Linh Cái youtube,vietsubtv, bomtan, Đảo Độc Đắc – Tử Mẫu Thiên Linh Cái phimmoi, hdonline, phimbathu, bilutv, banhtv, goldphim, bongngotv, bilutvs, phimmoizz, fullphim, 247phim, dongphym, xemphimvui, phimhay.co, galaxyplay, fptplay, hdviet, hdonline, hdo.tv, netflix, xemphimplus,phimmoiz, iphimmoi, phimchill, xemphimchill, ephimmoi, ezphimmoi, azphimmoi, phimmoichill, phimgii, xemphimgii, billuu, bichill, motchill, khophim18, zaphim, 2phimhay, iphimhay, iphim, VTVGiaitri, PhimHD7, Hplus, Kphim, Cliptv, yeuphimmoi, Vietsubtv, Bomtan, Biphim, Khophimplus, Đảo Độc Đắc – Tử Mẫu Thiên Linh Cái full, Kumanthong 2: Jackpot Island online, Đảo Độc Đắc – Tử Mẫu Thiên Linh Cái Thuyết Minh, Đảo Độc Đắc – Tử Mẫu Thiên Linh Cái Vietsub, Đảo Độc Đắc – Tử Mẫu Thiên Linh Cái Lồng Tiếng', 1, 'dao-doc-dac-tu-mau-thien-linh-cai7813.jpg', 'phimle', 1, 1, 1, 0, 0, 0, 'Kumanthong 2: Jackpot Island (2022)', '2022', 1, 2, '2023-04-16 19:24:15', '2023-04-21 09:54:57'),
(10, 'RAMBO 5: VẾT MÁU CUỐI CÙNG', 'rambo-5-vet-mau-cuoi-cung', '89 phút', 'Rambo 5: Vết Máu Cuối Cùng 2019, Rambo 5: Last Blood HD Vietsub + Thuyết minh\r\nPhim Chiến Binh Rambo 5 Last Blood 2019 là chuyến hành trình tới vùng biên giới Mỹ - Mexico của nhân vật. John Rambo dấn thân vào nguy hiểm để giải cứu con gái của một người bạn thân bị bọn buôn lậu ma túy bắt cóc.', NULL, 1, 'Rambo 5: Last Blood Rambo 5: Vết Máu Cuối Cùng\r\nxem phim Rambo 5: Vết Máu Cuối Cùng viesub, xem Bí Rambo 5: Vết Máu Cuối Cùng vietsub online tap 1, tap 2, tap 3, tap 4, tap 5 phim Rambo 5: Last Blood ep 5, ep 6, ep 7, ep 8, ep 9, ep 10, Lịch chiếu phim Rambo 5: Vết Máu Cuối Cùng, xem Rambo 5: Vết Máu Cuối Cùng tập 11, tập 12, tập 13, tập 14, tập 15, phim Rambo 5: Vết Máu Cuối Cùng tap 16, tap 17, tap 18, tap 19, tap 20, xem phim Rambo 5: Vết Máu Cuối Cùng tập 21, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, Rambo 5: Vết Máu Cuối Cùng tap cuoi, Rambo 5: Last Blood vietsub tron bo, Rambo 5: Vết Máu Cuối Cùng phim3s, Rambo 5: Vết Máu Cuối Cùng motphim,vtv16, khoaitv, phimgi, hatdetv, xemphimso, hdo, topphimhd, khoaitv, vungtv, dongphim, fptplay, zingtv, xemphimgi Rambo 5: Vết Máu Cuối Cùng youtube,vietsubtv, bomtan, Rambo 5: Vết Máu Cuối Cùng phimmoi, hdonline, phimbathu, bilutv, banhtv, goldphim, bongngotv, bilutvs, phimmoizz, fullphim, 247phim, dongphym, xemphimvui, phimhay.co, galaxyplay, fptplay, hdviet, hdonline, hdo.tv, netflix, xemphimplus,phimmoiz, iphimmoi, phimchill, xemphimchill, ephimmoi, ezphimmoi, azphimmoi, phimmoichill, phimgii, xemphimgii, billuu, bichill, motchill, khophim18, zaphim, 2phimhay, iphimhay, iphim, VTVGiaitri, PhimHD7, Hplus, Kphim, Cliptv, yeuphimmoi, Vietsubtv, Bomtan, Biphim, Khophimplus, Rambo 5: Vết Máu Cuối Cùng full, Rambo 5: Last Blood online, Rambo 5: Vết Máu Cuối Cùng Thuyết Minh, Rambo 5: Vết Máu Cuối Cùng Vietsub, Rambo 5: Vết Máu Cuối Cùng Lồng Tiếng', 1, 'rambo-5-vet-mau-cuoi-cung2421.jpg', 'phimle', 2, 1, 4, 1, 0, 0, 'Rambo 5: Last Blood (2019)', '2019', 1, 0, '2023-04-17 00:47:27', '2023-04-21 09:56:10'),
(11, 'CÁI CHẾT CỦA BẢY VỊ VUA', 'cai-chet-cua-bay-vi-vua', '1giờ 51phút', 'Cái Chết Của Bảy Vị Vua 2023, The Last Kingdom: Seven Kings Must Die HD Vietsub\r\nSau khi vua Edward qua đời, Uhtred xứ Bebbanburg và các đồng đội phiêu lưu qua một vương quốc bị chia cắt với hi vọng cuối cùng sẽ thống nhất nước Anh.', NULL, 1, 'Cái chết của bảy vị vua The Last Kingdom: Seven Kings Must Die\r\nxem phim Cái Chết Của Bảy Vị Vua viesub, xem Bí Cái Chết Của Bảy Vị Vua vietsub online tap 1, tap 2, tap 3, tap 4, tap 5 phim The Last Kingdom: Seven Kings Must Die ep 5, ep 6, ep 7, ep 8, ep 9, ep 10, Lịch chiếu phim Cái Chết Của Bảy Vị Vua, xem Cái Chết Của Bảy Vị Vua tập 11, tập 12, tập 13, tập 14, tập 15, phim Cái Chết Của Bảy Vị Vua tap 16, tap 17, tap 18, tap 19, tap 20, xem phim Cái Chết Của Bảy Vị Vua tập 21, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, Cái Chết Của Bảy Vị Vua tap cuoi, The Last Kingdom: Seven Kings Must Die vietsub tron bo, Cái Chết Của Bảy Vị Vua phim3s, Cái Chết Của Bảy Vị Vua motphim,vtv16, khoaitv, phimgi, hatdetv, xemphimso, hdo, topphimhd, khoaitv, vungtv, dongphim, fptplay, zingtv, xemphimgi Cái Chết Của Bảy Vị Vua youtube,vietsubtv, bomtan, Cái Chết Của Bảy Vị Vua phimmoi, hdonline, phimbathu, bilutv, banhtv, goldphim, bongngotv, bilutvs, phimmoizz, fullphim, 247phim, dongphym, xemphimvui, phimhay.co, galaxyplay, fptplay, hdviet, hdonline, hdo.tv, netflix, xemphimplus,phimmoiz, iphimmoi, phimchill, xemphimchill, ephimmoi, ezphimmoi, azphimmoi, phimmoichill, phimgii, xemphimgii, billuu, bichill, motchill, khophim18, zaphim, 2phimhay, iphimhay, iphim, VTVGiaitri, PhimHD7, Hplus, Kphim, Cliptv, yeuphimmoi, Vietsubtv, Bomtan, Biphim, Khophimplus, Cái Chết Của Bảy Vị Vua full, The Last Kingdom: Seven Kings Must Die online, Cái Chết Của Bảy Vị Vua Thuyết Minh, Cái Chết Của Bảy Vị Vua Vietsub, Cái Chết Của Bảy Vị Vua Lồng Tiếng', 1, 'cai-chet-cua-bay-vi-vua6761.jpg', 'phimle', 7, 1, 4, 0, 0, 0, 'The Last Kingdom: Seven Kings Must Die (2023)', '2023', 2, 0, '2023-04-17 00:50:45', '2023-04-21 09:57:20'),
(12, 'THANH GƯƠM DIỆT QUỶ: PHẦN LÀNG RÈN KIẾM', 'thanh-guom-diet-quy-phan-lang-ren-kiem', '50 phút / tập', 'Thanh Gươm Diệt Quỷ: Phần Làng Rèn Kiếm 2023, 鬼滅の刃 刀鍛冶の里編 Tập 1 HD Vietsub\r\nĐể giải thích cho Hotaru Haganezuk, bậc thầy kiếm thuật đã rèn kiếm cho Tanjiro, tại sao thanh kiếm của anh lại bị thương nặng như vậy, Tanjiro đã phải đến một ngôi làng rèn kiếm, và lúc đó kẻ thù đã tiến đến gần Tanjiro khi cậu đang đợi người thợ rèn kiếm của mình sửa chữa. .. ... Mặt khác, Muichiro Tokito, đang tham gia vào một cuộc đấu tranh dữ dội với yêu quái, nhưng mọi thứ có vẻ không ổn và cuộc xung đột ngày càng leo thang. Những con quỷ cấp cao càng ngày càng lợi hại. Hơn nữa, mỗi con trong số hai con quỷ này có thể chia thành bốn cơ thể mới, mỗi cơ thể đều có khả năng tái sinh gần như ngay lập tức. Liệu Tanjiro và những người khác có thể đánh bại một kẻ thù như vậy không?', NULL, 1, 'Demon Slayer: Kimetsu no Yaiba Swordsmith Village Arc Thanh Gươm Diệt Quỷ: Làng Thợ Rèn\r\nxem phim Thanh Gươm Diệt Quỷ: Làng Thợ Rèn viesub, xem Bí Thanh Gươm Diệt Quỷ: Làng Thợ Rèn vietsub online tap 1, tap 2, tap 3, tap 4, tap 5 phim Demon Slayer: Kimetsu no Yaiba Swordsmith Village Arc ep 5, ep 6, ep 7, ep 8, ep 9, ep 10, Lịch chiếu phim Thanh Gươm Diệt Quỷ: Làng Thợ Rèn, xem Thanh Gươm Diệt Quỷ: Làng Thợ Rèn tập 11, tập 12, tập 13, tập 14, tập 15, phim Thanh Gươm Diệt Quỷ: Làng Thợ Rèn tap 16, tap 17, tap 18, tap 19, tap 20, xem phim Thanh Gươm Diệt Quỷ: Làng Thợ Rèn tập 21, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, Thanh Gươm Diệt Quỷ: Làng Thợ Rèn tap cuoi, Demon Slayer: Kimetsu no Yaiba Swordsmith Village Arc vietsub tron bo, Thanh Gươm Diệt Quỷ: Làng Thợ Rèn phim3s, Thanh Gươm Diệt Quỷ: Làng Thợ Rèn motphim,vtv16, khoaitv, phimgi, hatdetv, xemphimso, hdo, topphimhd, khoaitv, vungtv, dongphim, fptplay, zingtv, xemphimgi Thanh Gươm Diệt Quỷ: Làng Thợ Rèn youtube,vietsubtv, bomtan, Thanh Gươm Diệt Quỷ: Làng Thợ Rèn phimmoi, hdonline, phimbathu, bilutv, banhtv, goldphim, bongngotv, bilutvs, phimmoizz, fullphim, 247phim, dongphym, xemphimvui, phimhay.co, galaxyplay, fptplay, hdviet, hdonline, hdo.tv, netflix, xemphimplus,phimmoiz, iphimmoi, phimchill, xemphimchill, ephimmoi, ezphimmoi, azphimmoi, phimmoichill, phimgii, xemphimgii, billuu, bichill, motchill, khophim18, zaphim, 2phimhay, iphimhay, iphim, VTVGiaitri, PhimHD7, Hplus, Kphim, Cliptv, yeuphimmoi, Vietsubtv, Bomtan, Biphim, Khophimplus, Thanh Gươm Diệt Quỷ: Làng Thợ Rèn full, Demon Slayer: Kimetsu no Yaiba Swordsmith Village Arc online, Thanh Gươm Diệt Quỷ: Làng Thợ Rèn Thuyết Minh, Thanh Gươm Diệt Quỷ: Làng Thợ Rèn Vietsub, Thanh Gươm Diệt Quỷ: Làng Thợ Rèn Lồng Tiếng', 1, 'thanh-guom-diet-quy-phan-lang-ren-kiem1324.jpg', 'phimbo', 4, 1, 3, 1, 0, 0, 'Kimetsu No Yaiba (2023)', '2023', 0, 3, '2023-04-17 00:52:54', '2023-04-21 09:57:56'),
(13, 'THIÊN LONG BÁT BỘ: KIỀU PHONG TRUYỆN', 'thien-long-bat-bo-kieu-phong-truyen', '130 phút', 'Thiên Long Bát Bộ: Kiều Phong Truyện 2023, Sakra HD Vietsub + Thuyết minh\r\nThiên Long Bát Bộ: Kiều Phong Truyện – Sakra câu chuyện sẽ diễn ra ở Tụ Hiền Trang, nơi Kiều Phong (Tiêu Phong – Chân Tử Đan đóng) bị quần hùng tìm ra chân tướng là người Khiết Đan, nghi là gián điệp và muốn sát hại chàng. Kiều Phong cũng rơi vào bẫy của Mộ Dung Phục, bị nghi đã giết chết phó bang chủ Cái Bang Mã Đại Nguyên. Mộ Dung Phục cũng sắp đặt khiến người yêu của Kiều Phong là A Châu (Trần Ngọc Kỳ) bị giết. Trước khi đánh, Kiều Phong lấy rượu ra uống xem như tuyệt giao với các bằng hữu trước đây. Trận chiến diễn ra, một mình Kiều Phong chống quần hùng, Hàng Long Thập Bát Chưởng lại một lần nữa uy trấn thiên hạ, đánh bại tất cả.', NULL, 1, 'Kiều Phong Truyện Sakra Thiên Long Bát Bộ Thiên Long Bát Bộ Kiều Phong Truyện\r\nxem phim Thiên Long Bát Bộ: Kiều Phong Truyện viesub, xem Bí Thiên Long Bát Bộ: Kiều Phong Truyện vietsub online tap 1, tap 2, tap 3, tap 4, tap 5 phim Sakra ep 5, ep 6, ep 7, ep 8, ep 9, ep 10, Lịch chiếu phim Thiên Long Bát Bộ: Kiều Phong Truyện, xem Thiên Long Bát Bộ: Kiều Phong Truyện tập 11, tập 12, tập 13, tập 14, tập 15, phim Thiên Long Bát Bộ: Kiều Phong Truyện tap 16, tap 17, tap 18, tap 19, tap 20, xem phim Thiên Long Bát Bộ: Kiều Phong Truyện tập 21, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, Thiên Long Bát Bộ: Kiều Phong Truyện tap cuoi, Sakra vietsub tron bo, Thiên Long Bát Bộ: Kiều Phong Truyện phim3s, Thiên Long Bát Bộ: Kiều Phong Truyện motphim,vtv16, khoaitv, phimgi, hatdetv, xemphimso, hdo, topphimhd, khoaitv, vungtv, dongphim, fptplay, zingtv, xemphimgi Thiên Long Bát Bộ: Kiều Phong Truyện youtube,vietsubtv, bomtan, Thiên Long Bát Bộ: Kiều Phong Truyện phimmoi, hdonline, phimbathu, bilutv, banhtv, goldphim, bongngotv, bilutvs, phimmoizz, fullphim, 247phim, dongphym, xemphimvui, phimhay.co, galaxyplay, fptplay, hdviet, hdonline, hdo.tv, netflix, xemphimplus,phimmoiz, iphimmoi, phimchill, xemphimchill, ephimmoi, ezphimmoi, azphimmoi, phimmoichill, phimgii, xemphimgii, billuu, bichill, motchill, khophim18, zaphim, 2phimhay, iphimhay, iphim, VTVGiaitri, PhimHD7, Hplus, Kphim, Cliptv, yeuphimmoi, Vietsubtv, Bomtan, Biphim, Khophimplus, Thiên Long Bát Bộ: Kiều Phong Truyện full, Sakra online, Thiên Long Bát Bộ: Kiều Phong Truyện Thuyết Minh, Thiên Long Bát Bộ: Kiều Phong Truyện Vietsub, Thiên Long Bát Bộ: Kiều Phong Truyện Lồng Tiếng', 1, 'thien-long-bat-bo-kieu-phong-truyen7814.jpg', 'phimle', 1, 9, 6, 0, 0, 0, 'Sakra (2023)', '2023', 1, 1, '2023-04-17 00:55:32', '2023-04-21 09:58:57'),
(14, 'HEADLESS HORSEMAN', 'headless-horseman', '1giờ 52phút', 'Headless Horseman 2022, Headless Horseman HD Vietsub + Thuyết minh\r\nKhi chỉ còn vài giây nữa là chết, một người đàn ông gần như bị chặt đầu và tuyệt vọng đã thỏa thuận với ác quỷ để bảo vệ tình yêu của đời mình và tìm cách trả thù tên buôn ma túy suýt sát hại anh ta', NULL, 1, 'Headless Horseman\r\nxem phim Headless Horseman viesub, xem Bí Headless Horseman vietsub online tap 1, tap 2, tap 3, tap 4, tap 5 phim Headless Horseman ep 5, ep 6, ep 7, ep 8, ep 9, ep 10, Lịch chiếu phim Headless Horseman, xem Headless Horseman tập 11, tập 12, tập 13, tập 14, tập 15, phim Headless Horseman tap 16, tap 17, tap 18, tap 19, tap 20, xem phim Headless Horseman tập 21, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, Headless Horseman tap cuoi, Headless Horseman vietsub tron bo, Headless Horseman phim3s, Headless Horseman motphim,vtv16, khoaitv, phimgi, hatdetv, xemphimso, hdo, topphimhd, khoaitv, vungtv, dongphim, fptplay, zingtv, xemphimgi Headless Horseman youtube,vietsubtv, bomtan, Headless Horseman phimmoi, hdonline, phimbathu, bilutv, banhtv, goldphim, bongngotv, bilutvs, phimmoizz, fullphim, 247phim, dongphym, xemphimvui, phimhay.co, galaxyplay, fptplay, hdviet, hdonline, hdo.tv, netflix, xemphimplus,phimmoiz, iphimmoi, phimchill, xemphimchill, ephimmoi, ezphimmoi, azphimmoi, phimmoichill, phimgii, xemphimgii, billuu, bichill, motchill, khophim18, zaphim, 2phimhay, iphimhay, iphim, VTVGiaitri, PhimHD7, Hplus, Kphim, Cliptv, yeuphimmoi, Vietsubtv, Bomtan, Biphim, Khophimplus, Headless Horseman full, Headless Horseman online, Headless Horseman Thuyết Minh, Headless Horseman Vietsub, Headless Horseman Lồng Tiếng', 1, 'headless-horseman9122.jpg', 'phimle', 7, 1, 4, 0, 0, 1, 'Headless Horseman (2022)', '2022', 2, 0, '2023-04-17 00:58:12', '2023-04-21 09:59:36'),
(15, 'Thử Thách Thần Tượng (2023)', 'thu-thach-than-tuong-2023', '90 phút / tập', 'Running Man 2023, Thử Thách Thần Tượng Tập 628 HD Vietsub\r\nRUNNING MAN là một show truyền hình hài hước thực tế của Hàn Quốc, ra mắt từ năm 2010 nhưng cho đến nay vẫn là một trong những chương trình giải trí được yêu thích nhất tại xứ sở kim chi. Với RUNNING MAN, đảm bảo các bạn sẽ phải \"cười lăn cười bò\" vì sự hài hước của các thành viên cũng như những nhiệm vụ oái ăm mà họ phải chịu đựng trong suốt chương trình. Ngoài 8 thành viên chính của RUNNING MAN gồm: Yoo Jae Suk, Ji Suk Jin, Kim Jong Kook, Lee Kwang Soo, Haha, Song Ji Hyo, Yang Se Chan và Jeon So Min, khán giả sẽ có dịp gặp gỡ những ngôi sao giải trí hàng đầu khác của Hàn Quốc, thậm chí là những ngôi sao Quốc tế tham gia RUNNING MAN trong vai trò khách mời đặc biệt.', NULL, 1, 'xem phim Thử Thách Thần Tượng viesub, xem Bí Thử Thách Thần Tượng vietsub online tap 1, tap 2, tap 3, tap 4, tap 5 phim RUNNING MAN ep 5, ep 6, ep 7, ep 8, ep 9, ep 10, Lịch chiếu phim Thử Thách Thần Tượng, xem Thử Thách Thần Tượng tập 11, tập 12, tập 13, tập 14, tập 15, phim Thử Thách Thần Tượng tap 16, tap 17, tap 18, tap 19, tap 20, xem phim Thử Thách Thần Tượng tập 21, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, Thử Thách Thần Tượng tap cuoi, RUNNING MAN vietsub tron bo, Thử Thách Thần Tượng phim3s, Thử Thách Thần Tượng motphim,vtv16, khoaitv, phimgi, hatdetv, xemphimso, hdo, topphimhd, khoaitv, vungtv, dongphim, fptplay, zingtv, xemphimgi Thử Thách Thần Tượng youtube,vietsubtv, bomtan, Thử Thách Thần Tượng phimmoi, hdonline, phimbathu, bilutv, banhtv, goldphim, bongngotv, bilutvs, phimmoizz, fullphim, 247phim, dongphym, xemphimvui, phimhay.co, galaxyplay, fptplay, hdviet, hdonline, hdo.tv, netflix, xemphimplus,phimmoiz, iphimmoi, phimchill, xemphimchill, ephimmoi, ezphimmoi, azphimmoi, phimmoichill, phimgii, xemphimgii, billuu, bichill, motchill, khophim18, zaphim, 2phimhay, iphimhay, iphim, VTVGiaitri, PhimHD7, Hplus, Kphim, Cliptv, yeuphimmoi, Vietsubtv, Bomtan, Biphim, Khophimplus, Thử Thách Thần Tượng full, RUNNING MAN online, Thử Thách Thần Tượng Thuyết Minh, Thử Thách Thần Tượng Vietsub, Thử Thách Thần Tượng Lồng Tiếng', 1, 'running-man6272.jpg', 'phimbo', 4, 1, 5, 1, 0, 0, 'RUNNING MAN', '2023', 0, 9, '2023-04-17 01:33:00', '2023-04-21 09:46:34'),
(16, 'NHÓC TRÙM: TRỞ LẠI TRONG NÔI (PHẦN 2)', 'nhoc-trum-tro-lai-trong-noi-phan-2', '24 phút / tập', 'Nhóc Trùm: Trở Lại Trong Nôi (Phần 2) 2022, The Boss Baby: Back in the Crib (Season 2) Full (16/16) HD Vietsub\r\nSau khi rời Tập Đoàn Nhóc Tì, Nhóc Trùm và Tina thành lập công ty khởi nghiệp non trẻ để chiếm lĩnh một thị trường chưa được khai thác: những em bé \"khó chiều\" và khó thương nhất.', NULL, 16, 'Nhóc trùm: Trở lại trong nôi (Phần 2) The Boss Baby: Back in the Crib (Season 2)\r\nxem phim Nhóc Trùm: Trở Lại Trong Nôi (Phần 2) viesub,', 1, 'nhoc-trum-tro-lai-trong-noi-phan-29252.jpg', 'phimbo', 4, 1, 4, 1, 4, 0, 'The Boss Baby: Back in the Crib (Season 2) (2022)', '2022', 0, 2, '2023-04-18 02:00:38', '2023-05-03 06:39:23'),
(17, 'THỢ SĂN CỔ VẬT', 'tho-san-co-vat', '64 phút', 'Thợ Săn Cổ Vật 2022, Uncharted HDCAM Vietsub + TM\r\nThợ Săn Cổ Vật - Uncharted là bộ phim cùng tên với một tựa game, xoay quanh câu chuyện về anh chàng thiếu niên Nathan Drake khoảng 20 tuổi đã dấn thân vào một cuộc phiêu lưu tìm kiếm kho báu của Ferdinand Magellan. Trên cuộc hành trình tìm kiếm kho báu của mình, Drake đã gặp gỡi được Sully và Chloe cả ba cùng nhau bắt đầu cuộc hành trình sinh tử của mình. Cả ba đều phải trải qua những cạm bẫy đầy nguy hiểm và gây cấn. Liệu Drake cùng với hai người bạn đồng hành mới quen của mình có thể thành công tìm kiếm được báu vật?', NULL, 1, 'AnimeHay Bilutv BiPhim BongNgoTV FullPhim KhoaiTV MotPhim Phim14 phim3s PhimBatHu PhimMedia phimmoi phimmoizz PhimNhanh Thợ Săn Cổ Vật TrangPhim TVHay Uncharted VuiGhe VuViphim XemPhimSo YeuPhimMoi\r\nxem phim Thợ Săn Cổ Vật viesub, xem Bí Thợ Săn Cổ Vật vietsub online tap 1, tap 2, tap 3, tap 4, tap 5 phim Uncharted ep 5, ep 6, ep 7, ep 8, ep 9, ep 10, Lịch chiếu phim Thợ Săn Cổ Vật, xem Thợ Săn Cổ Vật tập 11, tập 12, tập 13, tập 14, tập 15, phim Thợ Săn Cổ Vật tap 16, tap 17, tap 18, tap 19, tap 20, xem phim Thợ Săn Cổ Vật tập 21, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, Thợ Săn Cổ Vật tap cuoi, Uncharted vietsub tron bo, Thợ Săn Cổ Vật phim3s, Thợ Săn Cổ Vật motphim,vtv16, khoaitv, phimgi, hatdetv, xemphimso, hdo, topphimhd, khoaitv, vungtv, dongphim, fptplay, zingtv, xemphimgi Thợ Săn Cổ Vật youtube,vietsubtv, bomtan, Thợ Săn Cổ Vật phimmoi, hdonline, phimbathu, bilutv, banhtv, goldphim, bongngotv, bilutvs, phimmoizz, fullphim, 247phim, dongphym, xemphimvui, phimhay.co, galaxyplay, fptplay, hdviet, hdonline, hdo.tv, netflix, xemphimplus,phimmoiz, iphimmoi, phimchill, xemphimchill, ephimmoi, ezphimmoi, azphimmoi, phimmoichill, phimgii, xemphimgii, billuu, bichill, motchill, khophim18, zaphim, 2phimhay, iphimhay, iphim, VTVGiaitri, PhimHD7, Hplus, Kphim, Cliptv, yeuphimmoi, Vietsubtv, Bomtan, Biphim, Khophimplus, Thợ Săn Cổ Vật full, Uncharted online, Thợ Săn Cổ Vật Thuyết Minh, Thợ Săn Cổ Vật Vietsub, Thợ Săn Cổ Vật Lồng Tiếng', 1, 'tho-san-co-vat6466.jpg', 'phimle', 7, 1, 4, 0, 2, 0, 'Uncharted (2022)', '2022', 2, 2, '2023-04-18 02:13:00', '2023-04-21 09:45:07'),
(18, 'Cô ấy đến từ khu rừng', 'co-ay-đen-tu-khu-rung', '1giờ 41phút', 'She Came From The Woods 2023, She Came From The Woods CAM Vietsub + Thuyết minh\r\nIn 1987, a group of counselors accidentally unleash a decades\' old evil on the last night of summer camp.', NULL, 1, '1980s 80s throwback campfire nostalgia She Came From The Woods Summer summer camp supernatural witch\r\nxem phim She Came From The Woods viesub, xem Bí She Came From The Woods vietsub online tap 1, tap 2, tap 3, tap 4, tap 5 phim She Came From The Woods ep 5, ep 6, ep 7, ep 8, ep 9, ep 10, Lịch chiếu phim She Came From The Woods, xem She Came From The Woods tập 11, tập 12, tập 13, tập 14, tập 15, phim She Came From The Woods tap 16, tap 17, tap 18, tap 19, tap 20, xem phim She Came From The Woods tập 21, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, She Came From The Woods tap cuoi, She Came From The Woods vietsub tron bo, She Came From The Woods phim3s, She Came From The Woods motphim,vtv16, khoaitv, phimgi, hatdetv, xemphimso, hdo, topphimhd, khoaitv, vungtv, dongphim, fptplay, zingtv, xemphimgi She Came From The Woods youtube,vietsubtv, bomtan, She Came From The Woods phimmoi, hdonline, phimbathu, bilutv, banhtv, goldphim, bongngotv, bilutvs, phimmoizz, fullphim, 247phim, dongphym, xemphimvui, phimhay.co, galaxyplay, fptplay, hdviet, hdonline, hdo.tv, netflix, xemphimplus,phimmoiz, iphimmoi, phimchill, xemphimchill, ephimmoi, ezphimmoi, azphimmoi, phimmoichill, phimgii, xemphimgii, billuu, bichill, motchill, khophim18, zaphim, 2phimhay, iphimhay, iphim, VTVGiaitri, PhimHD7, Hplus, Kphim, Cliptv, yeuphimmoi, Vietsubtv, Bomtan, Biphim, Khophimplus, She Came From The Woods full, She Came From The Woods online, She Came From The Woods Thuyết Minh, She Came From The Woods Vietsub, She Came From The Woods Lồng Tiếng', 1, 'she-came-from-the-woods6666.jpg', 'phimle', 7, 1, 4, 0, 3, 0, 'SHE CAME FROM THE WOODS', '2023', 2, 0, '2023-04-18 02:17:44', '2023-04-21 09:44:29'),
(19, 'CỬU ÂM CHÂN KINH', 'cuu-am-chan-kinh', '45 phút / tập', 'Cửu Âm Chân Kinh 1993, The Mystery of the Condor Hero Full (20/20) SD Lồng Tiếng\r\nTương truyền bí kíp võ công đệ nhất thiên hạ Cửu Âm Chân Kinh có liên quan đến bức tranh của Cái Bang & Thánh Nữ của Sát Mãn Giáo, ai ai cũng muốn chiếm đoạt… Đông Tà Hoàng Dược Sư trên đường nảy sinh tình cảm với thánh nữ nhưng vì phụ hoàng, Thánh Nữ gạt bỏ tình riêng quay về Sát Mãn Giáo. Đứng trước cơ hội giành lấy Cửu Âm Chân Kinh. 4 đại cao thủ Đông Tà – Tây Độc – Nam Đế – Bắc Cái ngang tài ngang sức nhau. Trước tình thế này Vương Trùng Dương Trương chân nhân đã mở ra ‘Hoa Sơn Luận Kiếm’. Ai là người chiến thắng sẽ đoạt được Cửu Âm Chân Kinh. Cuối cùng Cửu Âm Chân Kinh do Trương Chân Nhân cất giữ, trước khi chết ông giao lại cho sư đệ Châu Bá Thông với di ngôn không để ai đọc được Cửu Âm Chân Kinh.', NULL, 20, 'Cửu Âm Chân Kinh The Mystery of the Condor Hero\r\nxem phim Cửu Âm Chân Kinh viesub, xem Bí Cửu Âm Chân Kinh vietsub online tap 1, tap 2, tap 3, tap 4, tap 5 phim The Mystery of the Condor Hero ep 5, ep 6, ep 7, ep 8, ep 9, ep 10, Lịch chiếu phim Cửu Âm Chân Kinh, xem Cửu Âm Chân Kinh tập 11, tập 12, tập 13, tập 14, tập 15, phim Cửu Âm Chân Kinh tap 16, tap 17, tap 18, tap 19, tap 20, xem phim Cửu Âm Chân Kinh tập 21, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, Cửu Âm Chân Kinh tap cuoi, The Mystery of the Condor Hero vietsub tron bo, Cửu Âm Chân Kinh phim3s, Cửu Âm Chân Kinh motphim,vtv16, khoaitv, phimgi, hatdetv, xemphimso, hdo, topphimhd, khoaitv, vungtv, dongphim, fptplay, zingtv, xemphimgi Cửu Âm Chân Kinh youtube,vietsubtv, bomtan, Cửu Âm Chân Kinh phimmoi, hdonline, phimbathu, bilutv, banhtv, goldphim, bongngotv, bilutvs, phimmoizz, fullphim, 247phim, dongphym, xemphimvui, phimhay.co, galaxyplay, fptplay, hdviet, hdonline, hdo.tv, netflix, xemphimplus,phimmoiz, iphimmoi, phimchill, xemphimchill, ephimmoi, ezphimmoi, azphimmoi, phimmoichill, phimgii, xemphimgii, billuu, bichill, motchill, khophim18, zaphim, 2phimhay, iphimhay, iphim, VTVGiaitri, PhimHD7, Hplus, Kphim, Cliptv, yeuphimmoi, Vietsubtv, Bomtan, Biphim, Khophimplus, Cửu Âm Chân Kinh full, The Mystery of the Condor Hero online, Cửu Âm Chân Kinh Thuyết Minh, Cửu Âm Chân Kinh Vietsub, Cửu Âm Chân Kinh Lồng Tiếng', 1, 'cuu-am-chan-kinh9457.jpg', 'phimbo', 4, 1, 6, 0, 1, 0, 'The Mystery of the Condor Hero (1993)', '2000', 0, 0, '2023-04-18 02:30:19', '2023-05-03 10:17:15'),
(20, 'BA GIAI GẶP TÚ XUẤT', 'ba-giai-gap-tu-xuat', '30 phút / tập', 'Ba Giai Gặp Tú Xuất 2021, Ba Giai Gặp Tú Xuất Full (05/05) HD Thuyết Minh\r\nChuyện về hai nhân vật Ba Giai và Tú Xuất thông minh, lém lỉnh. Họ là một cặp bài trùng đầy mưu trí nhưng lại tốt bụng. Hai ông chuyên giúp người nghèo khổ, bị áp bức bóc lột lấy lại công bằng.', NULL, 5, 'Ba Giai Gặp Tú Xuất\r\nxem phim Ba Giai Gặp Tú Xuất viesub, xem Bí Ba Giai Gặp Tú Xuất vietsub online tap 1, tap 2, tap 3, tap 4, tap 5 phim Ba Giai Gặp Tú Xuất ep 5, ep 6, ep 7, ep 8, ep 9, ep 10, Lịch chiếu phim Ba Giai Gặp Tú Xuất, xem Ba Giai Gặp Tú Xuất tập 11, tập 12, tập 13, tập 14, tập 15, phim Ba Giai Gặp Tú Xuất tap 16, tap 17, tap 18, tap 19, tap 20, xem phim Ba Giai Gặp Tú Xuất tập 21, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, Ba Giai Gặp Tú Xuất tap cuoi, Ba Giai Gặp Tú Xuất vietsub tron bo, Ba Giai Gặp Tú Xuất phim3s, Ba Giai Gặp Tú Xuất motphim,vtv16, khoaitv, phimgi, hatdetv, xemphimso, hdo, topphimhd, khoaitv, vungtv, dongphim, fptplay, zingtv, xemphimgi Ba Giai Gặp Tú Xuất youtube,vietsubtv, bomtan, Ba Giai Gặp Tú Xuất phimmoi, hdonline, phimbathu, bilutv, banhtv, goldphim, bongngotv, bilutvs, phimmoizz, fullphim, 247phim, dongphym, xemphimvui, phimhay.co, galaxyplay, fptplay, hdviet, hdonline, hdo.tv, netflix, xemphimplus,phimmoiz, iphimmoi, phimchill, xemphimchill, ephimmoi, ezphimmoi, azphimmoi, phimmoichill, phimgii, xemphimgii, billuu, bichill, motchill, khophim18, zaphim, 2phimhay, iphimhay, iphim, VTVGiaitri, PhimHD7, Hplus, Kphim, Cliptv, yeuphimmoi, Vietsubtv, Bomtan, Biphim, Khophimplus, Ba Giai Gặp Tú Xuất full, Ba Giai Gặp Tú Xuất online, Ba Giai Gặp Tú Xuất Thuyết Minh, Ba Giai Gặp Tú Xuất Vietsub, Ba Giai Gặp Tú Xuất Lồng Tiếng', 1, 'ba-giai-gap-tu-xuat5597.jpg', 'phimbo', 4, 8, 1, 0, 4, 1, 'Ba Giai Gặp Tú Xuất (2021)', '2021', 0, 0, '2023-04-18 02:49:41', '2023-05-03 06:43:09'),
(21, '7 VIÊN NGỌC RỒNG: CUỘC CHIẾN CỦA CÁC VỊ THẦN', '7-vien-ngoc-rong-cuoc-chien-cua-cac-vi-than', '110 phút', '7 Viên Ngọc Rồng: Cuộc Chiến Của Các Vị Thần 2013, Dragon Ball: Battle Of Gods HD Vietsub\r\nKhi Birus hỏi Ông Boo cho một hoặc hai bánh pudding mãng cầu ông đã có, Boo ăn tất cả trong số họ , chọc giận Thiên Chúa of Destruction người quyết định tiêu diệt Trái Đất . Ông Boo, Android 18 , Tenshinhan và Piccolo nỗ lực để chiến đấu Birus , nhưng có thể dễ dàng bị đánh bại. Gohan quyền hạn và các cuộc tấn công Birus chỉ để được đưa xuống bởi một quả phạt nặng . Goten và Trunks cầu chì vào Gotenks và cố gắng để chiến đấu Birus nhưng nhanh chóng được spanked và đánh bại là tốt. Khi Thiên Chúa of Destruction tát Bulma, nó giận Xem Phim 7 Viên Ngọc Rồng Cuộc Chiến Của Các Vị Thần - Dragon Ball Battle Of Gods Vegeta và hắn tấn công . Goku xuất hiện , đã được xem trận đấu của Vegeta . Goku triệu tập Shenlong hỏi làm thế nào đạt đến Super Saiyan Thiên Chúa . Một Saiyan siêu Thiên Chúa một lần xuất hiện trên hành tinh Vegeta để ngăn chặn Saiyans ác , nhưng anh đã thất bại bởi vì thời gian giới hạn của hình thức. Xem Phim 7 Viên Ngọc Rồng Cuộc Chiến Của Các Vị Thần - Dragon Ball Battle Of Gods  Con rồng cũng cho thấy rằng họ cần sức mạnh của sáu Saiyans tinh khiết tận tình cho một trong số họ để đạt được hình thức siêu Saiyan Thiên Chúa . Goku biến thành một Super Saiyan Thiên Chúa , Xem Phim 7 Viên Ngọc Rồng Cuộc Chiến Của Các Vị Thần - Dragon Ball Battle Of Gods một hình thức xa hơn thậm chí Super Saiyan 3 , nhờ vào sức mạnh của chính mình, Vegeta , Gohan , Trunks , Goten', NULL, 1, 'Dragon ball, 7 viên ngọc rồng: cuộc chiến của các vị thần dragon ball: battle of gods', 1, '7-vien-ngoc-rong-cuoc-chien-cua-cac-vi-than3026.jpg', 'phimle', 7, 3, 3, 0, 0, 0, 'Dragon Ball: Battle Of Gods (2013)', '2013', 2, 10, '2023-04-18 22:28:09', '2023-04-21 09:42:21'),
(22, 'NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM', 'nguc-toi-rong-danh-du-cua-ke-trom', '2giờ 14phút', 'Ngục Tối & Rồng: Danh Dự Của Kẻ Trộm 2023, Dungeons & Dragons: Honor Among Thieves HD Thuyết minh\r\nMột tên trộm quyến rũ và một nhóm gồm những nhà thám hiểm không chắc chắn bắt tay vào một nhiệm vụ hoành tráng để lấy lại một di vật đã mất, nhưng mọi thứ trở nên tồi tệ một cách nguy hiểm khi họ đụng phải nhầm người.', 'MHXWY_gPzMw', 1, 'Dungeons & Dragons: Honor Among Thieves, NGỤC TỐI & RỒNG: DANH DỰ CỦA KẺ TRỘM, Thuyết minh, Chloe Coleman, Justice Smith, Jason Wong, Hugh Grant, Daisy Head, Chris Pine', 1, 'nguc-toi-rong-danh-du-cua-ke-trom9488.jpg', 'phimle', 3, 1, 4, 1, 0, 1, 'Dungeons & Dragons: Honor Among Thieves (2023)', '2023', 1, 2, '2023-04-18 23:54:32', '2023-04-21 09:41:20'),
(23, 'SÁT THỦ JOHN WICK 4', 'sat-thu-john-wick-4', '130 phút', 'Sát Thủ John Wick 4 2023, John Wick: Chapter 4 CAM Vietsub + Thuyết minh\r\nVới cái giá phải trả ngày càng tăng, John Wick tham gia cuộc chiến chống lại High Table trên toàn cầu khi tìm kiếm những người chơi quyền lực nhất trong thế giới ngầm, từ New York qua Paris, Osaka đến cả Berlin', 'yjRHZEUamCc', 1, 'SÁT THỦ JOHN WICK 4, John Wick', 1, 'John-wick-46623.jpg', 'phimle', 3, 1, 4, 1, 5, 1, 'John Wick: Chapter 4 (2023)', '2023', 1, 4, '2023-04-20 02:44:16', '2023-04-21 09:16:17'),
(24, 'CHIẾN LANG 2', 'chien-lang-2', '100 phút', 'Chiến Lang 2 2017, Wolf Warriors 2 HD Phụ đề + Thuyết minh\r\nChiến Lang 2 - Wolf Warriors 2 phim thuộc thể loại hành động do Trung Quốc sản xuất xoay quanh câu chuyện nói về anh lính Lãnh Phong muốn tử bỏ mọi thứ để sang Châi Phi bắt đầu cuộc sống bình dị, không ngờ rằng anh lại bị cuốn vào một cuộc chiến ở hòn lục địa đen với cá tính của anh thì không chừng chừ mà dấn thân vào cuộc chiến nguy hiểm này, phim Chiến Lang 2 - Wolf Warriors 2 là do nam tài tử Ngô Kinh làm đạo diễn và biên kịch cũng là nam chính trong phim và cùng hợp tác với hai ngôi sao của Hollywood đó là ai mời các bạn cùng đón xem.   Chiến Lang 2 - Wolf Warriors 2 :  Vietsub, HD', NULL, 1, 'Wolf Warriors , Wolf Warriors 2 (2017), chien lang 2', 1, 'chien-lang-25862.jpg', 'phimle', 7, 5, 6, 0, 0, 0, 'Wolf Warriors 2 (2017)', '2017', 1, 2, '2023-04-20 02:49:01', '2023-04-21 09:40:38'),
(25, 'BLUE BEETLE', 'blue-beetle', '110 phút', 'Blue Beetle một phiên bản cải tiến của nhân vật này, nhà khảo cổ học Dan Garrett, được giới thiệu vào năm 1964 bởi Charlton Comics, đã vẽ ra những khả năng thần bí từ một con bọ hung Ai Cập cổ đại. Được xuất bản bởi Charlton Comics và sau đó là DC, tác phẩm sáng tạo năm 1966 Ted Kord là học trò của Garret, người tiếp tục di sản chiến đấu chống tội phạm lâu đời của mình, mặc dù anh ta không có siêu năng lực.', 'vS3_72Gb-bI', 1, 'BLUE BEETLE, blue-beetle, Blue Beetle 2023', 1, 'Blue-Beetle-20231833.jpg', 'phimle', 1, 1, 4, 0, 5, 0, 'Blue Beetle 2023', '2023', 0, 0, '2023-04-20 21:04:10', '2023-04-23 09:40:21'),
(27, 'Sứ giả của chúa', 'su-gia-cua-chua', '123 phút', 'Sứ Giả Của Chúa, kể về một nhà vô địch võ thuật tên Yong Hoo, anh phát hiện ra sức mạnh trừ tà ma ẩn giấu trong mình. Còn rất trẻ, Yong Hoo đã quay lưng lại với Chúa khi lời cầu nguyện tuyệt vọng của anh cho sự sống còn của cha anh không được đáp lại. Rồi một ngày nọ, chàng trai có một vết thương bí ẩn trên lòng bàn tay. Vết thương ấy mở dẫn đến cuộc gặp với một linh mục cấp cao để chống lại các thế lực xấu xa.…', 'qJQ3xeoSfvc', 1, 'Xem The Divine Fury (2019), xem su gia cua chua, su gia cua chua', 1, 'su-gia-cua-chua9371.jpg', 'phimle', 7, 1, 5, 0, 0, 0, 'The Divine Fury (2019)', '2021', 2, 0, '2023-04-21 15:07:29', '2023-04-21 21:39:44'),
(28, 'THANH GƯƠM DIỆT QUỶ (PHẦN 2)', 'thanh-guom-diet-quy-phan-2', '24 phút / tập', 'Thanh Gươm Diệt Quỷ (Phần 2) 2019, Demon Slayer: Kimetsu no Yaiba (Season 2) Full (07/07) HD Vietsub', NULL, 7, 'Demon Slayer: Kimetsu no Yaiba (Season 2), Thanh gươm diệt quỷ (Phần 2), xem phim Thanh Gươm Diệt Quỷ (Phần 2) viesub,', 1, 'demon-slayer-season-27319.jpeg', 'phimbo', 4, 3, 3, 0, 0, 1, 'Demon Slayer: Kimetsu no Yaiba (Season 2) (2019)', '2019', 2, 2, '2023-04-22 02:25:00', '2023-05-01 18:41:31'),
(30, 'THÁM TỬ CONAN MOVIE 23: QUẢ ĐẤM SAPPHIRE XANH', 'tham-tu-conan-movie-23-qua-đam-sapphire-xanh', '109 phút', 'Thám Tử Conan Movie 23: Quả Đấm Sapphire Xanh 2019, Detective Conan Movie 23: The Fist Of Blue Sapphire HD Vietsub + Lồng tiếng\r\nDetective Conan Movie 23: The Fist of Blue Sapphire được đặt bối cảnh ở Singapore. Đây là movie đầu tiên có bối cảnh không phải ở Nhật Bản. Phim xoay quanh viên ngọc lớn nhất thế giới \' Sapphire\' được cho là đã chìm xuống đáy đại dương vào cuối thế kỷ 19. Conan và đối thủ định mệnh của cậu là “nhà ảo thuật dưới trăng” Kaito Kid bị cuốn vào một vụ án mạng xảy ra tại khách sạn Marina Bay Sands cùng một âm mưu vô cùng lớn. Makoto sẽ đóng vai trò quan trọng ngăn chặn Kid trộm viên ngọc Blue Sapphire. Bộ phim sẽ là cuộc chiến “tam giác” giữa Kid, Kyogoku và Conan. Phim sẽ chính thức khởi chiếu tại Nhật Bản từ ngày 12/4/2019.', NULL, 1, 'Detective Conan Movie 23: The Fist Of Blue Sapphire, Thám Tử Conan Movie 23: Quả Đấm Sapphire Xanh', 1, 'tham-tu-conan-movie-23-qua-dam-sapphire-xanh7411.jpg', 'phimle', 7, 1, 3, 1, 4, 0, 'Detective Conan Movie 23: The Fist Of Blue Sapphire (2019)', '2019', NULL, 0, '2023-05-03 01:57:12', '2023-05-02 20:33:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `movie_genres`
--

CREATE TABLE `movie_genres` (
  `id` int(10) UNSIGNED NOT NULL,
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `movie_genres`
--

INSERT INTO `movie_genres` (`id`, `movie_id`, `genre_id`, `created_at`, `updated_at`) VALUES
(6, 25, 14, NULL, NULL),
(10, 23, 1, NULL, NULL),
(11, 23, 9, NULL, NULL),
(12, 23, 12, NULL, NULL),
(13, 25, 1, NULL, NULL),
(14, 25, 15, NULL, NULL),
(19, 24, 1, NULL, NULL),
(20, 24, 4, NULL, NULL),
(21, 24, 5, NULL, NULL),
(22, 22, 8, NULL, NULL),
(23, 22, 15, NULL, NULL),
(24, 21, 3, NULL, NULL),
(25, 20, 8, NULL, NULL),
(26, 19, 1, NULL, NULL),
(27, 18, 11, NULL, NULL),
(28, 17, 1, NULL, NULL),
(29, 17, 15, NULL, NULL),
(30, 16, 3, NULL, NULL),
(31, 16, 7, NULL, NULL),
(32, 16, 15, NULL, NULL),
(33, 15, 1, NULL, NULL),
(34, 4, 1, NULL, NULL),
(35, 4, 8, NULL, NULL),
(36, 5, 1, NULL, NULL),
(37, 5, 3, NULL, NULL),
(38, 6, 1, NULL, NULL),
(39, 6, 12, NULL, NULL),
(40, 6, 15, NULL, NULL),
(41, 7, 1, NULL, NULL),
(42, 7, 4, NULL, NULL),
(43, 8, 9, NULL, NULL),
(44, 8, 10, NULL, NULL),
(45, 9, 11, NULL, NULL),
(46, 10, 1, NULL, NULL),
(47, 10, 15, NULL, NULL),
(48, 11, 1, NULL, NULL),
(49, 11, 15, NULL, NULL),
(50, 12, 1, NULL, NULL),
(51, 12, 3, NULL, NULL),
(52, 12, 15, NULL, NULL),
(53, 13, 6, NULL, NULL),
(54, 13, 9, NULL, NULL),
(55, 14, 1, NULL, NULL),
(56, 14, 11, NULL, NULL),
(60, 27, 1, NULL, NULL),
(61, 27, 11, NULL, NULL),
(62, 28, 1, NULL, NULL),
(63, 28, 3, NULL, NULL),
(66, 30, 1, NULL, NULL),
(67, 30, 3, NULL, NULL),
(68, 30, 4, NULL, NULL),
(69, 30, 15, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ratings`
--

CREATE TABLE `ratings` (
  `id` int(10) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `Ip_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `ratings`
--

INSERT INTO `ratings` (`id`, `rating`, `movie_id`, `Ip_address`, `created_at`, `updated_at`) VALUES
(1, 5, 28, '127.0.0.1', '2023-04-26 19:52:54', '2023-04-26 19:52:54'),
(2, 3, 4, '127.0.0.1', '2023-04-26 19:54:47', '2023-04-26 19:54:47');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Hoàng Anh Đức', 'admin@gmail.com', NULL, '$2y$10$MgDQoI.LKaKyNHIPMHlzlOxeqO7y1NlBLy9Ylmt4Ru5n63RaU.5fi', NULL, '2023-04-14 23:55:49', '2023-04-14 23:55:49');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `episodes`
--
ALTER TABLE `episodes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `movie_genres`
--
ALTER TABLE `movie_genres`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `episodes`
--
ALTER TABLE `episodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `info`
--
ALTER TABLE `info`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `movie_genres`
--
ALTER TABLE `movie_genres`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
