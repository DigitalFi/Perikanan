-- phpMyAdmin SQL Dump
-- version 4.7.8
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 07 Sep 2018 pada 15.42
-- Versi server: 10.1.24-MariaDB-cll-lve
-- Versi PHP: 7.1.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gobg6395_perikanan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `reff_article_type`
--

CREATE TABLE `reff_article_type` (
  `id_article_type` tinyint(2) NOT NULL,
  `article_type` varchar(15) DEFAULT NULL,
  `create_by` varchar(5) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(5) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `reff_article_type`
--

INSERT INTO `reff_article_type` (`id_article_type`, `article_type`, `create_by`, `create_date`, `update_by`, `update_date`) VALUES
(1, 'Trending', NULL, NULL, NULL, NULL),
(2, 'Logo', NULL, NULL, NULL, NULL),
(3, 'Sosmed', NULL, NULL, NULL, NULL),
(4, 'Image slider', NULL, NULL, NULL, NULL),
(5, 'Galery ', NULL, NULL, NULL, NULL),
(6, 'News', NULL, NULL, NULL, NULL),
(7, 'Most Popular', NULL, NULL, NULL, NULL),
(8, 'Berita terbaru', NULL, NULL, NULL, NULL),
(9, 'Footer', NULL, NULL, NULL, NULL),
(10, 'Copyright ', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `reff_file_type`
--

CREATE TABLE `reff_file_type` (
  `id_file_type` tinyint(2) NOT NULL,
  `file_type` varchar(15) DEFAULT NULL,
  `create_by` varchar(5) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(5) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `reff_file_type`
--

INSERT INTO `reff_file_type` (`id_file_type`, `file_type`, `create_by`, `create_date`, `update_by`, `update_date`) VALUES
(1, 'Image', '01', '2018-08-09 00:57:16', NULL, NULL),
(2, 'Video', '01', '2018-08-09 00:57:40', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `reff_kecamatan`
--

CREATE TABLE `reff_kecamatan` (
  `id_kecamatan` smallint(11) NOT NULL,
  `nm_kecamatan` varchar(45) DEFAULT NULL,
  `create_by` varchar(5) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(5) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `reff_kecamatan`
--

INSERT INTO `reff_kecamatan` (`id_kecamatan`, `nm_kecamatan`, `create_by`, `create_date`, `update_by`, `update_date`) VALUES
(1, 'Beji', '22', '2018-08-22 16:33:36', NULL, NULL),
(2, 'Bojong Sari', '22', '2018-08-22 16:33:36', NULL, NULL),
(3, 'Cilodong', '22', '2018-08-22 16:33:36', NULL, NULL),
(4, 'Cimanggis', '22', '2018-08-22 16:33:36', NULL, NULL),
(5, 'Cinere', '22', '2018-08-22 16:33:36', NULL, NULL),
(6, 'Cipayung', '22', '2018-08-22 16:33:36', NULL, NULL),
(7, 'Limo', '22', '2018-08-22 16:33:36', NULL, NULL),
(8, 'Pancoran Mas', '22', '2018-08-22 16:33:36', NULL, NULL),
(9, 'Sawangan', '22', '2018-08-22 16:33:36', NULL, NULL),
(10, 'Sukma Jaya', '22', '2018-08-22 16:33:36', NULL, NULL),
(11, 'Tapos', '22', '2018-08-22 16:33:36', NULL, NULL),
(99, 'Umum', '22', '2018-08-22 16:33:36', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `reff_template`
--

CREATE TABLE `reff_template` (
  `id_template` smallint(11) NOT NULL,
  `nm_template` varchar(45) DEFAULT NULL,
  `parent_id_template` smallint(11) DEFAULT NULL,
  `refer_to` smallint(11) DEFAULT NULL,
  `syntax_template` text,
  `syntax_detail` text,
  `syntax_detail2` text,
  `is_active` varchar(1) DEFAULT NULL,
  `create_by` varchar(5) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(5) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `reff_template`
--

INSERT INTO `reff_template` (`id_template`, `nm_template`, `parent_id_template`, `refer_to`, `syntax_template`, `syntax_detail`, `syntax_detail2`, `is_active`, `create_by`, `create_date`, `update_by`, `update_date`) VALUES
(1, 'Trending', 0, NULL, '<div class=\"container-fluid fh5co_header_bg\">\r\n    <div class=\"container\">\r\n        <div class=\"row\">\r\n            [cms_detail]\r\n        </div>\r\n    </div>\r\n</div>', '<div class=\"col-12 fh5co_mediya_center\"><a href=\"[cms_link]\" class=\"color_fff fh5co_mediya_setting\"><i class=\"fa fa-clock-o\"></i>&nbsp;&nbsp;&nbsp;[cms_date]</a>\r\n		<div class=\"d-inline-block fh5co_trading_posotion_relative\"><a href=\"[cms_link]\" class=\"treding_btn\">Trending</a>\r\n				<div class=\"fh5co_treding_position_absolute\"></div>\r\n		</div>\r\n		<a href=\"[cms_link]\" class=\"color_fff fh5co_mediya_setting\">[cms_title]</a>\r\n</div>', NULL, 'Y', NULL, NULL, NULL, NULL),
(2, 'Logo', 0, NULL, '<div class=\"container-fluid\">\r\n    <div class=\"container\">\r\n        <div class=\"row\">\r\n									[cms_detail]\r\n                <div class=\"clearfix\"></div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>', '<div class=\"col-12 col-md-3 fh5co_padding_menu\">\r\n		<img src=\"[cms_image]\" alt=\"img\" class=\"fh5co_logo_width\">\r\n</div>\r\n<div class=\"col-12 col-md-9 align-self-center fh5co_mediya_right\">\r\n		<div class=\"text-center d-inline-block\">\r\n				<a class=\"fh5co_display_table\"><div class=\"fh5co_verticle_middle\"><i class=\"fa fa-search\"></i></div></a>\r\n		</div>\r\n		<div class=\"text-center d-inline-block\">\r\n				<a class=\"fh5co_display_table\"><div class=\"fh5co_verticle_middle\"><i class=\"fa fa-linkedin\"></i></div></a>\r\n		</div>\r\n		<div class=\"text-center d-inline-block\">\r\n				<a class=\"fh5co_display_table\"><div class=\"fh5co_verticle_middle\"><i class=\"fa fa-google-plus\"></i></div></a>\r\n		</div>\r\n		<div class=\"text-center d-inline-block\">\r\n				<a href=\"https://twitter.com/fh5co\" target=\"_blank\" class=\"fh5co_display_table\"><div class=\"fh5co_verticle_middle\"><i class=\"fa fa-twitter\"></i></div></a>\r\n		</div>\r\n		<div class=\"text-center d-inline-block\">\r\n				<a href=\"https://fb.com/fh5co\" target=\"_blank\" class=\"fh5co_display_table\"><div class=\"fh5co_verticle_middle\"><i class=\"fa fa-facebook\"></i></div></a>\r\n		</div>\r\n', NULL, 'Y', NULL, NULL, NULL, NULL),
(3, 'Top Menu', 0, NULL, '<div class=\"container-fluid bg-faded fh5co_padd_mediya padding_786\">\r\n    <div class=\"container padding_786\">\r\n        <nav class=\"navbar navbar-toggleable-md navbar-light \">\r\n            <button class=\"navbar-toggler navbar-toggler-right mt-3\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarSupportedContent\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\"><span class=\"fa fa-bars\"></span></button>\r\n            <a class=\"navbar-brand\" href=\"#\"><img src=\"[cms_logo_mobile]\" alt=\"img\" class=\"mobile_logo_width\"></a>\r\n            <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\r\n                <ul class=\"navbar-nav mr-auto\">\r\n                    [cms_detail]\r\n                </ul>\r\n            </div>\r\n        </nav>\r\n    </div>\r\n</div>', NULL, NULL, 'Y', NULL, NULL, NULL, NULL),
(4, 'Image Slider', 0, NULL, '<div id=\"slider\">\r\n	<div id=\"slide-holder\">\r\n	  	[cms_detail]\r\n	</div>\r\n</div>', '<div class=\"slide\"><img src=\"[cms_image]\" alt=\"\"></div>', NULL, 'Y', NULL, NULL, NULL, NULL),
(5, 'Gallery', 0, NULL, '<div class=\"container-fluid pb-4 pt-5\">\r\n   <div class=\"container animate-box\">\r\n      <div>\r\n         <div class=\"fh5co_heading fh5co_heading_border_bottom py-2 mb-4\">Gallery</div>\r\n      </div>\r\n      <div class=\"owl-carousel owl-theme\" id=\"slider2\">\r\n          [cms_detail]  \r\n      </div>\r\n   </div>\r\n</div>', '<div class=\"item px-2\">\r\n		<div class=\"fh5co_hover_news_img\">\r\n			<div class=\"fh5co_news_img\"><img src=\"[cms_image]\" alt=\"\"/></div>\r\n				<div>\r\n					<a href=\"[cms_link]\" class=\"d-block fh5co_small_post_heading\"><span class=\"\">[cms_title]</span></a>\r\n					<div class=\"c_g\"><i class=\"fa fa-clock-o\"></i>[cms_date]</div>\r\n				</div>\r\n		</div>\r\n</div>', '<div class=\"fh5co_hover_news_img\">\r\n		<div class=\"fh5co_hover_news_img_video_tag_position_relative\">\r\n			 <div class=\"fh5co_news_img\">\r\n					<iframe id=\"video\" width=\"100%\" height=\"200\"\r\n						 src=\"[cms_video_url]\"\r\n						 frameborder=\"0\" allowfullscreen></iframe>\r\n			 </div>\r\n			 <div class=\"fh5co_hover_news_img_video_tag_position_absolute fh5co_hide\">\r\n					<img src=\"[cms_image]\" alt=\"\"/>\r\n			 </div>\r\n			 <div class=\"fh5co_hover_news_img_video_tag_position_absolute_1 fh5co_hide\" id=\"play-video\">\r\n					<div class=\"fh5co_hover_news_img_video_tag_position_absolute_1_play_button_1\">\r\n						 <div class=\"fh5co_hover_news_img_video_tag_position_absolute_1_play_button\">\r\n								<span><i class=\"fa fa-play\"></i></span>\r\n						 </div>\r\n					</div>\r\n			 </div>\r\n		</div>\r\n		<div class=\"pt-2\">\r\n			 <a href=\"[cms_link]\" class=\"d-block fh5co_small_post_heading\">\r\n			 <span class=\"\">[cms_title]</span></a>\r\n			 <div class=\"c_g\"><i class=\"fa fa-clock-o\"></i> [cms_date]</div>\r\n		</div>\r\n</div>', 'Y', NULL, NULL, NULL, NULL),
(6, 'News', 0, NULL, '<div class=\"container-fluid pb-4 pt-4 paddding\">\r\n   <div class=\"container paddding\">\r\n      <div class=\"row mx-0\">\r\n				<div class=\"col-md-8 animate-box\" data-animate-effect=\"fadeInLeft\">\r\n						<div>\r\n               <div class=\"fh5co_heading fh5co_heading_border_bottom py-2 mb-4\">News</div>\r\n            </div>\r\n						[cms_news]\r\n				</div>\r\n				<div class=\"col-md-3 animate-box\" data-animate-effect=\"fadeInRight\">\r\n						<div>\r\n               <div class=\"fh5co_heading fh5co_heading_border_bottom py-2 mb-4\">Most Popular</div>\r\n            </div>\r\n						[cms_most_popular]\r\n				</div>\r\n      </div>\r\n      <!--paging-->\r\n      <div class=\"row mx-0 animate-box\" data-animate-effect=\"fadeInUp\">\r\n         <div class=\"col-12 text-center pb-4 pt-4\">\r\n            <a href=\"#\" class=\"btn_mange_pagging\"><i class=\"fa fa-long-arrow-left\"></i>&nbsp;&nbsp; Previous</a>\r\n            <a href=\"#\" class=\"btn_pagging\">1</a>\r\n            <a href=\"#\" class=\"btn_pagging\">2</a>\r\n            <a href=\"#\" class=\"btn_pagging\">3</a>\r\n            <a href=\"#\" class=\"btn_pagging\">...</a>\r\n            <a href=\"#\" class=\"btn_mange_pagging\">Next <i class=\"fa fa-long-arrow-right\"></i>&nbsp;&nbsp; </a>\r\n         </div>\r\n      </div>\r\n      <!--paging-->\r\n   </div>\r\n</div>', '<div class=\"row pb-4\">\r\n		<div class=\"col-md-5\">\r\n				<div class=\"fh5co_hover_news_img\">\r\n						<div class=\"fh5co_news_img\"><img src=\"[cms_image]\" alt=\"\"/></div>\r\n						<div></div>\r\n				</div>\r\n		</div>\r\n		<div class=\"col-md-7 animate-box\">\r\n				<a href=\"[cms_link]\" class=\"\" style=\"font-size:20px;font-weight:bold;color:#6d1204;\"> [cms_title] </a></br> <a href=\"[cms_link]\" class=\"fh5co_mini_time py-3\" style=\"font-style:italic;font-size:11px;\">[cms_creator] -\r\n				[cms_date]</a>\r\n				<div class=\"fh5co_consectetur\"> \r\n						[cms_content]\r\n				</div>\r\n		</div>\r\n</div>', '<div class=\"row pb-3\">\r\n			<div class=\"col-5 align-self-center\">\r\n					<img src=\"[cms_image]\" alt=\"img\" class=\"fh5co_most_trading\"/>\r\n			</div>\r\n			<div class=\"col-7 paddding\">\r\n					<div class=\"most_fh5co_treding_font\" >[cms_title]</div>\r\n					<div class=\"most_fh5co_treding_font_123\"> [cms_date]</div>\r\n			</div>\r\n</div>', 'Y', NULL, NULL, NULL, NULL),
(7, 'Most Popular', 0, NULL, '<div>\r\n      <div class=\"fh5co_heading fh5co_heading_border_bottom pt-3 py-2 mb-4\">Most Popular</div>\r\n </div>\r\n<div class=\"row pb-3\">\r\n		<div class=\"col-5 align-self-center\">\r\n				<img src=\"assets/images/image19.jpg\" alt=\"img\" class=\"fh5co_most_trading\">\r\n		</div>\r\n		<div class=\"col-7 paddding\">\r\n				<div class=\"most_fh5co_treding_font\">Edukasi siswa SMA tentang budidaya ikan Lele</div>\r\n				<div class=\"most_fh5co_treding_font_123\"> April 18, 2016</div>\r\n		</div>\r\n</div>', NULL, NULL, 'Y', NULL, NULL, NULL, NULL),
(8, 'Footer', 0, NULL, '<div class=\"container-fluid fh5co_footer_bg pb-3\">\r\n    <div class=\"container animate-box fadeInUp animated-fast\">\r\n        <div class=\"row\">\r\n            <div class=\"col-12 spdp_right py-5\"><img src=\"assets/images/logodepok.png\" alt=\"img\" class=\"footer_logo\"></div>\r\n            <div class=\"clearfix\"></div>\r\n            <div class=\"col-12 col-md-3\">\r\n                <div class=\"footer_main_title py-3\"> About</div>\r\n                <div class=\"footer_sub_about pb-3\"> Website Dinas Perikanan Pemerintah Kota Depok, Jawa Barat\r\n                </div>\r\n                <div class=\"footer_mediya_icon\">\r\n                    <div class=\"text-center d-inline-block\"><a class=\"fh5co_display_table_footer\">\r\n                        <div class=\"fh5co_verticle_middle\"><i class=\"fa fa-linkedin\"></i></div>\r\n                    </a></div>\r\n                    <div class=\"text-center d-inline-block\"><a class=\"fh5co_display_table_footer\">\r\n                        <div class=\"fh5co_verticle_middle\"><i class=\"fa fa-google-plus\"></i></div>\r\n                    </a></div>\r\n                    <div class=\"text-center d-inline-block\"><a class=\"fh5co_display_table_footer\">\r\n                        <div class=\"fh5co_verticle_middle\"><i class=\"fa fa-twitter\"></i></div>\r\n                    </a></div>\r\n                    <div class=\"text-center d-inline-block\"><a class=\"fh5co_display_table_footer\">\r\n                        <div class=\"fh5co_verticle_middle\"><i class=\"fa fa-facebook\"></i></div>\r\n                    </a></div>\r\n                </div>\r\n            </div>\r\n            <div class=\"col-12 col-md-3 \">\r\n                <div class=\"footer_main_title py-3\"> Kategori Ikan</div>\r\n                <ul class=\"footer_menu\">\r\n                    <li><a href=\"#\" class=\"\"><i class=\"fa fa-angle-right\"></i>&nbsp;&nbsp; Budidaya Ikan Hias</a></li>\r\n                    <li><a href=\"#\" class=\"\"><i class=\"fa fa-angle-right\"></i>&nbsp;&nbsp; Budidaya Ikan Konsumsi</a></li>\r\n                </ul>\r\n            </div>\r\n            <div class=\"col-12 col-md-3 position_footer_relative\">\r\n                <div class=\"footer_main_title py-3\"> Contact Us</div>\r\n                <div class=\"footer_makes_sub_font\"> Lokasi</div>\r\n                <a href=\"#\" class=\"footer_post pb-4\"> Jl. Margonda Raya No.144, Depok Jaya, Pancoran MAS, Kota Depok, Jawa Barat </a>\r\n                <div class=\"footer_makes_sub_font\">Telpon</div>\r\n                <a href=\"#\" class=\"footer_post pb-4\"> (021) 7752737 </a>\r\n                <div class=\"footer_makes_sub_font\"> Website </div>\r\n                <a href=\"#\" class=\"footer_post pb-4\"> www.perikanan.depok.go.id </a>\r\n                <div class=\"footer_position_absolute\"><img src=\"assets/images/footer_sub_tipik.png\" alt=\"img\" class=\"width_footer_sub_img\"></div>\r\n            </div>\r\n\r\n        </div>\r\n\r\n    </div>\r\n</div>', NULL, NULL, 'N', NULL, NULL, NULL, NULL),
(9, 'Detail News', 0, NULL, '<div id=\"fh5co-title-box\" style=\"background-image: url([cms_image]); background-position: 50% 0.5px;\" data-stellar-background-ratio=\"0.5\">\r\n    <div class=\"overlay\"></div>\r\n    <div class=\"page-title\">\r\n        <span>[cms_date]</span>\r\n        <h2>[cms_title]</h2>\r\n    </div>\r\n</div>\r\n<div id=\"fh5co-single-content\" class=\"container-fluid pb-4 pt-4 paddding\">\r\n    <div class=\"container paddding\">\r\n        <div class=\"row mx-0\">\r\n            <div class=\"col-md-8 animate-box\" data-animate-effect=\"fadeInLeft\">\r\n								[cms_content]\r\n            </div>\r\n\r\n        </div>\r\n    </div>\r\n</div>', NULL, NULL, 'Y', NULL, NULL, NULL, NULL),
(10, 'Detail Gallery', 0, NULL, '<div id=\"fh5co-title-box\" style=\"background-image: url([cms_image]); background-position: 50% 0.5px;\" data-stellar-background-ratio=\"0.5\">\r\n    <div class=\"overlay\"></div>\r\n    <div class=\"page-title\">\r\n        <span>[cms_date]</span>\r\n        <h2>[cms_title]</h2>\r\n    </div>\r\n</div>\r\n<div id=\"fh5co-single-content\" class=\"container-fluid pb-4 pt-4 paddding\">\r\n    <div class=\"container paddding\">\r\n        <div class=\"row mx-0\">\r\n            <div class=\"col-md-8 animate-box\" data-animate-effect=\"fadeInLeft\">\r\n                <p>\r\n\r\n                </p>\r\n\r\n            </div>\r\n\r\n        </div>\r\n    </div>\r\n</div>', NULL, NULL, 'Y', NULL, NULL, NULL, NULL),
(11, 'Kategory Ikan Hias', 0, NULL, '<div class=\"container-fluid pt-3\">\r\n    <div class=\"container animate-box\" data-animate-effect=\"fadeIn\">\r\n        <div>\r\n            <div class=\"fh5co_heading fh5co_heading_border_bottom py-2 mb-4\">[section_title]</div>\r\n        </div>\r\n        <div class=\"owl-carousel owl-theme js\" id=\"slider1\">\r\n            [cms_detail]\r\n        </div>\r\n    </div>\r\n</div>', '<div class=\"item px-2\">\r\n		<div class=\"fh5co_latest_trading_img_position_relative\">\r\n				<div class=\"fh5co_latest_trading_img\"><img src=\"[cms_image]\" alt=\"\" class=\"fh5co_img_special_relative\"/></div>\r\n				 <div class=\"fh5co_latest_trading_img_position_absolute\"></div>\r\n				<div class=\"fh5co_latest_trading_img_position_absolute_1\">\r\n						<a href=\"[cms_link]\" class=\"text-white\"> [cms_title]</a>\r\n				</div>\r\n		</div>\r\n</div>', NULL, 'Y', NULL, NULL, NULL, NULL),
(12, 'Kategory Ikan Konsumsi', 0, NULL, '<div class=\"container-fluid pt-3\">\r\n    <div class=\"container animate-box\" data-animate-effect=\"fadeIn\">\r\n        <div>\r\n            <div class=\"fh5co_heading fh5co_heading_border_bottom py-2 mb-4\">[section_title]</div>\r\n        </div>\r\n        <div class=\"owl-carousel owl-theme js\" id=\"slider1\">\r\n            [cms_detail]\r\n        </div>\r\n    </div>\r\n</div>', '<div class=\"item px-2\">\r\n		<div class=\"fh5co_latest_trading_img_position_relative\">\r\n				<div class=\"fh5co_latest_trading_img\"><img src=\"[cms_image]\" alt=\"\" class=\"fh5co_img_special_relative\"/></div>\r\n				 <div class=\"fh5co_latest_trading_img_position_absolute\"></div>\r\n				<div class=\"fh5co_latest_trading_img_position_absolute_1\">\r\n						<a href=\"[cms_link]\" class=\"text-white\"> [cms_title]</a>\r\n				</div>\r\n		</div>\r\n</div>', NULL, 'Y', NULL, NULL, NULL, NULL),
(13, 'Single News', 0, NULL, '<div class=\"container-fluid pb-4 pt-5\">\r\n    <div class=\"container paddding\">\r\n        <div class=\"row mx-0\">\r\n            <div class=\"col-md-8 animate-box\" data-animate-effect=\"fadeInLeft\">\r\n                <div>\r\n                    <div class=\"fh5co_heading fh5co_heading_border_bottom py-2 mb-4\">Berdasarkan Kecamatan</div>\r\n                </div>\r\n                [cms_detail]\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>', '<div class=\"row pb-4\">\r\n		<div class=\"col-md-5\">\r\n				<div class=\"fh5co_hover_news_img\">\r\n						<div class=\"fh5co_news_img\"><img src=\"[cms_image]\" alt=\"\"/></div>\r\n						<div></div>\r\n				</div>\r\n		</div>\r\n		<div class=\"col-md-7 animate-box\">\r\n				<a href=\"#\" class=\"fh5co_magna py-2\"> [cms_title]</a>\r\n				<div class=\"fh5co_consectetur\"> [cms_content]\r\n				</div>\r\n		</div>\r\n</div>', NULL, 'Y', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sys_admin_menu`
--

CREATE TABLE `sys_admin_menu` (
  `id_menu` int(11) NOT NULL,
  `menu_label` varchar(75) DEFAULT NULL,
  `is_grp_hdr` varchar(1) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` varchar(1) DEFAULT NULL,
  `sort_order` smallint(3) DEFAULT NULL,
  `link_menu` varchar(255) DEFAULT NULL,
  `icon_menu` varchar(25) DEFAULT NULL,
  `menu_spec` varchar(5) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sys_admin_menu`
--

INSERT INTO `sys_admin_menu` (`id_menu`, `menu_label`, `is_grp_hdr`, `parent_id`, `is_active`, `sort_order`, `link_menu`, `icon_menu`, `menu_spec`) VALUES
(1, 'Home', 'Y', 0, 'Y', 1, 'admpage', 'home', '1,2'),
(2, 'Article', 'Y', 0, 'Y', 2, '#', 'bookmark', '1'),
(3, 'Manage Article', 'N', 2, 'Y', 1, 'admpage/article', 'edit', '1'),
(4, 'User Management', 'Y', 0, 'Y', 5, 'reff/list_data/bentuk', 'users', '1'),
(28, 'User Role', 'N', 4, 'Y', 1, NULL, 'random', '1,2'),
(6, 'User Registration', 'N', 4, 'Y', 2, 'koperasi', 'user', '1,2'),
(30, 'Page', 'Y', 0, 'Y', 3, '#', 'book', '1,2'),
(31, 'Page Management', 'N', 30, 'Y', 1, 'admpage/page', 'page', '1,2'),
(32, 'Menu Management', 'Y', 0, 'Y', 5, '#', 'bars', '1,2'),
(33, 'Website Menu Setting', 'N', 32, 'Y', 4, 'admpage/front_menu', 'map-o', '1,2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sys_front_menu`
--

CREATE TABLE `sys_front_menu` (
  `id_menu` int(11) NOT NULL,
  `menu_label` varchar(75) DEFAULT NULL,
  `additional_info` varchar(75) DEFAULT NULL,
  `is_grp_hdr` varchar(1) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` varchar(1) DEFAULT NULL,
  `sort_order` smallint(3) DEFAULT NULL,
  `link_menu` varchar(255) DEFAULT NULL,
  `id_pages` tinyint(4) DEFAULT NULL,
  `icon_menu` varchar(25) DEFAULT NULL,
  `menu_spec` varchar(5) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sys_front_menu`
--

INSERT INTO `sys_front_menu` (`id_menu`, `menu_label`, `additional_info`, `is_grp_hdr`, `parent_id`, `is_active`, `sort_order`, `link_menu`, `id_pages`, `icon_menu`, `menu_spec`) VALUES
(1, 'Home', NULL, 'Y', 0, 'Y', 1, '#', NULL, 'bar-chart-o', '1,2'),
(2, 'Kategori Ikan', NULL, 'Y', 0, 'Y', 2, '#', NULL, 'bookmark', '1'),
(3, 'Budidaya Ikan Hias', NULL, 'N', 2, 'Y', 1, 'detail/menudetail', 46, 'caret-right', '1'),
(4, 'Budidaya Ikan Konsumsi', NULL, 'N', 2, 'Y', 2, 'detail/menudetail', 47, 'caret-right', '1'),
(28, 'Login', NULL, 'Y', 0, 'Y', NULL, NULL, NULL, NULL, NULL),
(6, 'Kecamatan', NULL, 'Y', 0, 'Y', 3, 'koperasi', NULL, 'list-alt', '1,2'),
(7, 'Beji', 'Gallery Ikan di Kecamatan', 'Y', 6, 'Y', 3, 'detail/menudetail', 49, 'users', '1,2'),
(8, 'BojongSari', 'Gallery Ikan di Kecamatan', 'N', 6, 'Y', 1, 'detail/menudetail', 50, 'caret-right', '1,2'),
(9, 'Cilodong', 'Gallery Ikan di Kecamatan', 'N', 6, 'Y', 2, 'detail/menudetail', 51, 'caret-right', '1,2'),
(10, 'Cimanggis', 'Gallery Ikan di Kecamatan', 'N', 6, 'Y', 3, 'detail/menudetail', 52, 'share-square-o', '1,2'),
(11, 'Cinere', 'Gallery Ikan di Kecamatan', 'N', 6, 'Y', 4, 'detail/menudetail', 53, 'caret-right', '1'),
(12, 'Cipayung', 'Gallery Ikan di Kecamatan', 'N', 6, 'Y', 5, 'detail/menudetail', 54, 'caret-right', '1'),
(13, 'Limo', 'Gallery Ikan di Kecamatan', 'N', 6, 'Y', 6, 'detail/menudetail', NULL, 'caret-right', '1'),
(14, 'Pancoran Mas', 'Gallery Ikan di Kecamatan', 'N', 6, 'Y', 7, 'detail/menudetail', 55, 'caret-right', '1'),
(15, 'Sawangan', 'Gallery Ikan di Kecamatan', 'N', 6, 'Y', 8, 'detail/menudetail', 56, 'caret-right', '1'),
(19, 'Sukmajaya', 'Gallery Ikan di Kecamatan', 'N', 6, 'Y', 1, 'dashboard', NULL, 'caret-right', '2'),
(16, 'Tapos', 'Gallery Ikan di Kecamatan', 'N', 6, 'Y', 1, 'detail/menudetail', 57, 'caret-right', '1'),
(17, 'About Us', NULL, 'Y', 0, 'Y', 2, 'koperasi', NULL, 'caret-right', '1,2'),
(18, 'Contact', NULL, 'Y', 0, 'Y', 9, 'reff/list_data/jabatan', NULL, 'caret-right', '1'),
(29, 'Login', NULL, 'Y', 0, 'Y', 5, 'login', NULL, NULL, '1,2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sys_menu_role`
--

CREATE TABLE `sys_menu_role` (
  `id_user_role` int(11) NOT NULL,
  `roles_id` int(11) DEFAULT NULL,
  `id_menu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sys_menu_role`
--

INSERT INTO `sys_menu_role` (`id_user_role`, `roles_id`, `id_menu`) VALUES
(86, 23, 5),
(87, 23, 2),
(88, 23, 14),
(89, 24, 1),
(90, 24, 2),
(114, 15, 4),
(116, 1, 4),
(117, 22, 1),
(118, 22, 2),
(119, 22, 3),
(120, 22, 4),
(121, 22, 5),
(122, 22, 6),
(123, 35, 1),
(124, 35, 2),
(125, 35, 3),
(126, 35, 4),
(127, 35, 5),
(128, 35, 6),
(129, 35, 7),
(130, 35, 8),
(131, 35, 9),
(132, 35, 10),
(133, 35, 11),
(134, 35, 12),
(135, 35, 13),
(136, 35, 14),
(137, 35, 15),
(138, 35, 19),
(139, 35, 16),
(140, 35, 17),
(141, 35, 18),
(142, 35, 21),
(143, 35, 20),
(144, 35, 22),
(145, 35, 23),
(146, 35, 24),
(147, 35, 25),
(148, 35, 26),
(149, 35, 27),
(151, 21, 4),
(152, 22, 32),
(153, 22, 33);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sys_roles`
--

CREATE TABLE `sys_roles` (
  `roles_id` tinyint(5) NOT NULL,
  `roles_name` varchar(35) NOT NULL,
  `roles_desc` varchar(128) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(40) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sys_roles`
--

INSERT INTO `sys_roles` (`roles_id`, `roles_name`, `roles_desc`, `create_date`, `create_by`, `update_date`, `update_by`) VALUES
(1, 'Admin Kecamatan (Apps)', 'for apps only', '2018-04-14 08:54:49', NULL, '2018-07-16 13:18:52', 'Reza Saputra'),
(15, 'Admin Pemerintah kota (Apps)', 'for apps only', '2017-12-20 10:45:21', 'Jaja Suparja', '2018-07-16 13:07:19', 'Reza Saputra'),
(21, 'Pelaksana Pokja (Apps)', 'for apps only', '2017-12-24 09:12:06', 'Jaja Suparja', '2018-07-16 13:22:16', 'Reza Saputra'),
(22, 'Admin Web', 'Admin for web', '2017-12-24 20:39:16', 'Jaja Suparja', '2018-07-16 13:19:44', 'Reza Saputra'),
(35, 'Supper Admin Web', 'Full Access', '2018-04-04 00:42:04', 'Jaja Suparja', '2018-07-16 13:21:23', 'Reza Saputra');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sys_settings`
--

CREATE TABLE `sys_settings` (
  `id_setting` varchar(3) NOT NULL DEFAULT '',
  `value_setting` varchar(125) DEFAULT NULL,
  `desc_setting` varchar(125) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sys_settings`
--

INSERT INTO `sys_settings` (`id_setting`, `value_setting`, `desc_setting`) VALUES
('001', 'Dinas Perikanan  Kota Depok-Admin Menu', 'Web tittle'),
('004', '10', 'Jumlah data per paging'),
('002', 'Dinas Perikanan Pemerintah Kota Depok', 'System Name'),
('003', '3276', 'Digit ID Prov + ID kabupaten'),
('005', '32', 'ID Prov'),
('006', '76', 'ID Kab'),
('008', '1', 'Menu Simkop'),
('009', '2', 'Menu Pokja');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sys_users`
--

CREATE TABLE `sys_users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(128) DEFAULT NULL COMMENT 'login email',
  `user_name` varchar(35) DEFAULT NULL COMMENT 'full name of user',
  `pwd` varchar(128) DEFAULT NULL COMMENT 'hashed login password',
  `full_name` varchar(45) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `roles_id` tinyint(4) DEFAULT NULL,
  `id_kecamatan` int(11) DEFAULT NULL,
  `id_kelurahan` int(11) DEFAULT NULL,
  `isdeleted` tinyint(4) DEFAULT '0',
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sys_users`
--

INSERT INTO `sys_users` (`user_id`, `email`, `user_name`, `pwd`, `full_name`, `mobile`, `roles_id`, `id_kecamatan`, `id_kelurahan`, `isdeleted`, `create_by`, `create_date`, `update_by`, `update_date`) VALUES
(21, 'wiwipokja@gmail.com', 'WiwiWirahmi', 'cHJKdXcyT0h5K1BLTERzSXI3dW9QZz09', 'Wiwi Wirahmi', NULL, 1, 10, 20, 0, NULL, '2017-12-24 20:33:04', NULL, NULL),
(22, 'superadmin@gmail.com', 'superadmin@gmail.com', 'UjcycTI5MDBadHVXSFNPQ2hUV2pvQT09', 'superadmin', NULL, 21, 10, 20, 0, NULL, '2017-12-24 21:01:59', NULL, NULL),
(23, 'cucurokayah@gmail.com', 'cucurokayah', 'MmllcG5kTGU1Y05YeXNOSHpGSGN5dz09', 'Cucu Rokayah', NULL, 1, 5, 0, 0, 17, '2018-07-16 01:09:51', 20, '2018-07-16 14:46:42'),
(24, 'eviherawati@gmail.com', 'eviherawati', 'TUxLUzV2clpVakFjRUNWVjh1UzlVUT09', 'Evi Herawati', NULL, 35, 0, 0, 0, 20, '2018-07-16 13:24:34', NULL, NULL),
(25, 'kuntorodarmayanto@gmail.com', 'kuntorodarmayanto', 'VGpFZkNwS3pYTFlhdS9pVSt1aEtEQT09', 'Kuntoro Darmayanto', NULL, 21, 5, 0, 0, 20, '2018-07-16 14:06:23', NULL, NULL),
(27, 'sriatun@gmail.com', 'sriatun', 'VTV5RGdLUXYzSE5peFdSZ0paZU9yQT09', 'Sri Atun', NULL, 21, 5, 0, 0, 20, '2018-07-16 14:07:55', NULL, NULL),
(28, 'iwan@gmail.com', 'iwan', 'QWNUaEljZVlsSkUzOUJySmpGaTdSUT09', 'Drs H Iwan Mm', NULL, 1, 6, 0, 0, 20, '2018-07-16 14:10:14', NULL, NULL),
(29, 'mimiumiarsih@gmail.com', 'mimiumiarsih', 'REYyMWJ5ajdvYlVQd244M3NmQ1lZUT09', 'Mimi Umiarsih', NULL, 21, 6, 0, 0, 20, '2018-07-16 14:12:25', NULL, NULL),
(30, 'srisawanih@gmail.com', 'srisawanih', 'RjQ2SXNRbXpkdVBQVFJ6ejNrdXlKUT09', 'Sri Sawanih', NULL, 1, 8, 0, 0, 20, '2018-07-16 14:13:36', NULL, NULL),
(31, 'mawardi@gmail.com', 'mawardi', 'NDhkT2xHS0JJdWw5enIvWktIdU1FZz09', 'M Mawardi SH', NULL, 21, 8, 0, 0, 20, '2018-07-16 14:14:40', NULL, NULL),
(32, 'cecephidayat@gmail.com', 'cecephidayat', 'clBEbCtpaG1jY1NKbkVDVURXS1pKUT09', 'Cecep Hidayat', NULL, 21, 8, 0, 0, 20, '2018-07-16 14:15:49', NULL, NULL),
(33, 'dedehsopiah@gmail.com', 'dedehsopiah', 'bEwwMmp2YkJJTDZoSmxWeWl0VUZpdz09', 'Dedeh Sopiah', NULL, 1, 2, 0, 0, 20, '2018-07-16 14:17:12', NULL, NULL),
(34, 'supardi@gmail.com', 'supardi', 'R2xsYjBmc1ZJckVuODhlWHBQSkZTZz09', 'Supardi', NULL, 21, 2, 0, 0, 20, '2018-07-16 14:18:15', NULL, NULL),
(35, 'maryumis@gmail.com', 'maryumis', 'RWJGRzd5ZGtNenRScVd3cDBIWUc5dz09', 'Maryumis', NULL, 21, 2, 0, 0, 20, '2018-07-16 14:19:25', NULL, NULL),
(36, 'suprihatin@gmail.com', 'suprihatin', 'K0swNHNMSWZVUlF3cFNPelNScHVDdz09', 'Suprihatin', NULL, 1, 10, 0, 0, 20, '2018-07-16 14:20:37', NULL, NULL),
(37, 'manginar@gmail.com', 'manginar', 'VEJGMFUzSUdBM2hVSkZBRlQ4VTlSdz09', 'Manginar H', NULL, 21, 10, 4, 0, 20, '2018-07-16 14:21:47', NULL, NULL),
(38, 'rojalih@gmail.com', 'rojalih', 'RWZod1IxUnRrL1J5ek55R2Mxcm8ydz09', 'Rojalih', NULL, 21, 10, 6, 0, 20, '2018-07-16 14:23:12', NULL, NULL),
(39, 'abdulloh@gmail.com', 'abdulloh', 'R1hDYkhOVXVocmtkWkxLd1JYeG1odz09', 'Abdulloh', NULL, 1, 4, 0, 0, 20, '2018-07-16 14:24:13', NULL, NULL),
(40, 'yantirachmayanti@gmail.com', 'yantirachmayanti', 'QXhPakUxS3Z5c21hMU4vRTBkeGRiZz09', 'Yanti Rachmayanti', NULL, 21, 4, 0, 0, 20, '2018-07-16 14:25:06', NULL, NULL),
(41, 'sriwahyuti@gmail.com', 'sriwahyuti', 'Sm1PR1luWHlLWUlwV05vWFhKTEhXdz09', 'Sri Wahyuti', NULL, 21, 4, 0, 0, 20, '2018-07-16 14:25:59', NULL, NULL),
(42, 'nyaialiyah@gmail.com', 'nyaialiyah', 'VXRKNVJSenpxTXNxQ1l1SXRzWWlwdz09', 'Nyai Aliyah', NULL, 1, 9, 0, 0, 20, '2018-07-16 14:27:30', NULL, NULL),
(43, 'evachristine@gmail.com', 'evachristine', 'NHlOUFJGOHRqTkZjeVd5VmhsZFFPdz09', 'Eva Christine', NULL, 21, 9, 0, 0, 20, '2018-07-16 14:28:39', NULL, NULL),
(44, 'sitiromlah@gmail.com', 'sitiromlah', 'SXpUVWxjOEpkOURqWHRQd3RKdVRvdz09', 'Siti Romlah', NULL, 21, 9, 0, 0, 20, '2018-07-16 14:30:15', NULL, NULL),
(45, 'sukanda@gmail.com', 'sukanda', 'eG4zQ2MrUzBCaDE3ZWNDaUJ1RW9tQT09', 'Sukanda', NULL, 1, 1, 0, 0, 20, '2018-07-16 14:31:27', NULL, NULL),
(46, 'pemkot@gmail.com', 'pemkot', 'QlVrL1JYY2l4Y0ZkbWp0VEVHa3h4Zz09', 'pemkot', NULL, 21, 1, 0, 0, 20, '2018-07-16 14:32:15', NULL, NULL),
(47, 'endangmartiningsih@gmail.com', 'endangmartiningsih', 'OFh4T0pKQUs3U3B1dVprc3ZHU2EyZz09', 'Endang Martiningsih', NULL, 21, 1, 0, 0, 20, '2018-07-16 14:32:44', NULL, NULL),
(48, 'diahrosmawati@gmail.com', 'diahrosmawati', 'OVRZci9JbFM1Y3VjUDc3OFZ4OTh0UT09', 'Diah Rosmawati', NULL, 15, 0, 0, 0, 20, '2018-07-16 14:59:06', NULL, NULL),
(49, 'suenipokja@gmail.com', 'sueni', 'TDBrcUVkTktaM0dkUXRoQXloY2l5Zz09', 'Sueni', NULL, 21, 5, 3, 0, 22, '2018-07-17 13:58:17', NULL, NULL),
(50, 'yandripokja@gmail.com', 'yandridk', 'bDVUUjJoN1ZsV3J2NXE3c2NFbnhpQT09', 'Yandri DK', NULL, 21, 5, 1, 0, 22, '2018-07-17 14:01:00', NULL, NULL),
(51, 'yuyunpokja@gmail.com', 'yuyunyuliana', 'RlRuSXRHUUVEdlhJVFczNnRUaXBuUT09', 'Yuyun Yuliana', NULL, 21, 5, 5, 0, 22, '2018-07-17 14:02:45', NULL, NULL),
(52, 'etimawarti@gmail.com', 'etimawarti', 'c3lJa1U4MEwyNTYyR3gwYUV1WjJGQT09', 'Eti Marwati', NULL, 21, 5, 10, 0, 22, '2018-07-17 14:05:11', NULL, NULL),
(53, 'pramudya@gmail.com', 'pramudya', 'MzNQby9NMHp1cHJ1WG05VEswTE5GUT09', 'Pramudya', NULL, 21, 6, 1, 0, 22, '2018-07-17 14:16:20', NULL, NULL),
(54, 'sagilalrusdi@gmail.com', 'sagilalrusdi', 'Q3Z5dTB3Y25FUU81N0dxSGJzemtqQT09', 'Sagilal Rusdi', NULL, 21, 6, 2, 0, 22, '2018-07-17 14:20:22', NULL, NULL),
(55, 'nurhayati@gmail.com', 'nurhayati', 'aktFM05oSzhieHNNRVRvSE0zSjRJUT09', 'Nurhayati', NULL, 21, 6, 5, 0, 22, '2018-07-17 14:22:55', NULL, NULL),
(56, 'fujioktaviani@gmail.com', 'fujioktaviani', 'bzdkaU1TWnFUdmhZR0hFRDUvZDZzdz09', 'Fuji Oktaviani', NULL, 21, 6, 3, 0, 22, '2018-07-17 14:25:40', NULL, NULL),
(57, 'niningmardianingsih@gmail.com', 'niningmardianingsih', 'ZUJBNWFhejh0NnlpdDhxT1pOTk5sUT09', 'Nining Mardianingsih', NULL, 21, 6, 4, 0, 22, '2018-07-17 14:31:55', NULL, NULL),
(58, 'yettidarmiyati@gmail.com', 'yettidarmiyati', 'dDc4eVpZdjFjeDI4QmRKUHFvLzFmUT09', 'Yetti Darmiyanti', NULL, 21, 8, 2, 0, 22, '2018-07-17 14:35:08', NULL, NULL),
(59, 'salahudin@gmail.com', 'salahudin', 'RExOSGxHVnd1ZENNMEtON1d6c09Qdz09', 'Salahudin', NULL, 21, 8, 3, 0, 22, '2018-07-17 14:37:13', NULL, NULL),
(60, 'neldapurnadia@gmail.com', 'neldapurnadia', 'Z3I0TDVEZkZBL1Vza05ybXhnc2JHZz09', 'Nelda Purnadia', NULL, 21, 8, 1, 0, 22, '2018-07-17 14:48:00', NULL, NULL),
(61, 'juhardin@gmail.com', 'juhardin ', 'VFR0ZnhvOEFXUUFrUy9wYTVrZzI2Zz09', 'Juhardin ', NULL, 21, 2, 9, 0, 22, '2018-07-17 15:02:25', NULL, NULL),
(62, 'anggiamaharani@gmail.com', 'anggiamaharani', 'TGViRXRUN0k2RW54MFNMaGlXRWg1Zz09', 'Anggia Maharani', NULL, 21, 2, 12, 0, 22, '2018-07-17 15:07:25', NULL, NULL),
(63, 'solehpokja@gmail.com', 'soleh', 'T1ZRTHkwZjdrdGVBbzRnV0NqcUtkUT09', 'Soleh', NULL, 21, 2, 10, 0, 22, '2018-07-17 15:14:14', NULL, NULL),
(64, 'wiwinsetiawati@gmail.com', 'wiwinsetiawati', 'M1RRVnM5TnJBWGRsK1ZPMXBsMlhxQT09', 'Wiwin Setiawati', NULL, 21, 2, 7, 0, 22, '2018-07-17 15:18:08', NULL, NULL),
(65, 'rahmatsatria@gmail.com', 'rahmatsatria', 'bWp0aHBqajVVWTVmNS9Lb2N2UjdFZz09', 'Rahmat Satria Guana ', NULL, 21, 10, 1, 0, 22, '2018-07-18 09:22:02', NULL, NULL),
(66, 'julaehapokja@gmail.com', 'julaeha', 'YzJUQWo5SWJUdjRwRnNmTitHR0NPdz09', 'Julaeha', NULL, 21, 10, 2, 0, 22, '2018-07-18 09:24:16', NULL, NULL),
(67, 'adensuryadi@gmail.com', 'adensuryadi', 'NUtrRXFnRVMrMDZJMEZ2OTFDc3gyQT09', 'Aden Suryadi', NULL, 21, 10, 3, 0, 22, '2018-07-18 09:30:39', NULL, NULL),
(68, 'dederosita@gmail.com', 'dederosita', 'RnY0L2tmVDJDeTMwQjF0Uy9sdFNodz09', 'Dede Rosita', NULL, 21, 10, 5, 0, 22, '2018-07-19 10:06:25', NULL, NULL),
(69, 'marwankoswara@gmail.com', 'marwankoswara', 'SXkwUkNEcDRoMlg5dmx3RjQyUEx2QT09', 'Marwan Koswara', NULL, 21, 10, 7, 0, 22, '2018-07-19 10:24:24', NULL, NULL),
(70, 'magdalenalimbong@gmail.com', 'magdalenalimbong', 'VDQ2dlFDd05FSXV0NEcvSlJuNXZQZz09', 'Magdalena Limbong', NULL, 21, 4, 4, 0, 22, '2018-07-19 10:28:00', NULL, NULL),
(71, 'husnawati@gmail.com', 'husnawati', 'T3h2RzYyZW93T2RkZlNvNW4vNzE5dz09', 'Husnawati', NULL, 21, 4, 2, 0, 22, '2018-07-19 10:30:54', NULL, NULL),
(73, 'eniprihatini@gmail.com', 'eniprihatini', 'OHUrbmJJZUtzdHkxTWp2K3pBdUlKZz09', 'Eni Prihatini', NULL, 21, 9, 1, 0, 22, '2018-07-19 10:34:07', NULL, NULL),
(74, 'dwiyanta@gmail.com', 'dwiyanta', 'Mzl6UHhPY3FHU3Nvb0NFVEJIb0FNZz09', 'Dwiyanta', NULL, 21, 1, 7, 0, 22, '2018-07-19 10:44:21', NULL, NULL),
(75, 'sogilhamurobi@gmail.com', 'sogilhamurobi', 'VVRESUJYNUM5OERaNWNFSDdxcGNBZz09', 'Sogil Hamurobi', NULL, 21, 1, 11, 0, 22, '2018-07-19 10:50:35', NULL, NULL),
(76, 'rustina@gmail.com', 'rustina', 'TkthMjE3d3VmZmo0MSs3cS9KdW0rUT09', 'Rustina SH', NULL, 21, 1, 10, 0, 22, '2018-07-19 10:52:15', NULL, NULL),
(77, 'elyzulkaningsih@gmail.com', 'elyzulkaningsih', 'eFBiQUp4QVBNYXRNZ3gzWDE4ZGM1dz09', 'Ely Zulkaningsih', NULL, 1, 7, 0, 0, 22, '2018-07-19 10:55:51', NULL, NULL),
(78, 'hartikah@gmail.com', 'hartikah', 'S2RlUWNRQnlnVnZKc3lBOUlMZFFLUT09', 'Dra Hartikah', NULL, 21, 7, 1, 0, 22, '2018-07-19 10:57:40', NULL, NULL),
(79, 'puspamega@gmail.com', 'puspamega', 'TVRLSGNnZUhOY3doSzRhd1I3ODBHQT09', 'Puspa Mega Haryati', NULL, 21, 7, 3, 0, 22, '2018-07-19 10:59:28', NULL, NULL),
(80, 'misnanpokja@gmail.com', 'misnan', 'K0V2dHNaR1dKRTNPRVdKenRIS1hkUT09', 'Misnan', NULL, 21, 7, 5, 0, 22, '2018-07-19 11:01:11', NULL, NULL),
(81, 'ahmadsoma@gmail.com', 'ahmadsoma', 'Z3ZidW02cXRwcGRwUHl2Sk9vK0ROUT09', 'Ahmad Soma', NULL, 21, 7, 4, 0, 22, '2018-07-19 11:04:12', NULL, NULL),
(82, 'devisherlando@gmail.com', 'devisherlando', 'WGtuU2hCK2QzdUtFc3g4djRSOE1jdz09', 'Devis Herlando', NULL, 21, 7, 2, 0, 22, '2018-07-19 11:05:34', NULL, NULL),
(83, 'yesiwarpokja@gmail.com', 'yesiwar', 'Y3BmL1dxOE9OSlgxblNXY0lwdVIzQT09', 'Yesiwar ', NULL, 1, 3, 0, 0, 22, '2018-07-19 11:07:55', NULL, NULL),
(84, 'sitihajar@gmail.com', 'sitihajar', 'TEZsZXV5eUVPdVpBbUpPUHg2ODFKUT09', 'Siti Hajar', NULL, 21, 3, 10, 0, 22, '2018-07-19 11:10:51', NULL, NULL),
(85, 'ahsanhadiri@gmail.com', 'ahsanhadiri', 'dkkwZExjQ2l4WVFnbC9GVzgvcjYydz09', 'Ahsan Hadiri', NULL, 21, 3, 11, 0, 22, '2018-07-19 11:12:47', NULL, NULL),
(86, 'sahaisihombing@gmail.com', 'sahaisihombing', 'c0tDNURPN3YrNmV4NUtoMk5QM0xlUT09', 'Sahai Sihombing', NULL, 21, 3, 12, 0, 22, '2018-07-19 11:14:50', NULL, NULL),
(87, 'sanusipokja@gmail.com', 'sanusi', 'VFFWL1hUdys0Mk5uYkV3OTFhU04vZz09', 'Sanusi', NULL, 21, 3, 9, 0, 22, '2018-07-19 11:16:33', NULL, NULL),
(88, 'tondiandri@gmail.com', 'tondiandri', 'Zkx1NlFsTzVnK1ZEemxiYnUyb1Fadz09', 'M Tondi Andri', NULL, 21, 3, 2, 0, 22, '2018-07-19 11:19:52', NULL, NULL),
(89, 'sahalpokja@gmail.com', 'sahal', 'UGpVWHRPajdSYzZKWXV3NE80U1E3UT09', 'M Sahal', NULL, 21, 3, 3, 0, 22, '2018-07-19 11:21:43', NULL, NULL),
(90, 'lalaalawi@gmail.com', 'lalaalawi', 'dWZSc052eWFDcnhuYm9NazkzSStWQT09', 'Lala Alawi', NULL, 21, 3, 1, 0, 22, '2018-07-19 11:23:44', NULL, NULL),
(91, 'wulanginanjar@gmail.com', 'wulanginanjar', 'cklCeGxHY29VMTVyS2JNSEZTb3JQQT09', 'Wulan Ginanjar Pinanggih', NULL, 1, 11, 0, 0, 22, '2018-07-19 11:26:27', NULL, NULL),
(92, 'aprizalyogasara@gmail.com', 'aprizalyogasara', 'YXBNeWpPNkw4OUZ2SmI3eWhmOWxHQT09', 'Aprizal Yogasara', NULL, 21, 11, 1, 0, 22, '2018-07-19 11:28:02', NULL, NULL),
(93, 'yuyunpurwana@gmail.com', 'yuyunpurwana', 'RlRuSXRHUUVEdlhJVFczNnRUaXBuUT09', 'Yuyun Purwana', NULL, 21, 11, 2, 0, 22, '2018-07-19 11:30:53', NULL, NULL),
(94, 'suhermanpokja@gmail.com', 'suherman', 'K1Z2TmhzY3NSeWg3YjRCaDZha29UQT09', 'Suherman', NULL, 21, 11, 3, 0, 22, '2018-07-19 11:37:30', NULL, NULL),
(95, 'dederojidin@gmail.com', 'dederojidin', 'RnY0L2tmVDJDeTMwQjF0Uy9sdFNodz09', 'Dede Rojidin ', NULL, 21, 11, 4, 0, 22, '2018-07-19 11:40:51', NULL, NULL),
(96, 'dionwijaya@gmail.com', 'dionwijaya', 'Q2FXMVZhSGtvUHBLT2NUUmRwYjloQT09', 'Dion Wijaya', NULL, 21, 11, 6, 0, 22, '2018-07-19 13:29:55', NULL, NULL),
(97, NULL, NULL, NULL, NULL, NULL, 21, 11, 7, 0, 22, '2018-07-19 13:45:01', NULL, NULL),
(98, NULL, NULL, NULL, NULL, NULL, 21, 11, 5, 0, 22, '2018-07-19 13:51:08', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_article`
--

CREATE TABLE `tbl_article` (
  `id_article` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_description` varchar(255) NOT NULL,
  `article_content` text NOT NULL,
  `id_article_type` tinyint(4) DEFAULT NULL,
  `id_kecamatan` tinyint(4) DEFAULT NULL,
  `id_file_type` tinyint(4) NOT NULL,
  `file_name` varchar(45) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `published` varchar(1) NOT NULL,
  `publish_by` tinyint(4) DEFAULT NULL,
  `publish_date` datetime NOT NULL,
  `category_id` tinyint(1) NOT NULL,
  `create_by` tinyint(4) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `update_by` tinyint(4) NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tbl_article`
--

INSERT INTO `tbl_article` (`id_article`, `title`, `short_description`, `article_content`, `id_article_type`, `id_kecamatan`, `id_file_type`, `file_name`, `video_url`, `published`, `publish_by`, `publish_date`, `category_id`, `create_by`, `create_date`, `update_by`, `update_date`) VALUES
(17, 'Dinas Perikanan Kota Depok Gelar Perlombaan memancing', 'Dinas Perikanan Kota Depok Gelar Perlombaan memancing', '<p>Dinas Perikanan Kota Depok Gelar Perlombaan memancing</p>\r\n', 1, NULL, 1, '1534068046774.jpg', NULL, '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-08-15 11:43:56', 22, '2018-08-15 12:18:29'),
(18, 'Slider 1', 'ikan mas ', '<p>Dinas Perikanan Kota Depok Gelar Perlombaan memancing</p>\r\n', 4, NULL, 1, 'mas2146607.jpg', NULL, '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-08-15 14:05:54', 22, '2018-08-15 14:22:36'),
(19, 'Slider 2', 'gambar nelayan', '<p>image slider nelayan</p>\r\n', 4, NULL, 1, 'image13.jpg', NULL, '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-08-15 14:08:22', 0, '0000-00-00 00:00:00'),
(20, 'Slider 3', 'Logo ayo makan ikan', '<p>image slider Logo ayo makan ikan</p>\r\n', 4, NULL, 1, 'slider3.jpg', NULL, '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-08-15 14:09:26', 0, '0000-00-00 00:00:00'),
(23, 'Potret Walikota Depok Menyebar Benih Ikan', 'Potret Walikota Depok Menyebar Benih Ikan', '<p>Detail menyerbar ikan</p>\r\n', 5, NULL, 1, '08152018185626099400.jpg', NULL, '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-08-15 15:55:04', 22, '2018-08-16 01:56:26'),
(24, 'Potret Antusias Warga Menyebar Benih ikan di Danau Buatan', 'Potret Antusias Warga Menyebar Benih ikan di Danau Buatan', '<p>Detail menyerbar ikan</p>\r\n', 7, NULL, 1, '09022018104503496000.jpg', 'https://www.youtube.com/watch?v=xLCn88bfW1o', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-08-15 16:10:03', 22, '2018-09-02 17:45:03'),
(25, 'Potret Antusias Warga', 'Potret Antusias Warga Menyebar Benih ikan di Danau Buatan 2', '<p><a href=\"javascript:editdata(\'24\')\">Potret Antusias Warga Menyebar Benih ikan di Danau Buatan</a></p>\r\n', 5, NULL, 1, '08152018193742843400.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-08-15 19:37:32', 22, '2018-08-17 11:30:16'),
(26, 'Potret Antusias Warga Menyebar Benih ikan di Danau Buatan 4', 'Potret Antusias Warga Menyebar Benih ikan di Danau Buatan 4', '<p><a href=\"javascript:editdata(\'24\')\">Potret Antusias Warga Menyebar Benih ikan di Danau Buatan</a></p>\r\n', 5, NULL, 1, '08152018193824461800.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-08-15 19:38:13', 22, '2018-08-16 02:38:24'),
(27, 'Potret Antusias Warga Menyebar Benih ikan di Danau Buatan 5', 'Potret Antusias Warga Menyebar Benih ikan di Danau Buatan 5', '<p><a href=\"javascript:editdata(\'24\')\">Potret Antusias Warga Menyebar Benih ikan di Danau Buatan</a>&nbsp;4</p>\r\n', 5, NULL, 1, 'image6.jpg', NULL, '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-08-15 19:38:39', 0, '0000-00-00 00:00:00'),
(32, 'Doughnut Chart in chart.js', 'Begitulah ceritanya', '<p>abc</p>\r\n', 5, NULL, 2, '08152018185108064200.jpg', 'www.youtube.com', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-08-16 01:51:08', 0, '0000-00-00 00:00:00'),
(34, 'TEST IMAG det gg', 'Begitulah ceritanya', '<p>IMAGE</p>\r\n', 5, NULL, 1, '08152018193313970600.jpg', 'www.youtube.com', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-08-16 02:26:09', 22, '2018-08-17 19:59:39'),
(35, '2,5 Juta Benih Ikan di sebarkan di kolam buatan', 'Berita dari Kecamatan', '<p style=\"text-align:justify; text-indent:20px\">Sekitar 2,5 juta benih ikan mujair, tawes, ikan mas, udang galah, graasrap, nilem dan lainnya disebar di sejumlah setu yang ada di Kota Depok salah satunya di Setu Pengasinan, Sawangan, Kota Depok.</p>\r\n\r\n<p style=\"text-align:justify; text-indent:20px\">Program menebar benih ikan di wilayah Provinsi Jawa Barat sudah dilakukansejak empat tahun lalu dan baru kali ada kesempatan di Kota Depok, &rdquo; kata Gubernur Jabar Ahmad Heryawan didampingi Kadiskominfo Depok Sidik M dan Kepala Dinas Ketahanan Pangan, Pertanian dan Perikanan, Jumat (12/1).</p>\r\n', 6, NULL, 1, '08172018004015831800.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-08-17 07:40:15', 22, '2018-09-03 00:48:24'),
(36, 'Budidaya dan Bisnis Ikan Hias Depok', 'Berita dari Kecamatan', '<p style=\"text-align:justify; text-indent:50px\">Salah satu sentra penghasil ikan hias tersebut yakni Kota Depok yang masuk lima besar daerah penghasil ikan hias air tawar di Indonesia. Tiap tahun, Kota Depok mampu menghasilkan sekitar 80 juta ekor ikan hias. &ldquo;Depok terkenal sebagai penghasil ikan jenis cardinal, red nose, serta neon tetra,&rdquo; kata Kepala Bidang Perikanan pada Dinas Ketahanan Pangan, Pertanian dan Perikanan (Distankan) Kota Depok, Ita Wilda, Rabu (8/2). Belakangan, Kota Depok juga mulai mengembangkan pembudidayaan ikan guppy, ikan cupang hias, serta ikan cupang laga.</p>\r\n', 6, NULL, 1, '08172018042332610400.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-08-17 11:23:32', 22, '2018-09-03 00:48:41'),
(38, 'Walikota Depok sebar 100.000 Benih ikan', 'Walikota Depok sebar 100.000 Benih ikan', '<p>Wali Kota Depok Mohammad Idris Abdul Shomad bersama jajarannya dan sejumlah tokoh masyarakat menerbarkan sebanyak 100.000 benih ikan konsumsi ke tiga situ yang ada di Depok, Kamis (29/9/2016). Tiga situ itu adalah Situ Cilodong di Kecamatan Cilodong, Situ Tipar dan Situ Gadog di Kecamatan Cimanggis.</p>\r\n', 7, NULL, 1, '08172018121358513200.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-08-17 18:37:09', 22, '2018-08-17 19:13:58'),
(39, 'Budidaya Ikan Koi Hias', 'Budidaya Ikan Koi Hias', '<p>Koi atau secara spesifiknya koi berasal dari bahasa jepang yang berarti ikan karper. lebih spesifik lagi merujuk pada nishikigoi, yang berarti ikan bersulam emas atau perak</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Cara Budidaya Ikan Koi</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>1.Pilihlah indukan yang berkualitas&nbsp;<br />\r\n2.Pembuatan kolam untuk tempat tinggal dan perkawinan yang bersih&nbsp;<br />\r\n3.Perhatikan dengan seksama tahap pemijahan&nbsp;<br />\r\n4. Jaga kualitas air&nbsp;<br />\r\n5.Mengganti air seminggu sekali&nbsp;<br />\r\n6.Pembatasan jumlah ikan dalam kolam&nbsp;<br />\r\n7.perhatikan kadar keasaman kolam air</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Ikan Koi terdapat di beberapa kecamatan</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href=\"keclimo.html\">1. Kecamatan Limo</a>&nbsp;<br />\r\n<a href=\"keccilodong.html\">2. Kecamatan Cilodong</a></p>\r\n', 11, NULL, 1, '08182018074424213400.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-08-18 14:44:24', 0, '0000-00-00 00:00:00'),
(40, 'Budidaya Ikan Mas Hias', 'Budidaya Ikan Mas Hias', '<p>Ikan Mas Hias adalah ikan air tawar dari familia Cyprinidae dan ordo Cypriniformes, ikan ini adalah salah satu ikan yang pertama kali berhasil di domestikasi,dipelihara dan dibudidayakan manusia</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Cara Budidaya Ikan Mas</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>1.Pilihlah indukan yang berkualitas&nbsp;<br />\r\n2.Pembuatan kolam untuk tempat tinggal dan perkawinan yang bersih&nbsp;<br />\r\n3.Perhatikan dengan seksama tahap pemijahan&nbsp;<br />\r\n4. Jaga kualitas air&nbsp;<br />\r\n5.Mengganti air seminggu sekali&nbsp;<br />\r\n6.Pembatasan jumlah ikan dalam kolam&nbsp;<br />\r\n7.perhatikan kadar keasaman kolam air</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Ikan Mas terdapat di beberapa kecamatan</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href=\"keclimo.html\">1. Kecamatan Limo</a>&nbsp;<br />\r\n<a href=\"keccilodong.html\">2. Kecamatan Cilodong</a></p>\r\n\r\n<p>&nbsp;</p>\r\n', 11, NULL, 1, '08182018075718074900.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-08-18 14:57:18', 22, '2018-09-03 07:12:57'),
(41, 'Budidaya Ikan Arwana Hias', 'Budidaya Ikan Arwana Hias', '<p>Arwana adalah salah satu spesies ikan air tawar dari asia tenggara, ikan ini memiliki badan yang panjang, sirip dubur terletak jauh di belakang badan, dan arwana umumnya memiliki warna merah keperak-perakan</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Cara Budidaya Ikan Arwana</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>1.Pilihlah indukan yang berkualitas&nbsp;<br />\r\n2.Pembuatan kolam untuk tempat tinggal dan perkawinan yang bersih&nbsp;<br />\r\n3.Perhatikan dengan seksama tahap pemijahan&nbsp;<br />\r\n4. Jaga kualitas air&nbsp;<br />\r\n5.Mengganti air seminggu sekali&nbsp;<br />\r\n6.Pembatasan jumlah ikan dalam kolam&nbsp;<br />\r\n7.perhatikan kadar keasaman kolam air</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Ikan Arwana terdapat di beberapa kecamatan</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href=\"keclimo.html\">1. Kecamatan Limo</a>&nbsp;<br />\r\n<a href=\"keccilodong.html\">2. Kecamatan Cilodong</a></p>\r\n\r\n<p>&nbsp;</p>\r\n', 11, NULL, 1, '08182018075924015600.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-08-18 14:59:24', 0, '0000-00-00 00:00:00'),
(42, 'Budidaya Ikan Neon Hias', 'Budidaya Ikan Neon Hias', '<p>Ikan Hias Neon merupakan jenis ikan hias yang mudah dipelihara, tahan terhadap penyakit dan serta merupakan jenis ikan hias kecil yang tidak mudah mati.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Cara Budidaya Ikan Neon</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>1.Pilihlah indukan yang berkualitas&nbsp;<br />\r\n2.Pembuatan kolam untuk tempat tinggal dan perkawinan yang bersih&nbsp;<br />\r\n3.Perhatikan dengan seksama tahap pemijahan&nbsp;<br />\r\n4. Jaga kualitas air&nbsp;<br />\r\n5.Mengganti air seminggu sekali&nbsp;<br />\r\n6.Pembatasan jumlah ikan dalam kolam&nbsp;<br />\r\n7.perhatikan kadar keasaman kolam air</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Ikan Neon terdapat di beberapa kecamatan</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href=\"keclimo.html\">1. Kecamatan Limo</a>&nbsp;<br />\r\n<a href=\"keccilodong.html\">2. Kecamatan Cilodong</a></p>\r\n\r\n<p>&nbsp;</p>\r\n', 11, NULL, 1, '08182018080127360200.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-08-18 15:01:27', 22, '2018-09-03 09:36:57'),
(43, 'Ikan Lele', 'Ikan Lele', '<p>Ikan Lele adalah sejenis ikan yang hidup di air tawar, lele mudah dikenal karena tubuhnya yang licin, agak pipih dan memanjang serta memiliki kumis yang panjang.&nbsp;</p>\r\n\r\n<p><strong>Cara Budidaya Ikan Lele</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>1.Pilihlah indukan yang berkualitas&nbsp;<br />\r\n2.Pembuatan kolam untuk tempat tinggal dan perkawinan yang bersih&nbsp;<br />\r\n3.Perhatikan dengan seksama tahap pemijahan&nbsp;<br />\r\n4. Jaga kualitas air&nbsp;<br />\r\n5.Mengganti air seminggu sekali&nbsp;<br />\r\n6.Pembatasan jumlah ikan dalam kolam&nbsp;<br />\r\n7.perhatikan kadar keasaman kolam air</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Ikan Lele terdapat di beberapa kecamatan</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href=\"keclimo.html\">1. Kecamatan Limo</a>&nbsp;<br />\r\n<a href=\"keccilodong.html\">2. Kecamatan Cilodong</a></p>\r\n', 12, NULL, 1, '09032018002206637000.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-08-18 19:24:55', 22, '2018-09-03 07:22:06'),
(44, 'logo', 'logo', '<p>logo</p>\r\n', 2, NULL, 1, '09022018155043690700.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-08-25 16:54:16', 22, '2018-09-03 06:34:16'),
(45, 'test upload', 'test', '<p>test</p>\r\n', 6, NULL, 1, '08262018171633313100.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-08-27 00:16:33', 22, '2018-09-02 07:08:28'),
(46, 'Most Popular', 'Most Popular', '', 7, NULL, 1, '09022018104623376800.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-09-02 17:46:23', 0, '0000-00-00 00:00:00'),
(47, 'Kecamatan Beji', 'Kecamatan Beji', '<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"background-color:white\">Kantor Kecamatan Beji terletak di Perumahan Depok Indah</span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"background-color:white\">No Telp: (021) 7520233</span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">Kecamatan Beji memiliki 6 Kelurahan;</span></span></p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">Kelurahan Beji (Kantor Kelurahan terletak di Jl.H Asmawi)</span></span></li>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">Kelurahan Beji Timur (Kantor Kelurahan terletak di Jl.Raya Pemuda Beji Timur)</span></span></li>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">Kelurahan Kemiri Muka (Kantor Kelurahan terletak di Jl.H. Fatimah)</span></span></li>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">Kelurahan Pondok Cina (Kantor Kelurahan terletak di Jl.H.Yahya Nuih)</span></span></li>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">Kelurahan Kukusan (Kantor Kelurahan terletak di Jl.Palakali)</span></span></li>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">Kelurahan Tanah Baru (Kantor Kelurahan terletak di Jl. Palakali)</span></span></li>\r\n</ul>\r\n', 13, NULL, 1, '09022018141743174300.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-09-02 21:17:43', 22, '2018-09-02 23:25:28'),
(48, 'Kecamatan Bojong Sari', 'Kecamatan Bojong Sari', '<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"background-color:white\">Kantor Kecamatan Bojong Sari terletak di Jl. Raya Ciputat &ndash; Parung Km. 24 Bojongsari, Kota Depok</span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"background-color:white\">No Telp: (0251) 8616530</span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">Kecamatan Beji memiliki 7 Kelurahan;</span></span></p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">Kelurahan <span style=\"font-size:10.5pt\"><span style=\"background-color:white\">Bojong Sari</span></span> (Kantor Kelurahan terletak di Jl. Bojongsari)</span></span></li>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:10.5pt\"><span style=\"background-color:white\">Kelurahan Bojongsari Baru</span></span> (Kantor Kelurahan terletak di Jl. Bojongsari&nbsp; gg. Rotan)</span></span></li>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:10.5pt\"><span style=\"background-color:white\">Kelurahan Serua&nbsp;</span></span> (Kantor Kelurahan terletak di Jl. Raya Serua)</span></span></li>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:10.5pt\"><span style=\"background-color:white\">Kelurahan Pondok Petir</span></span> (Kantor Kelurahan terletak di Jl. Raya Serua)</span></span></li>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:10.5pt\"><span style=\"background-color:white\">Kelurahan Curug&nbsp;</span></span> (Kantor Kelurahan terletak di Jl. Raya Curug)</span></span></li>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:10.5pt\"><span style=\"background-color:white\">Kelurahan Duren Mekar</span></span> (Kantor Kelurahan terletak di Jl. H. Suhaemi)</span></span></li>\r\n</ul>\r\n\r\n<p><span style=\"font-size:10.5pt\"><span style=\"background-color:white\">Kelurahan Duren Seribu</span></span> (Kantor Kelurahan terletak di Jl. Harco Raya)</p>\r\n', 13, NULL, 1, '09022018163655440900.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-09-02 23:36:55', 22, '2018-09-03 00:08:38'),
(49, 'Kecamatan Cilodong', 'Kecamatan Cilodong', '<p style=\"margin-left:36pt; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"background-color:#fefefe\">Kantor Kecamatan Cilodong terletak di Jl. M. Nasir Raya Cilodong </span></span></span><br />\r\n<span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"background-color:#fefefe\">Kecamatan Cilodong merupakan salah satu dari 11 kecamatan yang telah dimekarkan untuk dapat memudahkan atau mendekatkan pelayanan kepada masyarakat, yang berdasarkan peraturan kota Depok nomor 8 tahun 2007 tentang pembentukan Kecamatan dikota Depok</span></span></span><br />\r\n<span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">Kecamatan Cilodong memiliki 5&nbsp;Kelurahan;</span></span></p>\r\n\r\n<ul>\r\n	<li style=\"margin-left: 36pt; margin-right: 0cm; text-align: justify;\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"background-color:white\">Kelurahan Cilodong</span></span></span></li>\r\n	<li style=\"margin-left: 36pt; margin-right: 0cm; text-align: justify;\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"background-color:white\">Kelurahan Jatimulya</span></span></span></li>\r\n	<li style=\"margin-left: 36pt; margin-right: 0cm; text-align: justify;\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"background-color:white\">Kelurahan Kalibaru</span></span></span></li>\r\n	<li style=\"margin-left: 36pt; margin-right: 0cm; text-align: justify;\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"background-color:white\">Kelurahan Kalimulya</span></span></span></li>\r\n	<li style=\"margin-left: 36pt; margin-right: 0cm; text-align: justify;\"><span style=\"font-size:11.0pt\"><span style=\"background-color:white\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\">Kelurahan Sukamaju</span></span></span></li>\r\n</ul>\r\n', 13, NULL, 1, '09022018172044734100.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-09-03 00:20:44', 0, '0000-00-00 00:00:00'),
(50, 'Kecamatan Cimanggis', 'Kecamatan Cimanggis', '<p style=\"margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"background-color:white\">Kecamatan Cimanggis berada di wilayah Depok sebelah timur, berada pada ketinggian &plusmn; 115 m di atas permukaan laut daerah ini mempunyai curah hujan rata-rata 200,91 mm/tahun</span>;</span></span></p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"background-color:white\">Kelurahan Cisalak Pasar</span></span></span></li>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"background-color:white\">Kelurahan Curug</span></span></span></li>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"background-color:white\">Kelurahan Harjamukti</span></span></span></li>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"background-color:white\">Kelurahan Mekarsari</span></span></span></li>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"background-color:white\">Kelurahan Pasir Gunung Selatan</span></span></span></li>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"background-color:white\">Kelurahan Tugu</span></span></span></li>\r\n</ul>\r\n', 13, NULL, 1, '09022018172952888800.jpeg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-09-03 00:29:52', 0, '0000-00-00 00:00:00'),
(51, 'Depok Jadi Percontohan Budidaya Lele dengan Metode Bioflok', 'Berita dari Kecamatan', '<p>depok.go.id &ndash; Budidaya ikan lele yang diterapkan Legisan Samtafsir dengan menggunakan metode bioflok sejak tahun 2012 tidak hanya melambungkan namanya. Tapi, juga membuat Kota Depok secara tidak langsung sudah menjadi percontohan bagi kabupaten atau kota lain untuk belajar mengenai metode ini.</p>\r\n\r\n<p>&ldquo;Bioflok merupakan istilah yang tengah naik daun saat ini. Bioflok adalah sistem baru budidaya lele yang saat ini juga banyak diterapkan pada pemelihara ikan lele. Kota Depok menjadi pelopornya,&rdquo; ujar Legisan di tempat usahanya Rangkapan Jaya, Kecamatan Pancoran Mas, Kamis (28/09/17).</p>\r\n\r\n<p>Dia menyebut, sentra budidaya lele sistem bioflok ini bahkan telah ditunjuk Badan Pengembangan Sumber Daya Manusia Kementerian Kelautan dan Perikanan dengan nama Farm 165. Budidaya lele sistem bioflok, kata Legisan, merupakan budidaya lele intensif yang dapat diciptakan di pekarangan rumah. Menurutnya, tidak perlu kolam yang luas, tapi cukup dengan kolam bermediakan fiber atau terpal berbentuk bulat berdiameter 2,5 meter setinggi kurang lebih 1 meter.</p>\r\n\r\n<p>&ldquo;Budidaya lele sistem bioflok yang ada pada Farm 165, diterapkan dengan cara menumbuhkan mikroorganisme yang berfungsi mengolah limbah dari hasil budidaya menjadi gumpalan-gumpalan kecil yang bisa menjadi makanan alami ikan,&rdquo; tambahnya.</p>\r\n\r\n<p>Keuntungan yang didapat dari penerapan sistem bioflok ini, kata dia, adalah hemat air, ramah lingkungan, serta mampu meningkatkan jumlah produktivitas ikan jadi lebih tinggi, sehingga nilai omzetnya juga ikut naik.</p>\r\n\r\n<p>&ldquo;Alhamdulillah, omzet mampu menembus angka Rp 100 juta per bulannya. Karena selain usaha budidaya, kami juga membuka resto yang bersebelahan langsung dengan kolam ikan pembesaran. Ke depan, Farm 165 ini mudah-mudahan bisa jadi pelopor bagi pusat inkubasi bisnis dari perikanan di seluruh Indonesia,&rdquo; ucapnya.</p>\r\n\r\n<p>Sementara itu,&nbsp;Kepala Bidang Perikanan Dinas Ketahanan Pangan Pertanian dan Perikanan (DKPPP) Kota Depok, Ita Wilda&nbsp;mengapresiasi inovasi budidaya lele milik Legisan. Dengan dijadikannya Kota Depok sebagai pusat pelatihan, Ita berharap pamor pembudidaya dan hasil olahannya semakin tenar hingga mancanegara.</p>\r\n\r\n<p>&ldquo;Ini juga bisa membantu petani ikan lain dalam mencari pangsa pasar, sebab kalau Depok sudah terkenal dengan budidayanya, bukan tidak mungkin produk Depok dapat terkenal hingga luar negeri,&rdquo; pungkasnya.</p>\r\n\r\n<p>Penulis: Vidyanita</p>\r\n\r\n<p>Editor: Dunih&nbsp;dan Rita Nurlita</p>\r\n\r\n<p>Diskominfo</p>\r\n', 6, NULL, 1, '09022018175159108800.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-09-03 00:51:59', 22, '2018-09-03 00:56:52'),
(52, 'Fasilitasi dan Pelatihan Petani Ikan Konsumsi dan Ikan Hias di Kec. Bojongsari', 'Berita dari Kecamatan', '<p style=\"text-align:justify\">Dalam rangka meningkatkan pengetahuan dan ketrampilan mulai dari pra produksi, produksi, pengolahan sampai dengan pemasaran hasil perikanan anggota kelompok pembudidaya ikan konsumsi dan ikan hias, Kecamatan Bojongsari mengadakan sosialisasi dan pelatihan bagi anggota GAPOKTAN yang merupakan produk unggulan dari Kecamatan Bojongsari, kegiatan ini dilaksanakan di RT. 03/02 Kelurahan Duren Mekar yang diikuti oleh lebih dari 100 orang peserta anggota GAPOKTAN, yang dihadiri pula oleh Perwakilan Anggota DPRD Dapil Sawangan Bojongsari &amp; Para lurah beserta aparatur Kec. Bojongsari dan LPM. Acara dibuka oleh Camat Bojongsari, dan bertindak sebagai narasumber dari Dinas Pertanian &amp; Perikanan serta Ketua KTNA Kec. Bojongsari. Dengan diadakannya kegiatan ini diharapkan para petani ikan di Kecamatan Bojongsari dapat lebih meningkatkan hasil perikanan sehingga memiliki daya saing yang tinggi dan mampu meningkatkan perekonomian warga.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Dalam rangka meningkatkan pengetahuan dan ketrampilan mulai dari pra produksi, produksi, pengolahan sampai dengan pemasaran hasil perikanan anggota kelompok pembudidaya ikan konsumsi dan ikan hias, Kecamatan Bojongsari mengadakan sosialisasi dan pelatihan bagi anggota GAPOKTAN yang merupakan produk unggulan dari Kecamatan Bojongsari, kegiatan ini dilaksanakan di RT. 03/02 Kelurahan Duren Mekar yang diikuti oleh lebih dari 100 orang peserta anggota GAPOKTAN, yang dihadiri pula oleh Perwakilan Anggota DPRD Dapil Sawangan Bojongsari &amp; Para lurah beserta aparatur Kec. Bojongsari dan LPM. Acara dibuka oleh Camat Bojongsari, dan bertindak sebagai narasumber dari Dinas Pertanian &amp; Perikanan serta Ketua KTNA Kec. Bojongsari. Dengan diadakannya kegiatan ini diharapkan para petani ikan di Kecamatan Bojongsari dapat lebih meningkatkan hasil perikanan sehingga memiliki daya saing yang tinggi dan mampu meningkatkan perekonomian warga.</p>\r\n', 5, NULL, 1, '09022018181914349900.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-09-03 01:19:14', 0, '0000-00-00 00:00:00'),
(53, 'Ikan Bawal Air Tawar', 'Ikan Konsumsi Air Tawar', '<p style=\"text-align:justify\">Ikan Bawal (Bramidae) merupakan satu famili Perciformes. Secara umumnya ikan Bawal terbagi menjadi dua jenis yaitu bawal putih (bawal air laut) dan bawal merah hitam (bawal air tawar). Ikan bawal putih lebih tinggi peminatnya bila dibandingkan dengan &nbsp;bawal hitam. Ikan Bawal banyak terdapat di Lautan Hindi selain Afrika, Indonesia dan Jepang.</p>\r\n\r\n<p style=\"text-align:justify\">Ikan Bawal hidup dan berenang membentuk sebuah kelompok kecil. bawal juga dikatakan sering ditemukan beriringan dengan udang di dasar air. Ikan bawal sering juga menjadi pilihan utama bahan pangan.</p>\r\n\r\n<p><strong>Cara Budidaya Ikan Bawal</strong></p>\r\n\r\n<p>1.Pilihlah indukan yang berkualitas&nbsp;<br />\r\n2.Pembuatan kolam untuk tempat tinggal dan perkawinan yang bersih&nbsp;<br />\r\n3.Perhatikan dengan seksama tahap pemijahan&nbsp;<br />\r\n4. Jaga kualitas air&nbsp;<br />\r\n5.Mengganti air seminggu sekali&nbsp;<br />\r\n6.Pembatasan jumlah ikan dalam kolam&nbsp;<br />\r\n7.perhatikan kadar keasaman kolam air</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Ikan Bawal terdapat di beberapa kecamatan</strong></p>\r\n\r\n<p>1. Kecamatan&nbsp;Sawangan<br />\r\n2. Kecamatan Tanah Baru</p>\r\n', 12, NULL, 1, '09032018001605058800.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-09-03 01:29:12', 22, '2018-09-03 07:43:46'),
(54, 'Belut Air Tawar', 'Budaidaya Ikan Konsumsi', '<p style=\"text-align:justify\">Ikan Belut mengandung nutrisi yang baik untuk kesehatan, antara lain zat besi, arginin, zink,isoleusin, B2 (riboflavin), &nbsp;omega 3 &nbsp;leusin, kalori yang tinggi, &nbsp;vitamin A, sodium, protein, kalsium, omega 6, B3 (niacin), B6 (pyridoxine), B9 (asam folat), B12 (kobalamin), B1 (thiamin), C, E, magnesium, kolesterol, selenium, dan fosfor.</p>\r\n\r\n<p style=\"text-align:justify\">ikan belut memiliki beberapa khasiat, seperti sebagai menutrisi otak dan membantu proses tumbuh kembang anak (isoleusin), sumber vitamin, mencegah anemia (zat besi), sumber protein bagi semua kelompok usia termasuk anak-anak, pembentukan protein otot (leusin), kesehatan jantung dan pengobatan kanker (arginin), memperkuat tulang (fosfor), dan penambah stamina (kalori). Yang perlu diwaspadai adalah kandungan kolesterolnya apabila dikonsumsi dalam jumlah yang berlebihan.</p>\r\n\r\n<p><strong>Cara Budidaya Belut</strong></p>\r\n\r\n<p>1.Pilihlah indukan yang berkualitas&nbsp;<br />\r\n2.Pembuatan kolam untuk tempat tinggal dan perkawinan yang bersih&nbsp;<br />\r\n3.Perhatikan dengan seksama tahap pemijahan&nbsp;<br />\r\n4. Jaga kualitas air&nbsp;<br />\r\n5.Mengganti air seminggu sekali&nbsp;<br />\r\n6.Pembatasan jumlah ikan dalam kolam&nbsp;<br />\r\n7.perhatikan kadar keasaman kolam air</p>\r\n\r\n<p><strong>Belut terdapat di beberapa kecamatan</strong></p>\r\n\r\n<ol>\r\n	<li>Kecamatan&nbsp;Pancoran Mas</li>\r\n	<li>Kecamatan Cinere</li>\r\n	<li>Kecamatan SUkmajaya</li>\r\n</ol>\r\n', 12, NULL, 1, '09032018001732578800.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-09-03 01:44:13', 22, '2018-09-03 07:32:35'),
(55, 'Ikan Gabus Air Tawar', 'Ikan Konsumsi Air Tawar', '<p style=\"text-align:justify\">Ikan gabus atau ikan kutuk biasa ditemui di sungai, rawa, danau, dan sawah-sawah hingga ke saluran-saluran air. Ikan ini memangsa berbagai serangga, ikan kecil-kecil, kodok dan berudu. Seringkali ikan gabus terbawa oleh banjir ke parit-parit dan berada sekitar rumah kita, atau memasuki kolam-kolam pemeliharaan ikan dan tentunya menjadi hama karena akan memangsa ikan-ikan peliharaan dikolam terebut.</p>\r\n\r\n<p style=\"text-align:justify\">Jika dikolam, sawah atau parit yang mengering, ikan ini akan pindah ke tempat lain. Dan bila terpaksa, ikan kutuk ini akan mengubur dirinya di dalam lumpur hingga tempat itu kembali memiliki air. Oleh karena, itu ikan Kutuk sering kali ditemui berjalan di daratan, khususnya ketika pada malam hari pada musim kemarau, ikan ini akan mencari tempat lain yang masih berair. Fenomena ini dapat terjadi karena karena gabus memiliki kemampuan untuk bernapas secara langsung dari udara, dengan menggunakan organ pernafasan tambahan yaitu organ labirin.</p>\r\n\r\n<p><strong>Cara Budidaya Ikan Gabus</strong></p>\r\n\r\n<p>1.Pilihlah indukan yang berkualitas&nbsp;<br />\r\n2.Pembuatan kolam untuk tempat tinggal dan perkawinan yang bersih&nbsp;<br />\r\n3.Perhatikan dengan seksama tahap pemijahan&nbsp;<br />\r\n4. Jaga kualitas air&nbsp;<br />\r\n5.Mengganti air seminggu sekali&nbsp;<br />\r\n6.Pembatasan jumlah ikan dalam kolam&nbsp;<br />\r\n7.perhatikan kadar keasaman kolam air</p>\r\n\r\n<p><strong>Ikan Gabus terdapat di beberapa kecamatan</strong></p>\r\n\r\n<ol>\r\n	<li>Kecamatan&nbsp;Cilodong</li>\r\n	<li>Kecamatan Cimanggis</li>\r\n	<li>Kecamatan Cipayung</li>\r\n</ol>\r\n', 12, NULL, 1, '09032018003159922800.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-09-03 01:46:36', 22, '2018-09-03 07:43:17'),
(56, 'Ikan Gurame Air Tawar', 'Ikan Konsumsi Air Tawar', '<p style=\"text-align:justify\">Di habitatnya, ikan gurami hidup dirawa, sungai-sungai dan kolam. Sesekali ikan ini muncul ke permukaan air untuk bernapas secara langsung dari udara. Induk ikan gurame, untuk beberapa waktu lamanya, akan melindungi dan memelihara anak-anaknya. Telurnya dilekatkan pada tumbuhan air atau ditaruh di sarang yang telah terbuat dari tumbuh-tumbuhan.</p>\r\n\r\n<p style=\"text-align:justify\">Ikan gurami sangat digemari sebagai ikan konsumsi. Karena, dagingnya yang padat, durinya besar-besar, rasanya gurih dan enak. Setiap restoran hampir menyajikan Ikan Gurame sebagai salah satu menu andalan, terutama gurami bakar dan gurami asam-manis. Ikan ini memiliki harga yang cukup mahal. Gurami juga disukai sebagai ikan hias akuarium air tawar dan jenis yang dijadikan sebagai ikan hias tersebut ialah Ikan Gurame padang.</p>\r\n\r\n<p><strong>Cara Budidaya Ikan Gurame</strong></p>\r\n\r\n<p>1.Pilihlah indukan yang berkualitas&nbsp;<br />\r\n2.Pembuatan kolam untuk tempat tinggal dan perkawinan yang bersih&nbsp;<br />\r\n3.Perhatikan dengan seksama tahap pemijahan&nbsp;<br />\r\n4. Jaga kualitas air&nbsp;<br />\r\n5.Mengganti air seminggu sekali&nbsp;<br />\r\n6.Pembatasan jumlah ikan dalam kolam&nbsp;<br />\r\n7.perhatikan kadar keasaman kolam air</p>\r\n\r\n<p><strong>Ikan Gurame terdapat di beberapa kecamatan</strong></p>\r\n\r\n<ol>\r\n	<li>Kecamatan&nbsp;Cipayung</li>\r\n	<li>Kecamatan Limo</li>\r\n</ol>\r\n', 12, NULL, 1, '09032018003433739800.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-09-03 01:52:27', 22, '2018-09-03 07:42:41'),
(57, 'Ikan Lundu / Keting', 'Ikan Konsumsi Air Tawar', '<p style=\"text-align:justify\">Ikan lundu atau ikan keting yang memiliki nama latin <em>mystus Nigricheps</em> adalah ikan yang hidup di air tawar. ikan keting mempunyai ciri khusus yaitu memiliki 3 buah patil, kumis, dan tubuh yang tidak memiliki sisik. Ikan jenis lundu ini hampir mirip bentuk tubuhnya dengan ikan sembilang, hanya saja ikan keting memiliki ukuran yang lebih kecil dan mempunyaui ekor bercabang dua. Ikan keting memiliki banyak nama seperti : ikan penyengat, ririgi, kating, ndaringan, kelibere ikan tedon, senggiringan, dan lain-lain tergantung pada species dan sebutan didaerahnya berada.</p>\r\n\r\n<p style=\"text-align:justify\">Ikan lundu banyak dijumpai di rawa, muara, sungai, waduk dan danau. Ikan lundu menyebar hampir diseluruh perairan Indonesia dan ikan lundu suka hidup didasar air. Ikan lundu adalah binatang omnivora dan terkenal sangat rakus dalam memangsanya yang berada disekitarnya. Biasanya ikan lundu dapat ditemui pada siang dan malam hari karena ikan lundu tidak memiliki batas waktu untuk beraktifitas. Pada saat banjir ikan lundu akan bermigrasi ke sungai dan kemudian akan kembali lagi kemuara ketika hujan mulai turun</p>\r\n\r\n<p><strong>Cara Budidaya Ikan Lundu</strong></p>\r\n\r\n<p>1.Pilihlah indukan yang berkualitas&nbsp;<br />\r\n2.Pembuatan kolam untuk tempat tinggal dan perkawinan yang bersih&nbsp;<br />\r\n3.Perhatikan dengan seksama tahap pemijahan&nbsp;<br />\r\n4. Jaga kualitas air&nbsp;<br />\r\n5.Mengganti air seminggu sekali&nbsp;<br />\r\n6.Pembatasan jumlah ikan dalam kolam&nbsp;<br />\r\n7.perhatikan kadar keasaman kolam air</p>\r\n\r\n<p><strong>Ikan Lundu terdapat di beberapa kecamatan</strong></p>\r\n\r\n<p>1. Kecamatan&nbsp;Pancoran Mas<br />\r\n2. Kecamatan Cilodong</p>\r\n', 12, NULL, 1, '09032018004017951900.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-09-03 01:54:33', 22, '2018-09-03 07:40:17'),
(58, 'Ikan Mujair Air Tawar', 'Ikan Konsumsi Air Tawar', '<p style=\"text-align:justify\">Ikan Mujair dianggap sebagai salah satu jenis ikan air tawar yang cukup invasif, karena sangat adaptif dan perkembangbiakannya sangat pesat pada beberapa daerah tertentu, sehingga mampu mengganggu ekosistem yang ada. Para pembudidaya ikan air tawar juga menganggap ikan mujair sebagai ikan hama, karena ikan-ikan menjadi kompetitor dalam hal makanan.</p>\r\n\r\n<p style=\"text-align:justify\">Ikan mujair merupakan salah satu jenis ikan air tawar yang mempunyai rasa daging yang lezat apabila diolah dengan baik. Ikan mujair biasanya hidup di telaga, waduk, rawa-rawa dan juga di dalam kolam petani ikan. Karena perkembangbiakannya sangat pesat, sehingga membuat harga ikan mujair cukup terjangkau.</p>\r\n\r\n<p><strong>Cara Budidaya Ikan Mujair</strong></p>\r\n\r\n<p>1.Pilihlah indukan yang berkualitas&nbsp;<br />\r\n2.Pembuatan kolam untuk tempat tinggal dan perkawinan yang bersih&nbsp;<br />\r\n3.Perhatikan dengan seksama tahap pemijahan&nbsp;<br />\r\n4. Jaga kualitas air&nbsp;<br />\r\n5.Mengganti air seminggu sekali&nbsp;<br />\r\n6.Pembatasan jumlah ikan dalam kolam&nbsp;<br />\r\n7.perhatikan kadar keasaman kolam air</p>\r\n\r\n<p><strong>Ikan Mujair terdapat di beberapa kecamatan</strong></p>\r\n\r\n<ol>\r\n	<li>Kecamatan&nbsp;Cipayung</li>\r\n	<li>Kecamatan Limo</li>\r\n</ol>\r\n', 12, NULL, 1, '09022018185556606400.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-09-03 01:55:56', 22, '2018-09-03 07:41:26'),
(59, 'Ikan Nila Merah', '', '<p style=\"text-align:justify\">kan Nila maupun ikan mujaer adalah ikan air tawar yang memiliki rasa daging cukup lezat, serta memiliki berbagai macam manfaat untuk kesehatan kita, seperti: dalam membantu mengurangi berat badan, mempercepat perbaikan dan pertumbuhan seluruh tubuh, meningkatkan kesehatan rambut, meningkatkan metabolisme tubuh, mengurangi risiko berbagai penyakit kronis, menurunkan kadar trigliserida, membangun tulang yang kuat, mencegah penurunan kognitif, mencegah arthritis, &nbsp;mencegah berbagai jenis kanker, mengurangi tanda-tanda penuaan, dan memperkuat sistem kekebalan tubuh Anda</p>\r\n\r\n<p><strong>Cara Budidaya Ikan Nila Merah</strong></p>\r\n\r\n<p>1.Pilihlah indukan yang berkualitas&nbsp;<br />\r\n2.Pembuatan kolam untuk tempat tinggal dan perkawinan yang bersih&nbsp;<br />\r\n3.Perhatikan dengan seksama tahap pemijahan&nbsp;<br />\r\n4. Jaga kualitas air&nbsp;<br />\r\n5.Mengganti air seminggu sekali&nbsp;<br />\r\n6.Pembatasan jumlah ikan dalam kolam&nbsp;<br />\r\n7.perhatikan kadar keasaman kolam air</p>\r\n\r\n<p><strong>Ikan Nila Merah terdapat di beberapa kecamatan</strong></p>\r\n\r\n<ol>\r\n	<li>Kecamatan&nbsp;Cipayung</li>\r\n	<li>Kecamatan Limo</li>\r\n</ol>\r\n', 12, NULL, 1, '09022018185744993700.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-09-03 01:57:44', 22, '2018-09-03 07:42:07'),
(60, 'Kecamatan Cinere', 'Kecamatan Cinere', '<p>Kecamatan Cinere merupakan salah satu dari 11 Kecamatan yang ada di Kota Depok. Kecamatan Cinere merupakan pemerkaran dari wilayah Kecamatan Limo sejak tanggal 30 November 2009 yang terdiri dari 4 Kelurahan, yaitu :</p>\r\n\r\n<ul>\r\n	<li>Kelurahan Cinere</li>\r\n	<li>Kelurahan Gandul</li>\r\n	<li>Kelurahan Pangkalan Jati</li>\r\n	<li>Kelurahan Pangkalanjati Baru</li>\r\n</ul>\r\n', 13, NULL, 1, '09022018225412003000.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-09-03 05:54:12', 0, '0000-00-00 00:00:00'),
(61, 'Kecamatan Cipayung', 'Kecamatan Cipayung', '<p>Kecamatan Cipayung dibentuk pada tanggal 30 Oktober 2009 berdasarkan Peraturan Daerah Nomor 08 Tahun 2007 tentang Pembentukan Kecamatan di Kota Depok.<br />\r\nKecamatan Cipayung berjarak&nbsp;+&nbsp;30 Km dari Pusat Ibukota Jakarta, berjarak&nbsp;+&nbsp;130 Km Pemerintahan Ibukota Propinsi, dan Berjarak&nbsp;+&nbsp;5 Km dari Pusat Pemerintahan Kota Depok</p>\r\n\r\n<p>Kecamatan Cipayung terdiri dari 5 Kelurahan, yaitu;</p>\r\n\r\n<ul>\r\n	<li>Kelurahan Cipayung</li>\r\n	<li>Kelurahan Cipayung Jaya</li>\r\n	<li>Kelurahan Bojong Pondok Terong</li>\r\n	<li>Kelurahan Ratu Jaya</li>\r\n	<li>Kelurahan Pondok Jaya</li>\r\n</ul>\r\n', 13, NULL, 1, '09022018230217327500.png', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-09-03 06:02:17', 0, '0000-00-00 00:00:00'),
(62, 'Kecamatan Limo', 'Kecamatan Limo', '<p>Kecamatan Limo dibentuk berdasarkan Peraturan Pemerintah (PP) Nomor 31 Tahun 1992 tanggal 24 Januari 1992 dan Undang-undang (UU) Nomor 15 tahun 1999 tentang Pembentukan Kota Depok.<br />\r\n&nbsp;</p>\r\n\r\n<p>Secara geografis, luas wilayah Kecamatan Limo&nbsp;&nbsp; 1.529 Ha, dengan batas wilayah sebagai berikut :</p>\r\n\r\n<p>&bull; Sebelah Barat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : Berbatasan dengan&nbsp; Kecamatan Sawangan</p>\r\n\r\n<p>&bull; Sebelah Timur&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : Berbatasan dengan Kecamatan Beji</p>\r\n\r\n<p>&bull; Sebelah Utara&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; : Berbatasan dengan Kecamatan Cinere</p>\r\n\r\n<p>&bull; Sebelah Selatan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : Berbatasan dengan Kecamatan Pancoran Mas</p>\r\n\r\n<p>Kantor Kecamatan Limo berkedudukan di Jl. Raya Limo No. 44 Depok, Kode Pos 16531, dan meliputi 4 Kelurahan, yaitu;</p>\r\n\r\n<ul>\r\n	<li>Kelurahan Limo</li>\r\n	<li>Kelurahan Meruyung</li>\r\n	<li>Kelurahan Grogol</li>\r\n	<li>Kelurahan Krukut</li>\r\n</ul>\r\n', 13, NULL, 1, '09022018230821125300.jpeg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-09-03 06:08:21', 0, '0000-00-00 00:00:00'),
(63, 'Kecamatan Pancoran Mas', 'Kecamatan Pancoran Mas', '<p>Kecamatan Pancoran Mas terletak di&nbsp;Jl. Kartini No. 9 Depok, Telepon 021-77200537 Kode Pos 16413<br />\r\nKecamatan Pancoran Mas, membawahi&nbsp; 6 (enam) Kelurahan, yaitu sebagai berikut :</p>\r\n\r\n<ul>\r\n	<li>Kelurahan Depok</li>\r\n	<li>Kelurahan Depok Jaya;</li>\r\n	<li>&nbsp;Kelurahan Pancoran Mas;</li>\r\n	<li>Kelurahan Mampang;</li>\r\n	<li>Kelurahan Rangkapan Jaya;</li>\r\n	<li>Kelurahan Rangkapan Jaya Baru</li>\r\n</ul>\r\n', 13, NULL, 1, '09022018231249389800.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-09-03 06:12:49', 0, '0000-00-00 00:00:00'),
(64, 'Kecamatan Sawangan', 'Kecamatan Sawangan', '<p>Luas Wilayah Kecamatan Sawangan mencapai 4.671,20 KM2 dan luas area sekitar 2.928,93 Ha. Dengan ketinggian Wilayah dari permukan laut berkisar 50 s/d 60 m, dengan permukaan tanah yang relatif datar dan tidak berbukit-bukit. Pola penggunaan tanah secara garis besar terdiri dari :</p>\r\n\r\n<p>&bull; Perumahan : 695 Ha (23,73 %)<br />\r\n&bull; Industri : -<br />\r\n&bull; Pekarangan : 1.165 Ha (39,78 %)<br />\r\n&bull; Sawah : 211 Ha (7,20 %)<br />\r\n&bull; Ladang : 92.5 Ha (3,16 %)<br />\r\n&bull; Kuburan : 37 Ha (1,26 %)<br />\r\n&bull; Lain-lainnya : 728,43 Ha (24,87 %)</p>\r\n\r\n<p>Kecamatan Sawangan meliputi 7 Kelurahan, yaitu;</p>\r\n\r\n<ul>\r\n	<li>Kelurahan Sawangan</li>\r\n	<li>Kelurahan Kedaung</li>\r\n	<li>Kelurahan Cinangka</li>\r\n	<li>Kelurahan Sawangan Baru</li>\r\n	<li>Kelurahan Bedahan</li>\r\n	<li>Kelurahan Pengasinan</li>\r\n	<li>Kelurahan Pasir Putih</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n', 13, NULL, 1, '09022018232458461900.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-09-03 06:24:58', 0, '0000-00-00 00:00:00'),
(65, 'Kecamatan Tapos', 'Kecamatan Tapos', '<p style=\"text-align:justify\">Kecamatan Tapos adalah Organisasi Perangkat Daerah (OPD) yang termasuk pecahan wilayah dari Kecamatan Cimanggis dimana sebelumnya Kecamatan Cimanggis memiliki 13 Kelurahan yang dinilai harus dipecah agar dapat mengkondisikan perkembangan penduduk yang membutuhkan pelayanan yang efektif dan efisien dari pemerintahannya.</p>\r\n\r\n<p style=\"text-align:justify\">Pemerintahan Kecamatan Tapos memulai eksistensinya pada akhir tahun 2009 dengan memiliki 7 kantor Kelurahan yang membawahi pemerintahannya dalam melayani masyarakat dimana masing-masing Kelurahan itu adalah :</p>\r\n\r\n<ul>\r\n	<li>Kelurahan Tapos</li>\r\n	<li>Kelurahan Leuwinanggung</li>\r\n	<li>Kelurahan Cimpaeun</li>\r\n	<li>Kelurahan Cilangkap</li>\r\n	<li>Kelurahan Sukatani</li>\r\n	<li>Kelurahan Sukamaju Baru</li>\r\n	<li>Kelurahan Jatijajar</li>\r\n</ul>\r\n', 13, NULL, 1, '09022018232901507900.jpg', '', '', NULL, '0000-00-00 00:00:00', 0, 22, '2018-09-03 06:29:01', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_component_page`
--

CREATE TABLE `tbl_component_page` (
  `id_component_page` smallint(6) NOT NULL,
  `id_pages` smallint(6) DEFAULT NULL,
  `id_template` smallint(6) DEFAULT NULL,
  `hdr_template` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pages`
--

CREATE TABLE `tbl_pages` (
  `id_pages` smallint(6) NOT NULL,
  `nm_page` varchar(35) DEFAULT NULL,
  `main_page` varchar(1) DEFAULT NULL,
  `is_active` varchar(1) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` tinyint(4) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_pages`
--

INSERT INTO `tbl_pages` (`id_pages`, `nm_page`, `main_page`, `is_active`, `create_date`, `create_by`, `update_date`, `update_by`) VALUES
(1, 'Halaman Utama', 'Y', 'Y', '2018-09-02 17:47:50', 22, NULL, NULL),
(38, 'Detail Trending', 'N', NULL, '2018-09-02 11:49:38', 22, NULL, NULL),
(44, 'Detail Gallery', 'N', NULL, '2018-09-03 01:14:53', 22, NULL, NULL),
(45, 'Detail News', 'N', NULL, '2018-09-02 17:08:24', 22, NULL, NULL),
(46, 'Budidaya Ikan Hias', 'Y', NULL, '2018-09-02 21:02:16', 22, NULL, NULL),
(47, 'Budidaya Ikan Konsumsi', 'Y', NULL, '2018-09-03 01:58:58', 22, NULL, NULL),
(48, 'Detail Budidaya Ikan Hias', 'N', NULL, '2018-09-02 21:10:23', 22, NULL, NULL),
(49, 'Kecamatan Beji', 'Y', NULL, '2018-09-02 21:22:16', 22, NULL, NULL),
(50, 'Kecamatan Bojong Sari', 'Y', NULL, '2018-09-03 00:08:15', 22, NULL, NULL),
(51, 'Kecamatan Cilodong', 'Y', NULL, '2018-09-03 00:24:23', 22, NULL, NULL),
(52, 'Kecamatan Cimanggis', 'Y', NULL, '2018-09-03 01:20:11', 22, NULL, NULL),
(53, 'Kecamatan Cinere', 'Y', NULL, '2018-09-03 05:56:09', 22, NULL, NULL),
(54, 'Kecamatan Cipayung', 'Y', NULL, '2018-09-03 06:05:18', 22, NULL, NULL),
(55, 'Kecamatan Pancoran Mas', 'Y', NULL, '2018-09-03 06:15:17', 22, NULL, NULL),
(56, 'Kecamatan Sawangan', 'Y', NULL, '2018-09-03 06:26:42', 22, NULL, NULL),
(57, 'Kecamatan Tapos', 'Y', NULL, '2018-09-03 06:31:04', 22, NULL, NULL),
(59, 'Detail Budidaya Ikan Konsumsi', 'N', NULL, '2018-09-03 07:35:51', 22, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_page_template`
--

CREATE TABLE `tbl_page_template` (
  `id_page_template` smallint(6) NOT NULL,
  `id_pages` smallint(6) DEFAULT NULL,
  `id_template` smallint(6) DEFAULT NULL,
  `default_template` varchar(35) DEFAULT NULL,
  `detail_of` smallint(6) DEFAULT NULL,
  `template_used` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_page_template`
--

INSERT INTO `tbl_page_template` (`id_page_template`, `id_pages`, `id_template`, `default_template`, `detail_of`, `template_used`) VALUES
(56, 38, 1, '1|3', 1, 9),
(80, 45, 6, '1|2|3', 6, 9),
(81, 1, 1, NULL, NULL, NULL),
(82, 1, 2, NULL, NULL, NULL),
(83, 1, 3, NULL, NULL, NULL),
(84, 1, 4, NULL, NULL, NULL),
(85, 1, 5, NULL, NULL, NULL),
(86, 1, 6, NULL, NULL, NULL),
(87, 1, 8, NULL, NULL, NULL),
(96, 46, 1, NULL, NULL, NULL),
(97, 46, 2, NULL, NULL, NULL),
(98, 46, 3, NULL, NULL, NULL),
(99, 46, 11, NULL, NULL, NULL),
(108, 48, 11, '1|2|3', 11, 9),
(109, 49, 1, NULL, NULL, NULL),
(110, 49, 2, NULL, NULL, NULL),
(111, 49, 3, NULL, NULL, NULL),
(112, 49, 13, NULL, NULL, NULL),
(113, 49, 11, NULL, NULL, NULL),
(114, 49, 5, NULL, NULL, NULL),
(121, 50, 1, NULL, NULL, NULL),
(122, 50, 2, NULL, NULL, NULL),
(123, 50, 3, NULL, NULL, NULL),
(124, 50, 13, NULL, NULL, NULL),
(125, 50, 11, NULL, NULL, NULL),
(126, 50, 5, NULL, NULL, NULL),
(133, 51, 1, NULL, NULL, NULL),
(134, 51, 2, NULL, NULL, NULL),
(135, 51, 3, NULL, NULL, NULL),
(136, 51, 13, NULL, NULL, NULL),
(137, 51, 11, NULL, NULL, NULL),
(138, 51, 5, NULL, NULL, NULL),
(172, 44, 5, '1|2|3', 5, 9),
(173, 52, 1, NULL, NULL, NULL),
(174, 52, 2, NULL, NULL, NULL),
(175, 52, 3, NULL, NULL, NULL),
(176, 52, 13, NULL, NULL, NULL),
(177, 52, 5, NULL, NULL, NULL),
(178, 52, 11, NULL, NULL, NULL),
(191, 47, 1, NULL, NULL, NULL),
(192, 47, 2, NULL, NULL, NULL),
(193, 47, 3, NULL, NULL, NULL),
(194, 47, 12, NULL, NULL, NULL),
(195, 53, 1, NULL, NULL, NULL),
(196, 53, 2, NULL, NULL, NULL),
(197, 53, 3, NULL, NULL, NULL),
(198, 53, 13, NULL, NULL, NULL),
(199, 53, 11, NULL, NULL, NULL),
(200, 53, 5, NULL, NULL, NULL),
(201, 54, 1, NULL, NULL, NULL),
(202, 54, 2, NULL, NULL, NULL),
(203, 54, 3, NULL, NULL, NULL),
(204, 54, 13, NULL, NULL, NULL),
(205, 54, 11, NULL, NULL, NULL),
(206, 54, 5, NULL, NULL, NULL),
(207, 55, 1, NULL, NULL, NULL),
(208, 55, 2, NULL, NULL, NULL),
(209, 55, 3, NULL, NULL, NULL),
(210, 55, 13, NULL, NULL, NULL),
(211, 55, 11, NULL, NULL, NULL),
(212, 55, 5, NULL, NULL, NULL),
(219, 56, 1, NULL, NULL, NULL),
(220, 56, 2, NULL, NULL, NULL),
(221, 56, 3, NULL, NULL, NULL),
(222, 56, 13, NULL, NULL, NULL),
(223, 56, 11, NULL, NULL, NULL),
(224, 56, 5, NULL, NULL, NULL),
(231, 57, 1, NULL, NULL, NULL),
(232, 57, 2, NULL, NULL, NULL),
(233, 57, 3, NULL, NULL, NULL),
(234, 57, 13, NULL, NULL, NULL),
(235, 57, 11, NULL, NULL, NULL),
(236, 57, 5, NULL, NULL, NULL),
(242, 59, 12, '1|2|3', 12, 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_template_page_article`
--

CREATE TABLE `tbl_template_page_article` (
  `id_pages_template` smallint(6) NOT NULL,
  `id_pages` smallint(6) DEFAULT NULL,
  `id_template` smallint(6) DEFAULT NULL,
  `id_article` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_template_page_article`
--

INSERT INTO `tbl_template_page_article` (`id_pages_template`, `id_pages`, `id_template`, `id_article`) VALUES
(124, 38, 1, '23'),
(125, 38, 3, '17'),
(205, 45, 1, '23'),
(206, 45, 2, '44'),
(207, 45, 3, '17'),
(208, 1, 1, '23'),
(209, 1, 2, '44'),
(210, 1, 3, '17'),
(211, 1, 4, '18,19,20'),
(212, 1, 5, '23,24,25,26,27'),
(213, 1, 6, '27,35,36,38,46'),
(214, 1, 8, ''),
(223, 46, 1, '23'),
(224, 46, 2, '44'),
(225, 46, 3, '17'),
(226, 46, 11, '39,40,41,42'),
(235, 48, 1, '23'),
(236, 48, 2, '44'),
(237, 48, 3, '17'),
(238, 49, 1, '23'),
(239, 49, 2, '44'),
(240, 49, 3, '17'),
(241, 49, 13, '47'),
(242, 49, 11, '39,40,41,42'),
(243, 49, 5, '23,24,25,26,27'),
(250, 50, 1, '23'),
(251, 50, 2, '44'),
(252, 50, 3, '17'),
(253, 50, 13, '48'),
(254, 50, 11, '39,40,41,42'),
(255, 50, 5, '23,24,25,26,27'),
(262, 51, 1, '23'),
(263, 51, 2, '44'),
(264, 51, 3, '17'),
(265, 51, 13, '49'),
(266, 51, 11, '39,40,41,42'),
(267, 51, 5, '23,24,25,26,27'),
(301, 44, 1, '23'),
(302, 44, 2, '44'),
(303, 44, 3, '17'),
(304, 52, 1, '23'),
(305, 52, 2, '44'),
(306, 52, 3, '17'),
(307, 52, 13, '50'),
(308, 52, 5, '52'),
(309, 52, 11, '39,40,41,42'),
(322, 47, 1, '23'),
(323, 47, 2, '44'),
(324, 47, 3, '17'),
(325, 47, 12, '43,53,54,55,56,57,58,59'),
(326, 53, 1, '23'),
(327, 53, 2, '44'),
(328, 53, 3, '17'),
(329, 53, 13, '60'),
(330, 53, 11, '39,40,41,42'),
(331, 53, 5, '23,24,25,26,27'),
(332, 54, 1, '23'),
(333, 54, 2, '44'),
(334, 54, 3, '17'),
(335, 54, 13, '61'),
(336, 54, 11, '39,40,41,42'),
(337, 54, 5, '23,24,25,26,27'),
(338, 55, 1, '23'),
(339, 55, 2, '44'),
(340, 55, 3, '17'),
(341, 55, 13, '63'),
(342, 55, 11, '39,40,41,42'),
(343, 55, 5, '23,24,25,26,27'),
(350, 56, 1, '23'),
(351, 56, 2, '44'),
(352, 56, 3, '17'),
(353, 56, 13, '64'),
(354, 56, 11, '39,40,41,42'),
(355, 56, 5, '23,24,25,26,27'),
(362, 57, 1, '23'),
(363, 57, 2, '44'),
(364, 57, 3, '17'),
(365, 57, 13, '65'),
(366, 57, 11, '39,40,41,42'),
(367, 57, 5, '23,24,25,26,27'),
(375, 59, 1, '23'),
(376, 59, 2, '44'),
(377, 59, 3, '17');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `reff_article_type`
--
ALTER TABLE `reff_article_type`
  ADD PRIMARY KEY (`id_article_type`);

--
-- Indeks untuk tabel `reff_file_type`
--
ALTER TABLE `reff_file_type`
  ADD PRIMARY KEY (`id_file_type`);

--
-- Indeks untuk tabel `reff_kecamatan`
--
ALTER TABLE `reff_kecamatan`
  ADD PRIMARY KEY (`id_kecamatan`);

--
-- Indeks untuk tabel `reff_template`
--
ALTER TABLE `reff_template`
  ADD PRIMARY KEY (`id_template`);

--
-- Indeks untuk tabel `sys_admin_menu`
--
ALTER TABLE `sys_admin_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indeks untuk tabel `sys_front_menu`
--
ALTER TABLE `sys_front_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indeks untuk tabel `sys_menu_role`
--
ALTER TABLE `sys_menu_role`
  ADD PRIMARY KEY (`id_user_role`),
  ADD KEY `roles_id` (`roles_id`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indeks untuk tabel `sys_roles`
--
ALTER TABLE `sys_roles`
  ADD PRIMARY KEY (`roles_id`),
  ADD UNIQUE KEY `IX_NAME` (`roles_name`);

--
-- Indeks untuk tabel `sys_settings`
--
ALTER TABLE `sys_settings`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indeks untuk tabel `sys_users`
--
ALTER TABLE `sys_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `USER_NAME` (`user_name`) USING BTREE;

--
-- Indeks untuk tabel `tbl_article`
--
ALTER TABLE `tbl_article`
  ADD PRIMARY KEY (`id_article`);

--
-- Indeks untuk tabel `tbl_component_page`
--
ALTER TABLE `tbl_component_page`
  ADD PRIMARY KEY (`id_component_page`);

--
-- Indeks untuk tabel `tbl_pages`
--
ALTER TABLE `tbl_pages`
  ADD PRIMARY KEY (`id_pages`);

--
-- Indeks untuk tabel `tbl_page_template`
--
ALTER TABLE `tbl_page_template`
  ADD PRIMARY KEY (`id_page_template`);

--
-- Indeks untuk tabel `tbl_template_page_article`
--
ALTER TABLE `tbl_template_page_article`
  ADD PRIMARY KEY (`id_pages_template`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `reff_article_type`
--
ALTER TABLE `reff_article_type`
  MODIFY `id_article_type` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `reff_file_type`
--
ALTER TABLE `reff_file_type`
  MODIFY `id_file_type` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `reff_kecamatan`
--
ALTER TABLE `reff_kecamatan`
  MODIFY `id_kecamatan` smallint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT untuk tabel `reff_template`
--
ALTER TABLE `reff_template`
  MODIFY `id_template` smallint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `sys_admin_menu`
--
ALTER TABLE `sys_admin_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `sys_front_menu`
--
ALTER TABLE `sys_front_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `sys_menu_role`
--
ALTER TABLE `sys_menu_role`
  MODIFY `id_user_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT untuk tabel `sys_roles`
--
ALTER TABLE `sys_roles`
  MODIFY `roles_id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `sys_users`
--
ALTER TABLE `sys_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT untuk tabel `tbl_article`
--
ALTER TABLE `tbl_article`
  MODIFY `id_article` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT untuk tabel `tbl_pages`
--
ALTER TABLE `tbl_pages`
  MODIFY `id_pages` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT untuk tabel `tbl_page_template`
--
ALTER TABLE `tbl_page_template`
  MODIFY `id_page_template` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT untuk tabel `tbl_template_page_article`
--
ALTER TABLE `tbl_template_page_article`
  MODIFY `id_pages_template` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=378;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
