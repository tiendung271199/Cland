-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 30, 2021 lúc 12:40 PM
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
(6, 'Nhà đất không bán đâu bạn'),
(7, 'Nhà đất bán'),
(10, 'Nhà đất cần bán ngay'),
(11, 'Cần bán');

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
(1, 'Khu đô thị FPT City Đà Nẵng nay mở bán đất nền 695 triệu/nền', 'Khu đô thị FPT City Đà Nẵng - Ước mơ chắp cánh với một nơi an cư sinh thái trong lòng sinh thái. <br />\r\nBạn có biết điều gì đã xảy ra! Khu đô thị FPT City nay đã mở bán đất nền. Nơi Tận hưởng cuộc sống trong lành tại khu đô thị xanh ven sông, kề biển văn minh bậc nhất Đà Nẵng. <br />\r\nCơ hội sở hữu đất nền FPT City Đà Nẵng: <br />\r\n300 cơ hội vàng, giá hấp dẫn với 695 triệu/nền (tương đương từ 7tr - 8tr/m2). Diện tích đa dạng từ 90 - 105m2. Được ngân hàng TP Bank hỗ trợ chính sách vay. <br />\r\nSố lượng có hạn, khách hàng nhanh tay book quỹ hàng ngay hôm nay. <br />\r\n\r\nGiới thiệu phân khu mở bán đất nền FPT City Đà Nẵng: <br />\r\nVị trí mở bán là V1 (khu bắc) và V5 (khu tây)- Nơi đẹp nhất ngay trung tâm khu đô thị dễ dàng tiếp cận mọi tiện ích: Trường Đại Học FPT, trường Trung Học FPT, công viên xanh, khu TT giải trí. <br /><br />\r\n\r\nChính sách thanh toán linh hoạt dành cho khách hàng: <br />\r\nĐỢT 1: Giữ chỗ 50 triệu VNĐ. <br />\r\nĐỢT 2: Thanh toán 50% (ký hợp đồng đặt cọc) - 15 ngày sau đợt 1. <br />\r\nĐỢT 3: Thanh toán đủ 100% (ký hợp đồng chuyển nhượng) - 120 ngày sau đợt 1. <br />\r\nĐỢT 4: Nhận sổ - 30 ngày sau đợt 3. <br />\r\n\r\nChương trình khuyến mãi: <br />\r\nƯu đãi quà tân gia: Xây nhà ngay, tặng liền móng 7o triệu. <br />\r\n\r\nKhu đô thị FPT City - tận hưởng cuộc sống xanh, tri thức, văn minh bậc nhất Đà Nẵng. <br />\r\nFPT City là giấc mơ đã thành hiện thực của Chủ tịch FPT Trương Gia Bình về một Thung lũng Silicon ở Việt Nam. <br />\r\nDự án được Công ty Cổ phần Đô thị FPT Đà Nẵng làm chủ đầu tư với tổng diện tích hơn 181 hécta, trong đó mật độ xây dựng chỉ chiếm 40%, 60% còn lại dành cho cây xanh và mặt nước, kiến tạo nên KĐT sinh thái thân thiện với môi trường và phát triển bền vững. <br />\r\nVị trí KĐT ngay trục giao thông chính: Võ Nguyên Giáp, Nam Kì Khởi Nghĩa, Võ Chí Công, Trần Đại Nghĩa. \r\nDự án ven sông Cổ Cò, nằm giữa 2 sân golf đẳng cấp quốc tế: BRG & Montgomerie Links, tiếp giáp hàng loạt Resort đẳng cấp 5* bên bờ biển Mỹ Khê tuyệt đẹp. Hạ tầng khu đô thị hoàn chỉnh bao gồm khu công viên, hồ nước, lối dạo bộ, hệ thống kênh nhân tạo. <br />\r\nBãi tăm tự nhiên - Bãi tắm Tân Trà, được quản lý bởi FPT City. <br />\r\nDự án được xây dựng với tổ hợp tiện ích nội khu hoàn hảo: Trường Đại học FPT, Trường Trung học FPT, Trường mẫu giáo FPT, FPT Complex, trung tâm thể thao và khu vui chợi trẻ em, bệnh viện quốc tế, hồ bơi. Là lời hứa mang đến cuộc sống an cư lạc nghiệp và nuôi dạy con trẻ lý tưởng.\"<br />', '2021-04-24 17:21:42', 7, 'hinh1.jpg', 105, 'Quận Ngũ Hành Sơn - Đà Nẵng\"', 131),
(2, 'Chính chủ cần bán ô đất 500m2 ở đường mới tại Phường Mỹ An, Quận Ngũ Hành Sơn, TP. Đà Nẵng', 'Chính chủ cần bán ô đất đường mới tại phường Mỹ An, quận Ngũ Hành Sơn, TP Đà Nẵng:<br/>- Cách đường Phan Tứ 30m, cách đường Võ Nguyên Giáp 120m, cách biển 150m;<br/>- Đã có sổ đỏ, phù hợp xây dựng khách sạn 3, 4 sao. Diện tích ô đất 500m2.<br/>- Khu vực tiếp đón nhiều khách du lịch.<br/>Do gia đình cần tiền lên bán gấp: Giá bán 24,8 tỷ.<br/><br/>Hiện tại gia đình ở Hà Nội, nếu cần có thể liên hệ với chú Dân: 01663039427 (chủ cửa hàng tạp hóa gần ô đất).<br/>Chình chủ: 0904990976 (Hà Nội).', '2021-04-13 13:46:20', 7, 'hinh2.jpg', 500, 'Phường Mỹ An - Quận Ngũ Hành Sơn - Đà Nẵng', 130),
(3, 'Bán đất biển đường Võ Nguyên Giáp chỉ từ 33 tr/m2. Tel 0932 592 598', 'Mở bán dự án SaPhia, dự án vàng trên bãi biển Kim Cương, mặt tiền chính đường Võ Nguyên Giáp. Cung đường biển 5* của Tp.Đà Nẵng<br/>Cách trung tâm hội nghị Apec 2017 500m<br/>- Mặt tiền Võ Nguyên Giáp, mặt sau Nguyễn Khắc Viện, đối diện bãi tắm Sơn Thủy - Đà Nẵng. - - Nằm cạnh sân bay nước mặn, được nhà đầu tư Malaysia mua lại và đầu tư khu đô thị Quốc Tế Đà Nẵng.<br/>- Đối diện Hyatt Regency Resort, sòng bài Crowne Palaza<br/>- Nằm gần khu du lịch tâm linh Ngũ Hành Sơn<br/>- Nằm giữa 2 bãi tắm Sơn Thủy<br/>Vị Trí: <br/>+ Phía Đông: Tiếp giáp với đường Võ Nguyên Giáp, các khu Resort 5* như Regency resort, Crowne Palaza, The Song resort, Fulama Villas…<br/>+ Phía Tây: Tiếp giáp với đường Nguyễn Khắc Viện<br/>+ Phía Nam: Tiếp giáp Trục đường Minh Mạng 48m<br/>+ Phía Bắc: Tiếp giáp với Sân bay nước mặn.<br/>Quy hoạch:<br/>+ Có quyết định 1/500 phê duyệt<br/>+ Gồm các Condotel, nhà phố liền kề, trường mầm non quốc tế<br/>+ Cung đường quy hoạch 13.5m và 20,5m<br/><br/>5.Lý do nên đầu tư tại saphia ngay thời điểm này? <br/>- SaPhia – Hội tụ đủ yếu tố của dự án tuyệt đẹp và đẳng cấp<br/>- SaPhia – Gía bán hấp dẫn, ổn định<br/>- SaPhia – Tiềm năng phát triển cực lớn<br/>- SaPhia – Đầu tư LỢI NHUẬN KHỦNG<br/>- SaPhia – Đầu tư siêu an toàn: chủ đầu tư uy tín<br/><br/>***** Siêu phẩm gia tăng giá trị mạnh nhất trong tương lai tại TP Đà Nẵng, được phân phối độc quyền bởi Cty CP BĐS Link House Miền Trung.<br/>Địa chỉ: 320 đường 2 tháng 9, Q.Hải Châu, Tp.Đà Nẵng<br/>Website: linkhousemientrung.com.vn<br/>LH: 0932 592 598', '2021-04-24 14:51:06', 5, 'hinh3.jpg', 1500, 'Đường Võ Nguyên Giáp - Quận Ngũ Hành Sơn - Đà Nẵng', 129),
(4, 'Thuê chung cư mini 2 pn khu Bắc Từ Liêm', 'Cần thuê gấp chung cư mini 2 phòng ngủ, đầy đủ nội thất cơ bản, sạch sẽ, gần trường Học Viện Tài Chính và Y Tế Công Cộng 3km đổ lại. Giá tầm 5,5tr đổ lại.', '2021-04-25 07:36:20', 3, 'hinh4.jpg', 90, 'Quận Bắc Từ Liêm - Hà Nội', 132),
(5, 'Bán đất xây dựng khách sạn đường Lâm Hoành 0918444053', 'Cần bán khu đất xây khách sạn tại đường Lâm Hoành, Quận Sơn Trà, TP Đà Nẵng.<br/>Diện tích: 695 m2.<br/>Vị trí nằm trong khu tập trung tổ hợp nhà hàng, khách sạn, dịch vụ du lịch tốt nhất của biển Đà Nẵng. <br/>Khu đất rộng, thích hợp xây khách sạn, vị trí đắc địa, tập trung nhiều khách sạn lớn.<br/>Giá bán: 75 triệu/m2.<br/>Giá bán chính chủ. Liên hệ: 0918444053.', '2021-04-27 15:11:42', 7, 'hinh5.jpg', 695, 'Đường Lâm Hoành - Quận Sơn Trà - Đà Nẵng', 138),
(6, 'Cho thuê đất đường Nguyễn Lương Bằng', 'Cho thuê đất đường Nguyễn Lương Bằng', '2021-04-29 06:03:19', 7, 'minato2_140679740752899.jpg', 100, '120 Nguyễn Lương Bằng', 520),
(8, 'Bán đất đường Trần Phú', 'Mô tả Bán đất đường Trần Phú', '2021-04-29 06:03:16', 4, 'VinaEnter_181442883662600.png', 240, '74/2 Trần Phú - Đà Nẵng', 528),
(9, 'Bán đất đường Ngô Thì Nhậm', 'Bán đất đường Ngô Thì Nhậm', '2021-04-27 15:11:32', 7, 'image1_264088661455000.jpg', 90, '65 Ngô Thì Nhậm - Đà Nẵng', 47),
(11, 'Bán đất đường Nguyễn Lương Bằng 2', 'Bán đất đường Nguyễn Lương Bằng 2', '2021-04-27 15:11:37', 2, 'bijuu1_124075049049600.jpg', 100, '74 Nguyễn Lương Bằng - Đà Nẵng', 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_USER'),
(3, 'ROLE_MOD');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roleId` int(11) NOT NULL DEFAULT 2,
  `enabled` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `fullname`, `password`, `roleId`, `enabled`) VALUES
(1, 'admin', 'Nguyễn Văn C', '$2a$10$Z785cjq6Gq5elbFZffYwX.0/1suKY5.HErkTAayh2SA0nAJ/3f1Xm', 1, 1),
(2, 'mod', 'VinaEnter Edu', '$2a$10$Z785cjq6Gq5elbFZffYwX.0/1suKY5.HErkTAayh2SA0nAJ/3f1Xm', 3, 1),
(3, 'user', 'Người dùng', '$2a$10$Z785cjq6Gq5elbFZffYwX.0/1suKY5.HErkTAayh2SA0nAJ/3f1Xm', 2, 1),
(4, 'faker', 'Lee Sang Hyeok', '$2a$10$Z785cjq6Gq5elbFZffYwX.0/1suKY5.HErkTAayh2SA0nAJ/3f1Xm', 2, 1),
(6, 'quanhi', 'Dương Quá', '$2a$10$bUj.JkduESqi1GLSnpxRs.kdddWZV5aFrxA.2BDm/K22E6K2DOjKa', 2, 1),
(7, 'thaygiaoba', 'Phan Tấn Trung', '$2a$10$QSI6DhHEfzC/N1Zhxs1ZqeUXeqjhHzuTEXPJ.PqVSMPHtIGy5yYBS', 2, 1),
(8, 'minato', 'Namikaze Minato', '$2a$10$tSPZBmIhm61CRAvB0i2gqeceZoyZ2Usj3Xt1gGYlSHnf/qbsDT5/S', 2, 1),
(9, 'boyit', 'Nguyễn Tiến Dũng', '$2a$10$cPLDl1DhicKdlLJwr/tqi.h1qr1iScouJD4EC.LrDJDypASZ4iE4C', 2, 1),
(12, 'hongquan', 'Nguyễn Hồng Quân', '$2a$10$SZLh0QC.6eXQEDHsjSUbAOHzvwi7Rd3eLfzT41yb5YFc0cKtl7Dni', 3, 1);

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
(6, 'Minato Nguyễn', 'minato@gmail.com', 'Liên hệ 1', 'Liên hệ với tôi sớm'),
(7, 'Faker Nguyễn', 'sanghyeok@gmail.com', 'Liên hệ 2', 'Liên hệ với tôi nhé'),
(8, 'Trần Hiểu', 'tranhieu@gmail.com', 'Liên hệ 3', 'Liên hệ sớm nhé, cảm ơn'),
(9, 'Nguyễn Ngọc Lan', 'lan@gmail.com', 'Liên hệ 4', 'Liên hệ nhanh nhé shop, thanks'),
(10, 'Lê Trung Nam', 'namdong@gmail.com', 'Hello Bro', 'Hãy liên hệ với tôi hihi'),
(11, 'Uchiha Madara', 'madara@gmail.com', 'Tư vấn mua đất', 'Chào bạn, liên hệ tư vấn cho tôi'),
(12, 'Uchiha Sasuke', 'sasuke@gmail.com', 'Hihi haha', 'Liên hệ nào, ok');

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
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `cid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `lands`
--
ALTER TABLE `lands`
  MODIFY `lid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `vnecontact`
--
ALTER TABLE `vnecontact`
  MODIFY `cid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
