-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 18, 2018 at 09:08 AM
-- Server version: 5.5.52-MariaDB-cll-lve
-- PHP Version: 5.6.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `digitalfatih_dbdkp`
--

-- --------------------------------------------------------

--
-- Table structure for table `sosmed`
--

CREATE TABLE `sosmed` (
  `sosmed_id` int(11) NOT NULL,
  `sosmed_name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sosmed`
--

INSERT INTO `sosmed` (`sosmed_id`, `sosmed_name`) VALUES
(1, 'facebook'),
(2, 'twitter'),
(3, 'google-plus'),
(4, 'linkedin'),
(5, 'pinterest');

-- --------------------------------------------------------

--
-- Table structure for table `sys_admin_menu`
--

CREATE TABLE `sys_admin_menu` (
  `id_menu` int(11) NOT NULL,
  `menu_label` varchar(75) DEFAULT NULL,
  `is_grp_hdr` varchar(1) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` varchar(1) DEFAULT NULL,
  `sort_order` varchar(3) DEFAULT NULL,
  `link_menu` varchar(255) DEFAULT NULL,
  `icon_menu` varchar(25) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sys_admin_menu`
--

INSERT INTO `sys_admin_menu` (`id_menu`, `menu_label`, `is_grp_hdr`, `parent_id`, `is_active`, `sort_order`, `link_menu`, `icon_menu`) VALUES
(1, 'MENU', 'Y', 0, 'Y', '2', '#', 'fa-500px'),
(2, 'Menu Management', 'N', 1, 'Y', '1', '#', 'fa-cogs'),
(3, 'Back End Menu', 'N', 2, 'Y', '1', 'wbadmin/config_menu_admin', NULL),
(4, 'Front End Menu', 'N', 2, 'Y', '2', 'wbadmin/config_menu_fe', NULL),
(5, 'CONTENT', 'Y', 0, 'Y', '1', '#', 'fa-500px'),
(6, 'Content Management', 'N', 5, 'Y', '1', '#', 'fa-external-link-square'),
(28, 'Homepage Management', 'N', 6, 'Y', '1', 'wbadmin/section_manag', NULL),
(27, 'Article Management', 'N', 6, 'Y', '2', 'wbadmin/Article_manag/load_article', NULL),
(33, 'User Management', 'N', 32, 'Y', '1', '#', 'fa-users'),
(32, 'USERS', 'Y', 0, 'Y', '3', '#', NULL),
(34, 'User Registration', 'N', 33, 'Y', '1', 'user/userlisting', ''),
(38, 'List OPD', 'N', 33, 'Y', '2', 'wbadmin/opd/list_opd', 'fa-500px'),
(39, 'List Arsip OPD', 'N', 6, 'Y', '3', 'wbadmin/opd/list_opd', '');

-- --------------------------------------------------------

--
-- Table structure for table `sys_admin_menu_copy`
--

CREATE TABLE `sys_admin_menu_copy` (
  `id_menu` int(11) NOT NULL,
  `menu_label` varchar(75) DEFAULT NULL,
  `is_grp_hdr` varchar(1) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` varchar(1) DEFAULT NULL,
  `sort_order` varchar(3) DEFAULT NULL,
  `link_menu` varchar(255) DEFAULT NULL,
  `icon_menu` varchar(25) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sys_admin_menu_copy`
--

INSERT INTO `sys_admin_menu_copy` (`id_menu`, `menu_label`, `is_grp_hdr`, `parent_id`, `is_active`, `sort_order`, `link_menu`, `icon_menu`) VALUES
(36, 'PUBLIC WEB', 'Y', 0, 'Y', '2', NULL, NULL),
(37, 'Button', 'N', 36, 'Y', '2', NULL, NULL),
(38, 'Sub Button 1', 'N', 37, 'Y', '1', NULL, NULL),
(39, 'Sub Button 2', 'N', 37, 'Y', '2', NULL, NULL),
(40, 'Input Box', 'N', 36, 'Y', '1', NULL, NULL),
(41, 'Sub Input Box 1', 'N', 40, 'Y', '1', NULL, NULL),
(42, 'Sub Input Box 2', 'N', 40, 'Y', '2', NULL, NULL),
(43, 'Sub Input Box 3', 'N', 40, 'Y', '3', NULL, NULL),
(9, 'ADMINISTRATION', 'Y', 0, 'Y', '1', NULL, NULL),
(10, 'User Management', 'N', 9, 'Y', '1', NULL, 'fa-user'),
(11, 'System Setting', 'N', 9, 'Y', '2', NULL, 'fa-cog'),
(12, 'User Group', 'N', 10, 'Y', '1', NULL, NULL),
(13, 'User Setting', 'N', 10, 'Y', '2', NULL, NULL),
(20, 'Manage Admin Menu', 'N', 11, 'Y', '1', 'wbadmin/config_menu_admin', NULL),
(44, 'Sub Input Box 4', 'N', 40, 'Y', '4', NULL, NULL),
(35, 'Maintain Front End Menu', 'N', 11, 'Y', '2', 'wbadmin/config_menu_fe', NULL),
(48, 'Sub meny system Setting', 'N', 11, 'Y', '3', 'linsysetmsetting', 'fa-cogs'),
(47, 'Menu Text', 'N', 9, 'Y', '4', 'URL Menu', 'fa-anchor'),
(49, 'sytem setting lagi', 'N', 11, 'Y', '4', 'link url lai', 'fa-angellist'),
(50, 'again and again', 'N', 11, 'Y', '5', 'aaiin ', 'fa-angle-double-left'),
(51, 'lagi lagi ku kmbai', 'N', 9, 'Y', '3', 'kembali', 'fa-500px'),
(52, 'disini nonglkron', 'N', 11, 'Y', '6', 'disin likn', 'fa-bicycle'),
(53, 'SUB menu menu text', 'N', 47, 'Y', '1', 'urlsubmenutext', 'fa-cc-stripe'),
(54, 'Sub menu lagi lagi kukmbali', 'N', 51, 'Y', '1', 'urllagilagi', 'fa-align-right'),
(63, 'sub menu baru', 'N', 62, 'Y', '1', 'linksubmenubaru', 'fa-android'),
(62, 'MENU BARU', 'Y', 0, 'Y', '3', 'linkmenubaru', 'fa-angellist'),
(64, 'sub sub menu baru', 'N', 63, 'Y', '1', 'baru', 'fa-anchor');

-- --------------------------------------------------------

--
-- Table structure for table `sys_fe_content`
--

CREATE TABLE `sys_fe_content` (
  `fe_content_id` int(11) NOT NULL,
  `fe_img_files` varchar(25) DEFAULT NULL,
  `fe_img_files2` varchar(25) DEFAULT NULL,
  `fe_content_title` varchar(255) DEFAULT NULL,
  `fe_content_short_desc` varchar(255) DEFAULT NULL,
  `fe_content_short_desc2` varchar(255) DEFAULT NULL,
  `fe_content_short_desc3` varchar(255) DEFAULT NULL,
  `fe_full_content` text,
  `fe_content_btn_label` varchar(25) DEFAULT NULL,
  `fe_content_btn_url` varchar(55) DEFAULT NULL,
  `fe_link_clickable` varchar(1) DEFAULT 'Y',
  `fe_content_sort_order` smallint(6) DEFAULT NULL,
  `fe_section_name` varchar(25) DEFAULT NULL COMMENT 'Section name: sengaja tidak ambil section id, supaya memudahkan pas query',
  `fe_content_icon` varchar(25) DEFAULT NULL,
  `fe_sosmed` varchar(255) DEFAULT NULL,
  `status_active` varchar(1) DEFAULT NULL,
  `display_start_from` datetime DEFAULT NULL,
  `display_until` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(25) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sys_fe_content`
--

INSERT INTO `sys_fe_content` (`fe_content_id`, `fe_img_files`, `fe_img_files2`, `fe_content_title`, `fe_content_short_desc`, `fe_content_short_desc2`, `fe_content_short_desc3`, `fe_full_content`, `fe_content_btn_label`, `fe_content_btn_url`, `fe_link_clickable`, `fe_content_sort_order`, `fe_section_name`, `fe_content_icon`, `fe_sosmed`, `status_active`, `display_start_from`, `display_until`, `create_date`, `create_by`, `update_date`, `update_by`) VALUES
(4, 'features7.png', NULL, 'Sejarah Lembaga', 'Awalnya Depok merupakan sebuah dusun terpencil ditengah hutan belantara', NULL, NULL, '&lt;p&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;Awalnya Depok merupakan sebuah dusun terpencil ditengah hutan belantara dan semak belukar. Pada tanggal 18 Mei 1696 seorang pejabat tinggi VOC, &lt;strong&gt;Cornelis Chastelein&lt;/strong&gt;, membeli tanah yang meliputi daerah Depok serta sedikit wilayah Jakarta Selatan, Ratujaya dan Bojonggede. Chastelein mempekerjakan sekitar seratusan pekerja. Mereka didatangkan dari Bali, Makassar, Nusa Tenggara Timur, Maluku, Jawa, Pulau Rote serta Filipina.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;Selain mengelola perkebunan, Cornelis juga menyebarluaskan agama Kristen kepada para pekerjanya, lewat sebuah Padepokan Kristiani. Padepokan ini bernama &lt;span style=&quot;color:red&quot;&gt;De&lt;/span&gt; Eerste &lt;span style=&quot;color:red&quot;&gt;P&lt;/span&gt;rotestante &lt;span style=&quot;color:red&quot;&gt;O&lt;/span&gt;rganisatie van &lt;span style=&quot;color:red&quot;&gt;C&lt;/span&gt;hristenen, disingkat &lt;span style=&quot;color:red&quot;&gt;DEPOK. &lt;/span&gt;Dari sinilah rupanya nama kota ini berasal. Sampai saat ini, keturunan pekerja-pekerja Cornelis dibagi menjadi &lt;strong&gt;12 Marga&lt;/strong&gt;. Adapun marga-marga tersebut adalah :&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:green&quot;&gt;Jonathans&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:green&quot;&gt;Laurens&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:green&quot;&gt;Bacas&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:green&quot;&gt;Loen&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:green&quot;&gt;Soedira&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:green&quot;&gt;Isakh&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:green&quot;&gt;Samuel&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:green&quot;&gt;Leander&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:green&quot;&gt;Joseph&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:green&quot;&gt;Tholense&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:green&quot;&gt;Jacob&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:green&quot;&gt;Zadokh&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;Tahun 1871 Pemerintah Belanda mengizinkan daerah Depok membentuk Pemerintahan dan Presiden sendiri setingkat Gemeente (Desa Otonom).&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;Keputusan tersebut berlaku sampai tahun 1942. Gemeente Depok diperintah oleh seorang Presiden sebagai badan Pemerintahan tertinggi. Di bawah kekeuasaannya terdapat kecamatan yang membawahi mandat (9 mandor) dan dibantu oleh para Pencalang Polisi Desa serta Kumitir atau Menteri Lumbung. Daerah teritorial Gemeente Depok meliputi 1.244 Ha, namun dihapus pada tahun 1952 setelah terjadi perjanjian pelepasan hak antara Pemerintah RI dengan pimpinan Gemeente Depok, tapi tidak termasuk tanah-tanah Elgendom dan beberapa hak lainnya.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;Sejak saat itu, dimulailah pemerintahan kecamatan Depok yang berada dalam lingkungan Kewedanaan (Pembantu Bupati) wilayah Parung, yang meliputi 21 Desa. Pada tahun 1976 melalui proyek perumahan nasional di era Orde Baru, dibangunlah Perumnas Depok I dan Perumnas Depok II. Pembangunan tersebut memicu perkembangan Depok yang lebih pesat sehingga akhirnya pada tahun 1981 Pemerintah membentuk kota Administratif Depok yang peresmiannya dilakukan tanggal 18 Maret 1982 oleh Menteri Dalam Negeri (H. Amir Machmud).&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;Sejak tahun 1999, melalui UU nomor 15 Tahun 1999 Tentang Pembentukan Kotamadya Daerah Tingkat II Depok dan Kotamadya Daerah Tingkat II Cilegon, Depok meningkat statusnya menjadi Kotamadya atau Kota. Menurut Undang-Undang tersebut, wilayah Kotamadya daerah Tingkat II Depok memiliki uas wilayah 20.504,54 Ha yang meliputi :&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;Kecamatan Beji,&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt; terdiri dari 6 kelurahan dengan luas wilayah 1614 Ha.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;Kecamatan Sukmajaya&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;, terdiri dari 11 kelurahan dengan luas wilayah 3.398 Ha.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;Kecamatan Pancoran Mas&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;, dengan pusat pemerintahan berkedudukan dikelurahan Depok, terdiri dari 6 Kelurahan dan 6 Desa dengan jumlah penduduk 156.118 jiwa dan luas wilayah 2.671 Ha.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;Kecamatan Limo&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;, terdiri dari 8 desa dengan luas wilayah 2.595,3 Ha.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;Kecamatan Cimanggis&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;, terdiri dari 1 kelurahan dan 12 desa dengan luas wilayah 5.077,3 Ha.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;Kecamatan Sawangan&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;, terdiri dari 14 desa dengan luas wilayah 4.673,8 Ha.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#ff6600&quot;&gt;ASAL USUL PONDOK CINA&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;Dulu, Pondok Cina hanyalah hamparan perkebunan dan semak-semak belantara yang bernama Kampung Bojong. Awalnya hanya sebagai tempat transit pedagang-pedagang Tionghoa yang hendak berjualan di Depok. Lama kelamaan menjadi pemukiman, yang kini padat sebagai akses utama Depok-Jakarta.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;Kota Madya Depok (dulunya kota administratif) dikenal sebagai penyangga ibukota. Para penghuni yang mendiami wilayah Depok sebagian besar berasal dari pindahan orang Jakarta. Tak heran kalau dulu muncul pomeo singkatan &lt;strong&gt;&lt;span style=&quot;color:blue&quot;&gt;Depok&lt;/span&gt;&lt;/strong&gt; : &lt;strong&gt;&lt;em&gt;&lt;span style=&quot;color:blue&quot;&gt;D&lt;/span&gt;&lt;/em&gt;&lt;/strong&gt;&lt;em&gt;&lt;span style=&quot;color:blue&quot;&gt;aerah &lt;strong&gt;E&lt;/strong&gt;lit &lt;strong&gt;P&lt;/strong&gt;emukiman &lt;strong&gt;O&lt;/strong&gt;rang &lt;strong&gt;K&lt;/strong&gt;ota&lt;/span&gt;&lt;/em&gt;. Mereka banyak mendiami perumahan nasional (Perumnas), membangun rumah ataupun membuat pemukiman baru.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;Pada akhir tahun 70-an masyarakat Jakarta masih ragu untuk mendiami wilayah itu. Selain jauh dari pusat kota Jakarta, kawasan Depok masih sepi dan banyak diliputi perkebunan dan semak belukar. Angkutan umum masih jarang, dan mengandalkan pada angkutan kereta api. Seiring dengan perkembangan zaman, wajah Depok mulai berubah. Pembangunan di sana-sini gencar dilakukan oleh pemerintah setempat. Pusat hiburan seperti Plaza, Mall telah berdiri megah. Kini Depok telah menyandang predikat kotamadya dimana selama 17 tahun menjadi Kotif.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;Sebagai daerah baru, Depok menarik minat pedagang-pedagang Tionghoa untuk berjualan di sana. Namun Cornelis Chastelein pernah membuat peraturan bahwa orang-orang Cina tidak boleh tinggal di kota Depok. Mereka hanya boleh berdagang, tapi tidak boleh tinggal. Ini tentu menyulitkan mereka. Mengingat saat itu perjalanan dari Depok ke Jakarta bisa memakan waktu setengah hari, pedagang-pedagang tersebut membuat tempat transit di luar wilayah Depok, yang bernama Kampung Bojong. Mereka berkumpul dan mendirikan pondok-pondok sederhana di sekitar wilayah tersebut. Dari sini mulai muncul nama Pondok Cina.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;Menurut cerita H. Abdul Rojak, sesepuh masyarakat sekitar Pondok Cina, daerah Pondok Cina dulunya bernama Kampung Bojong. &amp;ldquo;Lama-lama daerah ini disebut Kampung Pondok Cina. Sebutan ini berawal ketika orang-orang keturunan Tionghoa datang untuk berdagang ke pasar Depok. Pedagang-pedagang itu datang menjelang matahari terbenam. Karena sampainya malam hari, mereka istirahat dahulu dengan membuat pondok-pondok sederhana,&amp;rdquo; ceritanya. Kebetulan, lanjut Rojak, di daerah tersebut ada seorang tuan tanah keturunan Tionghoa. Akhirnya mereka semua di tampung dan dibiarkan mendirikan pondok di sekitar tanah miliknya. Lalu menjelang subuh orang-orang keturunan Tionghoa tersebut bersiap-siap untuk berangkat ke pasar Depok.&amp;rdquo;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;Kampung Bojong berubah nama menjadi kampung Pondok Cina pada tahun 1918. Masyarakat sekitar daerah tersebut selalu menyebut kampung Bojong dengan sebutan Pondok Cina. Lama-kelamaan nama Kampung Bojong hilang dan timbul sebutan Pondok Cina sampai sekarang. Masih menurut cerita, Pondok Cina dulunya hanya berupa hutan karet dan sawah. Yang tinggal di daerah tersebut hanya berjumlah lima kepala keluarga, itu pun semuanya orang keturunan Tionghoa. Selain berdagang ada juga yang bekerja sebagai petani di sawah sendiri. Sebagian lagi bekerja di ladang kebun karet milik tuan tanah orang-orang Belanda. Semakin lama, beberapa kepala keluarga itu pindah ke tempat lain. Tak diketahui pasti apa alasannya. Yang jelas, hanya sisa satu orang keluarga di sana. Hal ini dikatakan oleh Ibu Sri, generasi kelima dari keluarga yang sampai kini masih tinggal di Pondok Cina.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&amp;ldquo;Saya sangat senang tinggal disini, karena di sini aman, tidak seperti di tempat lain,&amp;rdquo;. Dulunya, cerita Sri, penduduk di Pondok Cina sangat sedikit. Itupun masih terbilang keluarga semua. &amp;ldquo;Mungkin karena Depok berkembang, daerah ini jadi ikut ramai,&amp;rdquo; kenangnya. Satu-persatu keluarganya mulai pindah ke tempat lain.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&amp;ldquo;Tinggal saya sendiri yang masih bertahan disini,&amp;rdquo; kata ibu Sri lagi. Sekarang daerah Pondok Cina sudah semakin padat. Ditambah lagi dengan berdirinya kampus UI Depok pada pertengahan 80-an, di kawasan ini banyak berdiri rumah kost bagi mahasiswa. Toko-toko pun menjamur di sepanjang jalan Margonda Raya yang melintasi daerah Pondok Cina ini. Bahkan pada jam-jam berangkat atau pulang kerja, jalan Margonda terkesan semrawut. Maklum, karena itu tadi, pegawai maupun karyawan yang tinggal di Depok mau tak mau harus melintas di Pondok Cina.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#ff6600&quot;&gt;ASAL USUL MARGONDA&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;Margonda yang kini menjadi nama jalan protokol dan pusat bisnis di Depok itu tidak diketahui persis asal muasalnya. Konon, nama itu berasal dari nama seorang pahlawan yang bernama Margonda. Keluarga yang mengklaim sebagai anak keturunan Margonda sendiri (di Cipayung, Depok) sampai sekarang belum dapat memberikan informasi mengenai sepak terjang atau lokasi makam Margonda. Yang jelas, nama Margonda kini identik dengan Depok. Sebut saja &amp;ldquo;Margonda&amp;rdquo;, maka pasti orang akan mengasosiasikannya dengan &amp;ldquo;Depok&amp;rdquo;, beserta segala hiruk-pikuk aktivitasnya yang kian terus berkembang.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', NULL, 'Y', 19, '2', 'fa fa-line-chart', NULL, 'Y', NULL, NULL, NULL, NULL, '2017-05-07 20:54:43', 'Administrator'),
(5, NULL, NULL, 'Struktur Organisasi', 'Struktur Organisasi Kearsipan Pemerintah Kota Depok', NULL, NULL, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://dkp.digitalfatih.com/uploads/STRUKTUR-ORGANISASI.png&quot; style=&quot;height:688px; width:718px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Berdasarkan Peraturan Walikota Depok Nomor 79 Tahun 2016 tentang Kedudukan, Susunan Organisasi, Tugas dan Fungsi&amp;nbsp; Serta Tata Kerja Dinas Kearsipan dan Perpustakaan.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', NULL, 'Y', 42, '2', 'fa fa-cubes', NULL, 'Y', NULL, NULL, NULL, NULL, '2017-09-11 15:13:54', '');
INSERT INTO `sys_fe_content` (`fe_content_id`, `fe_img_files`, `fe_img_files2`, `fe_content_title`, `fe_content_short_desc`, `fe_content_short_desc2`, `fe_content_short_desc3`, `fe_full_content`, `fe_content_btn_label`, `fe_content_btn_url`, `fe_link_clickable`, `fe_content_sort_order`, `fe_section_name`, `fe_content_icon`, `fe_sosmed`, `status_active`, `display_start_from`, `display_until`, `create_date`, `create_by`, `update_date`, `update_by`) VALUES
(6, 'features22.jpg', NULL, 'Tugas Pokok Dan Fungsi', 'Tugas seluruh pejabat di lingkungan Dinas Kearsipan Pemerintah Kota Depok', NULL, NULL, '&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;KEPALA DINAS&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Kepala Dinas mempunyai tugas melaksanakan urusan Pemerintahan dan tugas pembantuan dibidang Kearsipan dan Perpustakaan.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Untuk melaksanakan tugas sebagaimana dimaksud pada ayat (1), Kepala Dinas menyelenggarakan fungsi :&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Pembinaan, Pengawasan dan Pengendalian Penyusunan Rencana Strategis (Renstra) Dinas sesuai dengan Rencana Pembangunan Jangka Menengah Daerah (RPJMD);&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Pelaksanaan dan Perumusan bahan Kebijakan, penyelenggaraan, Pemantauan dan Evaluasi, Pembinaan di bidang Kearsipan dan Perpustakaan;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Pembinaan, Pengawasan dan Pengendalian urusan Kesekretariatan, Kepegawaian dan rumah tangga Dinas;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Pembinaan, Pengawasan dan Pengendalian Kegiatan bidang teknis meliputi bidang Kearsipan dan Perpustakaan;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Pembinaan Pengawasan dan Pengendalian Penggunaan Anggaran Dinas;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Pembinaan, pengawasan dan pengendalian Akuntabilitas Kinerja Instansi Pemerintah (AKIP);&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Pelaksanaan tugas lain yang diberikan Walikota sesuai dengan bidang tugasnya.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;SEKRETARIAT&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Sekretariat mempunyai tugas melaksanakan Administrasi umum, Pengkoordinasian Perencanaan dan Evaluasi serta Pengelolaan Keuangan Dinas.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Untuk melaksanakan Tugas Pokok sebagaimana dimaksud pada ayat (1), Sekretariat menyelenggarakan fungsi :&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyusunan Program Kerja Sekretariat sesuai dengan Renstra Dinas;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penghimpunan dan Pengolahan Data, Penyusunan Renstra Dinas;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyelenggaraan Administrasi Umum;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyusunan Evaluasi dan laporan;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyelenggaraan upaya pemecahan masalah Sekretariat;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pengkoordinasian upaya pemecahan masalah kesekretariatan dan Dinas;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyelenggaraan Perencanaan, Pelaksanaan, pengendalian, Evaluasi dan Pelaporan kegiatan Sekretariat;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pengkoordinasian Perencanaan, pelaksanaan, pengendalian, Evaluasi dan pelaporan kegiatan Dinas;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyelenggaraan urusan umum, kepegawaian, kerumahtanggaan dan Asset Dinas;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pengelolaan Keuangan Dinas;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyelenggaraan Analisis dan Pengembangan Kinerja Sekretariat;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pengkoordinasian Analisis dan pengembangan Kinerja Dinas; dan&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan tugas-tugas lain sesuai bidang tugasnya yang diberikan oleh Pimpinan.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Sekretariat terdiri dari :&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Sub Bagian Umum, Perencanaan, Evaluasi dan Pelaporan;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Sub Bagian Keuangan.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Sub Bagian Umum, Perencanaan, Evaluasi dan Pelaporan&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Sub Bagian Umum, Perencanaan, Evaluasi dan Pelaporan sebagaimana dimaksud dalam Pasal 6 huruf a, mempunyai Tugas Pokok melaksanakan Pengelolaan Administrasi umum, Perencanaan, Evaluasi dan pelaporan Kegiatan Dinas.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Untuk melaksanakan tugas sebagaimana dimaksud pada ayat (1), Sub Bagian Umum, Perencanaan, Evaluasi dan Pelaporan mempunyai fungsi :&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyusunan Program Kerja Sub Bagian sesuai dengan Program Kerja Sekretariat;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pengumpulan, Pengolahan Data dan Informasi, menginventarisasi Permasalahan-permasalahan serta melaksanakan pemecahan permasalahan yang berkaitan dengan tugas-tugas urusan umum dan Perencanaan Evaluasi serta pelaporan;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;perencanaan, pelaksanaan, pengendalian, Evaluasi dan pelaporan kegiatan Sub Bagian;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Administrasi Kepegawaian;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan pemberian pelayanan Naskah Dinas, kearsipan, perpustakaan, komunikasi, pengetikan/penggandaan/pendistribusian serta penerimaan tamu, kehumasan dan Protokoler;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Kebutuhan dan perawatan Sarana/Prasarana serta kebersihan Kantor dan Lingkungan;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan pemberian Infomasi dan Komunikasi;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pengelolaan Perpustakaan Dinas;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pengkoordinasian penyusunan bahan-bahan Kebijakan dari Bidang;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Pengurusan Perjalanan Dinas, kendaraan Dinas, Keamanan Kantor serta pelayanan kerumahtanggaan yang lainnya;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyiapan bahan Koordinasi dan Petunjuk Teknis Kebutuhan, Pengadaan, Inventarisasi, Pendistribusian, penyimpanan, perawatan dan penghapusan Perlengkapan/Sarana Kerja Dinas;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyelenggaraan Analisis dan pengembangan Kinerja Sub Bagian dan Pengkoordinasian Analisis dan pengembangan Kinerja Dinas;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan penyusunan Renstra Dinas;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Penyusunan Rencana Anggaran Dinas;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyusunan Program Kerja tahunan Dinas;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyusunan Rancangan produk hukum Dinas;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyusunan Laporan Akuntabilitas Kinerja Instansi Pemerintah (LAKIP) Dinas;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Analisis dan pengembangan Kinerja Sub Bagian; dan&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan tugas lain sesuai bidang tugasnya yang diberikan oleh Sekretaris.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Sub Bagian Keuangan&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Sub Bagian Keuangan mempunyai tugas melaksanakan Pengelolaan Keuangan Dinas.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Untuk melaksanakan tugas sebagaimana dimaksud pada ayat (1), Sub Bagian Keuangan menyelenggarakan fungsi :&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pengumpulan, Pengolahan Data dan Informasi, Inventarisasi Permasalahan-permasalahan serta melaksanakan pemecahan permasalahan yang berkaitan dengan urusan Keuangan;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;perencanaan, pelaksanaan, pengendalian, Evaluasi dan pelaporan Kegiatan Sub Bagian;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyiapan bahan Kebijakan dan Petunjuk Teknis yang berkaitan dengan urusan Keuangan, penatausahaan Administrasi keuangan yang meliputi Evaluasi Semesteran, Verifikasi dan Pertanggungjawaban;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyimpanan berkas-berkas Keuangan dan pengadministrasian Dokumen dalam rangka pelayanan Administrasi Keuangan di Lingkungan Dinas;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Analisis dan pengembangan Kinerja Sub Bagian; dan&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan tugas lain sesuai bidang tugasnya yang diberikan oleh Sekretaris.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;BIDANG PENGELOLAAN ARSIP&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Bidang Pengelolaan Arsip mempunyai tugas melaksanakan urusan Pemerintahan dibidang Pengelolaan Arsip Dinamis dan Arsip Statis.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Untuk menyelenggarakan tugas sebagaimana dimaksud pada ayat (1), Bidang Pengelolaan Arsip menyelenggarakan fungsi:&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan penyusunan Rencana Kerja mengacu pada Rencana Strategis Dinas;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyiapan dan perumusan bahan Kebijakan Teknis dan Petunjuk Teknis Pengelolaan Kearsipan;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Koordinasi Kearsipan tingkat Kota serta Dinas Instansi terkait;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Pengelolaan arsip Dinamis dan Arsip Statis;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pengawasan dan Pengendalian Kegiatan Pengelolaan Arsip Dinamis dan Arsip Statis;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pengelolaan Arsip Vital dan Asset kota;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan alih Media dan Reproduksi Arsip Dinamis;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Penyusutan Arsip Inaktif dengan Retensi 10 tahun atau lebih dan Arsip Statis;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan penyerahan Arsip;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan pemindahan Arsip;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Koordinasi pemusnahan Arsip;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Preservasi Arsip;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan tugas kedinasan lainnya yang diberikan Pimpinan sesuai dengan bidang tugasnya yang diberikan oleh Kepala Dinas.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Bidang Pengelolaan Arsip terdiri dari :&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Seksi Pengelolaan Arsip Dinamis;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Seksi Pengelolaan Arsip Statis.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Seksi Pengelolaan Arsip Dinamis&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Seksi Pengelolaan Arsip Dinamis sebagaimana dimaksud dalam Pasal 10 huruf a, mempunyai tugas melaksanakan urusan pemerintahan dibidang Pengelolaan Arsip Dinamis.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Untuk melaksanakan tugas sebagaimana dimaksud pada ayat (1), Seksi Pengelolaan Arsip Dinamis menyelenggarakan fungsi :&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyusunan Kebijakan, Norma, Standar dan Pedoman Penyelenggaraan Arsip Dinamis di Lingkungan Kota berdasarkan Kebijakan Kearsipan Nasional;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;perencanaan kegiatan mengacu pada Rencana kerja bidang Pengelolaan Arsip;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;fasilitasi Pengelolaan Arsip Dinamis aktif oleh masingmasing Perangkat Daerah;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;fasilitasi Pengelolaan Arsip Dinamis Inaktif dengan Retensi kurang dari 10 tahun oleh masing-masing Perangkat Daerah;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Koordinasi pemusnahan Arsip di setiap perangkat daerah;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyerahan arsip Inaktif dengan Retensi paling kurang10 (sepuluh) tahun atau lebih oleh masing-masing Perangkat Daerah Kepada LKD;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan pemeliharaan dan penyimpanan Arsip Inaktif paling kurang 10 (sepuluh) tahun atau lebih;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Identifikasi arsip Vital dan Arsip Asset Nasional;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan perlindungan dan pengamanan Arsip Vital dan Arsip Asset Nasional;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan penyelamatan arsip Vital dan Arsip Asset Nasional;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Alih Media Arsip Vital, arsip aset, dan Arsip inaktif;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Reproduksi Arsip Vital, Arsip Asset, dan Arsip inaktif;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Pemusnahan Arsip di LKD;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Evaluasi penyelenggaraan Arsip Dinamis; dan&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan tugas kedinasan lainnya yang diberikan Pimpinan sesuai dengan bidang tugasnya yang diberikan oleh Kepala Bidang.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Seksi Pengelolaan Arsip Statis&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Seksi Pengelolaan Arsip Statis mempunyai tugas melaksanakan urusan pemerintahan dibidang Pengelolaan Arsip Statis.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Untuk melaksanakan tugas sebagaimana dimaksud pada ayat (1), Seksi Pengelolaan Arsip Statis menyelenggarakan fungsi :&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyusunan Kebijakan, Norma, Standar dan Pedoman penyelenggaraan Arsip Statis;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyusunan dan Perumusan bahan Kebijakan Pelestarian Koleksi Daerah Kota berdasarkan Kebijakan Nasional;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;perencanaan kegiatan mengacu pada Rencana Kerja bidang Pengelolaan Arsip;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyerahan Arsip Statis dari masing-masing Perangkat Daeah kepada LKD;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Monitoring, Penilaian dan Verifikasi terhadap Fisik Arsip dan Daftar Arsip;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan persiapan Penetapan Status Arsip Statis;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;mengusulkan pemusnahan Arsip dan Akuisisi Arsip;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan persiapan penyerahan Arsip Statis;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan penelusuran Arsip Statis;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyiapan bahan dalam rangka Penerbitan Naskah Sumber Arsip;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penerimaan fisik arsip dan daftar arsip;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Penataan Informasi Arsip Statis;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan penataan Fisik Arsip Statis;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyusunan guide, daftar dan Inventaris arsip statis;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan penyimpanan, pemeliharaan dan perlindungan arsip Statis;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan perawatan dan perbaikan Arsip Statis serta penyelamatan Arsip Statis akibat Bencana;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan alih Media dan Reproduksi Arsip Statis;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan pengujian Autentisitas Arsip Statis;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan tugas kedinasan lainnya yang diberikan pimpinan sesuai dengan bidang tugasnya yang diberikan oleh Kepala Bidang.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;BIDANG PEMBINAAN, LAYANAN, PEMANFAATAN DAN JASA KEARSIPAN&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Bidang Pembinaan, Layanan, Pemanfaatan dan Jasa Kearsipan mempunyai tugas melaksanakan urusan Pemerintahan dibidang Pembinaan Layanan dan Informasi Kearsipan.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Untuk melaksanakan Tugas sebagaimana dimaksud pada ayat (1), Bidang Pembinaan, Layanan, Pemanfaatan dan Jasa Kearsipan menyelenggarakan fungsi :&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Penyusunan Rencana Kerja mengacu pada Rencana Strategis Dinas;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyiapan dan Perumusan bahan Kebijakan Teknis dan petunjuk Teknis Pembinaan Kearsipan;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Koordinasi Kearsipan Tingkat Kota serta Dinas Instansi terkait;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Pembinaan Kearsipan pada Perangkat Daerah, Kelurahan, Unit Pelaksana Teknis (UPT), Badan Usaha Milik Daerah, Lembaga Pendidikan, Organisasi Masyarakat, Organisasi Politik dan Masyarakat;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Pembinaan SDM Kearsipan (Arsiparis dan Pengelola Kearsipan);&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Pengawasan dan Supervisi terhadap penyelenggaraan Kearsipan;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan layanan Informasi Kearsipan;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan pemanfaatan Arsip Statis;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Kerjasama dan Jaringan Kearsipan;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Otomasi kearsipan;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan layanan kearsipan berbasis Teknologi Informasi dan Komunikasi;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Jasa Kearsipan.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Bidang Pembinaan, Layanan, Pemanfaatan dan Jasa Kearsipan terdiri dari :&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Seksi Pembinaan Kearsipan;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Seksi Layanan, Pemanfaatan dan Jasa Kearsipan.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Seksi Pembinaan Kearsipan&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Seksi Pembinaan Kearsipan mempunyai tugas melaksanakan urusan Pemerintahan dibidang Pembinaan Kearsipan.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Untuk melaksanakan tugas sebagaimana dimaksud pada ayat (1), Seksi Pembinaan Kearsipan menyelenggarakan fungsi :&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyusunan Kebijakan, Norma, Standar dan Pedoman penyelenggaraan Pembinaan Kearsipan di Lingkungan Kota berdasarkan Kebijakan Kearsipan Nasional;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyusunan Kebijakan, Norma, Standar dan Pedoman pengembangan Sumber Daya Manusia di Lingkungan kota berdasarkan Kebijakan Kearsipan Nasional;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyusunan Kebijakan, Norma, Standar dan Pedoman pengembangan jabatan fungsional Arsiparis di Lingkungan Kota berdasarkan kebijakan kearsipan Nasional;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;perencanaan Kegiatan mengacu pada Rencana Kerja bidang pembinaan Kearsipan;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan bimbingan Teknis dan Sosialisasi pelaksanaan kearsipan pada Perangkat Daerah, Kelurahan, Unit Pelaksana Teknis (UPT), Lembaga Pendidikan, Organisasi Masyarakat, Organisasi Politik dan Masyarakat;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Supervisi, Konsultasi dan evaluasi pelaksanaan Kearsipan Perangkat Daerah, Kelurahan, Unit Pelaksana Teknis (UPT), Lembaga Pendidikan, Organisasi Masyarakat, Organisasi Politik dan Masyarakat;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;melaksanakan Bimbingan Teknis dan pengembangan SDM kearsipan;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan tugas kedinasan lainnya yang diberikan Pimpinan sesuai dengan bidang tugasnya yang diberikan oleh Kepala Bidang.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Seksi Layanan, Pemanfaatan dan Jasa Kearsipan&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Seksi Layanan, Pemanfaatan dan Jasa Kearsipan mempunyai tugas melaksanakan urusan Pemerintahan dibidang Layanan Informasi dan Jasa Kearsipan.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Untuk melaksanakan tugas sebagaimana dimaksud pada ayat (1), Seksi Layanan, Pemanfaatan dan Jasa Kearsipan menyelenggarakan fungsi :&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyusunan Kebijakan, Norma, Standar dan Pedoman penyelenggaraan Sistem dan Jaringan Kearsipan di Lingkungan Kota berdasarkan kebijakan Kearsipan Nasional;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyusunan kebijakan, Norma, Standar dan Pedoman penyelenggaraan layanan Informasi Kearsipan di Lingkungan Kota berdasarkan Kebijakan Kearsipan Nasional;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;penyusunan Kebijakan, Norma, Standar dan Pedoman penyelenggaraan jasa Kearsipan di Lingkungan Kota berdasarkan Kebijakan Kearsipan Nasional;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;perencanaan kegiatan mengacu pada Rencana Kerja bidang Pembinaan Kearsipan;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Pengumpulan Data dan Informasi Kearsipan;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan penyajian Arsip menjadi Informasi;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan layanan Arsip Dinamis berbasis TIK;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan layanan Arsip Statis berbasis TIK;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pengelolaan SIKN JIKN;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pengelolaan Otomasi kearsipan;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pengelolaan pengaduan masyarakat;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Kerjasama dan Jaringan Kearsipan;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan upaya Pemecahan masalah yang berkaitan dengan Otomasi Kearsipan;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Layanan Jasa Sistem dan Penataan Arsip;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan layanan Jasa pembuatan Sistem Manual kearsipan dan Otomasi Kearsipan;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan Layanan Jasa penyimpanan Arsip;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;pelaksanaan pemanfaatan Arsip (pameran, penelitian, dll).&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n', '', NULL, 'Y', 24, '2', 'fa fa-pie-chart', NULL, 'Y', NULL, NULL, NULL, NULL, '2017-05-12 16:50:39', 'Administrator');
INSERT INTO `sys_fe_content` (`fe_content_id`, `fe_img_files`, `fe_img_files2`, `fe_content_title`, `fe_content_short_desc`, `fe_content_short_desc2`, `fe_content_short_desc3`, `fe_full_content`, `fe_content_btn_label`, `fe_content_btn_url`, `fe_link_clickable`, `fe_content_sort_order`, `fe_section_name`, `fe_content_icon`, `fe_sosmed`, `status_active`, `display_start_from`, `display_until`, `create_date`, `create_by`, `update_date`, `update_by`) VALUES
(7, 'features9.png', NULL, 'Visi Dan Misi', '', NULL, NULL, '&lt;p&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;&lt;strong&gt;Visi &lt;/strong&gt;: Mewujudkan Dinas Kearsipan dan&amp;nbsp; Perpustakaan&amp;nbsp; menjad i&amp;nbsp; yang terunggul&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Misi&lt;/strong&gt;:&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;; font-size:11.0pt&quot;&gt;Mengembangkan pengeloalaan kearsipan yang berkualitas&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;; font-size:11.0pt&quot;&gt;Memasyarakatkan pentingnya kearsipan&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', NULL, 'Y', 29, '2', 'fa fa-pie-chart', NULL, 'Y', NULL, NULL, NULL, NULL, '2017-05-18 11:49:25', 'Administrator'),
(8, 'template8.jpg', NULL, 'Kami Siap Membantu Anda', 'Dinas Kearsipan dan Perpustakaan Kota Depok - Kami Siap Membantu Anda', NULL, NULL, '&lt;p&gt;Dinas Kearsipan dan Perpustakaan Kota Depok - Kami Siap Membantu Anda&lt;/p&gt;\r\n', '-', 'www.com', 'Y', 6, '3', NULL, NULL, 'Y', NULL, NULL, NULL, NULL, '2017-09-12 09:19:02', ''),
(9, NULL, NULL, 'SERTIFIKASI SDM KEARSIPAN', 'Sertifikasi Jabatan Fungsional Arsiparis adalah proses pemberian sertifikat', 'UX design', NULL, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://dkp.digitalfatih.com/uploads/download_(4).jpg&quot; style=&quot;float:left; height:267px; width:400px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://dkp.digitalfatih.com/uploads/download_(5).jpg&quot; style=&quot;height:267px; width:400px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Sertifikasi Jabatan Fungsional Arsiparis adalah proses pemberian sertifikat kompetensi kearsipan kepada Arsiparis PNS yang dilakukan secara sistematis dan obyektif melalui uji kompetensi yang mengacu pada Standar Kompetensi Jabatan Fungsional Arsiparis.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Sasaran Sertifikasi Jabatan Fungsional Arsiparis adalah PNS yang menduduki jabatan fungsional Arsiparispada Lembaga Negara, Pemerintahan Daerah, dan PTN.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#333333&quot;&gt;Sertifikasi Jabatan Fungsional Arsiparis bertujuan untuk:&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;menjamin mutu penyelenggaraan kearsipan secara nasional;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;menjamin profesionalitas Arsiparis;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;memelihara, meningkatkan, dan melindungi kompetensi Jabatan Fungsional Arsiparis;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;mengembangkan profesi Arsiparis; dan&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;memberikan pengakuan formal terhadap kompetensi Jabatan Fungsional Arsiparis.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#333333&quot;&gt;Jenis Sertifikasi Jabatan Fungsional Arsiparis terdiri atas:&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Sertifikasi Jabatan Fungsional Arsiparis dalam rangka penyesuaian ke dalam Jabatan Fungsional Arsiparis (&lt;em&gt;inpassing&lt;/em&gt;);&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Sertifikasi Jabatan Fungsional Arsiparis Kategori Keterampilan dan Kategori Keahlian dalam rangka kenaikan jenjang jabatan setingkat lebih tinggi;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Sertifikasi Jabatan Fungsional Arsiparis dalam rangka Alih Jabatan dari Kategori Keterampilan ke Kategori Keahlian;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Sertifikasi Jabatan Fungsional Arsiparis dalam rangka pengangkatan kembali bagi PNS ke dalam Jabatan Fungsional Arsiparis Kategori Keterampilan;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Sertifikasi Jabatan Fungsional Arsiparis dalam rangka pengangkatan kembali bagi PNS ke dalam Jabatan Fungsional Arsiparis Kategori Keahlian;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Sertifikasi Jabatan Fungsional Arsiparisdalam rangka perpindahan jabatan dari Jabatan Struktural ke dalam Jabatan Fungsional Arsiparis.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Sertifikasi Jabatan Fungsional Arsiparisdalam rangka perpindahan jabatan dari pejabat fungsional tertentu lainnya ke dalam Jabatan Fungsional Arsiparis Kategori Keterampilan dan Kategori Keahlian.&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', NULL, 'Y', 25, '4', 'fa fa-line-chart', NULL, 'Y', NULL, NULL, NULL, NULL, '2017-09-11 15:11:53', ''),
(10, NULL, NULL, 'PUBLIKASI ARSIP STATIS', '', 'UI design', NULL, '&lt;p style=&quot;text-align:justify&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Arial&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Publikasi Arsip Statis&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Arial&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Buku Digging4Data adalah merupaka panduan praktis bagaimana cara mencari data dalam arsip, khususnya arsip kearsitekturan. Digging4Data ditujukan untuk semua orang yang teretarik melakukan penelitian, namun secara khusus bagi mereka yang terlibat dalam proyek-proyek peninggalan sejarah, meliputi: Arsitek; Perencara Kota; Pejabat Pemerintah; Peneliti dari beragam latarbelakang. Panduan ini menjelaskan sejumlah metode mengenai penelitian arsitektur pada masa Kolonial Belanda (1620-1950); menyediakan informasi mengenai sumber informasi pendukung dan lembaga-lembaga yang memberikan informasi historis; menyediakan alat dan metode pengumpulan data dan informasi histori.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Arial&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Daftar Inventaris Arsip&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;:&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:#b3e0e6&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;DAFTAR FOTOCOPY ARSIP ALGEMEENE RIJKSARCHIEF (ARA) BELANDA&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;PERHIMPUNAN KEAGAMAAN&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;A.1 &amp;nbsp;&amp;nbsp;Ahmadijah Congress&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;A.2 &amp;nbsp;&amp;nbsp;Sumatera Thawalib&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;A.3 &amp;nbsp;&amp;nbsp;Al-Islam Commite Congress&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;A.4 &amp;nbsp;&amp;nbsp;Madjelis Oelama Indonesia Persatoean Islam&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;A.5 &amp;nbsp;&amp;nbsp;Perserikatan Oelama&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;A.6 &amp;nbsp;&amp;nbsp;PSII Congress&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;A.7 &amp;nbsp;&amp;nbsp;PSII Congress&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;A.8 &amp;nbsp;&amp;nbsp;PSII Congress&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;A.9&amp;nbsp; &amp;nbsp;Moehammadijah&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;A.10 Moehammedaansch-God Dienstige-Geschriften&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;A.11 Moehammadijah&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;A.12 Moehammadijah&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;A.13 Moehammadijah&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;A.14 Tidak ada&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;A.15 Tidak ada&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;A.16 Moehammadijah&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;A.17 Moehammadijah&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;A.18 Moehammadijah&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;A.19 Ir. Soekarno en Moehammadijah&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;A.20 Ir. Soekarno en Moehammadijah&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;PERHIMPUNAN PENDIDIKAN&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;B.21 Taman Siswa School, Jogjakarta&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;B.22 RD. Soedarno, Taman Siswa School&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;B.23 Taman Siswa, Conferentie te Jogjakarta&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;B.24 Taman Siswo&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;B.25 Taman Siswa Conferentie, April 1936&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;B.26 Verslag Congress, Taman Siswa Scholen&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;B.27 Loonbelasting Berkrahten, Taman Siswa Scholen&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;B.28 Taman Siswa Scholen&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;B.29 Ksatrian Institut, Bandoeng&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;B.30 Handel School, Ksatrian Institut, Bandoeng&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;B.31 Ksatrian Insituut&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;B.32 Onderwijzersvergunning, Douwes Dekker&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;B.33 Het geven van Onderwijs, door Douwes Dekker&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;B.34 Het geven van Onderwijs, door Douwes Dekker&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;B.35 Indlandsche Scholen&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;B.36 Onderwijs te Preanger-Regentschappen&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;B.37 Goddienstig-Politieke beweging en Scholen&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;B.38 Goeroe Ordonanntie, buiten gewesten&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-size:10.5pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;B.39 Onderwijs voor Inlanders en Vreemde Oosterlingen&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n', '', NULL, 'Y', 26, '4', 'fa fa-cubes', NULL, 'Y', NULL, NULL, NULL, NULL, '2017-09-11 15:27:48', ''),
(11, NULL, NULL, 'PERAWATAN ARSIP PASCA BENCANA', 'ANRI mempunyai program untuk mempreservasi dan meningkatkan aksesibilitas ', 'SEO Services', NULL, '&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;ANRI mempunyai program untuk mempreservasi dan meningkatkan aksesibilitas arsip statis yang merupakan arsip bernilai guna tinggi, salah satunya adalah arsip yang rusak akibat terjadi nya bencana. Salah satu programnya, ANRI mencoba melindungi dan menyelamatkan arsip pascabencana, terutama yang terjadi di dalam Indonesia. Program ini berawal dari tahun 2004 ketika terjadi bencana Tsunami yang menimpa Aceh dan Nias. Bencana Tsunami yang terjadi pada 26 Desember 2004 , merupakan bencana besar, yang tidak hanya menghilangkan nyawa dan material, tetapi sebagian besar arsip ikut hanyut dan hilang. Hal ini juga di alami negara-negara sekitar Indonesia seperti Sri Lanka, Thailand, dan India. Banyak masyarakat yang selamat dari bencana tetapi kehilangan rumahnya. Mereka tidak hanya kehilangan keluarganya, tetapi juga property. Hal inilah yang membangkitkan ANRI untuk menyelamatkan sertifikat kepemilikan atas tanah-tanah para korban bencana tsunami ini. Dengan menggunakan tehnologi&amp;nbsp;&lt;/span&gt;&lt;em&gt;Vacum Freeze Dry Chamber&lt;/em&gt;&amp;nbsp;yang merupakan bantuan dari Jepang ANRI dapat menyelamatkan arsip-arsip yang terkena bencana ini. Program ini akhirnya berlanjut sampai sekarang.&lt;br /&gt;\r\n&lt;img alt=&quot;&quot; src=&quot;http://dkp.pastech.id/uploads/index.jpg&quot; style=&quot;height:257px; width:386px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Selain itu, pada tahun 2013, ANRI juga mulai memberikan layanan perbaikan akibat bencana banjir kepada masyarakat di wilayah Jakarta, Bogor, Depok dan Tanggerang secara gratis. Dalam program ini masyarakat secara individu dapat memperbaikin arsipnya dengan cara datang langsung ke kantor ANRI, jalan Ampera Raya nomor 7 Jakarta Selatan.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Untuk informasi lebih lanjut tentang layanan perawatan arsip pascabencana dapat menghubungi nomor telp. (021) 7805851 ext. 406&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:8px&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://dkp.pastech.id/uploads/indexa.jpg&quot; style=&quot;height:258px; width:387px&quot; /&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', NULL, 'Y', 20, '4', 'fa fa-pie-chart', NULL, 'Y', NULL, NULL, NULL, NULL, '2017-05-07 20:52:23', 'Administrator'),
(12, NULL, NULL, 'KUNJUNGAN KELEMBAGAAN', 'Kegiatan Kunjungan Kelembagaan Dinas Arsip Pemerintah Kota Depok ke Kantor ', 'SEO Services', NULL, '&lt;p&gt;Kegiatan Kunjungan Kelembagaan Dinas Arsip Pemerintah Kota Depok ke Kantor Pusat ANRI Jakarta Selatan&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://dkp.digitalfatih.com/uploads/download.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://dkp.digitalfatih.com/uploads/download_(1)2.jpg&quot; style=&quot;height:691px; width:1037px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://dkp.digitalfatih.com/uploads/download_(2).jpg&quot; style=&quot;height:691px; width:1037px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://dkp.digitalfatih.com/uploads/download_(3).jpg&quot; style=&quot;height:691px; width:1037px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Kunjungan ke Kantor Pusat ANRI Jakarta Selatan, 3 Januari 2017&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', NULL, 'Y', 24, '4', 'fa fa-bar-chart', NULL, 'Y', NULL, NULL, NULL, NULL, '2017-09-11 15:09:01', ''),
(13, NULL, NULL, 'PENGADUAN MASYARAKAT', 'ANRI menerima pengaduan masyarakat berupa', 'Android App', NULL, '&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;strong&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Mekanisme Pengaduan Masyarakat&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;ANRI menerima pengaduan masyarakat berupa&lt;/span&gt;&lt;/span&gt;:&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Keluhan yang bersifat membangun yang mengandung informasi adanya indikasi penyimpangan atau penyalahgunaan wewenang oleh Aparatur Negara atau pihak yang mendapatkan izin atau perjanjian kerja di bidang kearsipan yang dapat mengakibatkan kerugian masyarakat dan negara.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Sumbang saran, kritik, gagasan yang membangun yang mengandung informasi yang bermanfaat bagi perbaikan dalam rangka penyelenggaraan pemerintahan umum, pembangunan dan pelayanan masyarakat di bidang kearsipan.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;strong&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Pengaduan akan dilayani sesuai dengan hari dan jam kerja yang berlaku;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Senin &amp;ndash; Kamis :&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;09:00 &amp;ndash; 15:00&lt;/span&gt;&lt;/span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Istirahat&lt;/span&gt;&lt;/span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; :&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 12:00 &amp;ndash; 13:00&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Jum&amp;#39;at&lt;/span&gt;&lt;/span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; :&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 09:00 &amp;ndash; 15:00&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Istirahat&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; :&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;11:30 &amp;ndash; 13:30&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;br /&gt;\r\n&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Penanganan pengaduan masyarakat diselesaikan dalam jangka waktu 3 bulan terhitung mulai tanggal pengaduan diterima oleh Inspektorat ANRI.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n', '', NULL, 'Y', 23, '4', 'fa fa-language', NULL, 'Y', NULL, NULL, NULL, NULL, '2017-05-07 22:03:14', 'Administrator'),
(14, 'blog14.jpg', NULL, 'LAYANAN PUBLIK', 'Organisasi Pengelola Informasi dan Dokumentasi ANRI dibentuk berdasarkan ', 'Win App', NULL, '&lt;p style=&quot;text-align:justify&quot;&gt;&lt;strong&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Pejabat Pengelola Informasi dan Dokumentasi (PPID)&lt;/span&gt;&lt;/span&gt; &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Organisasi Pengelola Informasi dan Dokumentasi ANRI dibentuk berdasarkan Peraturan Kepala ANRI Nomor HK.01/141/2010. Pembentukan PPID ANRI merupakan pelaksanaan amanat Undang-undang No.14 Tahun 2008 tentang Keterbukaan Informasi Publik yang diselenggarakan dalam rangka;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Menjamin hak warga negara untuk mengetahui rencana pembuatan kebijakan publik, program kebijakan publik, dan proses pengambilan keputusan publik, serta alasan pengambilan suatu keputusan publik&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Mendorong partisipasi masyarakat dalam proses pengambilan kebijakan publik&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Meningkatkan peran aktif masyarakat dalam pengambilan kebijakan publik dan pengelolaan Badan Publik yang baik&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Mewujudkan penyelenggaraan negara yang baik, yaitu yang transparan, efektif dan efisien, akuntabel serta dapat dipertanggungjawabkan&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Mengetahui alasan kebijakan publik yang mempengaruhi hajat hidup orang banyak&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Mengembangkan ilmu pengetahuan dan mencerdaskan kehidupan bangsa&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Meningkatkan pengelolaan dan pelayanan informasi di lingkungan Badan Publik untuk menghasilkan layanan informasi yang berkualitas&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;strong&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Pelayanan Informasi Publik di lingkungan ANRI berdasarkan azas Keterbukaan Informasi Publik yaitu;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Setiap Informasi Publik bersifat terbuka dan dapat diakses oleh setiap Pengguna Informasi Publik&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Informasi Publik yang dikecualikan bersifat ketat dan terbatas&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Setiap Informasi Publik harus dapat diperoleh setiap Pemohon Informasi Publik dengan cepat dan tepat waktu, biaya ringan, dan cara sederhana&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;strong&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Tugas dan Tanggung Jawab PPID ANRI&lt;/span&gt;&lt;/span&gt;;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Mengoordinasikan penyimpanan dan penyediaan seluruh Informasi Publik di lingkungan ANRI&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Mengoordinasikan penyajian dan pelayanan Informasi Publik melalui pengumuman dan/atau permohonan melalui media yang secara efektif dapat menjangkau seluruh pemangku kepentingan&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Melakukan pengujian tentang konsekuensi yang timbul sebagaimana diatur dalam Pasal 19 Undang-Undang KIP sebelum menyatakan Informasi Publik tertentu dikecualikan&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Menyertakan alasan tertulis pengecualian Informasi Publik secara jelas dan tegas, dalam hal permohonan Informasi Publik ditolak&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Menghitamkan atau mengaburkan Informasi Publik yang dikecualikan beserta alasannya&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Mengembangkan kapasitas pejabat fungsional dan/atau petugas informasi dalam rangka peningkatan kualitas layanan Informasi Publik&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;background-color:white&quot;&gt;&lt;span style=&quot;color:#333333&quot;&gt;Mengoordinasikan dan memastikan agar pengajuan keberatan diproses berdasarkan prosedur penyelesaian keberatan apabila permohonan Informasi Publik ditolak&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n', '', NULL, 'Y', 4, '14', 'fa fa-bullseye', NULL, 'Y', NULL, NULL, NULL, NULL, '2017-09-29 14:04:07', ''),
(18, 'works18.jpg', '04.jpg', 'Jurnal Kearsipan dari web ANRI', 'Jurnal kearsipan yang diperoleh dari web ANRI', 'Portfolio Item 4', 'Lorem Ipsum Dolor Sit 4', '&lt;p&gt;Berikut dibawah ini jurnal-jurnal yang diperoleh dari&amp;nbsp;web ANRI :&lt;br /&gt;\r\n&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;table border=&quot;1&quot; cellpadding=&quot;1&quot; cellspacing=&quot;1&quot; style=&quot;width:500px&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;strong&gt;Jurnal&lt;/strong&gt;&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;strong&gt;Tautan&lt;/strong&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Jurnal Vol.6/ANRI/12/2011&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/download/jurnal_vol9_anri_122014.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Jurnal Vol.8/ANRI/12/2013&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/download/jurnal_anri_vol8_12_2013.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Jurnal Vol.7/ANRI/12/2012&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/download/gabungan%20Vol%207%20-%202012.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Jurnal Vol.6/ANRI/12/2011&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/download/vol6_anri_12_2011.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Jurnal Vol.5/ANRI/12/2010&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/download/jurnal%20vol%205%20tahun%202010.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Jurnal Vol.4/ANRI/12/2009&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/download/vol4_jurnal_anri_12_2015.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Jurnal Vol.3/ANRI/12/2008&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/download/jurnal_kearsipan_Jurnal-Vol-3-2008.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Jurnal', NULL, 'Y', 58, '5', NULL, NULL, 'Y', NULL, NULL, NULL, NULL, '2017-05-18 22:57:36', 'Administrator'),
(21, 'works21.jpg', '07.jpg', 'Depok Tempo dulu dan sekarang (18 Mei 2017)', 'Kegiatan kearsipan terkait dengan Depok Tempo dulu dan sekarang', 'Portfolio Item 7', 'Lorem Ipsum Dolor Sit 7', '&lt;p&gt;Kearsipan kota depok mengadakan kegiatan dengan tema &amp;quot;Depok Tempo dulu dan sekarang&amp;quot; yang berlangsung pada tanggal 18 Mei 2017&lt;/p&gt;\r\n', 'Agenda', NULL, 'Y', 61, '5', NULL, NULL, 'Y', NULL, NULL, NULL, NULL, '2017-05-18 23:28:37', 'Administrator'),
(23, '06.jpg', NULL, 'About Us', '', 'Multi Capability', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '&lt;p&gt;Awalnya Depok merupakan sebuah dusun terpencil ditengah hutan belantara dan semak belukar. Pada tanggal 18 Mei 1696 seorang pejabat tinggi VOC,&amp;nbsp;Cornelis Chastelein, membeli tanah yang meliputi daerah Depok serta sedikit wilayah Jakarta Selatan, Ratujaya dan Bojonggede. Chastelein mempekerjakan sekitar seratusan pekerja. Mereka didatangkan dari Bali, Makassar, Nusa Tenggara Timur, Maluku, Jawa, Pulau Rote serta Filipina.&lt;/p&gt;\r\n', 'Learn More', 'www.more.com', 'Y', 3, '6', NULL, NULL, 'Y', NULL, NULL, NULL, NULL, '2017-09-11 23:58:38', ''),
(28, NULL, NULL, 'Get In Touch', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut enim ad minim veniam', NULL, NULL, NULL, NULL, NULL, 'Y', 1, '12', NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'contact29.jpg', NULL, 'Contact', 'Contact Us', NULL, NULL, '&lt;p&gt;&lt;strong&gt;Dinas Kearsipan dan Perpustakaan Kota Depok&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Jl. Margonda Raya No.54, Depok,&lt;br /&gt;\r\nPancoran MAS,&lt;br /&gt;\r\nKota Depok,&lt;br /&gt;\r\nJawa Barat 16431&lt;br /&gt;\r\nTelepon:(021) 77200936&lt;/p&gt;\r\n', '', NULL, 'Y', 12, '15', NULL, NULL, 'Y', NULL, NULL, NULL, NULL, '2017-09-11 16:40:31', ''),
(30, NULL, NULL, '2017 Dinas Kearsipan dan Perpustakaan Kota Depok', NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 1, '16', NULL, 'facebook|www.facebook.com;twitter|www.twitter.com;google-plus|www.google.com;linkedin|www.linkedin.com;pinterest|www.pinterest.com;dribbble|www.dribbble.com;behance|www.behance.com', 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(31, '03.jpg', NULL, 'While now the fated Pequod had been so long afloat this 1', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut enim ad minim veniam', NULL, NULL, 'With a blow from the top-maul Ahab knocked off the steel head of the lance, and then handing to the mate the long iron rod remaining, bade him hold it upright, without its touching off the steel head of the lance, and then handing to the mate the long iron rod remaining. without its touching off the steel without its touching off the steel', NULL, NULL, 'Y', 1, '14', NULL, NULL, 'Y', '2017-03-28 19:16:57', '2017-03-31 19:17:06', '2017-03-28 19:17:21', 'Administrator', NULL, NULL),
(33, '01.jpg', NULL, 'Play list of old bangle music and gajal 3', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut enim ad minim veniam', NULL, NULL, 'With a blow from the top-maul Ahab knocked off the steel head of the lance, and then handing to the steel', NULL, NULL, 'Y', 3, '14', NULL, NULL, 'Y', '2017-03-28 19:20:31', '2017-03-31 19:20:37', '2017-03-28 19:20:42', 'Administrator', NULL, NULL);
INSERT INTO `sys_fe_content` (`fe_content_id`, `fe_img_files`, `fe_img_files2`, `fe_content_title`, `fe_content_short_desc`, `fe_content_short_desc2`, `fe_content_short_desc3`, `fe_full_content`, `fe_content_btn_label`, `fe_content_btn_url`, `fe_link_clickable`, `fe_content_sort_order`, `fe_section_name`, `fe_content_icon`, `fe_sosmed`, `status_active`, `display_start_from`, `display_until`, `create_date`, `create_by`, `update_date`, `update_by`) VALUES
(79, 'works79.jpg', NULL, 'Kantor Arsip Dan Perpustakaan Gelar Lomba Bercerita, Lomba Cerpen, & Lomba Karya Tulis', 'Kantor Arsip Dan Perpustakaan Gelar Lomba Bercerita, Lomba Cerpen...', NULL, NULL, '&lt;p&gt;&lt;strong&gt;Dalam &lt;/strong&gt;rangka meningkatkan &lt;em&gt;minat &lt;/em&gt;baca masyarakat di Kota Depok, Kantor Arsip dan Perpustakaan Kota Depok pada bulan Agustus 2015 ini akan menyelenggarakan lomba bercerita, menulis cerpen, dan karya tulis. Sehubungan dengan hal tersebut Ibu Ima Halimah (Kepala Seksi Perpustakaan) telah bersurat ke Sekolah SD/MI se Kota Depok untuk lomba bercerita dan Cerpen, dan juga ke Sekolah SMA/SMK se Kota Depok untuk lomba karya ilmiah.&lt;/p&gt;\r\n\r\n&lt;p&gt;Adapun tujuan dari lomba ini untuk mengembangkan kemampuan dan membentuk watak serta peradaban bangsa yang bermartabat dalam rangka mencerdaskan kehidupan bangsa dengan tujuan untuk berkembangnya potensi siswa agar menjadi manusia yang beriman dan bertaqwa kepada Tuhan Yang Maha Esa, berakhlak mulia, sehat, berilmu, cakap, kreatif, mandiri, dan menjadi warga negara yang demokratis serta bertanggungjawab.&lt;/p&gt;\r\n\r\n&lt;p&gt;Hasil tulisan paling lambat diterima pada tanggal 21 Agustus 2015 di Kantor Arsip dan Perpustakaan Kota Depok. Dalam lomba bercerita, masing-masing peserta akan tampil pada 20 Agustus 2015. Cerita bersumber dari buku cerita rakyat yang berasal dari daerah atau budaya lokal. Peserta dapat mencari buku tersebut di perpustakaan sekolah, Perpustakaan Umum Kota Depok, atau sumber lainnya.&lt;br /&gt;\r\nPemenang lomba akan diberikan piagam, piala, dan uang pembinaan. Juara I akan mendapatkan Rp3 juta, juara II Rp1,5 juta, dan juara III memperoleh Rp1 juta.&lt;/p&gt;\r\n\r\n&lt;p&gt;Ibu Siti Chaerijah Aurijah selaku Kepala Kantor berharap para pelajar Kota Depok dapat memanfaatkan kesempatan tersebut dengan sebaik mungkin. Pasalnya, selain untuk meningkatkan minat baca, para pemenang lomba terutama juara pertama akan diikutsertakan pada lomba tingkat Provinsi dan Nasional.(afi/kap)&lt;/p&gt;\r\n', 'Berita', NULL, 'Y', 53, '5', NULL, NULL, 'Y', NULL, NULL, '2017-05-02 20:52:58', 'Administrator', '2017-05-18 22:18:27', 'Administrator'),
(90, 'works90.jpg', NULL, 'Seminar Sejarah Kota Depok Berbasis Waktu (1979-1998)', 'Seminar Sejarah Kota Depok Berbasis Waktu (1979-1998)', NULL, NULL, '&lt;p style=&quot;text-align:justify&quot;&gt;Bertempat di Wisma Hijau Cimanggis Depok , Senin (7, September 2015) Kepala kantor Arsip dan Perpustakaan Kota Depok Ibu Siti Chaerijah Aurijah membuka acara Seminar Penelusuran Arsip Sejarah Berbasis Waktu Priode 1970 &amp;ndash; 1998 dengan tema &amp;ldquo; Dengan Penelusuran Sejarah Kota Depok Kita Tingkatkan Kecintaan Terhadap Sejarah Kota Depok. Acara ini di hadiri oleh guru dan siswa Sekolah di Depok, unsur Kecamatan, Anggota DPRD Kota Depok, YLCC, Komunitas Seni Kota Depok, Program Studi Ilmu Sejarah UI, dan Program Studi Ilmu Sejarah Unpad serta tamu undangan lainnya.&lt;br /&gt;\r\nDalam sambutan Kepala Kantor Arsip dan Perpustakaan, Menyampaikan bahwa salah satu Kebanggaan bagi setiap daerah, apabila mengetahui sejarah dan kelahirannya yang memberikan sesuatu makna dan nilai-nilai historis dan yuridis yang harus senantiasa tetap dijaga dan dipertahankan eksistensinya sebagai motivasi moral bagi masyarakatnya. Untuk mengetahui hal tersebut maka itu Kantor Arsip dan Perpustakaan Kota Depok melaksanakan kegiatan penelusuran sejarah bebasis waktu, mulai tahun 1970-1998, lanjutan dari tahun sebelumnya. Dengan Maksud dan tujuan;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;1. Agar tersedianya Dokumen atau sejarah kota Depok&lt;br /&gt;\r\n2. Agar tersedianya pedoman bagi masyarakat dalam mencari dan menelusuri tentang sejarah Depok&lt;br /&gt;\r\n3. Meningkatkan pemahaman pada masyarakat tentang pentingnya sejarah&lt;br /&gt;\r\n4. Agar masyarakat memperoleh informasi sebanyak-banyaknya tentang sejarah Depok.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Dalam kesempatan ini selaku Kepala Seksi Pengelolaan Data Ibu Ermanila juga mengumumkan hasil penilaian lomba &amp;ldquo; Penulisan tentang Sejarah Kota Depok Berbasis Waktu (1979 &amp;ndash; 1998) dengan pemenang sebagai berikut ;&lt;br /&gt;\r\nJuara I&lt;br /&gt;\r\nZahara Muthia Ramadhanti dari SMA I Depok dengan tema &amp;ldquo;Sejarah Perumnas Depok II Timur (1978 &amp;ndash; 1998 )&lt;br /&gt;\r\nJuara II&lt;br /&gt;\r\nShinta Farida SMAN V Depok &amp;ldquo; Peran Perumnas I Depok Dalam kemajuan Kota Depok 1974 &amp;ndash; 2015 )&lt;br /&gt;\r\nJuara III&lt;br /&gt;\r\nMuhammad Alnoza SMA VIII &amp;ldquo;Penulisan Sejarah Kota Depok Berdasarkan Periodesasi antara 1970 &amp;ndash; 1998/1999 )&lt;br /&gt;\r\nJuara Harapan I&lt;br /&gt;\r\nLulu Urrohmah SMAN IV Depok &amp;ldquo;Sejarah dan Perkembangan Kota Depok&amp;rdquo;&lt;br /&gt;\r\nAdapun yang menjadi Juri dan Narasumber Mumuh Muhsin Z., M.Hum, R.M Lucky Mulyadi,M.Hum Dosen Sejarah dari Universitas Padjajaran Bandung, dan Ibu Linda Sunarti, M.Hum dari Program Studi Sejarah Universitas Indonesia dan H. Nawawi dari Tokoh Masyarakat Kota Depok.&lt;br /&gt;\r\nDi harapkan melalui acara perlombaan penulisan tentang sejarah Depok ini dapat meningkatkan kecintaannya terhadap Depok khususnya pelajar di Kota Depok sebagai generasi penerus bangsa. (Afi-KAP)&lt;/p&gt;\r\n', 'Pengumuman', NULL, 'Y', 60, '5', NULL, NULL, 'Y', NULL, NULL, '2017-05-07 10:14:17', 'Administrator', '2017-05-18 23:10:09', 'Administrator'),
(93, '14.jpeg', NULL, 'Keputusan Kepala ANRI', 'Keputusan Kepala ANRI terkait Kearsipan', NULL, NULL, '&lt;h2&gt;PERATURAN KEPALA ANRI&lt;/h2&gt;\r\n\r\n&lt;table&gt;\r\n	&lt;thead&gt;\r\n		&lt;tr&gt;\r\n			&lt;th&gt;Judul&lt;/th&gt;\r\n			&lt;th&gt;\r\n			&lt;p&gt;Tahun&lt;/p&gt;\r\n			&lt;/th&gt;\r\n			&lt;th&gt;\r\n			&lt;p&gt;Download&lt;/p&gt;\r\n			&lt;/th&gt;\r\n			&lt;th&gt;&amp;nbsp;&lt;/th&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/thead&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PERKA ANRI NO 7 TAHUN 2017 TENTANG GERAKAN NASIONAL SADAR TERTIB ARSIP&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2017&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;89&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/Perka_7_2017.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PERKA ANRI NO 6 TAHUN 2017 TENTANG TATA CARA PENGANGKATAN PEGAWAI NEGERI SIPIL DALAM JABATAN FUNGSIONAL ARSIPARIS MELALUI PENYESUAIAN/INPASSING&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2017&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;74&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/Perka_6_2017_.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PERKA NO 5 TAHUN 2017 TENTANG PEDOMAN PENILAIAN PRESTASI KERJA JABATAN FUNGSIONAL ARSIPARIS&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2017&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;0&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PERKA ANRI NO 4 TAHUN 2017 TENTANG PELAKSANAAN TUGAS JABATAN FUNGSIONAL ARSIPARIS&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2017&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;108&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/Perka_4_2017.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PERKA ANRI NO 3 TAHUN 2017 TENTANG PERUBAHAN ATAS PERATURAN KEPALA ARSIP NASIONAL REPUBLIK INDONESIA NOMOR 40 TAHUN 2015 TENTANG RENCANA STRATEGIS ARSIP NASIONAL REPUBLIK INDONESIA TAHUN 2015-2019&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2017&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;66&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/Perka%20_3_2017.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PERKA ANRI NO 2 TAHUN 2017 TENTANG ORGANISASI DAN TATA KERJA BALAI ARSIP STATIS DAN TSUNAMI&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2017&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;55&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/Perka_2_2017.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PERKA ANRI NO 1 TAHUN 2017 TENTANG KODE ETIK PEGAWAI ARSIP NASIONAL REPUBLIK INDONESIA&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2017&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;89&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/Perka%20_1_2017.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PERKA ANRI NO 28 TAHUN 2016 TENTANG PERUBAHAN KEDUA ATAS PERKA ANRI NO 6 TAHUN 2013 TENTANG PEDOMAN RETENSI ARSIP KEUANGAN&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2016&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;24&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/Perka_28_2016%20PEDOMAN%20RETENSI%20ARSIP%20KEUANGAN.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PERKA ANRI NO 27 TAHUN 2016 TENTANG PEDOMAN RETENSI ARSIP URUSAN BADAN USAHA BIDANG PERBANKAN&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2016&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;25&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/Perka_27_2016%20PEDOMAN%20RETENSI%20ARSIP%20URUSAN%20BADAN%20USAHA%20PERBANKAN.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PERKA ANRI NO 26 TAHUN 2016 TENTANG PEDOMAN KETERBUKAAN ARSIP STATIS UNTUK PENELITIAN DAN PENGEMBANGAN ILMU PENGETAHUAN SERTA PENYELIDIKAN DAN PENYIDIKAN&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2016&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;32&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/Perka_26_2016%20PEDOMAN%20KETERBUKAAN%20ARSIP%20STATIS%20UNTUK%20PENELITIAN.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PERKA ANRI NO 25 TAHUN 2016 TENTANG PEDOMAN PENYELENGGARAAN PENDIDIKAN DAN PELATIHAN KEARSIPAN&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2016&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;14&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/Perka_25_2016%20PENDIDIKAN%20DAN%20PELATIHAN%20KEARSIPAN.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PERKA ANRI NO 24 TAHUN 2016 TENTANG PERUBAHAN ATAS PERATURAN KEPALA ANRI NOMOR NO 24 TAHUN 2015 TENTANG STANDARISASI HARGA SATUAN PERENCANAAN BARANG YANG BERLAKU DI LINGKUNGAN ANRI TAHUN ANGGARAN 2016&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2016&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;19&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/Perka_24_2016%20STANDARISASI%20HARGA%20SATUAN%20PERENCANAAN%20BARANG.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PERKA ANRI NO 22 TAHUN 2016 TENTANG PETUNJUK PELAKSANAAN PEMILIHAN ARSIPARIS TELADAN DAN UNIT PENGOLAH TERBAIK&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2016&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;27&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PERKA ANRI NO 21 TAHUN 2016 TENTANG PETUNJUK PELAKSANAAN LOMBA DESAIN LOGO ANRI DAN CIPTA KARYA LAGU KEARSIPAN NASIONAL&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2016&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;11&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/Perka_21_2016%20PETUNJUK%20PELAKSANAANLOMBA%20DESAIN%20LOGO.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PERKA ANRI NO 20 TAHUN 2016 TENTANG PEDOMAN MONITORING DAN EVALUASI JABATAN FUNGSIONAL ARSIPARIS&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2016&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;15&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/Perka_20_2016%20PEDOMAN%20MONITORING%20DAN%20EVALUASI%20JABFUNG%20ARSIPARIS.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PERKA ANRI NO 19 TAHUN 2016 TENTANG PERUBAHAN ATAS PERATURAN KEPALA ARSIP NASIONAL REPUBLIK INDONESIA NO 12 TAHUN 2016 TENTANG PELAKSANAAN DANA DEKONSENTRASI ANRI TAHUN ANGGARAN 2016&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2016&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;13&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/Perka_19_2016%20PELAKSANAAN%20DANA%20DEKONSENTRASI.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PERKA ANRI NO 18 TAHUN 2016 TENTANG DISIPLIN JAM KERJA DAN CUTI PEGAWAI DI LINGKUNGAN ANRI&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2016&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;44&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/Perka_18_2016%20DISIPLIN%20JAM%20KERJA%20DAN%20CUTI%20PEGAWAI.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PERKA ANRI NO 17 TAHUN 2016 TENTANG PERUBAHAN ATAS PERATURAN KEPALA ARSIP NASIONAL REPUBLIK INDONESIA NOMOR 29 TAHUN 2014 TENTANG KELAS JABATAN DI LINGKUNGAN ARSIP NASIONAL REPUBLIK INDONESIA&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2016&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;32&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/Perka_17_2016%20KELAS%20JABATAN.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PERKA ANRI NO 16 TAHUN 2016 TENTANG PERUBAHAN ATAS PERATURAN KEPALA ARSIP NASIONAL REPUBLIK INDONESIA NOMOR 17 TAHUN 2015 TENTANG PEDOMAN RETENSI ARSIP URUSAN KESEHATAN&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2016&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;9&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/Perka_16_2016%20PEDOMAN%20RETENSI%20ARSIP%20URUSAN%20KESEHATAN.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PERKA ANRI NO 15 TAHUN 2016 TENTANG PERUBAHAN ATAS PERKA ANRI NO 5 TAHUN 2015 TENTANG PEDOMAN RETENSI ARSIP SEKTOR PEREKONOMIAN URUSAN PENELITIAN, PENGKAJIAN, PENGEMBANGAN, PEREKAYASAAN, PENERAPAN SERTA PENDAYAGUNAAN ILMU PENGETAHUAN DAN TEKNOLOGI&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2016&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;127&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/Perka_15_2016%20PEDOMAN%20RETENSI%20ARSIP%20SEKTOR%20PEREKONOMIAN%20URUSAN%20PENELITIAN.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n', '', NULL, 'Y', 14, '', NULL, NULL, 'Y', NULL, NULL, '2017-05-07 19:04:52', 'Administrator', '2017-05-11 17:13:14', 'Administrator'),
(97, 'team20.png', NULL, 'Surat Edaran', 'Surat Edaran terkait kearsipan', NULL, NULL, '&lt;h2&gt;SURAT EDARAN&lt;/h2&gt;\r\n\r\n&lt;table&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;JUDUL&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;TAHUN&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;TAUTAN&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Surat Edaran Ka ANRI no 2 Tahun 2016&lt;/td&gt;\r\n			&lt;td&gt;2016&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/download/Surat_Edaran_Nomor_2_Tahun_2016_Penggunaan_Mars_Kearsipan_Indonesia.pdf&quot; target=&quot;_blank&quot;&gt;unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Surat Edaran Ka ANRI no 1 Tahun 2016&lt;/td&gt;\r\n			&lt;td&gt;2016&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/download/Surat_Edaran_No_1_Peringatan_Hari_Kearsipan_45.pdf&quot; target=&quot;_blank&quot;&gt;unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Surat Edaran Ka ANRI no 3 Tahun 2015&lt;/td&gt;\r\n			&lt;td&gt;2015&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/download/SE%20Kepala%20ANRI%20No.%203%20Tahun%202015.pdf&quot; target=&quot;_blank&quot;&gt;unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Surat Edaran Kementerian Keuangan perihal Persetujuan Sewa Atas Sebagian Tanah dan Bangunan Pada Arsip Nasional RI&lt;/td&gt;\r\n			&lt;td&gt;2015&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/download/surat_edaran_kemkeu_tanah_anri.pdf&quot; target=&quot;_blank&quot;&gt;unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Undang - Undang Nomor 14 Tahun 2008 Tentang Keterbukaan Informasi Publik&lt;/td&gt;\r\n			&lt;td&gt;2015&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/download/Surat%20Edaran%20Kepala%20ANRI%20No%2001%20Tahun%202015.pdf&quot; target=&quot;_blank&quot;&gt;unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Surat Edaran Kepala ANRI No 02 Tahun 2015&lt;/td&gt;\r\n			&lt;td&gt;2015&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/download/Surat%20Edaran%20Kepala%20ANRI%20No%2002%20Tahun%202015.pdf&quot; target=&quot;_blank&quot;&gt;unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Surat Edaran Penyelenggaraan SIKN-JIKN&lt;/td&gt;\r\n			&lt;td&gt;2012&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/download/SE%20Penyelenggaraan%20SIKN-JIKN.pdf&quot; target=&quot;_blank&quot;&gt;unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n', '', NULL, 'Y', 39, '8', NULL, NULL, 'Y', NULL, NULL, '2017-05-07 19:19:40', 'Administrator', '2017-09-11 15:02:36', ''),
(99, 'team19.png', NULL, 'SOP', 'SOP terkait Kearsipan', NULL, NULL, '&lt;h2&gt;SOP&lt;/h2&gt;\r\n\r\n&lt;table&gt;\r\n	&lt;thead&gt;\r\n		&lt;tr&gt;\r\n			&lt;th&gt;Judul&lt;/th&gt;\r\n			&lt;th&gt;\r\n			&lt;p&gt;Tahun&lt;/p&gt;\r\n			&lt;/th&gt;\r\n			&lt;th&gt;\r\n			&lt;p&gt;Download&lt;/p&gt;\r\n			&lt;/th&gt;\r\n			&lt;th&gt;&amp;nbsp;&lt;/th&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/thead&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;02_2014_SOP AP Penyajian Informasi Publik_PPID&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2016&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;21&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://dkp.digitalfatih.com/uploads/Rundown_Update.pdf&quot;&gt;test&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;05_2011_Penanganan Pengaduan Masyarakat&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2016&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;27&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/05_2011_Penanganan%20Pengaduan%20Masyarakat.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;SOP_87_2016_UJI KONSEKUENSI&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2016&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;19&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/SOP_87_2016_UJI%20KONSEKUENSI.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;01_2014_SOP AP Layanan Informasi Publik&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2016&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;28&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/01_2014_SOP%20AP%20Layanan%20Informasi%20Publik.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;SOP_88_2016_Penanganan dan Pengajuan Keberatan Informasi Publik&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2016&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;31&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/SOP_88_2016_Penanganan%20dan%20Pengajuan%20Keberatan%20Informasi%20Publik.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;16_2015_SOP AP Layanan Konsultasi Kearsipan tanpa Melalui Surat&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2016&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;41&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/16_2015_sop-ap-layanan-konsultasi-kearsipan-tanpa-melalui-surat-568bb865927f8.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;05_2015_SOP_Layanan_ Permohonan_Konsultasi_Kearsipan_Lembaga_Negara_&lt;br /&gt;\r\n			Dan_Lembaga_Tingkat_ Pusat_ Lainnya&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2015&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;39&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/05_2015_sop_layanan_-permohonan_konsultasi_kearsipan_lembaga_negara_-dan_lembaga_tingkat_-pusat_-lainnya-568c6fc5e6385.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;06_2015_SOP_Pelaksanaan_Bimbingan_Konsultasi_Kearsipan_Lembaga_Negara_&lt;br /&gt;\r\n			Dan_Lemabaga_Negara dan Lembaga_Tingkat_Pusat_Lainnya&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2015&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;26&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/06_2015_sop_pelaksanaan_bimbingan_konsultasi_kearsipan_lembaga_negara_dan_lemabaga_negara-dan-lembaga_tingkat_pusat_lainnya-568c70220d58a.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;01_2015_SOP_Permohonan_persetujuan_JRA.pdf&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2015&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;14&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/01_2015_sop_permohonan_persetujuan_jra-pdf-568c66ca97e02.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;02_2015_SOP_Persiapan_Permohonan_Persetujuan_JRA&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2015&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;56&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/02_2015_sop_persiapan_permohonan_persetujuan_jra-568c67d069985.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;07_2015_SOP_Pelaksanaan_Supervisi_Kearsipan_Lembaga_Negara_&lt;br /&gt;\r\n			Dan_Lembaga_Tingkat_Pusat_Lainnya&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2015&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;28&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/07_2015_sop_pelaksanaan_supervisi_kearsipan_lembaga_negara_dan_lembaga_tingkat_pusat_lainnya-568c713f33c96.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;01_2015_27_Permohonan_persetujuan_JRA.pdf&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2015&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;31&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/01_2015_27_Permohonan_persetujuan_JRA.pdf.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;02_2015_27_Persiapan_Permohonan_Persetujuan_JRA&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2015&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;15&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/02_2015_27_Persiapan_Permohonan_Persetujuan_JRA.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;03_2015_27_Pembahasan_Persetujuan_JRA&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2015&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;18&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/03_2015_27_Pembahasan_Persetujuan_JRA.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;04_2015_27_Penyampaian_Persetujuan_JRA_Ke_Instansi_Pemohon&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2015&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;16&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/04_2015_27_Penyampaian_Persetujuan_JRA_Ke_Instansi_Pemohon.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;05_2015_27_Layanan_ Permohonan_Konsultasi_Kearsipan_Lembaga_Negara_&lt;br /&gt;\r\n			Dan_Lembaga_Tingkat_ Pusat_ Lainnya&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2015&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;24&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/05_2015_27_Layanan_%20Permohonan_Konsultasi_Kearsipan_Lembaga_Negara_%20Dan_Lembaga_Tingkat_%20Pusat_%20Lainnya.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;06_2015_27_Pelaksanaan_Bimbingan_Konsultasi_Kearsipan_Lembaga_Negara_&lt;br /&gt;\r\n			Dan_Lemabaga_Negara dan Lembaga_Tingkat_Pusat_Lainnya&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2015&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;9&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/06_2015_27_Pelaksanaan_Bimbingan_Konsultasi_Kearsipan_Lembaga_Negara_Dan_Lemabaga_Negara%20dan%20Lembaga_Tingkat_Pusat_Lainnya.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;07_2015_27_Pelaksanaan_Supervisi_Kearsipan_Lembaga_Negara_&lt;br /&gt;\r\n			Dan_Lembaga_Tingkat_Pusat_Lainnya&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2015&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;14&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/07_2015_27_Pelaksanaan_Supervisi_Kearsipan_Lembaga_Negara_Dan_Lembaga_Tingkat_Pusat_Lainnya.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;33_2015_27_Administrasi_Pemerintahan_Tentang_Penyusunan_Naskah_Kerja_Sama_Luar_Negri&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2015&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;8&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/33_2015_27_Administrasi_Pemerintahan_Tentang_Penyusunan_Naskah_Kerja_Sama_Luar_Negri.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;34_2015_27_Administrasi_Pemerintahan_tentang_Penyusunan_Naskah_Kerja_Sama_Dalam_Negri&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;2015&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;p&gt;9&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://www.anri.go.id/assets/collections/files/34_2015_27_Administrasi_Pemerintahan_tentang_Penyusunan_Naskah_Kerja_Sama_Dalam_Negri.pdf&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n', '', NULL, 'Y', 38, '8', NULL, NULL, 'Y', NULL, NULL, '2017-05-07 19:24:02', 'Administrator', '2017-09-11 15:01:56', ''),
(109, NULL, NULL, 'Undang Undang', 'Undang Undang', NULL, NULL, '&lt;table align=&quot;left&quot; border=&quot;1&quot; cellpadding=&quot;1&quot; cellspacing=&quot;1&quot; style=&quot;height:80px; width:710px&quot; summary=&quot;Tabel dibawah ini berisi tentang Undang Undang tentang Kearsipan&quot;&gt;\r\n	&lt;caption&gt;Undang Undang tentang Kearsipan&lt;/caption&gt;\r\n	&lt;thead&gt;\r\n		&lt;tr&gt;\r\n			&lt;th scope=&quot;col&quot; style=&quot;text-align:center&quot;&gt;Item&lt;/th&gt;\r\n			&lt;th scope=&quot;col&quot; style=&quot;text-align:center&quot;&gt;Tahun&lt;/th&gt;\r\n			&lt;th scope=&quot;col&quot; style=&quot;text-align:center&quot;&gt;Action&lt;/th&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/thead&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Udang-Undang RI No 7 Tentang Ketentuan-Ketentuan Pokok Kearsipan&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;1971&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;a href=&quot;http://dkp.digitalfatih.com/uploads/UU_RI_No_7_Tahun_1971_Tentang_Ketentuan-Ketentuan_Pokok_Kearsipan1.pdf&quot; target=&quot;_blank&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Udang-Undang RI No 8 Tentang Dokumen Perusahaan&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;1997&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;a href=&quot;http://dkp.digitalfatih.com/uploads/UU_RI_No_8_Tahun_1997_Tentang_Dokumen_Perusahaan.pdf&quot; target=&quot;_blank&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Udang-Undang RI No 11 Tentang Informasi dan Transaksi Elektronik&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;2008&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;a href=&quot;http://dkp.digitalfatih.com/uploads/UU_RI_No_11_Tahun_2008_Tentang_Informasi_dan_Transaksi_Elektronik.pdf&quot; target=&quot;_blank&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Udang-Undang RI No 14 Tentang Keterbukaan Informasi Publik&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;2008&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;a href=&quot;http://dkp.digitalfatih.com/uploads/UU_RI_No_14_Tahun_2008_Tentang_Keterbukaan_Informasi_Publik.pdf&quot; target=&quot;_blank&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Udang-Undang RI No 15 Tentang Pembentukan Kotamadya Tingkat II Depok&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;1999&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;a href=&quot;http://dkp.digitalfatih.com/uploads/UU_RI_No_15_Tahun_1999_Tentang_Pembentukan_Kotamadya_Tingkat_II_Depok.pdf&quot; target=&quot;_blank&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Udang-Undang RI No 23 Tentang Pemerintahan Daerah&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;2014&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;a href=&quot;http://dkp.digitalfatih.com/uploads/UU_RI_No_23_Tahun_2014_Tentang_Pemerintahan_Daerah.pdf&quot; target=&quot;_blank&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Udang-Undang RI No 43 Tentang Kearsipan&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;2009&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;a href=&quot;http://dkp.digitalfatih.com/uploads/UU_RI_No_43_Tahun_2009_Tentang_Kearsipan.pdf&quot; target=&quot;_blank&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table border=&quot;1&quot; cellpadding=&quot;1&quot; cellspacing=&quot;1&quot; style=&quot;width:500px&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table border=&quot;1&quot; cellpadding=&quot;1&quot; cellspacing=&quot;1&quot; style=&quot;width:700px&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n						&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n						&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n						&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n\r\n			&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n			&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n			&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;p&gt;&lt;a href=&quot;https://&amp;lt;iframe width=&amp;quot;560&amp;quot; height=&amp;quot;315&amp;quot; src=&amp;quot;https://www.youtube.com/embed/U21b4xrHf9s&amp;quot; frameborder=&amp;quot;0&amp;quot; allowfullscreen&amp;gt;&amp;lt;/iframe&amp;gt;&quot;&gt;helo&lt;/a&gt;&lt;/p&gt;\r\n', '', NULL, 'Y', 67, '19', NULL, NULL, 'Y', NULL, NULL, '2017-05-12 16:23:34', 'Administrator', '2017-10-05 11:08:51', ''),
(117, NULL, NULL, 'Image Gallery 1', 'Short Desc Imag Gallery', NULL, NULL, '&lt;p&gt;Content Image Gallery&lt;/p&gt;\r\n', 'Label Image galery', NULL, 'Y', 1, '18', NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(120, 'features120.jpg', NULL, 'Nama Pejabat', 'Pejabat Kearsipan', NULL, NULL, '&lt;p style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;Daftar Pejabat Kearsipan&lt;br /&gt;\r\nPemerintah Kota Depok&lt;br /&gt;\r\nTahun 2017&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;table align=&quot;center&quot; border=&quot;1&quot; cellpadding=&quot;5&quot; cellspacing=&quot;0&quot; style=&quot;width:676px&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12px&quot;&gt;&amp;nbsp;No&amp;nbsp; &lt;/span&gt;&lt;/strong&gt;&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Nama/NIP&lt;/span&gt;&lt;/strong&gt;&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Pangkat&lt;/span&gt;&lt;/strong&gt;&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12px&quot;&gt;&amp;nbsp;Gol&amp;nbsp; &lt;/span&gt;&lt;/strong&gt;&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Jabatan&lt;/span&gt;&lt;/strong&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:12px&quot;&gt;1&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Drs.Asep Roswanda, MPd.&lt;br /&gt;\r\n			NIP.196411021990031010&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Pembina Utama Muda&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:12px&quot;&gt;IV c&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Plt.Kepala Dinas Kearsipan dan Perpustakaan&lt;br /&gt;\r\n			Sekretaris Dinas Kearsipan dan Perpustakaan&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:12px&quot;&gt;2&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Ahmad Oting, SH. MH&lt;br /&gt;\r\n			NIP.196411281986031002&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Pembina&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:12px&quot;&gt;IV a&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Kepala Bidang Pembinaan Layanan Pemanfaatan dan Jasa Kearsipan&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:12px&quot;&gt;3&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Ani Rahmawati, Aks&lt;br /&gt;\r\n			NIP.196605281990022002&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Pembina&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:12px&quot;&gt;IV a&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Kepala Bidang Perpustakaan&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:12px&quot;&gt;4&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Eneng Sugiarti, S. Pd. M. Pd&lt;br /&gt;\r\n			NIP.196802021988032006&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Pembina&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:12px&quot;&gt;IV a&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Kepala Bidang Pengelolaan Arsip&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:12px&quot;&gt;5&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Abdul Amin S. Pd. M. Si&lt;br /&gt;\r\n			NIP.196406261989021002&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Pembina&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:12px&quot;&gt;IV a&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Kepala Seksi Pengelolaan Arsip Statis&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:12px&quot;&gt;6&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;H. Ratman Latif. S,Pd.&lt;br /&gt;\r\n			NIP.196101101981091003&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Pembina&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:12px&quot;&gt;IV a&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Kepala Seksi Layanan Pemanfaatan dan Jasa Kearsipan&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:12px&quot;&gt;7&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Drs. Jumait, M.Pd&lt;br /&gt;\r\n			NIP.196605131912031008&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Pembina&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:12px&quot;&gt;IV a&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Kepala Seksi Pembinaan Layanan, Pemanfaatan dan Jasa Kearsipan&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:12px&quot;&gt;8&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Nurakhadiyat, SE&lt;br /&gt;\r\n			NIP.196203151990031004&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Penata Tk.1&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:12px&quot;&gt;III d&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Kepala Seksi Layanan, Pelestarian dan Kerjasama Perpustakaan&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:12px&quot;&gt;9&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Tri Hastuti&lt;br /&gt;\r\n			NIP.195908261984012001&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Penata Tk.1&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:12px&quot;&gt;III d&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Kepala Subag. Keuangan&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:12px&quot;&gt;10&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Versayleis S.Sos&lt;br /&gt;\r\n			NIP.197205031993032003&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Penata Tk.1&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:12px&quot;&gt;III d&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Kepala Seksi Pengelolaan Arsip Dinamis&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:12px&quot;&gt;11&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Ima Halimah S.Sos, MM&lt;br /&gt;\r\n			NIP.197709302001122003&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Penata Tk.1&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;&lt;span style=&quot;font-size:12px&quot;&gt;III d&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:12px&quot;&gt;Kepala Seksi Deposit Akuisisi dan Pengolahan Bahan Perpustakaan&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n', '', NULL, 'Y', 41, '2', NULL, NULL, 'Y', NULL, NULL, '2017-05-18 12:51:32', 'Administrator', '2017-05-23 10:09:25', 'Administrator'),
(122, NULL, NULL, 'Arsip Aktif', 'Arsip Aktif adalah arsip yang frekwensi  penggunaannya tinggi ', NULL, NULL, '&lt;p&gt;&lt;strong&gt;&lt;img alt=&quot;&quot; src=&quot;http://dkp.digitalfatih.com/uploads/Arsip_Aktif.jpg&quot; style=&quot;height:371px; margin-left:15px; margin-right:15px; width:559px&quot; /&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Arsip Aktif&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Arsip Aktif adalah arsip yang frekwensi &amp;nbsp;penggunaannya tinggi&amp;nbsp; dan atau terus menerus.&lt;/p&gt;\r\n\r\n&lt;p&gt;Arsip yang masih dipergunakan bagi kelangsungan pekerjaan dikantor/ arsip yang secara langsung dan terus menerus diperlukan dan digunakan dalam pelaksanaan administrasi sehari hari serta masih dikelola oleh unit pengelola.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Contoh arsip Aktif&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Daftar hadir atau absen karyawan&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n', '', NULL, 'Y', 64, '19', NULL, NULL, 'Y', NULL, NULL, '2017-05-18 21:21:14', 'Administrator', '2017-09-11 16:25:58', ''),
(123, 'works123.jpg', NULL, 'Tentang Digitalisasi Arsip', 'Tentang informasi kegiatan digitalisasi Kearsipan Kota Depok', NULL, NULL, '&lt;p style=&quot;text-align:justify&quot;&gt;&lt;strong&gt;Latar Belakang&lt;/strong&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\nDengan tingginya volume arsip kertas yang dihasilkan dari kegiatan administrasi oleh berbagai instansi, baik di instanasi pemerintah maupun instansi swasta, sering menimbulkan berbagai masalah berkaitan dengan tempat penyimpanan arsip kertas, biaya pemeliharaannya,tenaga pengelolanya, fasilitas peralatan yang diperlukan seperti rak, boks arsip, proteksi dari bahaya kebakaran atau faktor yang bisa menyebabkan kerusakan arsip kertas .&amp;nbsp;Sehingga untuk memanage atau menghandle arsip kertas dibutuhkan sumber daya yang besar dan budget yang relatif tinggi, terutama untuk tempat penyimpanan dan maintenancenya.&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;strong&gt;Tujuan&lt;/strong&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\nKehadiran arsip elektronik sebagai akibat dari kemajuan IPTEK, merupakan peluang yang sangat besar terhadap upaya pengelolaan arsip berbasis teknologi komputer. Tujuan diselenggarakannya kegiatan digitalisasi arsip ini agar arsip-arsip yang selama ini dalam bentuk hard copy dan menumpuk di ruang layanan informasi maupun di ruang-ruang penyimpanan arsip dapat disimpan secara efisien, tidak memakan tempat yang besar serta arsip dapat bertahan dalam waktu yang relative lama tanpa mengurangi keakuratan arsip.&amp;nbsp;&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;strong&gt;Apakah Digitalisasi Arsip?&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Digitalisasi merupakan sebuah terminologi untuk menjelaskan proses alih media dari bentuk tercetak, audio, maupun video menjadi bentuk digital. Digitalisasi arsip dilakukan untuk membuat arsip dokumen bentuk digital, untuk fungsi fotokopi, dan untuk membuat koleksi perpustakaan digital.&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;strong&gt;Proses Digitalisasi Arsip&lt;/strong&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\nDigitalisasi memerlukan peralatan seperti komputer, scanner, operator media sumber dan software pendukung. Dokumen tercetak dapat dialihkan ke dalam bentuk digital dengan bantuan program pendukung scanning dokumen seperti Adobe Acrobat dan Omnipage. Saat ini beberapa bidang kehidupan sedang mengalami proses migrasi ke teknologi digital, dengan tujuan untuk mendapatkan efisiensi dan optimalisasi. Antara lain digitalisasi bidang telekomunikasi, bidang penyiaran, data-data pemerintah, dsb.&amp;nbsp;&lt;/p&gt;\r\n', 'Digitalisasi-Arsip', NULL, 'Y', 54, '5', NULL, NULL, 'Y', NULL, NULL, '2017-05-18 21:22:22', 'Administrator', '2017-05-18 22:26:21', 'Administrator'),
(124, 'works.jpg', NULL, 'Mobil Sadar Arsip', 'Tentang informasi Mobil Sadar Arsip', NULL, NULL, '&lt;p&gt;Nantinya kedepannya, Mobil layanan sadar arsip ini tujuannya untuk mengenalkan dan memasyarakatkan pentingnya arsip.&amp;nbsp;Sebuah mobil dirancang khusus untuk pemasyarakatan arsip, mobil ini nantinya akan dipasangi berbagai alat peraga, foto-foto, dan dokumen atau arsip duplikat yang dipamerkan.&lt;/p&gt;\r\n\r\n&lt;p&gt;Mobil ini nantinya akan&amp;nbsp;memberikan pelayanan kepada masyarakat secara proaktif. Keberadaan mobil ini dapat dimanfaatkan bagi penyelamatan arsip secara cepat dan tepat, serta dapat menimbulkan sadar arsip terhadap masyarakat.&lt;br /&gt;\r\n&amp;nbsp;&lt;br /&gt;\r\nPemeliharaan - pemeliharaan arsip meliputi:&lt;br /&gt;\r\na.&amp;nbsp;&amp;nbsp;&amp;nbsp; Pemeliharaan lingkungan&lt;br /&gt;\r\nb.&amp;nbsp;&amp;nbsp;&amp;nbsp; Pemeliharaan arsip audio visual dan elektronik&lt;br /&gt;\r\nc.&amp;nbsp;&amp;nbsp;&amp;nbsp; Pemeliharaan arsip audio visual (film dan video)&lt;br /&gt;\r\nd.&amp;nbsp;&amp;nbsp;&amp;nbsp; Pemeliharaan arsip elektronik&lt;/p&gt;\r\n', 'Mobil-Sadar-Arsip', NULL, 'Y', 50, '5', NULL, NULL, 'Y', NULL, NULL, '2017-05-18 21:47:17', 'Administrator', '2017-05-18 21:52:31', 'Administrator'),
(125, 'logo125.png', NULL, 'Logo', 'Logo', NULL, NULL, '', '', NULL, 'Y', 16, '28', NULL, NULL, 'Y', NULL, NULL, '2017-05-18 22:30:47', 'Administrator', '2017-09-29 14:52:55', ''),
(126, NULL, NULL, 'Arsip Inaktif', 'Informasi tentang Arsip Inaktif', NULL, NULL, '&lt;p&gt;&lt;strong&gt;&lt;img alt=&quot;&quot; src=&quot;http://dkp.digitalfatih.com/uploads/Arsip_Inaktif.jpg&quot; style=&quot;height:417px; width:556px&quot; /&gt;&lt;br /&gt;\r\nArsip Inaktif&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Adalah arsip yang frekwensi penggunakaannya telah menurun.&lt;br /&gt;\r\nArsip inaktif sudah jarang sekali dipergunakan dalam proses pekerjaan sehari hari/arsip yang tidak secara langsung dan tidak terus menerus digunakan dalam penyelenggaraan administrasi segari hari serta dikelola oleh pusat arsip (frekuensinya rendah).&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Contoh Arsip Inaktif&lt;/strong&gt;&lt;br /&gt;\r\n&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;- Raport&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n', '', NULL, 'Y', 59, '19', NULL, NULL, 'Y', NULL, NULL, '2017-05-19 01:59:16', 'Administrator', '2017-09-11 14:56:59', '');
INSERT INTO `sys_fe_content` (`fe_content_id`, `fe_img_files`, `fe_img_files2`, `fe_content_title`, `fe_content_short_desc`, `fe_content_short_desc2`, `fe_content_short_desc3`, `fe_full_content`, `fe_content_btn_label`, `fe_content_btn_url`, `fe_link_clickable`, `fe_content_sort_order`, `fe_section_name`, `fe_content_icon`, `fe_sosmed`, `status_active`, `display_start_from`, `display_until`, `create_date`, `create_by`, `update_date`, `update_by`) VALUES
(127, NULL, NULL, 'Arsip Vital', 'Arsip Vital', NULL, NULL, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://dkp.digitalfatih.com/uploads/Arsip_Vital.jpg&quot; style=&quot;height:276px; width:460px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Arsip Vital&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Adalah arsip yang keberadaannya merupakan persyaratan dasar bagi kelangsungan operasional pencipta arsip, tidak dapat diperbaharui, dan tidak tergantikan apabila rusak atau hilang.&lt;br /&gt;\r\n&lt;strong&gt;Contoh :&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Akte Pendirian Perusahaan&lt;/li&gt;\r\n	&lt;li&gt;Buku induk Pegawai&lt;/li&gt;\r\n	&lt;li&gt;Sertifikat Tanah dan Bangunan&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:11.0pt&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Ijazah&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n', '', NULL, 'Y', 58, '19', NULL, NULL, 'Y', NULL, NULL, '2017-05-19 05:33:16', 'Administrator', '2017-09-11 14:55:46', ''),
(128, NULL, NULL, 'Sarana Dan Prasarana Kearsipan', '', NULL, NULL, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://dkp.digitalfatih.com/uploads/sarana_kearsipan.jpg&quot; style=&quot;height:313px; width:417px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Dalam pengelolaan dan pemeliharaan arsip diperlukan sarana dan presarana kearsipan, yang meliputi:&lt;br /&gt;\r\n- Bider / Ordner ; untuk menyimpan dokumen atau arsip berdasarkan kualifikasi yang ditentukan&lt;br /&gt;\r\n- Plastik ; Pembungkus arsip / dokumen sebelum di masukan ke bider / ordner , agar dapat melindungi arsip / dokumen dari air dan gangguan serangga&lt;br /&gt;\r\n- Rak; Lemari atau tempat yang dipergunakan untuk menyimpan Bider / Ordner yang ditata dan susun sesuai kualifikasi yang ditentukan&lt;br /&gt;\r\n- Pendingin Udara / AC; Sarana pendingin udara diruang penyimpanan arsip / dokumen untuk menjaga agar tetap terjaga dan tidak jamuran&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', NULL, 'Y', 57, '19', NULL, NULL, 'Y', NULL, NULL, '2017-05-19 05:42:11', 'Administrator', '2017-09-11 14:55:00', ''),
(129, NULL, NULL, 'Penelusuran Arsip Bersejarah', 'Arsip Sejarah Depok', NULL, NULL, '&lt;p style=&quot;text-align:justify&quot;&gt;&lt;strong&gt;&lt;img alt=&quot;&quot; src=&quot;http://dkp.digitalfatih.com/uploads/arsip_sejarah.jpg&quot; style=&quot;height:381px; width:618px&quot; /&gt;&lt;br /&gt;\r\nPenelusuran Arsip Sejarah&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Kegiatan penelusuran arsip bersejarah menuntut kesabaran dan memerlukan waktu yang panjang, karena tidak setiap arsip yang ditemukan sesuai &amp;nbsp;dengan kebutuhan dalam penelitian. Terlebih lagi untuk penelusuran arsip sejarah maka diperlukan bekal bekal lain sebelum terjun ke lapangan.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Peneliti harus menyiapkan kerangka kerja, ini diperlukan untuk melakukan penyeleksian, hal hal mana yang harus didahulukan. Selain itu peneliti harus mempunyai sikap ulet karena tingkat kesulitan yang tinggi dalam penelusuran arsip. Untuk mengungkap arsip harus mempunyai komitmen pada ilmu pengetahuan pada umumnya dan sejarah pada khususnya.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;br /&gt;\r\nTerhadap dokumen yang telah ditemukan,&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;ada bebrapa langkah yang harus dilakukan:&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;Membuat identifikasi dokumen, yaitu ciri-ciri khas yang membedakan dengan yang lain yang ada pada dokumen itu. Mengapa dokumen itu dibuat, kapan, oleh siapa, di mana, bagaimana, dan sebagainya.&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;Eksplikasi, yaitu unsur-unsur yang membantu untuk menentukan sesuatu, misalnya bagaimana bahasanya, pikirannya, dan kalimatnya.&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;Masalah atribusi, yaitu menetapkan kategori bahan.&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;Melakukan kolasi atau perbandingan dengan yang lain.&lt;/li&gt;\r\n&lt;/ol&gt;\r\n', '', NULL, 'Y', 56, '19', NULL, NULL, 'Y', NULL, NULL, '2017-05-19 05:44:48', 'Administrator', '2017-09-11 14:54:22', ''),
(130, NULL, NULL, 'Penambahan Khasanah Arsip', 'Penambahan Khasanah Arsip', NULL, NULL, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://dkp.digitalfatih.com/uploads/khazanah.png&quot; style=&quot;height:290px; width:744px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Penambahan Khasanah Arsip&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Adalah proses penambahan khasanah arsip statis pada kelembagaan kearsipan yang dilaksanakan melalui kegiatan penyerahan arsip statis dan hak pengelolaannya dari pencipta arsip kepada lembaga kearsipan.&lt;/p&gt;\r\n\r\n&lt;p&gt;Penyerahan arsip bernilai guna pertanggungjawaban nasional atau Arsip Statis sebagai inti dari kegiatan akuisisi yang diselenggarakan oleh lembaga kearsipan, baik Pusat dan Daerah bekerjasama dengan lembaga pencipta atau pemilik Arsip Statis melalui proses pendokumentasian Arsip Statis (penilaian, penataan, dan pembuatan daftar) dan proses serah terima yang jelas.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nAkuisisi merupakan upaya penyelamatan dan pelestarian serta pewarisan jejakan informasi bersejarah dalam bentuk memori kolektif kehidupan berbangsa dan bernegara kepada &amp;nbsp;generasi mendatang. Akuisisi Arsip Statis oleh lembaga kearsipan baik Pusat dan Daerah merupakan bentuk tanggung &amp;nbsp;jawab pemerintah atas hak dasar masyarakat terhadap aksesibilitas informasi publik.&lt;/p&gt;\r\n', '', NULL, 'Y', 55, '19', NULL, NULL, 'Y', NULL, NULL, '2017-05-19 05:47:41', 'Administrator', '2017-09-11 14:52:55', ''),
(131, 'works62.jpg', NULL, 'pelaksanaan supervisi disdik - part 2', 'pelaksanaan supervisi disdik - part 2', NULL, NULL, '', 'Wall-of-Fame', NULL, 'Y', 77, '5', NULL, NULL, 'Y', NULL, NULL, '2017-05-19 05:50:30', 'Administrator', '2017-05-23 10:32:05', 'Administrator'),
(132, 'works63.jpg', NULL, 'pelaksanaan supervisi disdik - part 1', 'pelaksanaan supervisi disdik - part 1', NULL, NULL, '', 'Wall-of-Fame', NULL, 'Y', 76, '5', NULL, NULL, 'Y', NULL, NULL, '2017-05-19 05:52:24', 'Administrator', '2017-05-23 10:31:34', 'Administrator'),
(133, NULL, NULL, 'Penyusutan Arsip', 'Penyusutan Arsip', NULL, NULL, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://dkp.digitalfatih.com/uploads/penyusutan_arsip.jpg&quot; style=&quot;height:252px; width:718px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Penyusutan Arsip&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Adalah kegiatan pengurangan jumlah arsip dengan cara pemindahan arsip inaktif dari unit pengolah ke unit kearsipan, pemusnahan arsip yang tidak memiliki nilai guna, dan penyerahan arsip statis kepada lembaga kearsipan&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Tahapan Penyusutan Arsip&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;Pembuatan Daftar Pertelaan Arsip (DPA)&lt;br /&gt;\r\n	Pembuatan daftar pertelaan arsip berdasarkan kartu-kartu deskripsi yang kemudian dikelompokkan berdasarkan seri arsip di instansi yang bersangkutan. Seri arsip tersebut disusun dalam sebuah skema dijadikan dasar pengelompokan kartu, yang kemudian dituangkan ke dalam bentuk daftar.&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;Pemindahan arsip inaktif ke unit kearsipan&lt;br /&gt;\r\n	Arsip-arsip inaktif dari unit-unit kerja pengolah ( central file) dipindahkan ke Pusat Arsip atau record center. Di dalam melaksanakan pemindahan arsip, perlu melakukan hal-hal seperti berikut:&lt;br /&gt;\r\n	- Pemeriksaan&lt;br /&gt;\r\n	&amp;nbsp; Pemeriksaan dilakukan pada Daftar Pertelaan Arsip (DPA) dan arsipnya untuk mengetahui apakah arsip-arsip yang akan dipindahkan sudah benar-benar aktif&lt;br /&gt;\r\n	&amp;nbsp; atau belum.&lt;br /&gt;\r\n	&amp;nbsp; Di dalam kegiatan pemeriksaan ini dilaksanakan juga kegiatan penyatuan file-file menjadi seri arsip, tanpa merubah penataan semula.&lt;br /&gt;\r\n	&amp;nbsp; Contohnya berkas tentang Cuti Tahunan, Cuti Bersalin, dan Cuti Besar dapat digabungkan menjadi satu seri arsip cuti.&lt;br /&gt;\r\n	- Pemindahan Arsip&lt;br /&gt;\r\n	&amp;nbsp; Hasil pemeriksaan dituangkan dalam laporan pemeriksaan yang kemudian menjadi dasar pembuatan berita acara pemindahan arsip.&lt;br /&gt;\r\n	&amp;nbsp; Pemindahan arsip harus dilakukan dengan perangkat khusus, yang menjamin keamanan informasi dan fisik arsip, baik dalam perjalanan maupun dalam proses&lt;br /&gt;\r\n	&amp;nbsp; penyerahan.&lt;br /&gt;\r\n	- Penataan Arsip&lt;br /&gt;\r\n	&amp;nbsp; Arsip yang dipindahkan dari unit pengolah ke unit kearsipan harus ditata dan dikelola sesuai ketentuan teknis yang berlaku. Arsip harus ditata sesuai dengan&lt;br /&gt;\r\n	&amp;nbsp; jalan masuk/Daftar Pertelaan Arsip yang terlampir dalam Berita Acara Pemindahan Arsip sehingga arsip dapat dirujuk baik oleh unit kearsipan maupun oleh unit&lt;br /&gt;\r\n	&amp;nbsp; pengolah yang bersangkutan.&lt;br /&gt;\r\n	- Pembuatan Berita Acara Pemindahan Arsip&lt;br /&gt;\r\n	&amp;nbsp; Mengingat pemindahan arsip ini menyangkut pengalihan wewenang dan tanggung jawab dari satu unit organisasi yang lain, atau pengalihan wewenang dan&lt;br /&gt;\r\n	&amp;nbsp; tanggungjawab, maka diperlukan suatu bukti pemindahan arsip. Bukti ini biasanya diwujudkan dalam bentuk Berita&amp;nbsp; Acara Pemindahan Arsip.&lt;br /&gt;\r\n	- Pelaksanaan Pemindahan&lt;br /&gt;\r\n	&amp;nbsp; Pemindahan arsip inaktif dapat dilaksanakan sesuai dengan kondisi organisasi. Bila suatu instansi memiliki unit kerja yang terpisah cukup jauh atau lokasi kantor&lt;br /&gt;\r\n	&amp;nbsp; berjauhan dengan pusat arsip, misalnya dipinggir kota, maka diperlukan sarana transportasi yang dipersiapkan dengan baik, sehingga proses pengangkutan arsip&lt;br /&gt;\r\n	&amp;nbsp; tidak menimbulkan kerusakan arsip baik dari segi fisik maupun informasinya.unit kerja yang di tunjuk untuk itu.&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;Penyerahan arsip&lt;br /&gt;\r\n	Arsip yang bernilai guna sekunder atau arsip statis, wajib diserahkan kepada Arsip Nasional Republik Indonesia. Pelaksanaannya dilakukan dengan pengaturan teknis yang disepakati kedua belah pihak, dan harus memenuhi ketentuan teknis kearsipan. Arsip yang bernilaiguna sekunder atau arsip statis yang tercipta pada instansi vertikal di Daerah dan arsip Pemerintah Daerah Otonom diserahkan kepada Badan Kearsipan Propinsi untuk Dati I yang bersangkutan dan kepada Kantor Kearsipan Kota/Kabupaten untuk masing-masing Dati II yang bersangkutan. Pelaksanaannya dilakukan dengan pengaturan teknis yang dikonsultasika dengan Badan Kearsipan Propinsi, dan dalam hal belum memungkinkan atau menyangkut kasus yang penyelesaiannya ditangani oleh Pemerintah Pusat wajib dikonsultasikan dengan Arsip Nasional Republik Indonesia.&lt;br /&gt;\r\n	- Pemeriksaan&lt;br /&gt;\r\n	&amp;nbsp; Pemeriksaan dilaksanakan untuk mengetahui apakah arsip-arsip tersebut benar-benar telah habis jangka simpannya atau habis nilaigunanya. Pemeriksaan ini&lt;br /&gt;\r\n	&amp;nbsp; berpedoman kepada Jadwal Retensi Arsip (JRA)&lt;br /&gt;\r\n	- Pendaftaran&lt;br /&gt;\r\n	&amp;nbsp; Arsip-arsip yang telah diperiksa sebagai arsip yang diusulkan musnah, harus dibuat daftarnya. Dari daftar ini diketahui secara jelas informasi tentang arsip-arsip&lt;br /&gt;\r\n	&amp;nbsp; yang akan dimusnahkan&lt;br /&gt;\r\n	- Pembentukan Panitia Pemusnahan&lt;br /&gt;\r\n	&amp;nbsp; Jika arsip yang akan dimusnahkan memiliki retensi di bawah 10 tahun atau lebih, maka perlu membentuk panitia pemusnahan. Jika arsip yang akan&lt;br /&gt;\r\n	&amp;nbsp; dimusnahkan memiliki retensi di bawah 10 tahun, maka tidak perlu dibuat kepanitiaan, tetapi cukup dilaksanakan oleh unit yang secara fungsional bertugas&lt;br /&gt;\r\n	&amp;nbsp; mengelola arsip. Panitia pemusnahan ini sebaiknya terdiri dari anggota-anggota yang berasal dari unit pengelola arsip, unit pengamanan, unit hukum dan&lt;br /&gt;\r\n	&amp;nbsp; perundang-undangan, serta unit-unit lain yang terkait.&lt;br /&gt;\r\n	- Penilaian, Persetujuan dan Pengesahan&lt;br /&gt;\r\n	&amp;nbsp; Setiap menyeleksi arsip yang akan dimusnahkan, perlu melakukan penilaian arsip.&lt;br /&gt;\r\n	&amp;nbsp; Hasil penilaian tersebut menjadi dasar usulan pemusnahan. Pelaksanaan pemusnahan harus ditetapkan dengan keputusan pimpinan instansi yang bersangkutan&lt;br /&gt;\r\n	&amp;nbsp; sesuai dengan ketentuan hokum yang berlaku.&lt;br /&gt;\r\n	- Pembuatan Berita Acara&lt;br /&gt;\r\n	&amp;nbsp; Berita acara pemusnahan arsip merupakan salah satu dokumen pemusnahan arsip yang sangat penting. Karena itu setiap pemusnahan arsip harus dilengkapi&lt;br /&gt;\r\n	&amp;nbsp; dengan Daftar Pertelaan Arsip (DPA) dan Berita Acara ( BA), bahwa pelaksanaan pemusnahan dilakukan secara sah. Selain itu, juga berfungsi sebagai pengganti&lt;br /&gt;\r\n	&amp;nbsp; arsip yang dimusnahkan.&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', NULL, 'Y', 54, '19', NULL, NULL, 'Y', NULL, NULL, '2017-05-19 06:08:27', 'Administrator', '2017-09-11 14:46:57', ''),
(134, NULL, NULL, 'Pengelolaan Arsip', 'Pengelolaan Arsip', NULL, NULL, '&lt;p&gt;&lt;strong&gt;&lt;img alt=&quot;&quot; src=&quot;http://dkp.digitalfatih.com/uploads/pengelolaan_arsip.jpg&quot; style=&quot;height:400px; width:698px&quot; /&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Pengelolaan Arsip Statis&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Adalah proses pengendalian arsip statis secara efisien, efektif dan sistematis meliputi akuisisi, pengolahan, preservasi, pemanfaatan, pendayagunaan dan pelayanan publik dalamsuatu sistem kearsipan Nasional.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Pengelolaan Asip Statis&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Pengelolaan arsip statis meliputi :&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;Pengumpulan;&lt;br /&gt;\r\n	Pengumpulan arsip statis dilaksanakan melalui kegiatan :&lt;br /&gt;\r\n	- Penilaian;&lt;br /&gt;\r\n	- Penataan;&lt;br /&gt;\r\n	- pembuatan daftar arsip statis.&lt;br /&gt;\r\n	Pimpinan lembaga kearsipan melakukan penilaian terhadap arsip statis yang diserahkan dari lembaga-lembaga negara, badan-badan pemerintah baik pusat maupun daerah, perguruan tinggi, dan/atau yang diperoleh dari badan-badan swasta dan/atau perorangan.&lt;br /&gt;\r\n	Penilaian dilakukan terhadapkelengkapan dan keutuhan kondisi fisik serta nilai informasi dari arsip statis bagi bukti pertanggungjawaban nasional.&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;Penyimpanan;&lt;br /&gt;\r\n	Penyimpanan arsip statis dilaksanakan sesuai dengan persyaratan tempat dan tata cara teknis penyimpanan arsip statis.&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;Perawatan;&lt;br /&gt;\r\n	Perawatan arsip statis dilaksanakan melalui kegiatan pencegahan dan restorasi terhadap terjadinya kerusakan.&lt;br /&gt;\r\n	Perawatan arsip statis melalui kegiatan pencegahan ditujukan terhadap kondisi fisik dan informasi yang dikandung dalam arsip statis.&lt;br /&gt;\r\n	Perawatan arsip statis melalui kegiatan restorasi. ditujukan terhadap kondisi fisik arsip statis yang mengalami kerusakan.&lt;br /&gt;\r\n	Kegiatan pencegahan dilakukan dengan :&lt;br /&gt;\r\n	- Menyeleksi dan membersihkan kondisi fisik arsip statis;&lt;br /&gt;\r\n	- Mendokumentasikan informasi yang dikandung dalam arsip statis;&lt;br /&gt;\r\n	- Mensterilkan dari perusak arsip;&lt;br /&gt;\r\n	- Merestorasi arsip statis, yang kondisi fisiknya mengalami kerusakan, yang pelaksanaannya dilakukan sesuai dengan ketentuan mengenai kegiatan restorasi&lt;br /&gt;\r\n	&amp;nbsp; arsip statis;&lt;br /&gt;\r\n	- Menyimpan arsip statis, yang pelaksanaannya dilakukan sesuai dengan ketentuan mengenai penyimpanan arsip statis;&lt;br /&gt;\r\n	- Mengontrol tempat penyimpanan dan kondisi fisik arsip statis secara berkala;&lt;br /&gt;\r\n	- Kegiatan lain yang diperlukan.&lt;br /&gt;\r\n	Kegiatan restorasi dilakukan dengan :&lt;br /&gt;\r\n	- Mencatat kerusakan kondisi fisik yang terjadi pada arsip statis;&lt;br /&gt;\r\n	- Menentukan metode dan rangkaian tindakan perbaikan kondisi fisik arsip statis yang mengalami kerusakan;&lt;br /&gt;\r\n	- Melaksanakan tindakan perbaikan kondisi fisik arsip statis sesuai dengan metode dan rangkaian tindakan perbaikan&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;Penyelamatan;&lt;br /&gt;\r\n	Penyelamatan arsip statis dilaksanakan terhadap kelengkapan dan keutuhan kondisi fisik serta informasi yang dikandung dalam arsip statis.&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;Penggunaan;&lt;br /&gt;\r\n	Arsip statis digunakan untuk kepentingan kegiatan pemerintahan, enelitian, pendidikan, pengembangan ilmu pengetahuan dan teknologi, serta penyebaran informasi.&lt;/li&gt;\r\n	&lt;li style=&quot;text-align:justify&quot;&gt;Pembinaan atas pelaksanaan serah arsip statis, meliputi bidang :&lt;br /&gt;\r\n	- Arsip, baik dalam bentuk naskahnya maupun bentuk lainnya;&lt;br /&gt;\r\n	- Sumber daya manusia kearsipan;&lt;br /&gt;\r\n	- Sarana dan prasarana kearsipan.&lt;br /&gt;\r\n	Pembinaan atas pelaksanaan serah arsip statis dilaksanakan melalui :&lt;br /&gt;\r\n	- bimbingan;&lt;br /&gt;\r\n	- konsultasi;&lt;br /&gt;\r\n	- penyuluhan;&lt;br /&gt;\r\n	- supervisi dan pemantauan;&lt;br /&gt;\r\n	- pendidikan dan pelatihan;&lt;br /&gt;\r\n	- kegiatan lain dalam rangka pembinaan.&lt;/li&gt;\r\n&lt;/ol&gt;\r\n', '', NULL, 'Y', 51, '19', NULL, NULL, 'Y', NULL, NULL, '2017-05-19 06:16:18', 'Administrator', '2017-09-11 14:35:13', ''),
(135, NULL, NULL, 'Penyerahan Arsip', 'Penyerahan Arsip', NULL, NULL, '&lt;p&gt;&lt;strong&gt;Penyerahan Arsip&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Berdasarkan Undang-Undang Nomor 43 Tahun 2009, pasal 53 ayat (1) bahwa &amp;ldquo;Lembaga Negara Tingkat Pusat wajib menyerahkan arsip Statis kepada ANRI&amp;rdquo; dan ayat (2) Lembaga negara didaerah wajib menyerahkan arsip statis kepada ANRI sepanjang instansi induknya tidak menentukan lain.&lt;/p&gt;\r\n\r\n&lt;p&gt;Tahapan Penyerahan Arsip;&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li&gt;Monitoring&lt;br /&gt;\r\n	&lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;Monitoring terhadap fisik arsip dan Daftar arsip statis&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li&gt;Verifikasi&lt;br /&gt;\r\n	Verifikasi &lt;span style=&quot;font-family:&amp;quot;Calibri&amp;quot;,&amp;quot;sans-serif&amp;quot;&quot;&gt;terhadap daftar arsip statis&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li&gt;Menetapkan Status Arsip Statis&lt;/li&gt;\r\n	&lt;li&gt;Persetujuan untuk Menyerahkan&lt;br /&gt;\r\n	Membuat Berita Acara Penyerahan Arsip Statis&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', NULL, 'Y', 41, '19', NULL, NULL, 'Y', NULL, NULL, '2017-05-19 06:24:08', 'Administrator', '2017-05-23 10:26:55', 'Administrator'),
(136, NULL, NULL, 'SDM Kearsipan', 'SDM Kearsipan', NULL, NULL, '&lt;table border=&quot;1&quot; cellspacing=&quot;0&quot; style=&quot;width:508.0pt&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td colspan=&quot;5&quot; style=&quot;width:508.0pt&quot;&gt;\r\n			&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:black&quot;&gt;Daftar Pejabat Kearsipan&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td colspan=&quot;5&quot; style=&quot;width:508.0pt&quot;&gt;\r\n			&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:black&quot;&gt;Pemerintah Kota Depok&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td colspan=&quot;5&quot; style=&quot;width:508.0pt&quot;&gt;\r\n			&lt;p style=&quot;text-align:center&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:black&quot;&gt;2017&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:24.0pt&quot;&gt;\r\n			&lt;p&gt;&lt;strong&gt;No&lt;/strong&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:153.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;strong&gt;Nama/NIP&lt;/strong&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:92.15pt&quot;&gt;\r\n			&lt;p&gt;&lt;strong&gt;Pangkat&lt;/strong&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:39.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;strong&gt;Gol&lt;/strong&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:197.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;strong&gt;Jabatan&lt;/strong&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:24.0pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;1&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:153.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Drs.Asep Roswanda, MPd.&lt;br /&gt;\r\n			NIP.196411021990031010&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:92.15pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Pembina Utama Muda&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:39.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;IV c&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:197.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Plt.Kepala Dinas Kearsipan dan Perpustakaan&lt;br /&gt;\r\n			Sekretaris Dinas Kearsipan dan Perpustakaan&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:24.0pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;2&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:153.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Ahmad Oting, SH. MH&lt;br /&gt;\r\n			NIP.196411281986031002&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:92.15pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Pembina&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:39.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;IV a&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:197.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Kepala Bidang Pembinaan Layanan Pemanfaatan dan Jasa Kearsipan&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:24.0pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;3&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:153.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Ani Rahmawati, Aks&lt;br /&gt;\r\n			NIP.196605281990022002&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:92.15pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Pembina&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:39.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;IV a&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:197.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Kepala Bidang Perpustakaan&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:24.0pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;4&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:153.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Eneng Sugiarti, S. Pd. M. Pd&lt;br /&gt;\r\n			NIP.196802021988032006&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:92.15pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Pembina&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:39.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;IV a&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:197.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Kepala Bidang Pengelolaan Arsip&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:24.0pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;5&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:153.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Abdul Amin S. Pd. M. Si&lt;br /&gt;\r\n			NIP.196406261989021002&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:92.15pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Pembina&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:39.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;IV a&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:197.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Kepala Seksi Pengelolaan Arsip Statis&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:24.0pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;6&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:153.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;H. Ratman Latif. S,Pd.&lt;br /&gt;\r\n			NIP.196101101981091003&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:92.15pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Pembina&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:39.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;IV a&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:197.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Kepala Seksi Layanan Pemanfaatan dan Jasa Kearsipan&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:24.0pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;7&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:153.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Drs. Jumait, M.Pd&lt;br /&gt;\r\n			NIP.196605131912031008&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:92.15pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Pembina&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:39.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;IV a&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:197.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Kepala Seksi Pembinaan Layanan, Pemanfaatan dan Jasa Kearsipan&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:24.0pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;8&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:153.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Nurakhadiyat, SE&lt;br /&gt;\r\n			NIP.196203151990031004&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:92.15pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Penata Tk.1&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:39.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;III d&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:197.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Kepala Seksi Layanan, Pelestarian dan Kerjasama Perpustakaan&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:24.0pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;9&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:153.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Tri Hastuti&lt;br /&gt;\r\n			NIP.195908261984012001&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:92.15pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Penata Tk.1&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:39.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;III d&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:197.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Kepala Subag. Keuangan&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:24.0pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;10&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:153.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Versayleis S.Sos&lt;br /&gt;\r\n			NIP.197205031993032003&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:92.15pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Penata Tk.1&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:39.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;III d&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:197.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Kepala Seksi Pengelolaan Arsip Dinamis&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:24.0pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;11&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:153.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Ima Halimah S.Sos, MM&lt;br /&gt;\r\n			NIP.197709302001122003&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:92.15pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Penata Tk.1&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:39.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;III d&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:197.95pt&quot;&gt;\r\n			&lt;p&gt;&lt;span style=&quot;color:black&quot;&gt;Kepala Seksi Deposit Akuisisi dan Pengolahan Bahan Perpustakaan&lt;/span&gt;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n', '', NULL, 'Y', 33, '19', NULL, NULL, 'Y', NULL, NULL, '2017-05-19 06:33:14', 'Administrator', '2017-05-23 09:59:55', 'Administrator'),
(137, NULL, NULL, 'Peraturan', 'Peraturan', NULL, NULL, '&lt;table border=&quot;1&quot; cellpadding=&quot;1&quot; cellspacing=&quot;1&quot; style=&quot;height:101px; width:825px&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;Discription&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;Tahun&lt;/td&gt;\r\n			&lt;td style=&quot;text-align:center&quot;&gt;Action&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PP No 34 Tentang Penyusutan Arsip&lt;/td&gt;\r\n			&lt;td&gt;&amp;nbsp;1979&amp;nbsp;&lt;/td&gt;\r\n			&lt;td&gt;&amp;nbsp;&lt;a href=&quot;http://dkp.digitalfatih.com/uploads/PP_No_34_Tahun_1979_Tentang_Penyusutan_Arsip1.pdf&quot; target=&quot;_blank&quot;&gt;Unduh&amp;nbsp; &lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PP No 87 Tentang Tata Cara Penyerahan Dan Pemusnahan Dokumen Perusahaan&lt;/td&gt;\r\n			&lt;td&gt;&amp;nbsp;1999&lt;/td&gt;\r\n			&lt;td&gt;&amp;nbsp;&lt;a href=&quot;http://dkp.digitalfatih.com/uploads/PP_No_87_Tahun_1999_Tentang_Tata_Cara_Penyerahan_Dan_Pemusnahan_Dokumen_Perusahaan1.pdf&quot; target=&quot;_blank&quot;&gt;Unduh &lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PP No 88 Tentang Tata Cara Pengalihan Dokumen Perusahaan ke Dalam Mikrofilm&lt;/td&gt;\r\n			&lt;td&gt;&amp;nbsp;1999&lt;/td&gt;\r\n			&lt;td&gt;&amp;nbsp;&lt;a href=&quot;http://dkp.digitalfatih.com/uploads/PP_No_88_Tahun_1999_Tentang_Tata_Cara_Pengalihan_Dokumen_Perusahaan_ke_Dalam_Mikrofilm1.PDF&quot; target=&quot;_blank&quot;&gt;Unduh &lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PP No 28 Tentang Pelaksanaan UU No. 43 Tahun 2009 tentang Kearsipan&lt;/td&gt;\r\n			&lt;td&gt;&amp;nbsp;2012&lt;/td&gt;\r\n			&lt;td&gt;&amp;nbsp;&lt;a href=&quot;http://dkp.digitalfatih.com/uploads/PP_No_28_Tahun_2012_Tentang_Pelaksanaan_UU_No._43_Tahun_2009_tentang_Kearsipan2.pdf&quot; target=&quot;_blank&quot;&gt;Unduh &lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PERWAL No 79 Tentang Kedudukan, Susunan Organisasi, Tugas dan Fungsi Serta Tata Karja Dinas Kearsipan dan Perpustakaan&lt;/td&gt;\r\n			&lt;td&gt;&amp;nbsp;2016&lt;/td&gt;\r\n			&lt;td&gt;&amp;nbsp;&lt;a href=&quot;http://dkp.digitalfatih.com/uploads/PERWAL_No_79_Tahun_2016_Tentang_Kedudukan,_Susunan_Organisasi,_Tugas_dan_Fungsi_Serta_Tata_Karja_Dinas_Kearsipan_dan_Perpustakaan1.pdf&quot; target=&quot;_blank&quot;&gt;Unduh &lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PERKA No 22 Tentang Pedoman Penyelenggaraan SIKN dan JIKN&lt;/td&gt;\r\n			&lt;td&gt;&amp;nbsp;2011&lt;/td&gt;\r\n			&lt;td&gt;&amp;nbsp;&lt;a href=&quot;http://dkp.digitalfatih.com/uploads/PERKA_No_22_Tahun_2011_Tentang_Pedoman_Penyelenggaraan_SIKN_dan_JIKN.pdf&quot; target=&quot;_blank&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PERKA No 21 Tentang Elemen Data Arsip Dinamis dan Statis Untuk Penyelenggaraan SIKN&lt;/td&gt;\r\n			&lt;td&gt;&amp;nbsp;2011&amp;nbsp;&lt;/td&gt;\r\n			&lt;td&gt;&amp;nbsp;&lt;a href=&quot;http://dkp.digitalfatih.com/uploads/PERKA_No_21_Tahun_2011_Tentang_Elemen_Data_Arsip_Dinamis_dan_Statis_Untuk_Penyelenggaraan_SIKN.pdf&quot; target=&quot;_blank&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PERKA No 7 Tentang Gerakan Nasional Sadar Tertib Arsip&lt;/td&gt;\r\n			&lt;td&gt;&amp;nbsp;2017&lt;/td&gt;\r\n			&lt;td&gt;&amp;nbsp;&lt;a href=&quot;http://dkp.digitalfatih.com/uploads/PERKA_No_7_Tahun_2017_Tentang_Gerakan_Nasional_Sadar_Tertib_Arsip.pdf&quot; target=&quot;_blank&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PERKA No 6 Tentang Tata Cara Pengangkatan PNS Dalam Jabatan Fungsional Arsiparis&lt;/td&gt;\r\n			&lt;td&gt;&amp;nbsp;2017&lt;/td&gt;\r\n			&lt;td&gt;&amp;nbsp;&lt;a href=&quot;http://dkp.digitalfatih.com/uploads/PERKA_No_6_Tahun_2017_Tentang_Tata_Cara_Pengangkatan_PNS_Dalam_Jabatan_Fungsional_Arsiparis.pdf&quot; target=&quot;_blank&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;PERKA No 5 Tentang Standard Kualitas Hasil Kerja Pejabat Fungsional Arsiparis&lt;/td&gt;\r\n			&lt;td&gt;&amp;nbsp;2016&lt;/td&gt;\r\n			&lt;td&gt;&amp;nbsp;&lt;a href=&quot;http://dkp.digitalfatih.com/uploads/PERKA_No_5_Tahun_2016_Tentang_Standard_Kualitas_Hasil_Kerja_Pejabat_Fungsional_Arsiparis.pdf&quot; target=&quot;_blank&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;KEPKA No11 Tentang Standar Boks Arsip&lt;/td&gt;\r\n			&lt;td&gt;&amp;nbsp;2000&lt;/td&gt;\r\n			&lt;td&gt;&amp;nbsp;&lt;a href=&quot;http://dkp.digitalfatih.com/uploads/KEPKA_No11_Tahun_2000_Tentang_Standar_Boks_Arsip.pdf&quot; target=&quot;_blank&quot;&gt;Unduh&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', NULL, 'Y', 50, '19', NULL, NULL, 'Y', NULL, NULL, '2017-05-20 14:37:35', 'Administrator', '2017-09-11 14:29:28', ''),
(138, 'works65.jpg', NULL, 'Bimbingan Teknis Penataan Arsip Pemerintah Daerah', 'Bimbingan Teknis Penataan Arsip Pemerintah Daerah', NULL, NULL, '&lt;p&gt;Permasalahan klasik yang selalu muncul dalam rangka pengelolaan arsip adalah berkaitan dengan sumber daya manusia, sarana prasarana serta sumber daya keuangan atau anggaran yang masih terbatas dan minim, Disamping itu rendahnya apresiasi terhadap pengelolaan arsip&lt;/p&gt;\r\n\r\n&lt;p&gt;Untuk itu dalam rangka mewujudkan Depok Sadar Arsip, sangat perlu diadakan kegiatan Bimbingan Teknis Penataan Arsip Pemerintah Daerah.&lt;br /&gt;\r\nDimana kesadaran akan arsip yang baik dimulai dari pemerintah daerah sendiri, baik dari sumber daya manusianya dan sarana serta prasarana yang memenuhi syarat.&lt;br /&gt;\r\nKegiatan tersebut meliputi;&lt;br /&gt;\r\n- Memberikan pengertian kepada seluruh aparat pemerintah daerah tentang seputar Arsip.&lt;br /&gt;\r\n- Bagaimana cara mengelola Arsip&lt;br /&gt;\r\n- Bagaimana cara memelihara Arsip agar tidak rusak dan dapat di simpan dalam waktu yang lama&lt;br /&gt;\r\n- Bagaimana cara menyimpan (filling) arsip dengan cara memilah-nilah arsip berdasarkan kualifikasi yang ditentukan&lt;br /&gt;\r\n- Bagaimana cara membuat database arsip yang dimiliki&lt;br /&gt;\r\n- Bagaimana memusnahkan arsip berdasarkan masa retensi dari arsip tersebut&lt;br /&gt;\r\n- Bagaimana membuat SOP (Standar Operasional Prosedur) terkait Arsip.&lt;br /&gt;\r\n- Dll&lt;/p&gt;\r\n\r\n&lt;p&gt;Kegiatan ini harus dilakukan diseluruh level Organisasi Pemerintah Daerah (OPD) dan dilakukan oleh Dinas Kearsipan dan Perpustakaan, dalam hal ini Bagian Kearsipan Pemerintah Kota Depok.&lt;/p&gt;\r\n', 'Berita', NULL, 'Y', 68, '5', NULL, NULL, 'Y', NULL, NULL, '2017-05-20 16:05:11', 'Administrator', '2017-05-20 16:34:40', 'Administrator'),
(139, 'works139.jpg', NULL, 'Kegiatan Penataan Arsip Di OPD', 'Kegiatan Penataan Arsip Di OPD', NULL, NULL, '&lt;p style=&quot;text-align:justify&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://dkp.digitalfatih.com/uploads/Kegiatan-Penataan-Arsip-di-OPD_1.jpg&quot; style=&quot;height:299px; width:673px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Kecamatan merupakan OPD yang paling bawah yang secara langsung bersentuhan langsung dan memberikan pelayanan kepada masyarakat. Pelayanan yang diberikan Kecamatan meliputi pelayanan kependudukan, keamanan, kesejahteraan,dll. Guna memaksimalkan pelayanan yang akan diberikan kepada masyarakat, diperlukan sistem kearsipan yang baik. Selama ini tata kelola arsip yang ada di Kecamatan masih jauh dari standar sistem kearsipan yang baku. Sehingga pelayanan di Kecamatan kadang terhambat karena sulitnya menemukan dokumen yang dicari.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;br /&gt;\r\nBidang kearsipan sebagai Lembaga Kearsipan Daerah melakukan pendampingan pengelolaan arsip Kecamatan . Agenda ini merupakan tindak lanjut dari kegiatan Bimbingan Teknis pengelolaan arsip Kecamatan. Setelah pendampingan kearsipan Kecamatan tersebut diharapkan dapat meningkatkan kesadaran penataan kearsipan yang baik bagi seluruh perangkat Kecamatan, memberi pemahaman mengenai tatakelola kearsipan Kecamatan yang sesuai prosedur, dan pihak Kecamatan menganggarkan khusus untuk sarana dan prasarana pengelolaan arsip.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Edit&amp;nbsp;&lt;/p&gt;\r\n', 'Berita', NULL, 'Y', 79, '5', NULL, NULL, 'Y', NULL, NULL, '2017-05-20 16:44:21', 'Administrator', '2017-09-12 09:12:31', '');
INSERT INTO `sys_fe_content` (`fe_content_id`, `fe_img_files`, `fe_img_files2`, `fe_content_title`, `fe_content_short_desc`, `fe_content_short_desc2`, `fe_content_short_desc3`, `fe_full_content`, `fe_content_btn_label`, `fe_content_btn_url`, `fe_link_clickable`, `fe_content_sort_order`, `fe_section_name`, `fe_content_icon`, `fe_sosmed`, `status_active`, `display_start_from`, `display_until`, `create_date`, `create_by`, `update_date`, `update_by`) VALUES
(140, NULL, NULL, 'Pengingkatan Kapasitas SDM', '', NULL, NULL, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://dkp.digitalfatih.com/uploads/6992_kuncinya_di_pengembangan_sdm_1.jpg&quot; style=&quot;height:300px; width:800px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Dalam kegiatan kearsipan paling tidak ada beberapa komponen atau unsur yang sangat dominan yaitu system, SDM (Sumber Daya Manusia) kearsipan, kelembagaan dan sarana prasarana. Dari beberapa komponen tersebut nampaknya pengaruh SDM kearsipan dalam kegiatan kearsipan secara menyeluruh sangat penting, karena apalah artinya system, kelembagaan atau sarana dan prasarana kalau tidak didukung oleh SDM yang mampu dan handal. SDM kearsipan itu sendiri pada prinsipnya dikelompokkan menjadi pengambil keputusan (decision maker) dalam hal ini adalah pimpinan, pembina kearsipan, tim penilai jabatan fungsional arsiparis dan arsiparis. Peranan pimpinan sebagai pengambil keputusan di bidang kearsipan memang tidak bisa diabaikan, banyak kasus dimana instansi yang melakukan kegiatan kearsipan dimulai dari kesulitan pimpinan ketika mencari arsip atau dokumen yang dibutuhkan dan tidak ditemukan. Bermula dari kesulitan tersebut sehingga instansi memprogramkan kegiatan kearsipan secara lebih intensif.&lt;br /&gt;\r\n&lt;br /&gt;\r\nSementara tenaga Pembina kearsipan juga sangat besar pengaruhnya terhadap perkembangan kearsipan di lingkungan instansi. Secara peraturan perundangan yang yang berfungsi sebagai lembaga Pembina kearsipan secara nasional adalah Arsip Nasional RI, yang kemudian kewenangannya didelegasikan kepada kelembagaan di tingkat instansi pusat dan di tingkat daerah. Untuk tingkat instansi pusat sebagai Pembina kearsipannya adalah unit kearsipan yaitu satuan kerja pada pencipta arsip yang mempunyai tugas dan tanggung jawab dalam penyelenggaraan kearsipan. Dalam hal ini adalah unit di lingkungan secretariat biasanya dilakukan oleh Biro Umum. Sehingga Biro Umum atau yang berfungsi sebagai Unit Kearsipan I jika unit organisasi besar, mempunyai kewenangan untuk melakukan pembinaan kearsipan secara menyeluruh dalam instansi termasuk melakukan pembinaan terhadap Unit Kearsipan II di lingkungan tingkat eselon I (Direktorat Jendral, Inspektorat Jendral, Badan, Deputi) dan juga terhadap Unit Kearsipan pada instansi vertical di daerah atau perwakilan luar negeri. Untuk Pembina kearsipan instansi pusat relative sudah memahami kegiatan kearsipan, sehingga umumnya juga sudah melakukan pembinaan dan sudah memprogramkan kegiatan kearsipan dengan baik.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nYang cukup menarik adalah instansi Pembina kearsipan di daerah baik tingkat Propinsi maupun tingkat Kabupaten/Kota, dimana secara daerah dilakukan oleh Lembaga Kearsipan Propinsi atau Kabupaten/Kota, sehingga dengan demikian pimpinan Lembaga Kearsipan adalah sebagai Pembina kearsipan. Sementara untuk instansi pencipta arsip tingkat Propinsi dan Kabupaten/Kota yang umumnya dinamakan sebagai SKPD (Satuan Kerja Perangkat Daerah) Pembina kearsipannya adalah unit yang berada pada secretariat (Sekretaris atau Kepala Bagian Tata Usaha atau Umum), hampir dapat dikatakan bahwa lebih dari 90 % dari mereka tidak mempunyai dasar serta kompetensi di bidang kearsipan. Sehingga bagaimana mereka akan melakukan pembinaan dan memprogramkan kegiatan kearsipan kalau mereka sendiri kurang memahami kegiatan kearsipan.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nSedangkan unsur SDM lainnya adalah tim penilai, berdasarkan data yang ada sudah hampir semua instansi yang memiliki arsiparis yang jumlahnya lebih dari 10 orang sudah memiliki tim penilai. Tim penilai ini terdiri dari tim penilai pusat yang melakukan penilaian terhadap arsiparis untuk golongan IV baik untuk lingkungan arsiparis di ANRI ataupun dari instansi lain. Sedangkan tim penilai unit kerja adalah yang melakukan penilaian untuk arsiparis golongan II dan III di lingkungan ANRI. Sementara tim penilai Propinsi dan Kabupaten/Kota adalah yang melakukan penilaian terhadap arsiparis Golongan II dan III pada wilayahnya. Kemudian yang terakhir adalah tim penilai instansi yang melakukan penilaian terhadap arsiparis tingkat instansi pusat di luar ANRI.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nKemudian unsur SDM kearsipan yang terakhir adalah arsiparis yang merupakan ujung tombak dari SDM kearsipan yang memang secara teknis melakukan kegiatan pengelolaan kearsipan baik statis maupun dinamis dan melakukan pembinaan.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nSebagai salah satu pejabat fungsional, arsiparis tentunya harus professional sehingga kemampuan dan kualitas senantiasa selalu ditingkatkan. Berdasarkan pengalaman ketika menyelenggarakan sertifikasi untuk arsiparis baik untuk kompetensi pengelolaan arsip vital maupun pemberkasan arsip serta pemilihan arsiparis teladan nasional, yang dilakukan secara tertulis, wawancara dan praktek masih terlihat bahwa tingkat kemampuan dasar kearsipan dari arsiparis masih kurang. Hal ini tentu menjadi perhatian ANRI sebagai Pembina kearsipan dan jabatan fungsional arsiparis. Dan yang lebih memprihatinkan lagi adalah adanya ketimpangan antara kemampuan arsiparis yang ada di Pulau Jawa dengan dengan di luar Pulau Jawa, hal ini dapat dilihat dari pemenang arsiparis teladan tingkat nasional dimana pemenang I, II dan III semua berasal dari lingkungan Pulau Jawa. Berdasarkan kenyataan ini sekali lagi perlu adanya program pembinaan terhadap arsiparis secara khusus agar kemampuan dan ketimpangan kemampuan meningkat dan tidak adanya gap yang mencolok. Dari segi kuantitas, jumlah arsiparis juga mengalami penurunan yang cukup signifikan, misalnya dapat dilihat dari data perkembangan arsiparis dalam 5 tahun belakangan dari tahun 2005 &amp;ndash; 2009.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nDATA ARSIPARIS&lt;br /&gt;\r\n&lt;strong&gt;INSTANSI&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 2005 2006 2007 2008 2009&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; KETERANGAN&lt;/strong&gt;&lt;br /&gt;\r\nPUSAT&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 1943 1838 1835 1994 2063&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; CENDERUNG NAIK&lt;br /&gt;\r\nPROP&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 1352 1351 1100 1150 813&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; TURUN DRASTIS&lt;br /&gt;\r\nKAB/KOTA&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 259&amp;nbsp;&amp;nbsp; 242&amp;nbsp;&amp;nbsp; 242&amp;nbsp;&amp;nbsp; 242&amp;nbsp; 299&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; NAIK&lt;br /&gt;\r\nJUMLAH&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 3554 3431 3177 3386 3175&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; TURUN&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nSumber : Direktorat Akreditasi dan Profesi Kearsipan&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;strong&gt;KETERANGAN TABEL&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li&gt;SECARA NASIONAL JUMLAH ARSIPARIS TAHUN 2009 TURUN 10,6% DIBANDING TAHUN 2005;&lt;/li&gt;\r\n	&lt;li&gt;TINGKAT PUSAT, ARSIPARIS TRAMPIL TURUN 7 %, AHLI NAIK 209 %;&lt;/li&gt;\r\n	&lt;li&gt;TINGKAT PROPINSI TURUN DRASTIS HAMPIR 40 %&lt;/li&gt;\r\n	&lt;li&gt;TINGKAT KAB/KOTA, ARSIPARIS TERAMPIL NAIK 14 % SEDANGKAN AHLI NAIK 55%&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;Dengan melihat data perkembangan arsiparis yang dilihat secara kuantitas, maka tentu menjadi perhatian bagi ANRI, mengapa hal tersebut terjadi. Dari data lapangan baik secara kualitas ataupun secara kuantitas dari arsiparis, maka artikel ini akan membahas bagaimana usaha untuk meningkatkan kualitas dan kuantitas SDM&lt;br /&gt;\r\nkearsipan secara umum dan khususnya bagi arsiparis, agar salah satu komponen penyelenggaraan kearsipan dan sebagai ujung tombak untuk melakukan keagiatan kearsipan dapat berjalan secara secara optimal.&lt;br /&gt;\r\n&lt;br /&gt;\r\nSebagai landasan teori dalam artikel ini maka dikemukakan beberapa pengertian tentang SDM, arsiparis, peningkatan kualitas dan kuantitas. Soekidjo Notoatmodjo dalam bukunya &amp;ldquo;Pengembangan Sumber Daya Manusia&amp;rdquo; mengemukakan bahwa pada prinsipnya secara umum untuk melakukan pembangunan dibutuhkan asset pokok yang disebut sumber daya, yang kemudian dibedakan menjadi sumber daya alam dan sumber daya manusia. Kemudian lebih lanjut lagi dikemukakan bahwa dari kedua sumber daya tersebut maka sumber daya manusia lebih penting dibandingkan dengan sumber daya alam. SDM (Sumber Daya Manusia) itu sendiri pada prinsipnya adalah tenaga kerja, pegawai atau karyawan yang berperan untuk mencapai tujuan dari suatu organisasi.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://dkp.digitalfatih.com/uploads/minimnya_tenaga_arsip.jpg&quot; style=&quot;height:425px; width:640px&quot; /&gt;&lt;br /&gt;\r\nNotoatmodjo secara khusus mengemukakan bahwa kalau bicara masalah SDM maka tidak dapat terlepas dari dua aspek yaitu kuantitas dan kualitas. Yang dimaksudkan dengan kuantitas adalah jumlah pegawai, yang relative tidak begitu penting dibandingkan dengan kualitas. Kemudian kalau dikaitkan pengertian kuantitas SDM kearsipan adalah adalah jumlah arsiparis atau pengelola kearsipan yang ideal yang dimiliki oleh lembaga Negara yang disesuaikan dengan bobot atau beban kerja kearsipan. Kebutuhan arsiparis sebagai pengelola kearsipan ditentukan oleh analisis dari jenis, sifat, sarana dan prinsip pelaksanaan pekerjaan, yaitu dengan melihat waktu kerja efektif dalam melakukan pekerjaan kearsipan dalam satu tahun dan standar kemampuan rata-rata. Contoh mudahnya adalah dengan melihat beban kegiatan kearsipan baik yang ada pada unit pengolah atau unit kearsipan atau bahkan pada lembaga kearsipan maka dapat dianalisis jumlah arsiparis yang dibutuhkan, misalnya untuk tingkat instansi pusat apakah layak untuk penempatan seorang arsiparis pada level eselon II yang berfungsi sebagai unit pengolah tentunya dengan dilihat jumlah arsip yang tercipta dan jika layak untuk tingkat apa arsiparis tersebut ditempatkan. Bagaimana halnya dengan unit kearsipan karena fungsinya tidak hanya mengelola kearsipan tetapi juga melakukan pembinaan kearsipan, sehingga tentunya diperlukan jumlah arsiparis yang lebih banyak .&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nAdapun kualitas SDM juga menyangkut dua aspek yaitu aspek kualitas fisik dan kualitas nonfisik yang berhubungan dengan kemampuan bekerja, berpikir dan keterampilan lainnya, sehingga upaya meningkatkan kualitas SDM ini juga dapat diarahkan pada dua aspek tersebut. Notoatmodjo lebih tegas lagi mengatakan bahwa untuk meningkatkan kualitas fisik dapat diupayakan melalui program kesehatan dan gizi. Sedangkan untuk meningkatkan kemampuan kualitas nonfisik maka upaya pendidikan dan pelatihan adalah yang paling diperlukan.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nBuchari Zainun lebih khusus mengatakan bahwa &amp;ldquo;Sumber daya manusia yang bermutu adalah kerja yang dikerjakannya akan menghasilkan sesuatu yang memang dikehendaki dari pekerjaan tersebut. Bermutu bukan hanya pandai tetapi memenuhi semua syarat kualitas yang dituntut pekerjaan tersebut sehingga pekerjaan itu dapat benar-benar diselesaikan menurut yang dikehendaki. Syarat-syarat kualitatif yang dikehendaki itu umpamanya kemampuan, kecakapan, keterampilan, kepribadian, sikap dan prilaku&amp;rdquo;.&lt;br /&gt;\r\nSuyadi Prawiro Sentono, mengatakan bahwa &amp;ldquo;Sumber daya manusia yang berkualitas merupakan sumber daya manusia yang produktif dan mampu bekerja secara efisien disamping potensial mempunyai keunggulan kompetitif&amp;rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nDengan melihat beberapa pengertian kualitas Sumber Daya Manusia, maka dapat disimpulkan bahwa untuk meningkatkan kemampuan kualitas SDM kearsipan atau arsiparis khususnya maka perlu diberikan pendidikan dan pelatihan kearsipan, sehingga kemampuan teknis, keterampilan, sikap dan prilaku pengelola kearsipan sesuai dengan yang diharapkan untuk mendukung tujuan kearsipan.&lt;br /&gt;\r\n&lt;br /&gt;\r\nSedangkan arsiparis menurut Permenpan Nomor: PER/3/M.PAN/3/2009 tentang Jabatan Fungsional Arsiparis dan Angka Kreditnya adalah &amp;ldquo;jabatan yang mempunyai ruang lingkup, tugas, tanggung jawab dan wewenang untuk melakukan kegiatan pengelolaan arsip dan pembinaan kearsipan yang dilakukan oleh Pegawai Negeri Sipil (PNS) dengan hak dan kewajiban yang diberikan secara penuh oleh pejabat yang berwenang&amp;rdquo;. Dengan demikian arsiparis mempunyai kedudukan sebagai pelaksana teknis fungsional di bidang pengelolaan arsip dinamis dan statis dan pembinaan kearsipan serta merupakan jabatan karier yang hanya diduduki oleh PNS.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nPengertian arsiparis ini menjadi lebih luas jika dilihat dalam Undang-Undang Nomor 43 Tahun 2009 tentang Kearsipan, dimana disebutkan bahwa &amp;ldquo;Arsiparis adalah seseorang yang memiliki kompetensi di bidang kearsipan yang diperoleh melalui pendidikan formal dan/atau pendidikan dan pelatihan kearsipan serta mempunyai fungsi, tugas, dan tanggung jawab melaksanakan kegiatan kearsipan&amp;rdquo;. Dengan melihat pengertian ini maka arsiparis dapat merupakan jabatan fungsional arsiparis seperti yang dikemukakan oleh Permenpan seperti di atas, juga Pegawai Negeri di lingkungan lembaga Negara termasuk di lingkungan Polri dan TNI, pegawai BUMN/D, dan pegawai perusahaan yang mempunyai kompetensi di bidang kearsipan.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nDalam penulisan artikel ini penulis menggunakan metode deskriptif analitis dalam arti menggambarkan secara langsung dari data jumlah arsiparis selama lima tahun belakang, data lapangan termasuk data wawancara dalam berbagai kegiatan kearsipan. Juga dengan menggambarkan data yang berasal dari beberapa literature baik dalam bentuk buku, peraturan perundangan maupun data pendukung lainnya. Dari data yang ada dan data lapangan yang diperoleh melalui kegiatan kearsipan kemudian dianalisis dan dibandingkan untuk diperoleh pengembangan dan kemungkinan perbaikan dari permasalahan yang dihadapi.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nAdapun teknik pengumpulan data yang dilakukan adalah dengan telaah dokumen yang ada dari data lapangan baik yang diperoleh dari sumber data maupun dari hasil pengamatan ketika dilakukan kegiatan kearsipan. Selain itu juga dengan melakukan telaah dokumen yang ada seperti dari laporan, buku literature, peraturan perundangan yang kemudian dianalisis dengan melihat kenyataan yang ada untuk diperoleh alternative pemecahan permasalahan yang timbul.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\n&lt;strong&gt;Peningkatan Kualitas Arsiparis&lt;/strong&gt;&lt;br /&gt;\r\nDengan mengutip pendapat Notoatmodjo bahwa untuk meningkatkan kualitas fisik dapat diupayakan melalui program kesehatan dan gizi. Hal ini sebetulnya sesuai dengan Undang-Undang Nomor 43 Tahun 2009 tentang Kearsipan khususnya Pasal 30 ayat (2) butir d yang menyebutkan Lembaga Kearsipan nasional melaksanakan pembinaan dan pengembangan arsiparis melalui upaya (d) penyediaan jaminan kesehatan dan tunjangan profesi untuk untuk sumber daya kearsipan. Tentu saja dengan uraian seperti yang dikemukakan pada ayat (2) d ini perlu ada suatu pemikiran kira-kira jaminan kesehatan apakah yang layak diberikan kepada arsiparis. Barangkali bisa diwujudkan dalam bentuk pemeriksaan kesehatan secara periodic dengan jaminan biaya follow up jika ada kelainan suatu penyakit tertentu yang diakibatkan dari pengaruh pekerjaannya. Atau dapat pula diberikan makanan tambahan bagi pengelola kearsipan khususnya arsiparis berupa extra fooding. Adapun bentuk makanan tersebut dapat berupa susu atau menu makanan lain yang kira-kira dapat memulihkan kondisi tubuh arsiparis yang bekerja dan bergelut dengan arsip yang berdebu atau arsip tertentu yang terkontaminasi oleh bahan kimia lainnya.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nKemudian kalau menyimak Pasal 30 Undang-Undang Nomor 43 yang menyangkut masalah tunjangan profesi, memang perlu diwujudkan secara lebih nyata baik dengan peraturan perundangan yang lebih teknis lagi baik dalam bentuk Peraturan Pemerintah (PP) atau Peraturan Presiden (Perpres). Adapun rumusannya dalam peraturan perudangan tersebut konsepsinya dengan meng&amp;rdquo;adopt&amp;rdquo; dan meng&amp;rdquo;adapt&amp;rdquo; dari konsep tunjangan profesi guru, dimana seorang guru disamping memperoleh tunjangan fungsional guru juga akan memperoleh tunjangan profesi setelah guru tersebut memperoleh sertifikasi. Tunjangan profesi guru disebutkan bahwa besarannya adalah satu kali gaji pokok sesuai dengan Undang-Undang Nomor 14 Tahun 2005 tentang &amp;ldquo;Guru dan Dosen&amp;rdquo; pasal 16 ayat (2). Dengan membandingkan tunjangan profesi guru tersebut, maka tunjangan profesi arsiparis juga akan diusulkan sebesar satu kali gaji pokok. Tentu saja tunjangan itu diberikan kepada arsiparis yang telah memperoleh sertifikasi dari suatu kompetensi kearsipan tertentu, misalnya kompetensi pengelola arsip vital, kompetensi pemberkasan, kompetensi pengelolan pusat arsip, kompetensi penyusutan dan perancang Jadwal Retensi Arsip.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nSertifikasi sesuai dengan kompetensi tertentu ini memang nantinya akan diusulkan untuk diberikan tunjangan profesi kepada arsiparis yang merupakan jabatan fungsional bukan kepada seluruh arsiparis sesuai konsep Undang-Undang Nomor 43. Hanya bedanya seluruh arsiparis dapat mengajukan untuk memperoleh sertifikasi sesuai kompetensi yang ditawarkan kepada Arsip Nasional RI sebagai lembaga yang mempunyai kewenangan (mandatory) untuk penyelenggara sertifikasi kearsipan. Bagi arsiparis yang bekerja pada BUMN/D dan perusahaan tunjangan profesinya dapat diusulkan dan diatur oleh instansinya masing-masing. Untuk perusahaan tertentu yang bergerak di bidang jasa kearsipan baik jasa pembenahan ataupun jasa penyimpanan arsip inaktif, pemberian sertifikasi SDM kearsipan ini sangat diperlukan sebagai salah satu bentuk penanganan kegiatan secara professional.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nDengan melihat uraian di atas, maka sekali lagi diharapkan kualitas SDM kearsipan secara fisik sesuai dengan yang dikemukakan oleh Notoatmodjo akan meningkat walaupun itu juga belum merupakan suatu jaminan, tetapi minimal secara teori dapat dijadikan sebagai salah satu komponen untuk meningkatkan kualitas khususnya secara fisik.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nSedangkan untuk meningkatkan kemampuan kualitas nonfisik bagi arsiparis maka upaya pendidikan dan pelatihan adalah yang paling diperlukan. Diklat tersebut dapat berupa diklat penciptaan jabatan fungsional arsiparis, diklat teknis kearsipan ataupun diklat penyegaran lainnya. Untuk diklat penciptaan jabatan fungsional arsiparis ini disyaratkan untuk pengangkatan pertama menjadi arsiparis selama kurang lebih 2 bulan. Bagi yang telah dinyatakan lulus dan memperoleh STTPL maka dapat diusulkan untuk diangkat menjadi arsiparis sesuai dengan tingkatannya baik ahli maupun terampil berdasarkan tingkat Ijazah yang dimilikinya. Dengan pemberian pembekalan selama kurang lebih 2 bulan tersebut, maka arsiparis dapat menjalankan fungsi dan kegiatan kearsipan secara lebih professional, walaupun seringkali diklat tersebut masih dirasakan kurang sehingga dalam kurun waktu tertentu calon pejabat fungsional arsiparis diwajibkan untuk melakukan kegiatan kearsipan setelah kembali ke unit kerja dengan membuat laporan hasil kegiatan yang telah dilakukan.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nDiklat penyegaran juga sangat dibutuhkan tidak saja bagi pejabat fungsional arsiparis tetapi juga bagi para Pembina kearsipan baik tingkat pusat maupun daerah. Memang yang dirasakan mendesak adalah diklat pembekalan kepada para Pembina kearsipan khususnya tingkat daerah yaitu para pimpinan lembaga kearsipan baik propinsi maupun Kabupaten/Kota. Karena pada kenyataannya bahwa dapat dikatakan lebih dari 90% pimpinan lembaga kearsipan tidak mempunyai kompetensi di bidang kearsipan. Kompetensi kearsipan yang dimaksudkan disini adalah kemampuan dan pemahaman terhadap kearsipan karena memang mempunyai latar belakang pendidikan kearsipan (baik D3 Kearsipan, S1 dan S2 kearsipan), atau karena telah mengikuti diklat kearsipan. Kenyataan di daerah bahwa pengangkatan seseorang menjadi Kepala atau pimpinan Lembaga Kearsipan yang berfungsi sebagai Pembina kearsipan sangat diwarnai kepentingan tertentu dan nuansa politisnya sangat dominan. Misalnya karena seseorang menjadi tim suksesnya Gubernur atau Bupati/Walikota, maka diangkatlah sebagai pimpinan Lembaga Kearsipan sebagai balas jasa walaupun tidak mempunyai kompetensi di bidang kearsipan. Memang itu semua kewenangan dari daerah yang bersangkutan, tetapi tentunya akan lebih baik kalau seandainya pengangkatan pejabat tersebut sesuai dengan kompetensinya. Hal yang sederhana barangkali dapat dikemukakan disini bahwa pengangkatan seorang Kepala Dinas Kesehatan, misalnya, baik tingkat propinsi maupun kabupaten/kota hampir dapat dikatakan semua mempunyai dasar pengetahuan dan kompetensi sebagai dokter, tetapi hal itu tidak terjadi pada pimpinan Lembaga Kearsipan. Kita menyadari bahwa profesi arsiparis atau yang mempunyai kompetensi kearsipan masih sangat terbatas, sehingga masih sulit untuk menempatkan orang yang mempunyai kompetensi tersebut sebagai pimpinan Lembaga Kearsipan, tetapi tentunya yang diharapkan adalah penempatan tersebut sesuai dengan kegiatan yang memang ditangani sehari-hari atau yang masih ada kaitannya dengan kegiatan kearsipan. Barangkali yang perlu ditekankan disini adalah bahwa jabatan pengelola kearsipan dibutuhkan suatu pengetahuan dan keterampilan khusus yang tidak semua orang dapat melakukannya, apalagi kalau melihat fungsi Lembaga Kearsipan Daerah yang tidak saja mengelola arsip inaktif tetapi juga mengelola arsip statis daerah yang pasti membutuhkan pengetahuan khusus tentang kearsipan.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nDengan melihat kenyataan ini tentu saja perlu ada pembekalan kearsipan terhadap mereka agar mereka dapat memprogramkan dan menjalankan kegiatan kearsipan secara lebih optimal.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nSedangkan untuk pimpinan unit kearsipan tingkat daerah yang berada pada tingkat secretariat SKPD relative peranannya tidak terlalu dominan terhadap kegiatan pembinaan kearsipan, karena semua masih dalam binaan pimpinan Lembaga Kearsipan. Tetapi walaupun demikian pembekalan kearsipan melalui diklat masih dibutuhkan. Sementara untuk pimpinan Unit Kearsipan tingkat instansi pusat relative juga sudah memiliki pemahaman kearsipan karena memang selalu mendapat bimbingan dan pembinaan dari Arsip Nasional RI.&lt;br /&gt;\r\n&lt;br /&gt;\r\nBagaimana halnya dengan kualitas jabatan fungsional arsiparis, berdasarkan pengalaman ketika wawancara menyelenggarakan sertifikasi untuk kompetensi pengelola arsip vital dan pemberkasan serta pemilihan arsiparis teladan, masih terlihat bahwa kemampuan arsiparis terhadap pemahaman kearsipan serta pengembangan ilmu kearsipan masih kurang. Kenyataan ini didukung lagi dengan DUPAK yang diajukan oleh arsiparis kepada tim penilai pusat yang melakukan penilaian arsiparis golongan IV. Seharusnya pemahaman arsiparis golongan IV dengan pengalaman kerja yang cukup banyak tidak mengajukan kegiatan yang bukan kegiatan kearsipan untuk dinilai, tetapi kenyataannya berbicara lain. Dengan melihat fenomena ini tentu timbul pertanyaan, mengapa pemahaman mereka terbatas apalagi kalau dikaitkan dengan jabatan arsiparis yang relative sudah cukup lama dan sudah diberlakukan sejak tahun 1990 yang seharusnya sudah mapan. Sehingga ini merupakan bahan introspeksi bagi Arsip Nasional RI barangkali pembinaan terhadap SDM kearsipan perlu ada perubahan. Selain itu minat untuk menulis dan mengembangkan keilmuan juga masih sangat terbatas. Oleh sebab itu perlu ada diklat penyegaran bagi arsiparis termasuk diklat teknis lainnya agar kemampuan dan semangat untuk mengembangkan kearsipan tumbuh kembali.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nUsaha lainnya barangkali yang perlu dilakukan adalah dengan menumbuhkan minat untuk pengembangan keilmuan melalui kegiatan seminar baik seminar untuk lingkungan arsiparis atau seminar nasional yang berhubungan dengan isu actual yang terkait dengan kegiatan kearsipan. Seminar ini menyajikan hasil penelitian atau kajian tentang suatu temuan tertentu atau permasalahan kearsipan tertentu dengan pemecahannya. Kegiatan ini secara periodic dapat dilakukan sehingga akan membiasakan arsiparis untuk terus mengembangkan keilmuan. Sebetulnya kegiatan ini sudah dilakukan oleh arsiparis pada beberapa instansi pusat, hanya perlu diintensifkan lagi. Kalau dimungkinkan penyaji juga dari kalangan arsiparis dengan dihadiri oleh arsiparis dan umum untuk memberikan tanggapannya, sehingga dengan kegiatan seperti ini banyak keuntungan yang diperoleh tidak saja untuk pengembangan ilmu seperti telah disebutkan di atas, juga akan menambah kegiatan dan kemungkinan perolehan angka kredit bagi penyaji dan yang menghadiri seminar.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nMinat untuk menulis artikel kearsipan juga perlu ditingkatkan, kalau seandainya kesulitan untuk dapat dimuat pada media massa nasional, masih banyak peluang untuk dapat menerbitkan pada media kearsipan atau bulletin khususnya untuk artikel yang bersifat idea atau gagasan atau opini di media yang diterbitkan oleh ANRI atau pada beberapa Lembaga Kearsipan Propinsi seperti Jawa Barat, Jawa Tengah atau Jawa Timur. Sedangkan untuk hasil kajian dan sedikit yang berbau ilmiah dapat diterbitkan pada Jurnal Kearsipan ANRI atau PDII, LIPI. Dengan semakin banyaknya opini, gagasan atau hasil kajian yang diterbitkan maka diharapkan dapat menjadi sarana informasi untuk sharing experience dan sharing information sekaligus untuk pengembangan ilmu kearsipan.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Peningkatan Kuantitas Arsiparis&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Dengan melihat data perkembangan arsiparis selama 5 tahun belakangan dimana jumlahnya menurun lebih dari 10 % tentu sangat memprihatinkan dan perlu ada pengkajian yang mendalam mengapa hal tersebut bisa terjadi dan apa penyebabnya serta cara mengatasinya. Penurunan ini dirasakan sangat ironis, apalagi untuk tingkat propinsi padahal selama kurang lebih 5 tahun dan terakhir tahun 2008, ANRI memberikan bantuan dana dekonsentrasi untuk tingkat propinsi dalam bentuk diklat pengadaan atau penciptaan jabatan fungsional arsiparis. Dengan asumsi satu angkatan diklat sebanyak 30 orang calon arsiparis untuk satu propinsi dalam satu tahun sehingga selama 5 tahun pada 33 propinsi akan tercipta 4950 calon arsiparis. Tetapi kenyataannya justru terbalik untuk tingkat propinsi jumlah arsiparisnya menurun sebanyak 40 %. Ada gejala apa ini, hal tersebut perlu dianalisis secara khusus dan mendalam. Berdasarkan data lapangan dan wawancara secara informal dengan Pembina kearsipan pada beberapa propinsi dapat dikemukakan sebagai berikut bahwa banyak peserta calon arsiparis yang diikutkan diklat memang tidak berminat sebagai arsiparis, ada kesan mereka dipaksa untuk memenuhi target dan kuota jumlah peserta sebanyak 30 orang. Belum lagi persyaratan administrative yang terkadang tidak memenuhi misalnya diklat penciptaan arsiparis tingkat ahli dengan syarat minimal ijazah S1, tetapi peserta yang didiklat ijazahnya masih belum S 1. Atau banyak juga calon arsiparis yang telah didiklat dan dinyatakan lulus kemudian diangkat sebagai pejabat structural yang lebih menjanjikan dan lebih besar tunjangannya.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nFaktor yang lain adalah proses pengangkatan yang ada kesan dipersulit, dimana calon arsiparis yang telah memeperoleh STTPL tidak diusulkan oleh instansi terkait di daerah karena beberapa alasan baik menyangkut masalah tunjangan yang ada kekhawatiran akan dibebankan pada APBD atau masalah tidak jelasnya formasi arsiparis.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nDengan melihat beberapa kenyataan dan permasalahan tersebut di atas maka perlu ada usaha yang lebih intensif lagi dari ANRI sebagai lembaga Pembina jabatan fungsional arsiparis untuk melakukan sosialisasi khususnya untuk tingkat propinsi tentang pentingnya kearsipan dan jabatan profesi untuk menangani kegiatan kearsipan secara lebih professional. Selain itu perlu ditekankan tentang tunjangan bagi arsiparis akan dianggarkan dan dibayarkan secara nasional dari dana APBN. Pertemuan secara terprogram dengan instansi terkait juga perlu dilakukan misalnya dengan Menpan, BKN, Bappenas dan Direktorat Anggaran untuk membicarakan secara lebih teknis tentang kelanjutan jabatan fungsional arsiparis. Sedangkan untuk tingkat propinsi perlu dibicarakan dengan BKD, Lembaga Kearsipan Propinsi, Bappeda dan instansi terkait lainnya.&lt;br /&gt;\r\nKemudian untuk mengatasi calon arsiparis yang telah didiklat dan belum diangkat, maka perlu untuk didata ulang berapa jumlah mereka keseluruhan kemudian diinventarisir berapa orang yang masih berminat untuk menjadi arsiparis kemudian diusulkan untuk segera diangkat dan dikoordinasikan dengan instansi daerah yang terkait.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nUntuk permasalahan arsiparis tingkat pusat nampaknya tidak sekompleks arsiparis propinsi, dan dalam 5 tahun belakangan tingkat pusat mengalami kenaikan yang cukup signifikan, hal ini kemungkinan disebabkan karena lokasi instansi pusat berdekatan dengan ANRI sehingga informasi tentang jabatan fungsional arsiparis dan persyaratan lainnya dengan mudah diperoleh. Selain itu, minat pegawai untuk jadi arsiparis sudah mulai terbuka bahkan di Kementrian Luar Negara seorang calon arsiparis sebelum didiklat dites terlebih dahulu karena peminatnya cukup banyak. Setelah dilihat secara lebih mendalam mengapa animo pegawai untuk menjadi arsiparis sangat besar karena salah satu motivasinya adalah karena ada semacam kebijakan dari pimpinan di Kementrian tersebut bahwa seorang yang diangkat jadi arsiparis akan segera ditempatkan di perwakilan luar negeri untuk melakukan pembinaan dan pembenahan kearsipan pada kedutaan atau konsulat dalam 2 atau beberapa bulan, dan setelah selesai akan ditempatkan pada Negara lain untuk melakukan kegiatan yang sama. Kebijakan ini nampaknya yang mendorong pegawai untuk menjadi arsiparis. Kebijakan dan dukungan pimpinan seperti di Kementrian Luar Negeri ini barangkali bisa ditiru oleh Kementrian lain agar motivasi menjadi arsiparis semakin tinggi.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nSecara umum dan secara jujur dapat dikatakan bahwa minat pegawai untuk menjadi arsiparis masih rendah, contoh Kementrian Luar Negeri adalah hanya kasus yang sedikit berbeda dengan instansi lainnya, buktinya secara nasional jumlah arsiparis dalam 5 tahun belakangan turun lebih dari 10 %. Menurunnya jumlah tersebut kemungkinan disebabkan oleh beberapa factor antara lain jabatan arsiparis memang dianggap jabatan yang kurang menarik, factor lain kemungkinan adalah jumlah tunjangannya juga dirasakan masih belum memadai dengan resiko yang harus ditanggung serta kemungkinan dikenakan sanksi hukum yang berat, dan kemungkinan lain karena factor batas usia pension.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nFaktor utama bahwa jabatan fungsional kurang bergengsi dibandingkan jabatan structural termasuk jabatan arsiparis, ini memang secara umum harus diakui bahwa jika ada dua pilihan antara jabatan arsiparis dengan jabatan structural bisa dikatakan sebagian besar akan memilih jabatan structural. Hanya karena keterbatasan jumlah jabatan structural saja yang menjadi salah satu alasan mengapa orang memilih jabatan fungsional arsiparis. Hanya sekarang bagaimana mengoptimalkan arsiparis yang ada baik secara kualitas dan kuantitas dengan melihat jumlah formasi arsiparis yang ideal yang harus dimiliki oleh instansi.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nKenyataan lain yang juga menjadi pertimbangan seorang PNS untuk menjadi arsiparis adalah batas usia pensiun yang sama dengan PNS secara umum yaitu masih 56 tahun. Seperti kita ketahui bahwa salah satu motivasi seseorang untuk menjadi pejabat fungsional adalah factor batas usia pension yang lebih tinggi, demikian pula untuk arsiparis. Sehingga alasan itu yang menjadi salah satu sebab PNS tidak berminat menjadi arsiparis dan ini menjadikan salah satu sebab menurunnya jumlah arsiparis. Kemudian kalau kita lihat data yang ada paling tidak ada sekitar 23 jabatan fungsional yang mempunyai batas usia pension diatas 56 tahun. Misalnya untuk Widyaiswara atau bahkan Pustakawan yang merupakan jabatan serumpun dengan arsiparis mempunyai batas usia pension 60 tahun dan 65 tahun untuk Pustakawan Utama Golongan IV d dan IV e. Atas dasar tersebut barangkali perlu ada usaha untuk menaikkan batas usia pension bagi arsiparis karena kalau tidak akan terjadi kesenjangan dan kelangkaan untuk jabatan arsiparis utama. Secara matematis kalau tidak ada perpanjangan usia pension tersebut dan dengan batas usia 56 tahun maka tidak akan ada arsiparis utama Golongan IV d dan IV e, padahal untuk golongan tersebut sangat dibutuhkan untuk mengembangkan ilmu kearsipan.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nAdapun perpanjangan batas usia pension dapat dilakukan dengan beberapa opsi, misalnya 60 tahun dan 65 tahun untuk Arsiparis Utama seperti pada jabatan Pustakawan, atau semua disamaratakan menjadi 60 tahun, atau untuk Golongan II dan III tetap 56 tahun dan golongan IV 60 tahun (seperti untuk jabatan structural dimana untuk pejabat eselon II dan I yang identik dengan Golongan IV dapat diperpanjang sampai 60 tahun). Manapun yang dipilih dari opsi tersebut, maka diharapkan motivasi PNS untuk menjadi arsiparis dapat meningkat dan secara langsung jumlah atau kuantitas juga akan bertambah.&lt;br /&gt;\r\n&lt;br /&gt;\r\nBerdasarkan hasil analisis di atas maka secara khusus dapat disimpulkan bahwa untuk meningkatkan kualitas dan kuantitas arsiparis perlu dilakukan beberapa usaha antara lain:&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li&gt;Untuk meningkatkan kualitas arsiparis secara fisik perlu diwujudkan jaminan kesehatan apakah dalam bentuk pemeriksaan kesehatan secara rutin dengan bantuan pengobatan bagi arsiparis yang perlu follow up dari hasil pemeriksaan sebagai akibat dari pekerjaan yang dilakukan. Atau dapat juga dengan pemberian extra fooding bagi arsiparis sebagai menu tambahan akibat kemungkinan terkenanya resiko kesehatan dari pekerjaan yang dilakukan. Tunjangan profesi bagi arsiparis yang mempunyai kompetensi tertentu dan telah memperoleh sertifikasi sesuai amanat Undang-Undang Nomor 43 perlu juga direalisasikan.&lt;/li&gt;\r\n	&lt;li&gt;Sedangkan untuk meningkatkan kualitas non fisik, usaha yang perlu ditempuh dengan memberikan diklat baik diklat pengangkatan untuk penciptaan arsiparis, diklat teknis kearsipan, dan diklat penyegaran. Seminar untuk membahas permasalahan tertentu atau mengkaji isu kearsipan tertentu secara periodic perlu dilakukan yang diharapkan akan menjadi sarana untuk berkomunikasi, sarana untuk bertukar pengalaman dan bertukar pikiran dan sekaligus sebagai sarana pengembangan ilmu kearsipan.&lt;/li&gt;\r\n	&lt;li&gt;Untuk meningkatkan kuantitas dari jumlah arsiparis yang cenderung menurun dalam 5 tahun belakangan, dapat dilakukan dengan pemberian motivasi dan stimulant bagi PNS calon arsiparis melalui kegiatan sosialisasi akan pentingnya kegiatan kearsipan dan peranan pengelola kearsipan untuk menangani kegiatan kearsipan secara lebih professional sehingga dapat menumbuhkan minat untuk menekuni jabatan arsiparis. Tunjangan fungsional sebagai salah satu kompensasi juga perlu ditingkatkan sesuai dengan peranan arsiparis sebagai pengelola kearsipan dan pengelola informasi dan resiko kesehatan sebagai akibat dari pekerjaan serta kemungkinan terkena sanksi hukum.&lt;/li&gt;\r\n	&lt;li&gt;Selain itu, perlu juga dipikirkan untuk perpanjangan batas usia pension bagi jabatan arsiparis yang selama ini diberlakukan sama dengan batas usia pensiun PNS secara umum, sehingga diharapkan akan menjadi salah satu daya tarik bagi PNS untuk menjadi arsiparis dan sekaligus agar tidak terjadi kelangkaan untuk jabatan Arsiparis Utama Golongan IV d dan IV e yang berfungsi untuk mengembangkan ilmu kearsipan.&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\n&lt;strong&gt;Daftar Pustaka&lt;/strong&gt;&lt;br /&gt;\r\nNotoatmodjo, Soekidjo, Pengembangan Sumber Daya Manusia, PT Rineka Cipta, Bandung, 1998.&lt;br /&gt;\r\nPeraturan Menteri Negara Pendayagunaan Aparatur Negara Nomor: PER/3/M.PAN/3/2009, Tentang Jabatan Fungsional Arsiparis dan Angka Kreditnya, Jakarta, 2009&lt;br /&gt;\r\nPrawirosentono, Suyadi, Model Pembangunan Sumber Daya Manusia Negara-Negara Berkembang, BPFE, Yogyakarta, 1995.&lt;br /&gt;\r\nUndang-Undang No. 14 Tahun 2008, Tentang Keterbukaan Informasi Publik, Jakarta, 2008.&lt;br /&gt;\r\nUndang-Undang No. 43 Tahun 2009, Tentang Kearsipan, Jakarta, 2009&lt;br /&gt;\r\nWesterman, John dan Donoghue, Pauline, terjemahan Suparman, Sumber Daya Manusia, Bumi Aksara, Jakarta, 1992&lt;br /&gt;\r\nZainun, Buchari, Manajemen Sumber Daya Manusia, Haji Masagung, Jakarta, 1996.&lt;/p&gt;\r\n', '', NULL, 'Y', 52, '19', NULL, NULL, 'Y', NULL, NULL, '2017-05-23 10:32:51', 'Administrator', '2017-09-11 14:36:31', ''),
(141, 'slider141.jpg', NULL, '-', '-', NULL, NULL, '', '', NULL, 'Y', 34, '1', NULL, NULL, 'Y', NULL, NULL, '2017-05-23 10:36:15', 'Administrator', '2017-09-26 14:36:01', ''),
(142, 'slider142.jpg', NULL, '-', '-', NULL, NULL, '', '', NULL, 'Y', 32, '1', NULL, NULL, 'Y', NULL, NULL, '2017-05-23 10:37:18', 'Administrator', '2017-09-26 14:35:31', ''),
(143, 'features143.png', NULL, 'Standard Operating Procedure', 'Standard Operating Procedure', NULL, NULL, '&lt;p&gt;Standard Operating Procedure&lt;/p&gt;\r\n', '', NULL, 'Y', 45, '2', NULL, NULL, 'Y', NULL, NULL, '2017-09-11 16:53:36', '', '2017-09-11 17:01:43', ''),
(144, NULL, NULL, 'Dinas Pendidikan', 'DP/001', NULL, NULL, 'Arsip pendidikan satu', NULL, NULL, 'Y', 1, '30', NULL, NULL, 'Y', '2017-06-27 00:00:00', NULL, '2017-09-11 20:55:32', 'System Administrator', NULL, NULL),
(145, NULL, NULL, 'Dinas Pendidikan', 'DP/002', NULL, NULL, 'Arsip pendidikan dua', NULL, NULL, 'Y', 2, '30', NULL, NULL, 'Y', '2017-06-04 00:00:00', NULL, '2017-09-11 20:55:56', 'System Administrator', NULL, NULL),
(146, NULL, NULL, 'Dinas Kesehatan', 'DK/001', NULL, NULL, 'Arsip kesehatan satu', NULL, NULL, 'Y', 3, '30', NULL, NULL, 'Y', '2017-03-28 00:00:00', NULL, '2017-09-11 20:56:24', 'System Administrator', NULL, NULL),
(147, NULL, NULL, 'Dinas Kesehatan', 'DK/002', NULL, NULL, 'Arsip kesehatan dua', NULL, NULL, 'Y', 4, '30', NULL, NULL, 'Y', '2017-03-06 00:00:00', NULL, '2017-09-11 20:56:47', 'System Administrator', NULL, NULL),
(148, NULL, NULL, 'Dinas Kehutanan', 'DHut/001', NULL, NULL, 'Arsip kehutanan satu', NULL, NULL, 'Y', 5, '30', NULL, NULL, 'Y', '2017-03-05 00:00:00', NULL, '2017-09-11 20:57:55', 'System Administrator', NULL, NULL),
(149, NULL, NULL, 'Dinas Kehutanan', 'DHut/002', NULL, NULL, 'Arsip kehutanan dua', NULL, NULL, 'Y', 6, '30', NULL, NULL, 'Y', '2017-03-08 00:00:00', NULL, '2017-09-11 20:58:22', 'System Administrator', NULL, NULL),
(150, 'slider35.jpg', NULL, '-', '-', NULL, NULL, '', '', NULL, 'Y', 35, '1', NULL, NULL, 'Y', NULL, NULL, '2017-09-26 14:43:01', '', NULL, NULL),
(151, 'blog5.JPG', NULL, 'Peringatan hari hak untuk tahu sedunia', '', NULL, NULL, '&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-family:Helvetica&quot;&gt;&lt;span style=&quot;color:#404040&quot;&gt;Jakarta (28/9)-Dalam rangka memperingati Hari Hak Untuk Tahu Sedunia (The International Right To Know Day) yang jatuh setiap tanggal 28 September, Komisi Informasi Pusat (KIP) menggelar Debat Mahasiswa ke-2 yang digelar di IPB International Convention Center (IICC) Kota Bogor, 26-28 September 2017.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-family:Helvetica&quot;&gt;&lt;span style=&quot;color:#404040&quot;&gt;Hari Hak Untuk Tahu Sedunia dirayakan oleh seluruh dunia yang memiliki Undang-undang Keterbukaan Informasi. Momen ini merupakan kesempatan KIP untuk melakukan kampanye dan promosi tentang keterbukaan informasi kepada seluruh warga negara untuk menyatakan bahwa setiap warga negara punya hak untuk tahu.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-family:Helvetica&quot;&gt;&lt;span style=&quot;color:#404040&quot;&gt;Kegiatan peringatan ini diselenggarakan di Kota Bogor bersamaan dengan Debat Mahasiswa seluruh Indonesia. Babak final dilaksanakan pada tanggal 28 September 2017 bertepatan dengan Hari Hak Untuk Tahu Sedunia. Babak final dibuka secara resmi Wali Kota Bogor Bima Arya sekaligus beliau menyampaikan hal-hal tentang keterbukaan informasi yang sudah dilakukan di Kota Bogor.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-family:Helvetica&quot;&gt;&lt;span style=&quot;color:#404040&quot;&gt;Sedangkan terkait materi Debat Mahasiswa yakni tentang keterbukaan informasi. Dalam rangka sosialisasi dan edukasi keterbukaan informasi, diharapkan mahasiswa dapat menjadi agen perubahan dalam meneruskan informasi kepada masyarakat dan menjadi tahu banyak tentang keterbukaan informasi.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-family:Helvetica&quot;&gt;&lt;span style=&quot;color:#404040&quot;&gt;Universitas Gajah Mada (UGM) Yogyakarta dan Universitas Islam Negeri (UIN) Walisongo Semarang terbaik pertama dan kedua pada acara debat mahasiswa ke-2 yang digelar Komisi Informasi Pusat. (lnh/humas)&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n', '', NULL, 'Y', 5, '14', NULL, NULL, 'Y', NULL, NULL, '2017-10-02 09:27:54', '', NULL, NULL),
(152, 'blog6.JPG', NULL, 'Ekspose Inventaris Arsip Kementrian Pekerjaan Umum 1950-2004', '', NULL, NULL, '&lt;p&gt;Jakarta (27/9),&amp;nbsp;&lt;span style=&quot;color:#1d2129&quot;&gt;Deputi Bidang Konservasi Arsip ANRI H. M Taufik membuka secara resmi kegiatan Ekspose Inventaris Arsip Kementerian Pekerjaan Umum Republik Indonesia Tahun 1950-2004. Acara ini dilaksanakan di Ruang Noerhadi Magetsari, Gedung C Lantai 2 ANRI.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#1d2129&quot;&gt;Pengolahan arsip statis Departemen Pekerjaan Umum republik Indonesia (DPU RI) 1950-2004 adalah pengaturan informasi dan fisik arsip DPU RI 1950-2004 yang tersimpan di ANRI serta penyusunan sarana bantu penemuan kembalinya berupa inventaris arsip berdasarkan prinsip dan kaidah kearsipan. Dengan tersusunnya inventaris arsip ini diharapkan dapat bermanfaat dalam bidang pendidikan dan penelitian dimasa yang akan datang. (mdh)&lt;/span&gt;&lt;/p&gt;\r\n', '', NULL, 'Y', 6, '14', NULL, NULL, 'Y', NULL, NULL, '2017-10-02 09:29:13', '', NULL, NULL),
(153, 'slider153.JPG', NULL, 'RAKORNAS SIKN DAN JIKN', '', NULL, NULL, '&lt;p&gt;Arsip Nasional Republik Indonesia (ANRI) gelar Rapat Koordinasi Nasional (Rakornas) Sistem Informasi &amp;nbsp;Kearsipan Nasional (SIKN) &amp;nbsp;dan Jaringan Informasi Kearsipan Nasional (JIKN) di Kota Batam (27/09). Penyelenggaraan Rakornas SIKN dan JIKN merupakan sarana koordinasi fungsional dan koordinasi temu jaringan, sebagaimana diamanatkan Pasal 121 Peraturan Pemerintah Nomor 28 Tahun 2012 tentang Pelaksanaan Undang-Undang Nomor 43 Tahun 2009 tentang Kearsipan.&lt;/p&gt;\r\n\r\n&lt;p&gt;Penyelenggaraan Rakornas SIKN dan JIKN tahun 2017 di Kota Batam ini dimaksudkan sebagai sarana temu koordinasi simpul jaringan untuk dapat bertukar informasi dan pengalaman serta mempererat hubungan kerja dan sinergitas antara pusat jaringan nasional serta simpul jaringan SIKN dan JIKN yang tersebar di seluruh Indonesia.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;quot;Tujuannya adalah untuk membangun komunikasi yang efektif antara pusat jaringan nasional dan simpul jaringan dalam rangka meningkatkan kualitas penyelenggaraan SIKN dan JIKN&amp;quot;, tutur Kepala Pusat SIKN dan JIKN Desi Pratiwi.&lt;/p&gt;\r\n\r\n&lt;p&gt;Sementara itu, Kepala ANRI Mustari Irawan menyampaikan bahwa program SIKN dan JIKN dilaksanakan untuk mewujudkan open government. &amp;quot;Pemerintah menempatkan Program Pengelolaan Sistem dan Jaringan Informasi Kearsipan Nasional sebagai salah satu Program Prioritas Nasional dalam Nawacita Tahun 2015&amp;ndash;2019, sebagaimana dijelaskan dalam Peraturan Pemerintah Nomor 2 Tahun 2015 tentang Rencana Pembangunan Jangka Menengah Nasional Tahun 2015&amp;ndash;2019, untuk mewujudkan penerapan open government, yang merupakan upaya untuk mendukung terwujudnya penyelenggaraan pemerintahan yang terbuka, partisipatif dan akuntabel dalam penyusunan kebijakan publik, serta pengawasan terhadap penyelenggaraan negara dan pemerintahan&amp;quot;, ungkap Mustari.&lt;/p&gt;\r\n\r\n&lt;p&gt;Sekretaris Daerah Kota Batam Jefridin sangat mendukung penerapan program SIKN dan JIKN. &amp;quot;Pemerintah Kota Batam terus berkomitmen mendukung kebijakan pemerintah tentang Nawa Cita terutama pada point kedua yaitu membangun tata kelola pemerintahan yang bersih, efektif, demokratis dan terpercaya dan kebijakan pemerintah tentang E-Government dan Open Government, serta pelaksanaan amanat UU nomor 43 Tahun 2009 tentang Kearsipan, maka Dinas Perpustakaan dan Kearsipan Kota Batam telah bergabung menjadi simpul jaringan SIKN dan JIKN pada tahun 2017&amp;quot;, terang Jefridin.&lt;br /&gt;\r\nMustari berharap melalui Rakornas SIKN dan JIKN dapat terjalin komunikasi efektif antar simpul jaringan. &amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;Rakornas SIKN dan JIKN tahun 2017, yang diselenggarakan pada tanggal 27 s.d 29 September 2017, diikuti oleh peserta dari instansi pusat, lembaga kearsipan daerah provinsi dan kabupaten/kota, serta perguruan tinggi negeri. (sa)&amp;nbsp;&lt;/p&gt;\r\n', 'Baca selanjutnya', NULL, 'Y', 40, '1', NULL, NULL, 'Y', NULL, NULL, '2017-10-02 09:30:53', '', '2017-10-05 10:49:52', ''),
(154, 'slider36', NULL, 'Proses Input Data Kearsipan, Rahasia?', 'Kearsipan Kota Depok', NULL, NULL, '&lt;p&gt;Bismillah coba dulu&lt;/p&gt;\r\n', 'Slider1', NULL, 'Y', 8, '14', NULL, NULL, 'Y', NULL, NULL, '2017-10-05 10:23:03', '', '2017-10-05 10:42:07', ''),
(155, 'slider37.png', NULL, 'Slider Contoh', 'Hanya Deskripsi', NULL, NULL, '&lt;p&gt;Test&lt;/p&gt;\r\n', 'slider', NULL, 'Y', 37, '1', NULL, NULL, 'Y', NULL, NULL, '2017-10-05 10:23:05', '', NULL, NULL),
(156, 'features156.jpg', NULL, 'Kearsipan', 'testting', NULL, NULL, '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://dkp.digitalfatih.com/uploads/17635474_176993812819062_7542263187678895057_o.jpg&quot; style=&quot;height:1080px; width:1080px&quot; /&gt;&lt;/p&gt;\r\n', 'Read More', NULL, 'Y', 47, '2', NULL, NULL, 'Y', NULL, NULL, '2017-10-05 10:36:25', '', '2017-10-05 10:38:17', ''),
(157, 'blog9', NULL, 'Pasukan Militer Sangar Indonesia Bantu Jepang', 'Indonesia Bantu Jepang', NULL, NULL, '&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;span style=&quot;font-family:Arial,Helvetica,sans-serif&quot;&gt;Heboooh,mau tau keseruannya?&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;span style=&quot;font-family:Arial,Helvetica,sans-serif&quot;&gt;Tonton langsung di halaman dibawah ini&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a href=&quot;https://www.vidio.com/watch/618685-5-pasukan-militer-sangar-indonesia-bentukan-jepang?channel_id=1113437&quot; target=&quot;_self&quot;&gt;&lt;span style=&quot;color:#ffffff&quot;&gt;&lt;span style=&quot;background-color:#3498db&quot;&gt;https://www.vidio.com/watch/618685-5-pasukan-militer-sangar-indonesia-bentukan-jepang?channel_id=1113437&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/p&gt;\r\n', 'Tonton sekarang..', NULL, 'Y', 13, '14', NULL, NULL, 'Y', NULL, NULL, '2017-10-05 11:04:45', '', '2017-10-05 11:25:01', '');

-- --------------------------------------------------------

--
-- Table structure for table `sys_fe_content_full_ver`
--

CREATE TABLE `sys_fe_content_full_ver` (
  `fe_content_id` int(11) NOT NULL,
  `fe_img_files` varchar(25) DEFAULT NULL,
  `fe_img_files2` varchar(25) DEFAULT NULL,
  `fe_content_title` varchar(75) DEFAULT NULL,
  `fe_content_short_desc` varchar(255) DEFAULT NULL,
  `fe_content_short_desc2` varchar(255) DEFAULT NULL,
  `fe_content_short_desc3` varchar(255) DEFAULT NULL,
  `fe_full_content` text,
  `fe_content_btn_label` varchar(25) DEFAULT NULL,
  `fe_content_btn_url` varchar(55) DEFAULT NULL,
  `fe_link_clickable` varchar(1) DEFAULT NULL,
  `fe_content_sort_order` smallint(6) DEFAULT NULL,
  `fe_section_name` varchar(25) DEFAULT NULL COMMENT 'Section name: sengaja tidak ambil section id, supaya memudahkan pas query',
  `fe_content_category` varchar(17) DEFAULT NULL,
  `fe_content_icon` varchar(25) DEFAULT NULL,
  `fe_sosmed` varchar(255) DEFAULT NULL,
  `status_active` varchar(1) DEFAULT NULL,
  `display_start_from` datetime DEFAULT NULL,
  `display_until` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(25) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sys_fe_content_full_ver`
--

INSERT INTO `sys_fe_content_full_ver` (`fe_content_id`, `fe_img_files`, `fe_img_files2`, `fe_content_title`, `fe_content_short_desc`, `fe_content_short_desc2`, `fe_content_short_desc3`, `fe_full_content`, `fe_content_btn_label`, `fe_content_btn_url`, `fe_link_clickable`, `fe_content_sort_order`, `fe_section_name`, `fe_content_category`, `fe_content_icon`, `fe_sosmed`, `status_active`, `display_start_from`, `display_until`, `create_date`, `create_by`, `update_date`, `update_by`) VALUES
(1, 'bg1.jpg', NULL, 'Multi is the best Onepage html template', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et  dolore magna incididunt ut labore aliqua pertama. ', NULL, NULL, NULL, 'Read More', 'wbadmin/pengumuman1', NULL, 1, 'Slider', NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'bg2.jpg', NULL, 'Pengumuman Untuk Seluruh Warga RT 5', 'Hari minggu tanggal 2 April 2017 kita adakan kerja bakti sekaligus rapat warga membahas keuangan warga. ', NULL, NULL, NULL, 'Selanjutnya...', 'wbadmin/pengumuman2', NULL, 2, 'Slider', NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(3, '0', NULL, 'I\'m currently using JQuery UI Dragabble, Droppable and sortable. I have two', '', NULL, NULL, 'I\'m currently using JQuery UI Dragabble, Droppable and sortable. I have two div sections at top and bottom of my php file were i\'m dragging and dropping contents from bottom to top div sections.\r\nIn top div section i\'m performing Sortable JQUery opertions my next requirment is when i perform sorting operation in top section its order should be automatically updated in my MYSQL DB i gotta stuck like how to pass the sorted order to my MySQL db via ajax and php file. Can somebody suggest some help in Achieving it!', 'Download Ayeuna!', 'ww.com', NULL, 0, 'Headline', NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'main-feature.png', NULL, 'AWESOME FEATURES', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut<br>et dolore magna aliqua. Ut enim ad minim veniam', 'UX design', NULL, 'Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater', NULL, NULL, 'Y', 1, 'Features', NULL, 'fa fa-line-chart', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'main-feature.png', NULL, 'AWESOME FEATURES', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut<br>et dolore magna aliqua. Ut enim ad minim veniam', 'UI design', NULL, 'Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater', NULL, NULL, 'Y', 2, 'Features', NULL, 'fa fa-cubes', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'main-feature.png', NULL, 'AWESOME FEATURES', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut<br>et dolore magna aliqua. Ut enim ad minim veniam', 'SEO Services', NULL, 'Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater', NULL, NULL, 'N', 3, 'Features', NULL, 'fa fa-pie-chart', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'main-feature.png', NULL, 'AWESOME FEATURES', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut<br>et dolore magna aliqua. Ut enim ad minim veniam', 'SEO Services', NULL, 'Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater', NULL, NULL, 'Y', 4, 'Features', NULL, 'fa fa-pie-chart', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'cta2-img.png', NULL, 'MULTI IS CREATIVE HTML TEMPLATE', 'Mauris pretium auctor quam. Vestibulum et nunc id nisi fringilla <br>iaculis. Mauris pretium auctor quam.', NULL, NULL, NULL, 'Free Download', 'www.com', NULL, 1, 'Template', NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(9, NULL, NULL, 'OUR SERVICES', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br>et dolore magna aliqua. Ut enim ad minim veniam', 'UX design', NULL, 'Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater', NULL, NULL, 'Y', 1, 'Services', NULL, 'fa fa-line-chart', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(10, NULL, NULL, 'OUR SERVICES', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br>et dolore magna aliqua. Ut enim ad minim veniam', 'UI design', NULL, 'Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater', NULL, NULL, 'N', 2, 'Services', NULL, 'fa fa-cubes', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(11, NULL, NULL, 'OUR SERVICES', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br>et dolore magna aliqua. Ut enim ad minim veniam', 'SEO Services', NULL, 'Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater', NULL, NULL, 'Y', 3, 'Services', NULL, 'fa fa-pie-chart', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(12, NULL, NULL, 'OUR SERVICES', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br>et dolore magna aliqua. Ut enim ad minim veniam', 'SEO Services', NULL, 'Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater', NULL, NULL, 'Y', 4, 'Services', NULL, 'fa fa-bar-chart', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(13, NULL, NULL, 'OUR SERVICES', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br>et dolore magna aliqua. Ut enim ad minim veniam', 'Android App', NULL, 'Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater', NULL, NULL, 'Y', 5, 'Services', NULL, 'fa fa-language', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(14, NULL, NULL, 'OUR SERVICES', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br>et dolore magna aliqua. Ut enim ad minim veniam', 'Win App', NULL, 'Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater', NULL, NULL, 'N', 6, 'Services', NULL, 'fa fa-bullseye', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(15, '01.jpg', '01.jpg', 'OUR WORKS', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut enim ad minim veniam', 'Portfolio Item 1', 'Lorem Ipsum Dolor Sit 1', NULL, 'Creative', NULL, NULL, 1, 'Works', NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(16, '02.jpg', '02.jpg', 'OUR WORKS', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut enim ad minim veniam', 'Portfolio Item 2', 'Lorem Ipsum Dolor Sit 2', NULL, 'Corporate', NULL, NULL, 2, 'Works', NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(17, '03.jpg', '03.jpg', 'OUR WORKS', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut enim ad minim veniam', 'Portfolio Item 3', 'Lorem Ipsum Dolor Sit 3', NULL, 'Portfolio', NULL, NULL, 3, 'Works', NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(18, '04.jpg', '04.jpg', 'OUR WORKS', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut enim ad minim veniam', 'Portfolio Item 4', 'Lorem Ipsum Dolor Sit 4', NULL, 'Corporate', NULL, NULL, 4, 'Works', NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(19, '05.jpg', '05.jpg', 'OUR WORKS', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut enim ad minim veniam', 'Portfolio Item 5', 'Lorem Ipsum Dolor Sit 5', NULL, 'Creative', NULL, NULL, 5, 'Works', NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(20, '06.jpg', '06.jpg', 'OUR WORKS', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut enim ad minim veniam', 'Portfolio Item 6', 'Lorem Ipsum Dolor Sit 6', NULL, 'Corporate', NULL, NULL, 6, 'Works', NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(21, '07.jpg', '07.jpg', 'OUR WORKS', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut enim ad minim veniam', 'Portfolio Item 7', 'Lorem Ipsum Dolor Sit 7', NULL, 'Creative', NULL, NULL, 7, 'Works', NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(22, '08.jpg', '08.jpg', 'OUR WORKS', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut enim ad minim veniam', 'Portfolio Item 8', 'Lorem Ipsum Dolor Sit 8', NULL, 'Corporate', NULL, NULL, 8, 'Works', NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(23, '06.jpg', NULL, 'About Us', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br>\r\net dolore magna aliqua. Ut enim ad minim veniam ', 'Multi Capability', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Learn More', 'www.more.com', NULL, 1, 'About', NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(24, '01.jpg', NULL, 'Meet The Team', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut enim ad minim veniam', 'Bin Burhan', 'Co-Founder', 'Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater', NULL, NULL, 'Y', 2, 'Team', NULL, NULL, 'facebook|www.facebook.com;twitter|www.twitter.com;google-plus|www.google.com;linkedin|www.linkedin.com', 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(25, '02.jpg', NULL, 'Meet The Team', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut enim ad minim veniam', 'Jane Man', 'Project Manager', 'Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater', '', '', 'Y', 3, 'Team', NULL, '', 'facebook|www.facebook.com;twitter|www.twitter.com;google-plus|www.google.com;linkedin|www.linkedin.com', 'Y', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', ''),
(26, '03.jpg', NULL, 'Meet The Team', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut enim ad minim veniam', 'Pahlwan', 'Designer', 'Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater', NULL, NULL, 'Y', 4, 'Team', NULL, NULL, 'facebook|www.facebook.com;twitter|www.twitter.com;google-plus|www.google.com;linkedin|www.linkedin.com', 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(27, '04.jpg', NULL, 'Meet The Team', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut enim ad minim veniam', 'Nasir uddin', 'UI/UX', 'Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater', NULL, NULL, 'Y', 5, 'Team', NULL, NULL, 'facebook|www.facebook.com;twitter|www.twitter.com;google-plus|www.google.com;linkedin|www.linkedin.com', 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(28, NULL, NULL, 'Get In Touch', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut enim ad minim veniam', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Get In Touch', NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(29, NULL, NULL, 'Contact', 'Contact Us', NULL, NULL, '<strong>Twitter, Inc.</strong><br>\r\n                          795 Folsom Ave, Suite 600<br>\r\n                          San Francisco, CA 94107<br>\r\nP: (123) 456-7890', NULL, NULL, NULL, 1, 'Contact', NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(30, NULL, NULL, '2017 Dinas Kearsipan dan Perpustakaan Kota Depok', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Footer', NULL, NULL, 'facebook|www.facebook.com;twitter|www.twitter.com;google-plus|www.google.com;linkedin|www.linkedin.com;pinterest|www.pinterest.com;dribbble|www.dribbble.com;behance|www.behance.com', 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
(31, '03.jpg', NULL, 'LATEST BLOGS', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut enim ad minim veniam', 'While now the fated Pequod had been so long afloat this', NULL, 'With a blow from the top-maul Ahab knocked off the steel head of the lance, and then handing to the mate the long iron rod remaining, bade him hold it upright, without its touching off the steel head of the lance, and then handing to the mate the long iron rod remaining. without its touching off the steel without its touching off the steel', 'Read More', NULL, 'Y', 1, 'Blog', NULL, NULL, NULL, 'Y', '2017-03-28 19:16:57', '2017-03-31 19:17:06', '2017-03-28 19:17:21', 'Administrator', NULL, NULL),
(32, '02.jpg', NULL, 'LATEST BLOGS', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut enim ad minim veniam', 'BeReviews was a awesome envent in dhaka', NULL, 'With a blow from the top-maul Ahab knocked off the steel head of the lance, and then handing to the steel', 'Read More', NULL, 'Y', 2, 'Blog', NULL, NULL, NULL, 'Y', '2017-03-28 19:18:52', '2017-03-31 19:18:57', '2017-03-28 19:19:03', 'Administrator', NULL, NULL),
(33, '01.jpg', NULL, 'LATEST BLOGS', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut enim ad minim veniam', 'Play list of old bangle music and gajal', NULL, 'With a blow from the top-maul Ahab knocked off the steel head of the lance, and then handing to the steel', 'Read More', NULL, 'Y', 3, 'Blog', NULL, NULL, NULL, 'Y', '2017-03-28 19:20:31', '2017-03-31 19:20:37', '2017-03-28 19:20:42', 'Administrator', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sys_fe_headline`
--

CREATE TABLE `sys_fe_headline` (
  `fe_headline_id` int(11) NOT NULL,
  `fe_headline_title` text,
  `fe_headline_short_desc` varchar(255) DEFAULT NULL,
  `status_active` varchar(1) DEFAULT NULL,
  `display_start_from` datetime DEFAULT NULL,
  `display_until` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(25) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sys_fe_headline`
--

INSERT INTO `sys_fe_headline` (`fe_headline_id`, `fe_headline_title`, `fe_headline_short_desc`, `status_active`, `display_start_from`, `display_until`, `create_date`, `create_by`, `update_date`, `update_by`) VALUES
(1, 'Premium quality free onepage template', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sys_fe_img_slider`
--

CREATE TABLE `sys_fe_img_slider` (
  `fe_img_slider_id` int(11) NOT NULL,
  `fe_img_slider` varchar(25) DEFAULT NULL,
  `fe_img_sort_order` varchar(2) DEFAULT NULL,
  `fe_img_slider_title` varchar(75) DEFAULT NULL,
  `fe_img_slider_short_desc` varchar(255) DEFAULT NULL,
  `fe_img_slider_button_label` varchar(25) DEFAULT NULL,
  `fe_img_slider_url` varchar(55) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(25) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sys_fe_img_slider`
--

INSERT INTO `sys_fe_img_slider` (`fe_img_slider_id`, `fe_img_slider`, `fe_img_sort_order`, `fe_img_slider_title`, `fe_img_slider_short_desc`, `fe_img_slider_button_label`, `fe_img_slider_url`, `create_date`, `create_by`, `update_date`, `update_by`) VALUES
(1, 'bg1.jpg', '1', 'Multi is the best Onepage html template', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et  dolore magna incididunt ut labore aliqua pertama. ', 'Read More', 'wbadmin/pengumuman1', NULL, NULL, NULL, NULL),
(2, 'bg2.jpg', '2', 'Pengumuman Untuk Seluruh Warga RT 5', 'Hari minggu tanggal 2 April 2017 kita adakan kerja bakti sekaligus rapat warga membahas keuangan warga. ', 'Selanjutnya...', 'wbadmin/pengumuman2', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sys_frontend_menu`
--

CREATE TABLE `sys_frontend_menu` (
  `id_menu` int(11) NOT NULL,
  `menu_label` varchar(75) DEFAULT NULL,
  `is_grp_hdr` varchar(1) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` varchar(1) DEFAULT NULL,
  `sort_order` varchar(3) DEFAULT NULL,
  `link_menu` varchar(255) DEFAULT NULL,
  `section_id` varchar(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sys_frontend_menu`
--

INSERT INTO `sys_frontend_menu` (`id_menu`, `menu_label`, `is_grp_hdr`, `parent_id`, `is_active`, `sort_order`, `link_menu`, `section_id`) VALUES
(1, 'Beranda', 'Y', 0, 'Y', '1', '', ''),
(2, 'Profil', 'Y', 0, 'Y', '2', NULL, ''),
(3, 'Sejarah Lembaga', 'Y', 2, 'Y', '1', '4', '2'),
(25, 'Kearsipan Kota Depok', 'Y', 0, 'Y', '4', '', ''),
(62, 'Wall-of-Fame', 'N', 59, 'Y', '3', '131', '5'),
(61, 'Penambahan Khasanah Arsip', 'N', 59, 'Y', '2', '130', '19'),
(60, 'Penelusuran Arsip Bersejarah', 'N', 59, 'Y', '1', '129', '19'),
(9, 'Visi Misi', 'N', 2, 'Y', '2', '7', '2'),
(53, 'Tugas Pokok dan Fungsi', 'N', 2, 'Y', '3', '6', '2'),
(11, 'Struktur Organisasi', 'N', 2, 'Y', '4', '5', '2'),
(12, 'Nama Pejabat', 'N', 2, 'Y', '6', '120', '2'),
(63, 'Penyusutan Arsip', 'N', 59, 'Y', '4', '133', '19'),
(59, 'Statis', 'N', 25, 'Y', '11', '#', ''),
(58, 'Sarana Prasarana Kearsipan', 'N', 54, 'Y', '4', '128', '19'),
(57, 'Arsip Vital', 'N', 54, 'Y', '3', '127', '19'),
(54, 'Dinamis', 'N', 25, 'N', '10', NULL, ''),
(55, 'Arsip Aktif', 'N', 54, 'Y', '1', '122', '19'),
(56, 'Arsip Inactive', 'N', 54, 'Y', '2', '126', '19'),
(36, 'Publikasi', 'Y', 0, 'Y', '5', '', ''),
(37, 'Pengumuman', 'N', 36, 'Y', '1', '18', '5'),
(38, 'Agenda', 'N', 36, 'Y', '2', '21', '5'),
(40, 'Jurnal', 'N', 36, 'Y', '4', '18', '5'),
(41, 'Berita', 'N', 36, 'N', '5', '138', '5'),
(42, 'Digitalisasi-Arsip', 'N', 36, 'Y', '6', '123', '5'),
(43, 'Peraturan', 'Y', 0, 'Y', '3', '', ''),
(44, 'Undang-Undang', 'N', 43, 'Y', '1', '109', '19'),
(45, 'Peraturan Pemerintah', 'N', 43, 'Y', '2', '137', '19'),
(64, 'Pengolahan Arsip', 'N', 59, 'Y', '5', '134', '19'),
(65, 'Penyerahan Arsip', 'N', 59, 'Y', '6', '135', '19'),
(66, 'Pembinaan', 'N', 25, 'Y', '12', '#', ''),
(67, 'SDM Kearsipan', 'N', 66, 'Y', '1', '136', '19'),
(68, 'Peningkatan Kapasitas SDM', 'N', 66, 'Y', '2', '140', '19'),
(69, 'Mobil-Sadar-Arsip', 'N', 36, 'Y', '7', '124', '5'),
(88, 'Standard Operating Procedure', 'N', 2, 'Y', '5', '143', '2'),
(89, 'Arsip OPD', 'N', 54, 'Y', '5', '125', '30');

-- --------------------------------------------------------

--
-- Table structure for table `sys_icon_menu`
--

CREATE TABLE `sys_icon_menu` (
  `id_icon_menu` int(11) NOT NULL,
  `icon_menu` varchar(25) DEFAULT NULL,
  `icon_description` varchar(25) DEFAULT NULL,
  `is_displayed` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sys_icon_menu`
--

INSERT INTO `sys_icon_menu` (`id_icon_menu`, `icon_menu`, `icon_description`, `is_displayed`) VALUES
(1, 'fa-heart', NULL, NULL),
(2, 'fa-star', NULL, NULL),
(3, 'fa-star-o', NULL, NULL),
(4, 'fa-user', NULL, NULL),
(5, 'fa-film', NULL, NULL),
(6, 'fa-th-large', NULL, NULL),
(7, 'fa-th', NULL, NULL),
(8, 'fa-th-list', NULL, NULL),
(9, 'fa-check', NULL, NULL),
(10, 'fa-remove', NULL, NULL),
(11, 'fa-close', NULL, NULL),
(12, 'fa-times', NULL, NULL),
(13, 'fa-search-plus', NULL, NULL),
(14, 'fa-search-minus', NULL, NULL),
(15, 'fa-power-off', NULL, NULL),
(16, 'fa-signal', NULL, NULL),
(17, 'fa-gear', NULL, NULL),
(18, 'fa-cog', NULL, NULL),
(19, 'fa-trash-o', NULL, NULL),
(20, 'fa-home', NULL, NULL),
(21, 'fa-file-o', NULL, NULL),
(22, 'fa-clock-o', NULL, NULL),
(23, 'fa-road', NULL, NULL),
(24, 'fa-download', NULL, NULL),
(25, 'fa-arrow-circle-o-down', NULL, NULL),
(26, 'fa-arrow-circle-o-up', NULL, NULL),
(27, 'fa-inbox', NULL, NULL),
(28, 'fa-play-circle-o', NULL, NULL),
(29, 'fa-rotate-right', NULL, NULL),
(30, 'fa-repeat', NULL, NULL),
(31, 'fa-refresh', NULL, NULL),
(32, 'fa-list-alt', NULL, NULL),
(33, 'fa-lock', NULL, NULL),
(34, 'fa-flag', NULL, NULL),
(35, 'fa-headphones', NULL, NULL),
(36, 'fa-volume-off', NULL, NULL),
(37, 'fa-volume-down', NULL, NULL),
(38, 'fa-volume-up', NULL, NULL),
(39, 'fa-qrcode', NULL, NULL),
(40, 'fa-barcode', NULL, NULL),
(41, 'fa-tag', NULL, NULL),
(42, 'fa-tags', NULL, NULL),
(43, 'fa-book', NULL, NULL),
(44, 'fa-bookmark', NULL, NULL),
(45, 'fa-print', NULL, NULL),
(46, 'fa-camera', NULL, NULL),
(47, 'fa-font', NULL, NULL),
(48, 'fa-bold', NULL, NULL),
(49, 'fa-italic', NULL, NULL),
(50, 'fa-text-height', NULL, NULL),
(51, 'fa-text-width', NULL, NULL),
(52, 'fa-align-left', NULL, NULL),
(53, 'fa-align-center', NULL, NULL),
(54, 'fa-align-right', NULL, NULL),
(55, 'fa-align-justify', NULL, NULL),
(56, 'fa-list', NULL, NULL),
(57, 'fa-dedent', NULL, NULL),
(58, 'fa-outdent', NULL, NULL),
(59, 'fa-indent', NULL, NULL),
(60, 'fa-video-camera', NULL, NULL),
(61, 'fa-photo', NULL, NULL),
(62, 'fa-image', NULL, NULL),
(63, 'fa-picture-o', NULL, NULL),
(64, 'fa-pencil', NULL, NULL),
(65, 'fa-map-marker', NULL, NULL),
(66, 'fa-adjust', NULL, NULL),
(67, 'fa-tint', NULL, NULL),
(68, 'fa-edit', NULL, NULL),
(69, 'fa-pencil-square-o', NULL, NULL),
(70, 'fa-share-square-o', NULL, NULL),
(71, 'fa-check-square-o', NULL, NULL),
(72, 'fa-arrows', NULL, NULL),
(73, 'fa-step-backward', NULL, NULL),
(74, 'fa-fast-backward', NULL, NULL),
(75, 'fa-backward', NULL, NULL),
(76, 'fa-play', NULL, NULL),
(77, 'fa-pause', NULL, NULL),
(78, 'fa-stop', NULL, NULL),
(79, 'fa-forward', NULL, NULL),
(80, 'fa-fast-forward', NULL, NULL),
(81, 'fa-step-forward', NULL, NULL),
(82, 'fa-eject', NULL, NULL),
(83, 'fa-chevron-left', NULL, NULL),
(84, 'fa-chevron-right', NULL, NULL),
(85, 'fa-plus-circle', NULL, NULL),
(86, 'fa-minus-circle', NULL, NULL),
(87, 'fa-times-circle', NULL, NULL),
(88, 'fa-check-circle', NULL, NULL),
(89, 'fa-question-circle', NULL, NULL),
(90, 'fa-info-circle', NULL, NULL),
(91, 'fa-crosshairs', NULL, NULL),
(92, 'fa-times-circle-o', NULL, NULL),
(93, 'fa-check-circle-o', NULL, NULL),
(94, 'fa-ban', NULL, NULL),
(95, 'fa-arrow-left', NULL, NULL),
(96, 'fa-arrow-right', NULL, NULL),
(97, 'fa-arrow-up', NULL, NULL),
(98, 'fa-arrow-down', NULL, NULL),
(99, 'fa-mail-forward', NULL, NULL),
(100, 'fa-share', NULL, NULL),
(101, 'fa-expand', NULL, NULL),
(102, 'fa-compress', NULL, NULL),
(103, 'fa-plus', NULL, NULL),
(104, 'fa-minus', NULL, NULL),
(105, 'fa-asterisk', NULL, NULL),
(106, 'fa-exclamation-circle', NULL, NULL),
(107, 'fa-gift', NULL, NULL),
(108, 'fa-leaf', NULL, NULL),
(109, 'fa-fire', NULL, NULL),
(110, 'fa-eye', NULL, NULL),
(111, 'fa-eye-slash', NULL, NULL),
(112, 'fa-warning', NULL, NULL),
(113, 'fa-exclamation-triangle', NULL, NULL),
(114, 'fa-plane', NULL, NULL),
(115, 'fa-calendar', NULL, NULL),
(116, 'fa-random', NULL, NULL),
(117, 'fa-comment', NULL, NULL),
(118, 'fa-magnet', NULL, NULL),
(119, 'fa-chevron-up', NULL, NULL),
(120, 'fa-chevron-down', NULL, NULL),
(121, 'fa-retweet', NULL, NULL),
(122, 'fa-shopping-cart', NULL, NULL),
(123, 'fa-folder', NULL, NULL),
(124, 'fa-folder-open', NULL, NULL),
(125, 'fa-arrows-v', NULL, NULL),
(126, 'fa-arrows-h', NULL, NULL),
(127, 'fa-bar-chart-o', NULL, NULL),
(128, 'fa-bar-chart', NULL, NULL),
(129, 'fa-twitter-square', NULL, NULL),
(130, 'fa-facebook-square', NULL, NULL),
(131, 'fa-camera-retro', NULL, NULL),
(132, 'fa-key', NULL, NULL),
(133, 'fa-gears', NULL, NULL),
(134, 'fa-cogs', NULL, NULL),
(135, 'fa-comments', NULL, NULL),
(136, 'fa-thumbs-o-up', NULL, NULL),
(137, 'fa-thumbs-o-down', NULL, NULL),
(138, 'fa-star-half', NULL, NULL),
(139, 'fa-heart-o', NULL, NULL),
(140, 'fa-sign-out', NULL, NULL),
(141, 'fa-linkedin-square', NULL, NULL),
(142, 'fa-thumb-tack', NULL, NULL),
(143, 'fa-external-link', NULL, NULL),
(144, 'fa-sign-in', NULL, NULL),
(145, 'fa-trophy', NULL, NULL),
(146, 'fa-github-square', NULL, NULL),
(147, 'fa-upload', NULL, NULL),
(148, 'fa-lemon-o', NULL, NULL),
(149, 'fa-phone', NULL, NULL),
(150, 'fa-square-o', NULL, NULL),
(151, 'fa-bookmark-o', NULL, NULL),
(152, 'fa-phone-square', NULL, NULL),
(153, 'fa-twitter', NULL, NULL),
(154, 'fa-facebook-f', NULL, NULL),
(155, 'fa-facebook', NULL, NULL),
(156, 'fa-github', NULL, NULL),
(157, 'fa-unlock', NULL, NULL),
(158, 'fa-credit-card', NULL, NULL),
(159, 'fa-feed', NULL, NULL),
(160, 'fa-rss', NULL, NULL),
(161, 'fa-hdd-o', NULL, NULL),
(162, 'fa-bullhorn', NULL, NULL),
(163, 'fa-bell', NULL, NULL),
(164, 'fa-certificate', NULL, NULL),
(165, 'fa-hand-o-right', NULL, NULL),
(166, 'fa-hand-o-left', NULL, NULL),
(167, 'fa-hand-o-up', NULL, NULL),
(168, 'fa-hand-o-down', NULL, NULL),
(169, 'fa-arrow-circle-left', NULL, NULL),
(170, 'fa-arrow-circle-right', NULL, NULL),
(171, 'fa-arrow-circle-up', NULL, NULL),
(172, 'fa-arrow-circle-down', NULL, NULL),
(173, 'fa-globe', NULL, NULL),
(174, 'fa-wrench', NULL, NULL),
(175, 'fa-tasks', NULL, NULL),
(176, 'fa-filter', NULL, NULL),
(177, 'fa-briefcase', NULL, NULL),
(178, 'fa-arrows-alt', NULL, NULL),
(179, 'fa-group', NULL, NULL),
(180, 'fa-users', NULL, NULL),
(181, 'fa-chain', NULL, NULL),
(182, 'fa-link', NULL, NULL),
(183, 'fa-cloud', NULL, NULL),
(184, 'fa-flask', NULL, NULL),
(185, 'fa-cut', NULL, NULL),
(186, 'fa-scissors', NULL, NULL),
(187, 'fa-copy', NULL, NULL),
(188, 'fa-files-o', NULL, NULL),
(189, 'fa-paperclip', NULL, NULL),
(190, 'fa-save', NULL, NULL),
(191, 'fa-floppy-o', NULL, NULL),
(192, 'fa-square', NULL, NULL),
(193, 'fa-navicon', NULL, NULL),
(194, 'fa-reorder', NULL, NULL),
(195, 'fa-bars', NULL, NULL),
(196, 'fa-list-ul', NULL, NULL),
(197, 'fa-list-ol', NULL, NULL),
(198, 'fa-strikethrough', NULL, NULL),
(199, 'fa-underline', NULL, NULL),
(200, 'fa-table', NULL, NULL),
(201, 'fa-magic', NULL, NULL),
(202, 'fa-truck', NULL, NULL),
(203, 'fa-pinterest', NULL, NULL),
(204, 'fa-pinterest-square', NULL, NULL),
(205, 'fa-google-plus-square', NULL, NULL),
(206, 'fa-google-plus', NULL, NULL),
(207, 'fa-money', NULL, NULL),
(208, 'fa-caret-down', NULL, NULL),
(209, 'fa-caret-up', NULL, NULL),
(210, 'fa-caret-left', NULL, NULL),
(211, 'fa-caret-right', NULL, NULL),
(212, 'fa-columns', NULL, NULL),
(213, 'fa-unsorted', NULL, NULL),
(214, 'fa-sort', NULL, NULL),
(215, 'fa-sort-down', NULL, NULL),
(216, 'fa-sort-desc', NULL, NULL),
(217, 'fa-sort-up', NULL, NULL),
(218, 'fa-sort-asc', NULL, NULL),
(219, 'fa-envelope', NULL, NULL),
(220, 'fa-linkedin', NULL, NULL),
(221, 'fa-rotate-left', NULL, NULL),
(222, 'fa-undo', NULL, NULL),
(223, 'fa-legal', NULL, NULL),
(224, 'fa-gavel', NULL, NULL),
(225, 'fa-dashboard', NULL, NULL),
(226, 'fa-tachometer', NULL, NULL),
(227, 'fa-comment-o', NULL, NULL),
(228, 'fa-comments-o', NULL, NULL),
(229, 'fa-flash', NULL, NULL),
(230, 'fa-bolt', NULL, NULL),
(231, 'fa-sitemap', NULL, NULL),
(232, 'fa-umbrella', NULL, NULL),
(233, 'fa-paste', NULL, NULL),
(234, 'fa-clipboard', NULL, NULL),
(235, 'fa-lightbulb-o', NULL, NULL),
(236, 'fa-exchange', NULL, NULL),
(237, 'fa-cloud-download', NULL, NULL),
(238, 'fa-cloud-upload', NULL, NULL),
(239, 'fa-user-md', NULL, NULL),
(240, 'fa-stethoscope', NULL, NULL),
(241, 'fa-suitcase', NULL, NULL),
(242, 'fa-bell-o', NULL, NULL),
(243, 'fa-coffee', NULL, NULL),
(244, 'fa-cutlery', NULL, NULL),
(245, 'fa-file-text-o', NULL, NULL),
(246, 'fa-building-o', NULL, NULL),
(247, 'fa-hospital-o', NULL, NULL),
(248, 'fa-ambulance', NULL, NULL),
(249, 'fa-medkit', NULL, NULL),
(250, 'fa-fighter-jet', NULL, NULL),
(251, 'fa-beer', NULL, NULL),
(252, 'fa-h-square', NULL, NULL),
(253, 'fa-plus-square', NULL, NULL),
(254, 'fa-angle-double-left', NULL, NULL),
(255, 'fa-angle-double-right', NULL, NULL),
(256, 'fa-angle-double-up', NULL, NULL),
(257, 'fa-angle-double-down', NULL, NULL),
(258, 'fa-angle-left', NULL, NULL),
(259, 'fa-angle-right', NULL, NULL),
(260, 'fa-angle-up', NULL, NULL),
(261, 'fa-angle-down', NULL, NULL),
(262, 'fa-desktop', NULL, NULL),
(263, 'fa-laptop', NULL, NULL),
(264, 'fa-tablet', NULL, NULL),
(265, 'fa-mobile-phone', NULL, NULL),
(266, 'fa-mobile', NULL, NULL),
(267, 'fa-circle-o', NULL, NULL),
(268, 'fa-quote-left', NULL, NULL),
(269, 'fa-quote-right', NULL, NULL),
(270, 'fa-spinner', NULL, NULL),
(271, 'fa-circle', NULL, NULL),
(272, 'fa-mail-reply', NULL, NULL),
(273, 'fa-reply', NULL, NULL),
(274, 'fa-github-alt', NULL, NULL),
(275, 'fa-folder-o', NULL, NULL),
(276, 'fa-folder-open-o', NULL, NULL),
(277, 'fa-smile-o', NULL, NULL),
(278, 'fa-frown-o', NULL, NULL),
(279, 'fa-meh-o', NULL, NULL),
(280, 'fa-gamepad', NULL, NULL),
(281, 'fa-keyboard-o', NULL, NULL),
(282, 'fa-flag-o', NULL, NULL),
(283, 'fa-flag-checkered', NULL, NULL),
(284, 'fa-terminal', NULL, NULL),
(285, 'fa-code', NULL, NULL),
(286, 'fa-mail-reply-all', NULL, NULL),
(287, 'fa-reply-all', NULL, NULL),
(288, 'fa-star-half-empty', NULL, NULL),
(289, 'fa-star-half-full', NULL, NULL),
(290, 'fa-star-half-o', NULL, NULL),
(291, 'fa-location-arrow', NULL, NULL),
(292, 'fa-crop', NULL, NULL),
(293, 'fa-code-fork', NULL, NULL),
(294, 'fa-unlink', NULL, NULL),
(295, 'fa-chain-broken', NULL, NULL),
(296, 'fa-question', NULL, NULL),
(297, 'fa-info', NULL, NULL),
(298, 'fa-exclamation', NULL, NULL),
(299, 'fa-superscript', NULL, NULL),
(300, 'fa-subscript', NULL, NULL),
(301, 'fa-eraser', NULL, NULL),
(302, 'fa-puzzle-piece', NULL, NULL),
(303, 'fa-microphone', NULL, NULL),
(304, 'fa-microphone-slash', NULL, NULL),
(305, 'fa-shield', NULL, NULL),
(306, 'fa-calendar-o', NULL, NULL),
(307, 'fa-fire-extinguisher', NULL, NULL),
(308, 'fa-rocket', NULL, NULL),
(309, 'fa-maxcdn', NULL, NULL),
(310, 'fa-chevron-circle-left', NULL, NULL),
(311, 'fa-chevron-circle-right', NULL, NULL),
(312, 'fa-chevron-circle-up', NULL, NULL),
(313, 'fa-chevron-circle-down', NULL, NULL),
(314, 'fa-html5', NULL, NULL),
(315, 'fa-css3', NULL, NULL),
(316, 'fa-anchor', NULL, NULL),
(317, 'fa-unlock-alt', NULL, NULL),
(318, 'fa-bullseye', NULL, NULL),
(319, 'fa-ellipsis-h', NULL, NULL),
(320, 'fa-ellipsis-v', NULL, NULL),
(321, 'fa-rss-square', NULL, NULL),
(322, 'fa-play-circle', NULL, NULL),
(323, 'fa-ticket', NULL, NULL),
(324, 'fa-minus-square', NULL, NULL),
(325, 'fa-minus-square-o', NULL, NULL),
(326, 'fa-level-up', NULL, NULL),
(327, 'fa-level-down', NULL, NULL),
(328, 'fa-check-square', NULL, NULL),
(329, 'fa-pencil-square', NULL, NULL),
(330, 'fa-external-link-square', NULL, NULL),
(331, 'fa-share-square', NULL, NULL),
(332, 'fa-compass', NULL, NULL),
(333, 'fa-toggle-down', NULL, NULL),
(334, 'fa-caret-square-o-down', NULL, NULL),
(335, 'fa-toggle-up', NULL, NULL),
(336, 'fa-caret-square-o-up', NULL, NULL),
(337, 'fa-toggle-right', NULL, NULL),
(338, 'fa-caret-square-o-right', NULL, NULL),
(339, 'fa-euro', NULL, NULL),
(340, 'fa-eur', NULL, NULL),
(341, 'fa-gbp', NULL, NULL),
(342, 'fa-dollar', NULL, NULL),
(343, 'fa-usd', NULL, NULL),
(344, 'fa-rupee', NULL, NULL),
(345, 'fa-inr', NULL, NULL),
(346, 'fa-cny', NULL, NULL),
(347, 'fa-rmb', NULL, NULL),
(348, 'fa-yen', NULL, NULL),
(349, 'fa-jpy', NULL, NULL),
(350, 'fa-ruble', NULL, NULL),
(351, 'fa-rouble', NULL, NULL),
(352, 'fa-rub', NULL, NULL),
(353, 'fa-won', NULL, NULL),
(354, 'fa-krw', NULL, NULL),
(355, 'fa-bitcoin', NULL, NULL),
(356, 'fa-btc', NULL, NULL),
(357, 'fa-file', NULL, NULL),
(358, 'fa-file-text', NULL, NULL),
(359, 'fa-sort-alpha-asc', NULL, NULL),
(360, 'fa-sort-alpha-desc', NULL, NULL),
(361, 'fa-sort-amount-asc', NULL, NULL),
(362, 'fa-sort-amount-desc', NULL, NULL),
(363, 'fa-sort-numeric-asc', NULL, NULL),
(364, 'fa-sort-numeric-desc', NULL, NULL),
(365, 'fa-thumbs-up', NULL, NULL),
(366, 'fa-thumbs-down', NULL, NULL),
(367, 'fa-youtube-square', NULL, NULL),
(368, 'fa-youtube', NULL, NULL),
(369, 'fa-xing', NULL, NULL),
(370, 'fa-xing-square', NULL, NULL),
(371, 'fa-youtube-play', NULL, NULL),
(372, 'fa-dropbox', NULL, NULL),
(373, 'fa-stack-overflow', NULL, NULL),
(374, 'fa-instagram', NULL, NULL),
(375, 'fa-flickr', NULL, NULL),
(376, 'fa-adn', NULL, NULL),
(377, 'fa-bitbucket', NULL, NULL),
(378, 'fa-bitbucket-square', NULL, NULL),
(379, 'fa-tumblr', NULL, NULL),
(380, 'fa-tumblr-square', NULL, NULL),
(381, 'fa-long-arrow-down', NULL, NULL),
(382, 'fa-long-arrow-up', NULL, NULL),
(383, 'fa-long-arrow-left', NULL, NULL),
(384, 'fa-long-arrow-right', NULL, NULL),
(385, 'fa-apple', NULL, NULL),
(386, 'fa-windows', NULL, NULL),
(387, 'fa-android', NULL, NULL),
(388, 'fa-linux', NULL, NULL),
(389, 'fa-dribbble', NULL, NULL),
(390, 'fa-skype', NULL, NULL),
(391, 'fa-foursquare', NULL, NULL),
(392, 'fa-trello', NULL, NULL),
(393, 'fa-female', NULL, NULL),
(394, 'fa-male', NULL, NULL),
(395, 'fa-gittip', NULL, NULL),
(396, 'fa-gratipay', NULL, NULL),
(397, 'fa-sun-o', NULL, NULL),
(398, 'fa-moon-o', NULL, NULL),
(399, 'fa-archive', NULL, NULL),
(400, 'fa-bug', NULL, NULL),
(401, 'fa-vk', NULL, NULL),
(402, 'fa-weibo', NULL, NULL),
(403, 'fa-renren', NULL, NULL),
(404, 'fa-pagelines', NULL, NULL),
(405, 'fa-stack-exchange', NULL, NULL),
(406, 'fa-arrow-circle-o-right', NULL, NULL),
(407, 'fa-arrow-circle-o-left', NULL, NULL),
(408, 'fa-toggle-left', NULL, NULL),
(409, 'fa-caret-square-o-left', NULL, NULL),
(410, 'fa-dot-circle-o', NULL, NULL),
(411, 'fa-wheelchair', NULL, NULL),
(412, 'fa-vimeo-square', NULL, NULL),
(413, 'fa-turkish-lira', NULL, NULL),
(414, 'fa-try', NULL, NULL),
(415, 'fa-plus-square-o', NULL, NULL),
(416, 'fa-space-shuttle', NULL, NULL),
(417, 'fa-slack', NULL, NULL),
(418, 'fa-envelope-square', NULL, NULL),
(419, 'fa-wordpress', NULL, NULL),
(420, 'fa-openid', NULL, NULL),
(421, 'fa-institution', NULL, NULL),
(422, 'fa-bank', NULL, NULL),
(423, 'fa-university', NULL, NULL),
(424, 'fa-mortar-board', NULL, NULL),
(425, 'fa-graduation-cap', NULL, NULL),
(426, 'fa-yahoo', NULL, NULL),
(427, 'fa-google', NULL, NULL),
(428, 'fa-reddit', NULL, NULL),
(429, 'fa-reddit-square', NULL, NULL),
(430, 'fa-stumbleupon-circle', NULL, NULL),
(431, 'fa-stumbleupon', NULL, NULL),
(432, 'fa-delicious', NULL, NULL),
(433, 'fa-digg', NULL, NULL),
(434, 'fa-pied-piper-pp', NULL, NULL),
(435, 'fa-pied-piper-alt', NULL, NULL),
(436, 'fa-drupal', NULL, NULL),
(437, 'fa-joomla', NULL, NULL),
(438, 'fa-language', NULL, NULL),
(439, 'fa-fax', NULL, NULL),
(440, 'fa-building', NULL, NULL),
(441, 'fa-child', NULL, NULL),
(442, 'fa-paw', NULL, NULL),
(443, 'fa-spoon', NULL, NULL),
(444, 'fa-cube', NULL, NULL),
(445, 'fa-cubes', NULL, NULL),
(446, 'fa-behance', NULL, NULL),
(447, 'fa-behance-square', NULL, NULL),
(448, 'fa-steam', NULL, NULL),
(449, 'fa-steam-square', NULL, NULL),
(450, 'fa-recycle', NULL, NULL),
(451, 'fa-automobile', NULL, NULL),
(452, 'fa-car', NULL, NULL),
(453, 'fa-cab', NULL, NULL),
(454, 'fa-taxi', NULL, NULL),
(455, 'fa-tree', NULL, NULL),
(456, 'fa-spotify', NULL, NULL),
(457, 'fa-deviantart', NULL, NULL),
(458, 'fa-soundcloud', NULL, NULL),
(459, 'fa-database', NULL, NULL),
(460, 'fa-file-pdf-o', NULL, NULL),
(461, 'fa-file-word-o', NULL, NULL),
(462, 'fa-file-excel-o', NULL, NULL),
(463, 'fa-file-powerpoint-o', NULL, NULL),
(464, 'fa-file-photo-o', NULL, NULL),
(465, 'fa-file-picture-o', NULL, NULL),
(466, 'fa-file-image-o', NULL, NULL),
(467, 'fa-file-zip-o', NULL, NULL),
(468, 'fa-file-archive-o', NULL, NULL),
(469, 'fa-file-sound-o', NULL, NULL),
(470, 'fa-file-audio-o', NULL, NULL),
(471, 'fa-file-movie-o', NULL, NULL),
(472, 'fa-file-video-o', NULL, NULL),
(473, 'fa-file-code-o', NULL, NULL),
(474, 'fa-vine', NULL, NULL),
(475, 'fa-codepen', NULL, NULL),
(476, 'fa-jsfiddle', NULL, NULL),
(477, 'fa-life-bouy', NULL, NULL),
(478, 'fa-life-buoy', NULL, NULL),
(479, 'fa-life-saver', NULL, NULL),
(480, 'fa-support', NULL, NULL),
(481, 'fa-life-ring', NULL, NULL),
(482, 'fa-circle-o-notch', NULL, NULL),
(483, 'fa-ra', NULL, NULL),
(484, 'fa-resistance', NULL, NULL),
(485, 'fa-rebel', NULL, NULL),
(486, 'fa-ge', NULL, NULL),
(487, 'fa-empire', NULL, NULL),
(488, 'fa-git-square', NULL, NULL),
(489, 'fa-git', NULL, NULL),
(490, 'fa-y-combinator-square', NULL, NULL),
(491, 'fa-yc-square', NULL, NULL),
(492, 'fa-hacker-news', NULL, NULL),
(493, 'fa-tencent-weibo', NULL, NULL),
(494, 'fa-qq', NULL, NULL),
(495, 'fa-wechat', NULL, NULL),
(496, 'fa-weixin', NULL, NULL),
(497, 'fa-send', NULL, NULL),
(498, 'fa-paper-plane', NULL, NULL),
(499, 'fa-send-o', NULL, NULL),
(500, 'fa-paper-plane-o', NULL, NULL),
(501, 'fa-history', NULL, NULL),
(502, 'fa-circle-thin', NULL, NULL),
(503, 'fa-header', NULL, NULL),
(504, 'fa-paragraph', NULL, NULL),
(505, 'fa-sliders', NULL, NULL),
(506, 'fa-share-alt', NULL, NULL),
(507, 'fa-share-alt-square', NULL, NULL),
(508, 'fa-bomb', NULL, NULL),
(509, 'fa-soccer-ball-o', NULL, NULL),
(510, 'fa-futbol-o', NULL, NULL),
(511, 'fa-tty', NULL, NULL),
(512, 'fa-binoculars', NULL, NULL),
(513, 'fa-plug', NULL, NULL),
(514, 'fa-slideshare', NULL, NULL),
(515, 'fa-twitch', NULL, NULL),
(516, 'fa-yelp', NULL, NULL),
(517, 'fa-newspaper-o', NULL, NULL),
(518, 'fa-wifi', NULL, NULL),
(519, 'fa-calculator', NULL, NULL),
(520, 'fa-paypal', NULL, NULL),
(521, 'fa-google-wallet', NULL, NULL),
(522, 'fa-cc-visa', NULL, NULL),
(523, 'fa-cc-mastercard', NULL, NULL),
(524, 'fa-cc-discover', NULL, NULL),
(525, 'fa-cc-amex', NULL, NULL),
(526, 'fa-cc-paypal', NULL, NULL),
(527, 'fa-cc-stripe', NULL, NULL),
(528, 'fa-bell-slash', NULL, NULL),
(529, 'fa-bell-slash-o', NULL, NULL),
(530, 'fa-trash', NULL, NULL),
(531, 'fa-copyright', NULL, NULL),
(532, 'fa-at', NULL, NULL),
(533, 'fa-eyedropper', NULL, NULL),
(534, 'fa-paint-brush', NULL, NULL),
(535, 'fa-birthday-cake', NULL, NULL),
(536, 'fa-area-chart', NULL, NULL),
(537, 'fa-pie-chart', NULL, NULL),
(538, 'fa-line-chart', NULL, NULL),
(539, 'fa-lastfm', NULL, NULL),
(540, 'fa-lastfm-square', NULL, NULL),
(541, 'fa-toggle-off', NULL, NULL),
(542, 'fa-toggle-on', NULL, NULL),
(543, 'fa-bicycle', NULL, NULL),
(544, 'fa-bus', NULL, NULL),
(545, 'fa-ioxhost', NULL, NULL),
(546, 'fa-angellist', NULL, NULL),
(547, 'fa-cc', NULL, NULL),
(548, 'fa-shekel', NULL, NULL),
(549, 'fa-sheqel', NULL, NULL),
(550, 'fa-ils', NULL, NULL),
(551, 'fa-meanpath', NULL, NULL),
(552, 'fa-buysellads', NULL, NULL),
(553, 'fa-connectdevelop', NULL, NULL),
(554, 'fa-dashcube', NULL, NULL),
(555, 'fa-forumbee', NULL, NULL),
(556, 'fa-leanpub', NULL, NULL),
(557, 'fa-sellsy', NULL, NULL),
(558, 'fa-shirtsinbulk', NULL, NULL),
(559, 'fa-simplybuilt', NULL, NULL),
(560, 'fa-skyatlas', NULL, NULL),
(561, 'fa-cart-plus', NULL, NULL),
(562, 'fa-cart-arrow-down', NULL, NULL),
(563, 'fa-diamond', NULL, NULL),
(564, 'fa-ship', NULL, NULL),
(565, 'fa-user-secret', NULL, NULL),
(566, 'fa-motorcycle', NULL, NULL),
(567, 'fa-street-view', NULL, NULL),
(568, 'fa-heartbeat', NULL, NULL),
(569, 'fa-venus', NULL, NULL),
(570, 'fa-mars', NULL, NULL),
(571, 'fa-mercury', NULL, NULL),
(572, 'fa-intersex', NULL, NULL),
(573, 'fa-transgender', NULL, NULL),
(574, 'fa-transgender-alt', NULL, NULL),
(575, 'fa-venus-double', NULL, NULL),
(576, 'fa-mars-double', NULL, NULL),
(577, 'fa-venus-mars', NULL, NULL),
(578, 'fa-mars-stroke', NULL, NULL),
(579, 'fa-mars-stroke-v', NULL, NULL),
(580, 'fa-mars-stroke-h', NULL, NULL),
(581, 'fa-neuter', NULL, NULL),
(582, 'fa-genderless', NULL, NULL),
(583, 'fa-facebook-official', NULL, NULL),
(584, 'fa-pinterest-p', NULL, NULL),
(585, 'fa-whatsapp', NULL, NULL),
(586, 'fa-server', NULL, NULL),
(587, 'fa-user-plus', NULL, NULL),
(588, 'fa-user-times', NULL, NULL),
(589, 'fa-hotel', NULL, NULL),
(590, 'fa-bed', NULL, NULL),
(591, 'fa-viacoin', NULL, NULL),
(592, 'fa-train', NULL, NULL),
(593, 'fa-subway', NULL, NULL),
(594, 'fa-medium', NULL, NULL),
(595, 'fa-yc', NULL, NULL),
(596, 'fa-y-combinator', NULL, NULL),
(597, 'fa-optin-monster', NULL, NULL),
(598, 'fa-opencart', NULL, NULL),
(599, 'fa-expeditedssl', NULL, NULL),
(600, 'fa-battery-4', NULL, NULL),
(601, 'fa-battery-full', NULL, NULL),
(602, 'fa-battery-3', NULL, NULL),
(603, 'fa-battery-three-quarters', NULL, NULL),
(604, 'fa-battery-2', NULL, NULL),
(605, 'fa-battery-half', NULL, NULL),
(606, 'fa-battery-1', NULL, NULL),
(607, 'fa-battery-quarter', NULL, NULL),
(608, 'fa-battery-0', NULL, NULL),
(609, 'fa-battery-empty', NULL, NULL),
(610, 'fa-mouse-pointer', NULL, NULL),
(611, 'fa-i-cursor', NULL, NULL),
(612, 'fa-object-group', NULL, NULL),
(613, 'fa-object-ungroup', NULL, NULL),
(614, 'fa-sticky-note', NULL, NULL),
(615, 'fa-sticky-note-o', NULL, NULL),
(616, 'fa-cc-jcb', NULL, NULL),
(617, 'fa-cc-diners-club', NULL, NULL),
(618, 'fa-clone', NULL, NULL),
(619, 'fa-balance-scale', NULL, NULL),
(620, 'fa-hourglass-o', NULL, NULL),
(621, 'fa-hourglass-1', NULL, NULL),
(622, 'fa-hourglass-start', NULL, NULL),
(623, 'fa-hourglass-2', NULL, NULL),
(624, 'fa-hourglass-half', NULL, NULL),
(625, 'fa-hourglass-3', NULL, NULL),
(626, 'fa-hourglass-end', NULL, NULL),
(627, 'fa-hourglass', NULL, NULL),
(628, 'fa-hand-grab-o', NULL, NULL),
(629, 'fa-hand-rock-o', NULL, NULL),
(630, 'fa-hand-stop-o', NULL, NULL),
(631, 'fa-hand-paper-o', NULL, NULL),
(632, 'fa-hand-scissors-o', NULL, NULL),
(633, 'fa-hand-lizard-o', NULL, NULL),
(634, 'fa-hand-spock-o', NULL, NULL),
(635, 'fa-hand-pointer-o', NULL, NULL),
(636, 'fa-hand-peace-o', NULL, NULL),
(637, 'fa-trademark', NULL, NULL),
(638, 'fa-registered', NULL, NULL),
(639, 'fa-creative-commons', NULL, NULL),
(640, 'fa-gg', NULL, NULL),
(641, 'fa-gg-circle', NULL, NULL),
(642, 'fa-tripadvisor', NULL, NULL),
(643, 'fa-odnoklassniki', NULL, NULL),
(644, 'fa-odnoklassniki-square', NULL, NULL),
(645, 'fa-get-pocket', NULL, NULL),
(646, 'fa-wikipedia-w', NULL, NULL),
(647, 'fa-safari', NULL, NULL),
(648, 'fa-chrome', NULL, NULL),
(649, 'fa-firefox', NULL, NULL),
(650, 'fa-opera', NULL, NULL),
(651, 'fa-internet-explorer', NULL, NULL),
(652, 'fa-tv', NULL, NULL),
(653, 'fa-television', NULL, NULL),
(654, 'fa-contao', NULL, NULL),
(655, 'fa-500px', NULL, NULL),
(656, 'fa-amazon', NULL, NULL),
(657, 'fa-calendar-plus-o', NULL, NULL),
(658, 'fa-calendar-minus-o', NULL, NULL),
(659, 'fa-calendar-times-o', NULL, NULL),
(660, 'fa-calendar-check-o', NULL, NULL),
(661, 'fa-industry', NULL, NULL),
(662, 'fa-map-pin', NULL, NULL),
(663, 'fa-map-signs', NULL, NULL),
(664, 'fa-map-o', NULL, NULL),
(665, 'fa-map', NULL, NULL),
(666, 'fa-commenting', NULL, NULL),
(667, 'fa-commenting-o', NULL, NULL),
(668, 'fa-houzz', NULL, NULL),
(669, 'fa-vimeo', NULL, NULL),
(670, 'fa-black-tie', NULL, NULL),
(671, 'fa-fonticons', NULL, NULL),
(672, 'fa-reddit-alien', NULL, NULL),
(673, 'fa-edge', NULL, NULL),
(674, 'fa-credit-card-alt', NULL, NULL),
(675, 'fa-codiepie', NULL, NULL),
(676, 'fa-modx', NULL, NULL),
(677, 'fa-fort-awesome', NULL, NULL),
(678, 'fa-usb', NULL, NULL),
(679, 'fa-product-hunt', NULL, NULL),
(680, 'fa-mixcloud', NULL, NULL),
(681, 'fa-scribd', NULL, NULL),
(682, 'fa-pause-circle', NULL, NULL),
(683, 'fa-pause-circle-o', NULL, NULL),
(684, 'fa-stop-circle', NULL, NULL),
(685, 'fa-stop-circle-o', NULL, NULL),
(686, 'fa-shopping-bag', NULL, NULL),
(687, 'fa-shopping-basket', NULL, NULL),
(688, 'fa-hashtag', NULL, NULL),
(689, 'fa-bluetooth', NULL, NULL),
(690, 'fa-bluetooth-b', NULL, NULL),
(691, 'fa-percent', NULL, NULL),
(692, 'fa-gitlab', NULL, NULL),
(693, 'fa-wpbeginner', NULL, NULL),
(694, 'fa-wpforms', NULL, NULL),
(695, 'fa-envira', NULL, NULL),
(696, 'fa-universal-access', NULL, NULL),
(697, 'fa-wheelchair', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sys_icon_menux`
--

CREATE TABLE `sys_icon_menux` (
  `id_icon_menu` int(11) NOT NULL,
  `icon_menu` varchar(25) DEFAULT NULL,
  `icon_description` varchar(25) DEFAULT NULL,
  `is_displayed` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sys_icon_menux`
--

INSERT INTO `sys_icon_menux` (`id_icon_menu`, `icon_menu`, `icon_description`, `is_displayed`) VALUES
(1, 'fa-address-book', NULL, NULL),
(2, 'fa-address-book-o', NULL, NULL),
(3, 'fa-address-card', NULL, NULL),
(4, 'fa-address-card-o', NULL, NULL),
(5, 'fa-adjust', NULL, NULL),
(6, 'fa-anchor', NULL, NULL),
(7, 'fa-archive', NULL, NULL),
(8, 'fa-area-chart', NULL, NULL),
(9, 'fa-arrows', NULL, NULL),
(10, 'fa-arrows-h', NULL, NULL),
(11, 'fa-arrows-v', NULL, NULL),
(12, 'fa-asl-interpreting', NULL, NULL),
(13, 'fa-asterisk', NULL, NULL),
(14, 'fa-at', NULL, NULL),
(15, 'fa-automobile', NULL, NULL),
(16, 'fa-audio-description', NULL, NULL),
(17, 'fa-balance-scale', NULL, NULL),
(18, 'fa-ban', NULL, NULL),
(19, 'fa-bank', NULL, NULL),
(20, 'fa-bar-chart', NULL, NULL),
(21, 'fa-bar-chart-o', NULL, NULL),
(22, 'fa-barcode', NULL, NULL),
(23, 'fa-bars', NULL, NULL),
(24, 'fa-bath', NULL, NULL),
(25, 'fa-bathtub', NULL, NULL),
(26, 'fa-battery-0', NULL, NULL),
(27, 'fa-battery-1', NULL, NULL),
(28, 'fa-battery-2', NULL, NULL),
(29, 'fa-battery-3', NULL, NULL),
(30, 'fa-battery-4', NULL, NULL),
(31, 'fa-battery-empty', NULL, NULL),
(32, 'fa-battery-full', NULL, NULL),
(33, 'fa-battery-half', NULL, NULL),
(34, 'fa-battery-quarter', NULL, NULL),
(35, 'fa-battery-three-quarters', NULL, NULL),
(36, 'fa-bed', NULL, NULL),
(37, 'fa-beer', NULL, NULL),
(38, 'fa-bell', NULL, NULL),
(39, 'fa-bell-o', NULL, NULL),
(40, 'fa-bell-slash', NULL, NULL),
(41, 'fa-bell-slash-o', NULL, NULL),
(42, 'fa-bicycle', NULL, NULL),
(43, 'fa-binoculars', NULL, NULL),
(44, 'fa-birthday-cake', NULL, NULL),
(45, 'fa-blind', NULL, NULL),
(46, 'fa-bolt', NULL, NULL),
(47, 'fa-bomb', NULL, NULL),
(48, 'fa-book', NULL, NULL),
(49, 'fa-bookmark', NULL, NULL),
(50, 'fa-bookmark-o', NULL, NULL),
(51, 'fa-braille', NULL, NULL),
(52, 'fa-briefcase', NULL, NULL),
(53, 'fa-bug', NULL, NULL),
(54, 'fa-building', NULL, NULL),
(55, 'fa-building-o', NULL, NULL),
(56, 'fa-bullhorn', NULL, NULL),
(57, 'fa-bullseye', NULL, NULL),
(58, 'fa-bus', NULL, NULL),
(59, 'fa-cab', NULL, NULL),
(60, 'fa-calculator', NULL, NULL),
(61, 'fa-calendar', NULL, NULL),
(62, 'fa-calendar-o', NULL, NULL),
(63, 'fa-calendar-check-o', NULL, NULL),
(64, 'fa-calendar-minus-o', NULL, NULL),
(65, 'fa-calendar-plus-o', NULL, NULL),
(66, 'fa-calendar-times-o', NULL, NULL),
(67, 'fa-camera', NULL, NULL),
(68, 'fa-camera-retro', NULL, NULL),
(69, 'fa-car', NULL, NULL),
(70, 'fa-caret-square-o-down', NULL, NULL),
(71, 'fa-caret-square-o-left', NULL, NULL),
(72, 'fa-caret-square-o-right', NULL, NULL),
(73, 'fa-caret-square-o-up', NULL, NULL),
(74, 'fa-cart-arrow-down', NULL, NULL),
(75, 'fa-cart-plus', NULL, NULL),
(76, 'fa-cc', NULL, NULL),
(77, 'fa-certificate', NULL, NULL),
(78, 'fa-check', NULL, NULL),
(79, 'fa-check-circle', NULL, NULL),
(80, 'fa-check-circle-o', NULL, NULL),
(81, 'fa-check-square', NULL, NULL),
(82, 'fa-check-square-o', NULL, NULL),
(83, 'fa-child', NULL, NULL),
(84, 'fa-circle', NULL, NULL),
(85, 'fa-circle-o', NULL, NULL),
(86, 'fa-circle-o-notch', NULL, NULL),
(87, 'fa-circle-thin', NULL, NULL),
(88, 'fa-clock-o', NULL, NULL),
(89, 'fa-clone', NULL, NULL),
(90, 'fa-close', NULL, NULL),
(91, 'fa-cloud', NULL, NULL),
(92, 'fa-cloud-download', NULL, NULL),
(93, 'fa-cloud-upload', NULL, NULL),
(94, 'fa-code', NULL, NULL),
(95, 'fa-code-fork', NULL, NULL),
(96, 'fa-coffee', NULL, NULL),
(97, 'fa-cog', NULL, NULL),
(98, 'fa-cogs', NULL, NULL),
(99, 'fa-comment', NULL, NULL),
(100, 'fa-comment-o', NULL, NULL),
(101, 'fa-comments', NULL, NULL),
(102, 'fa-comments-o', NULL, NULL),
(103, 'fa-commenting', NULL, NULL),
(104, 'fa-commenting-o', NULL, NULL),
(105, 'fa-compass', NULL, NULL),
(106, 'fa-copyright', NULL, NULL),
(107, 'fa-credit-card', NULL, NULL),
(108, 'fa-credit-card-alt', NULL, NULL),
(109, 'fa-creative-commons', NULL, NULL),
(110, 'fa-crop', NULL, NULL),
(111, 'fa-crosshairs', NULL, NULL),
(112, 'fa-cube', NULL, NULL),
(113, 'fa-cubes', NULL, NULL),
(114, 'fa-cutlery', NULL, NULL),
(115, 'fa-dashboard', NULL, NULL),
(116, 'fa-database', NULL, NULL),
(117, 'fa-deaf', NULL, NULL),
(118, 'fa-deafness', NULL, NULL),
(119, 'fa-desktop', NULL, NULL),
(120, 'fa-diamond', NULL, NULL),
(121, 'fa-dot-circle-o', NULL, NULL),
(122, 'fa-download', NULL, NULL),
(123, 'fa-drivers-license', NULL, NULL),
(124, 'fa-drivers-license-o', NULL, NULL),
(125, 'fa-edit', NULL, NULL),
(126, 'fa-ellipsis-h', NULL, NULL),
(127, 'fa-ellipsis-v', NULL, NULL),
(128, 'fa-envelope', NULL, NULL),
(129, 'fa-envelope-o', NULL, NULL),
(130, 'fa-envelope-open', NULL, NULL),
(131, 'fa-envelope-open-o', NULL, NULL),
(132, 'fa-envelope-square', NULL, NULL),
(133, 'fa-eraser', NULL, NULL),
(134, 'fa-exchange', NULL, NULL),
(135, 'fa-exclamation', NULL, NULL),
(136, 'fa-exclamation-circle', NULL, NULL),
(137, 'fa-exclamation-triangle', NULL, NULL),
(138, 'fa-external-link', NULL, NULL),
(139, 'fa-external-link-square', NULL, NULL),
(140, 'fa-eye', NULL, NULL),
(141, 'fa-eye-slash', NULL, NULL),
(142, 'fa-eyedropper', NULL, NULL),
(143, 'fa-fax', NULL, NULL),
(144, 'fa-female', NULL, NULL),
(145, 'fa-fighter-jet', NULL, NULL),
(146, 'fa-file-archive-o', NULL, NULL),
(147, 'fa-file-audio-o', NULL, NULL),
(148, 'fa-file-code-o', NULL, NULL),
(149, 'fa-file-excel-o', NULL, NULL),
(150, 'fa-file-image-o', NULL, NULL),
(151, 'fa-file-movie-o', NULL, NULL),
(152, 'fa-file-pdf-o', NULL, NULL),
(153, 'fa-file-photo-o', NULL, NULL),
(154, 'fa-file-picture-o', NULL, NULL),
(155, 'fa-file-powerpoint-o', NULL, NULL),
(156, 'fa-file-sound-o', NULL, NULL),
(157, 'fa-file-video-o', NULL, NULL),
(158, 'fa-file-word-o', NULL, NULL),
(159, 'fa-file-zip-o', NULL, NULL),
(160, 'fa-film', NULL, NULL),
(161, 'fa-filter', NULL, NULL),
(162, 'fa-fire', NULL, NULL),
(163, 'fa-fire-extinguisher', NULL, NULL),
(164, 'fa-flag', NULL, NULL),
(165, 'fa-flag-checkered', NULL, NULL),
(166, 'fa-flag-o', NULL, NULL),
(167, 'fa-flash', NULL, NULL),
(168, 'fa-flask', NULL, NULL),
(169, 'fa-folder', NULL, NULL),
(170, 'fa-folder-o', NULL, NULL),
(171, 'fa-folder-open', NULL, NULL),
(172, 'fa-folder-open-o', NULL, NULL),
(173, 'fa-frown-o', NULL, NULL),
(174, 'fa-futbol-o', NULL, NULL),
(175, 'fa-gamepad', NULL, NULL),
(176, 'fa-gavel', NULL, NULL),
(177, 'fa-gear', NULL, NULL),
(178, 'fa-gears', NULL, NULL),
(179, 'fa-genderless', NULL, NULL),
(180, 'fa-gift', NULL, NULL),
(181, 'fa-glass', NULL, NULL),
(182, 'fa-globe', NULL, NULL),
(183, 'fa-graduation-cap', NULL, NULL),
(184, 'fa-group', NULL, NULL),
(185, 'fa-hard-of-hearing', NULL, NULL),
(186, 'fa-hdd-o', NULL, NULL),
(187, 'fa-handshake-o', NULL, NULL),
(188, 'fa-hashtag', NULL, NULL),
(189, 'fa-headphones', NULL, NULL),
(190, 'fa-heart', NULL, NULL),
(191, 'fa-heart-o', NULL, NULL),
(192, 'fa-heartbeat', NULL, NULL),
(193, 'fa-history', NULL, NULL),
(194, 'fa-home', NULL, NULL),
(195, 'fa-hotel', NULL, NULL),
(196, 'fa-hourglass', NULL, NULL),
(197, 'fa-hourglass-1', NULL, NULL),
(198, 'fa-hourglass-2', NULL, NULL),
(199, 'fa-hourglass-3', NULL, NULL),
(200, 'fa-hourglass-end', NULL, NULL),
(201, 'fa-hourglass-half', NULL, NULL),
(202, 'fa-hourglass-o', NULL, NULL),
(203, 'fa-hourglass-start', NULL, NULL),
(204, 'fa-i-cursor', NULL, NULL),
(205, 'fa-id-badge', NULL, NULL),
(206, 'fa-id-card', NULL, NULL),
(207, 'fa-id-card-o', NULL, NULL),
(208, 'fa-image', NULL, NULL),
(209, 'fa-inbox', NULL, NULL),
(210, 'fa-industry', NULL, NULL),
(211, 'fa-info', NULL, NULL),
(212, 'fa-info-circle', NULL, NULL),
(213, 'fa-institution', NULL, NULL),
(214, 'fa-key', NULL, NULL),
(215, 'fa-keyboard-o', NULL, NULL),
(216, 'fa-language', NULL, NULL),
(217, 'fa-laptop', NULL, NULL),
(218, 'fa-leaf', NULL, NULL),
(219, 'fa-legal', NULL, NULL),
(220, 'fa-lemon-o', NULL, NULL),
(221, 'fa-level-down', NULL, NULL),
(222, 'fa-level-up', NULL, NULL),
(223, 'fa-life-bouy', NULL, NULL),
(224, 'fa-life-buoy', NULL, NULL),
(225, 'fa-life-ring', NULL, NULL),
(226, 'fa-life-saver', NULL, NULL),
(227, 'fa-lightbulb-o', NULL, NULL),
(228, 'fa-line-chart', NULL, NULL),
(229, 'fa-location-arrow', NULL, NULL),
(230, 'fa-lock', NULL, NULL),
(231, 'fa-low-vision', NULL, NULL),
(232, 'fa-magic', NULL, NULL),
(233, 'fa-magnet', NULL, NULL),
(234, 'fa-mail-forward', NULL, NULL),
(235, 'fa-mail-reply', NULL, NULL),
(236, 'fa-mail-reply-all', NULL, NULL),
(237, 'fa-male', NULL, NULL),
(238, 'fa-map', NULL, NULL),
(239, 'fa-map-o', NULL, NULL),
(240, 'fa-map-pin', NULL, NULL),
(241, 'fa-map-signs', NULL, NULL),
(242, 'fa-map-marker', NULL, NULL),
(243, 'fa-meh-o', NULL, NULL),
(244, 'fa-microchip', NULL, NULL),
(245, 'fa-microphone', NULL, NULL),
(246, 'fa-microphone-slash', NULL, NULL),
(247, 'fa-minus', NULL, NULL),
(248, 'fa-minus-circle', NULL, NULL),
(249, 'fa-minus-square', NULL, NULL),
(250, 'fa-minus-square-o', NULL, NULL),
(251, 'fa-mobile', NULL, NULL),
(252, 'fa-mobile-phone', NULL, NULL),
(253, 'fa-money', NULL, NULL),
(254, 'fa-moon-o', NULL, NULL),
(255, 'fa-mortar-board', NULL, NULL),
(256, 'fa-motorcycle', NULL, NULL),
(257, 'fa-mouse-pointer', NULL, NULL),
(258, 'fa-music', NULL, NULL),
(259, 'fa-navicon', NULL, NULL),
(260, 'fa-newspaper-o', NULL, NULL),
(261, 'fa-object-group', NULL, NULL),
(262, 'fa-object-ungroup', NULL, NULL),
(263, 'fa-paint-brush', NULL, NULL),
(264, 'fa-paper-plane', NULL, NULL),
(265, 'fa-paper-plane-o', NULL, NULL),
(266, 'fa-paw', NULL, NULL),
(267, 'fa-pencil', NULL, NULL),
(268, 'fa-pencil-square', NULL, NULL),
(269, 'fa-pencil-square-o', NULL, NULL),
(270, 'fa-percent', NULL, NULL),
(271, 'fa-phone', NULL, NULL),
(272, 'fa-phone-square', NULL, NULL),
(273, 'fa-photo', NULL, NULL),
(274, 'fa-picture-o', NULL, NULL),
(275, 'fa-pie-chart', NULL, NULL),
(276, 'fa-plane', NULL, NULL),
(277, 'fa-plug', NULL, NULL),
(278, 'fa-plus', NULL, NULL),
(279, 'fa-plus-circle', NULL, NULL),
(280, 'fa-plus-square', NULL, NULL),
(281, 'fa-plus-square-o', NULL, NULL),
(282, 'fa-podcast', NULL, NULL),
(283, 'fa-power-off', NULL, NULL),
(284, 'fa-print', NULL, NULL),
(285, 'fa-puzzle-piece', NULL, NULL),
(286, 'fa-qrcode', NULL, NULL),
(287, 'fa-question', NULL, NULL),
(288, 'fa-question-circle', NULL, NULL),
(289, 'fa-question-circle-o', NULL, NULL),
(290, 'fa-quote-left', NULL, NULL),
(291, 'fa-quote-right', NULL, NULL),
(292, 'fa-random', NULL, NULL),
(293, 'fa-recycle', NULL, NULL),
(294, 'fa-refresh', NULL, NULL),
(295, 'fa-registered', NULL, NULL),
(296, 'fa-remove', NULL, NULL),
(297, 'fa-reorder', NULL, NULL),
(298, 'fa-reply', NULL, NULL),
(299, 'fa-reply-all', NULL, NULL),
(300, 'fa-retweet', NULL, NULL),
(301, 'fa-road', NULL, NULL),
(302, 'fa-rocket', NULL, NULL),
(303, 'fa-rss', NULL, NULL),
(304, 'fa-rss-square', NULL, NULL),
(305, 'fa-s15', NULL, NULL),
(306, 'fa-search', NULL, NULL),
(307, 'fa-search-minus', NULL, NULL),
(308, 'fa-search-plus', NULL, NULL),
(309, 'fa-send', NULL, NULL),
(310, 'fa-send-o', NULL, NULL),
(311, 'fa-server', NULL, NULL),
(312, 'fa-share', NULL, NULL),
(313, 'fa-share-alt', NULL, NULL),
(314, 'fa-share-alt-square', NULL, NULL),
(315, 'fa-share-square', NULL, NULL),
(316, 'fa-share-square-o', NULL, NULL),
(317, 'fa-shield', NULL, NULL),
(318, 'fa-ship', NULL, NULL),
(319, 'fa-shopping-bag', NULL, NULL),
(320, 'fa-shopping-basket', NULL, NULL),
(321, 'fa-shopping-cart', NULL, NULL),
(322, 'fa-shower', NULL, NULL),
(323, 'fa-sign-in', NULL, NULL),
(324, 'fa-sign-out', NULL, NULL),
(325, 'fa-sign-language', NULL, NULL),
(326, 'fa-signal', NULL, NULL),
(327, 'fa-signing', NULL, NULL),
(328, 'fa-sitemap', NULL, NULL),
(329, 'fa-sliders', NULL, NULL),
(330, 'fa-smile-o', NULL, NULL),
(331, 'fa-snowflake-o', NULL, NULL),
(332, 'fa-soccer-ball-o', NULL, NULL),
(333, 'fa-sort', NULL, NULL),
(334, 'fa-sort-alpha-asc', NULL, NULL),
(335, 'fa-sort-alpha-desc', NULL, NULL),
(336, 'fa-sort-amount-asc', NULL, NULL),
(337, 'fa-sort-amount-desc', NULL, NULL),
(338, 'fa-sort-asc', NULL, NULL),
(339, 'fa-sort-desc', NULL, NULL),
(340, 'fa-sort-down', NULL, NULL),
(341, 'fa-sort-numeric-asc', NULL, NULL),
(342, 'fa-sort-numeric-desc', NULL, NULL),
(343, 'fa-sort-up', NULL, NULL),
(344, 'fa-space-shuttle', NULL, NULL),
(345, 'fa-spinner', NULL, NULL),
(346, 'fa-spoon', NULL, NULL),
(347, 'fa-square', NULL, NULL),
(348, 'fa-square-o', NULL, NULL),
(349, 'fa-star', NULL, NULL),
(350, 'fa-star-half', NULL, NULL),
(351, 'fa-star-half-empty', NULL, NULL),
(352, 'fa-star-half-full', NULL, NULL),
(353, 'fa-star-half-o', NULL, NULL),
(354, 'fa-star-o', NULL, NULL),
(355, 'fa-sticky-note', NULL, NULL),
(356, 'fa-sticky-note-o', NULL, NULL),
(357, 'fa-street-view', NULL, NULL),
(358, 'fa-suitcase', NULL, NULL),
(359, 'fa-sun-o', NULL, NULL),
(360, 'fa-support', NULL, NULL),
(361, 'fa-tablet', NULL, NULL),
(362, 'fa-tachometer', NULL, NULL),
(363, 'fa-tag', NULL, NULL),
(364, 'fa-tags', NULL, NULL),
(365, 'fa-tasks', NULL, NULL),
(366, 'fa-taxi', NULL, NULL),
(367, 'fa-television', NULL, NULL),
(368, 'fa-terminal', NULL, NULL),
(369, 'fa-thermometer', NULL, NULL),
(370, 'fa-thermometer-0', NULL, NULL),
(371, 'fa-thermometer-1', NULL, NULL),
(372, 'fa-thermometer-2', NULL, NULL),
(373, 'fa-thermometer-3', NULL, NULL),
(374, 'fa-thermometer-4', NULL, NULL),
(375, 'fa-thermometer-empty', NULL, NULL),
(376, 'fa-thermometer-full', NULL, NULL),
(377, 'fa-thermometer-half', NULL, NULL),
(378, 'fa-thermometer-quarter', NULL, NULL),
(379, 'fa-thermometer-three-quar', NULL, NULL),
(380, 'fa-thumb-tack', NULL, NULL),
(381, 'fa-thumbs-down', NULL, NULL),
(382, 'fa-thumbs-o-up', NULL, NULL),
(383, 'fa-thumbs-up', NULL, NULL),
(384, 'fa-ticket', NULL, NULL),
(385, 'fa-times', NULL, NULL),
(386, 'fa-times-circle', NULL, NULL),
(387, 'fa-times-circle-o', NULL, NULL),
(388, 'fa-times-rectangle', NULL, NULL),
(389, 'fa-times-rectangle-o', NULL, NULL),
(390, 'fa-tint', NULL, NULL),
(391, 'fa-toggle-down', NULL, NULL),
(392, 'fa-toggle-left', NULL, NULL),
(393, 'fa-toggle-right', NULL, NULL),
(394, 'fa-toggle-up', NULL, NULL),
(395, 'fa-toggle-off', NULL, NULL),
(396, 'fa-toggle-on', NULL, NULL),
(397, 'fa-trademark', NULL, NULL),
(398, 'fa-trash', NULL, NULL),
(399, 'fa-trash-o', NULL, NULL),
(400, 'fa-tree', NULL, NULL),
(401, 'fa-trophy', NULL, NULL),
(402, 'fa-truck', NULL, NULL),
(403, 'fa-tty', NULL, NULL),
(404, 'fa-tv', NULL, NULL),
(405, 'fa-umbrella', NULL, NULL),
(406, 'fa-universal-access', NULL, NULL),
(407, 'fa-university', NULL, NULL),
(408, 'fa-unlock', NULL, NULL),
(409, 'fa-unlock-alt', NULL, NULL),
(410, 'fa-unsorted', NULL, NULL),
(411, 'fa-upload', NULL, NULL),
(412, 'fa-user', NULL, NULL),
(413, 'fa-user-circle', NULL, NULL),
(414, 'fa-user-circle-o', NULL, NULL),
(415, 'fa-user-o', NULL, NULL),
(416, 'fa-user-plus', NULL, NULL),
(417, 'fa-user-secret', NULL, NULL),
(418, 'fa-user-times', NULL, NULL),
(419, 'fa-users', NULL, NULL),
(420, 'fa-vcard', NULL, NULL),
(421, 'fa-vcard-o', NULL, NULL),
(422, 'fa-video-camera', NULL, NULL),
(423, 'fa-volume-control-phone', NULL, NULL),
(424, 'fa-volume-down', NULL, NULL),
(425, 'fa-volume-off', NULL, NULL),
(426, 'fa-volume-up', NULL, NULL),
(427, 'fa-warning', NULL, NULL),
(428, 'fa-wheelchair', NULL, NULL),
(429, 'fa-wheelchair-alt', NULL, NULL),
(430, 'fa-window-close', NULL, NULL),
(431, 'fa-window-close-o', NULL, NULL),
(432, 'fa-window-maximize', NULL, NULL),
(433, 'fa-window-minimize', NULL, NULL),
(434, 'fa-window-restore', NULL, NULL),
(435, 'fa-wifi', NULL, NULL),
(436, 'fa-wrench', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sys_page_section`
--

CREATE TABLE `sys_page_section` (
  `section_id` int(11) NOT NULL,
  `section_name` varchar(25) DEFAULT NULL,
  `section_title` varchar(255) DEFAULT NULL,
  `section_desc` varchar(200) DEFAULT NULL,
  `image_section` varchar(50) DEFAULT NULL,
  `image_folder` varchar(25) DEFAULT NULL,
  `section_script` text,
  `sort_order` smallint(2) DEFAULT NULL,
  `is_visible` varchar(1) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(25) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(25) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sys_page_section`
--

INSERT INTO `sys_page_section` (`section_id`, `section_name`, `section_title`, `section_desc`, `image_section`, `image_folder`, `section_script`, `sort_order`, `is_visible`, `create_date`, `create_by`, `update_date`, `update_by`) VALUES
(1, 'Slider', '', '', NULL, 'slider', '<div class=\"item\" style=\"background-image: url([img])\">\n	<div class=\"slider-inner\">\n		<div class=\"container\">\n			<div class=\"row\">\n				<div class=\"col-sm-6\">\n					<div class=\"carousel-content\">\n						<h2><span>[img_title]</span></h2>\n						<p>[short_description]</p>\n						<a class=\"btn btn-primary btn-lg\" href=\"[btn_url]\">[btn_label]</a>\n					</div>\n				</div>\n			</div>\n		</div>\n	</div>\n</div><!--/.item-->', 2, 'Y', NULL, NULL, NULL, ''),
(2, 'Profile', 'Profile', '<p style=\"text-align:center\">Profil Dinas Kearsipan Pemerintah Kota Depok</p>\r\n', 'DEPOK-BERSAHABAT-18-ok.png', 'features', '<div class=\"media service-box wow fadeInRight\">\r\n		<div class=\"pull-left\">\r\n				<i class=\"[icon]\"></i>\r\n		</div>\r\n		<div class=\"media-body\">\r\n				<h4 class=\"media-heading\">[title]</h4>\r\n				<p>[short_description]</p>\r\n		</div>\r\n</div>', 3, 'Y', NULL, NULL, NULL, ''),
(3, 'Template', 'Kami Siap Membantu Anda', '<p>Dinas Kearsipan dan Perpustakaan Kota Depok</p>\r\n', 'cta2-img1.png', 'template', '<section id=\"cta2\">\r\n    <div class=\"container\">\r\n        <div class=\"text-center\">\r\n            <h2 class=\"wow fadeInUp\" data-wow-duration=\"300ms\" data-wow-delay=\"0ms\">[title]</h2>\r\n            <p class=\"wow fadeInUp\" data-wow-duration=\"300ms\" data-wow-delay=\"100ms\">[short_description]</p>\r\n            <p class=\"wow fadeInUp\" data-wow-duration=\"300ms\" data-wow-delay=\"200ms\"><a class=\"btn btn-primary btn-lg\" href=\"[btn_url]\">[btn_label]</a></p>\r\n            <img class=\"img-responsive wow fadeIn\" src=\"[img]\" alt=\"\" data-wow-duration=\"300ms\" data-wow-delay=\"300ms\">\r\n        </div>\r\n    </div>\r\n</section>', 8, 'N', NULL, NULL, NULL, ''),
(4, 'Services', 'Layanan Publik', '<p style=\"text-align:center\">Layanan Dinas Kearsipan Pemerintah Kota Depok Untuk Masyarakat Depok</p>\r\n', NULL, 'Services', '<div class=\"col-md-4 col-sm-6 wow fadeInUp\" data-wow-duration=\"300ms\" data-wow-delay=\"0ms\">\n		<div class=\"media service-box\" styel=\"text-align: left;\">\n				<div class=\"pull-left\">\n						<i class=\"[icon]\"></i>\n				</div>\n				<div class=\"media-body\">\n						<h4 class=\"media-heading\">[title]</h4>\n						<p>[short_description]</p>\n				</div>\n		</div>\n</div><!--/.col-md-4-->', 7, 'N', NULL, NULL, NULL, ''),
(5, 'Publikasi', 'Publikasi', '<p style=\"text-align:center\">lKami menyediakan layanan publikasi untuk masyarakat yang membutuhkan informasi terkait<br />\r\ndengan kearsipan, termasuk agenda kegiatan, pengumuman, jurnal, berita, dsb&', NULL, 'works', '<div class=\"portfolio-item [btn_label]\">\n    <div class=\"portfolio-item-inner\">\n        <img style=\"width:261px;height:174px\" class=\"img-responsive\" src=\"[img1]\" alt=\"\">\n        <div class=\"portfolio-info\">\n            <h3>[short_description1]</h3>\n            [short_description2]\n            <!--<a class=\"preview\" href=\"[img2]\" rel=\"prettyPhoto\"><i class=\"fa fa-eye\"></i></a>-->\n        </div>\n    </div>\n</div><!--/.portfolio-item-->', 5, 'Y', NULL, NULL, NULL, ''),
(6, 'About', 'ABOUT US', '<p style=\"text-align:center\">Gambaran Singkat Dinas Kearsipan Kota Depok</p>\r\n', 'About-Us-Library1.jpg', 'about', '<div class=\"row\">\r\n		<div class=\"col-sm-6\">\r\n				<ul class=\"nostyle\">\r\n						<li><i class=\"fa fa-check-square\"></i> Ipsum is simply dummy</li>\r\n						<li><i class=\"fa fa-check-square\"></i> When an unknown</li>\r\n				</ul>\r\n		</div>\r\n\r\n		<div class=\"col-sm-6\">\r\n				<ul class=\"nostyle\">\r\n						<li><i class=\"fa fa-check-square\"></i> The printing and typesetting</li>\r\n						<li><i class=\"fa fa-check-square\"></i> Lorem Ipsum has been</li>\r\n				</ul>\r\n		</div>\r\n</div>\r\n\r\n', 6, 'N', NULL, NULL, NULL, ''),
(7, 'Process', '', '<p>Copyright &copy; 2017&nbsp;Kearsipan Kota Depok</p>\r\n', NULL, '', '<section id=\"work-process\">\r\n    <div class=\"container\">\r\n        <div class=\"section-header\">\r\n            <h2 class=\"section-title text-center wow fadeInDown\">Our Process</h2>\r\n            <p class=\"text-center wow fadeInDown\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut enim ad minim veniam</p>\r\n        </div>\r\n\r\n        <div class=\"row text-center\">\r\n            <div class=\"col-md-2 col-md-4 col-xs-6\">\r\n                <div class=\"wow fadeInUp\" data-wow-duration=\"400ms\" data-wow-delay=\"0ms\">\r\n                    <div class=\"icon-circle\">\r\n                        <span>1</span>\r\n                        <i class=\"fa fa-coffee fa-2x\"></i>\r\n                    </div>\r\n                    <h3>MEET</h3>\r\n                </div>\r\n            </div>\r\n            <div class=\"col-md-2 col-md-4 col-xs-6\">\r\n                <div class=\"wow fadeInUp\" data-wow-duration=\"400ms\" data-wow-delay=\"100ms\">\r\n                    <div class=\"icon-circle\">\r\n                        <span>2</span>\r\n                        <i class=\"fa fa-bullhorn fa-2x\"></i>\r\n                    </div>\r\n                    <h3>PLAN</h3>\r\n                </div>\r\n            </div>\r\n            <div class=\"col-md-2 col-md-4 col-xs-6\">\r\n                <div class=\"wow fadeInUp\" data-wow-duration=\"400ms\" data-wow-delay=\"200ms\">\r\n                    <div class=\"icon-circle\">\r\n                        <span>3</span>\r\n                        <i class=\"fa fa-image fa-2x\"></i>\r\n                    </div>\r\n                    <h3>DESIGN</h3>\r\n                </div>\r\n            </div>\r\n            <div class=\"col-md-2 col-md-4 col-xs-6\">\r\n                <div class=\"wow fadeInUp\" data-wow-duration=\"400ms\" data-wow-delay=\"300ms\">\r\n                    <div class=\"icon-circle\">\r\n                        <span>4</span>\r\n                        <i class=\"fa fa-heart fa-2x\"></i>\r\n                    </div>\r\n                    <h3>DEVELOP</h3>\r\n                </div>\r\n            </div>\r\n            <div class=\"col-md-2 col-md-4 col-xs-6\">\r\n                <div class=\"wow fadeInUp\" data-wow-duration=\"400ms\" data-wow-delay=\"400ms\">\r\n                    <div class=\"icon-circle\">\r\n                        <span>5</span>\r\n                        <i class=\"fa fa-shopping-cart fa-2x\"></i>\r\n                    </div>\r\n                    <h3>TESTING</h3>\r\n                </div>\r\n            </div>\r\n            <div class=\"col-md-2 col-md-4 col-xs-6\">\r\n                <div class=\"wow fadeInUp\" data-wow-duration=\"400ms\" data-wow-delay=\"500ms\">\r\n                    <div class=\"icon-circle\">\r\n                        <span>6</span>\r\n                        <i class=\"fa fa-space-shuttle fa-2x\"></i>\r\n                    </div>\r\n                    <h3>LAUNCH</h3>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</section><!--/#work-process-->', 14, 'N', NULL, NULL, NULL, ''),
(8, 'Team', 'Peraturan dan Perundang-Undangan', '<p style=\"text-align:center\">Payung hukum terkait kearsipan</p>\r\n', 'team3.jpg', 'team', '<section id=\"meet-team\">\r\n    <div class=\"container\">\r\n        <div class=\"section-header\">\r\n            <h2 class=\"section-title text-center wow fadeInDown\">Meet The Team</h2>\r\n            <p class=\"text-center wow fadeInDown\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut enim ad minim veniam</p>\r\n        </div>\r\n\r\n        <div class=\"row\">\r\n            <div class=\"col-sm-6 col-md-3\">\r\n                <div class=\"team-member wow fadeInUp\" data-wow-duration=\"400ms\" data-wow-delay=\"0ms\">\r\n                    <div class=\"team-img\">\r\n                        <img class=\"img-responsive\" src=\"images/team/01.jpg\" alt=\"\">\r\n                    </div>\r\n                    <div class=\"team-info\">\r\n                        <h3>Bin Burhan</h3>\r\n                        <span>Co-Founder</span>\r\n                    </div>\r\n                    <p>Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater</p>\r\n                    <ul class=\"social-icons\">\r\n                        <li><a href=\"#\"><i class=\"fa fa-facebook\"></i></a></li>\r\n                        <li><a href=\"#\"><i class=\"fa fa-twitter\"></i></a></li>\r\n                        <li><a href=\"#\"><i class=\"fa fa-google-plus\"></i></a></li>\r\n                        <li><a href=\"#\"><i class=\"fa fa-linkedin\"></i></a></li>\r\n                    </ul>\r\n                </div>\r\n            </div>\r\n            <div class=\"col-sm-6 col-md-3\">\r\n                <div class=\"team-member wow fadeInUp\" data-wow-duration=\"400ms\" data-wow-delay=\"100ms\">\r\n                    <div class=\"team-img\">\r\n                        <img class=\"img-responsive\" src=\"images/team/02.jpg\" alt=\"\">\r\n                    </div>\r\n                    <div class=\"team-info\">\r\n                        <h3>Jane Man</h3>\r\n                        <span>Project Manager</span>\r\n                    </div>\r\n                    <p>Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater</p>\r\n                    <ul class=\"social-icons\">\r\n                        <li><a href=\"#\"><i class=\"fa fa-facebook\"></i></a></li>\r\n                        <li><a href=\"#\"><i class=\"fa fa-twitter\"></i></a></li>\r\n                        <li><a href=\"#\"><i class=\"fa fa-google-plus\"></i></a></li>\r\n                        <li><a href=\"#\"><i class=\"fa fa-linkedin\"></i></a></li>\r\n                    </ul>\r\n                </div>\r\n            </div>\r\n            <div class=\"col-sm-6 col-md-3\">\r\n                <div class=\"team-member wow fadeInUp\" data-wow-duration=\"400ms\" data-wow-delay=\"200ms\">\r\n                    <div class=\"team-img\">\r\n                        <img class=\"img-responsive\" src=\"images/team/03.jpg\" alt=\"\">\r\n                    </div>\r\n                    <div class=\"team-info\">\r\n                        <h3>Pahlwan</h3>\r\n                        <span>Designer</span>\r\n                    </div>\r\n                    <p>Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater</p>\r\n                    <ul class=\"social-icons\">\r\n                        <li><a href=\"#\"><i class=\"fa fa-facebook\"></i></a></li>\r\n                        <li><a href=\"#\"><i class=\"fa fa-twitter\"></i></a></li>\r\n                        <li><a href=\"#\"><i class=\"fa fa-google-plus\"></i></a></li>\r\n                        <li><a href=\"#\"><i class=\"fa fa-linkedin\"></i></a></li>\r\n                    </ul>\r\n                </div>\r\n            </div>\r\n            <div class=\"col-sm-6 col-md-3\">\r\n                <div class=\"team-member wow fadeInUp\" data-wow-duration=\"400ms\" data-wow-delay=\"300ms\">\r\n                    <div class=\"team-img\">\r\n                        <img class=\"img-responsive\" src=\"images/team/04.jpg\" alt=\"\">\r\n                    </div>\r\n                    <div class=\"team-info\">\r\n                        <h3>Nasir uddin</h3>\r\n                        <span>UI/UX</span>\r\n                    </div>\r\n                    <p>Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater</p>\r\n                    <ul class=\"social-icons\">\r\n                        <li><a href=\"#\"><i class=\"fa fa-facebook\"></i></a></li>\r\n                        <li><a href=\"#\"><i class=\"fa fa-twitter\"></i></a></li>\r\n                        <li><a href=\"#\"><i class=\"fa fa-google-plus\"></i></a></li>\r\n                        <li><a href=\"#\"><i class=\"fa fa-linkedin\"></i></a></li>\r\n                    </ul>\r\n                </div>\r\n            </div>\r\n        </div>\r\n\r\n        <div class=\"divider\"></div>\r\n\r\n        </div>\r\n    </div>\r\n</section><!--/#meet-team-->', 11, 'N', NULL, NULL, NULL, ''),
(9, 'Fun Fact', NULL, NULL, NULL, NULL, '<section id=\"animated-number\">\r\n    <div class=\"container\">\r\n        <div class=\"section-header\">\r\n            <h2 class=\"section-title text-center wow fadeInDown\">Fun Facts</h2>\r\n            <p class=\"text-center wow fadeInDown\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut enim ad minim veniam</p>\r\n        </div>\r\n\r\n        <div class=\"row text-center\">\r\n            <div class=\"col-sm-3 col-xs-6\">\r\n                <div class=\"wow fadeInUp\" data-wow-duration=\"400ms\" data-wow-delay=\"0ms\">\r\n                    <div class=\"animated-number\" data-digit=\"2305\" data-duration=\"1000\"></div>\r\n                    <strong>CUPS OF COFFEE CONSUMED</strong>\r\n                </div>\r\n            </div>\r\n            <div class=\"col-sm-3 col-xs-6\">\r\n                <div class=\"wow fadeInUp\" data-wow-duration=\"400ms\" data-wow-delay=\"100ms\">\r\n                    <div class=\"animated-number\" data-digit=\"1231\" data-duration=\"1000\"></div>\r\n                    <strong>CLIENT WORKED WITH</strong>\r\n                </div>\r\n            </div>\r\n            <div class=\"col-sm-3 col-xs-6\">\r\n                <div class=\"wow fadeInUp\" data-wow-duration=\"400ms\" data-wow-delay=\"200ms\">\r\n                    <div class=\"animated-number\" data-digit=\"3025\" data-duration=\"1000\"></div>\r\n                    <strong>PROJECT COMPLETED</strong>\r\n                </div>\r\n            </div>\r\n            <div class=\"col-sm-3 col-xs-6\">\r\n                <div class=\"wow fadeInUp\" data-wow-duration=\"400ms\" data-wow-delay=\"300ms\">\r\n                    <div class=\"animated-number\" data-digit=\"1199\" data-duration=\"1000\"></div>\r\n                    <strong>QUESTIONS ANSWERED</strong>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</section><!--/#animated-number-->', 18, 'N', NULL, NULL, NULL, ''),
(10, 'Pricing Table', NULL, NULL, NULL, NULL, '<section id=\"pricing\">\r\n    <div class=\"container\">\r\n        <div class=\"section-header\">\r\n            <h2 class=\"section-title text-center wow fadeInDown\">Pricing Table</h2>\r\n            <p class=\"text-center wow fadeInDown\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut enim ad minim veniam</p>\r\n        </div>\r\n\r\n        <div class=\"row\">\r\n            <div class=\"col-sm-6 col-md-3\">\r\n                <div class=\"wow zoomIn\" data-wow-duration=\"400ms\" data-wow-delay=\"0ms\">\r\n                    <ul class=\"pricing\">\r\n                        <li class=\"plan-header\">\r\n                            <div class=\"price-duration\">\r\n                                <span class=\"price\">\r\n                                    $39\r\n                                </span>\r\n                                <span class=\"duration\">\r\n                                    per month\r\n                                </span>\r\n                            </div>\r\n\r\n                            <div class=\"plan-name\">\r\n                                Starter\r\n                            </div>\r\n                        </li>\r\n                        <li><strong>1</strong> DOMAIN</li>\r\n                        <li><strong>100GB</strong> DISK SPACE</li>\r\n                        <li><strong>UNLIMITED</strong> BANDWIDTH</li>\r\n                        <li>SHARED SSL CERTIFICATE</li>\r\n                        <li><strong>10</strong> EMAIL ADDRESS</li>\r\n                        <li><strong>24/7</strong> SUPPORT</li>\r\n                        <li class=\"plan-purchase\"><a class=\"btn btn-primary\" href=\"#\">ORDER NOW</a></li>\r\n                    </ul>\r\n                </div>\r\n            </div>\r\n            <div class=\"col-sm-6 col-md-3\">\r\n                <div class=\"wow zoomIn\" data-wow-duration=\"400ms\" data-wow-delay=\"200ms\">\r\n                    <ul class=\"pricing featured\">\r\n                        <li class=\"plan-header\">\r\n                            <div class=\"price-duration\">\r\n                                <span class=\"price\">\r\n                                    $69\r\n                                </span>\r\n                                <span class=\"duration\">\r\n                                    per month\r\n                                </span>\r\n                            </div>\r\n\r\n                            <div class=\"plan-name\">\r\n                                Business\r\n                            </div>\r\n                        </li>\r\n                        <li><strong>3</strong> DOMAIN</li>\r\n                        <li><strong>300GB</strong> DISK SPACE</li>\r\n                        <li><strong>UNLIMITED</strong> BANDWIDTH</li>\r\n                        <li>SHARED SSL CERTIFICATE</li>\r\n                        <li><strong>30</strong> EMAIL ADDRESS</li>\r\n                        <li><strong>24/7</strong> SUPPORT</li>\r\n                        <li class=\"plan-purchase\"><a class=\"btn btn-default\" href=\"#\">ORDER NOW</a></li>\r\n                    </ul>\r\n                </div>\r\n            </div>\r\n            <div class=\"col-sm-6 col-md-3\">\r\n                <div class=\"wow zoomIn\" data-wow-duration=\"400ms\" data-wow-delay=\"400ms\">\r\n                    <ul class=\"pricing\">\r\n                        <li class=\"plan-header\">\r\n                            <div class=\"price-duration\">\r\n                                <span class=\"price\">\r\n                                    $99\r\n                                </span>\r\n                                <span class=\"duration\">\r\n                                    per month\r\n                                </span>\r\n                            </div>\r\n\r\n                            <div class=\"plan-name\">\r\n                                Pro\r\n                            </div>\r\n                        </li>\r\n                        <li><strong>5</strong> DOMAIN</li>\r\n                        <li><strong>500GB</strong> DISK SPACE</li>\r\n                        <li><strong>UNLIMITED</strong> BANDWIDTH</li>\r\n                        <li>SHARED SSL CERTIFICATE</li>\r\n                        <li><strong>50</strong> EMAIL ADDRESS</li>\r\n                        <li><strong>24/7</strong> SUPPORT</li>\r\n                        <li class=\"plan-purchase\"><a class=\"btn btn-primary\" href=\"#\">ORDER NOW</a></li>\r\n                    </ul>\r\n                </div>\r\n            </div>\r\n            <div class=\"col-sm-6 col-md-3\">\r\n                <div class=\"wow zoomIn\" data-wow-duration=\"400ms\" data-wow-delay=\"600ms\">\r\n                    <ul class=\"pricing\">\r\n                        <li class=\"plan-header\">\r\n                            <div class=\"price-duration\">\r\n                                <span class=\"price\">\r\n                                    $199\r\n                                </span>\r\n                                <span class=\"duration\">\r\n                                    per month\r\n                                </span>\r\n                            </div>\r\n\r\n                            <div class=\"plan-name\">\r\n                                Ultra\r\n                            </div>\r\n                        </li>\r\n                        <li><strong>10</strong> DOMAIN</li>\r\n                        <li><strong>1000GB</strong> DISK SPACE</li>\r\n                        <li><strong>UNLIMITED</strong> BANDWIDTH</li>\r\n                        <li>SHARED SSL CERTIFICATE</li>\r\n                        <li><strong>100</strong> EMAIL ADDRESS</li>\r\n                        <li><strong>24/7</strong> SUPPORT</li>\r\n                        <li class=\"plan-purchase\"><a class=\"btn btn-primary\" href=\"#\">ORDER NOW</a></li>\r\n                    </ul>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</section><!--/#pricing-->', 19, 'N', NULL, NULL, NULL, ''),
(11, 'Testimonial', NULL, NULL, NULL, NULL, '<section id=\"testimonial\">\r\n    <div class=\"container\">\r\n        <div class=\"row\">\r\n            <div class=\"col-sm-8 col-sm-offset-2\">\r\n\r\n                <div id=\"carousel-testimonial\" class=\"carousel slide text-center\" data-ride=\"carousel\">\r\n                    <!-- Wrapper for slides -->\r\n                    <div class=\"carousel-inner\" role=\"listbox\">\r\n                        <div class=\"item active\">\r\n                            <p><img class=\"img-circle img-thumbnail\" src=\"images/testimonial/01.jpg\" alt=\"\"></p>\r\n                            <h4>Louise S. Morgan</h4>\r\n                            <small>Treatment, storage, and disposal (TSD) worker</small>\r\n                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut et dolore magna aliqua. Ut enim ad minim veniam</p>\r\n                        </div>\r\n                        <div class=\"item\">\r\n                            <p><img class=\"img-circle img-thumbnail\" src=\"images/testimonial/01.jpg\" alt=\"\"></p>\r\n                            <h4>Louise S. Morgan</h4>\r\n                            <small>Treatment, storage, and disposal (TSD) worker</small>\r\n                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut et dolore magna aliqua. Ut enim ad minim veniam</p>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <!-- Controls -->\r\n                    <div class=\"btns\">\r\n                        <a class=\"btn btn-primary btn-sm\" href=\"#carousel-testimonial\" role=\"button\" data-slide=\"prev\">\r\n                            <span class=\"fa fa-angle-left\" aria-hidden=\"true\"></span>\r\n                            <span class=\"sr-only\">Previous</span>\r\n                        </a>\r\n                        <a class=\"btn btn-primary btn-sm\" href=\"#carousel-testimonial\" role=\"button\" data-slide=\"next\">\r\n                            <span class=\"fa fa-angle-right\" aria-hidden=\"true\"></span>\r\n                            <span class=\"sr-only\">Next</span>\r\n                        </a>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</section><!--/#testimonial-->', 20, 'N', NULL, NULL, NULL, ''),
(12, 'Get In Touch', 'GET IN TOUCH', '<p style=\"text-align:center\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut&nbsp;<br />\r\net dolore magna aliqua. Ut enim ad minim veniam</p>\r\n', 'contactus1.jpg', '', '<section id=\"get-in-touch\">\r\n    <div class=\"container\">\r\n        <div class=\"section-header\">\r\n            <h2 class=\"section-title text-center wow fadeInDown\">Get in Touch</h2>\r\n            <p class=\"text-center wow fadeInDown\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut enim ad minim veniam</p>\r\n        </div>\r\n    </div>\r\n</section><!--/#get-in-touch-->', 12, 'N', NULL, NULL, NULL, ''),
(13, 'Headline', 'AWESOME FEATURES', '', 'About-Us-Library1.jpg', 'headline', '<section id=\"cta\" class=\"wow fadeIn\">\r\n        <div class=\"container\">\r\n            <div class=\"row\">\r\n                <div class=\"col-sm-9\">\r\n                    <h2>[title]</h2>\r\n                    <p>[short_description]\r\n                    </p>\r\n                </div>\r\n                <div class=\"col-sm-3 text-right\">\r\n                    <a class=\"btn btn-primary btn-lg\" href=\"[btn_url]\">[btn_label]</a>\r\n                </div>\r\n            </div>\r\n        </div>\r\n</section><!--/#cta-->', 17, 'Y', NULL, NULL, NULL, ''),
(14, 'Blog', 'Berita', '<p style=\"text-align:center\"><span style=\"font-size:14px\">Berita Seputar Arsip Depok</span></p>\r\n', '1.jpg', 'blog', '<section id=\"blog\">\r\n    <div class=\"container\">\r\n        <div class=\"section-header\">\r\n            <h2 class=\"section-title text-center wow fadeInDown\">Latest Blogs</h2>\r\n            <p class=\"text-center wow fadeInDown\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut enim ad minim veniam</p>\r\n        </div>\r\n\r\n        <div class=\"row\">\r\n            <div class=\"col-sm-6\">\r\n                <div class=\"blog-post blog-large wow fadeInLeft\" data-wow-duration=\"300ms\" data-wow-delay=\"0ms\">\r\n                    <article>\r\n                        <header class=\"entry-header\">\r\n                            <div class=\"entry-thumbnail\">\r\n                                <img class=\"img-responsive\" src=\"images/blog/01.jpg\" alt=\"\">\r\n                                <span class=\"post-format post-format-video\"><i class=\"fa fa-film\"></i></span>\r\n                            </div>\r\n                            <div class=\"entry-date\">25 November 2014</div>\r\n                            <h2 class=\"entry-title\"><a href=\"#\">While now the fated Pequod had been so long afloat this</a></h2>\r\n                        </header>\r\n\r\n                        <div class=\"entry-content\">\r\n                            <P>With a blow from the top-maul Ahab knocked off the steel head of the lance, and then handing to the mate the long iron rod remaining, bade him hold it upright, without its touching off the steel head of the lance, and then handing to the mate the long iron rod remaining. without its touching off the steel without its touching off the steel</P>\r\n                            <a class=\"btn btn-primary\" href=\"#\">Read More</a>\r\n                        </div>\r\n\r\n                        <footer class=\"entry-meta\">\r\n                            <span class=\"entry-author\"><i class=\"fa fa-pencil\"></i> <a href=\"#\">Victor</a></span>\r\n                            <span class=\"entry-category\"><i class=\"fa fa-folder-o\"></i> <a href=\"#\">Tutorial</a></span>\r\n                            <span class=\"entry-comments\"><i class=\"fa fa-comments-o\"></i> <a href=\"#\">15</a></span>\r\n                        </footer>\r\n                    </article>\r\n                </div>\r\n            </div><!--/.col-sm-6-->\r\n            <div class=\"col-sm-6\">\r\n                <div class=\"blog-post blog-media wow fadeInRight\" data-wow-duration=\"300ms\" data-wow-delay=\"100ms\">\r\n                    <article class=\"media clearfix\">\r\n                        <div class=\"entry-thumbnail pull-left\">\r\n                            <img class=\"img-responsive\" src=\"images/blog/02.jpg\" alt=\"\">\r\n                            <span class=\"post-format post-format-gallery\"><i class=\"fa fa-image\"></i></span>\r\n                        </div>\r\n                        <div class=\"media-body\">\r\n                            <header class=\"entry-header\">\r\n                                <div class=\"entry-date\">01 December 2014</div>\r\n                                <h2 class=\"entry-title\"><a href=\"#\">BeReviews was a awesome envent in dhaka</a></h2>\r\n                            </header>\r\n\r\n                            <div class=\"entry-content\">\r\n                                <P>With a blow from the top-maul Ahab knocked off the steel head of the lance, and then handing to the steel</P>\r\n                                <a class=\"btn btn-primary\" href=\"#\">Read More</a>\r\n                            </div>\r\n\r\n                            <footer class=\"entry-meta\">\r\n                                <span class=\"entry-author\"><i class=\"fa fa-pencil\"></i> <a href=\"#\">Campbell</a></span>\r\n                                <span class=\"entry-category\"><i class=\"fa fa-folder-o\"></i> <a href=\"#\">Tutorial</a></span>\r\n                                <span class=\"entry-comments\"><i class=\"fa fa-comments-o\"></i> <a href=\"#\">15</a></span>\r\n                            </footer>\r\n                        </div>\r\n                    </article>\r\n                </div>\r\n                <div class=\"blog-post blog-media wow fadeInRight\" data-wow-duration=\"300ms\" data-wow-delay=\"200ms\">\r\n                    <article class=\"media clearfix\">\r\n                        <div class=\"entry-thumbnail pull-left\">\r\n                            <img class=\"img-responsive\" src=\"images/blog/03.jpg\" alt=\"\">\r\n                            <span class=\"post-format post-format-audio\"><i class=\"fa fa-music\"></i></span>\r\n                        </div>\r\n                        <div class=\"media-body\">\r\n                            <header class=\"entry-header\">\r\n                                <div class=\"entry-date\">03 November 2014</div>\r\n                                <h2 class=\"entry-title\"><a href=\"#\">Play list of old bangle  music and gajal</a></h2>\r\n                            </header>\r\n\r\n                            <div class=\"entry-content\">\r\n                                <P>With a blow from the top-maul Ahab knocked off the steel head of the lance, and then handing to the steel</P>\r\n                                <a class=\"btn btn-primary\" href=\"#\">Read More</a>\r\n                            </div>\r\n\r\n                            <footer class=\"entry-meta\">\r\n                                <span class=\"entry-author\"><i class=\"fa fa-pencil\"></i> <a href=\"#\">Ruth</a></span>\r\n                                <span class=\"entry-category\"><i class=\"fa fa-folder-o\"></i> <a href=\"#\">Tutorial</a></span>\r\n                                <span class=\"entry-comments\"><i class=\"fa fa-comments-o\"></i> <a href=\"#\">15</a></span>\r\n                            </footer>\r\n                        </div>\r\n                    </article>\r\n                </div>\r\n            </div>\r\n        </div>\r\n\r\n    </div>\r\n</section>', 4, 'Y', NULL, NULL, NULL, ''),
(15, 'Contact', 'Hubungi Kami', '<p style=\"text-align:center\">Hubungi kami terkait Kearsipan&nbsp;di Pemerintah Kota Depok</p>\r\n', NULL, 'contact', '<section id=\"contact\">\r\n    <!--<div id=\"google-map\" style=\"height:650px\" data-latitude=\"52.365629\" data-longitude=\"4.871331\"></div>-->\r\n    <div class=\"container-wrapper\">\r\n        <div class=\"container\">\r\n            <div class=\"row\">\r\n                <div class=\"col-sm-4 col-sm-offset-8\">\r\n                    <div class=\"contact-form\">\r\n                        <h3>Contact Info</h3>\r\n\r\n                        <address>\r\n                          <strong>Twitter, Inc.</strong><br>\r\n                          795 Folsom Ave, Suite 600<br>\r\n                          San Francisco, CA 94107<br>\r\n                          <abbr title=\"Phone\">P:</abbr> (123) 456-7890\r\n                        </address>\r\n\r\n                        <form id=\"main-contact-form\" name=\"contact-form\" method=\"post\" action=\"#\">\r\n                            <div class=\"form-group\">\r\n                                <input type=\"text\" name=\"name\" class=\"form-control\" placeholder=\"Name\" required>\r\n                            </div>\r\n                            <div class=\"form-group\">\r\n                                <input type=\"email\" name=\"email\" class=\"form-control\" placeholder=\"Email\" required>\r\n                            </div>\r\n                            <div class=\"form-group\">\r\n                                <input type=\"text\" name=\"subject\" class=\"form-control\" placeholder=\"Subject\" required>\r\n                            </div>\r\n                            <div class=\"form-group\">\r\n                                <textarea name=\"message\" class=\"form-control\" rows=\"8\" placeholder=\"Message\" required></textarea>\r\n                            </div>\r\n                            <button type=\"submit\" class=\"btn btn-primary\">Send Message</button>\r\n                        </form>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</section><!--/#bottom-->', 13, 'Y', NULL, NULL, NULL, ''),
(16, 'Footer', 'Copyright Kearsipan Kota Depok', '<p>Copyright &copy; 2017&nbsp;Kearsipan Kota Depok</p>\r\n', NULL, 'footer', '<footer id=\"footer\">\r\n    <div class=\"container\">\r\n        <div class=\"row\">\r\n            <div class=\"col-sm-6\">\r\n                &copy; 2014 Your Company. Designed by <a target=\"_blank\" href=\"http://shapebootstrap.net/\" title=\"Free Twitter Bootstrap WordPress Themes and HTML templates\">ShapeBootstrap</a>\r\n            </div>\r\n            <div class=\"col-sm-6\">\r\n                <ul class=\"social-icons\">\r\n                    <li><a href=\"#\"><i class=\"fa fa-facebook\"></i></a></li>\r\n                    <li><a href=\"#\"><i class=\"fa fa-twitter\"></i></a></li>\r\n                    <li><a href=\"#\"><i class=\"fa fa-google-plus\"></i></a></li>\r\n                    <li><a href=\"#\"><i class=\"fa fa-pinterest\"></i></a></li>\r\n                    <li><a href=\"#\"><i class=\"fa fa-dribbble\"></i></a></li>\r\n                    <li><a href=\"#\"><i class=\"fa fa-behance\"></i></a></li>\r\n                    <li><a href=\"#\"><i class=\"fa fa-flickr\"></i></a></li>\r\n                    <li><a href=\"#\"><i class=\"fa fa-youtube\"></i></a></li>\r\n                    <li><a href=\"#\"><i class=\"fa fa-linkedin\"></i></a></li>\r\n                    <li><a href=\"#\"><i class=\"fa fa-github\"></i></a></li>\r\n                </ul>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</footer><!--/#footer-->', 15, 'Y', NULL, NULL, NULL, ''),
(17, 'Files', 'Koleksi File', '', NULL, 'files', '<div class=\"col-md-4 col-sm-6 wow fadeInUp\" data-wow-duration=\"300ms\" data-wow-delay=\"0ms\">\n		<div class=\"media service-box\" styel=\"text-align: left; \" >\n				<div class=\"pull-left\" >\n						<img class=\"img-responsive wow fadeIn\" src=\"[img]\" style=\"width:50px;height:50px\" alt=\"\" data-wow-duration=\"300ms\" data-wow-delay=\"300ms\">\n				</div>\n				<div class=\"media-body\">\n						<h4 class=\"media-heading\">[title]</h4>\n						<p>[short_description]</p>\n				</div>\n		</div>\n</div><!--/.col-md-4-->', 10, 'N', NULL, NULL, NULL, ''),
(18, 'Image Gallery', 'Image Gallery', '<p>Mauris <strong>pretium </strong>auctor quam. Vestibulum et nunc id nisi fringilla&nbsp;<br />\r\niaculis. Mauris pretium auctor quam.</p>\r\n', NULL, 'gallery', NULL, 9, 'N', NULL, NULL, NULL, ''),
(19, 'Menu', 'menu', '', NULL, 'menu', NULL, 21, 'N', NULL, NULL, NULL, ''),
(28, 'Logo', 'Logo', '', NULL, 'logo', NULL, 16, 'N', NULL, NULL, NULL, ''),
(30, 'OPD', 'OPD', '', NULL, 'opd', NULL, 1, 'N', NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `sys_settings`
--

CREATE TABLE `sys_settings` (
  `id_setting` varchar(3) NOT NULL DEFAULT '',
  `value_setting` varchar(255) DEFAULT NULL,
  `desc_setting` varchar(255) DEFAULT NULL,
  `status_setting` varchar(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sys_settings`
--

INSERT INTO `sys_settings` (`id_setting`, `value_setting`, `desc_setting`, `status_setting`) VALUES
('001', 'Portal Kearsipan', 'system title', '1'),
('002', 'Read More...', 'Default Button Label', '1'),
('003', 'Right', 'Posisi Menu Website Frontend', '1'),
('004', '10', 'Number row per page', '1'),
('005', '5', 'Jumlah article yang muncul di berita tengah', '1'),
('006', '10', 'Jumlah article yang muncul di berita kanan', '1'),
('007', '30', 'SECTION CODE OPD', '1');

-- --------------------------------------------------------

--
-- Table structure for table `sys_users`
--

CREATE TABLE `sys_users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(25) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `full_name` varchar(25) DEFAULT NULL,
  `login_status` varchar(1) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_logout` datetime DEFAULT NULL,
  `status_active` varchar(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sys_users`
--

INSERT INTO `sys_users` (`user_id`, `user_name`, `pwd`, `full_name`, `login_status`, `last_login`, `last_logout`, `status_active`) VALUES
(1, 'Administrator', '161ebd7d45089b3446ee4e0d86dbcf92', 'Administrator', '1', '2017-05-24 12:02:01', NULL, '1'),
(3, 'sajaj', '161ebd7d45089b3446ee4e0d86dbcf92', 'Sajaj Ajrapus', '1', '2017-01-29 11:35:41', NULL, '1'),
(4, 'sajaj_old', '161ebd7d45089b3446ee4e0d86dbcf92', 'sajas old', NULL, NULL, NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gallery_files`
--

CREATE TABLE `tbl_gallery_files` (
  `img_gallery_id` int(11) NOT NULL,
  `content_id` int(11) DEFAULT NULL,
  `files_name` varchar(255) DEFAULT NULL,
  `file_desc` varchar(255) DEFAULT NULL,
  `upload_date` datetime DEFAULT NULL,
  `upload_by` varchar(75) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_gallery_files`
--

INSERT INTO `tbl_gallery_files` (`img_gallery_id`, `content_id`, `files_name`, `file_desc`, `upload_date`, `upload_by`) VALUES
(1, 117, '054fa8288cda8b2338638e878587cbf4.gif', 'Earth', '2017-05-14 17:24:23', 'Administrator'),
(2, 117, '772018ae3a8fa6151fcc2d4174ac8090.gif', 'Opening Book', '2017-05-14 17:24:23', 'Administrator'),
(3, 117, '0b669fb9df3c71b1eb4486222239af33.gif', 'Purple Bowling', '2017-05-14 17:24:23', 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_items`
--

CREATE TABLE `tbl_items` (
  `itemId` int(11) NOT NULL,
  `itemHeader` varchar(512) NOT NULL COMMENT 'Heading',
  `itemSub` varchar(1021) NOT NULL COMMENT 'sub heading',
  `itemDesc` text COMMENT 'content or description',
  `itemImage` varchar(80) DEFAULT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `createdBy` int(11) NOT NULL,
  `createdDtm` datetime NOT NULL,
  `updatedDtm` datetime DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_items`
--

INSERT INTO `tbl_items` (`itemId`, `itemHeader`, `itemSub`, `itemDesc`, `itemImage`, `isDeleted`, `createdBy`, `createdDtm`, `updatedDtm`, `updatedBy`) VALUES
(1, 'jquery.validation.js', 'Contribution towards jquery.validation.js', 'jquery.validation.js is the client side javascript validation library authored by Jörn Zaefferer hosted on github for us and we are trying to contribute to it. Working on localization now', 'validation.png', 0, 1, '2015-09-02 00:00:00', NULL, NULL),
(2, 'CodeIgniter User Management', 'Demo for user management system', 'This the demo of User Management System (Admin Panel) using CodeIgniter PHP MVC Framework and AdminLTE bootstrap theme. You can download the code from the repository or forked it to contribute. Usage and installation instructions are provided in ReadMe.MD', 'cias.png', 0, 1, '2015-09-02 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reset_password`
--

CREATE TABLE `tbl_reset_password` (
  `id` bigint(20) NOT NULL,
  `email` varchar(128) NOT NULL,
  `activation_id` varchar(32) NOT NULL,
  `agent` varchar(512) NOT NULL,
  `client_ip` varchar(32) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `createdBy` bigint(20) NOT NULL DEFAULT '1',
  `createdDtm` datetime NOT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedDtm` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `roleId` tinyint(4) NOT NULL COMMENT 'role id',
  `role` varchar(50) NOT NULL COMMENT 'role text'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_roles`
--

INSERT INTO `tbl_roles` (`roleId`, `role`) VALUES
(1, 'System Administrator'),
(2, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `userId` int(11) NOT NULL,
  `email` varchar(128) NOT NULL COMMENT 'login email',
  `password` varchar(128) NOT NULL COMMENT 'hashed login password',
  `name` varchar(128) DEFAULT NULL COMMENT 'full name of user',
  `mobile` varchar(20) DEFAULT NULL,
  `roleId` tinyint(4) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `createdBy` int(11) NOT NULL,
  `createdDtm` datetime NOT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `updatedDtm` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`userId`, `email`, `password`, `name`, `mobile`, `roleId`, `isDeleted`, `createdBy`, `createdDtm`, `updatedBy`, `updatedDtm`) VALUES
(1, 'admin@admin.com', '$2y$10$6OGhRlxBMPWKHRA49h99heqn72bttY0FjUDlUnHRBGUYMmZuG9Z/.', 'System Administrator', '9890098900', 1, 0, 0, '2015-07-01 18:56:49', 1, '2017-09-11 04:05:48'),
(2, 'manager@oncom.com', '$2y$10$lFA.4eDfW.30eSqBZK2glul/SBeryWv2XdauCoH8zZAOlDQ/B3YEi', 'Manager Tea Sari Wangi', '9890098900', 2, 0, 1, '2016-12-09 17:49:56', 1, '2017-05-27 11:09:10'),
(3, 'employee@codeinsect.com', '$2y$10$M3ttjnzOV2lZSigBtP0NxuCtKRte70nc8TY5vIczYAQvfG/8syRze', 'Employee', '9890098900', 3, 1, 1, '2016-12-09 17:50:22', 1, '2017-06-03 10:18:28'),
(4, 'jaja.suparja@mail.com', '$2y$10$8kdNoQIyz013gwAWbcJMuOfQbDcHR1ZxD1HvhRxQOdhP89M1tCeku', 'Jaja Suparja', '0812858511', 2, 1, 1, '2017-05-25 13:14:37', 1, '2017-05-25 13:50:15'),
(5, 'email@email.com', '$2y$10$VhXZFedR4rApnMFktinQ9u/e1.Beom64gAMnEQ.OKCLX.3e4Y3.hG', 'User 1', '8988989898', 2, 0, 1, '2017-05-25 13:51:07', NULL, NULL),
(6, 'email@email.com', '$2y$10$b75tToGymHTZsUKLRuHjG.mia3XEg59uqcoJM8Furrl.m9i36kzI6', 'User 2', 'dsfdsfdsfd', 3, 1, 1, '2017-05-25 13:51:24', 1, '2017-06-03 10:18:39'),
(7, 'email@email.co.id', '$2y$10$.6wLKODYarA/H/JLC50Nue6kwz7uYK8g8OiD2KiLfgxHz0m/qbIPy', 'Fsdfdsfa', '0812858511', 2, 1, 1, '2017-05-25 13:58:23', 1, '2017-05-27 11:07:40'),
(8, 'email@email.com', '$2y$10$t8FZmcF.q9mivcwhHkQYIuK/pQX4lxmfWiYXoJ6NlwdyRTPlsMOJW', 'Jaja Suparja', '0812858511', 2, 1, 1, '2017-05-25 13:58:38', 1, '2017-06-03 10:19:08'),
(9, 'dayan_dominic@live.com', '$2y$10$shnM98Gb95Thdb1xPdSN4OVJgRFxHODCH40w0mGOqc2j1sjPhrTde', 'Muhammad Dayan Alim Chandra', '0857119526', 1, 0, 1, '2017-06-05 03:25:10', NULL, NULL),
(10, 'usertest@gmail.com', '$2y$10$AQlcLfUmw27umvZLOf7Rhu/CRae7mC0mqVxvb5fwnZUDVIXl6mMMq', 'Chandradayan', '0123456789', 2, 1, 1, '2017-06-05 04:46:05', 1, '2017-06-05 07:05:31'),
(11, 'Johnbrewster@mail.com', '$2y$10$i5g/CY7k9hWzndIpAMymAeuStqqLFTfZjerL2khS8xKR0EINIarIu', 'John Philips', '0887263775', 1, 1, 1, '2017-06-06 03:54:58', 1, '2017-06-06 04:13:02'),
(12, 'zsazsa259@gmail.com', '$2y$10$yZQw423U2qw7rRt7/JZj6eXP7NUkYaM3FmCN1f3y6Iptp02cqlimW', 'Zsazsa Novia', '0899074265', 1, 0, 1, '2017-10-05 03:30:33', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sosmed`
--
ALTER TABLE `sosmed`
  ADD PRIMARY KEY (`sosmed_id`);

--
-- Indexes for table `sys_admin_menu`
--
ALTER TABLE `sys_admin_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `sys_admin_menu_copy`
--
ALTER TABLE `sys_admin_menu_copy`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `sys_fe_content`
--
ALTER TABLE `sys_fe_content`
  ADD PRIMARY KEY (`fe_content_id`);

--
-- Indexes for table `sys_fe_content_full_ver`
--
ALTER TABLE `sys_fe_content_full_ver`
  ADD PRIMARY KEY (`fe_content_id`);

--
-- Indexes for table `sys_fe_headline`
--
ALTER TABLE `sys_fe_headline`
  ADD PRIMARY KEY (`fe_headline_id`);

--
-- Indexes for table `sys_fe_img_slider`
--
ALTER TABLE `sys_fe_img_slider`
  ADD PRIMARY KEY (`fe_img_slider_id`);

--
-- Indexes for table `sys_frontend_menu`
--
ALTER TABLE `sys_frontend_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `sys_icon_menu`
--
ALTER TABLE `sys_icon_menu`
  ADD PRIMARY KEY (`id_icon_menu`);

--
-- Indexes for table `sys_icon_menux`
--
ALTER TABLE `sys_icon_menux`
  ADD PRIMARY KEY (`id_icon_menu`);

--
-- Indexes for table `sys_page_section`
--
ALTER TABLE `sys_page_section`
  ADD PRIMARY KEY (`section_id`);

--
-- Indexes for table `sys_settings`
--
ALTER TABLE `sys_settings`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indexes for table `sys_users`
--
ALTER TABLE `sys_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_gallery_files`
--
ALTER TABLE `tbl_gallery_files`
  ADD PRIMARY KEY (`img_gallery_id`);

--
-- Indexes for table `tbl_items`
--
ALTER TABLE `tbl_items`
  ADD PRIMARY KEY (`itemId`);

--
-- Indexes for table `tbl_reset_password`
--
ALTER TABLE `tbl_reset_password`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`roleId`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sosmed`
--
ALTER TABLE `sosmed`
  MODIFY `sosmed_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sys_admin_menu`
--
ALTER TABLE `sys_admin_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `sys_admin_menu_copy`
--
ALTER TABLE `sys_admin_menu_copy`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `sys_fe_content`
--
ALTER TABLE `sys_fe_content`
  MODIFY `fe_content_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;
--
-- AUTO_INCREMENT for table `sys_fe_content_full_ver`
--
ALTER TABLE `sys_fe_content_full_ver`
  MODIFY `fe_content_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `sys_fe_headline`
--
ALTER TABLE `sys_fe_headline`
  MODIFY `fe_headline_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sys_fe_img_slider`
--
ALTER TABLE `sys_fe_img_slider`
  MODIFY `fe_img_slider_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sys_frontend_menu`
--
ALTER TABLE `sys_frontend_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;
--
-- AUTO_INCREMENT for table `sys_icon_menu`
--
ALTER TABLE `sys_icon_menu`
  MODIFY `id_icon_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=698;
--
-- AUTO_INCREMENT for table `sys_icon_menux`
--
ALTER TABLE `sys_icon_menux`
  MODIFY `id_icon_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=437;
--
-- AUTO_INCREMENT for table `sys_page_section`
--
ALTER TABLE `sys_page_section`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `sys_users`
--
ALTER TABLE `sys_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_gallery_files`
--
ALTER TABLE `tbl_gallery_files`
  MODIFY `img_gallery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_items`
--
ALTER TABLE `tbl_items`
  MODIFY `itemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_reset_password`
--
ALTER TABLE `tbl_reset_password`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `roleId` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'role id', AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
