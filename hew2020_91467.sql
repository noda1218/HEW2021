-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2021-03-01 07:52:48
-- サーバのバージョン： 10.4.13-MariaDB
-- PHP のバージョン: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `hew2020_91467`
--
CREATE DATABASE IF NOT EXISTS `hew2020_91467` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hew2020_91467`;

-- --------------------------------------------------------

--
-- テーブルの構造 `a_simu`
--

DROP TABLE IF EXISTS `a_simu`;
CREATE TABLE IF NOT EXISTS `a_simu` (
  `simulationid` int(11) NOT NULL,
  `haiti` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  PRIMARY KEY (`simulationid`,`haiti`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `bought`
--

DROP TABLE IF EXISTS `bought`;
CREATE TABLE IF NOT EXISTS `bought` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `User_id` int(11) NOT NULL,
  `created_ad` datetime NOT NULL,
  `total_pr` int(11) NOT NULL,
  `avilable_point` int(11) DEFAULT NULL,
  `deal_buy` enum('クレジット利用','電子決済','コンビニ決済','代引き決済') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `User_id` (`User_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `bought`
--

INSERT INTO `bought` (`id`, `User_id`, `created_ad`, `total_pr`, `avilable_point`, `deal_buy`) VALUES
(1, 6, '2021-03-01 15:14:47', 45000, 0, 'コンビニ決済');

-- --------------------------------------------------------

--
-- テーブルの構造 `category_info`
--

