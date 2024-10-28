-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Okt 2024 pada 07.34
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
-- Database: `book_store_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `books`
--

CREATE TABLE `books` (
  `id` int(30) NOT NULL,
  `category_ids` text NOT NULL,
  `title` varchar(200) NOT NULL,
  `author` text NOT NULL,
  `description` text NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL,
  `image_path` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `books`
--

INSERT INTO `books` (`id`, `category_ids`, `title`, `author`, `description`, `qty`, `price`, `image_path`, `date_created`) VALUES
(3, '5', 'Jojo Bizzare Adventure', 'Araki Sensei', 'pertualanagn Jojo yang aneh,yang menceritakan tentang jonathan joestar ,anak tunggal dari kelaurga joestar', 0, 20000, '1721708520_818fOuBHTnL._AC_UF1000,1000_QL80_.jpg', '2024-07-23 11:22:24'),
(4, '2', 'Mennjadi programmer handal', 'Drs.Afrizal zein', 'Disini Kita bisa Mempelajari Dasar Dasar programming serta tips untuk enjadi programme handal', 0, 50000, '1721776320_BLK_PMPH1671425087797.jpg', '2024-07-23 13:53:06'),
(5, '7', 'Junji Ito: Uzumaki', 'Junji Ito', 'ihh takutnyee\r\n', 0, 89000, '1721776500_images (1).jpeg', '2024-07-24 06:15:22'),
(6, '5,3', 'Shikanokonoko koshintantan', 'Oshioshio', 'ikanoko Nokonoko Koshitantan) merupakan serial manga berbahasa Jepang yang ditulis dan digambar oleh Oshioshio. Manga ini memulai serialisasinya di majalah manga shōnen milik Kodansha yang bernama Shōnen Magazine Edge pada bulan November 2019. Setelah majalah tersebut dibubarkan pada bulan Oktober 2023, majalah tersebut dipindahkan ke situs web Magazine Pocket pada bulan Desember tahun yang sama. Sebuah adaptasi anime televisi dibuat oleh Wit Studio dan dirancang untuk tayang perdana pada bulan Juli 2024.', 0, 90000, '1721805240_My_Deer_Friend_Nokotan_volume_1_cover.jpg', '2024-07-24 14:13:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `book_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `price` float NOT NULL,
  `customer_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`id`, `book_id`, `qty`, `price`, `customer_id`) VALUES
(15, 3, 1, 20000, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'Educational', 'Educational'),
(2, 'Programming', 'ayo belajar programming'),
(3, 'Fantasy', 'Fantasy'),
(4, 'Business', 'Business'),
(5, 'Comics', 'Fun\r\n'),
(7, 'horror', 'ihh takutnyee');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `contact` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`id`, `name`, `address`, `contact`, `email`, `password`, `date_created`) VALUES
(1, 'John Smith', 'Sample adddedress', '+18456-5455-55', 'jsmith@sample.com', 'ba984cb106d5bcead9bfe67344b89a2a', '2020-11-06 12:59:12'),
(2, 'Hanif Mulyana Putra', 'Jln.P.Komarudin RT.015/RW.005 No.440', '085718900675', 'mulyanaputrahanif@gmail.com', '6b30d8110b006a477ec4d9179ec0e057', '2024-07-23 11:07:47'),
(3, 'Jamaro David Saragih', 'Rusunawa Cipinang Besar Selatan', '081380845935', 'jamaro123@gmail.com', '0d7459197b2aaed195a8f00c3a966737', '2024-07-23 13:48:11'),
(4, 'Imam', 'Gg.Hj.Fathimah', '081380845935', 'fariz12@gmail.com', 'a00e5eb0973d24649a4a920fc53d9564', '2024-07-24 14:07:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `customer_id` int(30) NOT NULL,
  `address` text NOT NULL,
  `total_amount` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `address`, `total_amount`, `status`, `date_created`) VALUES
(5, 2, 'Jln.P.Komarudin RT.015/RW.005 No.440', 0, 1, '2024-07-24 06:31:24'),
(6, 2, 'Jln.P.Komarudin RT.015/RW.005 No.440', 0, 1, '2024-07-24 06:34:30'),
(7, 2, 'Jln.P.Komarudin RT.015/RW.005 No.440', 0, 1, '2024-07-24 11:18:59'),
(8, 2, 'Jln.P.Komarudin RT.015/RW.005 No.440', 0, 0, '2024-07-24 12:11:08'),
(9, 4, 'Gg.Hj.Fathimah', 0, 0, '2024-07-24 14:08:26'),
(10, 2, 'Jln.P.Komarudin RT.015/RW.005 No.440', 0, 0, '2024-07-24 14:21:43'),
(11, 2, 'Jln.P.Komarudin RT.015/RW.005 No.440', 0, 0, '2024-07-25 16:01:54'),
(12, 2, 'Jln.P.Komarudin RT.015/RW.005 No.440', 0, 0, '2024-07-25 20:51:08'),
(13, 1, 'kontol', 0, 1, '2024-09-29 12:43:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `book_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `book_id`, `qty`, `price`) VALUES
(6, 5, 5, 2, 89000),
(7, 6, 5, 1, 89000),
(8, 7, 3, 1, 20000),
(9, 8, 3, 1, 20000),
(10, 9, 3, 2, 20000),
(11, 10, 4, 1, 50000),
(12, 10, 5, 1, 89000),
(13, 11, 5, 1, 89000),
(14, 12, 3, 2, 20000),
(15, 13, 3, 2, 20000),
(16, 13, 5, 1, 89000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'BookStore', 'mulyanaputrahanif@gmail.com', '+62857-1890-0675', '', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div data-message-author-role=&quot;assistant&quot; data-message-id=&quot;f6acfd8c-82b7-449b-9ea3-ba9d4d0c4277&quot; dir=&quot;auto&quot;&gt;&lt;p style=&quot;text-align: center;&quot;&gt;A bookstore is a place that offers a wide variety of books for sale to the public. In a bookstore, customers can find a range of genres from fiction and non-fiction to textbooks, reference materials, magazines, and comics. In addition to selling books, many bookstores provide additional services such as ordering rare books, hosting book launches and discussions, and offering comfortable reading areas. With the advancement of technology, many bookstores also have online platforms, making it easier for customers to search for and purchase books without having to visit the store in person. Bookstores serve as a bridge between authors and readers and as centers of literacy and culture within the community.&lt;/p&gt;&lt;/div&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 36px;&quot;&gt;Here Is The Video About BookStore&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;span class=&quot;fr-video fr-deletable fr-fvc fr-draggable fr-fvr fr-dvb&quot; contenteditable=&quot;false&quot; draggable=&quot;true&quot;&gt;&lt;iframe src=&quot;https://www.youtube.com/embed/lIW5jBrrsS0??feature=sharedautoplay=1&amp;wmode=opaque&amp;rel=0&quot; frameborder=&quot;0&quot; allowfullscreen=&quot;&quot; class=&quot;fr-draggable&quot; style=&quot;width: 1164px; height: 535px;&quot;&gt;&lt;/iframe&gt;&lt;/span&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;br&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1=Admin,2=Staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'admin', 'admin', '0192023a7bbd73250516f069df18b500', 1),
(2, 'Fariz', 'Imam', 'a00e5eb0973d24649a4a920fc53d9564', 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `books`
--
ALTER TABLE `books`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
