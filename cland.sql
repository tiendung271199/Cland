-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 20, 2021 lúc 08:00 AM
-- Phiên bản máy phục vụ: 10.4.18-MariaDB
-- Phiên bản PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `cland`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `cid` int(10) UNSIGNED NOT NULL,
  `cname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`cid`, `cname`) VALUES
(2, 'Nhà đất cho thuê'),
(3, 'Cần thuê'),
(4, 'Cần mua'),
(5, 'Nhà đất không bán'),
(6, 'Nhà đất không bán đâu bạn nhé'),
(7, 'Nhà đất bán');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lands`
--

CREATE TABLE `lands` (
  `lid` int(10) UNSIGNED NOT NULL,
  `lname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateCreate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cid` int(10) UNSIGNED NOT NULL,
  `picture` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `countView` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `lands`
--

INSERT INTO `lands` (`lid`, `lname`, `description`, `dateCreate`, `cid`, `picture`, `area`, `address`, `countView`) VALUES
(1, 'Khu đô thị FPT City Đà Nẵng nay mở bán đất nền 695 triệu/nền', 'Khu đô thị FPT City Đà Nẵng - Ước mơ chắp cánh với một nơi an cư sinh thái trong lòng sinh thái. <br />\r\nBạn có biết điều gì đã xảy ra! Khu đô thị FPT City nay đã mở bán đất nền. Nơi Tận hưởng cuộc sống trong lành tại khu đô thị xanh ven sông, kề biển văn minh bậc nhất Đà Nẵng. <br />\r\nCơ hội sở hữu đất nền FPT City Đà Nẵng: <br />\r\n300 cơ hội vàng, giá hấp dẫn với 695 triệu/nền (tương đương từ 7tr - 8tr/m2). Diện tích đa dạng từ 90 - 105m2. Được ngân hàng TP Bank hỗ trợ chính sách vay. <br />\r\nSố lượng có hạn, khách hàng nhanh tay book quỹ hàng ngay hôm nay. <br />\r\n\r\nGiới thiệu phân khu mở bán đất nền FPT City Đà Nẵng: <br />\r\nVị trí mở bán là V1 (khu bắc) và V5 (khu tây)- Nơi đẹp nhất ngay trung tâm khu đô thị dễ dàng tiếp cận mọi tiện ích: Trường Đại Học FPT, trường Trung Học FPT, công viên xanh, khu TT giải trí. <br /><br />\r\n\r\nChính sách thanh toán linh hoạt dành cho khách hàng: <br />\r\nĐỢT 1: Giữ chỗ 50 triệu VNĐ. <br />\r\nĐỢT 2: Thanh toán 50% (ký hợp đồng đặt cọc) - 15 ngày sau đợt 1. <br />\r\nĐỢT 3: Thanh toán đủ 100% (ký hợp đồng chuyển nhượng) - 120 ngày sau đợt 1. <br />\r\nĐỢT 4: Nhận sổ - 30 ngày sau đợt 3. <br />\r\n\r\nChương trình khuyến mãi: <br />\r\nƯu đãi quà tân gia: Xây nhà ngay, tặng liền móng 7o triệu. <br />\r\n\r\nKhu đô thị FPT City - tận hưởng cuộc sống xanh, tri thức, văn minh bậc nhất Đà Nẵng. <br />\r\nFPT City là giấc mơ đã thành hiện thực của Chủ tịch FPT Trương Gia Bình về một Thung lũng Silicon ở Việt Nam. <br />\r\nDự án được Công ty Cổ phần Đô thị FPT Đà Nẵng làm chủ đầu tư với tổng diện tích hơn 181 hécta, trong đó mật độ xây dựng chỉ chiếm 40%, 60% còn lại dành cho cây xanh và mặt nước, kiến tạo nên KĐT sinh thái thân thiện với môi trường và phát triển bền vững. <br />\r\nVị trí KĐT ngay trục giao thông chính: Võ Nguyên Giáp, Nam Kì Khởi Nghĩa, Võ Chí Công, Trần Đại Nghĩa. \r\nDự án ven sông Cổ Cò, nằm giữa 2 sân golf đẳng cấp quốc tế: BRG & Montgomerie Links, tiếp giáp hàng loạt Resort đẳng cấp 5* bên bờ biển Mỹ Khê tuyệt đẹp. Hạ tầng khu đô thị hoàn chỉnh bao gồm khu công viên, hồ nước, lối dạo bộ, hệ thống kênh nhân tạo. <br />\r\nBãi tăm tự nhiên - Bãi tắm Tân Trà, được quản lý bởi FPT City. <br />\r\nDự án được xây dựng với tổ hợp tiện ích nội khu hoàn hảo: Trường Đại học FPT, Trường Trung học FPT, Trường mẫu giáo FPT, FPT Complex, trung tâm thể thao và khu vui chợi trẻ em, bệnh viện quốc tế, hồ bơi. Là lời hứa mang đến cuộc sống an cư lạc nghiệp và nuôi dạy con trẻ lý tưởng.\"<br />', '2021-04-13 13:46:18', 7, 'hinh1.jpg', 105, 'Quận Ngũ Hành Sơn - Đà Nẵng\"', 130),
(2, 'Chính chủ cần bán ô đất 500m2 ở đường mới tại Phường Mỹ An, Quận Ngũ Hành Sơn, TP. Đà Nẵng', 'Chính chủ cần bán ô đất đường mới tại phường Mỹ An, quận Ngũ Hành Sơn, TP Đà Nẵng:<br/>- Cách đường Phan Tứ 30m, cách đường Võ Nguyên Giáp 120m, cách biển 150m;<br/>- Đã có sổ đỏ, phù hợp xây dựng khách sạn 3, 4 sao. Diện tích ô đất 500m2.<br/>- Khu vực tiếp đón nhiều khách du lịch.<br/>Do gia đình cần tiền lên bán gấp: Giá bán 24,8 tỷ.<br/><br/>Hiện tại gia đình ở Hà Nội, nếu cần có thể liên hệ với chú Dân: 01663039427 (chủ cửa hàng tạp hóa gần ô đất).<br/>Chình chủ: 0904990976 (Hà Nội).', '2021-04-13 13:46:20', 7, 'hinh2.jpg', 500, 'Phường Mỹ An - Quận Ngũ Hành Sơn - Đà Nẵng', 130),
(3, 'Bán đất biển đường Võ Nguyên Giáp chỉ từ 33 tr/m2. Tel 0932 592 598', 'Mở bán dự án SaPhia, dự án vàng trên bãi biển Kim Cương, mặt tiền chính đường Võ Nguyên Giáp. Cung đường biển 5* của Tp.Đà Nẵng<br/>Cách trung tâm hội nghị Apec 2017 500m<br/>- Mặt tiền Võ Nguyên Giáp, mặt sau Nguyễn Khắc Viện, đối diện bãi tắm Sơn Thủy - Đà Nẵng. - - Nằm cạnh sân bay nước mặn, được nhà đầu tư Malaysia mua lại và đầu tư khu đô thị Quốc Tế Đà Nẵng.<br/>- Đối diện Hyatt Regency Resort, sòng bài Crowne Palaza<br/>- Nằm gần khu du lịch tâm linh Ngũ Hành Sơn<br/>- Nằm giữa 2 bãi tắm Sơn Thủy<br/>Vị Trí: <br/>+ Phía Đông: Tiếp giáp với đường Võ Nguyên Giáp, các khu Resort 5* như Regency resort, Crowne Palaza, The Song resort, Fulama Villas…<br/>+ Phía Tây: Tiếp giáp với đường Nguyễn Khắc Viện<br/>+ Phía Nam: Tiếp giáp Trục đường Minh Mạng 48m<br/>+ Phía Bắc: Tiếp giáp với Sân bay nước mặn.<br/>Quy hoạch:<br/>+ Có quyết định 1/500 phê duyệt<br/>+ Gồm các Condotel, nhà phố liền kề, trường mầm non quốc tế<br/>+ Cung đường quy hoạch 13.5m và 20,5m<br/><br/>5.Lý do nên đầu tư tại saphia ngay thời điểm này? <br/>- SaPhia – Hội tụ đủ yếu tố của dự án tuyệt đẹp và đẳng cấp<br/>- SaPhia – Gía bán hấp dẫn, ổn định<br/>- SaPhia – Tiềm năng phát triển cực lớn<br/>- SaPhia – Đầu tư LỢI NHUẬN KHỦNG<br/>- SaPhia – Đầu tư siêu an toàn: chủ đầu tư uy tín<br/><br/>***** Siêu phẩm gia tăng giá trị mạnh nhất trong tương lai tại TP Đà Nẵng, được phân phối độc quyền bởi Cty CP BĐS Link House Miền Trung.<br/>Địa chỉ: 320 đường 2 tháng 9, Q.Hải Châu, Tp.Đà Nẵng<br/>Website: linkhousemientrung.com.vn<br/>LH: 0932 592 598', '2021-04-13 13:46:22', 7, 'hinh3.jpg', 1500, 'Đường Võ Nguyên Giáp - Quận Ngũ Hành Sơn - Đà Nẵng', 129),
(4, 'Thuê chung cư mini 2 pn khu Bắc Từ Liêm', 'Cần thuê gấp chung cư mini 2 phòng ngủ, đầy đủ nội thất cơ bản, sạch sẽ, gần trường Học Viện Tài Chính và Y Tế Công Cộng 3km đổ lại. Giá tầm 5,5tr đổ lại.', '2021-04-13 09:39:48', 3, 'hinh4.jpg', 90, 'Quận Bắc Từ Liêm - Hà Nội', 130),
(5, 'Bán đất xây dựng khách sạn đường Lâm Hoành 0918444053', 'Cần bán khu đất xây khách sạn tại đường Lâm Hoành, Quận Sơn Trà, TP Đà Nẵng.<br/>Diện tích: 695 m2.<br/>Vị trí nằm trong khu tập trung tổ hợp nhà hàng, khách sạn, dịch vụ du lịch tốt nhất của biển Đà Nẵng. <br/>Khu đất rộng, thích hợp xây khách sạn, vị trí đắc địa, tập trung nhiều khách sạn lớn.<br/>Giá bán: 75 triệu/m2.<br/>Giá bán chính chủ. Liên hệ: 0918444053.', '2021-04-13 13:46:24', 7, 'hinh5.jpg', 695, 'Đường Lâm Hoành - Quận Sơn Trà - Đà Nẵng', 133),
(6, 'Cho thuê đất đường Nguyễn Lương Bằng', 'Cho thuê đất đường Nguyễn Lương Bằng', '2021-04-13 09:42:37', 2, 'minato2_140679740752899.jpg', 100, '120 Nguyễn Lương Bằng', 507),
(8, 'Bán đất đường Trần Phú', 'Mô tả Bán đất đường Trần Phú', '2021-04-13 09:42:43', 4, 'VinaEnter_181442883662600.png', 240, '74/2 Trần Phú - Đà Nẵng', 510),
(9, 'Bán đất đường Ngô Thì Nhậm', 'Bán đất đường Ngô Thì Nhậm', '2021-04-13 13:46:26', 7, 'image1_264088661455000.jpg', 90, '65 Ngô Thì Nhậm - Đà Nẵng', 17);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_07_27_184804_create_categories_table', 1),
(4, '2017_07_27_184922_create_lands_table', 1),
(5, '2017_07_27_184938_create_vnecontact_table', 1),
(6, '2017_07_27_205208_update_lands_table', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rememberToken` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `fullname`, `rememberToken`, `password`) VALUES
(1, 'admin', 'Nguyễn Văn C', 'IDZqqi8YlUuKaUewLIh1LZR2l4cUfMPRnnA3kT7ZZ9tCcGMlwQoO4Be4ieBE', '$2y$10$Cf0gEBK/gRIVEpSa54HOyed9WKUSfJOofgd3l5OuSH80QeKjzq0F6'),
(2, 'mod', 'VinaEnter Edu', '', '$2y$10$GMqRL4w6DQN9ePEHbWsqo.5aSNe1eNCAnqdzTe1lNKusbsspIor6G'),
(3, 'user', 'Người dùng', '', '123456'),
(4, 'faker', 'Lee Sang Hyeok', NULL, '123456');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vnecontact`
--

CREATE TABLE `vnecontact` (
  `cid` int(10) UNSIGNED NOT NULL,
  `fullname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `vnecontact`
--

INSERT INTO `vnecontact` (`cid`, `fullname`, `email`, `subject`, `content`) VALUES
(1, 'Nguyễn Thị Hạnh', 'hanh@gmail.com', 'Phòng A1', 'Để bảo vệ giàn khoan, Trung Quốc đã điều thêm 17 tàu các loại so với hôm trước,\n		        sẵn sàng đâm va vào tàu Việt Nam.'),
(2, 'Phan Quốc Bảo', 'quocbao@gmail.com', 'Phòng A2', 'World Cup 2014 chưa đi hết lượt đầu vòng bảng nhưng các trọng tài đẳng cấp FIFA đã có tới bốn trận bị chỉ trích dữ dội.'),
(3, 'Nguyễn Văn Hòa', 'hoa@gmail.com', 'Phòng A3', 'Để bảo vệ giàn khoan, Trung Quốc đã điều thêm 17 tàu các loại so với hôm trước,\n		        sẵn sàng đâm va vào tàu Việt Nam.'),
(5, 'Bảo', 'bao@gmail.com', 'Nhà cho thuê', 'Test nhà cho thuê');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cid`);

--
-- Chỉ mục cho bảng `lands`
--
ALTER TABLE `lands`
  ADD PRIMARY KEY (`lid`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `vnecontact`
--
ALTER TABLE `vnecontact`
  ADD PRIMARY KEY (`cid`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `cid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `lands`
--
ALTER TABLE `lands`
  MODIFY `lid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `vnecontact`
--
ALTER TABLE `vnecontact`
  MODIFY `cid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