DROP TABLE IF EXISTS `category_info`;
CREATE TABLE IF NOT EXISTS `category_info` (
  `info_id` int(11) NOT NULL,
  `categoryname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `category_info`
--

INSERT INTO `category_info` (`info_id`, `categoryname`) VALUES
(1, 'ベッド'),
(2, 'イス'),
(3, '収納'),
(4, 'デスク'),
(5, 'キッチン'),
(6, 'その他'),
(7, 'ソファー');

-- --------------------------------------------------------

--
-- テーブルの構造 `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `contact_id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `contact_detail` enum('製品','購入手続き','配送','シミュレート','その他') NOT NULL,
  `contact_sen` varchar(255) NOT NULL,
  `contact_date` datetime NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` enum('満足','妥協','まだ','不満') NOT NULL,
  PRIMARY KEY (`contact_id`),
  KEY `User_id` (`User_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `deal`
--

DROP TABLE IF EXISTS `deal`;
CREATE TABLE IF NOT EXISTS `deal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `bought_count` int(11) NOT NULL,
  `by_price` int(11) NOT NULL,
  PRIMARY KEY (`id`,`product_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `deal`
--

INSERT INTO `deal` (`id`, `product_id`, `bought_count`, `by_price`) VALUES
(1, 1, 1, 45000);

-- --------------------------------------------------------

--
-- テーブルの構造 `house`
--

DROP TABLE IF EXISTS `house`;
CREATE TABLE IF NOT EXISTS `house` (
  `property` int(255) NOT NULL,
  `property_name` varchar(255) DEFAULT NULL,
  `madori_cat` enum('1種類目','2種類目''3種類目','4種類目') DEFAULT NULL,
  PRIMARY KEY (`property`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `Price` int(11) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `search_name` varchar(255) NOT NULL,
  `sy_height` int(11) DEFAULT NULL,
  `sy_width` int(11) DEFAULT NULL,
  `sy_images` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `items`
--

INSERT INTO `items` (`product_id`, `product_name`, `Price`, `count`, `search_name`, `sy_height`, `sy_width`, `sy_images`) VALUES
(1, 'クラシックベッド', 45000, 0, 'ベット_bed_ベッド_寝床_べっと', NULL, NULL, NULL),
(2, 'カジュアルベッド', 30000, 0, 'ベット_bed_ベッド_寝床_べっと', NULL, NULL, NULL),
(3, '二段ベッド', 100000, 0, 'ベット_bed_ベッド_寝床_べっと', NULL, NULL, NULL),
(4, 'メルヘンベッド', 28000, 0, 'ベット_bed_ベッド_寝床_べっと', NULL, NULL, NULL),
(5, 'スタンダードベッド', 50000, 0, 'ベット_bed_ベッド_寝床_べっと', NULL, NULL, NULL),
(6, 'モダンベッド', 32000, 0, 'ベット_bed_ベッド_寝床_べっと', NULL, NULL, NULL),
(7, '木製椅子A', 7000, 0, '椅子_イス_いす_chair_チェア', NULL, NULL, NULL),
(8, 'リラックスチェアA', 9000, 0, '椅子_イス_いす_chair_チェア_リラックス', NULL, NULL, NULL),
(9, '木製椅子B', 10000, 0, '椅子_イス_いす_chair_チェア', NULL, NULL, NULL),
(10, '木製椅子C', 14000, 0, '椅子_イス_いす_chair_チェア', NULL, NULL, NULL),
(11, 'リラックスチェアB', 8000, 0, '椅子_イス_いす_chair_チェア_リラックス', NULL, NULL, NULL),
(12, '本棚A', 70000, 0, '本棚_棚_たな_タナ_本_収納_タンス_たんす', NULL, NULL, NULL),
(13, 'タンスA', 30000, 0, '本棚_棚_たな_タナ_本_収納_タンス_たんす', NULL, NULL, NULL),
(14, 'タンスB', 25000, 0, '本棚_棚_たな_タナ_本_収納_タンス_たんす', NULL, NULL, NULL),
(15, '本棚B', 19000, 0, '本棚_棚_たな_タナ_本_収納_タンス_たんす', NULL, NULL, NULL),
(16, 'タンスC', 13000, 0, '本棚_棚_たな_タナ_本_収納_タンス_たんす', NULL, NULL, NULL),
(17, 'タンスD', 21000, 0, '本棚_棚_たな_タナ_本_収納_タンス_たんす', NULL, NULL, NULL),
(18, '木製机A', 18000, 0, '机_つくえ_ツクエ_津久江_desk_デスク_table_テーブル_てーぶる', NULL, NULL, NULL),
(19, '木製机B', 20000, 0, '机_つくえ_ツクエ_津久江_desk_デスク_table_テーブル_てーぶる', NULL, NULL, NULL),
(20, '木製机C', 35000, 0, '机_つくえ_ツクエ_津久江_desk_デスク_table_テーブル_てーぶる', NULL, NULL, NULL),
(21, 'ガラス机', 45000, 0, '机_つくえ_ツクエ_津久江_desk_デスク_table_テーブル_てーぶる', NULL, NULL, NULL),
(22, '木製机D', 15000, 0, '机_つくえ_ツクエ_津久江_desk_デスク_table_テーブル_てーぶる', NULL, NULL, NULL),
(23, '木製机F', 25000, 0, '机_つくえ_ツクエ_津久江_desk_デスク_table_テーブル_てーぶる', NULL, NULL, NULL),
(24, 'キッチンA', 41000, 0, '収納_キッチン', NULL, NULL, NULL),
(25, 'キッチンB', 32000, 0, '収納_キッチン', NULL, NULL, NULL),
(26, 'キッチンC', 60000, 0, '収納_キッチン', NULL, NULL, NULL),
(27, 'ゴミ箱A', 2300, 0, 'ゴミ箱_gomi_ゴミ_箱_はこ', NULL, NULL, NULL),
(28, 'ゴミ箱B', 1200, 0, 'ゴミ箱_gomi_ゴミ_箱_はこ', NULL, NULL, NULL),
(29, 'ゴミ箱C', 3100, 0, 'ゴミ箱_gomi_ゴミ_箱_はこ', NULL, NULL, NULL),
(30, '植木鉢A', 1300, 0, 'ガーデニング_ガーデン_植木_植木鉢_鉢_植物_観葉_観葉植物', NULL, NULL, NULL),
(31, '植木鉢B', 2500, 0, 'ガーデニング_ガーデン_植木_植木鉢_鉢_植物_観葉_観葉植物', NULL, NULL, NULL),
(32, '植木鉢C', 1500, 0, 'ガーデニング_ガーデン_植木_植木鉢_鉢_植物_観葉_観葉植物', NULL, NULL, NULL),
(33, '植木鉢D', 800, 0, 'ガーデニング_ガーデン_植木_植木鉢_鉢_植物_観葉_観葉植物', NULL, NULL, NULL),
(34, '植木鉢E', 1700, 0, 'ガーデニング_ガーデン_植木_植木鉢_鉢_植物_観葉_観葉植物', NULL, NULL, NULL),
(35, '植木鉢F', 750, 0, 'ガーデニング_ガーデン_植木_植木鉢_鉢_植物_観葉_観葉植物', NULL, NULL, NULL),
(36, 'ソファーA', 60000, 0, 'sofa_ソファー_そふぁー_クッション_ふかふか', NULL, NULL, NULL),
(37, 'ソファーB', 45000, 0, 'sofa_ソファー_そふぁー_クッション_ふかふか', NULL, NULL, NULL),
(38, 'ソファーC', 76000, 0, 'sofa_ソファー_そふぁー_クッション_ふかふか', NULL, NULL, NULL),
(39, 'ソファーD', 87000, 0, 'sofa_ソファー_そふぁー_クッション_ふかふか', NULL, NULL, NULL),
(40, 'ソファーE', 21000, 0, 'sofa_ソファー_そふぁー_クッション_ふかふか', NULL, NULL, NULL),
(41, 'ソファーF', 21000, 0, 'sofa_ソファー_そふぁー_クッション_ふかふか', NULL, NULL, NULL),
(42, 'ソファーG', 54000, 0, 'sofa_ソファー_そふぁー_クッション_ふかふか', NULL, NULL, NULL),
(43, 'ソファーH', 93000, 0, 'sofa_ソファー_そふぁー_クッション_ふかふか', NULL, NULL, NULL),
(44, 'ソファーI', 82000, 0, 'sofa_ソファー_そふぁー_クッション_ふかふか', NULL, NULL, NULL),
(45, 'ソファーJ', 44000, 0, 'sofa_ソファー_そふぁー_クッション_ふかふか', NULL, NULL, NULL),
(46, 'ソファーK', 11000, 0, 'sofa_ソファー_そふぁー_クッション_ふかふか', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `item_category`
--

DROP TABLE IF EXISTS `item_category`;
CREATE TABLE IF NOT EXISTS `item_category` (
  `product_id` int(11) NOT NULL,
  `info_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`info_id`),
  KEY `info_id` (`info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `item_category`
--

INSERT INTO `item_category` (`product_id`, `info_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(18, 4),
(19, 4),
(20, 4),
(21, 4),
(22, 4),
(23, 4),
(24, 5),
(25, 5),
(26, 5),
(27, 6),
(28, 6),
(29, 6),
(30, 6),
(31, 6),
(32, 6),
(33, 6),
(34, 6),
(35, 6),
(36, 7),
(37, 7),
(38, 7),
(39, 7),
(40, 7),
(41, 7),
(42, 7),
(43, 7),
(44, 7),
(45, 7),
(46, 7);

-- --------------------------------------------------------

--
-- テーブルの構造 `item_img`
--

DROP TABLE IF EXISTS `item_img`;
CREATE TABLE IF NOT EXISTS `item_img` (
  `item_img_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`item_img_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `item_img`
--

INSERT INTO `item_img` (`item_img_id`, `product_id`, `product_img`) VALUES
(1, 1, 'bed1.jpg'),
(2, 2, 'bed2.jpg'),
(3, 3, 'bed3.jpg'),
(4, 4, 'bed4.jpg'),
(5, 5, 'bed5.jpg'),
(6, 6, 'bed6.jpg'),
(7, 7, 'chair1.jpg'),
(8, 8, 'chair2.jpg'),
(9, 9, 'chair3.jpg'),
(10, 10, 'chair4.jpg'),
(11, 11, 'chair5.jpg'),
(12, 12, 'chest1.jpg'),
(13, 13, 'chest2.jpg'),
(14, 14, 'chest3.jpg'),
(15, 15, 'chest4.jpg'),
(16, 16, 'chest5.jpg'),
(17, 17, 'chest6.jpg'),
(18, 18, 'desk1.jpg'),
(19, 19, 'desk2.jpg'),
(20, 20, 'desk3.jpg'),
(21, 21, 'desk4.jpg'),
(22, 22, 'desk5.jpg'),
(23, 23, 'desk6.jpg'),
(24, 24, 'kitc1.jpg'),
(25, 25, 'kitc2.jpg'),
(26, 26, 'kitc3.jpg'),
(27, 27, 'other1.jpg'),
(28, 28, 'other2.jpg'),
(29, 29, 'other3.jpg'),
(30, 30, 'other4.jpg'),
(31, 31, 'other5.jpg'),
(32, 32, 'other6.jpg'),
(33, 33, 'other7.jpg'),
(34, 34, 'other8.jpg'),
(35, 35, 'other9.jpg'),
(36, 36, 'sofa1.png'),
(37, 37, 'sofa2.jpg'),
(38, 38, 'sofa3.jpg'),
(39, 39, 'sofa4.jpg'),
(40, 40, 'sofa5.jpg'),
(41, 41, 'sofa6.jpg'),
(42, 42, 'sofa7.jpg'),
(43, 43, 'sofa8.jpg'),
(44, 44, 'sofa9.jpg'),
(45, 45, 'sofa10.jpg'),
(46, 46, 'sofa11.jpg');

-- --------------------------------------------------------

--
-- テーブルの構造 `item_re`
--

DROP TABLE IF EXISTS `item_re`;
CREATE TABLE IF NOT EXISTS `item_re` (
  `Reviewnum` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `sentence` varchar(255) DEFAULT NULL,
  `delete_at` datetime DEFAULT NULL,
  `star` int(1) DEFAULT NULL,
  `toukou_at` datetime DEFAULT NULL,
  PRIMARY KEY (`Reviewnum`,`product_id`),
  KEY `product_id` (`product_id`),
  KEY `User_id` (`User_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `okiniiri`
--

DROP TABLE IF EXISTS `okiniiri`;
CREATE TABLE IF NOT EXISTS `okiniiri` (
  `product_id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `admin_at` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`User_id`),
  KEY `User_id` (`User_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `simulation`
--

DROP TABLE IF EXISTS `simulation`;
CREATE TABLE IF NOT EXISTS `simulation` (
  `simulationid` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `property` int(255) NOT NULL,
  `registerd_name` varchar(255) DEFAULT NULL,
  `edit_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  PRIMARY KEY (`simulationid`),
  KEY `property` (`property`),
  KEY `User_id` (`User_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `stock_item`
--

DROP TABLE IF EXISTS `stock_item`;
CREATE TABLE IF NOT EXISTS `stock_item` (
  `product_id` int(11) NOT NULL,
  `item_storage` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `User_id` int(11) NOT NULL AUTO_INCREMENT,
  `password` char(255) NOT NULL,
  `mail_address` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `address_num` varchar(7) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `Born` date DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`User_id`),
  UNIQUE KEY `mail_address` (`mail_address`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`User_id`, `password`, `mail_address`, `name`, `tel`, `address_num`, `address`, `Born`, `point`, `created_at`, `delete_time`) VALUES
(1, '$2y$10$nQHmlWP.B/VZLnazMHtfK.wl2mWW3dZdspSxaJ0tpFA0WBegn3K3a', '1234@yahoo.co.jp', 'トマト', '0333441010', '1600023', '東京都新宿区西新宿1-7-3', '2001-02-02', 3000, '2021-02-28 21:00:27', NULL),
(2, '$2y$10$HAcq102aLBijpPBENDjZjO3UnTw4KbeI2x0wP.5QxPyxTCBspjjY.', '4321@yahoo.co.jp', '田中', '0333441010', '1600023', '東京都新宿区西新宿1-7-3', '2001-02-02', 3000, '2021-03-01 14:47:44', NULL),
(4, '$2y$10$UJlzz0Hvc0e1AO4jUFXJyuHFMydydqDOFW/Lw2s7IMxwNou1wZkYC', '12345@yahoo.co.jp', '鈴木', '0333441010', '1600023', '東京都新宿区西新宿1-7-3', '2001-02-02', 3000, '2021-03-01 14:50:03', NULL),
(5, '$2y$10$/z3q6HbL1w76THanyz7k2udDvfJJxqdllAQrlFaRjlTFz3/PdTfwi', '1233456@yahoo.co.jp', 'にんじん', '0333441010', '1600023', '東京都新宿区西新宿1-7-3', '2001-02-02', 3000, '2021-03-01 14:52:46', NULL),
(6, '$2y$10$SxtyGIW3EWTUQLr56FgENe/UZfjVD4pu6w8XAB2JYisGKTFhMrdE2', '1@yahoo.co.jp', '佐藤', '0333441010', '1600023', '東京都新宿区西新宿1-7-3', '2001-02-02', 3450, '2021-03-01 15:04:57', NULL);

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `a_simu`
--
ALTER TABLE `a_simu`
  ADD CONSTRAINT `a_simu_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `items` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `a_simu_ibfk_2` FOREIGN KEY (`simulationid`) REFERENCES `simulation` (`simulationid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- テーブルの制約 `bought`
--
ALTER TABLE `bought`
  ADD CONSTRAINT `bought_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `users` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- テーブルの制約 `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `users` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- テーブルの制約 `deal`
--
ALTER TABLE `deal`
  ADD CONSTRAINT `deal_ibfk_1` FOREIGN KEY (`id`) REFERENCES `bought` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deal_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `items` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- テーブルの制約 `item_category`
--
ALTER TABLE `item_category`
  ADD CONSTRAINT `item_category_ibfk_1` FOREIGN KEY (`info_id`) REFERENCES `category_info` (`info_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_category_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `items` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- テーブルの制約 `item_img`
--
ALTER TABLE `item_img`
  ADD CONSTRAINT `item_img_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `items` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- テーブルの制約 `item_re`
--
ALTER TABLE `item_re`
  ADD CONSTRAINT `item_re_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `items` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_re_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `users` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- テーブルの制約 `okiniiri`
--
ALTER TABLE `okiniiri`
  ADD CONSTRAINT `okiniiri_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `items` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `okiniiri_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `users` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- テーブルの制約 `simulation`
--
ALTER TABLE `simulation`
  ADD CONSTRAINT `simulation_ibfk_1` FOREIGN KEY (`property`) REFERENCES `house` (`property`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `simulation_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `users` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- テーブルの制約 `stock_item`
--
ALTER TABLE `stock_item`
  ADD CONSTRAINT `stock_item_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `items` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
