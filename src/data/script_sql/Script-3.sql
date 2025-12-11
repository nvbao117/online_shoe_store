-- =============================================
-- AUTO-GENERATED SQL DATA
-- Generated at: 2025-12-09 16:36:00
-- Source: .\thanhhungfutsal_final.json
-- Image URLs: LOCAL
-- =============================================
USE shoe_store;
-- INSERT BRANDS
INSERT IGNORE INTO brands (brand_id, name, description, is_active, created_at) VALUES
('6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'ADIDAS', 'Thương hiệu ADIDAS', TRUE, NOW()),
('6f5cd916-d4d1-11f0-9c43-bac23ad2f5de', 'ASICS', 'Thương hiệu ASICS', TRUE, NOW()),
('6f5cd968-d4d1-11f0-9c43-bac23ad2f5de', 'JOMA', 'Thương hiệu JOMA', TRUE, NOW()),
('afab8492-009e-49c6-83f3-195245560477', 'KAMITO', 'Thương hiệu KAMITO', TRUE, NOW()),
('6f5cd833-d4d1-11f0-9c43-bac23ad2f5de', 'MIZUNO', 'Thương hiệu MIZUNO', TRUE, NOW()),
('6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'NIKE', 'Thương hiệu NIKE', TRUE, NOW()),
('6f5cd8bb-d4d1-11f0-9c43-bac23ad2f5de', 'PUMA', 'Thương hiệu PUMA', TRUE, NOW()),
('6f5cd9b6-d4d1-11f0-9c43-bac23ad2f5de', 'ZOCKER', 'Thương hiệu ZOCKER', TRUE, NOW());
-- =============================================
-- INSERT CATEGORIES (tất cả 4 danh mục)
-- =============================================
INSERT IGNORE INTO categories (category_id, name, description, is_active, created_at) VALUES
('e8257dd7-d4d3-11f0-9c43-bac23ad2f5de', 'Giày Pickleball', 'Danh mục Giày Pickleball', TRUE, NOW()),
('e8257e67-d4d3-11f0-9c43-bac23ad2f5de', 'Giày bóng chuyền', 'Danh mục Giày bóng chuyền', TRUE, NOW()),
('e8257a2a-d4d3-11f0-9c43-bac23ad2f5de', 'Giày bóng chày', 'Danh mục Giày bóng chày', TRUE, NOW()),
('e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', 'Giày bóng đá', 'Danh mục Giày bóng đá', TRUE, NOW());

-- =============================================
-- INSERT PRODUCTS
-- =============================================

INSERT INTO products (product_id, name, description, price, image_url, status, brand_id, category_id, created_at, updated_at) VALUES
('91a11254-ffa1-4664-adce-e47412187480', 'NIKE PHANTOM 6 LOW ACADEMY TF - HQ2325-800 - VÀNG CHANH/ĐEN', 'NIKE PHANTOM 6 LOW ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO - PHỐI MÀU HYPER CRIMSON/LIMELIGHT/BLACK | MAX VOLTAGE PACK (10/2025)

Là mẫu giày cỏ nhân tạo TF thuộc phân khúc phổ thông trong thế hệ Phantom hoàn toàn mới, ra mắt tháng 10/2025 trong bộ sưu tập MAX VOLTAGE PACK. Lấy cảm hứng từ nguồn năng lượng điện áp cao, phối màu HYPER CRIMSON/LIMELIGHT/BLACK mang lại cảm giác rực rỡ, mạnh mẽ và hiện đại - đúng tinh thần “bùng nổ hiệu năng” mà Nike hướng đến cho mùa giải mới.

Phantom 6 Low Academy TF được thiết kế cho những cầu thủ yêu thích kiểm soát bóng và chuyền chuẩn xác trên mặt sân 5–7 người. Phần upper NikeSkin mở rộng, kết hợp lưới kỹ thuật (engineered mesh) giúp chân tiếp xúc gần hơn với bóng, tăng cảm giác thật khi rê, chuyền hoặc dứt điểm. Kết cấu bề mặt có độ bám tự nhiên, hỗ trợ tối ưu cho các pha xử lý đòi hỏi độ chính xác cao.

Đế ngoài bằng cao su bám nhanh trên mặt sân nhân tạo ngắn, mang lại khả năng di chuyển linh hoạt, ổn định và phản hồi tốt trong từng pha xoa...', 2790000.00, 'src/data/images/products/main_0b0156ff.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('d39dfb40-b425-41cb-8767-bd516ea4eace', 'ADIDAS COPA PURE 2 LEAGUE TF - IG8720 - TÍM/BẠC', 'ADIDAS COPA PURE 2 LEAGUE TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Sở hữu những bước chạm bóng tinh tế với thế hệ COPA PURE 2 hoàn toàn mới. Được trình làng nhằm chuẩn bị cho mùa giải 2023/24, ADIDAS COPA PURE 2 LEAGUE TF sở hữu những cải tiến hứa hẹn sẽ mang đến trải nghiệm chơi bóng tốt nhất cho người chơi. 

Thông số kỹ thuật

ADIDAS COPA PURE 2 LEAGUE TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phần upper làm từ chất liệu nhân tạo mềm mại mang lại cảm giác bóng tốt nhất cho người chơi; đồng thời giúp giảm thời gian break-in giày.

Trên thế hệ Copa Pure 2 mới nhất lần này, hãng đã bổ sung thêm các đường vân và hạt nhằm tăng ma sát với bóng, từ đó giúp người chơi có thể kiểm soát bóng tốt hơn. 

Lưỡi gà rời mỏng và mềm, có thể dễ dàng xỏ chân vào hơn so với các mẫu adidas lưỡi gà liền trước đây, tạo sự thoải mái cho anh em có mu bàn chân cao và dày. Bên dưới lưỡi gà được bổ sung một lớp đệm vải nhung giúp tăng thêm độ êm ái cho bàn chân người mang. 

Lớp đệm gót l...', 1750000.00, 'src/data/images/products/main_9001e103.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('3f6e3d84-5cc2-4d47-ba95-fb4c4505f83b', 'ADIDAS PREDATOR 24 LEAGUE L TF - IG7723 - ĐEN/ĐỎ', 'ADIDAS PREDATOR 24 LEAGUE L TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Ghi bàn từ mọi hướng cùng mẫu giày bóng đá ADIDAS PREDATOR 24 LEAGUE L TF. Được thiết kế nhằm phục vụ cho lối chơi ghi bàn, ADIDAS PREDATOR 24 LEAGUE L TF với những công nghệ tiên tiến nhất của nhà Ba Sọc sẽ đem đến cho bạn sức mạnh và sự chính xác trong từng đường bóng.

Mẫu giày đá bóng PREDATOR 24 thuộc bộ sưu tập “Solar Energy” với phối màu “Core Black/White/Solar Red” bắt mắt sẽ được những ngôi sao hàng đầu adidas mang trên chân như Jude Bellingham, Trent Alexander-Arnold, Pedri, Ilkay Gundogan, Paulo Dybala, Marco Asensio…. 

Thông số kỹ thuật

ADIDAS PREDATOR 24 LEAGUE L TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.

Phân khúc: League (tầm trung).

Phần upper làm từ chất liệu da tổng hợp Hybridfeel mềm mại và đàn hồi, mang đến cảm giác bóng thật chân nhất cho người chơi.

Các vân 3D Strikescale được in dập nổi ở khu vực má trong làm tăng độ ma sát với bóng, từ đó giúp người chơi có thể dễ dàng t...', 1750000.00, 'src/data/images/products/main_640d2d1a.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('dc34e5b8-f8ce-4213-b3c8-9487478c3d4e', 'ADIDAS X CRAZYFAST INJ.3 TF - IG0767 - ĐEN/VÀNG CHANH', 'ADIDAS X CRAZYFAST.3 TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Viết nên câu chuyện tốc độ của riêng bạn với mẫu giày đá banh adidas X Crazyfast.3 TF “Crazyrush Pack” hoàn toàn mới! Sở hữu những cải tiến mới nhất cùng một thiết kế tối giản phục vụ cho lối chơi tốc độ, X Crazyfast.3 TF xứng đáng là sự lựa chọn hàng đầu dành cho những tiền vệ và tiền đạo ưu tiên sự linh hoạt và thanh thoát trong cách chơi của mình!

Lần đầu tiên, logo Three Stripes được xuất hiện ở cả phần má trong và ngoài của đôi giày. Sở hữu phối màu White/Core Black/Lucid Lemon đầy tươi mát, mẫu giày đá banh adidas X Crazyfast.3 TF “Crazyrush Pack” sẽ giúp bạn tự tin chinh phục sức nóng từ mùa hè này bằng tốc độ của riêng bạn! 

Thông số kỹ thuật:

ADIDAS X CRAZYFAST.3 TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5-7 người.

Phân khúc: .3 (tầm trung).

Phần upper làm từ chất liệu da tổng hợp pha sợi dệt mềm mại, mang lại cảm giác bóng tốt nhất cho người mang. Trên bề mặt upper được phủ một lớp nhựa TPU giúp tă...', 1260000.00, 'src/data/images/products/main_7df7d677.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('3c4cfae1-6bd7-480a-b9df-ad16910a0f67', 'MIZUNO MONARCIDA NEO III SELECT AS - P1GD242545 - VÀNG NEON', 'MIZUNO MONARCIDA NEO III SELECT TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Upper giày đá bóng sân cỏ nhân tạo Mizuno Monarcida Neo III Select As được sản xuất từ chất liệu da tổng hợp siêu mềm, mỗi cú sút, mỗi pha đi bóng của bạn trở nên mạnh mẽ và chính xác hơn bao giờ hết. Mizuno đã dành tâm huyết để tạo ra phần Upper giày với độ co giãn lý tưởng, giúp bạn thoải mái xử lý bóng trong mọi tình huống trên sân.

Form giày đá bóng sân cỏ nhân tạo Mizuno Monarcida Neo III Select As được thiết kế đặc biệt phù hợp với bàn chân người Châu Á, đặc biệt là người Việt và những người có bàn chân bè có thể sử dụng thoải mái trên sân cỏ.

Không chỉ mang lại cảm giác êm ái, gót giày đá bóng sân cỏ nhân tạo Mizuno Monarcida Neo III Select As được cải tiến với chất liệu mềm mịn đảm bảo sự chắc chắn và bảo vệ tối đa cho gót chân của bạn, giúp bạn tập trung hoàn toàn vào trận đấu.

Đế giày có 2 loại đinh: Đinh vòng ngoài có hình tam giác giúp tăng bề mặt tiếp xúc giữa giày và mặt sân. Bên trong là các đinh tr...', 1590000.00, 'src/data/images/products/main_36d4d8d2.jpg', 'ACTIVE', '6f5cd833-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('f5694b02-2874-4bf7-b2fb-b178925320da', 'NIKE ZOOM MERCURIAL VAPOR 15 ACADEMY XXV TF - FB8396-060 - BẠC/XANH', 'NIKE MERCURIAL VAPOR 15 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Tháng 6/2022, Nike chính thức trình làng thế hệ tiếp theo của dòng giày Mercurial mang tên Air Zoom Mercurial. Cải tiến lớn nhất trên thế hệ này nằm ở bộ đệm Zoom Air được thiết kế độc quyền cho bóng đá. Bên cạnh đó, mọi chi tiết trên đôi giày lần này đều được thiết kế nhằm tối ưu hoá lối chơi tốc độ. 

Thông số kỹ thuật
Mẫu giày đá bóng MERCURIAL ZOOM VAPOR 15 ACADEMY TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.

Phân khúc: Academy (Tầm trung).

Upper làm từ da tổng hợp mềm mại giúp tăng cảm giác bóng. Ở thế hệ 15 này, hãng đã phủ thêm lớp NikeSkin trên bề mặt upper làm tăng độ bám bóng, từ đó có thể kiểm soát bóng và rê bóng tốt hơn. 

Cấu trúc Speed Cage bên dưới bề mặt upper được làm từ chất liệu mỏng nhưng cực kỳ chắc chắn sẽ mang đến sự ôm chân vừa khít, đồng thời hạn chế sự xê dịch chân trong giày khi thi đấu ở cường độ cao.

Lưỡi gà được thiết kế cố định ở phần nửa trên sẽ không gây ra tìn...', 1260000.00, 'src/data/images/products/main_8e3b62f9.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('784dbede-9915-4332-a271-c7870caeb02e', 'ASICS CALCETTO WD 9 TF - 1113A038-102- TRẮNG/HỒNG', 'ASICS CALCETTO WD 9 TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Asics Calcetto đã chính thức quay trở lại với một thế hệ hoàn toàn mới của dòng giày này. Mềm hơn, bè hơn và cũng bền hơn - Asics Calcetto WD 9 TF hứa hẹn sẽ là mẫu giày hoàn hảo dành cho những ai đang tìm kiếm một đôi giày ổn định và thoải mái xuyên suốt trận đấu.  

Các mẫu giày đá bóng Asics vốn rất được yêu chuộng bởi các anh em chơi bóng đá phong trào tại Viêt Nam. Tất cả nhờ vào form giày Wide Fit phù hợp với những anh em có form chân từ bè vừa đến bè nhiều. 

Thông số kỹ thuật

ASICS CALCETTO WD 9 TF là mẫu giày đá bóng đế TF dành cho mặt sân cỏ nhân tạo từ 5-7 người.

Phần upper được làm từ da nhân tạo mềm mại và đàn hồi, mang đến cảm giác bóng tốt nhất cho người chơi. Trên bề mặt upper là những đường khâu dạng mắt lưới giúp giữ cho hình dáng không giãn quá mức sau một thời gian chơi bóng.  

Đế giày được thiết kế bo cao lên phần mũi, giúp hỗ trợ cho những pha chích mũi đầy uy lực từ người mang. Bên cạnh đó, mũi giày còn...', 1950000.00, 'src/data/images/products/main_10bf1f7e.jpg', 'ACTIVE', '6f5cd916-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('a95aed16-a6dc-4b3f-b3a3-618abbc4b651', 'ADIDAS F50 PRO TF - JH7664 - CAM/XANH', 'ADIDAS F50 PRO TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Sau 9 năm vắng bóng, huyền thoại adidas F50 đã chính thức trở lại - nhẹ hơn, nhanh hơn và lợi hại hơn! Được thiết kế để khai phá trọn vẹn tiềm năng tốc độ của người chơi, mẫu giày đá bóng sân cỏ nhân tạo adidas F50 Pro TF sẽ là sự lựa chọn hoàn hảo dành cho những tiền vệ và tiền đạo ưu tiên sự nhanh nhẹn và thanh thoát trong lối chơi của mình.  

Thông số kỹ thuật

ADIDAS F50 PRO TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.  

Phân khúc: Pro (chuyên nghiệp).

Phần upper được làm từ chất liệu sợi tổng hợp Fibertouch hoàn toàn mới sẽ mang đến cảm giác bóng thật chân nhất cho người chơi. Trên bề mặt upper được phủ lớp Sprintweb 3D kéo dài từ đầu mũi đến gót giày giúp tăng ma sát khi chạm bóng, từ đó giúp người chơi có thể kiểm soát và rê bóng tốt hơn ở tốc độ cao.

Lưỡi gà bán liền được thiết kế theo công nghệ Compression Fit Tunnel,  với chất liệu sợi dệt siêu mỏng và co giãn tốt giúp ôm trọn phần mu bàn chân người ...', 1950000.00, 'src/data/images/products/main_f6c3558f.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('456b8557-9e19-4635-b034-1d3955315cf1', 'PUMA ULTRA ULTIMATE CAGE - 107502-03 - XANH/TRẮNG', 'PUMA ULTRA ULTIMATE CAGE TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Nâng cấp các trận đấu của bạn lên một tầm cao mới với thế hệ tiếp theo của dòng giày tốc độ thuộc nhà Báo. PUMA ULTRA ULTIMATE CAGE được thiết kế với những cải tiến đáng kể so với thế hệ trước, nhằm mang lại trải nghiệm tự tin và bùng nổ hơn cho người mang. 

Thông số kỹ thuật

PUMA ULTRA ULTIMATE CAGE là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.

Phân khúc: Ultimate (chuyên nghiệp)

Phần upper được làm từ sợi dệt ULTRAWEAVE siêu nhẹ với cấu trúc co giãn 4 chiều giúp giảm trọng lượng và ma sát. Công nghệ PWRPRINT Pro ở những điểm tiếp xúc bóng thường xuyên làm tăng độ bám bóng, từ đó nâng cao khả năng kiểm soát bóng của người mang khi rê bóng ở tốc độ cao. 

Công nghệ PWRTAPE hoàn toàn mới được áp dụng ở phần gót giày giúp bảo vệ khu vực gót chân người mang, đồng thời tạo cảm giác ôm chân vừa vặn.  

Bề mặt lót giày được làm nhám giúp giảm sự xê dịch của bàn chân trong giày khi thi đấu ở cường độ cao.  

Bộ...', 1290000.00, 'src/data/images/products/main_6905da91.jpg', 'ACTIVE', '6f5cd8bb-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('e5c7c7b5-5a86-4ec9-ae90-c8a455349934', 'ADIDAS F50 PRO TF - JH6416 - HỒNG', 'ADIDAS F50 PRO TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Sau 9 năm vắng bóng, huyền thoại adidas F50 đã chính thức trở lại - nhẹ hơn, nhanh hơn và lợi hại hơn! Được thiết kế để khai phá trọn vẹn tiềm năng tốc độ của người chơi, mẫu giày đá bóng sân cỏ nhân tạo adidas F50 Pro TF sẽ là sự lựa chọn hoàn hảo dành cho những tiền vệ và tiền đạo ưu tiên sự nhanh nhẹn và thanh thoát trong lối chơi của mình.

Phối màu này sẽ được những ngôi sao hàng đầu adidas mang trên chân như Messi, Mohamed Salah, Lamine Yamal, Julian Alvarez, Son Heung Min, Florian Wirtz, Brahim Diaz, Luis Diaz...  

Thông số kỹ thuật

ADIDAS F50 PRO TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.  

Phân khúc: Pro (chuyên nghiệp).

Phần upper được làm từ chất liệu sợi tổng hợp Fibertouch hoàn toàn mới sẽ mang đến cảm giác bóng thật chân nhất cho người chơi. Trên bề mặt upper được phủ lớp Sprintweb 3D kéo dài từ đầu mũi đến gót giày giúp tăng ma sát khi chạm bóng, từ đó giúp người chơi có thể kiểm soát và rê bó...', 1950000.00, 'src/data/images/products/main_d4ee60d8.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('8a6580f2-b817-4edc-9578-ad127b063193', 'ADIDAS PREDATOR LEAGUE TF - IE2614 - ĐEN', 'ADIDAS PREDATOR 24 LEAGUE TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Ghi bàn từ mọi hướng cùng mẫu giày bóng đá ADIDAS PREDATOR 24 LEAGUE TF. Được thiết kế nhằm phục vụ cho lối chơi ghi bàn, ADIDAS PREDATOR 24 LEAGUE TF với những công nghệ tiên tiến nhất của nhà Ba Sọc sẽ đem đến cho bạn sức mạnh và sự chính xác trong từng đường bóng.

Thông số kỹ thuật

ADIDAS PREDATOR 24 LEAGUE L TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc: League (tầm trung).

Phần upper làm từ chất liệu da tổng hợp Hybridfeel mềm mại và đàn hồi, mang đến cảm giác bóng thật chân nhất cho người chơi.

Các vân 3D Strikescale được in dập nổi ở khu vực má trong làm tăng độ ma sát với bóng, từ đó giúp người chơi có thể dễ dàng thực hiện các đường chuyền hay cú sút với độ xoáy và chính xác cao.  

Lưỡi gà rời mềm mỏng giúp người chơi dễ dàng xỏ chân vào giày hơn trước, phù hợp cho những anh em có mu bàn chân cao và dày.  

Hệ thống dây giày được thiết kế lệch sang một bên giúp mở rộng vùng diện...', 1260000.00, 'src/data/images/products/main_6d447b45.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('ec0756a4-dd3f-447a-be83-ac971d1818ce', 'ADIDAS PREDATOR ACCURACY.3 TF - GZ0004 - TRẮNG/VÀNG CHANH', 'ADIDAS PREDATOR ACCURACY.3 TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Kiểm soát + chính xác = tự tin. Đó chính là công thức để tạo nên mẫu giày đá banh ADIDAS PREDATOR ACCURACY.3 L TF hoàn toàn mới lần này! Sở hữu những cải tiến đáng kể so với thế hệ trước đây, mẫu giày PREDATOR ACCURACY.3 L TF sẽ giúp bạn tự tin làm chủ cuộc chơi, kiểm soát trận đấu!

Thông số kỹ thuật

ADIDAS PREDATOR ACCURACY.3 TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc: .3 (tầm trung)

Phần upper làm từ chất liệu da tổng hợp mềm mại. Các vân High Definition Texture được in dập nổi ở khu vực má trong và má ngoài làm tăng độ ma sát với bóng, từ đó giúp người chơi có thể dễ dàng thực hiện các đường chuyền hay cú sút với độ chính xác cao. 

Lưỡi gà rời được thiết kế mỏng mang đến sự thoải mái cho người mang, đặc biệt là cho những ai với mu chân cao và dày.

Hệ thống dây giày được làm lệch sang một bên giúp mở rộng vùng diện tích sút bóng.

Lớp đệm gót được làm từ chất liệu vải nhung dày và ...', 1260000.00, 'src/data/images/products/main_d0202aca.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('a5251601-73e3-49f9-9f0a-c28f1da55a25', 'NIKE ZOOM MERCURIAL SUPERFLY 10 ACADEMY TF - FQ8331-800 - ĐỎ/TRẮNG', 'NIKE ZOOM MERCURIAL SUPERFLY 10 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Chinh phục những giới hạn tốc độ mới cùng mẫu giày đá bóng Nike Mercurial Superfly 10 Academy TF.

Sau chu kỳ 2 năm, tháng 7/2024, Nike đã chính thức trình làng thế hệ mới nhất của silo Air Zoom Mercurial. Nhẹ hơn - bền hơn - bùng nổ hơn, Mercurial Superfly 10 Academy TF sẽ là đôi giày bóng đá hoàn hảo dành cho những tín đồ đam mê tốc độ.

Mẫu giày đá bóng Nike Air Zoom Mercurial Vapor 16 và Superfly 10 sẽ được những ngôi sao hàng đầu nhà Swoosh mang trên chân như Cristiano Ronaldo, Kylian Mbappé, Vinicius Jr., Federico Valverde, Rodrygo, Cole Palmer, Bruno Fernandes, Luka Modric….

Thông số kỹ thuật

MERCURIAL SUPERFLY 10 ACADEMY TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5 đến 7 người. 

Phân khúc: Academy (tầm trung).

Form giày phù hợp cho chân thon đến bè vừa. 

Phần upper được làm từ da tổng hợp NikeSkin mềm mỏng và đàn hồi sẽ mang lại cảm giác bóng thật chân cho bạn. Bề mặt upper được phủ...', 1750000.00, 'src/data/images/products/main_be145f8a.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('b029e1b5-6999-4779-bf40-2a9e2b9cbd6a', 'NIKE PHANTOM GX 2 ACADEMY TF - FJ2577-800 - HỒNG CAM', 'NIKE PHANTOM GX 2 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Chơi bóng với sức mạnh và sự chính xác tuyệt đối cùng NIKE PHANTOM GX 2 ACADEMY TF. Được thiết kế cho các ngôi sao hàng đầu ở vị trí tấn công như Erling Haaland, Rodrygo, Phil Foden….PHANTOM GX 2 ACADEMY TF với những cải tiến đặc biệt sẽ giúp bạn phát huy toàn bộ khả năng tốt nhất của bản thân trên sân cỏ! 

Thông số kỹ thuật

NIKE PHANTOM GX 2 ACADEMY TF là mẫu giày đá banh đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc : Academy (tầm trung)

Phần upper làm từ da tổng hợp mềm mại được mô phỏng theo chất liệu sợi dệt sẽ mang đến cảm giác thật chân nhất trong từng pha chạm bóng. Trên bề mặt Phantom GX Academy TF được trang bị thêm lớp phủ NikeSkin giúp tăng độ bám bóng, từ đó người chơi có thể kiểm soát và rê bóng tốt hơn ở bất kỳ điều kiện thời tiết. 

Công nghệ Strike Zone với các vân vòng tròn được in dập nổi ở những vùng tiếp xúc bóng chủ yếu giúp tăng thêm độ xoáy cho những cú phất bóng và cứa lòng. 

Hệ thống d...', 1750000.00, 'src/data/images/products/main_908e530f.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('62cb5985-d4e5-4a3c-b82c-b2df7ea94ecf', 'ADIDAS PREDATOR 25 LEAGUE L TF - JI1136 - CAM/XANH', 'ADIDAS PREDATOR 25 LEAGUE TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO CHÍNH HÃNG

Hãy sẵn sàng ra sân và ghi bàn cùng mẫu giày bóng đá ADIDAS PREDATOR 25 LEAGUE L TF! Được cải tiến để tối ưu hóa khả năng tấn công của người chơi, ADIDAS PREDATOR 25 LEAGUE L TF với những công nghệ tiên tiến nhất của nhà Ba Sọc sẽ mang đến cho bạn sức mạnh bứt phá và độ chính xác tuyệt đối trong từng pha bóng.

Thông số kỹ thuật: 

ADIDAS PREDATOR LEAGUE L TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc: League (tầm trung).

Form giày phù hợp cho chân thon đến bè vừa.

Phần upper được làm từ chất liệu da nhân tạo Hybridfeel mềm mỏng và đàn hồi, giúp mang lại cảm giác chạm bóng thật chân nhất cho người chơi. 

Ở khu vực má trong là các vân 3D Strikescale được in dập nổi giúp tăng độ ma sát với bóng, từ đó hỗ trợ người chơi kiểm soát bóng tốt hơn trong mọi tình huống.

Lưỡi gà rời mềm mỏng giúp người chơi dễ dàng xỏ chân vào giày hơn trước, phù hợp cho những anh em có mu bàn chân cao v...', 2850000.00, 'src/data/images/products/main_5bf0b2b6.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('988df8e0-62a9-4154-9eac-69a2c6b7534b', 'PUMA ULTRA MATCH TT - 107757-03 - VÀNG CAM', 'PUMA ULTRA MATCH TT - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Nhanh hơn - bùng nổ hơn - hãy nâng cấp lối chơi tốc độ của bạn với phiên bản ULTRA MATCH TT 2023 mới. PUMA ULTRA MATCH TT đã trở lại với những cải tiến đáng kể so với phiên bản trước, nhằm mang lại trải nghiệm tự tin và bùng nổ hơn cho người mang trong suốt quá trình chơi bóng. 

“Forever Faster Pack” là bộ sưu tập được PUMA ra mắt nhằm chuẩn bị cho một mùa hè đầy sôi động với sự trở lại của EURO 2024 và Copa America 2024. Sở hữu phối màu “Sun Stream/Puma Black/Sunset Glow” đầy bắt mắt, mẫu giày đá bóng Ultra “Forever Faster Pack” sẽ được những ngôi sao hàng đầu PUMA mang trên chân như Antoine Griezmann, Antony, Kyle Walker, Raphael Varane, Christian Pulisic, Kingsley Coman...

Thông số kỹ thuật:

PUMA ULTRA MATCH TT là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5-7 người. 

Phân khúc: Match (tầm trung).

Phần upper làm từ da tổng hợp pha sợi dệt siêu nhẹ mang đến cảm giác bóng thật chân nhất cho người mang.

Trên bề mặt up...', 1290000.00, 'src/data/images/products/main_0022471f.jpg', 'ACTIVE', '6f5cd8bb-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('02c24ee2-a298-46cd-ba30-65458a230ffd', 'ZOCKER INSPIRE PRO 2 TF SNS 009 - TÍM/TRẮNG', 'Nếu bạn đang tìm một đôi giày đá banh bền – ôm chân – dễ làm quen trên sân cỏ nhân tạo, Inspire Pro Gen 2 là lựa chọn rất đáng cân nhắc.

Phiên bản màu tím cá tính không chỉ nổi bật mà còn ẩn chứa nhiều cải tiến đáng giá từ Zocker, giúp bạn chơi bóng ổn định hơn, xử lý bóng tự tin hơn ngay từ lần đầu mang thử.

Tại sao nên chọn Inspire Pro Gen 2?

Ôm chân vừa vặn nhưng không quá bó, phù hợp cả chân bè lẫn chân thon – đá nhẹ mà vẫn chắc.

Upper mềm, dễ làm quen – giúp kiểm soát bóng và chuyền bóng mượt mà hơn.

Đế TF cao su đúc nguyên khối, bám sân tốt, hỗ trợ tăng tốc và xoay trở linh hoạt.

Thiết kế tinh tế, form gọn, phối màu tím độc đáo – cực hợp cho những ai thích khác biệt.

Thông tin chi tiết:

Loại sân: Sân cỏ nhân tạo 5–7 người

Đinh giày: TF (cao su chống trượt)

Chất liệu upper: Da PU microfiber mềm – dễ vệ sinh, khó bong tróc

Form giày: Slimfit nhẹ – ôm chân nhưng vẫn thoải mái

Màu sắc: Tím phối đen nổi bật

Size: 38 – 44

Bảo hành: 3 tháng keo đế

Ai nên chọn phiên bản...', 665000.00, 'src/data/images/products/main_03244b33.jpg', 'ACTIVE', '6f5cd9b6-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('562e948c-5544-4558-b3f0-499aa0477233', 'MIZUNO MORELIA SALA ELITE TF - Q1GB251209 - TRẮNG/ĐEN', 'MIZUNO MORELIA SALA ELITE TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Mizuno Morelia Sala Elite TF Q1GB251209 là mẫu giày đá bóng sân cỏ nhân tạo cao cấp của Mizuno, nổi bật với thiết kế tinh tế và công nghệ tiên tiến, mang đến trải nghiệm chơi bóng tối ưu cho người dùng.

Thông số kỹ thuật

Mã sản phẩm: Q1GB241225

Màu sắc: Trắng ngọc trai kết hợp xanh laser

Phần upper làm từ da Kangaroo thượng hạng mềm mại và đàn hồi, hỗ trợ tối đa cho người mang khi nhận bóng, đi bóng, sút mu và mang lại cảm giác bóng thật chân. 

Vùng đầu mũi được bọc da lộn nhằm tăng độ bền cho đôi giày, cũng như hỗ trợ cho những pha chích mũi của người mang. 

Lót giày êm ái, chống trượt hiệu quả và có thể tháo rời.

Bộ đệm giữa tăng cường độ êm và phản hồi lực; giúp giảm chấn thương và tạo sự thoải mái trong suốt trận đấu.

Đế ngoài làm từ chất liệu cao su cao cấp, cho khả năng bám sân theo nhiều hướng khác nhau, hỗ trợ tối đa cho những pha di chuyển đổi hướng liên tục.

Form giày được thiết kế bè nhiều phù hợp với f...', 4300000.00, 'src/data/images/products/main_7dc30339.jpg', 'ACTIVE', '6f5cd833-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('8ca8d298-53b2-4e32-a5c5-78fc31822cbe', 'ADIDAS PREDATOR 24 ELITE TF - IF6372 - XANH/TRẮNG', 'ADIDAS PREDATOR 24 ELITE TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Ghi bàn từ mọi hướng cùng mẫu giày bóng đá ADIDAS PREDATOR 24 ELITE TF. Được thiết kế nhằm phục vụ cho lối chơi ghi bàn, ADIDAS PREDATOR 24 ELITE TF với những công nghệ tiên tiến nhất của nhà Ba Sọc sẽ đem đến cho bạn sức mạnh và sự chính xác trong từng đường bóng.

“Advancement Pack” là bộ sưu tập giày bóng đá chính thức của adidas tại EURO và Copa America 2024. Sở hữu phối màu "Lucid Blue/Ftwr White/Solar Red" đầy ấn tượng với nguồn cảm hứng từ phiên bản Predator Mania “Japan Blue” tại World Cup 2002, mẫu giày đá bóng Predator 24 “Advancement Pack” sẽ được những ngôi sao hàng đầu adidas mang trên chân như Jude Bellingham, Trent Alexander-Arnold, Pedri, Ilkay Gundogan,...mang trên chân tại 2 giải vô địch châu lục quan trọng nhất mùa hè này!

Thông số kỹ thuật

ADIDAS PREDATOR 24 ELITE TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc: Elite (chuyên nghiệp).

Phần upper được làm từ chất liệu da lộ...', 1260000.00, 'src/data/images/products/main_b91627b0.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('8ef7edf4-3389-464a-9c74-6f38a60da212', 'PUMA ULTRA ULTIMATE CAGE - 107502-04 - VÀNG/TRẮNG', 'PUMA ULTRA ULTIMATE CAGE TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Nhanh hơn - bùng nổ hơn - hãy nâng cấp lối chơi tốc độ của bạn với phiên bản ULTRA ULTIMATE CAGE 2023 mới.

PUMA ULTRA ULTIMATE CAGE đã trở lại với những cải tiến đáng kể so với phiên bản trước, nhằm mang lại trải nghiệm tự tin và bùng nổ hơn cho người mang trong suốt quá trình chơi bóng. 

Thông số kỹ thuật:

PUMA ULTRA ULTIMATE CAGE là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.

Phân khúc: Ultimate (chuyên nghiệp).

Phần upper được làm từ sợi dệt ULTRAWEAVE siêu nhẹ với cấu trúc co giãn 4 chiều giúp giảm trọng lượng và ma sát. 

Cải tiến lớn nhất trên phiên bản lần này đến từ việc áp dụng công nghệ PWRTAPE bên dưới lớp upper. Công nghệ này sẽ giúp góp phần định hình cho cấu trúc của đôi giày và mang lại sự ổn định xuyên suốt quá trình chơi bóng cho người mang.

Công nghệ PWRPRINT Pro được trang bị ở những điểm tiếp xúc bóng thường xuyên làm tăng độ bám bóng, từ đó nâng cao khả năng kiểm soát bóng của người...', 1290000.00, 'src/data/images/products/main_8a8e0e59.jpg', 'ACTIVE', '6f5cd8bb-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('0c164235-8cf8-4251-9b10-3e6d24b46b1d', 'NIKE ZOOM MERCURIAL VAPOR 16 ACADEMY TF - FQ8449-700 - XANH CHUỐI', 'NIKE ZOOM MERCURIAL VAPOR 16 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Chinh phục những giới hạn tốc độ mới cùng mẫu giày đá bóng Nike Mercurial Vapor 16 Academy TF.

Sau chu kỳ 2 năm, tháng 7/2024, Nike đã chính thức trình làng thế hệ mới nhất của silo Air Zoom Mercurial. Nhẹ hơn - bền hơn - bùng nổ hơn, Mercurial Vapor 16 Academy TF sẽ là đôi giày bóng đá hoàn hảo dành cho những tín đồ đam mê tốc độ.

Thông số kỹ thuật

MERCURIAL VAPOR 16 ACADEMY TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5 đến 7 người. 

Phân khúc: Academy (tầm trung).

Form giày phù hợp cho chân thon đến bè vừa. 

Phần upper được làm từ da tổng hợp NikeSkin mềm mỏng và đàn hồi sẽ mang lại cảm giác bóng thật chân cho bạn. Bề mặt upper được phủ một lớp PU, không chỉ giúp tăng cường độ bền cho đôi giày mà còn làm tăng ma sát khi tiếp xúc bóng, giúp bạn kiểm soát bóng tốt hơn khi rê dắt ở tốc độ cao.

Lưỡi gà được thiết kế cố định ở phần nửa trên sẽ không gây ra tình trạng lệch lưỡi gà khi thi đấu. 

...', 2450000.00, 'src/data/images/products/main_9d71b4f1.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('066685e7-f927-48f8-855e-646373d387f0', 'ADIDAS X CRAZYFAST LEAGUE TF - IF0699 - ĐỎ/TRẮNG', 'ADIDAS X CRAZYFAST LEAGUE TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Viết nên câu chuyện tốc độ của riêng bạn với mẫu giày đá banh ADIDAS X CRAZYFAST LEAGUE TF “Solar Energy Pack” hoàn toàn mới! Sở hữu những cải tiến mới nhất cùng một thiết kế tối giản phục vụ cho lối chơi tốc độ, X CRAZYFAST LEAGUE TF xứng đáng là sự lựa chọn hàng đầu dành cho những tiền vệ và tiền đạo ưu tiên sự linh hoạt và thanh thoát trong cách chơi của mình!

"Energy Citrus Pack" là bộ sưu tập được adidas ra mắt nhằm chuẩn bị cho giai đoạn nước rút của mùa giải. Sở hữu phối màu "Solar Red/White/Team Solar Yellow" đầy bắt mắt, mẫu giày đá bóng X Crazyfast League TF “Energy Citrus Pack” sẽ được những ngôi sao hàng đầu adidas mang trên chân như Lionel Messi, Mohamed Salah, Thomas Muller, Karim Benzema, Julian Alvarez, Son Heung Min, Joao Felix, Takefusa Kubo …. 

Thông số kỹ thuật:

ADIDAS X CRAZYFAST LEAGUE TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5-7 người.

Phân khúc: League (tầm trung).

Phần upper là...', 1750000.00, 'src/data/images/products/main_356427eb.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('27d7c8bf-b1df-49d0-821e-c9032ca11562', 'ADIDAS X CRAZYFAST.3 TF - ID9336 - ĐEN', 'ADIDAS X CRAZYFAST.3 TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Lần đầu tiên, logo Three Stripes được xuất hiện ở cả phần má trong và ngoài của đôi giày. Sở hữu phối màu White/Core Black/Lucid Lemon đầy tươi mát, mẫu giày đá banh adidas X Crazyfast.3 TF “Crazyrush Pack” sẽ giúp bạn tự tin chinh phục sức nóng từ mùa hè này bằng tốc độ của riêng bạn! 

Thông số kỹ thuật:

ADIDAS X CRAZYFAST.3 TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5-7 người.

Phân khúc: .3 (tầm trung).

Phần upper làm từ chất liệu da tổng hợp pha sợi dệt mềm mại, mang lại cảm giác bóng tốt nhất cho người mang. Trên bề mặt upper được phủ một lớp nhựa TPU giúp tăng khả năng kiểm soát khi rê dắt bóng ở tốc độ cao. 

Lưỡi gà liền được làm từ sợi dệt với độ co giãn cao, giúp ôm khít phần mu và cổ chân.  

Đệm gót là một lớp vải nhung dày dặn, mang lại cảm giác ôm chân vừa vặn và êm ái. 

Khung bọc gót TPU giúp hạn chế tình trạng xê dịch gót chân khi di chuyển ở cường độ cao. 

Bộ đệm EVA tạo cảm giác êm ái trong ...', 1750000.00, 'src/data/images/products/main_b8ccdb99.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('89004167-fe6d-4b35-af2f-64ee7c0396ba', 'JOMA TOP FLEX WORLD CUP 2024 TF 2476 - TRẮNG/ĐỎ', 'JOMA TOP FLEX TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Nâng cấp trải nghiệm chơi bóng của bạn thông qua mẫu giày đá banh JOMA TOP FLEX TF. JOMA TOP FLEX TF được thiết kế riêng cho bề mặt sân cỏ nhân tạo nhưng không kém phần ổn định và linh hoạt so với phiên bản đế IC cho sân futsal, từ đó giúp cho người mang có thể tự tin trình diễn lối chơi tốt nhất của bản thân.  

Thông số kỹ thuật

JOMA TOP FLEX TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.

Phần upper được làm từ da thật (da heo) dày dặn nhưng không kém phần mềm mại, giúp mang đến cảm giác bóng thật chân cho người mang. Vùng đầu mũi còn được bọc da lộn giúp tăng độ bền cho giày. Bên cạnh đó, khu vực đầu mũi này còn được trang bị thêm khung bọc nhựa hỗ trợ cho những pha ra chân bằng đầu mũi giày trở nên uy lực hơn. 

Trên phần thân giày được trang bị các lỗ thoát khí theo công nghệ VTS giúp cho đôi giày trở nên thoáng khí hơn, đảm bảo sự thoải mái trong suốt quá trình thi đấu.

Lưỡi gà rời làm từ chất liệu vải lưới ...', 1750000.00, 'src/data/images/products/main_be2beed5.jpg', 'ACTIVE', '6f5cd968-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('cc19c7a8-8610-4e02-8a71-97cdf7162df4', 'MIZUNO MONARCIDA NEO SALA CLUB TF - Q1GB252804 - BẠC/VÀNG', 'MIZUNO MONARCIDA NEO SALA CLUB TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Ngay từ những ngày đầu xuất hiện tại Việt Nam, dòng giày Monarcida nói chung đã được rất nhiều các cầu thủ chơi sân cỏ nhân tạo tin dùng bởi sự bền bỉ đáng kinh ngạc cùng với đó là sự chắc chắn và đặc biệt là rất hợp chân người Việt khi những cầu thủ có bàn chân bè vẫn có thể sử dụng thoải mái. 

Thông số kỹ thuật

Bên cạnh những mẫu giày đình đám đã được nhiều cầu thủ phong trào ưa chuộng như Monarcida Neo II Select AS, Monarcida Neo Sala Pro TF… thì sang năm 2021, Mizuno đã cho ra mắt một mẫu giày mới với đầy đủ những ưu điểm đặc trưng của dòng Monarcida và có một mức giá hợp lý cùng rất nhiều điểm nổi bật:

Được làm từ da tổng hợp thế hệ mới, liền mạch trên toàn thân giày giúp các cầu thủ khống chế bóng êm ái và kiểm soát bóng tốt hơn.

Thiết kế ấn tượng với những họa tiết chạy dọc theo thân giày, mang tới sự trẻ trung, năng động cho tổng thể thiết kế.

Form giày hợp chân người Việt, các cầu thủ dù chân bè nhiều ha...', 2800000.00, 'src/data/images/products/main_31ba942c.jpg', 'ACTIVE', '6f5cd833-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('863f94c5-717b-4f43-afa5-eeffbaf73528', 'NIKE TIEMPO LEGEND 10 PRO TF - DV4336-701 - VÀNG CHANH/ĐEN', 'NIKE TIEMPO LEGEND 10 PRO TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO - VOLT/BLACK | MAX VOLTAGE PACK (10/2025)

Kiểm soát đỉnh cao - Chuẩn xác trong từng pha chạm

Là mẫu giày sân cỏ nhân tạo thuộc bộ sưu tập MAX VOLTAGE PACK (10/2025) - series mang nguồn năng lượng điện áp cao, thể hiện tinh thần tốc độ, bùng nổ và tự tin. Phối màu VOLT/BLACK (Mã sản phẩm: DV4336-701) nổi bật với sắc vàng chanh rực rỡ, tạo cảm giác hiện đại và mạnh mẽ trên sân.

FlyTouch Pro - thế hệ da tổng hợp cao cấp mới

Phiên bản Tiempo Legend 10 Pro đánh dấu sự tiến hoá mạnh mẽ của dòng Tiempo khi được trang bị FlyTouch Pro engineered leather - chất liệu da tổng hợp cao cấp mềm hơn da thật, ôm theo bàn chân mà không bị giãn quá mức, giúp người chơi kiểm soát nhịp độ trận đấu một cách tự tin. Bề mặt được bố trí micro-dots tăng cường vùng tiếp xúc bóng, giúp rê, chuyền và dứt điểm chính xác hơn.

Phần cổ giày sử dụng Flyknit co giãn, mang lại cảm giác ôm chắc tự nhiên. Bên trong là lớp đệm êm (Cushioned insole) giúp giả...', 2790000.00, 'src/data/images/products/main_b4909833.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('450ce6b7-737b-4567-a93a-28ac5e818269', 'ZOCKER INSPIRE PRO TF SNS 005 - XANH NGỌC', 'ZOCKER INSPIRE PRO TF SNS - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Được mệnh danh là “vị vua mới” trong phân khúc giày đá bóng dưới 1 triệu, ZOCKER INSPIRE PRO TF SNS nổi bật với thiết kế hiện đại cùng chất lượng   hoàn thiện sản phẩm tuyệt vời. Đặc biệt, với chính sách bảo hành 1 đổi 1 trong 4 tháng đầu tiên, bạn hoàn toàn có thể tự tin trải nghiệm dòng sản phẩm giày đá bóng ZOCKER INSPIRE PRO TF SNS mới đến từ nhà Sóc lần này!  

Thông số kỹ thuật

ZOCKER INSPIRE PRO TF SNS là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.

Phần upper được làm từ chất liệu da PU cao cấp và mềm mại với khả năng giữ form tốt, ít bị bai nhão sau một thời gian sử dụng. Trên khắp bề mặt upper được in dập nổi các vân 3D hỗ trợ kiểm soát và rê bóng tốt hơn.  

Lưỡi gà rời mỏng giúp dễ xỏ chân vào giày, phù hợp với những anh em có mu bàn chân cao và dày.  

Lót giày với chất liệu cao su êm mềm, được thiết kế với các lỗ nhỏ giúp  thoáng khí hơn trong suốt quá trình thi đấu. 

Gót giày với khung định hìn...', 665000.00, 'src/data/images/products/main_b1c8dd00.jpg', 'ACTIVE', '6f5cd9b6-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('e4d2a08c-0538-44d4-b3c1-e33302ef6b0c', 'ADIDAS PREDATOR ACCURACY.1 TF - GZ0009 - TRẮNG/VÀNG CHANH', 'ADIDAS PREDATOR ACCURACY.1 TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Kiểm soát + chính xác = tự tin. Đó chính là công thức để tạo nên mẫu giày đá banh ADIDAS PREDATOR ACCURACY.1 TF hoàn toàn mới lần này! Sở hữu những công nghệ tiên tiến nhất hiện nay của nhà Ba Sọc, mẫu giày PREDATOR ACCURACY.1 TF sẽ giúp bạn tự tin làm chủ cuộc chơi, kiểm soát trận đấu!

Thông số kỹ thuật

ADIDAS PREDATOR ACCURACY.1 TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc: .1 (chuyên nghiệp)

Phần upper làm từ chất liệu da tổng hợp HybridTouch mềm mại. Bằng cách sử dụng loại chất liệu này, adidas đã làm giảm đáng kể trọng lượng của Predator Accuracy.1 TF so với người tiền nhiệm. 

Các vân cao su High Definition Grip được phủ ở khu vực má trong làm tăng độ ma sát với bóng, từ đó giúp người chơi có thể dễ dàng thực hiện các đường chuyền hay cú sút với độ chính xác cao. 

Phần cổ giày với cấu trúc Face Fit - đây là loại cổ giày hai mảnh làm từ chất liệu Primeknit, được thiết kế nhằm tạo r...', 1260000.00, 'src/data/images/products/main_2d8422a2.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('7a5791af-c86f-4b9a-bd88-77aa44df640a', 'NIKE TIEMPO LEGEND 10 ACADEMY TF - DV4342-800 - ĐỎ/TRẮNG', 'NIKE TIEMPO LEGEND 10 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Đầu tháng 7/2023, Nike chính thức trình làng thế hệ thứ 10 của dòng giày đá banh huyền thoại Tiempo. Lần đầu tiên trong lịch sử, nhà Swoosh đã loại bỏ chất liệu da tự nhiên trên upper của dòng giày này, thay vào đó hãng sử dụng loại chất liệu FlyTouch hoàn toàn mới. Nhờ cải tiến quan trọng này đã biến Legend 10 trở thành thế hệ Tiempo nhẹ nhất từ trước đến nay mà bạn có thể sở hữu!

Thông số kỹ thuật

NIKE TIEMPO LEGEND 10 ACADEMY TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5-7 người. 

Phân khúc: Academy (tầm trung).

Tiempo Legend 10 Academy TF sở hữu phần upper được làm từ chất liệu da tổng hợp FlyTouch Lite hoàn toàn mới. Mềm hơn, nhẹ hơn và bền hơn so với da tự nhiên, upper FlyTouch Lite sẽ mang lại cảm giác bóng thật chân cho người chơi. Đồng thời chúng còn giúp đảm bảo cảm giác ôm chân cho người chơi, giữ cho form giày không bị giãn quá mức sau một thời gian sử dụng.

Trên bề mặt upper FlyTouch Lite...', 2750000.00, 'src/data/images/products/main_4d05d012.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('821cd901-cf07-468c-89d6-f7e38411a6ac', 'ZOCKER INSPIRE PRO 2 TF SNS 009 - TRẮNG/HỒNG', 'Nếu bạn đang tìm một đôi giày đá banh bền – ôm chân – dễ làm quen trên sân cỏ nhân tạo, Inspire Pro Gen 2 là lựa chọn rất đáng cân nhắc.

Phiên bản màu tím cá tính không chỉ nổi bật mà còn ẩn chứa nhiều cải tiến đáng giá từ Zocker, giúp bạn chơi bóng ổn định hơn, xử lý bóng tự tin hơn ngay từ lần đầu mang thử.

Tại sao nên chọn Inspire Pro Gen 2?

Ôm chân vừa vặn nhưng không quá bó, phù hợp cả chân bè lẫn chân thon – đá nhẹ mà vẫn chắc.

Upper mềm, dễ làm quen – giúp kiểm soát bóng và chuyền bóng mượt mà hơn.

Đế TF cao su đúc nguyên khối, bám sân tốt, hỗ trợ tăng tốc và xoay trở linh hoạt.

Thiết kế tinh tế, form gọn, phối màu tím độc đáo – cực hợp cho những ai thích khác biệt.

Thông tin chi tiết:

Loại sân: Sân cỏ nhân tạo 5–7 người

Đinh giày: TF (cao su chống trượt)

Chất liệu upper: Da PU microfiber mềm – dễ vệ sinh, khó bong tróc

Form giày: Slimfit nhẹ – ôm chân nhưng vẫn thoải mái

Màu sắc: Tím phối đen nổi bật

Size: 38 – 44

Bảo hành: 3 tháng keo đế

Ai nên chọn phiên bản...', 665000.00, 'src/data/images/products/main_aef34fa4.jpg', 'ACTIVE', '6f5cd9b6-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('9a869428-39ac-4985-922e-8840dc8bc211', 'ZOCKER INSPIRE PRO 2 TF SNS 009 - CAM/VÀNG', 'Zocker Inspire Pro Gen 2 – Cam | Giày đá banh TF nổi bật cho sân cỏ nhân tạo

Nếu bạn là người chơi thích sự năng động, nổi bật và khác biệt, thì phiên bản màu cam rực rỡ của Inspire Pro Gen 2 là lựa chọn không thể bỏ qua.

Màu sắc cá tính kết hợp với thiết kế chắc chắn, bám sân tốt giúp bạn tự tin thể hiện bản thân và ghi dấu ấn trên sân cỏ nhân tạo.

 Điểm nổi bật của phiên bản màu cam

Upper mềm – ôm chân vừa phải, mang vào là đá ngay, không cần làm mềm.

Đế TF cao su chắc chắn, chống trượt tốt kể cả khi trời ẩm ướt.

Màu cam nổi bật, lên sân thấy là “cháy”, cực hợp cho những ai thích gây ấn tượng từ cái nhìn đầu tiên.

Thiết kế gọn gàng, phù hợp cả tập luyện, thi đấu lẫn đá giải.

 Thông tin chi tiết:

Loại sân: Cỏ nhân tạo 5–7 người

Đinh giày: TF (cao su đúc nguyên khối)

Chất liệu upper: Da PU microfiber – mềm, ít thấm nước

Form giày: Slimfit – ôm gọn bàn chân, dễ điều khiển bóng

Màu sắc: Cam phối đen cá tính

Size: 38 – 44

Bảo hành: 3 tháng keo đế

Ai hợp với bản cam?

Cầ...', 665000.00, 'src/data/images/products/main_ff05cbe1.jpg', 'ACTIVE', '6f5cd9b6-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('ec984e74-8405-4b08-8304-d3a5a97eebab', 'NIKE TIEMPO LEGEND 10 ACADEMY TF - DV4342-003 - ĐEN/XANH', 'NIKE TIEMPO LEGEND 10 ACADEMY TF – GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO – PHỐI MÀU ĐEN/ĐEN | SHADOW PACK (07/2025)

Shadow Pack là bộ sưu tập giày bóng đá được Nike ra mắt vào tháng 7/2025, mở màn cho mùa giải 2025/26 với phong cách tối giản nhưng mạnh mẽ. Lấy tông màu đen làm chủ đạo, phối màu Đen/Đen trên Tiempo Legend 10 Academy TF tạo nên vẻ bí ẩn, chắc chắn và đầy uy lực, phù hợp cho những cầu thủ đề cao kỹ thuật, sự tập trung và độ ổn định.

Thông số kỹ thuật

Mã sản phẩm: DV4342-003

Dòng giày: Nike Tiempo Legend 10 Academy TF

Phân khúc: Academy (cận cao cấp)

Loại đế: TF – Sân cỏ nhân tạo 5–7 người

Phối màu: Black / Black

Bộ sưu tập: Shadow Pack (07/2025)

Công nghệ & lợi ích nổi bật

Upper FlyTouch Lite – chất liệu da tổng hợp siêu mềm, được tinh chỉnh để mang lại cảm giác bóng tốt hơn, đồng thời giữ được độ ôm và hạn chế giãn trong quá trình sử dụng.

Bề mặt upper có các đường in nổi (micro-dots) giúp tăng khả năng kiểm soát bóng, rê bóng và chuyền chính xác trong mọi điều kiện...', 2050000.00, 'src/data/images/products/main_7e4bd587.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('1dbd74f4-8f3e-4862-bbd4-fd4b9bb99b03', 'NIKE PHANTOM GX 2 ACADEMY TF EH - HV4069-400 - TÍM THAN', 'PHANTOM GX 2 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Chơi bóng với sức mạnh và sự chính xác tuyệt đối cùng NIKE PHANTOM GX 2 ACADEMY TF. Được thiết kế cho các ngôi sao hàng đầu ở vị trí tấn công như Erling Haaland, Rodrygo, Phil Foden….PHANTOM GX 2 ACADEMY TF với những cải tiến đặc biệt sẽ giúp bạn phát huy toàn bộ khả năng tốt nhất của bản thân trên sân cỏ!

Thông số kỹ thuật

NIKE PHANTOM GX 2 ACADEMY TF là mẫu giày đá banh đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc : Academy (tầm trung)

Phần upper làm từ da tổng hợp mềm mại được mô phỏng theo chất liệu sợi dệt sẽ mang đến cảm giác thật chân nhất trong từng pha chạm bóng. Trên bề mặt Phantom GX Academy TF được trang bị thêm lớp phủ NikeSkin giúp tăng độ bám bóng, từ đó người chơi có thể kiểm soát và rê bóng tốt hơn ở bất kỳ điều kiện thời tiết. 

Công nghệ Strike Zone với các vân vòng tròn được in dập nổi ở những vùng tiếp xúc bóng chủ yếu giúp tăng thêm độ xoáy cho những cú phất bóng và cứa lòng. 

Hệ thống dây già...', 1290000.00, 'src/data/images/products/main_93c71958.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('7c029534-8ad6-4ba8-a605-046b4b420b3f', 'ADIDAS COPA PURE 3 LEAGUE TF - ID9045 - XANH NHẠT', 'ADIDAS COPA PURE 3 LEAGUE TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Dòng giày bóng đá adidas Copa Pure đã chính thức trở lại và sẵn sàng chinh phục trái tim của những tín đồ đam mê bóng đá! 

Được tinh chỉnh và nâng cấp với những công nghệ mới nhất, mẫu giày đá bóng ADIDAS COPA PURE 3 LEAGUE TF sẽ giúp bạn tự tin tỏa sáng trên sân cỏ bằng cảm giác chạm bóng êm ái cùng sự vừa vặn thoải mái.

Lấy cảm hứng từ vẻ đẹp bầu trời và không gian bên ngoài vũ trụ, bộ sưu tập adidas "Celestial Victory" 2025 đã khéo léo phối hợp các gam màu Blue Fusion, Lucid Lemon và Lucid Pink trên cả ba mẫu giày đá bóng. Nhờ đó, bộ sưu tập vừa sở hữu bản sắc riêng, vừa tạo được sự gắn kết chặt chẽ.

Trong bộ sưu tập "Celestial Victory", mẫu giày đá bóng adidas Copa Pure 3 mang vẻ đẹp tinh tế và có phần khiêm tốn hơn, nhưng vẫn thu hút ánh nhìn. Đôi giày sở hữu màu "Xanh nhạt" ánh bạc thanh lịch, kết hợp cùng các chi tiết màu "Xanh dương" và điểm nhấn "Xanh chanh" nổi bật.

Phối màu này sẽ "lên chân" những ngôi sao D...', 2790000.00, 'src/data/images/products/main_3bfd3155.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('fdbba3ca-62db-4b3b-91be-21ad403b4494', 'ZOCKER INSPIRE PRO 2 TF SNS 009 - ĐỎ/TRẮNG', 'Nếu bạn đang tìm một đôi giày đá banh bền – ôm chân – dễ làm quen trên sân cỏ nhân tạo, Inspire Pro Gen 2 là lựa chọn rất đáng cân nhắc.

Phiên bản màu tím cá tính không chỉ nổi bật mà còn ẩn chứa nhiều cải tiến đáng giá từ Zocker, giúp bạn chơi bóng ổn định hơn, xử lý bóng tự tin hơn ngay từ lần đầu mang thử.

Tại sao nên chọn Inspire Pro Gen 2?

Ôm chân vừa vặn nhưng không quá bó, phù hợp cả chân bè lẫn chân thon – đá nhẹ mà vẫn chắc.

Upper mềm, dễ làm quen – giúp kiểm soát bóng và chuyền bóng mượt mà hơn.

Đế TF cao su đúc nguyên khối, bám sân tốt, hỗ trợ tăng tốc và xoay trở linh hoạt.

Thiết kế tinh tế, form gọn, phối màu tím độc đáo – cực hợp cho những ai thích khác biệt.

Thông tin chi tiết:

Loại sân: Sân cỏ nhân tạo 5–7 người

Đinh giày: TF (cao su chống trượt)

Chất liệu upper: Da PU microfiber mềm – dễ vệ sinh, khó bong tróc

Form giày: Slimfit nhẹ – ôm chân nhưng vẫn thoải mái

Màu sắc: Tím phối đen nổi bật

Size: 38 – 44

Bảo hành: 3 tháng keo đế

Ai nên chọn phiên bản...', 665000.00, 'src/data/images/products/main_19d27bfd.jpg', 'ACTIVE', '6f5cd9b6-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('e0439838-031e-4a77-bced-af28f9629276', 'ZOCKER WINNER ENERGY TF - BẠC', 'ZOCKER WINNER ENERGY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Zocker Winner Energy - Cảm hứng đến từ Năng lượng chiến thắng

Giày bóng đá Zocker Winner Energy đỏ là 1 trong 5 phiên bản màu của bộ sưu tập mới, được thương hiệu Zocker giới thiệu tới những người yêu thích bóng đá trong hè này.

Giày bóng đá Zocker Winner Energy bạc được điểm thêm chi tiết màu trắng với điểm nhấn bắt mắt là các họa tiết độc đáo tạo bởi nhiều lát cắt laze. Ẩn sâu bên trong là nguồn "Năng lượng chiến thắng", mang tới cho người chơi sự tự tin, tích cực, tinh thần lạc quan.

Giày sở hữu nhiều cải tiến mới, bên cạnh đó là sự kế thừa những ưu điểm được đúc rút từ những thế hệ trước đó như Space, Inspire và Inspire Pro...

Upper được làm từ da PU cao cấp, cho cảm giác mềm và êm chân ngay từ khi tiếp xúc. Nhờ đó, người chơi không cần phải mất thời gian cho quá trình làm giãn giày - breakin. Ở nửa thân trên giày còn được gia cố các gờ nổi, giúp người chơi kiểm soát bóng tốt hơn

Một tính năng thường chỉ được trang bị ...', 665000.00, 'src/data/images/products/main_1cdf7042.jpg', 'ACTIVE', '6f5cd9b6-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('6d42c5a7-1041-407d-a9fa-52f6db685f33', 'NIKE PHANTOM 6 LOW ACADEMY TF - HQ2325-400 - XANH TÍM/ĐỎ CAM', 'NIKE PHANTOM 6 LOW ACADEMY TF – GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO – PHỐI MÀU ROYAL TINT/BRIGHT CRIMSON | SCARY GOOD PACK (07/2025)

Nike Phantom 6 Low Academy TF mang diện mạo mới trong Scary Good Pack (07/2025) với phối màu Royal Tint/Bright Crimson nổi bật, đem lại sự tự tin và sắc bén cho từng pha xử lý. Thiết kế tối ưu cho sân cỏ nhân tạo, kết hợp vùng chạm bóng mở rộng và form ôm gọn, giúp bạn kiểm soát trận đấu theo cách đáng sợ nhất.

Thông số kỹ thuật

Mã sản phẩm: HQ2325-400

Phối màu: Royal Tint/Bright Crimson

Bộ sưu tập: Scary Good Pack (07/2025)

Upper: NikeSkin với vùng tiếp xúc bóng mở rộng

Công nghệ: Cyclone 360 hỗ trợ xoay chuyển nhanh

Form giày: Shoe frame ôm gọn bàn chân

Đệm lót: Cushioned sockliner êm ái

Đế: TF (Turf) – chuyên dụng cho sân cỏ nhân tạo 5–7 người

Xuất xứ: Indonesia

Đặc điểm nổi bật

Thuộc Scary Good Pack, mang tinh thần sắc bén và nổi bật.

Phối màu Royal Tint/Bright Crimson rực rỡ, hiện đại.

NikeSkin touch zone mở rộng giúp kiểm soát và xử lý bó...', 1990000.00, 'src/data/images/products/main_cccc3f6d.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('3f00b2ac-3e5f-4a09-a59d-9efc0055b487', 'NIKE ZOOM MERCURIAL VAPOR 16 ACADEMY KM TF - FQ8384-800 - VÀNG/CAM', 'NIKE ZOOM MERCURIAL VAPOR 16 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Chinh phục những giới hạn tốc độ mới cùng mẫu giày đá bóng Nike Mercurial Vapor 16 Academy TF.

Sau chu kỳ 2 năm, tháng 7/2024, Nike đã chính thức trình làng thế hệ mới nhất của silo Air Zoom Mercurial. Nhẹ hơn - bền hơn - bùng nổ hơn, Mercurial Vapor 16 Academy TF sẽ là đôi giày bóng đá hoàn hảo dành cho những tín đồ đam mê tốc độ.

Thông số kỹ thuật

MERCURIAL VAPOR 16 ACADEMY TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5 đến 7 người. 

Phân khúc: Academy (tầm trung).

Form giày phù hợp cho chân thon đến bè vừa. 

Phần upper được làm từ da tổng hợp NikeSkin mềm mỏng và đàn hồi sẽ mang lại cảm giác bóng thật chân cho bạn. Bề mặt upper được phủ một lớp PU, không chỉ giúp tăng cường độ bền cho đôi giày mà còn làm tăng ma sát khi tiếp xúc bóng, giúp bạn kiểm soát bóng tốt hơn khi rê dắt ở tốc độ cao.

Lưỡi gà được thiết kế cố định ở phần nửa trên sẽ không gây ra tình trạng lệch lưỡi gà khi thi đấu. 

...', 2190000.00, 'src/data/images/products/main_ecd9acdc.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('feb174aa-441e-4e0b-92e4-0f830bd77c84', 'ASICS CALCETTO K LEATHER WD 9 TF - 1113A048-103 - TRẮNG/XANH LÁ', 'ASICS CALCETTO TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO  DA KANGAROO (WIDE 2E)

Asics Calcetto TF là dòng giày đá bóng được thiết kế riêng cho futsal và sân cỏ nhân tạo 5–7 người. Sản phẩm nổi bật với chất liệu da Kangaroo cao cấp mềm mại, kết hợp form bản rộng (2E) mang lại sự thoải mái tối đa cho người chơi có bàn chân bè. Đế TF chuyên dụng giúp bám sân chắc chắn, đảm bảo sự ổn định và linh hoạt trong từng pha xử lý.

Thông số kỹ thuật

Mã sản phẩm: 1113A048-103

Phối màu: Trắng/xanh lá

Bộ sưu tập: Calcetto Series

Chất liệu upper: Da Kangaroo tự nhiên

Đế: TF (Turf) - dành cho sân cỏ nhân tạo

Form giày: Wide Fit (2E) - phù hợp bàn chân bè

Đặc điểm nổi bật

Da Kangaroo mềm mại: ôm chân tự nhiên, tăng cảm giác bóng.

Form bản rộng 2E: thoải mái cho người chơi chân bè, không gây gò bó.

Đế TF bám sân tốt: hạn chế trơn trượt, hỗ trợ đổi hướng linh hoạt.

Đệm giày êm: giảm chấn thương, bảo vệ bàn chân khi thi đấu cường độ cao.

Thương hiệu Asics: nổi tiếng về sự ổn định và bền bỉ trong cá...', 1950000.00, 'src/data/images/products/main_929b8723.jpg', 'ACTIVE', '6f5cd916-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('e3d71ce9-8517-4ab2-a04a-3ac76197d622', 'MIZUNO MORELIA SALA JAPAN TF - Q1GB251104 - BẠC/VÀNG', 'Mizuno Morelia Sala Japan TF – Mã sản phẩm Q1GB251104

Đỉnh cao của nghệ thuật thủ công Nhật Bản

Được chế tác hoàn toàn thủ công tại Nhật Bản, Mizuno Morelia Sala Japan TF là biểu tượng của sự tỉ mỉ và chất lượng vượt trội. Mỗi đôi giày trải qua quy trình kiểm định nghiêm ngặt, đảm bảo mang đến cho người chơi cảm giác bóng chân thực và sự thoải mái tối đa trên sân cỏ nhân tạo.​

Chất liệu cao cấp – Da Kangaroo thượng hạng

Da Kangaroo Scotchguard mềm mại, mỏng nhẹ nhưng bền bỉ, mang lại cảm giác như đi "chân trần" và khả năng kiểm soát bóng tối ưu.

Thiết kế các đường khâu ngang và dọc ở phần mu bàn chân giúp lớp da co giãn linh hoạt, giảm ma sát và tăng cường độ nhạy khi xử lý bóng.

Lưỡi gà đục lỗ tăng cường độ thoáng khí, giữ cho đôi chân luôn khô ráo trong suốt trận đấu

Công nghệ tiên tiến – Hệ thống Wave Fit

Hệ thống Wave Fit thiết kế dạng zíc zắc đặc biệt, ôm sát bàn chân, hạn chế tối đa hiện tượng trượt chân bên trong giày.

Mang lại sự ổn định tuyệt đối, hỗ trợ tối ưu cho...', 4300000.00, 'src/data/images/products/main_090ed3a9.jpg', 'ACTIVE', '6f5cd833-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('492de77b-f6ff-418b-83ff-71f0b39794c9', 'NIKE TIEMPO LEGEND 10 ACADEMY TF - DV4342-402 - XANH XÁM/ĐEN', 'NIKE TIEMPO LEGEND 10 ACADEMY TF – GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO – PHỐI MÀU XANH XÁM/ĐEN | SCARY GOOD PACK (07/2025)

Scary Good Pack là bộ sưu tập giày bóng đá được Nike tung ra vào tháng 7/2025 nhằm chuẩn bị cho mùa giải mới 2025/26. Lấy cảm hứng từ màu sắc tối giản nhưng đầy uy lực, phối màu Xanh xám đậm / Đen mang đến diện mạo lạnh lùng, chắc chắn và đầy tính cạnh tranh cho đôi Tiempo Legend 10 phiên bản Academy TF.

Thông số kỹ thuật

Mã sản phẩm: DV4342-402

Dòng giày: Nike Tiempo Legend 10 Academy TF

Phân khúc: Academy (cận cao cấp)

Loại đế: TF – Sân cỏ nhân tạo 5–7 người

Phối màu: Blue Eclipse / Black / Metallic Silver

Bộ sưu tập: Scary Good Pack (07/2025)

Công nghệ & lợi ích nổi bật

Upper FlyTouch Lite – chất liệu da tổng hợp siêu mềm, được tinh chỉnh để mang lại cảm giác bóng tốt hơn, đồng thời giữ được độ ôm và hạn chế giãn trong quá trình sử dụng.

Bề mặt upper có các đường in nổi (micro-dots) giúp tăng khả năng kiểm soát bóng, rê bóng và chuyền chính xác trong mọi ...', 1990000.00, 'src/data/images/products/main_9b803360.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('f50aeed0-5237-44fb-a90c-58f99c0c84f0', 'MIZUNO MONARCIDA NEO III SELECT AS - P1GD252537 - TRẮNG/XANH LÁ', 'MIZUNO MONARCIDA NEO III SELECT TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Upper giày đá bóng sân cỏ nhân tạo Mizuno Monarcida Neo III Select As được sản xuất từ chất liệu da tổng hợp siêu mềm, mỗi cú sút, mỗi pha đi bóng của bạn trở nên mạnh mẽ và chính xác hơn bao giờ hết. Mizuno đã dành tâm huyết để tạo ra phần Upper giày với độ co giãn lý tưởng, giúp bạn thoải mái xử lý bóng trong mọi tình huống trên sân.

Form giày đá bóng sân cỏ nhân tạo Mizuno Monarcida Neo III Select As được thiết kế đặc biệt phù hợp với bàn chân người Châu Á, đặc biệt là người Việt và những người có bàn chân bè có thể sử dụng thoải mái trên sân cỏ.

Không chỉ mang lại cảm giác êm ái, gót giày đá bóng sân cỏ nhân tạo Mizuno Monarcida Neo III Select As được cải tiến với chất liệu mềm mịn đảm bảo sự chắc chắn và bảo vệ tối đa cho gót chân của bạn, giúp bạn tập trung hoàn toàn vào trận đấu.

Đế giày có 2 loại đinh: Đinh vòng ngoài có hình tam giác giúp tăng bề mặt tiếp xúc giữa giày và mặt sân. Bên trong là các đinh tr...', 2850000.00, 'src/data/images/products/main_61bcfdb5.jpg', 'ACTIVE', '6f5cd833-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('7eba21c0-67e4-4322-9666-eb2172887cce', 'MIZUNO MORELIA SALA JAPAN TF - Q1GB250260 - ĐỎ/TRẮNG', 'MIZUNO MORELIA SALA JAPAN TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO - PHỐI MÀU ĐỎ/TRẮNG

Mizuno Morelia Sala Japan TF - Q1GB250260 nằm trong bộ sưu tập Red Ruby Pack (thu đông 25 - series nổi bật được Mizuno giới thiệu với sắc đỏ ruby rực rỡ, tượng trưng cho nhiệt huyết và tinh thần thi đấu mãnh liệt. Phối màu Đỏ/Trắng mang lại diện mạo mạnh mẽ, khác biệt nhưng vẫn giữ trọn phong cách tinh giản đặc trưng của dòng Morelia “Made in Japan”, nơi hiệu năng và sự hoàn thiện đạt đến độ chuẩn mực.

Upper da Kangaroo cao cấp - Cảm giác như đi chân trần

Sở hữu phần upper làm từ da Kangaroo Scotchguard mềm, mịn, mỏng nhưng vô cùng chắc chắn.

Mang lại cảm giác linh hoạt và tự nhiên, gần như “chân trần”.

Các đường khâu ngang - dọc ở mu bàn chân cho phép lớp da di chuyển linh hoạt theo mọi hướng, hạn chế ma sát và tăng độ êm khi chạm bóng.

Phần lưỡi gà đục lỗ giúp thông thoáng tối đa, duy trì cảm giác khô thoáng ngay cả trong những trận đấu cường độ cao.

Hệ thống viền Wave Fit - Ôm chân tối đa

Thiế...', 4300000.00, 'src/data/images/products/main_30ab6020.jpg', 'ACTIVE', '6f5cd833-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('7819fea9-2fc3-4971-9bd4-3205fcec785c', 'NIKE ZOOM MERCURIAL VAPOR 15 ACADEMY MDS TF - FJ7191-300 - XANH LÁ', 'NIKE MERCURIAL VAPOR 15 ACADEMY MDS TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Tháng 6/2022, Nike chính thức trình làng thế hệ tiếp theo của dòng giày Mercurial mang tên Air Zoom Mercurial. Cải tiến lớn nhất trên thế hệ này nằm ở bộ đệm Zoom Air được thiết kế độc quyền cho bóng đá. Bên cạnh đó, mọi chi tiết trên đôi giày lần này đều được thiết kế nhằm tối ưu hoá lối chơi tốc độ. 

Thông số kỹ thuật
Mẫu giày đá bóng MERCURIAL ZOOM VAPOR 15 ACADEMY MDS TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.

Phân khúc: Academy (Tầm trung).

Upper làm từ da tổng hợp mềm mại giúp tăng cảm giác bóng. Ở thế hệ 15 này, hãng đã phủ thêm lớp NikeSkin trên bề mặt upper làm tăng độ bám bóng, từ đó có thể kiểm soát bóng và rê bóng tốt hơn. 

Cấu trúc Speed Cage bên dưới bề mặt upper được làm từ chất liệu mỏng nhưng cực kỳ chắc chắn sẽ mang đến sự ôm chân vừa khít, đồng thời hạn chế sự xê dịch chân trong giày khi thi đấu ở cường độ cao.

Lưỡi gà được thiết kế cố định ở phần nửa trên sẽ không gâ...', 1260000.00, 'src/data/images/products/main_082dc661.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('37742f00-0cc4-40c3-8da1-bfe14bf71072', 'ADIDAS PREDATOR 25 LEAGUE LƯỠI GÀ LẬT TF - JQ1074 - CAM/XANH', 'ADIDAS PREDATOR 25 LEAGUE L TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO CHÍNH HÃNG

Hãy sẵn sàng ra sân và ghi bàn cùng mẫu giày bóng đá ADIDAS PREDATOR 25 LEAGUE L TF! Được cải tiến để tối ưu hóa khả năng tấn công của người chơi, ADIDAS PREDATOR 25 LEAGUE L TF với những công nghệ tiên tiến nhất của nhà Ba Sọc sẽ mang đến cho bạn sức mạnh bứt phá và độ chính xác tuyệt đối trong từng pha bóng.

Thông số kỹ thuật: 

ADIDAS PREDATOR LEAGUE L TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc: League (tầm trung).

Form giày phù hợp cho chân thon đến bè vừa.

Phần upper được làm từ chất liệu da nhân tạo Hybridfeel mềm mỏng và đàn hồi, giúp mang lại cảm giác chạm bóng thật chân nhất cho người chơi. 

Ở khu vực má trong là các vân 3D Strikescale được in dập nổi giúp tăng độ ma sát với bóng, từ đó hỗ trợ người chơi kiểm soát bóng tốt hơn trong mọi tình huống.

Lưỡi gà rời mềm mỏng giúp người chơi dễ dàng xỏ chân vào giày hơn trước, phù hợp cho những anh em có mu bàn chân cao...', 2850000.00, 'src/data/images/products/main_ac79af80.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('1b4a3afc-951d-4921-8a00-bd7ababccbc5', 'ZOCKER INSPIRE PRO 2 TF SNS 009 - XANH/TRẮNG', 'Nếu bạn đang tìm một đôi giày đá banh bền – ôm chân – dễ làm quen trên sân cỏ nhân tạo, Inspire Pro Gen 2 là lựa chọn rất đáng cân nhắc.

Sắc xanh ngọc (1 trong 4 phiên bản màu của bộ sản phẩm) mang đến sự tươi mới, thể hiện khát vọng bứt phá, phù hợp với tinh thần của 1 chiến binh sân cỏ. Trong thể thao, xanh ngọc không chỉ mang lại nguồn năng lượng dồi dào mà còn tượng trưng cho sự tỉnh táo, bền bỉ, những tố chất không thể thiếu của cầu thủ đỉnh cao.

Tại sao nên chọn Inspire Pro Gen 2?

Ôm chân vừa vặn nhưng không quá bó, phù hợp cả chân bè lẫn chân thon – đá nhẹ mà vẫn chắc.

Upper mềm, dễ làm quen – giúp kiểm soát bóng và chuyền bóng mượt mà hơn.

Đế TF cao su đúc nguyên khối, bám sân tốt, hỗ trợ tăng tốc và xoay trở linh hoạt.

Thiết kế tinh tế, form gọn, phối màu tím độc đáo – cực hợp cho những ai thích khác biệt.

Thông tin chi tiết:

Loại sân: Sân cỏ nhân tạo 5–7 người

Đinh giày: TF (cao su chống trượt)

Chất liệu upper: Da PU microfiber mềm – dễ vệ sinh, khó bong tróc

Fo...', 665000.00, 'src/data/images/products/main_60a4be04.jpg', 'ACTIVE', '6f5cd9b6-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('f8ab8204-96fe-4d55-afa1-77b055efb960', 'PUMA FUTURE 8 MATCH TT - 108370-01 - ĐEN/TÍM', 'PUMA FUTURE 8 MATCH TT - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Vượt qua mọi giới hạn trên sân cỏ cùng PUMA FUTURE 8 MATCH TT! Được thiết kế với những công nghệ hàng đầu từ nhà Báo Đức, Future 8 Match TT sẽ giúp bạn thỏa sức sáng tạo mỗi khi ra sân.

Ra sân, cảm nhận và tạo sự khác biệt - đó chính là những gì Future 8 mới nhất sẽ mang lại cho bạn!

PUMA “Unlimited Pack” là bộ sưu tập giày đá bóng đầu tiên trong năm 2025 của nhà Báo Đức. Sở hữu phối màu “PUMA Black/PUMA White/Glowing Red” đầy cuốn hút, mẫu giày đá bóng PUMA Future 8 “Unlimited Pack” hiện đang được những ngôi sao như Neymar Jr., Kai Havertz, Jack Grealish, Marc Cucurella, James Maddison…lên chân.

Thông số kỹ thuật:

PUMA FUTURE 8 MATCH TT là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5 đến 7 người.

Phân khúc: Match (tầm trung). 

Form giày phù hợp cho chân từ bè ít đến bè nhiều.

Phần upper được làm từ chất liệu vải mesh mềm, mỏng và nhẹ giúp mang lại cảm giác bóng thật chân nhất cho người chơi. 

Trên bề mặt upper l...', 1290000.00, 'src/data/images/products/main_1a61cc2a.jpg', 'ACTIVE', '6f5cd8bb-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('464b6499-ad46-41a5-8381-d602e6aecfa2', 'NIKE PHANTOM 6 LOW PRO TF - HJ4123-400 - XANH TÍM/ĐỎ CAM', 'NIKE PHANTOM 6 PRO TF – GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO – PHỐI MÀU XANH TÍM/ĐỎ CAM | SCARY GOOD PACK (07/2025)

Kiểm soát trận đấu theo cách hoàn toàn mới

Nike Phantom 6 Pro TF là thế hệ giày kiểm soát bóng mới nhất của nhà Swoosh, được thiết kế dành riêng cho những cầu thủ chơi bóng bằng trí óc và kỹ thuật. Đây là dòng giày giúp bạn tự tin xử lý trong không gian hẹp, rê bóng khéo léo và điều tiết nhịp trận đấu trên mặt sân cỏ nhân tạo.

Phối màu nằm trong bộ sưu tập Scary Good Pack (07/2025), nổi bật với sự kết hợp độc đáo giữa tông tím nhạt Royal Tint và đỏ cam sáng Bright Crimson, tạo nên một diện mạo phá cách, thu hút mọi ánh nhìn trên sân.

Thông số kỹ thuật

Dòng giày: Nike Phantom 6 Pro TF 

Bề mặt: Sân cỏ nhân tạo 5–7 người (Turf)

Phối màu: Royal Tint / Bright Crimson

Mã sản phẩm: HJ4123‑400

Bộ sưu tập: Scary Good Pack – tháng 07/2025

Phân khúc: Pro (cao cấp)

Công nghệ & trải nghiệm nổi bật

Upper VNMSkin + Flyknit: cấu trúc sợi co giãn, cho cảm giác bóng chính xác và độ ...', 1990000.00, 'src/data/images/products/main_72f374a4.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('22135c4e-a735-465c-b69f-4755a56f4ac8', 'NIKE ZOOM MERCURIAL SUPERFLY 10 ACADEMY TF - FQ8331-001 - ĐEN/XANH', 'NIKE ZOOM MERCURIAL SUPERFLY 10 ACADEMY TF – GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO – PHỐI MÀU ĐEN/ICE BLUE | SHADOW PACK (07/2025) 

Shadow Pack là bộ sưu tập giày đá bóng mà Nike giới thiệu vào tháng 7/2025 với hướng đi tối giản nhưng đầy uy lực. Mẫu Mercurial Superfly 10 Academy TF phối màu Đen chủ đạo điểm xuyết tông Ice Blue tạo nên vẻ ngoài bí ẩn, tinh tế và mạnh mẽ, phù hợp với những cầu thủ muốn khẳng định tốc độ, kỹ thuật và phong thái thi đấu quyết đoán.

Thông số kỹ thuật

Mã sản phẩm: FQ8331-600

Phân khúc: Academy (trung cấp)

Loại đế: TF – Sân cỏ nhân tạo 5–7 người

Phối màu: Đen/xanh

Bộ sưu tập: Shadow Pack (07/2025)

Mô tả chi tiết sản phẩm
Upper & cảm giác bóng

Phần upper sử dụng vật liệu tổng hợp NikeSkin với cấu trúc mỏng, nhẹ, linh hoạt, mang lại cảm giác tiếp xúc bóng gần như chân trần.

Bề mặt phủ vân mịn giúp kiểm soát bóng tốt hơn trong điều kiện sân khô hoặc ẩm.

Thiết kế cổ giày Dynamic Fit bằng chất liệu dệt co giãn ôm sát cổ chân, tăng độ ổn định nhưng vẫn dễ man...', 2190000.00, 'src/data/images/products/main_62c640e4.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('d10ec018-6660-4cf0-938b-459006a13fe7', 'KAMITO ARTISTA KL TF - KMTF240414 - ĐỎ', 'KAMITO ARTISTA KL TF – GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Kamito Artista KL TF là mẫu giày bóng đá lấy cảm hứng từ phong cách nghệ thuật và lối chơi kỹ thuật của huyền thoại Nguyễn Hồng Sơn. Đôi giày này mang đến khả năng kiểm soát bóng linh hoạt, cảm giác chân thật như đi chân trần, giúp bạn tự tin thể hiện phong cách riêng trên sân cỏ nhân tạo.

Ưu điểm nổi bật

Upper da Kangaroo cao cấp: siêu mềm, cho cảm giác bóng tự nhiên, kiểm soát tối đa từ khống chế, rê dắt cho đến dứt điểm.

Đệm Ka-Comfort êm ái: giảm chấn hiệu quả, bảo vệ đầu gối và cột sống, duy trì sự thoải mái trong suốt trận đấu.

Lót giày thông thoáng & bền bỉ: chống sụp lún với công nghệ Anti-Collapse, hỗ trợ di chuyển linh hoạt.

Form Ka-Fit chuẩn bàn chân Việt: ôm vừa vặn, phù hợp cả người chơi có bàn chân bè.

Đế Combat TF bám sân vượt trội: kết hợp đinh kim cương và mũi tên định hướng, giúp xoay chuyển nhanh, tăng tốc và bứt phá mạnh mẽ.

Thông tin sản phẩm

Loại giày: sân cỏ nhân tạo, đinh TF

Chất liệu upper: Da thậ...', 499000.00, 'src/data/images/products/main_a857ceae.jpg', 'ACTIVE', 'afab8492-009e-49c6-83f3-195245560477', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('4a5c4f45-f8a9-4c8b-aa05-5e5bb961b87a', 'JOMA FS REACTIVE TF 2432 - TRẮNG/XANH', 'JOMA FS REACTIVE 2432 TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Được phát triển dành cho những cầu thủ chơi bóng trên mặt sân cỏ nhân tạo, JOMA FS REACTIVE 25 TF hướng đến hiệu suất cao, độ êm tốt và độ bám sân ổn định. Thiết kế đinh TF giúp di chuyển chắc chân, đổi hướng nhanh mà vẫn giữ được cảm giác thoải mái trong suốt trận đấu.

Thông số kỹ thuật

JOMA FS REACTIVE 25 TF mã FSW2432TF là mẫu giày đá bóng đế TF dành cho các mặt sân cỏ nhân tạo (cỏ nhân tạo 5-7 người, mặt cỏ thấp, nền sân cứng).

Phần upper được làm từ chất liệu da cao cấp theo mô tả của hãng, cho độ mềm vừa phải và độ ôm chân tốt, giúp cải thiện cảm giác bóng khi khống chế, chuyền và sút. Bề mặt da tương đối láng, hạn chế ma sát gây phồng rộp khi đá lâu.

Trên bề mặt upper có các lỗ thoáng VTS giúp tăng cường khả năng thoát mồ hôi, giữ bàn chân dễ chịu hơn trong điều kiện thi đấu nóng hoặc chơi nhiều trận liên tiếp.

Vùng mũi giày được gia cố PROTECTION, hỗ trợ bảo vệ các đầu ngón chân khi thực hiện những pha chích mũi, ...', 1550000.00, 'src/data/images/products/main_4b4850d8.jpg', 'ACTIVE', '6f5cd968-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('1e052c4d-2d98-477c-a86d-e95eb93aa911', 'PUMA KING MATCH TT - 107260-04 - VÀNG/ĐEN', 'PUMA KING MATCH TT - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Kiểm soát trận đấu chưa bao giờ thoải mái đến vậy với mẫu giày đá bóng PUMA KING MATCH TT. Một biểu tượng trên thị trường giày bóng đá, silo King đã chính thức quay trở lại với những cải tiến quan trọng, hứa hẹn sẽ mang đến trải nghiệm chơi bóng hoàn hảo nhất cho người chơi! 

Thông số kỹ thuật

PUMA KING MATCH TT là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5-7 người.

Phân khúc: Match (tầm trung).

Phần upper được làm từ chất liệu sợi microfiber mềm mại nhưng không kém phần bền bỉ sẽ mang đến cảm giác bóng tốt nhất cho người chơi. Trên khu vực đầu mũi và má trong giày còn được thiết kế những đường vân hình tam giác làm tăng độ ma sát với bóng, từ đó giúp người chơi dễ dàng rê và kiểm soát bóng tốt hơn. 

Lưỡi gà rời được thiết kế phù hợp với nhiều form chân, đặc biệt là những anh em có mu chân cao và dày. 

Lớp đệm gót làm từ chất liệu vải lưới mềm mịn, mang đến cảm giác ôm chân vừa vặn và thoải mái. 

Bộ đệm EVA tạo cảm ...', 1290000.00, 'src/data/images/products/main_5c70e519.jpg', 'ACTIVE', '6f5cd8bb-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('fb47039c-ab6d-4cd5-b76b-b0f049478a75', 'ADIDAS F50 LEAGUE TF - IF1336 - XANH/HỒNG', 'ADIDAS F50 LEAGUE TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Sau 9 năm vắng bóng, huyền thoại adidas F50 đã chính thức trở lại - nhẹ hơn, nhanh hơn và lợi hại hơn! Được thiết kế để khai phá trọn vẹn tiềm năng tốc độ của người chơi, mẫu giày đá bóng sân cỏ nhân tạo adidas F50 League TF sẽ là sự lựa chọn hoàn hảo dành cho những tiền vệ và tiền đạo ưu tiên sự nhanh nhẹn và thanh thoát trong lối chơi của mình.  

"Reemergence Pack" là bộ sưu tập giày bóng đá chính thức đầu tiên của adidas cho mùa giải 24/25. Sở hữu phối màu "Solar Blue/Ftwr White/Solar Pink" đầy độc đáo được lấy cảm hứng F50 Adizero "Neon Pink" và bộ sưu tập "Battle Pack" 2014, mẫu giày đá bóng adidas F50 "Reemergence Pack" hiện đang được những ngôi sao hàng đầu adidas mang trên chân như Mohamed Salah, Lamine Yamal, Julian Alvarez, Son Heung Min, Florian Wirtz, Brahim Diaz, Luis Diaz...  

Thông số kỹ thuật

ADIDAS F50 LEAGUE TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.  

Phân khúc: League (tầm trung).

Phầ...', 1950000.00, 'src/data/images/products/main_c5ab517d.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('f56fa814-e355-4659-808f-029e172e41e7', 'NIKE PHANTOM 6 HIGH ACADEMY TF - HQ2277-400 - XANH TÍM/ĐỎ CAM', 'NIKE PHANTOM 6 HIGH ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO - PHỐI MÀU TÍM NHẠT/ĐỎ CAM | SCARY GOOD PACK (07/2025)

Phantom 6 – Kiểm soát và chính xác vượt trội

Nike Phantom 6 High Academy TF là phiên bản cao cổ thuộc dòng kiểm soát bóng mới nhất, được thiết kế giúp bạn cảm nhận bóng gần hơn, xử lý chính xác và tự tin trong mọi pha rê, chuyền, sút trên mặt sân nhỏ. Phiên bản Academy TF mang lại trải nghiệm cao cấp với mức giá phù hợp.

Phối màu nằm trong Scary Good Pack (07/2025) – nổi bật với tông xanh tím / đỏ cam, mang lại cảm giác vừa ma mị vừa cuốn hút trên sân.

Thông số sản phẩm

Mã SKU: HQ2277-400

Dòng giày: Phantom 6 High Academy TF (cao cổ)

Sử dụng: Sân cỏ nhân tạo 5–7 người (Turf)

Phân khúc: Academy – cận cao cấp, phù hợp thực chiến

Phối màu: Royal Tint / Bright Crimson

Bộ sưu tập: Scary Good Pack – phát hành tháng 07/2025

Công nghệ & lợi ích nổi bật

NikeSkin Touch Zone mở rộng (engineered mesh) giúp bạn “cảm” bóng tốt hơn ở những vùng tiếp xúc cực kỳ quan trọng...', 1990000.00, 'src/data/images/products/main_cad499d0.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('fe1db275-ccb3-4400-b04e-5f48b3daffdc', 'NIKE ZOOM MERCURIAL SUPERFLY 9 ACADEMY TF - DJ5629-040 - ĐEN/XANH', 'NIKE ZOOM MERCURIAL SUPERFLY 9 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Tháng 6/2022, Nike chính thức trình làng thế hệ tiếp theo của dòng giày Mercurial mang tên Air Zoom Mercurial. Cải tiến lớn nhất trên thế hệ này nằm ở bộ đệm Zoom Air được thiết kế độc quyền cho bóng đá. Bên cạnh đó, mọi chi tiết trên đôi giày lần này đều được thiết kế nhằm tối ưu hoá lối chơi tốc độ. 

Thông số kỹ thuật

Mẫu giày đá bóng MERCURIAL ZOOM SUPERFLY 9 ACADEMY TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.

Phân khúc: Academy (Tầm trung).

Upper làm từ da tổng hợp mềm mại giúp tăng cảm giác bóng. Ở thế hệ 15 này, hãng đã phủ thêm lớp NikeSkin trên bề mặt upper làm tăng độ bám bóng, từ đó có thể kiểm soát bóng và rê bóng tốt hơn. 

Cấu trúc Speed Cage bên dưới bề mặt upper được làm từ chất liệu mỏng nhưng cực kỳ chắc chắn sẽ mang đến sự ôm chân vừa khít, đồng thời hạn chế sự xê dịch chân trong giày khi thi đấu ở cường độ cao.

Phần cổ thun Dynamic Fit sẽ giúp ôm trọn cổ chân của bạ...', 1260000.00, 'src/data/images/products/main_5bbee11e.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('b23fbd80-77b2-48cd-930a-f24bd6dc6caf', 'ADIDAS COPA PURE 3 LEAGUE TF - ID9044 - TRẮNG/ĐỎ', 'ADIDAS COPA PURE 3 LEAGUE TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Dòng giày bóng đá adidas Copa Pure đã chính thức trở lại và sẵn sàng chinh phục trái tim của những tín đồ đam mê bóng đá! 

Được tinh chỉnh và nâng cấp với những công nghệ mới nhất, mẫu giày đá bóng ADIDAS COPA PURE 3 LEAGUE TF “Pure Victory” sẽ giúp bạn tự tin tỏa sáng trên sân cỏ bằng cảm giác chạm bóng êm ái cùng sự vừa vặn thoải mái.

“Pure Victory Pack” là bộ sưu tập giày đá bóng chính thức đầu tiên trong năm 2025 của adidas. Sở hữu phối màu “White/Lucid Red/Black” đầy ấn tượng, mẫu giày đá bóng adidas Copa Pure 3 “Pure Victory Pack” sẽ là sự lựa chọn hàng đầu của những ngôi sao như Declan Rice, Alexis Mac Allister, İlkay Gündoğan, David de Gea, Josko Gvardiol….trong thời gian tới đây!

Thông số kỹ thuật

ADIDAS COPA PURE 3 LEAGUE TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc: League (tầm trung).

Form giày phù hợp cho chân thon đến bè vừa.

Phần upper làm từ chất liệu da nhân tạo Fusion...', 1850000.00, 'src/data/images/products/main_1dff2b8b.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('e8998313-37b6-4f33-9a43-474857f6ebc2', 'NIKE TIEMPO LEGEND 10 ACADEMY TF - DV4342-401 - XANH/HỒNG', 'NIKE TIEMPO LEGEND 10 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Đầu tháng 7/2023, Nike chính thức trình làng thế hệ thứ 10 của dòng giày đá banh huyền thoại Tiempo. Lần đầu tiên trong lịch sử, nhà Swoosh đã loại bỏ chất liệu da tự nhiên trên upper của dòng giày này, thay vào đó hãng sử dụng loại chất liệu FlyTouch hoàn toàn mới. Nhờ cải tiến quan trọng này đã biến Legend 10 trở thành thế hệ Tiempo nhẹ nhất từ trước đến nay mà bạn có thể sở hữu!

Thông số kỹ thuật

NIKE TIEMPO LEGEND 10 ACADEMY TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5-7 người. 

Phân khúc: Academy (tầm trung).

Tiempo Legend 10 Academy TF sở hữu phần upper được làm từ chất liệu da tổng hợp FlyTouch Lite hoàn toàn mới. Mềm hơn, nhẹ hơn và bền hơn so với da tự nhiên, upper FlyTouch Lite sẽ mang lại cảm giác bóng thật chân cho người chơi. Đồng thời chúng còn giúp đảm bảo cảm giác ôm chân cho người chơi, giữ cho form giày không bị giãn quá mức sau một thời gian sử dụng.

Trên bề mặt upper FlyTouch Lite...', 2750000.00, 'src/data/images/products/main_29e0ec91.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('f5456862-c3f9-4e0f-8748-3e992eacda23', 'KAMITO CỎ NHÂN TẠO VELOCIDAD PRO TF FIRE BACK - KMTF240220 - XANH MINT', 'KAMITO CỎ NHÂN TẠO VELOCIDAD PRO TF FIRE BACK - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Giày đá bóng sân cỏ nhân tạo Kamito Velocidad Pro TF Fire Back được Kamito nâng cấp bộ đế với các công nghệ hiện đại, mang lại sự thoải mái cho đôi bàn chân, giúp phát huy tối đa tốc độ suốt trận đấu, đảm bảo độ bám sân, độ linh hoạt và đem đến những trải nghiệm ưu việt cho người chơi.

Giày đá bóng sân cỏ nhân tạo Kamito Velocidad Pro TF Fire Back thuộc bộ sưu tập Fire Back, được lấy cảm hứng từ nguồn năng lượng bất tận của những chiến binh trên sân cỏ với niềm đam mê cháy bỏng khi bước vào trận đấu. Bên cạnh đó, sản phẩm còn thể hiện sức hút mãnh liệt và nóng bỏng của bộ môn thể thao vua được thu hút cả nam lẫn nữ.

Thông số kỹ thuật:

- Upper giày đá bóng sân cỏ nhân tạo Kamito Velocidad Pro TF Fire Back được làm từ da tổng hợp cao cấp cùng họa tiết ngọn lửa trải đều trên thân giày đá bóng sân cỏ nhân tạo Kamito Velocidad Pro TF Fire Back, cấu trúc đệm dưới bề mặt upper mang đến cảm giác...', 665000.00, 'src/data/images/products/main_e1f23974.jpg', 'ACTIVE', 'afab8492-009e-49c6-83f3-195245560477', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('32230b93-4ae3-4913-80a9-508416e52699', 'KAMITO ARTISTA KL TF - KMTF240420 - XANH DƯƠNG', 'Sản phẩm đang có mặt tại Shop Giày Đá Banh Chính Hãng - Thanh Hùng Futsal:

Thanh Hùng Futsal Store I: 27 ĐƯỜNG D52, P. 12, Q. TÂN BÌNH, TP. HCM | ĐT: 0901 377 722

Thanh Hùng Futsal Store II: 32A THẠCH THỊ THANH, P. TÂN ĐỊNH, Q. 1, TP. HCM | ĐT: 0901 710 730

Thanh Hùng Futsal Store III: 48 PHẠM VĂN BẠCH, P. 15, Q. TÂN BÌNH, TP. HCM | ĐT: 0901 710 780', 499000.00, 'src/data/images/products/main_0b32d784.jpg', 'ACTIVE', 'afab8492-009e-49c6-83f3-195245560477', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('da540cab-4cc4-42fc-ab41-6248019303b2', 'PUMA ULTRA MATCH TT - 106903-03 - WORLD CUP', 'PUMA ULTRA MATCH TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Nâng cấp các trận đấu của bạn lên một tầm cao mới với thế hệ tiếp theo của dòng giày tốc độ thuộc nhà Báo. PUMA ULTRA MATCH TT được thiết kế với những cải tiến đáng kể so với thế hệ trước, nhằm mang lại trải nghiệm tự tin và bùng nổ hơn cho người mang. 

World Cup từ lâu đã được xem như là đỉnh cao, là thước đo của sự thành công trong sự nghiệp của bất cứ cầu thủ nào, và cũng là sân khấu tuyệt vời nhất để 1 ngôi sao có thể tỏa sáng. Nhằm khuyến khích các ngôi sao có thể trình diễn thứ bóng đá của mình một cách không sợ hãi khi mà cả thế giới đều đang dõi theo họ, PUMA đã ra mắt bộ sưu tập “Fearless Pack”.

Thông số kỹ thuật

PUMA ULTRA MATCH TT là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5-7 người. 

Phân khúc: Match (tầm trung)

Phần upper làm từ da tổng hợp dạng lưới siêu nhẹ, được phủ bên trên lớp GRIP CONTROL làm tăng độ bám bóng và nâng cao khả năng kiểm soát bóng, giúp người chơi có thể chơi bóng ở mọi điều kiện thờ...', 1290000.00, 'src/data/images/products/main_aaa78db0.jpg', 'ACTIVE', '6f5cd8bb-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('c6ef3476-0fdb-44dc-8b01-f99e62eacfce', 'KAMITO CỎ NHÂN TẠO VELOCIDAD PRO TF FIRE BACK - KMTF240230 - VÀNG/TRẮNG', 'KAMITO CỎ NHÂN TẠO VELOCIDAD PRO TF FIRE BACK - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Giày đá bóng sân cỏ nhân tạo Kamito Velocidad Pro TF Fire Back được Kamito nâng cấp bộ đế với các công nghệ hiện đại, mang lại sự thoải mái cho đôi bàn chân, giúp phát huy tối đa tốc độ suốt trận đấu, đảm bảo độ bám sân, độ linh hoạt và đem đến những trải nghiệm ưu việt cho người chơi.

Giày đá bóng sân cỏ nhân tạo Kamito Velocidad Pro TF Fire Back thuộc bộ sưu tập Fire Back, được lấy cảm hứng từ nguồn năng lượng bất tận của những chiến binh trên sân cỏ với niềm đam mê cháy bỏng khi bước vào trận đấu. Bên cạnh đó, sản phẩm còn thể hiện sức hút mãnh liệt và nóng bỏng của bộ môn thể thao vua được thu hút cả nam lẫn nữ.

Thông số kỹ thuật:

- Upper giày đá bóng sân cỏ nhân tạo Kamito Velocidad Pro TF Fire Back được làm từ da tổng hợp cao cấp cùng họa tiết ngọn lửa trải đều trên thân giày đá bóng sân cỏ nhân tạo Kamito Velocidad Pro TF Fire Back, cấu trúc đệm dưới bề mặt upper mang đến cảm giác...', 665000.00, 'src/data/images/products/main_11b4b3c4.jpg', 'ACTIVE', 'afab8492-009e-49c6-83f3-195245560477', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('7e9d9a69-2b3e-4fd9-adda-82c3e9d78ed9', 'NIKE ZOOM MERCURIAL SUPERFLY 9 ACADEMY TF - DR5948-810 - NÂU BẠC', 'NIKE ZOOM MERCURIAL SUPERFLY 9 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Tháng 6/2022, Nike chính thức trình làng thế hệ tiếp theo của dòng giày Mercurial mang tên Air Zoom Mercurial. Cải tiến lớn nhất trên thế hệ này nằm ở bộ đệm Zoom Air được thiết kế độc quyền cho bóng đá. Bên cạnh đó, mọi chi tiết trên đôi giày lần này đều được thiết kế nhằm tối ưu hoá lối chơi tốc độ. 

Lấy cảm hứng từ lớp thế hệ cầu thủ trẻ đang nâng bóng đá lên một tầm cao mới, Nike chính thức cho ra mắt bộ sưu tập giày đá banh “Generation Pack” cho kỳ World Cup 2022. Đây là bộ sưu tập sẽ bao gồm 3 silo chính của hãng là Air Zoom Mercurial, Phantom GT 2 và Tiempo Legend 9 trong những phối màu vô cùng ấn tượng.

Thông số kỹ thuật

Mẫu giày đá bóng MERCURIAL ZOOM SUPERFLY 9 ACADEMY TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.

Phân khúc: Academy (Tầm trung).

Upper làm từ da tổng hợp mềm mại giúp tăng cảm giác bóng. Ở thế hệ 15 này, hãng đã phủ thêm lớp NikeSkin trên bề mặt upper làm tăng đ...', 1260000.00, 'src/data/images/products/main_57aaaff4.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('d049dcfc-25b2-4a21-8e7c-6fdc3949913d', 'NIKE ZOOM MERCURIAL VAPOR 16 ACADEMY TF - FQ8449-301 - XÁM XANH/HỒNG', 'NIKE ZOOM MERCURIAL VAPOR 16 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Chinh phục những giới hạn tốc độ mới cùng mẫu giày đá bóng Nike Mercurial Vapor 16 Academy TF.

Sau chu kỳ 2 năm, tháng 7/2024, Nike đã chính thức trình làng thế hệ mới nhất của silo Air Zoom Mercurial. Nhẹ hơn - bền hơn - bùng nổ hơn, Mercurial Vapor 16 Academy TF sẽ là đôi giày bóng đá hoàn hảo dành cho những tín đồ đam mê tốc độ.

Thông số kỹ thuật

MERCURIAL VAPOR 16 ACADEMY TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5 đến 7 người. 

Phân khúc: Academy (tầm trung).

Form giày phù hợp cho chân thon đến bè vừa. 

Phần upper được làm từ da tổng hợp NikeSkin mềm mỏng và đàn hồi sẽ mang lại cảm giác bóng thật chân cho bạn. Bề mặt upper được phủ một lớp PU, không chỉ giúp tăng cường độ bền cho đôi giày mà còn làm tăng ma sát khi tiếp xúc bóng, giúp bạn kiểm soát bóng tốt hơn khi rê dắt ở tốc độ cao.

Lưỡi gà được thiết kế cố định ở phần nửa trên sẽ không gây ra tình trạng lệch lưỡi gà khi thi đấu. 

...', 2750000.00, 'src/data/images/products/main_80835bbf.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('b87387e7-0a6b-404d-a416-e363acf68bae', 'NIKE TIEMPO LEGEND 10 ACADEMY TF - DV4342-700 - TRẮNG KEM', 'NIKE TIEMPO LEGEND 10 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Đầu tháng 7/2023, Nike chính thức trình làng thế hệ thứ 10 của dòng giày đá banh huyền thoại Tiempo. Lần đầu tiên trong lịch sử, nhà Swoosh đã loại bỏ chất liệu da tự nhiên trên upper của dòng giày này, thay vào đó hãng sử dụng loại chất liệu FlyTouch hoàn toàn mới. Nhờ cải tiến quan trọng này đã biến Legend 10 trở thành thế hệ Tiempo nhẹ nhất từ trước đến nay mà bạn có thể sở hữu!

Thông số kỹ thuật

NIKE TIEMPO LEGEND 10 ACADEMY TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5-7 người. 

Phân khúc: Academy (tầm trung).

Tiempo Legend 10 Academy TF sở hữu phần upper được làm từ chất liệu da tổng hợp FlyTouch Lite hoàn toàn mới. Mềm hơn, nhẹ hơn và bền hơn so với da tự nhiên, upper FlyTouch Lite sẽ mang lại cảm giác bóng thật chân cho người chơi. Đồng thời chúng còn giúp đảm bảo cảm giác ôm chân cho người chơi, giữ cho form giày không bị giãn quá mức sau một thời gian sử dụng.

Trên bề mặt upper FlyTouch Lite...', 1260000.00, 'src/data/images/products/main_1a6c595f.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('eac5a7e6-6cb3-45bc-82f7-4fd4871dae04', 'MIZUNO MORELIA NEO IV PRO AS - P1GD253537 - TRẮNG/XANH LÁ', 'MIZUNO MORELIA NEO IV PRO AS - THẾ HỆ MỚI NHẤT GIÀY BÓNG ĐÁ MIZUNO CHÍNH THỨC MỞ BÁN TẠI VIỆT NAM

Với công nghệ đã được nâng cấp mang đến trọng lượng tối ưu, cảm giác tối đa.

Chất liệu da Kangaroo siêu mềm đã được Mizuno sử dụng hiệu quả trên phần Upper giày, hỗ trợ tối đa cho các cầu thủ khi nhận bóng, đi bóng, những pha sút mu uy lực và tạo cảm giác như đi chân trần.

Form giày đặc biệt phù hợp với bàn chân người Việt, những cầu thủ chân bè hoàn toàn có thể sử dụng mà không gặp chút khó khăn nào.

Là mẫu giày thuộc phân khúc cao cấp, Morelia Neo IV Pro AS được trang bị lớp đệm giảm chấn cao cấp, tạo sự êm ái thoải mái cho các cầu thủ trong suốt trận đấu dù mặt sân không được đảm bảo.

Phần gót giày là điểm thay đổi lớn trong phiên bản này mang đến sự chắc chắn, cứng cáp, ôm sát và bảo vệ tối đa gót chân cầu thủ.

Hệ thống đinh dăm trên Morelia Neo IV Pro AS là đinh chữ L được làm từ chất liệu cao su tự nhiên với ưu điểm nhẹ, êm, đàn hồi tối ưu giúp các cầu thủ có thể đổi hướng l...', 2850000.00, 'src/data/images/products/main_45f953bf.jpg', 'ACTIVE', '6f5cd833-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('fd0d9edb-3f94-42e7-ad49-9fb41cccf054', 'NIKE ZOOM MERCURIAL VAPOR 16 PRO TF - FQ8687-700 - XANH CHUỐI', 'NIKE MERCURIAL VAPOR 16 PRO TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Sau chu kỳ 2 năm, tháng 7/2024, Nike đã chính thức trình làng thế hệ mới nhất của silo Air Zoom Mercurial. Nhẹ hơn - bền hơn - bùng nổ hơn, Mercurial Vapor 16 Pro TF sẽ là đôi giày bóng đá hoàn hảo dành cho những tín đồ đam mê tốc độ.

Thông số kỹ thuật

MERCURIAL VAPOR 16 PRO TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5 đến 7 người. 

Phân khúc: Pro (Chuyên nghiệp).

Form giày phù hợp cho chân thon đến bè vừa. 

Phần upper được làm hoàn toàn từ chất liệu sợi dệt Flyknit siêu nhẹ và mỏng với khả năng thích ứng tốt theo bàn chân người mang sẽ đem lại trải nghiệm chạm bóng hoàn hảo. Đặc biệt, đây cũng là lần đầu tiên sợi dệt Flyknit xuất hiện trên một thế hệ Mercurial Vapor phân khúc sân cỏ nhân tạo.

Trên bề mặt upper được trang bị một lớp phủ làm tăng độ ma sát, giúp bạn kiểm soát bóng tốt hơn khi rê dắt ở tốc độ cao và sẵn sàng ghi bàn trong bất kỳ tình huống. 

Đặc biệt, Mercurial Vapor 16 Pro TF còn được...', 2790000.00, 'src/data/images/products/main_f7a29896.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('9c3c3bd1-f3fb-481c-b600-2fee0e31cd4d', 'PUMA FUTURE 8 PRO CAGE - 108366-03 - XANH DẠ QUANG/ĐEN', 'PUMA FUTURE 8 PRO CAGE - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Vượt qua mọi giới hạn trên sân cỏ cùng PUMA FUTURE 8 PRO CAGE! Được thiết kế với những công nghệ hàng đầu từ nhà Báo Đức, Future 8 Pro Cage sẽ giúp bạn thỏa sức sáng tạo mỗi khi ra sân.

Ra sân, cảm nhận và tạo sự khác biệt - đó chính là những gì Future 8 mới nhất sẽ mang lại cho bạn!

Đón chào một mùa xuân mới cũng như chuẩn bị cho giai đoạn nước rút quan trọng của mùa giải, PUMA đã chính thức trình làng bộ sưu tập giày đá bóng “Audacity Pack” đầy ấn tượng. Trong những trận đấu sắp tới đây, các cầu thủ đại diện của thương hiệu sẽ chính thức lên chân pack giày này như: Neymar Jr., Kai Havertz, Jack Grealish, Marc Cucurella, James Maddison,...

“Audacity Pack” mang đến một phối màu rực rỡ khác cho thế hệ Future 8 mới, cùng với đó là phiên bản Ultra được thiết kế tinh tế hơn và King cao cấp hơn.

Thông số kỹ thuật:

PUMA FUTURE 8 PRO CAGE là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5 đến 7 người.

Phân khúc: Pro (chuyên ...', 1290000.00, 'src/data/images/products/main_d43d9c51.jpg', 'ACTIVE', '6f5cd8bb-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('9e386d86-f94e-4ae7-b6c9-26df3d849c71', 'NIKE REACT PHANTOM GX 2 PRO TF - FJ2583-300 - XANH MINT', 'NIKE PHANTOM GX 2 PRO TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Chơi bóng với sức mạnh và sự chính xác tuyệt đối cùng NIKE PHANTOM GX 2 PRO TF. Với sự trở lại của những công nghệ tiên tiến nhất nhà Nike như sợi dệt Flyknit, công nghệ ACC (All Conditions Control)....PHANTOM GX 2 PRO TF sẽ giúp bạn phát huy trọn vẹn khả năng chơi bóng của bản thân trên sân cỏ! 

Thông số kỹ thuật

NIKE PHANTOM GX 2 PRO TF là mẫu giày đá banh đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc: Pro (cao cấp).

Phần upper được làm từ chất liệu sợi dệt Flyknit siêu mỏng và nhẹ, nhưng vẫn giữ được độ bền và đàn hồi cần thiết để tối ưu cho những pha di chuyển linh hoạt của người chơi trên sân cỏ. Trên bề mặt upper được trang bị công nghệ ACC giúp người chơi có thể kiểm soát bóng tốt nhất trong mọi điều kiện thời tiết.

Công nghệ Strike Zone với các vân vòng tròn được in dập nổi ở những vùng tiếp xúc bóng chủ yếu giúp tăng thêm độ xoáy cho những cú phất bóng và cứa lòng. 

Hệ thống dây giày đặc trưng của silo Ph...', 2750000.00, 'src/data/images/products/main_05357796.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('36a77d5f-c4a0-4d7c-8ee9-2248ef9d80b0', 'ASICS CALCETTO K LEATHER WD 9 TF - 1113A048-101 - TRẮNG/ĐEN', 'ASICS CALCETTO TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO  DA KANGAROO (WIDE 2E)

Asics Calcetto TF là dòng giày đá bóng được thiết kế riêng cho futsal và sân cỏ nhân tạo 5–7 người. Sản phẩm nổi bật với chất liệu da Kangaroo cao cấp mềm mại, kết hợp form bản rộng (2E) mang lại sự thoải mái tối đa cho người chơi có bàn chân bè. Đế TF chuyên dụng giúp bám sân chắc chắn, đảm bảo sự ổn định và linh hoạt trong từng pha xử lý.

Thông số kỹ thuật

Mã sản phẩm: 1113A048-101

Phối màu: Trắng/đen

Bộ sưu tập: Calcetto Series

Chất liệu upper: Da Kangaroo tự nhiên

Đế: TF (Turf) - dành cho sân cỏ nhân tạo

Form giày: Wide Fit (2E) - phù hợp bàn chân bè

Đặc điểm nổi bật

Da Kangaroo mềm mại: ôm chân tự nhiên, tăng cảm giác bóng.

Form bản rộng 2E: thoải mái cho người chơi chân bè, không gây gò bó.

Đế TF bám sân tốt: hạn chế trơn trượt, hỗ trợ đổi hướng linh hoạt.

Đệm giày êm: giảm chấn thương, bảo vệ bàn chân khi thi đấu cường độ cao.

Thương hiệu Asics: nổi tiếng về sự ổn định và bền bỉ trong các dò...', 1750000.00, 'src/data/images/products/main_33716e18.jpg', 'ACTIVE', '6f5cd916-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('ac8f18bb-57d3-4551-adb7-325ce7ed0f9d', 'PUMA ULTRA ULTIMATE CAGE - 107745-03 - VÀNG CAM', 'PUMA ULTRA ULTIMATE CAGE TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Nhanh hơn - bùng nổ hơn - hãy nâng cấp lối chơi tốc độ của bạn với phiên bản ULTRA ULTIMATE CAGE 2023 mới. PUMA ULTRA ULTIMATE CAGE đã trở lại với những cải tiến đáng kể so với phiên bản trước, nhằm mang lại trải nghiệm tự tin và bùng nổ hơn cho người mang trong suốt quá trình chơi bóng. 

“Forever Faster Pack” là bộ sưu tập được PUMA ra mắt nhằm chuẩn bị cho một mùa hè đầy sôi động với sự trở lại của EURO 2024 và Copa America 2024. Sở hữu phối màu “Sun Stream/Puma Black/Sunset Glow” đầy bắt mắt, mẫu giày đá bóng Ultra Ultimate “Forever Faster Pack” sẽ được những ngôi sao hàng đầu PUMA mang trên chân như Antoine Griezmann, Antony, Kyle Walker, Raphael Varane, Christian Pulisic, Kingsley Coman...

Thông số kỹ thuật:

PUMA ULTRA ULTIMATE CAGE là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.

Phân khúc: Ultimate (chuyên nghiệp).

Phần upper được làm từ sợi dệt ULTRAWEAVE siêu nhẹ với cấu trúc co giãn 4 chiều giúp ...', 1290000.00, 'src/data/images/products/main_bca1bfe0.jpg', 'ACTIVE', '6f5cd8bb-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('2f955b42-270c-4362-93ae-9397038c89cc', 'NIKE PHANTOM LUNA 2 ACADEMY TF - FJ2566-300 - XANH MINT', 'NIKE PHANTOM LUNA 2 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Chơi bóng với sức mạnh và sự chính xác tuyệt đối cùng NIKE PHANTOM LUNA 2 ACADEMY TF. Được thiết kế cho các ngôi sao hàng đầu ở vị trí tấn công như Kevin De Bruyne, Erling Haaland, Phil Foden….PHANTOM LUNA 2 ACADEMY TF với những cải tiến đặc biệt sẽ giúp bạn phát huy toàn bộ khả năng tốt nhất của bản thân trên sân cỏ!

Thông số kỹ thuật

NIKE PHANTOM LUNA 2 ACADEMY TF là mẫu giày đá banh đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc : Academy (tầm trung).

Phần upper làm từ da tổng hợp mềm mại được mô phỏng theo chất liệu sợi dệt sẽ mang đến cảm giác thật chân nhất trong từng pha chạm bóng. Trên bề mặt Phantom Luna 2 Academy TF được trang bị thêm lớp phủ NikeSkin giúp tăng độ bám bóng, từ đó người chơi có thể kiểm soát và rê bóng tốt hơn ở bất kỳ điều kiện thời tiết. 

Công nghệ Strike Zone với các vân vòng tròn được in dập nổi ở những vùng tiếp xúc bóng chủ yếu giúp tăng thêm độ xoáy cho những cú phất bóng và cứ...', 2750000.00, 'src/data/images/products/main_ddfe58e7.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('91bbf46c-bf65-4cb8-bdbf-8e215d1b8509', 'ADIDAS X SPEEDPORTAL.3 TF - GZ2471 - CAM/ĐEN', 'ADIDAS X SPEEDPORTAL.3 TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Mùa hè 2022, thế giới bóng đá đón chào sự xuất hiện của những thế hệ tiếp theo thuộc các silo giày đá banh đình đám nhất hiện nay. Trong đó không thể không kể đến X Speedportal - thế hệ tiếp theo của dòng giày adidas X. X Speedportal sẽ đem đến những thay đổi về mặt chất liệu và công nghệ giày tiên tiến nhất của adidas nhằm giúp người mang có được trải nghiệm chơi bóng tuyệt vời nhất.

Xét về thiết kế, X Speedportal có form dáng thon gọn đậm chất tốc độ, phù hợp với lối chơi yêu cầu tốc độ và sự linh hoạt cao như tiền đạo, tiền vệ, hậu vệ cánh… Logo Ba Sọc đặc trưng của hãng nay đã được đặt ở vùng mũi má ngoài, tạo nên một thiết kế hiện đại và trẻ trung hơn. 

Thông số kỹ thuật:

X SPEEDPORTAL.3 TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc: .3 (tầm trung)

Phần upper làm từ chất liệu da tổng hợp pha sợi dệt giúp mang lại cảm giác bóng thật chân, hỗ trợ cho những pha rê dắt hay sút, chuyền bóng....', 1750000.00, 'src/data/images/products/main_2fae5107.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('943f3619-4e3e-44f0-bdf0-9d7bf17f48fb', 'ADIDAS X SPEEDPORTAL.1 TF - GW8973 - XANH LÁ MẠ', 'ADIDAS X SPEEDPORTAL.1 TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Mùa hè 2022, thế giới bóng đá đón chào sự xuất hiện của những thế hệ tiếp theo thuộc các silo giày đá banh đình đám nhất hiện nay. Trong đó không thể không kể đến X Speedportal - thế hệ tiếp theo của dòng giày adidas X. X Speedportal sẽ đem đến những thay đổi về mặt chất liệu và công nghệ giày tiên tiến nhất của adidas nhằm giúp người mang có được trải nghiệm chơi bóng tuyệt vời nhất.

Xét về thiết kế, X Speedportal có form dáng thon gọn đậm chất tốc độ, phù hợp với lối chơi yêu cầu tốc độ và sự linh hoạt cao như tiền đạo, tiền vệ, hậu vệ cánh… Logo Ba Sọc đặc trưng của hãng nay đã được đặt ở vùng mũi má ngoài, tạo nên một thiết kế hiện đại và trẻ trung hơn. 

“GAME DATA PACK” là BST được adidas ra mắt nhằm chuẩn bị cho UEFA Women''s Euro 2022 và giai đoạn đầu mùa giải 22/23, với tâm điểm sự chú ý thuộc về X Speedportal.

Thông số kỹ thuật:

X SPEEDPORTAL.1 TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phâ...', 1750000.00, 'src/data/images/products/main_3e1dcc08.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('147b162d-6a54-4bff-89cd-d15e9d7b9c5b', 'ADIDAS F50 LEAGUE TF - JH7724 - TÍM/TRẮNG/VÀNG', 'ADIDAS F50 LEAGUE TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO - PHỐI MÀU TÍM/TRẮNG/VÀNG | RADIANT BLAZE PACK (07/2025)
Radiant Blaze Pack – Ánh sáng bùng nổ mở màn mùa giải mới

Radiant Blaze Pack là bộ sưu tập giày đá bóng mới nhất được adidas trình làng vào tháng 07/2025, đánh dấu bước khởi động cho mùa giải 2025/26. Lấy cảm hứng từ nguồn năng lượng bùng cháy của mặt trời, ánh sáng rực rỡ của bình minh và sự cuốn hút huyền bí của vũ trụ, bộ sưu tập này mang đến những phối màu cực kỳ táo bạo và bắt mắt.

Trong phối màu Tím/Trắng/Vàng, adidas đã khéo léo pha trộn giữa sắc Solar Purple (tím hoàng hôn), White Spark (trắng ánh sáng) và Solar Gold (vàng mặt trời) – tạo nên tổng thể vừa cuốn hút thị giác, vừa mang tính biểu tượng về sức mạnh và tốc độ.

Radiant Blaze không chỉ là một bộ sưu tập thời trang – đó còn là tuyên ngôn về lối chơi tấn công trực diện, bứt tốc rực lửa và sẵn sàng tỏa sáng trong mọi tình huống trên sân cỏ.

Các phối màu thuộc pack này cũng đồng loạt xuất hiện trên chân các s...', 2790000.00, 'src/data/images/products/main_077c362d.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('4feb2e5e-28db-4b01-be06-5eac2443d86c', 'NIKE TIEMPO LEGEND 10 ACADEMY TF - DV4342-001 - XÁM/BẠC', 'NIKE TIEMPO LEGEND 10 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Đầu tháng 7/2023, Nike chính thức trình làng thế hệ thứ 10 của dòng giày đá banh huyền thoại Tiempo. Lần đầu tiên trong lịch sử, nhà Swoosh đã loại bỏ chất liệu da tự nhiên trên upper của dòng giày này, thay vào đó hãng sử dụng loại chất liệu FlyTouch hoàn toàn mới. Nhờ cải tiến quan trọng này đã biến Legend 10 trở thành thế hệ Tiempo nhẹ nhất từ trước đến nay mà bạn có thể sở hữu!

Thông số kỹ thuật

NIKE TIEMPO LEGEND 10 ACADEMY TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5-7 người. 

Phân khúc: Academy (tầm trung).

Tiempo Legend 10 Academy TF sở hữu phần upper được làm từ chất liệu da tổng hợp FlyTouch Lite hoàn toàn mới. Mềm hơn, nhẹ hơn và bền hơn so với da tự nhiên, upper FlyTouch Lite sẽ mang lại cảm giác bóng thật chân cho người chơi. Đồng thời chúng còn giúp đảm bảo cảm giác ôm chân cho người chơi, giữ cho form giày không bị giãn quá mức sau một thời gian sử dụng.

Trên bề mặt upper FlyTouch Lite...', 2450000.00, 'src/data/images/products/main_73eb4e5b.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('371cccb0-9827-4b8d-9034-b2883350efc2', 'JOMA TOP FLEX TF 2502 - TRẮNG/XANH MINT', 'JOMA TOP FLEX TF 2502 - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Nâng cấp trải nghiệm chơi bóng của bạn thông qua mẫu giày đá banh JOMA TOP FLEX TF 2502 được thiết kế riêng cho bề mặt sân cỏ nhân tạo nhưng không kém phần ổn định và linh hoạt so với phiên bản đế IC cho sân futsal, từ đó giúp cho người mang có thể tự tin trình diễn lối chơi tốt nhất của bản thân.  

Thông số kỹ thuật

JOMA TOP FLEX TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.

Phần upper được làm từ da nhân tạo mềm mại nhưng không kém phần bền bỉ, giúp mang đến cảm giác bóng thật chân cho người mang. Vùng đầu mũi còn được bọc da lộn giúp tăng độ bền cho giày. Bên cạnh đó, khu vực đầu mũi này còn được trang bị thêm khung bọc nhựa hỗ trợ cho những pha ra chân bằng đầu mũi giày trở nên uy lực hơn. 

Trên phần thân giày được trang bị các lỗ thoát khí theo công nghệ VTS giúp cho đôi giày trở nên thoáng khí hơn, đảm bảo sự thoải mái trong suốt quá trình thi đấu.

Lưỡi gà rời làm từ chất liệu vải lưới với êm mềm, gi...', 1950000.00, 'src/data/images/products/main_d4d0aedd.jpg', 'ACTIVE', '6f5cd968-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('e98e6963-e311-4aee-9676-e9cf9a6f340b', 'ADIDAS PREDATOR 25 LEAGUE L TF - JI1134 - TRẮNG/ĐEN/VÀNG', 'ADIDAS PREDATOR 24 LEAGUE L TF JI1134 - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Ghi bàn từ mọi hướng cùng mẫu giày bóng đá ADIDAS PREDATOR 24 LEAGUE L TF. Được thiết kế nhằm phục vụ cho lối chơi ghi bàn, ADIDAS PREDATOR 24 LEAGUE L TF với những công nghệ tiên tiến nhất của nhà Ba Sọc sẽ đem đến cho bạn sức mạnh và sự chính xác trong từng đường bóng.

Thông số kỹ thuật

ADIDAS PREDATOR 24 LEAGUE L TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc: League (tầm trung).

Phần upper làm từ chất liệu da tổng hợp Hybridfeel mềm mại và đàn hồi, mang đến cảm giác bóng thật chân nhất cho người chơi.

Các vân 3D Strikescale được in dập nổi ở khu vực má trong làm tăng độ ma sát với bóng, từ đó giúp người chơi có thể dễ dàng thực hiện các đường chuyền hay cú sút với độ xoáy và chính xác cao.  

Lưỡi gà rời mềm mỏng giúp người chơi dễ dàng xỏ chân vào giày hơn trước, phù hợp cho những anh em có mu bàn chân cao và dày.  

Hệ thống dây giày được thiết kế lệch sang một bên giúp mở r...', 1750000.00, 'src/data/images/products/main_e50a683e.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('c90b0a0f-18a6-479f-b101-ba8ecf2eb3dc', 'PUMA ULTRA 6 PRO CAGE - 108549-01 - XANH/TRẮNG/ĐỎ', 'PUMA ULTRA 6 PRO CAGE TT - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Bộ sưu tập: Untamed Pack (07/2025).

Sản phẩm đang có mặt tại Shop Giày Đá Banh Chính Hãng - Thanh Hùng Futsal:

Thanh Hùng Futsal Store I: 27 ĐƯỜNG D52, P. 12, Q. TÂN BÌNH, TP. HCM | ĐT: 0901 377 722

Thanh Hùng Futsal Store II: 32A THẠCH THỊ THANH, P. TÂN ĐỊNH, Q. 1, TP. HCM | ĐT: 0901 710 730

Thanh Hùng Futsal Store III: 48 PHẠM VĂN BẠCH, P. 15, Q. TÂN BÌNH, TP. HCM | ĐT: 0901 710 780', 1290000.00, 'src/data/images/products/main_8435116b.jpg', 'ACTIVE', '6f5cd8bb-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('645ee2ce-9f3a-43d4-8e1c-c4098116a90f', 'ADIDAS F50 LEAGUE TF - IF1343 - TRẮNG/XANH', 'ADIDAS F50 LEAGUE TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Sau 9 năm vắng bóng, huyền thoại adidas F50 đã chính thức trở lại - nhẹ hơn, nhanh hơn và lợi hại hơn! Được thiết kế để khai phá trọn vẹn tiềm năng tốc độ của người chơi, mẫu giày đá bóng sân cỏ nhân tạo adidas F50 League TF sẽ là sự lựa chọn hoàn hảo dành cho những tiền vệ và tiền đạo ưu tiên sự nhanh nhẹn và thanh thoát trong lối chơi của mình.  

“Advancement Pack” là bộ sưu tập giày bóng đá chính thức của adidas tại EURO và Copa America 2024. Sở hữu phối màu “Ftwr White/Solar Red/Lucid Blue” đầy bắt mắt và đậm chất tốc độ, mẫu giày đá bóng F50 “Advancement Pack” sẽ được những ngôi sao hàng đầu adidas như Florian Wirtz, Julian Alvarez, Lamine Yamal, Darwin Nunez, Rafael Leao….mang trên chân tại 2 giải vô địch châu lục quan trọng nhất mùa hè này!

Thông số kỹ thuật

ADIDAS F50 LEAGUE TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.  

Phân khúc: League (tầm trung).

Phần upper được làm từ chất liệu da tổng hợp Fi...', 1950000.00, 'src/data/images/products/main_5a3eb980.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('5aba8ce7-cc1d-467a-981c-952024cba7ab', 'NIKE ZOOM MERCURIAL SUPERFLY 10 ACADEMY TF - FQ8331-600 - HỒNG TÍM/CAM', 'NIKE ZOOM MERCURIAL SUPERFLY 10 ACADEMY TF – GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO – PHỐI MÀU HỒNG TÍM/CAM CHÁY | SCARY GOOD PACK (07/2025)

Scary Good Pack là bộ sưu tập giày bóng đá mới nhất từ Nike ra mắt vào tháng 7/2025, mở đầu cho mùa giải 2025/26. Với phối màu Hồng tím / Cam cháy nổi bật và đậm chất cá tính, mẫu Zoom Mercurial Superfly 10 Academy TF FQ8331-600 mang đến cảm hứng bứt phá mạnh mẽ – đúng với tinh thần tốc độ và bùng nổ của dòng Mercurial.

Thông số kỹ thuật

Mã sản phẩm: FQ8331-600

Phân khúc: Academy (trung cấp)

Loại đế: TF – Sân cỏ nhân tạo 5–7 người

Phối màu: Hồng tím/Cam cháy

Bộ sưu tập: Scary Good Pack (07/2025)

Mô tả chi tiết sản phẩm
Upper & cảm giác bóng

Phần upper sử dụng vật liệu tổng hợp NikeSkin với cấu trúc mỏng, nhẹ, linh hoạt, mang lại cảm giác tiếp xúc bóng gần như chân trần.

Bề mặt phủ vân mịn giúp kiểm soát bóng tốt hơn trong điều kiện sân khô hoặc ẩm.

Thiết kế cổ giày Dynamic Fit bằng chất liệu dệt co giãn ôm sát cổ chân, tăng độ ổn định nhưng vẫ...', 1990000.00, 'src/data/images/products/main_321a590e.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('4a44d3a9-024e-46df-94df-801163aa1952', 'ADIDAS PREDATOR 25 LEAGUE LƯỠI GÀ LẬT TF - JS0384 - ĐỎ/TRẮNG', 'ADIDAS PREDATOR 25 LEAGUE LƯỠI GÀ LẬT TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO CHÍNH HÃNG

Hãy sẵn sàng ra sân và ghi bàn cùng mẫu giày bóng đá ADIDAS PREDATOR 25 LEAGUE L TF! Được cải tiến để tối ưu hóa khả năng tấn công của người chơi, ADIDAS PREDATOR 25 LEAGUE L TF với những công nghệ tiên tiến nhất của nhà Ba Sọc sẽ mang đến cho bạn sức mạnh bứt phá và độ chính xác tuyệt đối trong từng pha bóng.

“Pure Victory Pack” là bộ sưu tập giày đá bóng chính thức đầu tiên trong năm 2025 của adidas. Sở hữu phối màu “Lucid Red/Cloud White/Core Black” đầy mạnh mẽ, mẫu giày đá bóng adidas Predator “Pure Victory Pack” sẽ là sự lựa chọn hàng đầu của những ngôi sao Jude Bellingham, Pedri, Raphinha, Trent Alexander-Arnold, Paulo Dybala….trong thời gian tới đây!

Thông số kỹ thuật: 

ADIDAS PREDATOR LEAGUE LƯỠI GÀ LẬT TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc: League (tầm trung).

Form giày phù hợp cho chân thon đến bè vừa.

Phần upper được làm từ chất liệu da nhân tạo ...', 1750000.00, 'src/data/images/products/main_9266b7e5.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('abf05b3b-1ae0-418e-9190-1500c416f029', 'MIZUNO ALPHA 2 ELITE AS - P1GD256209 - TRẮNG/BẠC/XANH', 'MIZUNO ALPHA 2 ELITE AS - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Khám phá đôi giày thể thao Mizuno Alpha ELITE – sự kết hợp hoàn hảo giữa hiệu suất vượt trội và cảm giác thoải mái. Được thiết kế dành riêng cho những vận động viên và người yêu thể thao, mẫu giày này mang đến trải nghiệm tuyệt vời trong mỗi bước di chuyển.

Cấu Trúc 6 Lớp Mới - Tăng Cường Cảm Giác Vừa Vặn

Được cải tiến với cấu trúc 6 lớp cho phần trên giày, Mizuno Alpha ELITE mang lại cảm giác ôm chân nhẹ nhàng và linh hoạt. Công nghệ ZEROGLIDE α MESH mở rộng ra phần trước bàn chân, giúp tối ưu hóa sự vừa vặn và hỗ trợ tối đa khi di chuyển.

Chất Liệu Cao Cấp, Bền Bỉ

Phần trên: Chất liệu da tổng hợp cao cấp mang lại sự bền bỉ và thoải mái, giúp bạn tự tin trong mọi bài tập.

Đế giày: Được làm từ chất liệu tổng hợp, Mizuno Alpha ELITE mang đến trọng lượng nhẹ và khả năng đàn hồi vượt trội, cho cảm giác mềm mại trong từng bước đi.

Công Nghệ KaRVO RS™ - Đệm Cao Cấp

Với KaRVO RS™, đôi giày này không chỉ giảm thiểu năng lượng m...', 1750000.00, 'src/data/images/products/main_7e6de8b6.jpg', 'ACTIVE', '6f5cd833-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('4f1d6e2b-f14f-4ddf-ab6c-cb829586766d', 'NIKE PHANTOM 6 LOW PRO TF - HJ4123-800 - VÀNG CHANH/ĐEN', 'NIKE PHANTOM 6 LOW PRO TF - MAX VOLTAGE PACK (10.2025)

Giày đá bóng sân cỏ nhân tạo chính hãng

Kiểm soát trận đấu theo cách hoàn toàn mới

Nike Phantom 6 Pro TF là thế hệ giày kiểm soát bóng mới nhất của nhà Swoosh, được thiết kế dành riêng cho những cầu thủ chơi bóng bằng trí óc và kỹ thuật. Đây là dòng giày giúp bạn tự tin xử lý trong không gian hẹp, rê bóng khéo léo và điều tiết nhịp trận đấu trên mặt sân cỏ nhân tạo.

Phối màu nằm trong bộ sưu tập Max Voltage Pack (10/2025), nổi bật với sự kết hợp độc đáo giữa tông Vàng chanh rực cháy, tạo nên một diện mạo phá cách, thu hút mọi ánh nhìn trên sân.

Thông số kỹ thuật

Dòng giày: Nike Phantom 6 Pro TF 

Bề mặt: Sân cỏ nhân tạo 5-7 người (Turf)

Phối màu: Hyper Crimson/Limelight/Black

Mã sản phẩm: HJ4123‑800

Bộ sưu tập: Max Voltage Pack - tháng 10/2025

Phân khúc: Pro (cao cấp)

Công nghệ & trải nghiệm nổi bật

Upper VNMSkin + Flyknit: cấu trúc sợi co giãn, cho cảm giác bóng chính xác và độ bám bóng tối ưu khi rê, chuyền, sút.

...', 2790000.00, 'src/data/images/products/main_5c64f249.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('9a951f91-eb0a-4770-95a2-6b29954a2a46', 'NIKE ZOOM MERCURIAL SUPERFLY 10 ACADEMY TF - FQ8331-300 - VÀNG CHANH/ĐEN', 'NIKE MERCURIAL SUPERFLY 10 ACADEMY TF - LIMELIGHT/HYPER CRIMSON/VOLT

Là mẫu giày đinh TF thuộc bộ sưu tập MAX VOLTAGE PACK (10/2025) - series mang sắc màu điện áp cao, thể hiện tinh thần tốc độ, táo bạo và bùng nổ. Phối màu LIMELIGHT/HYPER CRIMSON/VOLT nổi bật với tông vàng chanh pha cam rực rỡ, tạo điểm nhấn mạnh mẽ mỗi khi bạn xuất hiện trên sân.

Tốc độ - Cảm giác - Ổn định

Phiên bản Superfly 10 Academy TF được trang bị đệm Air Zoom ở gót giúp tăng độ đàn hồi và cảm giác “bật” rõ rệt khi di chuyển. Phần upper NikeSkin có các gân nổi chevrons giúp tăng độ bám và cảm giác bóng tự nhiên hơn, hỗ trợ người chơi kiểm soát bóng linh hoạt trong mọi tình huống.

Cổ Dynamic Fit ôm gọn cổ chân với chất liệu sợi dệt co giãn mềm, tạo cảm giác chắc chắn và tự tin khi đổi hướng. Lớp knit mesh thế hệ mới giúp thân giày vừa khít, linh hoạt hơn so với thế hệ trước. Đế cao su TF chuyên dụng mang lại độ bám và phản hồi tốt trên sân cỏ nhân tạo 5–7 người.

Phù hợp: cầu thủ thiên về tốc độ, di chuyể...', 2790000.00, 'src/data/images/products/main_8d8a14f7.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('0423e3eb-d982-460f-b1e8-3ab99b7f4afc', 'NIKE ZOOM MERCURIAL SUPERFLY 10 ACADEMY KM TF - FQ8333-500 - TÍM THAN', 'NIKE ZOOM MERCURIAL SUPERFLY 10 ACADEMY KM TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Sau chu kỳ 2 năm, tháng 7/2024, Nike đã chính thức trình làng thế hệ mới nhất của silo Air Zoom Mercurial. Nhẹ hơn - bền hơn - bùng nổ hơn, Mercurial Superfly 10 Academy TF sẽ là đôi giày bóng đá hoàn hảo dành cho những tín đồ đam mê tốc độ.

Thông số kỹ thuật

NIKE ZOOM MERCURIAL SUPERFLY 10 ACADEMY KM TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5 đến 7 người. 

Phân khúc: Academy (tầm trung).

Form giày phù hợp cho chân thon đến bè vừa. 

Phần upper được làm từ da tổng hợp NikeSkin mềm mỏng và đàn hồi sẽ mang lại cảm giác bóng thật chân cho bạn. Bề mặt upper được phủ một lớp PU, không chỉ giúp tăng cường độ bền cho đôi giày mà còn làm tăng ma sát khi tiếp xúc bóng, giúp bạn kiểm soát bóng tốt hơn khi rê dắt ở tốc độ cao.

Cổ giày Dynamic Fit ôm trọn cổ chân, mang lại sự chắc chắn và ngăn các hạt cao su rơi vào giày trong quá trình thi đấu. 

Đặc biệt, trên Mercurial Superfly 10 Academy TF lầ...', 1750000.00, 'src/data/images/products/main_5455f661.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('cbeb21cc-4994-45b2-a276-12cb673b009c', 'NIKE ZOOM MERCURIAL VAPOR 15 ACADEMY TF - DJ5635-605 - HỒNG/XANH', 'NIKE MERCURIAL VAPOR 15 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Tháng 6/2022, Nike chính thức trình làng thế hệ tiếp theo của dòng giày Mercurial mang tên Air Zoom Mercurial. Cải tiến lớn nhất trên thế hệ này nằm ở bộ đệm Zoom Air được thiết kế độc quyền cho bóng đá. Bên cạnh đó, mọi chi tiết trên đôi giày lần này đều được thiết kế nhằm tối ưu hoá lối chơi tốc độ.

Thông số kỹ thuật
Mẫu giày đá bóng MERCURIAL ZOOM VAPOR 15 ACADEMY TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.

Phân khúc: Academy (Tầm trung).

Upper làm từ da tổng hợp mềm mại giúp tăng cảm giác bóng. Ở thế hệ 15 này, hãng đã phủ thêm lớp NikeSkin trên bề mặt upper làm tăng độ bám bóng, từ đó có thể kiểm soát bóng và rê bóng tốt hơn. 

Cấu trúc Speed Cage bên dưới bề mặt upper được làm từ chất liệu mỏng nhưng cực kỳ chắc chắn sẽ mang đến sự ôm chân vừa khít, đồng thời hạn chế sự xê dịch chân trong giày khi thi đấu ở cường độ cao.

Lưỡi gà được thiết kế cố định ở phần nửa trên sẽ không gây ra tình...', 1750000.00, 'src/data/images/products/main_19e0179d.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('6f8e3679-9547-4842-8771-9feb76048992', 'ADIDAS PREDATOR ACCURACY.1 TF - GZ0008 - XANH/TRẮNG', 'ADIDAS PREDATOR ACCURACY.1 TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Kiểm soát + chính xác = tự tin. Đó chính là công thức để tạo nên mẫu giày đá banh ADIDAS PREDATOR ACCURACY.1 TF hoàn toàn mới lần này! Sở hữu những công nghệ tiên tiến nhất hiện nay của nhà Ba Sọc, mẫu giày PREDATOR ACCURACY.1 TF sẽ giúp bạn tự tin làm chủ cuộc chơi, kiểm soát trận đấu!

Thông số kỹ thuật

ADIDAS PREDATOR ACCURACY.1 TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc: .1 (chuyên nghiệp)

Phần upper làm từ chất liệu da tổng hợp HybridTouch mềm mại. Bằng cách sử dụng loại chất liệu này, adidas đã làm giảm đáng kể trọng lượng của Predator Accuracy.1 TF so với người tiền nhiệm. 

Các vân cao su High Definition Grip được phủ ở khu vực má trong làm tăng độ ma sát với bóng, từ đó giúp người chơi có thể dễ dàng thực hiện các đường chuyền hay cú sút với độ chính xác cao. 

Phần cổ giày với cấu trúc Face Fit - đây là loại cổ giày hai mảnh làm từ chất liệu Primeknit, được thiết kế nhằm tạo r...', 1260000.00, 'src/data/images/products/main_1fb7a6d6.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('05a03d62-70cd-4435-b094-4c460972f73d', 'ADIDAS X CRAZYFAST.3 TF - ID9338 - XANH NAVY', 'ADIDAS X CRAZYFAST.3 TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Viết nên câu chuyện tốc độ của riêng bạn với mẫu giày đá banh adidas X Crazyfast.3 TF “Crazyrush Pack” hoàn toàn mới! Sở hữu những cải tiến mới nhất cùng một thiết kế tối giản phục vụ cho lối chơi tốc độ, X Crazyfast.3 TF xứng đáng là sự lựa chọn hàng đầu dành cho những tiền vệ và tiền đạo ưu tiên sự linh hoạt và thanh thoát trong cách chơi của mình!

Lần đầu tiên, logo Three Stripes được xuất hiện ở cả phần má trong và ngoài của đôi giày. Sở hữu phối màu White/Core Black/Lucid Lemon đầy tươi mát, mẫu giày đá banh adidas X Crazyfast.3 TF “Crazyrush Pack” sẽ giúp bạn tự tin chinh phục sức nóng từ mùa hè này bằng tốc độ của riêng bạn! 

Thông số kỹ thuật:

ADIDAS X CRAZYFAST.3 TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5-7 người.

Phân khúc: .3 (tầm trung).

Phần upper làm từ chất liệu da tổng hợp pha sợi dệt mềm mại, mang lại cảm giác bóng tốt nhất cho người mang. Trên bề mặt upper được phủ một lớp nhựa TPU giúp tă...', 1260000.00, 'src/data/images/products/main_ea837a86.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('812f58f9-52d4-4ada-8624-e311e36dd05c', 'KAMITO ARTISTA KL TF - KMTF240255 - TRẮNG/ĐỎ', 'KAMITO ARTISTA KL TF – GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Kamito Artista KL TF là mẫu giày bóng đá lấy cảm hứng từ phong cách nghệ thuật và lối chơi kỹ thuật của huyền thoại Nguyễn Hồng Sơn. Đôi giày này mang đến khả năng kiểm soát bóng linh hoạt, cảm giác chân thật như đi chân trần, giúp bạn tự tin thể hiện phong cách riêng trên sân cỏ nhân tạo.

Ưu điểm nổi bật

Upper da Kangaroo cao cấp: siêu mềm, cho cảm giác bóng tự nhiên, kiểm soát tối đa từ khống chế, rê dắt cho đến dứt điểm.

Đệm Ka-Comfort êm ái: giảm chấn hiệu quả, bảo vệ đầu gối và cột sống, duy trì sự thoải mái trong suốt trận đấu.

Lót giày thông thoáng & bền bỉ: chống sụp lún với công nghệ Anti-Collapse, hỗ trợ di chuyển linh hoạt.

Form Ka-Fit chuẩn bàn chân Việt: ôm vừa vặn, phù hợp cả người chơi có bàn chân bè.

Đế Combat TF bám sân vượt trội: kết hợp đinh kim cương và mũi tên định hướng, giúp xoay chuyển nhanh, tăng tốc và bứt phá mạnh mẽ.

Thông tin sản phẩm

Loại giày: sân cỏ nhân tạo, đinh TF

Chất liệu upper: Da thậ...', 499000.00, 'src/data/images/products/main_2af790c0.jpg', 'ACTIVE', 'afab8492-009e-49c6-83f3-195245560477', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('eb652dcb-6cfc-4d3d-9233-a66b0b563852', 'ADIDAS F50 LEAGUE TF - JH7723 - CAM/XANH', 'ADIDAS F50 LEAGUE TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Sau 9 năm vắng bóng, huyền thoại adidas F50 đã chính thức trở lại - nhẹ hơn, nhanh hơn và lợi hại hơn! Được thiết kế để khai phá trọn vẹn tiềm năng tốc độ của người chơi, mẫu giày đá bóng sân cỏ nhân tạo adidas F50 League TF sẽ là sự lựa chọn hoàn hảo dành cho những tiền vệ và tiền đạo ưu tiên sự nhanh nhẹn và thanh thoát trong lối chơi của mình.

Thông số kỹ thuật

ADIDAS F50 LEAGUE TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.  

Phân khúc: League (tầm trung).

Phần upper được làm từ chất liệu da tổng hợp Fiberskin hoàn toàn mới - mỏng hơn, nhẹ hơn, mềm mại hơn và đàn hồi hơn - sẽ mang lại cảm giác bóng thật chân nhất cho người chơi. Trên bề mặt upper được phủ lớp Sprintgrid 3D giúp tăng ma sát khi chạm bóng, từ đó giúp người mang có thể kiểm soát và rê bóng tốt hơn.

Lưỡi gà rời hình chữ U được làm từ sợi dệt mỏng và mềm với độ co giãn cao giúp ôm khít phần mu bàn chân. Ngoài ra, phần lưỡi gà còn được hãng cố...', 2850000.00, 'src/data/images/products/main_f25e9775.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('601a37f1-4645-4bd7-8631-71802ffc0f4f', 'NIKE ZOOM MERCURIAL SUPERFLY 9 ACADEMY TF - DJ5629-300 - XANH LÁ/TÍM', 'NIKE ZOOM MERCURIAL SUPERFLY 9 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Tháng 6/2022, Nike chính thức trình làng thế hệ tiếp theo của dòng giày Mercurial mang tên Air Zoom Mercurial. Cải tiến lớn nhất trên thế hệ này nằm ở bộ đệm Zoom Air được thiết kế độc quyền cho bóng đá. Bên cạnh đó, mọi chi tiết trên đôi giày lần này đều được thiết kế nhằm tối ưu hoá lối chơi tốc độ. 

Thông số kỹ thuật

Mẫu giày đá bóng MERCURIAL ZOOM SUPERFLY 9 ACADEMY TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.

Phân khúc: Academy (Tầm trung).

Upper làm từ da tổng hợp mềm mại giúp tăng cảm giác bóng. Ở thế hệ 15 này, hãng đã phủ thêm lớp NikeSkin trên bề mặt upper làm tăng độ bám bóng, từ đó có thể kiểm soát bóng và rê bóng tốt hơn. 

Cấu trúc Speed Cage bên dưới bề mặt upper được làm từ chất liệu mỏng nhưng cực kỳ chắc chắn sẽ mang đến sự ôm chân vừa khít, đồng thời hạn chế sự xê dịch chân trong giày khi thi đấu ở cường độ cao.

Phần cổ thun Dynamic Fit sẽ giúp ôm trọn cổ chân của bạ...', 1260000.00, 'src/data/images/products/main_90da2e62.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('3e7e77f5-8a6d-4ed3-b19d-44b205280ed1', 'JOMA TOP FLEX TF 2504 - XANH NAVY/TRẮNG', 'JOMA TOP FLEX TF 2304 - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Nâng cấp trải nghiệm chơi bóng của bạn thông qua mẫu giày đá banh JOMA TOP FLEX TF. 

JOMA TOP FLEX TF được thiết kế riêng cho bề mặt sân cỏ nhân tạo nhưng không kém phần ổn định và linh hoạt so với phiên bản đế IC cho sân futsal, từ đó giúp cho người mang có thể tự tin trình diễn lối chơi tốt nhất của bản thân.  

Thông số kỹ thuật

JOMA TOP FLEX TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.

Phần upper được làm từ da nhân tạo mềm mại nhưng không kém phần bền bỉ, giúp mang đến cảm giác bóng thật chân cho người mang. Vùng đầu mũi còn được bọc da lộn giúp tăng độ bền cho giày. Bên cạnh đó, khu vực đầu mũi này còn được trang bị thêm khung bọc nhựa hỗ trợ cho những pha ra chân bằng đầu mũi giày trở nên uy lực hơn. 

Trên phần thân giày được trang bị các lỗ thoát khí theo công nghệ VTS giúp cho đôi giày trở nên thoáng khí hơn, đảm bảo sự thoải mái trong suốt quá trình thi đấu.

Lưỡi gà rời làm từ chất liệu vải lưới...', 1950000.00, 'src/data/images/products/main_0e79a043.jpg', 'ACTIVE', '6f5cd968-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('b3faeb92-6858-45e5-b6a4-6d9066f8dc68', 'NIKE PHANTOM GX 2 ACADEMY TF - FJ2577-003 - XÁM/XANH CHUỐI', 'PHANTOM GX 2 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Chơi bóng với sức mạnh và sự chính xác tuyệt đối cùng NIKE PHANTOM GX 2 ACADEMY TF. Được thiết kế cho các ngôi sao hàng đầu ở vị trí tấn công như Erling Haaland, Rodrygo, Phil Foden….PHANTOM GX 2 ACADEMY TF với những cải tiến đặc biệt sẽ giúp bạn phát huy toàn bộ khả năng tốt nhất của bản thân trên sân cỏ!

Thông số kỹ thuật

NIKE PHANTOM GX 2 ACADEMY TF là mẫu giày đá banh đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc : Academy (tầm trung)

Phần upper làm từ da tổng hợp mềm mại được mô phỏng theo chất liệu sợi dệt sẽ mang đến cảm giác thật chân nhất trong từng pha chạm bóng. Trên bề mặt Phantom GX Academy TF được trang bị thêm lớp phủ NikeSkin giúp tăng độ bám bóng, từ đó người chơi có thể kiểm soát và rê bóng tốt hơn ở bất kỳ điều kiện thời tiết. 

Công nghệ Strike Zone với các vân vòng tròn được in dập nổi ở những vùng tiếp xúc bóng chủ yếu giúp tăng thêm độ xoáy cho những cú phất bóng và cứa lòng. 

Hệ thống dây già...', 1260000.00, 'src/data/images/products/main_77e3c187.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('502ac2d2-7b39-4e60-ba18-4b62f5dbd5c4', 'ZOCKER WINNER ENERGY TF - TRẮNG', 'ZOCKER WINNER ENERGY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Zocker Winner Energy - Cảm hứng đến từ Năng lượng chiến thắng

Giày bóng đá Zocker Winner Energy đỏ là 1 trong 5 phiên bản màu của bộ sưu tập mới, được thương hiệu Zocker giới thiệu tới những người yêu thích bóng đá trong hè này.

Giày bóng đá Zocker Winner Energy Trắng được thiết kế với màu trắng chủ đạo điểm thêm màu vàng, các họa tiết bắt mắt được tạo thành bởi các lát cắt laze. Có thể nói thiết kế hiện đai và có tính thẩm mỹ cao vẫn là điều mà các mẫu giày của Zocker luôn có được.

Giày sở hữu nhiều cải tiến mới, bên cạnh đó là sự kế thừa những ưu điểm được đúc rút từ những thế hệ trước đó như Space, Inspire và Inspire Pro...

Upper được làm từ da PU cao cấp, cho cảm giác mềm và êm chân ngay từ khi tiếp xúc. Nhờ đó, người chơi không cần phải mất thời gian cho quá trình làm giãn giày - breakin. Ở nửa thân trên giày còn được gia cố các gờ nổi, giúp người chơi kiểm soát bóng tốt hơn

Một tính năng thường chỉ được trang bị cho ...', 665000.00, 'src/data/images/products/main_54d6bcda.jpg', 'ACTIVE', '6f5cd9b6-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('108b2618-0354-4365-8da2-bdf5eaeb3165', 'KAMITO ARTISTA PRO TF - KMTF240356 - TRẮNG/XANH', 'Sản phẩm đang có mặt tại Shop Giày Đá Banh Chính Hãng - Thanh Hùng Futsal:

Thanh Hùng Futsal Store I: 27 ĐƯỜNG D52, P. 12, Q. TÂN BÌNH, TP. HCM | ĐT: 0901 377 722

Thanh Hùng Futsal Store II: 32A THẠCH THỊ THANH, P. TÂN ĐỊNH, Q. 1, TP. HCM | ĐT: 0901 710 730

Thanh Hùng Futsal Store III: 48 PHẠM VĂN BẠCH, P. 15, Q. TÂN BÌNH, TP. HCM | ĐT: 0901 710 780', 665000.00, 'src/data/images/products/main_7285e37f.jpg', 'ACTIVE', 'afab8492-009e-49c6-83f3-195245560477', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('4ed0296a-edb1-42da-967b-e09055a4ebeb', 'NIKE ZOOM MERCURIAL SUPERFLY 10 ACADEMY TF - FQ8331-700 - XANH CHUỐI', 'NIKE ZOOM MERCURIAL SUPERFLY 10 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Chinh phục những giới hạn tốc độ mới cùng mẫu giày đá bóng Nike Mercurial Superfly 10 Academy TF phối màu 

Sau chu kỳ 2 năm, tháng 7/2024, Nike đã chính thức trình làng thế hệ mới nhất của silo Air Zoom Mercurial. Nhẹ hơn - bền hơn - bùng nổ hơn, Mercurial Superfly 10 Academy TF sẽ là đôi giày bóng đá hoàn hảo dành cho những tín đồ đam mê tốc độ.

Thông số kỹ thuật

MERCURIAL SUPERFLY 10 ACADEMY TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5 đến 7 người. 

Phân khúc: Academy (tầm trung).

Form giày phù hợp cho chân thon đến bè vừa. 

Phần upper được làm từ da tổng hợp NikeSkin mềm mỏng và đàn hồi sẽ mang lại cảm giác bóng thật chân cho bạn. Bề mặt upper được phủ một lớp PU, không chỉ giúp tăng cường độ bền cho đôi giày mà còn làm tăng ma sát khi tiếp xúc bóng, giúp bạn kiểm soát bóng tốt hơn khi rê dắt ở tốc độ cao.

Cổ giày Dynamic Fit ôm trọn cổ chân, mang lại sự chắc chắn và ngăn các hạt cao s...', 2450000.00, 'src/data/images/products/main_3afd770c.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('27f97f10-04e5-49b4-aec4-fc2bba78be22', 'NIKE ZOOM MERCURIAL VAPOR 16 ACADEMY TF - FQ8449-300 - VÀNG CHANH/ĐEN', 'NIKE ZOOM MERCURIAL VAPOR 16 ACADEMY TF - MAX VOLTAGE PACK (10.2025)
Tăng tốc trong luồng điện áp – Chạm đến tốc độ đỉnh cao 
Nike Zoom Mercurial Vapor 16 Academy TF là mẫu giày đinh dăm cỏ nhân tạo thuộc phân khúc phổ thông trong đại gia đình Mercurial, được thiết kế cho những cầu thủ yêu tốc độ, di chuyển linh hoạt và thi đấu trên sân 5-7 người. Phiên bản Vàng Chanh/Đen nằm trong bộ sưu tập Nike Max Voltage Pack (10/2025) mang diện mạo rực sáng, mô phỏng luồng điện chạy dọc thân giày - biểu tượng của tốc độ và nguồn năng lượng bùng nổ trên sân cỏ. 
 
Max Voltage Pack - Nguồn năng lượng cao áp cho mùa giải mới Ra mắt vào tháng 10/2025, Max Voltage Pack được Nike tạo nên với cảm hứng từ điện năng và sự bứt phá không giới hạn. Trên Vapor 16 Academy TF, phối màu Vàng chanh pha đen không chỉ mang lại vẻ ngoài nổi bật mà còn thể hiện tinh thần dám dẫn đầu - “luôn sạc đầy năng lượng để tăng tốc vượt trội”. Upper bằng Flyknit tổng hợp kết hợp lớp phủ NIKESKIN mỏng, mang đến cảm giác tiếp ...', 2790000.00, 'src/data/images/products/main_2c23ea24.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('661ed274-000f-4818-966e-d46683e0b939', 'PUMA ULTRA 5 MATCH TT - 108351-03 - BẠC/VÀNG', 'PUMA ULTRA 5 MATCH TT - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Khai phá giới hạn tốc độ của riêng bạn cùng PUMA ULTRA 5 hoàn toàn mới. Lấy cảm hứng từ thành công của những chiếc xe đua tốc độ F1, mẫu giày đá bóng sân cỏ nhân tạo PUMA Ultra 5 Match TT sẽ không chỉ giúp bạn nhanh hơn - bùng nổ hơn - mà còn mang đến sự biến ảo cho lối chơi của bạn!

Ra sân, cảm nhận và tạo sự khác biệt - đó chính là những gì Future 8 mới nhất sẽ mang lại cho bạn!

Đón chào một mùa xuân mới cũng như chuẩn bị cho giai đoạn nước rút quan trọng của mùa giải, PUMA đã chính thức trình làng bộ sưu tập giày đá bóng “Audacity Pack” đầy ấn tượng. Trong những trận đấu sắp tới đây, các cầu thủ đại diện của thương hiệu sẽ chính thức lên chân pack giày này như: Antony, Kyle Walker, Theo Hernández, Cody Gakpo, Memphis Depay, Christian Pulisic, Kingsley Coman...

“Audacity Pack” mang đến một phối màu rực rỡ khác cho thế hệ Future 8 mới, cùng với đó là phiên bản Ultra được thiết kế tinh tế hơn và King cao cấp hơn.

Thông số kỹ ...', 1290000.00, 'src/data/images/products/main_494113c1.jpg', 'ACTIVE', '6f5cd8bb-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('fc650ced-8b88-44ee-8e5d-ba7d712d76bd', 'NIKE ZOOM MERCURIAL VAPOR 15 PRO TF - DJ5605-700 - TRẮNG KEM', 'NIKE ZOOM MERCURIAL VAPOR 15 PRO TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Tháng 6/2022, Nike chính thức trình làng thế hệ tiếp theo của dòng giày Mercurial mang tên Air Zoom Mercurial. Cải tiến lớn nhất trên thế hệ này nằm ở bộ đệm Zoom Air được thiết kế độc quyền cho bóng đá. Bên cạnh đó, mọi chi tiết trên đôi giày lần này đều được thiết kế nhằm tối ưu hoá lối chơi tốc độ. 

Thông số kỹ thuật:

Mẫu giày đá bóng ZOOM MERCURIAL VAPOR 15 PRO TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.

Phân khúc: Pro (Chuyên nghiệp).

Upper làm từ da tổng hợp cao cấp và sợi dệt. Trên bề mặt upper là các vân Hyperscreen 3D được thiết kế để mang lại cảm giác thật chân khi chạm và rê bóng ở tốc độ cao. 

Ở thế hệ 15 này, hãng đã phủ thêm lớp NikeSkin trên bề mặt upper làm tăng độ bám bóng, từ đó có thể kiểm soát bóng và rê bóng tốt hơn. Cấu trúc Speed Cage bên dưới bề mặt upper được làm từ chất liệu mỏng nhưng cực kỳ chắc chắn sẽ mang đến sự ôm chân vừa khít, đồng thời hạn chế sự xê dịch c...', 1260000.00, 'src/data/images/products/main_2a7e4aca.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('7ded5777-a60f-47dd-9361-b419f9d29559', 'PUMA ULTRA MATCH TT - 107521-04 - VÀNG/TRẮNG', 'PUMA ULTRA MATCH TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Nhanh hơn - bùng nổ hơn - hãy nâng cấp lối chơi tốc độ của bạn với phiên bản ULTRA MATCH TT 2023 mới.

PUMA ULTRA MATCH TT đã trở lại với những cải tiến đáng kể so với phiên bản trước, nhằm mang lại trải nghiệm tự tin và bùng nổ hơn cho người mang trong suốt quá trình chơi bóng. 

Thông số kỹ thuật:

PUMA ULTRA MATCH TT là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5-7 người. 

Phân khúc: Match (tầm trung).

Phần upper làm từ da tổng hợp pha sợi dệt siêu nhẹ mang đến cảm giác bóng thật chân nhất cho người mang.

Trên bề mặt upper được phủ lớp GRIP CONTROL làm tăng độ bám bóng và nâng cao khả năng kiểm soát bóng, giúp người chơi có thể chơi bóng ở mọi điều kiện thời tiết.

Cổ giày và lưỡi gà liền được làm từ chất liệu sợi dệt với độ co giãn cao, tạo nên cảm giác ôm chân chắc chắn cho khu vực cổ chân. 

Đệm gót giày làm từ vải nhung, giúp ôm phần gót chân vừa vặn và thoải mái.  

Bộ đệm EVA tạo cảm giác êm ái trong từng pha d...', 1290000.00, 'src/data/images/products/main_894e1b62.jpg', 'ACTIVE', '6f5cd8bb-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('ba0127cf-6bbf-4fb5-871e-54ba62053aa1', 'ADIDAS PREDATOR ACCURACY INJ.3 TF - IG0768 - ĐEN/VÀNG CHANH', 'ADIDAS PREDATOR ACCURACY.3 TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Kiểm soát + chính xác = tự tin. Đó chính là công thức để tạo nên mẫu giày đá banh ADIDAS PREDATOR ACCURACY.3 L TF hoàn toàn mới lần này! Sở hữu/ những cải tiến đáng kể so với thế hệ trước đây, mẫu giày PREDATOR ACCURACY.3 L TF sẽ giúp bạn tự tin làm chủ cuộc chơi, kiểm soát trận đấu!

Thông số kỹ thuật

ADIDAS PREDATOR ACCURACY.3 TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc: .3 (tầm trung)

Phần upper làm từ chất liệu da tổng hợp mềm mại. Các vân High Definition Texture được in dập nổi ở khu vực má trong và má ngoài làm tăng độ ma sát với bóng, từ đó giúp người chơi có thể dễ dàng thực hiện các đường chuyền hay cú sút với độ chính xác cao. 

Lưỡi gà rời được thiết kế mỏng mang đến sự thoải mái cho người mang, đặc biệt là cho những ai với mu chân cao và dày.

Hệ thống dây giày được làm lệch sang một bên giúp mở rộng vùng diện tích sút bóng.

Lớp đệm gót được làm từ chất liệu vải nhung dày và...', 1260000.00, 'src/data/images/products/main_c956ba4a.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('90e2718f-9812-414c-a083-e9c9b20f5b0a', 'MIZUNO MORELIA SALA PRO TF - Q1GB251360 - ĐỎ/TRẮNG', 'MIZUNO MORELIA SALA PRO TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Mizuno Morelia Sala Pro TF – Q1GB251360 là lựa chọn hàng đầu cho anh em phủi thủ đam mê lối chơi kỹ thuật, kiểm soát bóng tốt. Thiết kế mang đậm DNA dòng Morelia kinh điển, kết hợp với các công nghệ tiên tiến giúp tối ưu cảm giác bóng, độ êm và khả năng bám sân trong mọi tình huống.

Thông số kỹ thuật: 

MIZUNO MORELIA SALA PRO TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc: Pro (chuyên nghiệp).

Form giày được thiết kế đặc biệt phù hợp với bàn chân bè của người Việt.

Phần upper được làm từ chất liệu da tổng hợp thế hệ mới với nhiều sự mềm mại và đàn hồi, giúp mang đến cảm giác chạm bóng chân thật nhất cho người chơi. 

Đặc biệt, khu vực đầu mũi được gia cố bằng một lớp da nhám giúp tăng độ bền cho đôi giày, hạn chế tình trạng hở mũi khi thi đấu trên bề mặt sân cỏ nhân tạo. 

Lưỡi gà rời mềm, mỏng giúp người chơi dễ dàng xỏ chân vào giày, phù hợp cho những anh em có mu bàn chân cao và dày.

Lớp...', 4300000.00, 'src/data/images/products/main_80ea77cf.jpg', 'ACTIVE', '6f5cd833-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('10383478-2046-4541-9a53-3e523dba148f', 'NIKE PHANTOM GX 2 PRO TF - FJ2583-800 - HỒNG/CAM', 'NIKE PHANTOM GX 2 PRO TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Chơi bóng với sức mạnh và sự chính xác tuyệt đối cùng NIKE PHANTOM GX 2 PRO TF. Với sự trở lại của những công nghệ tiên tiến nhất nhà Nike như sợi dệt Flyknit, công nghệ ACC (All Conditions Control)....PHANTOM GX 2 PRO TF sẽ giúp bạn phát huy trọn vẹn khả năng chơi bóng của bản thân trên sân cỏ! 

Thông số kỹ thuật

NIKE PHANTOM GX 2 PRO TF là mẫu giày đá banh đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc: Pro (cao cấp).

Phần upper được làm từ chất liệu sợi dệt Flyknit siêu mỏng và nhẹ, nhưng vẫn giữ được độ bền và đàn hồi cần thiết để tối ưu cho những pha di chuyển linh hoạt của người chơi trên sân cỏ. Trên bề mặt upper được trang bị công nghệ ACC giúp người chơi có thể kiểm soát bóng tốt nhất trong mọi điều kiện thời tiết.

Công nghệ Strike Zone với các vân vòng tròn được in dập nổi ở những vùng tiếp xúc bóng chủ yếu giúp tăng thêm độ xoáy cho những cú phất bóng và cứa lòng. 

Hệ thống dây giày đặc trưng của silo Ph...', 2750000.00, 'src/data/images/products/main_4d582d23.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('7a16e000-8086-46e2-8f0b-0a1809b420d4', 'ADIDAS PREDATOR 24 LEAGUE L TF - IE2612 - VÀNG CHANH/ĐEN', 'ADIDAS PREDATOR 24 LEAGUE L TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Ghi bàn từ mọi hướng cùng mẫu giày bóng đá ADIDAS PREDATOR 24 LEAGUE L TF. Được thiết kế nhằm phục vụ cho lối chơi ghi bàn, ADIDAS PREDATOR 24 LEAGUE L TF với những công nghệ tiên tiến nhất của nhà Ba Sọc sẽ đem đến cho bạn sức mạnh và sự chính xác trong từng đường bóng.

"Energy Citrus Pack" là bộ sưu tập được adidas ra mắt nhằm chuẩn bị cho giai đoạn nước rút của mùa giải. Sở hữu phối màu "Team Solar Yellow/Core Black/Solar Red" đầy bắt mắt, mẫu giày đá bóng Predator 24 “Energy Citrus Pack” sẽ được những ngôi sao hàng đầu adidas mang trên chân như Jude Bellingham, Trent Alexander-Arnold, Pedri, Ilkay Gundogan, Paulo Dybala, Marco Asensio…. 

Thông số kỹ thuật

ADIDAS PREDATOR 24 LEAGUE L TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc: League (tầm trung).

Phần upper làm từ chất liệu da tổng hợp Hybridfeel mềm mại và đàn hồi, mang đến cảm giác bóng thật chân nhất cho người chơi.

Các vân 3D...', 1260000.00, 'src/data/images/products/main_017f8b08.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('784523a3-6fc5-41c8-be02-f6a212f5b1a5', 'PUMA ULTRA ULTIMATE CAGE - 106893-01 - XANH MẠ NON', 'PUMA ULTRA ULTIMATE CAGE TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Nâng cấp các trận đấu của bạn lên một tầm cao mới với thế hệ tiếp theo của dòng giày tốc độ thuộc nhà Báo. PUMA ULTRA ULTIMATE CAGE được thiết kế với những cải tiến đáng kể so với thế hệ trước, nhằm mang lại trải nghiệm tự tin và bùng nổ hơn cho người mang. 

Thông số kỹ thuật

PUMA ULTRA ULTIMATE CAGE là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.

Phân khúc: Ultimate (chuyên nghiệp)

Phần upper được làm từ sợi dệt ULTRAWEAVE siêu nhẹ với cấu trúc co giãn 4 chiều giúp giảm trọng lượng và ma sát. Công nghệ PWRPRINT Pro ở những điểm tiếp xúc bóng thường xuyên làm tăng độ bám bóng, từ đó nâng cao khả năng kiểm soát bóng của người mang khi rê bóng ở tốc độ cao. 

Công nghệ PWRTAPE hoàn toàn mới được áp dụng ở phần gót giày giúp bảo vệ khu vực gót chân người mang, đồng thời tạo cảm giác ôm chân vừa vặn.  

Bề mặt lót giày được làm nhám giúp giảm sự xê dịch của bàn chân trong giày khi thi đấu ở cường độ cao.  

Bộ...', 1290000.00, 'src/data/images/products/main_564b5a77.jpg', 'ACTIVE', '6f5cd8bb-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('cde3e340-361b-49f9-8db9-78d02311738c', 'MIZUNO MORELIA NEO SALA β JAPAN TF - Q1GB254060 - ĐỎ/TRẮNG', 'MIZUNO MORELIA NEO SALA β JAPAN TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO CHÍNH HÃNG

Là phiên bản cao cấp dành cho sân cỏ nhân tạo TF, được sản xuất tại Nhật Bản với số lượng có hạn, Morelia NEO SALA β JAPAN TF  Q1GB254060 kết hợp vẻ ngoài sang trọng và công nghệ hiện đại để mang đến trải nghiệm chơi bóng tối ưu cho mặt sẩn cỏ nhân tạo 5-7người. Điểm đặc biệt của mẫu Q1GB254060 là phối màu Ruby Red × White (Đỏ Ruby × Trắng) - nổi bật cá tính, khác biệt so với các phiên bản phối trung tính khác. Sắc đỏ/trắng tạo sự thu hút, phù hợp cho người chơi muốn nổi bật trên sân mà vẫn giữ được chất nghiêm túc và chuyên nghiệp.

Thông số kỹ thuật:

Upper (phần thân giày): Sử dụng kết hợp da Kangaroo cao cấp và vật liệu tổng hợp cùng cấu trúc knit, giúp ôm chân tốt, linh hoạt nhưng vẫn giữ độ bền và cảm giác tiếp xúc bóng chuẩn.

Midsole & Insole: Chất liệu cao hồi MIZUNO ENERZY trải rộng khắp midsole giúp khi tiếp đất sẽ chuyển năng lượng nhanh hơn, giảm mất mát lực. Bên cạnh đó phần insole dày 5 mm g...', 2090000.00, 'src/data/images/products/main_3822f1b2.jpg', 'ACTIVE', '6f5cd833-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('39ad98bb-8195-41b3-b39c-7de750d5fb07', 'NIKE PHANTOM GX ACADEMY TF - DD9477-446 - TRẮNG/XANH', 'NIKE PHANTOM GX ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Nâng tầm kỹ năng của bạn cùng mẫu giày đá banh NIKE PHANTOM GX ACADEMY TF hoàn toàn mới! Là bản nâng cấp hoàn toàn mới của Phantom GT 2, Phantom GX sẽ là đôi giày hoàn hảo dành cho những ai tìm kiếm sự chính xác tuyệt đối trên sân. 

Thông số kỹ thuật

NIKE PHANTOM GX ACADEMY TF là mẫu giày đá banh đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc : Academy (tầm trung)

Phần upper làm từ da tổng hợp mềm mại được mô phỏng theo chất liệu sợi dệt. Trên bề mặt Phantom GX Academy TF được trang bị thêm lớp phủ NikeSkin giúp tăng độ bám bóng, từ đó có thể kiểm soát và rê bóng tốt hơn ở bất kỳ điều kiện thời tiết. 

Hệ thống dây giày được thiết kế lệch về phía má ngoài nhằm mở rộng diện tích sút và chuyền bóng.

Lưỡi gà rời được thiết kế cố định ở phần nửa trên sẽ không gây ra tình trạng lệch lưỡi gà.

Lớp đệm gót giày được làm từ chất liệu da tổng hợp mềm hơn trước giúp hỗ trợ tốt hơn cho quá trình break-in, hạn chế tình trạng ...', 1260000.00, 'src/data/images/products/main_d927b648.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('b67fe281-ee6a-488f-b3ed-ce1e5b401887', 'ADIDAS F50 PRO TF - IE1219 - XANH/HỒNG', 'ADIDAS F50 PRO TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO
Sau 9 năm vắng bóng, huyền thoại adidas F50 đã chính thức trở lại - nhẹ hơn, nhanh hơn và lợi hại hơn! Được thiết kế để khai phá trọn vẹn tiềm năng tốc độ của người chơi, mẫu giày đá bóng sân cỏ nhân tạo adidas F50 Pro TF sẽ là sự lựa chọn hoàn hảo dành cho những tiền vệ và tiền đạo ưu tiên sự nhanh nhẹn và thanh thoát trong lối chơi của mình.  

Lấy cảm hứng từ vẻ đẹp bầu trời và không gian bên ngoài vũ trụ, bộ sưu tập adidas "Celestial Victory" 2025 đã khéo léo phối hợp các gam màu Blue Fusion, Lucid Lemon và Lucid Pink trên cả ba mẫu giày đá bóng. Nhờ đó, bộ sưu tập vừa sở hữu bản sắc riêng, vừa tạo được sự gắn kết chặt chẽ.

Mẫu giày bóng đá adidas F50 "Celestial Victory Pack" gây ấn tượng với thiết kế táo bạo, rực rỡ. Sự kết hợp giữa màu "xanh nhạt" chủ đạo cùng các chi tiết "màu hồng" và "xanh chanh" nổi bật tạo nên diện mạo bắt mắt. Theo thông tin chính thức, các màu sắc này lần lượt là "Blue Fusion", "Lucid Lemon" và "Lucid Pi...', 1950000.00, 'src/data/images/products/main_c27f5ce2.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('d89d77dd-b37d-4f01-9d5a-3c2a12cc08df', 'ZOCKER INSPIRE PRO TF SNS 005 - ĐEN HỒNG', 'ZOCKER INSPIRE PRO TF SNS - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Được mệnh danh là “vị vua mới” trong phân khúc giày đá bóng dưới 1 triệu, ZOCKER INSPIRE PRO TF SNS nổi bật với thiết kế hiện đại cùng chất lượng   hoàn thiện sản phẩm tuyệt vời. Đặc biệt, với chính sách bảo hành 1 đổi 1 trong 4 tháng đầu tiên, bạn hoàn toàn có thể tự tin trải nghiệm dòng sản phẩm giày đá bóng ZOCKER INSPIRE PRO TF SNS mới đến từ nhà Sóc lần này!  

Thông số kỹ thuật

ZOCKER INSPIRE PRO TF SNS là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.

Phần upper được làm từ chất liệu da PU cao cấp và mềm mại với khả năng giữ form tốt, ít bị bai nhão sau một thời gian sử dụng. Trên khắp bề mặt upper được in dập nổi các vân 3D hỗ trợ kiểm soát và rê bóng tốt hơn.  

Lưỡi gà rời mỏng giúp dễ xỏ chân vào giày, phù hợp với những anh em có mu bàn chân cao và dày.  

Lót giày với chất liệu cao su êm mềm, được thiết kế với các lỗ nhỏ giúp  thoáng khí hơn trong suốt quá trình thi đấu. 

Gót giày với khung định hìn...', 665000.00, 'src/data/images/products/main_ce09f7b9.jpg', 'ACTIVE', '6f5cd9b6-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('95e151a8-f0c6-4db5-821a-e8b2478e5dbd', 'KAMITO ARTISTA PRO TF - KMTF240314 - ĐỎ', 'Sản phẩm đang có mặt tại Shop Giày Đá Banh Chính Hãng - Thanh Hùng Futsal:

Thanh Hùng Futsal Store I: 27 ĐƯỜNG D52, P. 12, Q. TÂN BÌNH, TP. HCM | ĐT: 0901 377 722

Thanh Hùng Futsal Store II: 32A THẠCH THỊ THANH, P. TÂN ĐỊNH, Q. 1, TP. HCM | ĐT: 0901 710 730

Thanh Hùng Futsal Store III: 48 PHẠM VĂN BẠCH, P. 15, Q. TÂN BÌNH, TP. HCM | ĐT: 0901 710 780', 665000.00, 'src/data/images/products/main_fbe6d09f.jpg', 'ACTIVE', 'afab8492-009e-49c6-83f3-195245560477', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('94a82c81-7e87-4c22-b31b-559d666ddb69', 'KAMITO ARTISTA PRO TF - KMTF240355 - TRẮNG/ĐỎ', 'Sản phẩm đang có mặt tại Shop Giày Đá Banh Chính Hãng - Thanh Hùng Futsal:

Thanh Hùng Futsal Store I: 27 ĐƯỜNG D52, P. 12, Q. TÂN BÌNH, TP. HCM | ĐT: 0901 377 722

Thanh Hùng Futsal Store II: 32A THẠCH THỊ THANH, P. TÂN ĐỊNH, Q. 1, TP. HCM | ĐT: 0901 710 730

Thanh Hùng Futsal Store III: 48 PHẠM VĂN BẠCH, P. 15, Q. TÂN BÌNH, TP. HCM | ĐT: 0901 710 780', 665000.00, 'src/data/images/products/main_bd0feb86.jpg', 'ACTIVE', 'afab8492-009e-49c6-83f3-195245560477', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('01278f3f-6e99-4c39-9d6b-d672ab88dda4', 'PUMA KING PRO TT - 107255-03 - VÀNG/ĐEN', 'PUMA KING PRO TT - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Kiểm soát trận đấu chưa bao giờ dễ dàng và thoải mái đến vậy cùng PUMA KING PRO TT. Nổi tiếng như một biểu tượng huyền thoại của thị trường giày bóng đá, silo King đã chính thức quay trở lại với một diện mạo mới cùng những cải tiến nổi bật, hứa hẹn sẽ mang đến trải nghiệm chơi bóng hoàn hảo nhất cho người chơi! 

Thông số kỹ thuật

PUMA KING PRO TT là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5-7 người.

Phân khúc: Pro (cao cấp).

Phần upper được làm từ da nhân tạo K-BETTER với độ mềm như da tự nhiên, nhưng mỏng và giữ form tốt hơn trước. Với chất liệu upper hoàn toàn mới này sẽ mang đến sự thoải mái và cảm giác bóng thật chân nhất cho người chơi. Trên khu vực đầu mũi được bọc da lộn giúp tăng độ bền cho đôi giày. 

Lưỡi gà liền làm từ chất liệu sợi dệt với độ co giãn cao, đem đến khả năng ôm chân vừa vặn nhưng không kém phần thoải mái cho người chơi. 

Đệm gót giày với chất liệu vải mềm mịn giúp hạn chế tình trạng xước gót c...', 1750000.00, 'src/data/images/products/main_84df1c72.jpg', 'ACTIVE', '6f5cd8bb-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('11b72eb1-2b2f-4f69-a580-e9da990ccba5', 'NIKE PHANTOM GX 2 ACADEMY TF - FJ2577-300 - XANH MINT', 'PHANTOM GX 2 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Chơi bóng với sức mạnh và sự chính xác tuyệt đối cùng NIKE PHANTOM GX 2 ACADEMY TF. Được thiết kế cho các ngôi sao hàng đầu ở vị trí tấn công như Erling Haaland, Rodrygo, Phil Foden….PHANTOM GX 2 ACADEMY TF với những cải tiến đặc biệt sẽ giúp bạn phát huy toàn bộ khả năng tốt nhất của bản thân trên sân cỏ! 

Mẫu giày đá bóng Nike Phantom GX 2 "Mad Energy Pack" sẽ được những ngôi sao hàng đầu nhà Swoosh mang trên chân như Kevin De Bruyne, Erling Haaland, Phil Foden, Rodri, Lautaro Martinez, Kobbie Mainoo, Eduardo Camavinga…

Thông số kỹ thuật

NIKE PHANTOM GX 2 ACADEMY TF là mẫu giày đá banh đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc : Academy (tầm trung)

Phần upper làm từ da tổng hợp mềm mại được mô phỏng theo chất liệu sợi dệt sẽ mang đến cảm giác thật chân nhất trong từng pha chạm bóng. Trên bề mặt Phantom GX Academy TF được trang bị thêm lớp phủ NikeSkin giúp tăng độ bám bóng, từ đó người chơi có thể kiểm soát và...', 1750000.00, 'src/data/images/products/main_24370ea1.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('6b95aeee-9fa9-4eef-9607-93ffc4b5e433', 'NIKE ZOOM MERCURIAL SUPERFLY 9 ACADEMY MDS TF - FJ7199-300 - XANH LÁ', 'NIKE ZOOM MERCURIAL SUPERFLY 9 ACADEMY MDS TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Tháng 6/2022, Nike chính thức trình làng thế hệ tiếp theo của dòng giày Mercurial mang tên Air Zoom Mercurial. Cải tiến lớn nhất trên thế hệ này nằm ở bộ đệm Zoom Air được thiết kế độc quyền cho bóng đá. Bên cạnh đó, mọi chi tiết trên đôi giày lần này đều được thiết kế nhằm tối ưu hoá lối chơi tốc độ. 

Thông số kỹ thuật

Mẫu giày đá bóng MERCURIAL ZOOM SUPERFLY 9 ACADEMY TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.

Phân khúc: Academy (Tầm trung).

Upper làm từ da tổng hợp mềm mại giúp tăng cảm giác bóng. Ở thế hệ 15 này, hãng đã phủ thêm lớp NikeSkin trên bề mặt upper làm tăng độ bám bóng, từ đó có thể kiểm soát bóng và rê bóng tốt hơn. 

Cấu trúc Speed Cage bên dưới bề mặt upper được làm từ chất liệu mỏng nhưng cực kỳ chắc chắn sẽ mang đến sự ôm chân vừa khít, đồng thời hạn chế sự xê dịch chân trong giày khi thi đấu ở cường độ cao.

Phần cổ thun Dynamic Fit sẽ giúp ôm trọn cổ chân củ...', 1260000.00, 'src/data/images/products/main_4b265e4b.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('dc38a62d-419b-49cc-a336-b40952844ef4', 'PUMA ULTRA 5 PRO CAGE - 108173-01 - TRẮNG/CAM', 'PUMA ULTRA 5 PRO CAGE TT - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Khai phá giới hạn tốc độ của riêng bạn cùng PUMA ULTRA 5 hoàn toàn mới. Lấy cảm hứng từ thành công của những chiếc xe đua tốc độ F1, mẫu giày đá bóng sân cỏ nhân tạo PUMA Ultra 5 Pro Cage sẽ không chỉ giúp bạn nhanh hơn - bùng nổ hơn - mà còn mang đến sự biến ảo cho lối chơi của bạn!

PUMA “Unlimited Pack” là bộ sưu tập giày đá bóng đầu tiên trong năm 2025 của nhà Báo Đức. Lấy cảm hứng từ công thức thành công của những chiếc xe đua tốc độ F1, mẫu giày đá bóng PUMA Ultra 5 “Unlimited Pack” với phối màu chính thức “PUMA White/PUMA Black/Glowing Red” hiện đang được những ngôi sao hàng đầu nhà Báo Đức mang trên chân như Antony, Kyle Walker, Theo Hernández, Cody Gakpo, Memphis Depay, Christian Pulisic, Kingsley Coman...

Thông số kỹ thuật

PUMA ULTRA 5 PRO CAGE là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.

Phân khúc: Pro (chuyên nghiệp).

Form giày phù hợp cho chân bè ít đến bè nhiều. 

Phần upper được làm từ chất ...', 1290000.00, 'src/data/images/products/main_0ad6a908.jpg', 'ACTIVE', '6f5cd8bb-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('60209e52-fc8f-4100-8014-a414f3f5aa64', 'PUMA ULTRA 6 MATCH RE-CHARGE TT - 108766-01 - HỒNG/XANH', 'PUMA ULTRA 6 MATCH RE-CHARGE – GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO / SÂN CỨNG – PHỐI MÀU HERO BLUE / SUNSET PINK / GARNET ROSE | ULTRA MATCH (08/2025)

Đặc điểm và công nghệ

Upper làm từ lưới siêu nhẹ kết hợp lớp phủ GripControl skin, giúp tăng độ bám bóng và kiểm soát tối ưu ở tốc độ cao.
Bộ đế SPEEDSYSTEM hỗ trợ phản hồi năng lượng, giúp người chơi tăng tốc nhanh và ổn định khi đổi hướng.
Hệ thống đinh FastTrax kết hợp đinh tròn cho khả năng bám sân tốt và xoay chuyển linh hoạt.
Midsole EVA êm ái, giảm chấn hiệu quả khi thi đấu trên mặt sân cỏ nhân tạo hoặc sân cứng.
Sản phẩm sử dụng ít nhất 30% vật liệu tái chế, đáp ứng tiêu chí bền vững của PUMA.

Trải nghiệm sử dụng

Giày mang cảm giác nhẹ, ôm chân vừa vặn, hỗ trợ di chuyển linh hoạt và bứt tốc mạnh mẽ.
Lớp GripControl giúp tăng độ chính xác khi rê dắt và dứt điểm.
Đế SPEEDSYSTEM và thiết kế đinh bám chắc giúp xử lý tình huống nhanh trong không gian hẹp.

Phù hợp với

Loại sân: cỏ nhân tạo (turf) hoặc sân cứng.
Kiểu chân: từ vừa đến ...', 1650000.00, 'src/data/images/products/main_9e52edeb.jpg', 'ACTIVE', '6f5cd8bb-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('489de3c7-853b-409d-bb15-80f8135a112c', 'NIKE ZOOM MERCURIAL SUPERFLY 9 KM ACADEMY TF - DO9347-400 - XANH/VÀNG', 'NIKE ZOOM MERCURIAL SUPERFLY 9 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Tháng 6/2022, Nike chính thức trình làng thế hệ tiếp theo của dòng giày Mercurial mang tên Air Zoom Mercurial. Cải tiến lớn nhất trên thế hệ này nằm ở bộ đệm Zoom Air được thiết kế độc quyền cho bóng đá. Bên cạnh đó, mọi chi tiết trên đôi giày lần này đều được thiết kế nhằm tối ưu hoá lối chơi tốc độ. 

1 mùa giải mới với 1 khởi đầu mới - Nike chính thức ra mắt phiên bản Air Zoom Mercurial signature dành riêng cho Kylian Mbappe.

Với thiết kế được lấy cảm hứng từ bộ truyện tranh yêu thích của ngôi sao người Pháp - “Whistle”, Air Zoom Mercurial “KM” xuất hiện trong gam màu chủ đạo xanh Baltic và logo Swoosh màu vàng nổi bật. Xuyên suốt bề mặt upper được trang trí với các họa tiết độc đáo theo phong cách comic.

Thông số kỹ thuật

Mẫu giày đá bóng MERCURIAL ZOOM SUPERFLY 9 ACADEMY TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.

Phân khúc: Academy (Tầm trung).

Upper làm từ da tổng hợp mềm mại g...', 1260000.00, 'src/data/images/products/main_01f02624.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('86dcc5ac-9d27-449b-bb1d-99ef050c7e5b', 'ADIDAS PREDATOR 25 LEAGUE L TF - ID3767 - TRẮNG/HỒNG', 'ADIDAS PREDATOR 25 LEAGUE L TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Hãy sẵn sàng ra sân và ghi bàn cùng mẫu giày bóng đá ADIDAS PREDATOR 25 LEAGUE L TF! Được cải tiến để tối ưu hóa khả năng tấn công của người chơi, ADIDAS PREDATOR 25 LEAGUE L TF với những công nghệ tiên tiến nhất của nhà Ba Sọc sẽ mang đến cho bạn sức mạnh bứt phá và độ chính xác tuyệt đối trong từng pha bóng.

Lấy cảm hứng từ vẻ đẹp bầu trời và không gian bên ngoài vũ trụ, bộ sưu tập adidas "Celestial Victory" 2025 đã khéo léo phối hợp các gam màu Blue Fusion, Lucid Lemon và Lucid Pink trên cả ba mẫu giày đá bóng. Nhờ đó, bộ sưu tập vừa sở hữu bản sắc riêng, vừa tạo được sự gắn kết chặt chẽ.

Mẫu giày đá bóng adidas Predator 25 "Celestial Victory Pack" nổi bật với thiết kế chủ đạo màu "trắng tinh khôi", kết hợp hài hòa với ba sọc đặc trưng "màu hồng" và đinh giày cao su màu "xanh chanh" đầy ấn tượng.

Phối màu này sẽ "lên chân" những ngôi sao Jude Bellingham, Pedri, Raphinha, Trent Alexander-Arnold, Paulo Dybala….trong ...', 1750000.00, 'src/data/images/products/main_fa7b5b3b.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('23070491-5127-4f04-b025-904cfb459d85', 'JOMA TOP FLEX TF 2502 - TRẮNG/XANH LÁ MẠ', 'JOMA TOP FLEX TF 2304 - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Nâng cấp trải nghiệm chơi bóng của bạn thông qua mẫu giày đá banh JOMA TOP FLEX TF. JOMA TOP FLEX TF được thiết kế riêng cho bề mặt sân cỏ nhân tạo nhưng không kém phần ổn định và linh hoạt so với phiên bản đế IC cho sân futsal, từ đó giúp cho người mang có thể tự tin trình diễn lối chơi tốt nhất của bản thân.  

Thông số kỹ thuật

JOMA TOP FLEX TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.

Phần upper được làm từ da nhân tạo mềm mại nhưng không kém phần bền bỉ, giúp mang đến cảm giác bóng thật chân cho người mang. Vùng đầu mũi còn được bọc da lộn giúp tăng độ bền cho giày. Bên cạnh đó, khu vực đầu mũi này còn được trang bị thêm khung bọc nhựa hỗ trợ cho những pha ra chân bằng đầu mũi giày trở nên uy lực hơn. 

Trên phần thân giày được trang bị các lỗ thoát khí theo công nghệ VTS giúp cho đôi giày trở nên thoáng khí hơn, đảm bảo sự thoải mái trong suốt quá trình thi đấu.

Lưỡi gà rời làm từ chất liệu vải lưới v...', 1950000.00, 'src/data/images/products/main_500265de.jpg', 'ACTIVE', '6f5cd968-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('8ff2274c-77df-4130-b3fd-356531223bb2', 'NIKE PHANTOM 6 LOW ACADEMY TF ''ERLING HAALAND'' - HQ2326-800 - CAM/XANH', 'NIKE PHANTOM 6 LOW ACADEMY TF – GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO – PHỐI MÀU LASER ORANGE/BLUE VOID/LEMON VENOM | ERLING HAALAND PACK (08/2025)

Phiên bản Phantom 6 Low Academy đặc biệt lấy cảm hứng từ Erling Haaland - tiền đạo với bản năng săn bàn bùng nổ. Thiết kế phối màu chuyển sắc từ xanh lạnh ở gót tới đỏ và vàng rực rỡ ở mũi giày, tượng trưng cho sự cân bằng nội tâm và sức mạnh bùng cháy trên sân. Đây là lựa chọn lý tưởng cho người chơi muốn sự khác biệt cả về hiệu năng lẫn phong cách.

Thông số kỹ thuật

Mã sản phẩm: HQ2326-800

Phối màu: Laser Orange/Blue Void/Lemon Venom

Bộ sưu tập: Erling Haaland Pack (08/2025)

Upper: NikeSkin với vùng tiếp xúc bóng mở rộng

Công nghệ: Cyclone 360 hỗ trợ xoay chuyển linh hoạt

Form giày: Shoe frame ôm tự nhiên, đặc biệt ở mũi

Đệm lót: Cushioned sockliner êm ái

Đế: TF (Turf) – chuyên dụng sân cỏ nhân tạo

Xuất xứ: Indonesia

Đặc điểm nổi bật

Phối màu chuyển sắc độc đáo, gắn liền với cảm hứng từ Erling Haaland.

Vùng NikeSkin touch zone lớn...', 2150000.00, 'src/data/images/products/main_e10a1c9a.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('af7f35bd-82ba-41a0-9af4-fe16f04e894f', 'ADIDAS F50 LEAGUE TF - IE1230 - XANH/HỒNG', 'ADIDAS F50 LEAGUE TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Sau 9 năm vắng bóng, huyền thoại adidas F50 đã chính thức trở lại - nhẹ hơn, nhanh hơn và lợi hại hơn! Được thiết kế để khai phá trọn vẹn tiềm năng tốc độ của người chơi, mẫu giày đá bóng sân cỏ nhân tạo adidas F50 League TF sẽ là sự lựa chọn hoàn hảo dành cho những tiền vệ và tiền đạo ưu tiên sự nhanh nhẹn và thanh thoát trong lối chơi của mình.  

Lấy cảm hứng từ vẻ đẹp bầu trời và không gian bên ngoài vũ trụ, bộ sưu tập adidas "Celestial Victory" 2025 đã khéo léo phối hợp các gam màu Blue Fusion, Lucid Lemon và Lucid Pink trên cả ba mẫu giày đá bóng. Nhờ đó, bộ sưu tập vừa sở hữu bản sắc riêng, vừa tạo được sự gắn kết chặt chẽ.

Mẫu giày bóng đá adidas F50 "Celestial Victory Pack" gây ấn tượng với thiết kế táo bạo, rực rỡ. Sự kết hợp giữa màu "xanh nhạt" chủ đạo cùng các chi tiết "màu hồng" và "xanh chanh" nổi bật tạo nên diện mạo bắt mắt. Theo thông tin chính thức, các màu sắc này lần lượt là "Blue Fusion", "Lucid Lemon" và "L...', 2790000.00, 'src/data/images/products/main_e60ae9d5.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('5fd57e59-cef7-41e6-b0af-3890c5ef3695', 'NIKE ZOOM MERCURIAL VAPOR 16 ACADEMY KM TF - FQ8384-801 - CAM ĐÀO/XANH NGỌC', 'NIKE ZOOM MERCURIAL VAPOR 16 ACADEMY KM TF - KYLIAN MBAPPÉ SIGNATURE EDITION - Giày đá bóng sân cỏ nhân tạo thuộc Bộ sưu tập Kylian Mbappé - Ra mắt 10/2025
 
Phiên bản Nike Zoom Mercurial Vapor 16 Academy KM TF là mẫu giày đặc biệt dành riêng cho Kylian Mbappé, được Nike trình làng vào tháng 10/2025. Phối màu Cam đào/xanh ngọc tượng trưng cho nguồn năng lượng rực rỡ và tốc độ bùng nổ - đúng với tinh thần “lightning fast” của Mbappé trên sân cỏ.
 
Trên phần thân giày, dòng chữ đặc trưng của anh - “Sans risques, il n’y a pas de victoire” (Không mạo hiểm thì không chiến thắng) - được in tinh tế, nhắc lại triết lý sống và thi đấu của tiền đạo người Pháp.

Từng chi tiết được tinh chỉnh “to the exact specifications of Kylian Mbappé” - đúng như triết lý thiết kế của Nike. Logo KM được in nổi bật ở phần gót, khẳng định đây không chỉ là đôi giày signature thông thường, mà là sản phẩm phản ánh phong cách thi đấu bứt phá và tự tin của Mbappé.

Thông số kỹ thuật chi tiết

Loại đế: TF - đinh dăm...', 2190000.00, 'src/data/images/products/main_005e0369.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('f3f14e2d-48c7-4bfc-89b9-86a0974a9145', 'NIKE TIEMPO LEGEND 10 PRO TF - DV4336-001 - XÁM/XANH CHUỐI', 'NIKE TIEMPO LEGEND 10 PRO TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Đầu tháng 7/2023, Nike chính thức trình làng thế hệ thứ 10 của dòng giày đá banh huyền thoại Tiempo. Lần đầu tiên trong lịch sử, nhà Swoosh đã loại bỏ chất liệu da tự nhiên trên upper của dòng giày này, thay vào đó hãng sử dụng loại chất liệu FlyTouch hoàn toàn mới. Nhờ cải tiến quan trọng này đã biến Legend 10 trở thành thế hệ Tiempo nhẹ nhất từ trước đến nay mà bạn có thể sở hữu!

Thông số kỹ thuật:

NIKE TIEMPO LEGEND 10 PRO TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5-7 người. 

Phân khúc: Pro (chuyên nghiệp).

Tiempo Legend 10 Pro TF sở hữu phần upper được làm từ chất liệu da tổng hợp FlyTouch Pro hoàn toàn mới. Mềm hơn, nhẹ hơn và bền hơn so với da tự nhiên, upper da tổng hợp FlyTouch Pro còn giúp mang lại cảm giác ôm chân cho người mang. Đồng thời giúp giữ form giày không bị giãn quá mức sau một thời gian sử dụng. 

Trên bề mặt upper FlyTouch Pro là các đường vân với chiều dài khác nhau, giúp tăng khả ...', 2450000.00, 'src/data/images/products/main_c9ceebe5.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('cb507ad2-4bcc-42e9-b983-169e4804c2f7', 'ADIDAS F50 LEAGUE TF - JH7725 - ĐEN/BẠC/VÀNG', 'ADIDAS F50 LEAGUE TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO - PHỐI MÀU ĐEN/BẠC/VÀNG | ELECTRIC STEALTH PACK (07/2025)
Tăng tốc mạnh mẽ – Làm chủ mọi tình huống

adidas F50 League TF là đôi giày lý tưởng cho các cầu thủ thiên về tốc độ, xử lý nhanh và thi đấu trên sân cỏ nhân tạo 5–7 người. Phiên bản phối màu Đen/Bạc/Vàng mang đến vẻ ngoài mạnh mẽ, sắc lạnh nhưng không kém phần nổi bật – phù hợp với những người chơi muốn vừa hiệu quả vừa thể hiện cá tính trên sân.

Electric Stealth Pack – Sắc màu bùng cháy mở đầu mùa giải

Ra mắt vào tháng 07/2025, Electric Stealth Pack là bộ sưu tập mở màn mùa giải mới của adidas, lấy cảm hứng từ sức nóng và ánh sáng rực rỡ của mặt trời. Với gam màu chủ đạo thiên về ánh kim và sắc vàng, phối màu Đen/Bạc/Vàng trên F50 League TF tạo cảm giác sang trọng, sắc sảo và đậm chất thi đấu chuyên nghiệp.

Đây cũng là bộ sưu tập được các cầu thủ adidas sử dụng trong giai đoạn khởi động mùa giải 2025/26 trên khắp các mặt sân châu Âu và châu Á.

Thông số kỹ thuật chi tiế...', 1260000.00, 'src/data/images/products/main_2be793fc.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('1302430a-7018-4248-9e88-540b8c1707bb', 'NIKE TIEMPO LEGEND 10 PRO TF - DV4336-800 - ĐỎ/TRẮNG', 'NIKE TIEMPO LEGEND 10 PRO TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Đầu tháng 7/2023, Nike chính thức trình làng thế hệ thứ 10 của dòng giày đá banh huyền thoại Tiempo. Lần đầu tiên trong lịch sử, nhà Swoosh đã loại bỏ chất liệu da tự nhiên trên upper của dòng giày này, thay vào đó hãng sử dụng loại chất liệu FlyTouch hoàn toàn mới. Nhờ cải tiến quan trọng này đã biến Legend 10 trở thành thế hệ Tiempo nhẹ nhất từ trước đến nay mà bạn có thể sở hữu!

Mẫu giày đá bóng Nike Tiempo Legend 10 sẽ được những ngôi sao hàng đầu nhà Swoosh mang trên chân như Virgil Van Dijk, Jamal Musiala, Frenkie De Jong, Thibaut Courtois, Ronald Araujo, William Saliba…

Thông số kỹ thuật:

NIKE TIEMPO LEGEND 10 PRO TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5-7 người. 

Phân khúc: Pro (chuyên nghiệp).

Tiempo Legend 10 Pro TF sở hữu phần upper được làm từ chất liệu da tổng hợp FlyTouch Pro hoàn toàn mới. Mềm hơn, nhẹ hơn và bền hơn so với da tự nhiên, upper da tổng hợp FlyTouch Pro còn giúp mang lại ...', 2750000.00, 'src/data/images/products/main_aa27405c.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('7fc610d8-1b26-4d15-b149-17f3f17337b2', 'ZOCKER WINNER ENERGY TF - ĐỎ', 'ZOCKER WINNER ENERGY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Zocker Winner Energy - Cảm hứng đến từ Năng lượng chiến thắng

Giày bóng đá Zocker Winner Energy đỏ là 1 trong 5 phiên bản màu của bộ sưu tập mới, được thương hiệu Zocker giới thiệu tới những người yêu thích bóng đá trong hè này.

Giày được thiết kế với màu đỏ chủ đạo và các chi tiết màu vàng, những họa tiết tinh tế được tạo bở các lát cắt laze làm nổi bật sự mạnh mẽ, tinh thần thể thao. Zocker gửi gắm thông điệp "Năng lượng chiến thắng" trong bộ sản phẩm mới, tượng trưng cho sự tự tin, tích cực.

Giày sở hữu nhiều cải tiến mới, bên cạnh đó là sự kế thừa những ưu điểm được đúc rút từ những thế hệ trước đó như Space, Inspire và Inspire Pro...

Upper được làm từ da PU cao cấp, cho cảm giác mềm và êm chân ngay từ khi tiếp xúc. Nhờ đó, người chơi không cần phải mất thời gian cho quá trình làm giãn giày - breakin. Ở nửa thân trên giày còn được gia cố các gờ nổi, giúp người chơi kiểm soát bóng tốt hơn

Một tính năng thường chỉ được t...', 665000.00, 'src/data/images/products/main_df0166b0.jpg', 'ACTIVE', '6f5cd9b6-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('fdbc2e47-a40e-4958-ae42-d177852cc321', 'NIKE ZOOM MERCURIAL VAPOR 16 ACADEMY TF - FQ8449-600 - HỒNG TÍM/CAM', 'NIKE ZOOM MERCURIAL VAPOR 16 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO - PHỐI MÀU HỒNG TÍM/CAM | SCARY GOOD PACK (07/2025)
Tăng tốc với phong cách táo bạo – Khác biệt từ cú chạm đầu tiên

Nike Zoom Mercurial Vapor 16 Academy TF là mẫu giày đinh dăm cỏ nhân tạo thuộc phân khúc phổ thông trong đại gia đình Mercurial nổi tiếng. Dành riêng cho những cầu thủ yêu thích tốc độ, xử lý linh hoạt và thi đấu trên sân 5–7 người, phiên bản Hồng Tím/Cam thuộc bộ sưu tập Scary Good Pack (07/2025) mang diện mạo cực kỳ nổi bật, thể hiện cá tính mạnh mẽ và sự bứt phá về phong cách lẫn hiệu năng.

Scary Good Pack – Sắc màu táo bạo cho mùa giải mới

Phát hành tháng 07/2025, Scary Good Pack là bộ sưu tập mở đầu cho mùa giải 2025/26 của Nike, nổi bật với những phối màu mang tính “khiêu khích thị giác”. Phối hồng tím kết hợp cam rực lửa trên Vapor 16 Academy TF được đặt tên là Magic Flamingo, đại diện cho tinh thần “đáng sợ theo cách riêng” – đậm chất cá nhân, tốc độ và đột phá.

Đây là mẫu giày giúp bạn ...', 1990000.00, 'src/data/images/products/main_dae8ec00.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('19f29e3c-4ea7-429a-bd72-e1a47f806ba0', 'NIKE ZOOM MERCURIAL VAPOR 16 PRO TF - FQ8687-400 - XANH LƠ', 'NIKE MERCURIAL VAPOR 16 PRO TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Chinh phục những giới hạn tốc độ mới cùng mẫu giày đá bóng Nike Mercurial Vapor 16 Pro TF phối màu “Mad Ambition Pack”!

Sau chu kỳ 2 năm, tháng 7/2024, Nike đã chính thức trình làng thế hệ mới nhất của silo Air Zoom Mercurial. Nhẹ hơn - bền hơn - bùng nổ hơn, Mercurial Vapor 16 Pro TF sẽ là đôi giày bóng đá hoàn hảo dành cho những tín đồ đam mê tốc độ.

“Mad Ambition Pack” là bộ sưu tập giày đá bóng chính thức đầu tiên được Nike trình làng nhằm chuẩn bị cho mùa giải 24/25 sắp tới đây. Sở hữu phối màu “Glacier Blue/Blue Orbit” đầy hài hòa nhưng không kém phần nổi bật, mẫu giày đá bóng Nike Air Zoom Mercurial Vapor 16 và Superfly 10 “Mad Ambition” sẽ được những ngôi sao hàng đầu nhà Swoosh mang trên chân như Cristiano Ronaldo, Kylian Mbappé, Vinicius Jr., Federico Valverde, Rodrygo, Cole Palmer, Bruno Fernandes, Luka Modric….

Thông số kỹ thuật

MERCURIAL VAPOR 16 PRO TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo ...', 2790000.00, 'src/data/images/products/main_f4d0eb75.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('20f57804-0c2d-408d-87e6-4d12b5b184d4', 'ADIDAS X CRAZYFAST MESSI.3 TF - IE4074 - XÁM/XANH', 'ADIDAS X CRAZYFAST MESSI.3 TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Viết nên câu chuyện tốc độ của riêng bạn với mẫu giày đá banh adidas X Crazyfast.3 TF hoàn toàn mới! Sở hữu những cải tiến mới nhất cùng một thiết kế tối giản phục vụ cho lối chơi tốc độ, X Crazyfast.3 TF xứng đáng là sự lựa chọn hàng đầu dành cho những tiền vệ và tiền đạo ưu tiên sự linh hoạt và thanh thoát trong cách chơi của mình!

Thông số kỹ thuật:

ADIDAS X CRAZYFAST MESSI.3 TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5-7 người.

Phân khúc: .3 (tầm trung).

Phần upper làm từ chất liệu da tổng hợp pha sợi dệt mềm mại, mang lại cảm giác bóng tốt nhất cho người mang. Trên bề mặt upper được phủ một lớp nhựa TPU giúp tăng khả năng kiểm soát khi rê dắt bóng ở tốc độ cao. 

Lưỡi gà liền được làm từ sợi dệt với độ co giãn cao, giúp ôm khít phần mu và cổ chân.  

Đệm gót là một lớp vải nhung dày dặn, mang lại cảm giác ôm chân vừa vặn và êm ái. 

Khung bọc gót TPU giúp hạn chế tình trạng xê dịch gót chân khi di c...', 1260000.00, 'src/data/images/products/main_831a4fae.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('0025e232-baf9-4bd0-9fcb-ac73f99a2d37', 'NIKE PHANTOM LUNA 2 ACADEMY TF - FJ2566-003 - XÁM/XANH CHUỐI', 'NIKE PHANTOM LUNA 2 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Chơi bóng với sức mạnh và sự chính xác tuyệt đối cùng NIKE PHANTOM LUNA 2 ACADEMY TF. Được thiết kế cho các ngôi sao hàng đầu ở vị trí tấn công như Kevin De Bruyne, Erling Haaland, Phil Foden….PHANTOM LUNA 2 ACADEMY TF với những cải tiến đặc biệt sẽ giúp bạn phát huy toàn bộ khả năng tốt nhất của bản thân trên sân cỏ!

Thông số kỹ thuật

NIKE PHANTOM LUNA 2 ACADEMY TF là mẫu giày đá banh đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc : Academy (tầm trung).

Phần upper làm từ da tổng hợp mềm mại được mô phỏng theo chất liệu sợi dệt sẽ mang đến cảm giác thật chân nhất trong từng pha chạm bóng. Trên bề mặt Phantom Luna 2 Academy TF được trang bị thêm lớp phủ NikeSkin giúp tăng độ bám bóng, từ đó người chơi có thể kiểm soát và rê bóng tốt hơn ở bất kỳ điều kiện thời tiết. 

Công nghệ Strike Zone với các vân vòng tròn được in dập nổi ở những vùng tiếp xúc bóng chủ yếu giúp tăng thêm độ xoáy cho những cú phất bóng và cứ...', 2450000.00, 'src/data/images/products/main_6d6bde8b.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('7c1057ec-93e7-4c1d-afb5-ad5c742b6ba1', 'NIKE PHANTOM LUNA 2 ACADEMY TF - FJ2566-800 - HỒNG CAM', 'NIKE PHANTOM LUNA 2 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Chơi bóng với sức mạnh và sự chính xác tuyệt đối cùng NIKE PHANTOM LUNA 2 ACADEMY TF. Được thiết kế cho các ngôi sao hàng đầu ở vị trí tấn công như Kevin De Bruyne, Erling Haaland, Phil Foden….PHANTOM LUNA 2 ACADEMY TF với những cải tiến đặc biệt sẽ giúp bạn phát huy toàn bộ khả năng tốt nhất của bản thân trên sân cỏ!

Thông số kỹ thuật

NIKE PHANTOM LUNA 2 ACADEMY TF là mẫu giày đá banh đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc : Academy (tầm trung).

Phần upper làm từ da tổng hợp mềm mại được mô phỏng theo chất liệu sợi dệt sẽ mang đến cảm giác thật chân nhất trong từng pha chạm bóng. Trên bề mặt Phantom Luna 2 Academy TF được trang bị thêm lớp phủ NikeSkin giúp tăng độ bám bóng, từ đó người chơi có thể kiểm soát và rê bóng tốt hơn ở bất kỳ điều kiện thời tiết. 

Công nghệ Strike Zone với các vân vòng tròn được in dập nổi ở những vùng tiếp xúc bóng chủ yếu giúp tăng thêm độ xoáy cho những cú phất bóng và cứ...', 2750000.00, 'src/data/images/products/main_124bb133.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('1b2d4bd0-34ca-413a-b70c-846c092f4d2d', 'ADIDAS PREDATOR ACCURACY.3 TF - GZ0007 - XANH DƯƠNG/TRẮNG', 'ADIDAS PREDATOR ACCURACY.3 TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Kiểm soát + chính xác = tự tin. Đó chính là công thức để tạo nên mẫu giày đá banh ADIDAS PREDATOR ACCURACY.3 TF hoàn toàn mới lần này! Sở hữu những cải tiến đáng kể so với thế hệ trước đây, mẫu giày PREDATOR ACCURACY.3 TF sẽ giúp bạn tự tin làm chủ cuộc chơi, kiểm soát trận đấu!

Thông số kỹ thuật

ADIDAS PREDATOR ACCURACY.3 TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc: .3 (tầm trung)

Phần upper làm từ chất liệu da tổng hợp mềm mại. Các vân High Definition Texture được in dập nổi ở khu vực má trong và má ngoài làm tăng độ ma sát với bóng, từ đó giúp người chơi có thể dễ dàng thực hiện các đường chuyền hay cú sút với độ chính xác cao. 

Lưỡi gà rời được thiết kế mỏng mang đến sự thoải mái cho người mang, đặc biệt là cho những ai với mu chân cao và dày.

Hệ thống dây giày được làm lệch sang một bên giúp mở rộng vùng diện tích sút bóng.

Lớp đệm gót được làm từ chất liệu vải nhung dày và mịn,...', 1260000.00, 'src/data/images/products/main_f360ec82.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('66364b72-06e5-423a-b5c8-37712d06aa89', 'NIKE ZOOM MERCURIAL VAPOR 16 ACADEMY TF - FQ8449-800 - ĐỎ TRẮNG', 'NIKE ZOOM MERCURIAL VAPOR 16 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Chinh phục những giới hạn tốc độ mới cùng mẫu giày đá bóng Nike Mercurial Vapor 16 Academy TF.

Sau chu kỳ 2 năm, tháng 7/2024, Nike đã chính thức trình làng thế hệ mới nhất của silo Air Zoom Mercurial. Nhẹ hơn - bền hơn - bùng nổ hơn, Mercurial Vapor 16 Academy TF sẽ là đôi giày bóng đá hoàn hảo dành cho những tín đồ đam mê tốc độ.

Mẫu giày đá bóng Nike Air Zoom Mercurial Vapor 16 sẽ được những ngôi sao hàng đầu nhà Swoosh mang trên chân như Cristiano Ronaldo, Kylian Mbappé, Vinicius Jr., Federico Valverde, Rodrygo, Cole Palmer, Bruno Fernandes, Luka Modric….

Thông số kỹ thuật

MERCURIAL VAPOR 16 ACADEMY TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5 đến 7 người. 

Phân khúc: Academy (tầm trung).

Form giày phù hợp cho chân thon đến bè vừa. 

Phần upper được làm từ da tổng hợp NikeSkin mềm mỏng và đàn hồi sẽ mang lại cảm giác bóng thật chân cho bạn. Bề mặt upper được phủ một lớp PU, không chỉ giúp...', 2750000.00, 'src/data/images/products/main_adedf842.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('15780617-6459-4759-b361-64a784d2418c', 'PUMA ULTRA 5 PRO CAGE - 107889-03 - XANH LÁ MẠ', 'PUMA ULTRA 5 PRO CAGE - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Khai phá giới hạn tốc độ của riêng bạn cùng PUMA ULTRA 5 hoàn toàn mới. Lấy cảm hứng từ thành công của những chiếc xe đua tốc độ F1, mẫu giày đá bóng sân cỏ nhân tạo PUMA Ultra 5 Pro Cage sẽ không chỉ giúp bạn nhanh hơn - bùng nổ hơn - mà còn mang đến sự biến ảo cho lối chơi của bạn!

Thông số kỹ thuật

PUMA ULTRA 5 PRO CAGE là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.

Phân khúc: Pro (chuyên nghiệp).

Form giày phù hợp cho chân bè ít đến bè nhiều. 

Phần upper được làm từ chất liệu sợi dệt nhẹ, mềm và mỏng với khả năng thích ứng dễ dàng theo form bàn chân người chơi. Trên bề mặt upper là lớp phủ silicon GRIPCONTROL PRO giúp làm tăng độ bám bóng, từ đó nâng cao khả năng kiểm soát bóng của người mang khi rê dắt ở tốc độ cao. 

Bên dưới lớp upper được trang bị công nghệ PWRTAPE góp phần định hình cho cấu trúc của đôi giày và mang lại sự ổn định xuyên suốt quá trình chơi bóng cho người mang. 

Cổ giày và lưỡi gà liề...', 1290000.00, 'src/data/images/products/main_ee986316.jpg', 'ACTIVE', '6f5cd8bb-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('a3fdfee6-369d-4bb8-a80d-852d4212fa23', 'NIKE ZOOM MERCURIAL SUPERFLY 10 ACADEMY KM TF - FQ8333-801 - CAM ĐÀO/XANH NGỌC', 'NIKE ZOOM MERCURIAL SUPERFLY 10 ACADEMY KM TF - KYLIAN MBAPPÉ SIGNATURE EDITION (10/2025)

Sẵn sàng bùng nổ - Năng lượng của tốc độ và bản lĩnh
Nike Zoom Mercurial Superfly 10 Academy KM TF là mẫu giày đinh dăm cỏ nhân tạo thuộc dòng Mercurial cao cổ, được thiết kế dành riêng cho Kylian Mbappé - biểu tượng của tốc độ và sự tự tin trên sân đấu. Phiên bản Cam đào/xanh ngọc ra mắt tháng 10/2025 mang đậm dấu ấn cá nhân của Mbappé: nổi bật, mạnh mẽ và luôn dẫn đầu trong mọi pha bứt tốc.

Kylian Mbappé Collection - Phong cách “điện cao áp” của nhà vô địch
Thuộc bộ sưu tập đặc biệt của Mbappé, Superfly 10 KM TF thể hiện tinh thần không giới hạn của cầu thủ người Pháp - luôn sẵn sàng tạo nên khác biệt bằng tốc độ. Tông cam đào rực rỡ kết hợp xanh ngọc mát lạnh, thể hiện hai mặt đối lập trong phong cách của Mbappé: bùng nổ nhưng lạnh lùng, nhanh và chính xác.

Thiết kế cổ cao Dynamic Fit hỗ trợ cổ chân chắc chắn, giúp chuyển hướng linh hoạt ở tốc độ cao. Upper làm từ vật liệu tổng hợp Flykni...', 2190000.00, 'src/data/images/products/main_c2963679.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('b6eade10-bdc0-4675-9d6a-8605173ff614', 'ADIDAS PREDATOR 25 LEAGUE LƯỠI GÀ LẬT TF - JS0385 - TRẮNG/HỒNG', 'ADIDAS PREDATOR 25 LEAGUE LƯỠI GÀ LẬT TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO CHÍNH HÃNG

Hãy sẵn sàng ra sân và ghi bàn cùng mẫu giày bóng đá ADIDAS PREDATOR 25 LEAGUE L TF! Được cải tiến để tối ưu hóa khả năng tấn công của người chơi, ADIDAS PREDATOR 25 LEAGUE L TF với những công nghệ tiên tiến nhất của nhà Ba Sọc sẽ mang đến cho bạn sức mạnh bứt phá và độ chính xác tuyệt đối trong từng pha bóng.

Lấy cảm hứng từ vẻ đẹp bầu trời và không gian bên ngoài vũ trụ, bộ sưu tập adidas "Celestial Victory" 2025 đã khéo léo phối hợp các gam màu Blue Fusion, Lucid Lemon và Lucid Pink trên cả ba mẫu giày đá bóng. Nhờ đó, bộ sưu tập vừa sở hữu bản sắc riêng, vừa tạo được sự gắn kết chặt chẽ.

Mẫu giày đá bóng adidas Predator 25 "Celestial Victory Pack" nổi bật với thiết kế chủ đạo màu "trắng tinh khôi", kết hợp hài hòa với ba sọc đặc trưng "màu hồng" và đinh giày cao su màu "xanh chanh" đầy ấn tượng.

Phối màu này sẽ "lên chân" những ngôi sao Jude Bellingham, Pedri, Raphinha, Trent Alexander-Arnold,...', 2790000.00, 'src/data/images/products/main_6f9f0cad.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('8b940765-cbb3-43d5-af1f-9527c73bec85', 'MIZUNO MORELIA SALA JAPAN TF - Q1GB251137 - TRẮNG/XANH LÁ', 'Mizuno Morelia Sala Japan TF – Mã sản phẩm Q1GB251137

Đỉnh cao của nghệ thuật thủ công Nhật Bản

Được chế tác hoàn toàn thủ công tại Nhật Bản, Mizuno Morelia Sala Japan TF là biểu tượng của sự tỉ mỉ và chất lượng vượt trội. Mỗi đôi giày trải qua quy trình kiểm định nghiêm ngặt, đảm bảo mang đến cho người chơi cảm giác bóng chân thực và sự thoải mái tối đa trên sân cỏ nhân tạo.​

Chất liệu cao cấp – Da Kangaroo thượng hạng

Da Kangaroo Scotchguard mềm mại, mỏng nhẹ nhưng bền bỉ, mang lại cảm giác như đi "chân trần" và khả năng kiểm soát bóng tối ưu.

Thiết kế các đường khâu ngang và dọc ở phần mu bàn chân giúp lớp da co giãn linh hoạt, giảm ma sát và tăng cường độ nhạy khi xử lý bóng.

Lưỡi gà đục lỗ tăng cường độ thoáng khí, giữ cho đôi chân luôn khô ráo trong suốt trận đấu

Công nghệ tiên tiến – Hệ thống Wave Fit

Hệ thống Wave Fit thiết kế dạng zíc zắc đặc biệt, ôm sát bàn chân, hạn chế tối đa hiện tượng trượt chân bên trong giày.

Mang lại sự ổn định tuyệt đối, hỗ trợ tối ưu cho...', 4300000.00, 'src/data/images/products/main_fdc8b245.jpg', 'ACTIVE', '6f5cd833-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('ebe1fb33-9209-4db5-9616-b054d1526a4e', 'ADIDAS PREDATOR 25 LEAGUE LƯỠI GÀ LẬT TF - JQ1072 - TRẮNG/ĐEN/VÀNG', 'ADIDAS PREDATOR 25 LEAGUE L TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO CHÍNH HÃNG

Hãy sẵn sàng ra sân và ghi bàn cùng mẫu giày bóng đá ADIDAS PREDATOR 25 LEAGUE L TF! Được cải tiến để tối ưu hóa khả năng tấn công của người chơi, ADIDAS PREDATOR 25 LEAGUE L TF với những công nghệ tiên tiến nhất của nhà Ba Sọc sẽ mang đến cho bạn sức mạnh bứt phá và độ chính xác tuyệt đối trong từng pha bóng.

Thông số kỹ thuật: 

ADIDAS PREDATOR LEAGUE L TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc: League (tầm trung).

Form giày phù hợp cho chân thon đến bè vừa.

Phần upper được làm từ chất liệu da nhân tạo Hybridfeel mềm mỏng và đàn hồi, giúp mang lại cảm giác chạm bóng thật chân nhất cho người chơi. 

Ở khu vực má trong là các vân 3D Strikescale được in dập nổi giúp tăng độ ma sát với bóng, từ đó hỗ trợ người chơi kiểm soát bóng tốt hơn trong mọi tình huống.

Lưỡi gà rời mềm mỏng giúp người chơi dễ dàng xỏ chân vào giày hơn trước, phù hợp cho những anh em có mu bàn chân cao...', 2790000.00, 'src/data/images/products/main_3e9a5b6a.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('82287492-131c-4a70-9bc9-ed00c0d61db1', 'ADIDAS X SPEEDPORTAL.1 TF - GZ2440 - HỒNG/ĐEN', 'ADIDAS X SPEEDPORTAL.1 TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Mùa hè 2022, thế giới bóng đá đón chào sự xuất hiện của những thế hệ tiếp theo thuộc các silo giày đá banh đình đám nhất hiện nay. Trong đó không thể không kể đến X Speedportal - thế hệ tiếp theo của dòng giày adidas X. X Speedportal sẽ đem đến những thay đổi về mặt chất liệu và công nghệ giày tiên tiến nhất của adidas nhằm giúp người mang có được trải nghiệm chơi bóng tuyệt vời nhất.

Xét về thiết kế, X Speedportal có form dáng thon gọn đậm chất tốc độ, phù hợp với lối chơi yêu cầu tốc độ và sự linh hoạt cao như tiền đạo, tiền vệ, hậu vệ cánh… Logo Ba Sọc đặc trưng của hãng nay đã được đặt ở vùng mũi má ngoài, tạo nên một thiết kế hiện đại và trẻ trung hơn. 

Thông số kỹ thuật:

X SPEEDPORTAL.1 TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc: .1 (chuyên nghiệp).

Phần upper làm từ chất liệu da Speedskin 2.0 siêu nhẹ và thoải mái với những vân sần ở khu vực lòng trong và má ngoài giúp mang lại cảm...', 1260000.00, 'src/data/images/products/main_8a4d9726.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('adcf281f-bb4e-41a9-b5de-cdb932e02224', 'MIZUNO MORELIA NEO SALA β JAPAN TF - Q1GB251037 - TRẮNG/XANH LÁ', 'Mizuno Morelia Neo Sala β Japan TF – Mã sản phẩm Q1GB251037

Tinh hoa thủ công Nhật Bản – Đỉnh cao cảm giác bóng

Được chế tác thủ công tại Nhật Bản, Mizuno Morelia Neo Sala β Japan TF là sự kết hợp hoàn hảo giữa công nghệ hiện đại và nghệ thuật thủ công truyền thống. Mỗi đôi giày là minh chứng cho sự tỉ mỉ và cam kết chất lượng của Mizuno, mang đến cho cầu thủ cảm giác bóng chân thực và sự thoải mái tối đa trên sân cỏ nhân tạo.​

Chất liệu cao cấp – Da Kangaroo thượng hạng

Da Kangaroo mềm mại, mỏng nhẹ nhưng bền bỉ, mang lại cảm giác như đi "chân trần" và khả năng kiểm soát bóng tối ưu.

Thiết kế các đường khâu tinh tế giúp lớp da co giãn linh hoạt, giảm ma sát và tăng cường độ nhạy khi xử lý bóng.

Công nghệ tiên tiến – Hệ thống Wave Fit và Mizuno ENERZY

Hệ thống Wave Fit thiết kế dạng zíc zắc đặc biệt, ôm sát bàn chân, hạn chế tối đa hiện tượng trượt chân bên trong giày.

Mizuno ENERZY – vật liệu đệm tiên tiến, cung cấp độ êm ái và đàn hồi vượt trội, hỗ trợ tối ưu cho các pha b...', 4300000.00, 'src/data/images/products/main_f8fc38dc.jpg', 'ACTIVE', '6f5cd833-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('aca3e1f6-339f-4b74-8f86-e022247b2003', 'PUMA FUTURE 8 PRO CAGE - 108592-01 - TRẮNG/CAM', 'PUMA FUTURE 8 PRO CAGE phối màu Trắng/Cam là một trong những mẫu nổi bật thuộc bộ sưu tập Untamed Pack, chính thức ra mắt toàn cầu từ 10/07/2025. Bộ sưu tập toát lên tinh thần “bứt phá, không theo quy tắc”, với thiết kế chủ đạo màu trắng tinh tế kết hợp điểm nhấn màu đỏ và đen mạnh mẽ - lý tưởng cho những cầu thủ không ngại khơi dậy phong cách cá nhân và biểu đạt sự sáng tạo không giới hạn.

Thông số kỹ thuật:

PUMA FUTURE 8 PRO CAGE là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5 đến 7 người.

Phân khúc: Pro (chuyên nghiệp). 

Form giày phù hợp cho chân từ bè ít đến bè nhiều.

Phần upper được tạo thành từ 2 lớp khác nhau:

Bên dưới là lớp chất liệu sợi dệt LYCRA® mới với khả năng co giãn 4 chiều cực tốt giúp ôm trọn bàn chân người mang. 

Bên trên là sự kết hợp giữa lớp phủ silicon GRIPCONTROL PRO và các đường vân nổi tăng độ ma sát với bóng, từ đó giúp người chơi dễ dàng kiểm soát bóng trong mọi tình huống.  

Dải băng PWRTAPE chính giữa thân giày đã được tinh giản thành h...', 1650000.00, 'src/data/images/products/main_f042c5e5.jpg', 'ACTIVE', '6f5cd8bb-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('c9659195-350f-4b6b-8418-d7a8a9360782', 'NIKE PHANTOM LUNA 2 ACADEMY TF - FJ2566-100 - TRẮNG/ĐEN', 'NIKE PHANTOM LUNA 2 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Chơi bóng với sức mạnh và sự chính xác tuyệt đối cùng NIKE PHANTOM LUNA 2 ACADEMY TF. Được thiết kế cho các ngôi sao hàng đầu ở vị trí tấn công như Kevin De Bruyne, Erling Haaland, Phil Foden….PHANTOM LUNA 2 ACADEMY TF với những cải tiến đặc biệt sẽ giúp bạn phát huy toàn bộ khả năng tốt nhất của bản thân trên sân cỏ!

Thông số kỹ thuật

NIKE PHANTOM LUNA 2 ACADEMY TF là mẫu giày đá banh đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc : Academy (tầm trung).

Phần upper làm từ da tổng hợp mềm mại được mô phỏng theo chất liệu sợi dệt sẽ mang đến cảm giác thật chân nhất trong từng pha chạm bóng. Trên bề mặt Phantom Luna 2 Academy TF được trang bị thêm lớp phủ NikeSkin giúp tăng độ bám bóng, từ đó người chơi có thể kiểm soát và rê bóng tốt hơn ở bất kỳ điều kiện thời tiết. 

Công nghệ Strike Zone với các vân vòng tròn được in dập nổi ở những vùng tiếp xúc bóng chủ yếu giúp tăng thêm độ xoáy cho những cú phất bóng và cứ...', 1260000.00, 'src/data/images/products/main_43a5a06d.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('7a9fed17-5541-4965-b192-10b74a788e73', 'PUMA ULTRA 3.4 TT - 106730-01 - XÁM/CAM', 'PUMA ULTRA 3.4 TT - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Khi mùa giải đã bước tới giai đoạn cuối cùng thì cũng là lúc PUMA hoàn thành BST “Instinct" dang dở của mình bằng việc ra mắt mẫu giày PUMA ULTRA trong phối màu “Diamond Silver/Neon Citrus” (Bạc/Cam). 

Đôi giày có phần upper và mặt đế ngoài được trang trí với sắc bạc, phần cổ giày, lưỡi gà và logo Báo Đức thì trong sắc “Neon Citrus”, khá giống với “Flare" Pack được ra mắt đầu năm nay của hãng. 

Thông số kỹ thuật:

PUMA Ultra 3.4 TF là mẫu giày đá bóng sân cỏ nhân tạo dành cho sân cỏ nhân tạo 5-7 người.

Phân khúc: 3 (tầm trung).

Phần upper làm từ da tổng hợp được phủ một lớp GripControl làm tăng độ bám bóng và nâng cao khả năng kiểm soát bóng, giúp người chơi có thể chơi bóng ở mọi điều kiện thời tiết.

Bên dưới lớp upper là cấu trúc SpeedCage giúp giày không bị mất form sau một thời gian chơi bóng, đồng thời giúp giữ cho bàn chân không bị xô lệch khi chơi bóng ở cường độ cao. 

Lưỡi gà liền làm từ vải dệt mang lại cảm giác ôm châ...', 1290000.00, 'src/data/images/products/main_278449e0.jpg', 'ACTIVE', '6f5cd8bb-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('7d3c6364-8064-4bbf-b6af-27f17eef9c36', 'PUMA FUTURE 8 PRO CAGE - 108366-01 - ĐEN/TÍM', 'PUMA FUTURE 8 PRO CAGE - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Vượt qua mọi giới hạn trên sân cỏ cùng PUMA FUTURE 8 PRO CAGE! Được thiết kế với những công nghệ hàng đầu từ nhà Báo Đức, Future 8 Pro Cage sẽ giúp bạn thỏa sức sáng tạo mỗi khi ra sân.

Ra sân, cảm nhận và tạo sự khác biệt - đó chính là những gì Future 8 mới nhất sẽ mang lại cho bạn!

PUMA “Unlimited Pack” là bộ sưu tập giày đá bóng đầu tiên trong năm 2025 của nhà Báo Đức. Sở hữu phối màu “PUMA Black/PUMA White/Glowing Red” đầy cuốn hút, mẫu giày đá bóng PUMA Future 8 “Unlimited Pack” hiện đang được những ngôi sao như Neymar Jr., Kai Havertz, Jack Grealish, Marc Cucurella, James Maddison…lên chân.

Thông số kỹ thuật:

PUMA FUTURE 8 PRO CAGE là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5 đến 7 người.

Phân khúc: Pro (chuyên nghiệp). 

Form giày phù hợp cho chân từ bè ít đến bè nhiều.

Phần upper được tạo thành từ 2 lớp khác nhau:

Bên dưới là lớp chất liệu sợi dệt LYCRA® mới với khả năng co giãn 4 chiều cực tốt giúp ôm ...', 1290000.00, 'src/data/images/products/main_89a439f2.jpg', 'ACTIVE', '6f5cd8bb-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('41cd8642-ad60-4ea8-a649-89c8a3b3850b', 'ZOCKER INSPIRE PRO TF SNS 005 - HỒNG/XANH', 'ZOCKER INSPIRE PRO TF SNS - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Được mệnh danh là “vị vua mới” trong phân khúc giày đá bóng dưới 1 triệu, ZOCKER INSPIRE PRO TF SNS nổi bật với thiết kế hiện đại cùng chất lượng   hoàn thiện sản phẩm tuyệt vời. Đặc biệt, với chính sách bảo hành 1 đổi 1 trong 4 tháng đầu tiên, bạn hoàn toàn có thể tự tin trải nghiệm dòng sản phẩm giày đá bóng ZOCKER INSPIRE PRO TF SNS mới đến từ nhà Sóc lần này!  

Thông số kỹ thuật

ZOCKER INSPIRE PRO TF SNS là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.

Phần upper được làm từ chất liệu da PU cao cấp và mềm mại với khả năng giữ form tốt, ít bị bai nhão sau một thời gian sử dụng. Trên khắp bề mặt upper được in dập nổi các vân 3D hỗ trợ kiểm soát và rê bóng tốt hơn.  

Lưỡi gà rời mỏng giúp dễ xỏ chân vào giày, phù hợp với những anh em có mu bàn chân cao và dày.  

Lót giày với chất liệu cao su êm mềm, được thiết kế với các lỗ nhỏ giúp  thoáng khí hơn trong suốt quá trình thi đấu. 

Gót giày với khung định hìn...', 665000.00, 'src/data/images/products/main_0bceaf45.jpg', 'ACTIVE', '6f5cd9b6-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('823a4d90-d623-49a6-9c00-d2ccf08931f7', 'NIKE PHANTOM GT2 ACADEMY TF - DR5965-810 - NÂU/ĐEN', 'NIKE PHANTOM GT2 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Sau gần 1 năm kể từ ngày ra mắt Phantom GT, Nike tiếp tục trình làng thế hệ thứ 2 của dòng giày đá bóng đa năng này vào đầu tháng 7/2021. Với những thay đổi trên thế hệ mới này, Phantom GT 2 hứa hẹn sẽ làm hài lòng các fan đam mê giày đá bóng, kể cả những người chơi khó tính nhất!

Khác với hai đối thủ ở phía bên kia đại dương, Nike đã chọn cho mình một lối đi riêng khi quyết định tung ra bộ sưu tập mới tại thời điểm World Cup đã cận kề. Nếu nói “Generation Pack” là bộ sưu tập bí ẩn nhất trước thềm World Cup thì cũng không hoàn toàn sai, vì chúng ta vẫn chưa được chứng kiến hình ảnh các cầu thủ mang trên chân pack giày mới nhất của nhà Swoosh.  

“Generation Pack” là bộ sưu tập có gam màu chủ đạo là vàng đồng và nâu maroon, được lấy cảm hứng từ màu của chính chiếc cúp vàng World Cup và quốc kỳ của nước chủ nhà Qatar. Đáng chú ý, đây cũng sẽ là bộ sưu tập cuối cùng có sự xuất hiện của silo Phantom GT 2, trước khi chúng bị kh...', 1260000.00, 'src/data/images/products/main_d19550ba.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('1e42543b-2fa2-4f7d-a4f3-bbf8547d836a', 'MIZUNO MORELIA SALA ELITE TF - Q1GB240145 - VÀNG NEON/TRẮNG', 'MIZUNO MORELIA SALA ELITE TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Với upper da Kangaroo mềm mại, bộ đệm giảm chấn êm ái cùng form giày bè nhiều phù hợp với form chân người Việt Nam, Mizuno Morelia Sala Elite TF sẽ là mẫu giày “chân ái” dành cho nhiều anh em.

Thông số kỹ thuật

Phần upper làm từ da Kangaroo thượng hạng mềm mại và đàn hồi, hỗ trợ tối đa cho người mang khi nhận bóng, đi bóng, sút mu và mang lại cảm giác bóng thật chân. 

Vùng đầu mũi được bọc da lộn nhằm tăng độ bền cho đôi giày, cũng như hỗ trợ cho những pha chích mũi của người mang. 

Lót giày êm ái, chống trượt hiệu quả và có thể tháo rời.

Bộ đệm giữa giảm chấn êm ái giúp giảm chấn thương và tạo sự thoải mái trong suốt trận đấu.

Đế ngoài làm từ chất liệu cao su cao cấp, cho khả năng bám sân theo nhiều hướng khác nhau, hỗ trợ tối đa cho những pha di chuyển đổi hướng liên tục.

Form giày được thiết kế bè nhiều phù hợp với form chân người Việt Nam. 

Phù hợp với thiên hướng vê gầm và chích mũi.

Bộ sưu tập: Dyna Pack (04...', 4300000.00, 'src/data/images/products/main_3af5e7f4.jpg', 'ACTIVE', '6f5cd833-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('54c820d7-b90d-42d6-b37b-670abe4a40b1', 'MIZUNO MORELIA SALA ELITE TF - Q1GB251237 - TRẮNG/XANH LÁ', 'MIZUNO MORELIA SALA ELITE TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Với upper da Kangaroo mềm mại, bộ đệm giảm chấn êm ái cùng form giày bè nhiều phù hợp với form chân người Việt Nam, Mizuno Morelia Sala Elite TF sẽ là mẫu giày “chân ái” dành cho nhiều anh em.

Thông số kỹ thuật

Phần upper làm từ da Kangaroo thượng hạng mềm mại và đàn hồi, hỗ trợ tối đa cho người mang khi nhận bóng, đi bóng, sút mu và mang lại cảm giác bóng thật chân. 

Vùng đầu mũi được bọc da lộn nhằm tăng độ bền cho đôi giày, cũng như hỗ trợ cho những pha chích mũi của người mang. 

Lót giày êm ái, chống trượt hiệu quả và có thể tháo rời.

Bộ đệm giữa giảm chấn êm ái giúp giảm chấn thương và tạo sự thoải mái trong suốt trận đấu.

Đế ngoài làm từ chất liệu cao su cao cấp, cho khả năng bám sân theo nhiều hướng khác nhau, hỗ trợ tối đa cho những pha di chuyển đổi hướng liên tục.

Form giày được thiết kế bè nhiều phù hợp với form chân người Việt Nam. 

Phù hợp với thiên hướng vê gầm và chích mũi.

Bộ sưu tập: Frontier Pack...', 2850000.00, 'src/data/images/products/main_19fb4ff7.jpg', 'ACTIVE', '6f5cd833-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('697f03b6-9d64-4f5d-bd75-e4da7b241f9b', 'ADIDAS X CRAZYFAST ELITE TF - IF0663 - ĐỎ CAM', 'ADIDAS X CRAZYFAST ELITE TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Viết nên câu chuyện tốc độ của riêng bạn với mẫu giày đá banh ADIDAS X CRAZYFAST ELITE TF hoàn toàn mới! Sở hữu những cải tiến mới nhất cùng một thiết kế tối giản phục vụ cho lối chơi tốc độ, X CRAZYFAST ELITE TF xứng đáng là sự lựa chọn hàng đầu dành cho những tiền vệ và tiền đạo ưu tiên sự linh hoạt và thanh thoát trong cách chơi của mình!

"Energy Citrus Pack" là bộ sưu tập được adidas ra mắt nhằm chuẩn bị cho giai đoạn nước rút của mùa giải. Sở hữu phối màu "Solar Red/White/Team Solar Yellow" đầy bắt mắt, mẫu giày đá bóng X Crazyfast Elite TF “Energy Citrus Pack” sẽ được những ngôi sao hàng đầu adidas mang trên chân như Lionel Messi, Mohamed Salah, Thomas Muller, Karim Benzema, Julian Alvarez, Son Heung Min, Joao Felix, Takefusa Kubo ….

Thông số kỹ thuật:

ADIDAS X CRAZYFAST ELITE TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5-7 người.

Phân khúc: Elite (chuyên nghiệp)

Phần upper làm từ chất liệu AEROPACIT...', 1260000.00, 'src/data/images/products/main_0efb3584.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('f64d32e9-9dfc-4eec-bb88-f0511e0f9acd', 'NIKE PHANTOM GX 2 PRO TF - FJ2583-400 - XANH BIỂN', 'NIKE PHANTOM GX 2 PRO TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Chơi bóng với sức mạnh và sự chính xác tuyệt đối cùng NIKE PHANTOM GX 2 PRO TF. Với sự trở lại của những công nghệ tiên tiến nhất nhà Nike như sợi dệt Flyknit, công nghệ ACC (All Conditions Control)....PHANTOM GX 2 PRO TF sẽ giúp bạn phát huy trọn vẹn khả năng chơi bóng của bản thân trên sân cỏ! 

“Mad Ambition Pack” là bộ sưu tập giày đá bóng chính thức đầu tiên được Nike trình làng nhằm chuẩn bị cho mùa giải 24/25 sắp tới đây. Sở hữu phối màu "Blue Fury/White" đầy tinh tế, mẫu giày đá bóng Nike Phantom GX 2 "Mad Ambition Pack" sẽ được những ngôi sao hàng đầu nhà Swoosh mang trên chân như Kevin De Bruyne, Erling Haaland, Phil Foden, Rodri, Lautaro Martinez, Kobbie Mainoo, Eduardo Camavinga…

Thông số kỹ thuật

NIKE PHANTOM GX 2 PRO TF là mẫu giày đá banh đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc: Pro (cao cấp).

Phần upper được làm từ chất liệu sợi dệt Flyknit siêu mỏng và nhẹ, nhưng vẫn giữ được độ bền và đàn hồi...', 1750000.00, 'src/data/images/products/main_1d55e29e.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('58f3b802-90a1-491d-b10f-ae23746a5a35', 'NIKE PHANTOM GX 2 ACADEMY TF - FJ2577-002 - ĐEN', 'PHANTOM GX 2 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Chơi bóng với sức mạnh và sự chính xác tuyệt đối cùng NIKE PHANTOM GX 2 ACADEMY TF. Được thiết kế cho các ngôi sao hàng đầu ở vị trí tấn công như Erling Haaland, Rodrygo, Phil Foden….PHANTOM GX 2 ACADEMY TF với những cải tiến đặc biệt sẽ giúp bạn phát huy toàn bộ khả năng tốt nhất của bản thân trên sân cỏ!

Mẫu giày đá bóng Nike Phantom GX 2 Academy TF "Shadow Pack" mang đến một vẻ đẹp huyền bí và sang trọng trong phối màu "Black/Black/Deep Jungle". Sắc đen chủ đạo kết hợp hài hòa cùng điểm nhấn xanh ngọc lam trên logo Swoosh chắc chắn sẽ chinh phục những tín đồ đam mê sự tối giản.

Là dòng giày đá bóng được định hướng cho lối chơi "Kiểm soát" của hãng thể thao nước Mỹ, Nike Phantom đang được những ngôi sao hàng đầu nhà Swoosh mang trên chân như Kevin De Bruyne, Erling Haaland, Phil Foden, Rodri, Lautaro Martinez, Kobbie Mainoo, Eduardo Camavinga…

Thông số kỹ thuật

NIKE PHANTOM GX 2 ACADEMY TF là mẫu giày đá banh đế TF dành c...', 1260000.00, 'src/data/images/products/main_159100a2.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('9cf588f6-1445-4dfe-93d0-25a406c14735', 'NIKE ZOOM MERCURIAL VAPOR 16 PRO TF - FQ8687-301 - XÁM XANH/HỒNG', 'NIKE MERCURIAL VAPOR 16 PRO TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Chinh phục những giới hạn tốc độ mới cùng mẫu giày đá bóng Nike Mercurial Vapor 16 Pro TF phối màu “Prism”!

Sau chu kỳ 2 năm, tháng 7/2024, Nike đã chính thức trình làng thế hệ mới nhất của silo Air Zoom Mercurial. Nhẹ hơn - bền hơn - bùng nổ hơn, Mercurial Vapor 16 Pro TF sẽ là đôi giày bóng đá hoàn hảo dành cho những tín đồ đam mê tốc độ.

Mẫu giày đá bóng Nike Air Zoom Mercurial Vapor 16 và Superfly 10 “Nike Prism Pack” sẽ được những ngôi sao hàng đầu nhà Swoosh mang trên chân như Cristiano Ronaldo, Kylian Mbappé, Vinicius Jr., Federico Valverde, Rodrygo, Cole Palmer, Bruno Fernandes, Luka Modric….

Thông số kỹ thuật

MERCURIAL VAPOR 16 PRO TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5 đến 7 người. 

Phân khúc: Pro (Chuyên nghiệp).

Form giày phù hợp cho chân thon đến bè vừa. 

Phần upper được làm hoàn toàn từ chất liệu sợi dệt Flyknit siêu nhẹ và mỏng với khả năng thích ứng tốt theo bàn chân người mang ...', 2790000.00, 'src/data/images/products/main_0a770d13.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('9ae8d989-3c2d-46ef-91f7-a171f4576c3f', 'ADIDAS COPA GLORO 2 TF - IH7286 - XANH/TRẮNG', 'ADIDAS COPA GLORO 2 TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Làm chủ trận đấu cùng mẫu giày đá bóng ADIDAS COPA GLORO 2 TF với phối màu "Advancement Pack".

Dòng giày bóng đá adidas Copa Gloro đã chính thức quay trở lại với một diện mạo mới. Được nâng cấp với thiết kế tối giản hơn cùng các chi tiết kế thừa từ những đôi giày đá bóng cổ điển của adidas, Copa Gloro II TF sẽ là sự lựa chọn hoàn hảo dành cho những tín đồ theo đuổi sự hoài cổ!

Thông số kỹ thuật

ADIDAS COPA GLORO 2 TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5 đến 7 người.

Form giày phù hợp cho chân bè ít đến bè nhiều.  

Phần upper được làm từ da bò mềm mại nhưng không kém phần bền bỉ sẽ mang đến cảm giác chạm bóng êm ái cho người chơi. Trên bề mặt upper, hãng đã trang bị thêm những đường khâu mắt lưới đan xen giúp giữ nguyên form dáng cho upper sau thời gian dài sử dụng. 

Hai bên thân giày làm từ da tổng hợp vừa giúp giảm thiểu trọng lượng vừa tăng độ bền cho giày.

Lưỡi gà gập rời độc lạ gợi nhớ đến những mẫu...', 1750000.00, 'src/data/images/products/main_8c7de6f1.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('a24e90c4-3c12-4079-a083-7b450876e022', 'ADIDAS F50 PRO TF - JH7665 - TÍM/TRẮNG/VÀNG', 'ADIDAS F50 PRO TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO - PHỐI MÀU TÍM/TRẮNG/VÀNG | RADIANT BLAZE PACK (07/2025)

Đánh dấu sự trở lại đầy mạnh mẽ của dòng giày tốc độ lừng danh, adidas F50 Pro TF phiên bản Radiant Blaze Pack mang đến phối màu Tím/Trắng/Vàng cực kỳ bắt mắt, lấy cảm hứng từ năng lượng mặt trời bùng cháy. Mẫu giày được thiết kế dành riêng cho sân cỏ nhân tạo 5-7 người, tối ưu cho các cầu thủ thiên về tốc độ, kỹ thuật và khả năng bứt phá.

Mã sản phẩm: JH7665 – một trong những phiên bản nổi bật nhất của mùa giải 2025/26, được các ngôi sao hàng đầu như Messi, Salah, Son Heung Min sử dụng trong giai đoạn đầu mùa.

Tốc độ trở lại – Sẵn sàng bùng nổ

Sau màn tái xuất ấn tượng vào năm 2024, adidas F50 tiếp tục khẳng định vị thế của một trong những dòng giày tốc độ hàng đầu thế giới. Phiên bản mới F50 Pro TF Radiant Blaze không chỉ nhẹ, linh hoạt mà còn mang ngôn ngữ thiết kế táo bạo, thể hiện tinh thần thi đấu bùng cháy đúng như tên gọi bộ sưu tập.

Phối màu Tím/Trắng/Vàng đại diện...', 1950000.00, 'src/data/images/products/main_060e244c.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('dd598489-bcba-48db-9d98-94e0e2a69c05', 'ADIDAS PREDATOR 25 LEAGUE LƯỠI GÀ LẬT TF - JQ1073 - ĐEN/VÀNG CHANH', 'ADIDAS PREDATOR 25 LEAGUE L TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO CHÍNH HÃNG

Hãy sẵn sàng ra sân và ghi bàn cùng mẫu giày bóng đá ADIDAS PREDATOR 25 LEAGUE L TF! Được cải tiến để tối ưu hóa khả năng tấn công của người chơi, ADIDAS PREDATOR 25 LEAGUE L TF với những công nghệ tiên tiến nhất của nhà Ba Sọc sẽ mang đến cho bạn sức mạnh bứt phá và độ chính xác tuyệt đối trong từng pha bóng.

Ra mắt vào tháng 07/2025, Electric Stealth Pack là bộ sưu tập mở màn mùa giải mới của adidas, lấy cảm hứng từ sức nóng và ánh sáng rực rỡ của mặt trời. Với gam màu chủ đạo thiên về ánh kim và sắc vàng, phối màu Đen/Bạc/Vàng trên predator 25 league tạo cảm giác sang trọng, sắc sảo và đậm chất thi đấu chuyên nghiệp.

Thông số kỹ thuật: 

ADIDAS PREDATOR LEAGUE L TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc: League (tầm trung).

Form giày phù hợp cho chân thon đến bè vừa.

Phần upper được làm từ chất liệu da nhân tạo Hybridfeel mềm mỏng và đàn hồi, giúp mang lại cảm giác chạ...', 1750000.00, 'src/data/images/products/main_dafb8707.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('6948b4a5-f73e-42c3-b70e-271e4a3583a7', 'NIKE ZOOM MERCURIAL SUPERFLY 10 ACADEMY KM TF - FQ8333-800 - VÀNG/CAM', 'NIKE ZOOM MERCURIAL SUPERFLY 10 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Chinh phục những giới hạn tốc độ mới cùng mẫu giày đá bóng Nike Mercurial Superfly 10 Academy TF phối màu 

Sau chu kỳ 2 năm, tháng 7/2024, Nike đã chính thức trình làng thế hệ mới nhất của silo Air Zoom Mercurial. Nhẹ hơn - bền hơn - bùng nổ hơn, Mercurial Superfly 10 Academy TF sẽ là đôi giày bóng đá hoàn hảo dành cho những tín đồ đam mê tốc độ.

Thông số kỹ thuật

MERCURIAL SUPERFLY 10 ACADEMY TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5 đến 7 người. 

Phân khúc: Academy (tầm trung).

Form giày phù hợp cho chân thon đến bè vừa. 

Phần upper được làm từ da tổng hợp NikeSkin mềm mỏng và đàn hồi sẽ mang lại cảm giác bóng thật chân cho bạn. Bề mặt upper được phủ một lớp PU, không chỉ giúp tăng cường độ bền cho đôi giày mà còn làm tăng ma sát khi tiếp xúc bóng, giúp bạn kiểm soát bóng tốt hơn khi rê dắt ở tốc độ cao.

Cổ giày Dynamic Fit ôm trọn cổ chân, mang lại sự chắc chắn và ngăn các hạt cao s...', 2190000.00, 'src/data/images/products/main_d9034288.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('4465e169-ceec-4290-9016-66db0818af79', 'NIKE ZOOM MERCURIAL VAPOR 16 PRO TF NU2 - IB2474-600 - HỒNG/ĐEN/CAM', 'NIKE MERCURIAL VAPOR 16 PRO TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Giày đá bóng Nike Mercurial Vapor 16 Pro TF Nu2 là phiên bản giày đá banh đế cỏ nhân tạo TF cao cấp được Nike trình làng vào tháng 09/2025. Đây là thế hệ tiếp theo của dòng Air Zoom Mercurial, được nâng cấp toàn diện về trọng lượng, độ ôm và độ bám sân – hướng đến những người chơi tốc độ và kỹ thuật thi đấu trên mặt sân cỏ nhân tạo 5 đến 7 người.

Điểm nổi bật của Vapor 16 Pro TF

Upper Flyknit siêu nhẹ & ôm chân
Phần thân giày được làm hoàn toàn từ sợi dệt Flyknit mỏng nhẹ – lần đầu tiên xuất hiện trên dòng Mercurial TF – giúp ôm sát và thích ứng với bàn chân, mang lại cảm giác bóng chính xác và tự nhiên.

Công nghệ ACC hỗ trợ mọi điều kiện thời tiết
Lớp phủ ACC (All Conditions Control) giúp kiểm soát bóng ổn định, kể cả khi sân trơn ướt hay khô ráo.

Đệm Air Zoom êm ái, hỗ trợ bứt tốc
Bộ đệm giữ nguyên công nghệ Air Zoom như Vapor 14 & 15, giúp giảm áp lực từ mặt sân và tạo cảm giác chạy mượt, nhẹ nhàng khi thi đấu ở c...', 2790000.00, 'src/data/images/products/main_7bb205ee.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('087f821f-c56c-45e1-a38c-ab719a0a1cfb', 'NIKE PHANTOM GX 2 ACADEMY TF - FJ2577-100 - TRẮNG/ĐEN', 'NIKE PHANTOM GX 2 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Chơi bóng với sức mạnh và sự chính xác tuyệt đối cùng NIKE PHANTOM GX 2 ACADEMY TF. Được thiết kế cho các ngôi sao hàng đầu ở vị trí tấn công như Erling Haaland, Rodrygo, Phil Foden….PHANTOM GX 2 ACADEMY TF với những cải tiến đặc biệt sẽ giúp bạn phát huy toàn bộ khả năng tốt nhất của bản thân trên sân cỏ! 

Thông số kỹ thuật

NIKE PHANTOM GX 2 ACADEMY TF là mẫu giày đá banh đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc : Academy (tầm trung)

Phần upper làm từ da tổng hợp mềm mại được mô phỏng theo chất liệu sợi dệt sẽ mang đến cảm giác thật chân nhất trong từng pha chạm bóng. Trên bề mặt Phantom GX Academy TF được trang bị thêm lớp phủ NikeSkin giúp tăng độ bám bóng, từ đó người chơi có thể kiểm soát và rê bóng tốt hơn ở bất kỳ điều kiện thời tiết. 

Công nghệ Strike Zone với các vân vòng tròn được in dập nổi ở những vùng tiếp xúc bóng chủ yếu giúp tăng thêm độ xoáy cho những cú phất bóng và cứa lòng. 

Hệ thống d...', 1260000.00, 'src/data/images/products/main_14a67267.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('4542e066-c977-4779-9153-2ced5b48da43', 'ADIDAS PREDATOR EDGE.3 TF - GV8536 - CAM/ĐỎ', 'ADIDAS PREDATOR EDGE.3 TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Predator Edge là thế hệ thứ 19 của một trong những dòng giày mang tính biểu tượng nhất mọi thời đại. Predator Edge đã từ bỏ thiết kế có phần gai góc và hung dữ của 2 thế hệ trước (Mutator và Freak) với lớp phủ 3D Demonskin trên bề mặt upper, để thay vào đó là một thiết kế cổ điển hơn, chịu ảnh hưởng lớn từ Predator LZ (Lethal Zones).

Mặc dù đã xuất hiện trên chân các cầu thủ trong nhiều tuần vừa qua, nhưng giờ đây adidas “Game Data Pack” đã chính thức được ra mắt. Đây là bộ sưu tập giày đá banh bao gồm 3 silo Predator Edge, Copa Sense và X Speedportal hoàn toàn mới trong những sắc màu rực rỡ.

Thông số kỹ thuật:

ADIDAS PREDATOR EDGE.3 TF là mẫu giày đá banh đế TF dành cho sân cỏ nhân tạo từ 5-7 người.

Phân khúc: .3 (tầm trung).

Phần upper được làm từ da tổng hợp kết hợp với công nghệ Control Zone - những đường vân nổi được đặt một cách hợp lý thành bốn vùng kiểm soát trên mu bàn chân và khu vực toe box (phần trước của upp...', 1260000.00, 'src/data/images/products/main_222bdc1c.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('8cd318c2-4189-466c-9df6-b1d6f2c43311', 'ADIDAS F50 LEAGUE MESSI TF - IH0919 - XÁM BẠC/NEON', 'ADIDAS F50 LEAGUE TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Sau 9 năm vắng bóng, huyền thoại adidas F50 đã chính thức trở lại - nhẹ hơn, nhanh hơn và lợi hại hơn! Được thiết kế để khai phá trọn vẹn tiềm năng tốc độ của người chơi, mẫu giày đá bóng sân cỏ nhân tạo adidas F50 Messi League TF sẽ là sự lựa chọn hoàn hảo dành cho những tiền vệ và tiền đạo ưu tiên sự nhanh nhẹn và thanh thoát trong lối chơi của mình.  

“La Vida Rapida" (Cuộc sống vội vã) là phiên bản F50 signature thứ 4 mà adidas vừa dành riêng cho Lionel Messi. Không chỉ riêng ''La Pulga'', mẫu giày đá bóng F50 Messi "La Vida Rapida" sẽ được anh cùng 10 tài năng trẻ sáng giá do chính anh lựa chọn mang ra sân trong các trận đấu tới đây.  

Thông số kỹ thuật

ADIDAS F50 MESSI LEAGUE TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.  

Phân khúc: League (tầm trung).

Phần upper được làm từ chất liệu da tổng hợp Hybridtouch được mô phỏng theo da tự nhiên sẽ mang đến cảm giác chạm bóng êm ái cho người chơi. Đặc biệt, u...', 1650000.00, 'src/data/images/products/main_73966cc4.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('cab35650-fe62-4b04-8f39-11ed5a641566', 'NIKE ZOOM MERCURIAL VAPOR 15 PRO TF - DJ5605-600 - TRẮNG/ĐỎ', 'NIKE ZOOM MERCURIAL VAPOR 15 PRO TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Tháng 6/2022, Nike chính thức trình làng thế hệ tiếp theo của dòng giày Mercurial mang tên Air Zoom Mercurial. Cải tiến lớn nhất trên thế hệ này nằm ở bộ đệm Zoom Air được thiết kế độc quyền cho bóng đá. Bên cạnh đó, mọi chi tiết trên đôi giày lần này đều được thiết kế nhằm tối ưu hoá lối chơi tốc độ. 

Thông số kỹ thuật:

Mẫu giày đá bóng ZOOM MERCURIAL VAPOR 15 PRO TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.

Phân khúc: Pro (Chuyên nghiệp).

Upper làm từ da tổng hợp cao cấp và sợi dệt. Trên bề mặt upper là các vân Hyperscreen 3D được thiết kế để mang lại cảm giác thật chân khi chạm và rê bóng ở tốc độ cao. 

Ở thế hệ 15 này, hãng đã phủ thêm lớp NikeSkin trên bề mặt upper làm tăng độ bám bóng, từ đó có thể kiểm soát bóng và rê bóng tốt hơn. Cấu trúc Speed Cage bên dưới bề mặt upper được làm từ chất liệu mỏng nhưng cực kỳ chắc chắn sẽ mang đến sự ôm chân vừa khít, đồng thời hạn chế sự xê dịch c...', 1260000.00, 'src/data/images/products/main_234a513e.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('9daf0b2d-5ec1-429f-9f5f-55356c05630f', 'ADIDAS PREDATOR 24 LEAGUE L TF - ID0910 - XANH/TRẮNG', 'ADIDAS PREDATOR 24 LEAGUE L TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Ghi bàn từ mọi hướng cùng mẫu giày bóng đá ADIDAS PREDATOR 24 LEAGUE L TF. Được thiết kế nhằm phục vụ cho lối chơi ghi bàn, ADIDAS PREDATOR 24 LEAGUE L TF với những công nghệ tiên tiến nhất của nhà Ba Sọc sẽ đem đến cho bạn sức mạnh và sự chính xác trong từng đường bóng.

“Advancement Pack” là bộ sưu tập giày bóng đá chính thức của adidas tại EURO và Copa America 2024. Sở hữu phối màu "Lucid Blue/Ftwr White/Solar Red" đầy ấn tượng với nguồn cảm hứng từ phiên bản Predator Mania “Japan Blue” tại World Cup 2002, mẫu giày đá bóng Predator 24 “Advancement Pack” sẽ được những ngôi sao hàng đầu adidas mang trên chân như Jude Bellingham, Trent Alexander-Arnold, Pedri, Ilkay Gundogan,...mang trên chân tại 2 giải vô địch châu lục quan trọng nhất mùa hè này!

Thông số kỹ thuật

ADIDAS PREDATOR 24 LEAGUE L TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.

Phân khúc: League (tầm trung).

Phần upper làm từ chất liệu da...', 1260000.00, 'src/data/images/products/main_8f953c53.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('1bc42fc9-e88b-4540-8597-afe8acb14348', 'JOMA TOP FLEX TF 2416 - TRẮNG/VÀNG NEON', 'JOMA TOP FLEX TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Nâng cấp trải nghiệm chơi bóng của bạn thông qua mẫu giày đá banh JOMA TOP FLEX TF. JOMA TOP FLEX TF được thiết kế riêng cho bề mặt sân cỏ nhân tạo nhưng không kém phần ổn định và linh hoạt so với phiên bản đế IC cho sân futsal, từ đó giúp cho người mang có thể tự tin trình diễn lối chơi tốt nhất của bản thân.  

Thông số kỹ thuật

JOMA TOP FLEX TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.

Phần upper được làm từ da nhân tạo mềm mại nhưng không kém phần bền bỉ, giúp mang đến cảm giác bóng thật chân cho người mang. Vùng đầu mũi còn được bọc da lộn giúp tăng độ bền cho giày. Bên cạnh đó, khu vực đầu mũi này còn được trang bị thêm khung bọc nhựa hỗ trợ cho những pha ra chân bằng đầu mũi giày trở nên uy lực hơn. 

Trên phần thân giày được trang bị các lỗ thoát khí theo công nghệ VTS giúp cho đôi giày trở nên thoáng khí hơn, đảm bảo sự thoải mái trong suốt quá trình thi đấu.

Lưỡi gà rời làm từ chất liệu vải lưới với lớ...', 1950000.00, 'src/data/images/products/main_b5a7ab1e.jpg', 'ACTIVE', '6f5cd968-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('b4ca7611-807b-4723-9a85-e2ad2f18c55a', 'ZOCKER INSPIRE PRO 2 TF SNS 009 - ĐEN/VÀNG', 'Zocker Inspire Pro Gen 2 – Đen | Giày đá banh TF sân cỏ nhân tạo

Nếu bạn thích sự lịch lãm, đơn giản và hiệu quả, thì đôi giày màu đen này chính là “người đồng đội” bạn cần trên sân cỏ nhân tạo.

Zocker Inspire Pro Gen 2 bản màu đen không chỉ dễ phối đồ mà còn sở hữu những nâng cấp đáng giá cho người chơi phong trào: bám sân tốt – ôm chân vừa – upper mềm dễ đá, phù hợp cả đá vui lẫn thi đấu nghiêm túc.

 Điểm nổi bật của phiên bản màu đen

Form giày slimfit nhẹ, giúp ôm chân tốt nhưng không quá bó – kiểm soát bóng mượt mà hơn.

Upper da PU mềm mại, dễ làm quen, tạo cảm giác thật chân khi xử lý bóng.

Đế TF đinh cao su dẻo, thiết kế bám sân ổn định, giúp xoay trở và tăng tốc linh hoạt.

Tông màu đen huyền bí, dễ phối với mọi outfit sân bóng, che vết bẩn tốt – mang càng lâu càng đẹp.

Thông tin chi tiết:

Loại sân: Cỏ nhân tạo 5–7 người

Đinh giày: TF (cao su đúc, đinh tròn)

Chất liệu upper: PU microfiber – bền, ít thấm nước, dễ vệ sinh

Form giày: Dáng thon gọn, phù hợp cả chân bè ...', 665000.00, 'src/data/images/products/main_22145e44.jpg', 'ACTIVE', '6f5cd9b6-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('428c5aec-f7fc-45e6-af75-e69441b065cd', 'ADIDAS PREDATOR ACCURACY.1 TF - GW4633 - HỒNG/ĐEN', 'ADIDAS PREDATOR ACCURACY.1 TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Kiểm soát + chính xác = tự tin. Đó chính là công thức để tạo nên mẫu giày đá banh ADIDAS PREDATOR ACCURACY.1 TF hoàn toàn mới lần này! Sở hữu những công nghệ tiên tiến nhất hiện nay của nhà Ba Sọc, mẫu giày PREDATOR ACCURACY.1 TF sẽ giúp bạn tự tin làm chủ cuộc chơi, kiểm soát trận đấu!

Thông số kỹ thuật

ADIDAS PREDATOR ACCURACY.1 TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc: .1 (chuyên nghiệp)

Phần upper làm từ chất liệu da tổng hợp HybridTouch mềm mại. Bằng cách sử dụng loại chất liệu này, adidas đã làm giảm đáng kể trọng lượng của Predator Accuracy.1 TF so với người tiền nhiệm. 

Các vân cao su High Definition Grip được phủ ở khu vực má trong làm tăng độ ma sát với bóng, từ đó giúp người chơi có thể dễ dàng thực hiện các đường chuyền hay cú sút với độ chính xác cao. 

Phần cổ giày với cấu trúc Face Fit - đây là loại cổ giày hai mảnh làm từ chất liệu Primeknit, được thiết kế nhằm tạo r...', 1260000.00, 'src/data/images/products/main_13eac9a9.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('bc0f970b-ecbc-4816-a476-f205ed319af1', 'PUMA ULTRA MATCH TT - 107757-01 - HỒNG/ĐEN', 'PUMA ULTRA MATCH TT - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Nhanh hơn - bùng nổ hơn - hãy nâng cấp lối chơi tốc độ của bạn với phiên bản ULTRA MATCH TT 2023 mới.

PUMA ULTRA MATCH TT đã trở lại với những cải tiến đáng kể so với phiên bản trước, nhằm mang lại trải nghiệm tự tin và bùng nổ hơn cho người mang trong suốt quá trình chơi bóng. 

Thông số kỹ thuật:

PUMA ULTRA MATCH TT là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5-7 người. 

Phân khúc: Match (tầm trung).

Phần upper làm từ da tổng hợp pha sợi dệt siêu nhẹ mang đến cảm giác bóng thật chân nhất cho người mang.

Trên bề mặt upper được phủ lớp GRIP CONTROL làm tăng độ bám bóng và nâng cao khả năng kiểm soát bóng, giúp người chơi có thể chơi bóng ở mọi điều kiện thời tiết.

Cổ giày và lưỡi gà liền được làm từ chất liệu sợi dệt với độ co giãn cao, tạo nên cảm giác ôm chân chắc chắn cho khu vực cổ chân. 

Đệm gót giày làm từ vải nhung, giúp ôm phần gót chân vừa vặn và thoải mái.  

Bộ đệm EVA tạo cảm giác êm ái trong từng pha d...', 1290000.00, 'src/data/images/products/main_b12e0d69.jpg', 'ACTIVE', '6f5cd8bb-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('ae19a2e1-1c76-4cc3-8883-5462748f347a', 'ADIDAS X CRAZYFAST LEAGUE TF - IF0698 - VÀNG NEON/ĐEN', 'ADIDAS X CRAZYFAST LEAGUE TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Viết nên câu chuyện tốc độ của riêng bạn với mẫu giày đá banh ADIDAS X CRAZYFAST LEAGUE TF “Solar Energy Pack” hoàn toàn mới! Sở hữu những cải tiến mới nhất cùng một thiết kế tối giản phục vụ cho lối chơi tốc độ, X CRAZYFAST LEAGUE TF xứng đáng là sự lựa chọn hàng đầu dành cho những tiền vệ và tiền đạo ưu tiên sự linh hoạt và thanh thoát trong cách chơi của mình!

Mẫu giày đá bóng X CRAZYFAST thuộc bộ sưu tập “Solar Energy” với phối màu “Team Solar Yellow/Core Black/White” bắt mắt sẽ được những ngôi sao hàng đầu adidas mang trên chân như Lionel Messi, Mohamed Salah, Thomas Muller, Karim Benzema, Julian Alvarez, Son Heung Min, Joao Felix, Takefusa Kubo …. 

Thông số kỹ thuật:

ADIDAS X CRAZYFAST LEAGUE TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5-7 người.

Phân khúc: League (tầm trung).

Phần upper làm từ chất liệu da tổng hợp pha sợi dệt mềm mại, mang lại cảm giác bóng tốt nhất cho người mang. Trên bề mặt upp...', 1260000.00, 'src/data/images/products/main_31aa37f2.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('73d9d6b1-f620-4dcf-b441-37640d310191', 'MIZUNO MORELIA SALA JAPAN TF - Q1GB250209 - TRẮNG/ĐEN', 'MIZUNO MORELIA SALA JAPAN TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO - PHỐI MÀU TRẮNG/ĐEN

Chuẩn mực “Made in Japan” - Đỉnh cao thủ công từ Mizuno

Với dòng sản phẩm “Made in Japan”, bạn sẽ sở hữu một đôi giày Mizuno đạt chất lượng cao nhất thế giới.
Mỗi đôi giày đều được làm thủ công bằng tay tại nhà máy Mizuno ở Nhật Bản, nơi quy trình sản xuất được kiểm soát nghiêm ngặt ở từng công đoạn. Mizuno chỉ sử dụng vật liệu cao cấp nhất, và từng chi tiết nhỏ đều được kiểm tra tỉ mỉ để đảm bảo vượt qua vòng đánh giá chất lượng cuối cùng. Sự cầu toàn và tinh xảo này chính là lý do khiến dòng “Made in Japan” của Mizuno trở thành biểu tượng về độ hoàn thiện và độ bền vượt trội trong giới cầu thủ chuyên nghiệp.

Upper da Kangaroo cao cấp - Cảm giác như đi chân trần

Sở hữu phần upper làm từ da Kangaroo Scotchguard mềm, mịn, mỏng nhưng vô cùng chắc chắn.

Mang lại cảm giác linh hoạt và tự nhiên, gần như “chân trần”.

Các đường khâu ngang - dọc ở mu bàn chân cho phép lớp da di chuyển linh hoạt theo mọi h...', 4300000.00, 'src/data/images/products/main_80ef71f1.jpg', 'ACTIVE', '6f5cd833-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('7c34c988-e9f7-4671-9384-44a191050e25', 'NIKE PHANTOM GX ACADEMY TF - DD9477-705 - TRẮNG/XANH LÁ MẠ', 'NIKE PHANTOM GX ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Nâng tầm kỹ năng của bạn cùng mẫu giày đá banh NIKE PHANTOM GX ACADEMY TF hoàn toàn mới! Là bản nâng cấp hoàn toàn mới của Phantom GT 2, Phantom GX sẽ là đôi giày hoàn hảo dành cho những ai tìm kiếm sự chính xác tuyệt đối trên sân. 

Thông số kỹ thuật

NIKE PHANTOM GX ACADEMY TF là mẫu giày đá banh đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc : Academy (tầm trung)

Phần upper làm từ da tổng hợp mềm mại được mô phỏng theo chất liệu sợi dệt. Trên bề mặt Phantom GX Academy TF được trang bị thêm lớp phủ NikeSkin giúp tăng độ bám bóng, từ đó có thể kiểm soát và rê bóng tốt hơn ở bất kỳ điều kiện thời tiết. 

Hệ thống dây giày được thiết kế lệch về phía má ngoài nhằm mở rộng diện tích sút và chuyền bóng.

Lưỡi gà rời được thiết kế cố định ở phần nửa trên sẽ không gây ra tình trạng lệch lưỡi gà.

Lớp đệm gót giày được làm từ chất liệu da tổng hợp mềm hơn trước giúp hỗ trợ tốt hơn cho quá trình break-in, hạn chế tình trạng ...', 1260000.00, 'src/data/images/products/main_6869e792.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('7c48c359-2006-4b57-8220-9afd28f471fe', 'ADIDAS F50 LEAGUE TF - IF1335 - ĐỎ/CAM', 'ADIDAS F50 LEAGUE TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Sau 9 năm vắng bóng, huyền thoại adidas F50 đã chính thức trở lại - nhẹ hơn, nhanh hơn và lợi hại hơn! Được thiết kế để khai phá trọn vẹn tiềm năng tốc độ của người chơi, mẫu giày đá bóng sân cỏ nhân tạo adidas F50 League TF sẽ là sự lựa chọn hoàn hảo dành cho những tiền vệ và tiền đạo ưu tiên sự nhanh nhẹn và thanh thoát trong lối chơi của mình.

VớI cảm hứng thiết kế từ những trận cầu vào buổi chiều tà rực rỡ sắc màu trên khắp thế giới, adidas đã chính thức ra mắt “Vivid Horizon Pack”. Sở hữu phối màu "Turbo/Aurora Black/Platinum Met" đầy nổi bật, mẫu giày đá bóng adidas F50 hứa hẹn sẽ cùng các ngôi sao hàng đầu của Three Stripes như Mohamed Salah, Florian Wirtz, Julian Alvarez, Lamine Yamal, Son Heung-Min, Gabriel Magalhães,... khuấy đảo sân cỏ trong thời gian tới.

Thông số kỹ thuật

ADIDAS F50 LEAGUE TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.  

Phân khúc: League (tầm trung).

Phần upper được làm từ chất...', 1750000.00, 'src/data/images/products/main_11f08999.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('064d0126-cdd3-4499-8cbe-8307a1a5395c', 'NIKE ZOOM MERCURIAL VAPOR 15 ACADEMY MDS TF - FD1168-600 - ĐỎ/CAM', 'NIKE MERCURIAL VAPOR 15 ACADEMY MDS TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Tháng 6/2022, Nike chính thức trình làng thế hệ tiếp theo của dòng giày Mercurial mang tên Air Zoom Mercurial. Cải tiến lớn nhất trên thế hệ này nằm ở bộ đệm Zoom Air được thiết kế độc quyền cho bóng đá. Bên cạnh đó, mọi chi tiết trên đôi giày lần này đều được thiết kế nhằm tối ưu hoá lối chơi tốc độ. 

Thông số kỹ thuật
Mẫu giày đá bóng MERCURIAL ZOOM VAPOR 15 ACADEMY MDS TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.

Phân khúc: Academy (Tầm trung).

Upper làm từ da tổng hợp mềm mại giúp tăng cảm giác bóng. Ở thế hệ 15 này, hãng đã phủ thêm lớp NikeSkin trên bề mặt upper làm tăng độ bám bóng, từ đó có thể kiểm soát bóng và rê bóng tốt hơn. 

Cấu trúc Speed Cage bên dưới bề mặt upper được làm từ chất liệu mỏng nhưng cực kỳ chắc chắn sẽ mang đến sự ôm chân vừa khít, đồng thời hạn chế sự xê dịch chân trong giày khi thi đấu ở cường độ cao.

Lưỡi gà được thiết kế cố định ở phần nửa trên sẽ không gâ...', 1260000.00, 'src/data/images/products/main_875e3064.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('947ff0dd-d4c9-4f39-b6ed-9242f6a24b15', 'PUMA FUTURE 8 MATCH CREATIVITY TT - 108433-01 - CAM/TÍM', 'PUMA FUTURE 8 MATCH CREATIVITY TT - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Vượt qua mọi giới hạn trên sân cỏ cùng PUMA FUTURE 8 MATCH CREATIVITY TT! Được thiết kế với những công nghệ hàng đầu từ nhà Báo Đức, Future 8 Match TT sẽ giúp bạn thỏa sức sáng tạo mỗi khi ra sân.

Ra sân, cảm nhận và tạo sự khác biệt - đó chính là những gì Future 8 mới nhất sẽ mang lại cho bạn!

Thông số kỹ thuật:

PUMA FUTURE 8 MATCH TT là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5 đến 7 người.

Phân khúc: Match (tầm trung). 

Form giày phù hợp cho chân từ bè ít đến bè nhiều.

Phần upper được làm từ chất liệu vải mesh mềm, mỏng và nhẹ giúp mang lại cảm giác bóng thật chân nhất cho người chơi. 

Trên bề mặt upper là sự kết hợp giữa lớp phủ GRIPCONTROL và các đường vân nổi tăng độ ma sát với bóng, từ đó giúp người chơi có thể dễ dàng kiểm soát bóng trong những pha rê dắt ở tốc độ cao. 

Chính giữa thân giày là dải băng hình chữ V được mô phỏng theo công nghệ PWRTAPE trên phân khúc Pro. 

Cổ giày và lưỡi gà đ...', 1290000.00, 'src/data/images/products/main_dd9548e1.jpg', 'ACTIVE', '6f5cd8bb-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('c9d64c9e-c983-4fa0-928e-66798c12c798', 'MIZUNO MORELIA SALA PRO TF - Q1GB251309 - TRẮNG/ĐEN', 'MIZUNO MORELIA SALA PRO TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO - PHỐI MÀU TRẮNG/ĐEN

Mẫu Morelia Sala Pro TF Q1GB251309 thuộc phân khúc Pro – chuyên nghiệp, được tối ưu cho sân cỏ nhân tạo mini.  Phối màu Super White Pearl × Black (Trắng/Đen) tinh tế, đơn giản và rất “Mizuno” - biểu tượng của sự thuần khiết và hiệu năng thực chiến.

Upper mềm mại - Cảm giác bóng thật chân

Phần upper được làm từ da tổng hợp cao cấp thế hệ mới, mềm và đàn hồi tốt, mang lại cảm giác bóng chân thật đặc trưng của dòng Morelia.

Khu vực mũi giày được gia cố bằng lớp da nhám chống mài mòn, giúp tăng độ bền và hạn chế hở mũi khi chơi trên sân cỏ nhân tạo.

Lưỡi gà rời mềm – mỏng, hỗ trợ người có mu bàn chân cao hoặc bè nhiều dễ dàng xỏ giày và cảm giác thoải mái hơn.

Phần lót gót bằng da lộn mềm, kết hợp khung bọc gót cứng cáp, giúp cố định bàn chân, giảm trượt gót khi đổi hướng hoặc bật nhảy.

Form giày & cảm giác mang

Khác với nhiều dòng giày châu Âu, Mizuno Morelia Sala Pro TF có form rộng rãi, đặc biệt ph...', 4300000.00, 'src/data/images/products/main_0f5390f8.jpg', 'ACTIVE', '6f5cd833-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('8a2c13a2-ddad-48d3-a3c7-8242bf9b583b', 'NIKE PHANTOM LUNA 2 ACADEMY TF - FJ2566-400 - XANH LƠ', 'NIKE PHANTOM LUNA 2 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Chơi bóng với sức mạnh và sự chính xác tuyệt đối cùng NIKE PHANTOM LUNA 2 ACADEMY TF. Được thiết kế cho các ngôi sao hàng đầu ở vị trí tấn công như Kevin De Bruyne, Erling Haaland, Phil Foden….PHANTOM LUNA 2 ACADEMY TF với những cải tiến đặc biệt sẽ giúp bạn phát huy toàn bộ khả năng tốt nhất của bản thân trên sân cỏ!

“Mad Ambition Pack” là bộ sưu tập giày đá bóng chính thức đầu tiên được Nike trình làng nhằm chuẩn bị cho mùa giải 24/25 sắp tới đây. Sở hữu phối màu "Blue Fury/White" đầy tinh tế, mẫu giày đá bóng Nike Phantom GX 2 và Luna 2 "Mad Ambition Pack" sẽ được những ngôi sao hàng đầu nhà Swoosh mang trên chân như Kevin De Bruyne, Erling Haaland, Phil Foden, Rodri, Lautaro Martinez, Kobbie Mainoo, Gavi, Aurélien Tchouaméni, Eduardo Camavinga…

Thông số kỹ thuật

NIKE PHANTOM LUNA 2 ACADEMY TF là mẫu giày đá banh đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc : Academy (tầm trung).

Phần upper làm từ da tổng...', 1260000.00, 'src/data/images/products/main_ac0fb5f7.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('525b11c8-5b0b-420d-acea-0a560a6fc411', 'ZOCKER WINNER ENERGY TF - XANH', 'ZOCKER WINNER ENERGY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Zocker Winner Energy - Cảm hứng đến từ Năng lượng chiến thắng

Giày bóng đá Zocker Winner Energy đỏ là 1 trong 5 phiên bản màu của bộ sưu tập mới, được thương hiệu Zocker giới thiệu tới những người yêu thích bóng đá trong hè này.

Giày bóng đá Zocker Winner Energy xanh biển được thiết kế tuyệt đẹp theo phong cách đơn sắc, cắt họa tiết bắt mắt được tạo thành từ bởi nhiều lát cắt laze mang đến cái nhìn hiện đại. Zocker gửi vào mẫu giày mới dòng "Năng lượng chiến thắng", với mong muốn mang đến cho người chơi sự tự tin, tích cực, tinh thần lạc quan.

Giày sở hữu nhiều cải tiến mới, bên cạnh đó là sự kế thừa những ưu điểm được đúc rút từ những thế hệ trước đó như Space, Inspire và Inspire Pro...

Upper được làm từ da PU cao cấp, cho cảm giác mềm và êm chân ngay từ khi tiếp xúc. Nhờ đó, người chơi không cần phải mất thời gian cho quá trình làm giãn giày - breakin. Ở nửa thân trên giày còn được gia cố các gờ nổi, giúp người chơi kiểm ...', 665000.00, 'src/data/images/products/main_87aee48b.jpg', 'ACTIVE', '6f5cd9b6-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('2bd61f88-05bc-4dad-b7e5-82c30e511263', 'ADIDAS PREDATOR EDGE.1 TF - GW0952 - CAM/ĐỎ', 'ADIDAS PREDATOR EDGE.1 TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Predator Edge là thế hệ thứ 19 của một trong những dòng giày mang tính biểu tượng nhất mọi thời đại. Predator Edge đã từ bỏ thiết kế có phần gai góc và hung dữ của 2 thế hệ trước (Mutator và Freak) với lớp phủ 3D Demonskin trên bề mặt upper, để thay vào đó là một thiết kế cổ điển hơn, chịu ảnh hưởng lớn từ Predator LZ (Lethal Zones).

Tiếp nối xu hướng trình làng những bộ sưu tập với gam màu trắng vào cuối mùa giải, vừa qua, adidas đã cho ra mắt “Diamond Edge" Pack. Đây sẽ là bộ sưu tập bao gồm 3 silo giày đá banh của hãng là X Speedflow, Predator Edge và Copa Sense trong phối màu trắng xanh cực kỳ bắt mắt.

Thông số kỹ thuật:

Dòng sản phẩm dành cho bề mặt sân cỏ nhân tạo (Đế TF).

Phân khúc: .1 (Chuyên nghiệp) phiên bản không dây.

Upper: Primeknit với công nghệ Zone Skin - một cải tiến đột phá nhằm hỗ trợ khả năng kiểm soát, tạo độ xoáy và độ bám bóng. Những gai nhọn trước đây đã được thay thế bởi những đường vân cao su đư...', 1260000.00, 'src/data/images/products/main_9694a9c2.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('6b282303-614a-4a91-9587-90dc852f5f27', 'ZOCKER WINNER ENERGY TF - ĐEN', 'ZOCKER WINNER ENERGY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Zocker Winner Energy - Cảm hứng đến từ Năng lượng chiến thắng

Giày bóng đá Zocker Winner Energy đỏ là 1 trong 5 phiên bản màu của bộ sưu tập mới, được thương hiệu Zocker giới thiệu tới những người yêu thích bóng đá trong hè này.

Giày bóng đá Zocker Winner Energy đen được thiết kế tuyệt đẹp theo phong cách đơn sắc, cắt họa tiết bắt mắt được tạo thành từ bởi nhiều lát cắt laze mang đến cái nhìn hiện đại. Zocker gửi vào mẫu giày mới dòng "Năng lượng chiến thắng", với mong muốn mang đến cho người chơi sự tự tin, tích cực, tinh thần lạc quan.

Giày sở hữu nhiều cải tiến mới, bên cạnh đó là sự kế thừa những ưu điểm được đúc rút từ những thế hệ trước đó như Space, Inspire và Inspire Pro...

Upper được làm từ da PU cao cấp, cho cảm giác mềm và êm chân ngay từ khi tiếp xúc. Nhờ đó, người chơi không cần phải mất thời gian cho quá trình làm giãn giày - breakin. Ở nửa thân trên giày còn được gia cố các gờ nổi, giúp người chơi kiểm soát b...', 665000.00, 'src/data/images/products/main_753e3aa0.jpg', 'ACTIVE', '6f5cd9b6-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('fc4ef04b-fd72-43e3-9c90-04f86a8ee9d5', 'NIKE ZOOM MERCURIAL VAPOR 16 PRO TF - FQ8687-300 - VÀNG CHANH/ ĐEN', 'NIKE ZOOM MERCURIAL VAPOR 16 PRO TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO - PHỐI MÀU VÀNG CHANH/ĐEN | Riếp

Tốc độ và năng lượng “điện áp cao” là tinh thần mà Nike Zoom Mercurial Vapor 16 Pro TF mang đến trong bộ sưu tập Max Voltage Pack. Đôi giày sở hữu phối màu Limelight / Volt / Hyper Crimson - mô phỏng hiệu ứng điện chạy dọc thân giày, tượng trưng cho tốc độ và sức bật mãnh liệt của dòng Mercurial.

Sắc vàng chanh chủ đạo giúp đôi giày nổi bật rực rỡ trên mọi mặt sân, trong khi chi tiết Swoosh đen tuyền và điểm nhấn cam điện áp tạo nên tổng thể vừa hiện đại vừa cực kỳ cuốn hút. Đây cũng là phối màu được Nike chọn để đồng hành cùng các trận Champions League - nơi tốc độ, sự chính xác và bản lĩnh tỏa sáng.

Một phiên bản “điện khí hóa” thực thụ, giúp bạn bứt phá tốc độ và tạo dấu ấn ngay từ cú chạm bóng đầu tiên.

MERCURIAL VAPOR 16 PRO TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5 đến 7 người. 

Phân khúc: Pro (Chuyên nghiệp).

Form giày phù hợp cho chân thon đến bè vừa. 

...', 2050000.00, 'src/data/images/products/main_73ca1793.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('2ad46ecb-e5b7-4025-be99-78e8a888ee2c', 'MIZUNO ALPHA PRO AS - P1GD246427 - XANH/TRẮNG', 'MIZUNO ALPHA PRO AS - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Mizuno Alpha Pro AS là dòng giày bóng đá sân cỏ nhân tạo mới ra mắt của Mizuno cuối năm 2022 với trọng lượng rất nhẹ, chỉ 215g cùng thiết kế độc đáo dành cho các cầu thủ ưa thích lối chơi tốc độ. Đây là mẫu giày được tối ưu phần bề mặt nên dù không được làm từ da thật, Mizuno Alpha Pro AS vẫn có độ mềm mại ấn tượng và cảm giác chân rất tốt. Đặc trưng của dòng giày này đó là cấu trúc Engineered Fit woven giúp bề mặt giày co giãn nhẹ theo chiều ngang mà không bị giãn theo chiều dọc, mang tới sự thoải mái và ôm chân cho dù bạn có bàn chân bè.

Bên cạnh những điểm nâng cấp mới, Mizuno Alpha Pro AS cũng được trang bị những công nghệ cao cấp quen thuộc ở bộ đế như lớp đệm giảm chấn êm ái, giúp người chơi thoải mái trong suốt quá trình thi đấu và dàn đinh dăm dạng chữ L, bám sân hiệu quả và linh hoạt. 

“Mugen Pack” là bộ sưu tập giày bóng đá chính thức của Mizuno tại EURO, Copa America và Olympic 2024. ‘Mugen'' trong tiếng Nhật có nghĩa l...', 2850000.00, 'src/data/images/products/main_9c94d184.jpg', 'ACTIVE', '6f5cd833-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('3bc4d9eb-663c-4d2d-9002-f4e8316eb79e', 'ASICS CALCETTO WD 9 TF - 1113A038-401 - ĐEN/HỒNG', 'ASICS CALCETTO WD 9 TF – GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO – PHỐI MÀU ĐEN/HỒNG (2025)

Asics Calcetto WD 9 TF là phiên bản thuộc dòng Calcetto nổi tiếng với sự thoải mái và ổn định dành cho futsal và sân cỏ nhân tạo. Phối màu Đen/Hồng mang phong cách trẻ trung, cá tính, cùng thiết kế bản rộng (Wide Fit) giúp phù hợp với nhiều dáng bàn chân. Đây là lựa chọn lý tưởng cho người chơi cần giày bền bỉ, dễ chịu và hiệu quả khi thi đấu.

Thông số kỹ thuật

Mã sản phẩm: 1113A038-401

Phối màu: Black/Pink (Đen/Hồng)

Dòng sản phẩm: Asics Calcetto WD 9 TF

Upper: Da tổng hợp kết hợp lưới thoáng khí

Đế: TF (Turf) cao su bám sân cỏ nhân tạo

Form giày: Wide Fit bản rộng, phù hợp bàn chân bè

Đệm: EVA nhẹ, hỗ trợ giảm chấn và êm ái

Đặc điểm nổi bật

Thiết kế bản rộng (Wide Fit) phù hợp người có bàn chân bè, mang thoải mái lâu dài.

Upper da tổng hợp mềm, kết hợp lưới thoáng khí giúp tăng độ bền và thông thoáng.

Đế TF cao su bám sân tốt, hỗ trợ di chuyển linh hoạt trên sân 5-7 người.

Đệm EVA êm, gi...', 1950000.00, 'src/data/images/products/main_c38ac901.jpg', 'ACTIVE', '6f5cd916-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('219d958d-28bf-427d-9585-154b400379e6', 'MIZUNO MORELIA SALA PRO TF - Q1GB251337 - TRẮNG/XANH LÁ', 'MIZUNO MORELIA SALA PRO TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Mizuno Morelia là dòng giày đá bóng đã được ra mắt từ năm 1985. Với thiết kế kinh điển vượt thời gian, Morelia đã thiết lập nên những tiêu chuẩn mới cho một đôi giày bóng đá hoàn hảo.

Trải qua 4 thập kỷ, các thế hệ Morelia mới nhất vẫn trung thành với những giá trị cốt lõi, đồng thời không ngừng cải tiến để đáp ứng nhu cầu ngày càng cao của các cầu thủ hiện đại. Sự kết hợp hài hòa giữa nét truyền thống và hiện đại đã tạo nên một đôi giày tinh tế, phù hợp với nhiều phong cách chơi bóng khác nhau.

Nếu bạn đang tìm kiếm một đôi giày kết hợp giữa cảm giác thật chân, sự thoải mái và độ bền, thì mẫu giày đá bóng Mizuno Morelia Sala Pro TF chính là sự lựa chọn hoàn hảo dành cho bạn.

Thông số kỹ thuật: 

MIZUNO MORELIA SALA PRO TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc: Pro (chuyên nghiệp).

Form giày được thiết kế đặc biệt phù hợp với bàn chân người Việt. Cho dù có form chân bè ít, bè vừa hay b...', 2850000.00, 'src/data/images/products/main_c3cddfb9.jpg', 'ACTIVE', '6f5cd833-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('cabfd12e-05f2-47a8-ad74-bd7d542f0e34', 'NIKE TIEMPO LEGEND 10 ACADEMY TF - DV4342-701 - VÀNG CHANH/ĐEN', 'NIKE TIEMPO LEGEND 10 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO VOLT/BLACK | MAX VOLTAGE PACK

Kiểm soát đỉnh cao – Chạm bóng chuẩn xác trong từng pha xử lý

Là mẫu giày sân cỏ nhân tạo thuộc bộ sưu tập MAX VOLTAGE PACK (10/2025) - series mang sắc thái năng lượng điện áp cao, thể hiện sức sống và sự bùng nổ trong thi đấu, NIKE TIEMPO LEGEND 10 ACADEMY - DV4342-701 nổi bật với tông vàng chanh rực rỡ, mang đến cảm giác hiện đại, mạnh mẽ và đầy tự tin trên sân.

Thế hệ Tiempo mới - Êm hơn, thật hơn, chính xác hơn

Thế hệ Tiempo 10 đánh dấu bước chuyển mình lớn khi Nike lần đầu tiên loại bỏ hoàn toàn da tự nhiên, thay bằng FlyTouch Lite engineered leather - chất liệu tổng hợp cao cấp mềm hơn da thật, ôm chân mà không bị giãn. Bề mặt upper với các micro-dots được bố trí chính xác tại vùng tiếp xúc bóng, giúp tăng độ nhạy khi rê, chuyền và dứt điểm.

Phần đệm lót (Cushioned insole) êm ái mang lại cảm giác thoải mái suốt trận, trong khi đế cao su turf chuyên dụng cung cấp độ bám ổn định, h...', 2790000.00, 'src/data/images/products/main_1d9eeb05.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('2e445537-b17c-448a-9cf6-1a6082c28315', 'NIKE PHANTOM GX 2 PRO TF - FJ2583-003 - XÁM/XANH CHUỐI', 'NIKE PHANTOM GX 2 PRO TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Chơi bóng với sức mạnh và sự chính xác tuyệt đối cùng NIKE PHANTOM GX 2 PRO TF. Với sự trở lại của những công nghệ tiên tiến nhất nhà Nike như sợi dệt Flyknit, công nghệ ACC (All Conditions Control)....PHANTOM GX 2 PRO TF sẽ giúp bạn phát huy trọn vẹn khả năng chơi bóng của bản thân trên sân cỏ! 

Thông số kỹ thuật

NIKE PHANTOM GX 2 PRO TF là mẫu giày đá banh đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc: Pro (cao cấp).

Phần upper được làm từ chất liệu sợi dệt Flyknit siêu mỏng và nhẹ, nhưng vẫn giữ được độ bền và đàn hồi cần thiết để tối ưu cho những pha di chuyển linh hoạt của người chơi trên sân cỏ. Trên bề mặt upper được trang bị công nghệ ACC giúp người chơi có thể kiểm soát bóng tốt nhất trong mọi điều kiện thời tiết.

Công nghệ Strike Zone với các vân vòng tròn được in dập nổi ở những vùng tiếp xúc bóng chủ yếu giúp tăng thêm độ xoáy cho những cú phất bóng và cứa lòng. 

Hệ thống dây giày đặc trưng của silo Ph...', 1260000.00, 'src/data/images/products/main_7e7f1726.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('baf1390a-8e20-4b4a-acc8-1019c7de7d14', 'ADIDAS PREDATOR 24 ELITE TF - IF6373 - XÁM/TÍM', 'ADIDAS PREDATOR 24 ELITE TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Ghi bàn từ mọi hướng cùng mẫu giày bóng đá ADIDAS PREDATOR 24 ELITE TF. Được thiết kế nhằm phục vụ cho lối chơi ghi bàn, ADIDAS PREDATOR 24 ELITE TF với những công nghệ tiên tiến nhất của nhà Ba Sọc sẽ đem đến cho bạn sức mạnh và sự chính xác trong từng đường bóng.

VớI cảm hứng thiết kế từ những trận cầu vào buổi chiều tà rực rỡ sắc màu trên khắp thế giới, adidas đã chính thức ra mắt “Vivid Horizon Pack”. Khoác lên mình diện mạo sang trọng và tinh tế với phối màu "Platinum Met/Aurora Black/Carbon", mẫu giày đá bóng Predator 24 "Vivid Horizon Pack" sẽ là sự lựa chọn hàng đầu của những ngôi sao Jude Bellingham, Trent Alexander-Arnold, Pedri, Ilkay Gundogan,...trong thời gian tới đây!

Thông số kỹ thuật

ADIDAS PREDATOR 24 ELITE TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc: Elite (chuyên nghiệp).

Phần upper được làm từ chất liệu da lộn tổng hợp HybridTouch 2.0 hoàn toàn mới. Mềm mại, đàn hồi v...', 1260000.00, 'src/data/images/products/main_3df6d7a8.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('6159d67b-0eb8-4336-b23e-c37d2d36325a', 'NIKE TIEMPO REACT LEGEND 9 PRO TF - DA1192-614 - ĐỎ ĐÔ', 'NIKE TIEMPO LEGEND 9 PRO TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Đầu tháng 2/2021, Nike chính thức trình làng thế hệ tiếp theo của dòng giày đá bóng huyền thoại thuộc nhà Swoosh là Tiempo Legend 9. Được mệnh danh là thế hệ nhẹ nhất từ trước đến nay của dòng giày đá bóng Tiempo, Legend 9 đã có những thay đổi đáng kể về mặt thiết kế lẫn công nghệ nhằm giúp người chơi có thể tự tin và phát huy tối đa khả năng khi chơi bóng.

Thông số kỹ thuật:

NIKE TIEMPO REACT LEGEND 9 PRO TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5-7 người. 

Phân khúc: Pro (chuyên nghiệp)

Phần Upper được cấu thành từ da bê cao cấp, mềm và dày hơn đáng kể so với người tiền nhiệm, mang lại cảm giác bóng tốt nhất cho người chơi. Trên bề mặt upper là các cấu trúc được làm nổi lên bởi những foam pods (các phần tử bọt khí) ở những vùng tiếp xúc bóng chủ yếu, làm tăng diện tích bề mặt tiếp xúc, giúp xử lý bóng tốt hơn và tạo lực cho các pha sút và chuyền bóng.

Lưỡi gà liền được làm từ chất liệu vải thun thoáng...', 1260000.00, 'src/data/images/products/main_2e52265f.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('3a4785af-55c3-4b3d-8db7-f2905c7fb8a8', 'ADIDAS PREDATOR 25 LEAGUE L TF - JI1133 - ĐEN/VÀNG CHANH', 'ADIDAS PREDATOR 24 LEAGUE L TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Ghi bàn từ mọi hướng cùng mẫu giày bóng đá ADIDAS PREDATOR 24 LEAGUE L TF. Được thiết kế nhằm phục vụ cho lối chơi ghi bàn, ADIDAS PREDATOR 24 LEAGUE L TF với những công nghệ tiên tiến nhất của nhà Ba Sọc sẽ đem đến cho bạn sức mạnh và sự chính xác trong từng đường bóng.

Mẫu giày đá bóng PREDATOR 24 thuộc bộ sưu tập “Electric Stealth Pack” bắt mắt sẽ được những ngôi sao hàng đầu adidas mang trên chân như Jude Bellingham, Trent Alexander-Arnold, Pedri, Ilkay Gundogan, Paulo Dybala, Marco Asensio…. 

Thông số kỹ thuật

ADIDAS PREDATOR 24 LEAGUE L TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phân khúc: League (tầm trung).

Phần upper làm từ chất liệu da tổng hợp Hybridfeel mềm mại và đàn hồi, mang đến cảm giác bóng thật chân nhất cho người chơi.

Các vân 3D Strikescale được in dập nổi ở khu vực má trong làm tăng độ ma sát với bóng, từ đó giúp người chơi có thể dễ dàng thực hiện các đường chuyền hay cú...', 1260000.00, 'src/data/images/products/main_89a07b83.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('7f1e4675-0d48-46b5-a3e7-50450e638e1b', 'PUMA ULTRA 5 PRO CAGE - 108173-03 - BẠC/VÀNG', 'PUMA ULTRA 5 PRO CAGE TT - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Khai phá giới hạn tốc độ của riêng bạn cùng PUMA ULTRA 5 hoàn toàn mới. Lấy cảm hứng từ thành công của những chiếc xe đua tốc độ F1, mẫu giày đá bóng sân cỏ nhân tạo PUMA Ultra 5 Pro Cage sẽ không chỉ giúp bạn nhanh hơn - bùng nổ hơn - mà còn mang đến sự biến ảo cho lối chơi của bạn!

Ra sân, cảm nhận và tạo sự khác biệt - đó chính là những gì Future 8 mới nhất sẽ mang lại cho bạn!

Đón chào một mùa xuân mới cũng như chuẩn bị cho giai đoạn nước rút quan trọng của mùa giải, PUMA đã chính thức trình làng bộ sưu tập giày đá bóng “Audacity Pack” đầy ấn tượng. Trong những trận đấu sắp tới đây, các cầu thủ đại diện của thương hiệu sẽ chính thức lên chân pack giày này như: Antony, Kyle Walker, Theo Hernández, Cody Gakpo, Memphis Depay, Christian Pulisic, Kingsley Coman...

“Audacity Pack” mang đến một phối màu rực rỡ khác cho thế hệ Future 8 mới, cùng với đó là phiên bản Ultra được thiết kế tinh tế hơn và King cao cấp hơn.

Thông số ...', 1290000.00, 'src/data/images/products/main_e15e6436.jpg', 'ACTIVE', '6f5cd8bb-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('f9c5e5b5-75bc-4fad-9ceb-f7df54e3c5c1', 'NIKE TIEMPO LEGEND 10 PRO TF - DV4336-402 - XANH XÁM/ĐEN', 'NIKE TIEMPO LEGEND 10 PRO TF – GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO – PHỐI MÀU XANH XÁM/ĐEN | SCARY GOOD PACK (07/2025)

Scary Good Pack là bộ sưu tập đặc biệt được Nike tung ra cho mùa giải 2025/26 với concept đầy bí ẩn và mạnh mẽ. Mẫu Tiempo Legend 10 lần này khoác lên mình phối màu Blue Eclipse/Black, mang đến diện mạo lạnh lùng, đậm chất thi đấu cho dòng giày kiểm soát huyền thoại của nhà Swoosh.

Thông tin sản phẩm

Mã sản phẩm: DV4336-402

Tên đầy đủ: Nike Tiempo Legend 10 Pro TF (Turf)

Phân khúc: Pro (cao cấp)

Bộ sưu tập: Scary Good Pack (07/2025)

Phối màu: Blue Eclipse / Black / Metallic Silver

Loại đế: TF – Sân cỏ nhân tạo 5–7 người

Công nghệ & lợi ích nổi bật

Upper FlyTouch Pro – chất liệu da tổng hợp thế hệ mới mềm hơn da thật, ôm chân tốt, không giãn quá mức, đồng thời nhẹ hơn đáng kể so với Tiempo thế hệ trước.

Cấu trúc Touch Zone micro-dot được in nổi trên bề mặt upper giúp tăng khả năng kiểm soát bóng ở mọi điều kiện thời tiết.

Lưỡi gà liền và cổ giày bằng sợi dệt co ...', 1990000.00, 'src/data/images/products/main_0814eba7.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('733a1a55-ca05-4c24-bbf3-100713379d55', 'ASICS CALCETTO WD 9 TF - 1113A038-400 - XANH DƯƠNG', 'ASICS CALCETTO WD 9 TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Asics Calcetto đã chính thức quay trở lại với một thế hệ hoàn toàn mới của dòng giày này. Mềm hơn, bè hơn và cũng bền hơn - Asics Calcetto WD 9 TF hứa hẹn sẽ là mẫu giày hoàn hảo dành cho những ai đang tìm kiếm một đôi giày ổn định và thoải mái xuyên suốt trận đấu.  

Các mẫu giày đá bóng Asics vốn rất được yêu chuộng bởi các anh em chơi bóng đá phong trào tại Viêt Nam. Tất cả nhờ vào form giày Wide Fit phù hợp với những anh em có form chân từ bè vừa đến bè nhiều. 

Thông số kỹ thuật

ASICS CALCETTO WD 9 TF là mẫu giày đá bóng đế TF dành cho mặt sân cỏ nhân tạo từ 5-7 người.

Phần upper được làm từ da nhân tạo mềm mại và đàn hồi, mang đến cảm giác bóng tốt nhất cho người chơi. Trên bề mặt upper là những đường khâu dạng mắt lưới giúp giữ cho hình dáng không giãn quá mức sau một thời gian chơi bóng.  

Đế giày được thiết kế bo cao lên phần mũi, giúp hỗ trợ cho những pha chích mũi đầy uy lực từ người mang. Bên cạnh đó, mũi giày còn...', 1950000.00, 'src/data/images/products/main_c85b9cfc.jpg', 'ACTIVE', '6f5cd916-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('bd22abb6-a0bf-4dc0-9b10-dff51f311126', 'MIZUNO MORELIA NEO SALA β JAPAN TF - Q1GB254009 - XÁM/BẠC', 'MIZUNO MORELIA NEO SALA β JAPAN TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO CHÍNH HÃNG

Là phiên bản cao cấp dành cho sân cỏ nhân tạo TF, được sản xuất tại Nhật Bản với số lượng có hạn,  Morelia NEO SALA β JAPAN TF  Q1GB254009 kết hợp vẻ ngoài sang trọng và công nghệ hiện đại để mang đến trải nghiệm chơi bóng tối ưu cho mặt sẩn cỏ nhân tạo 5-7người. Phiên bản phối màu “Super White Pearl × Galaxy Silver” đem lại sự thanh lịch, dễ phối đồ và nổi bật trên sân.

Thông số kỹ thuật:

Upper (phần thân giày): Sử dụng kết hợp da Kangaroo cao cấp và vật liệu tổng hợp cùng cấu trúc knit, giúp ôm chân tốt, linh hoạt nhưng vẫn giữ độ bền và cảm giác tiếp xúc bóng chuẩn.

Midsole & Insole: Chất liệu cao hồi MIZUNO ENERZY trải rộng khắp midsole giúp khi tiếp đất sẽ chuyển năng lượng nhanh hơn, giảm mất mát lực. Bên cạnh đó phần insole dày 5 mm giúp tăng độ êm và cảm giác “đất liền chân”.

Outsole (đế giày): Thiết kế dành riêng cho mặt sân turf - loại sân cỏ nhân tạo giúp tăng độ bám, kiểm soát chuyển động t...', 4100000.00, 'src/data/images/products/main_c51cc9f9.jpg', 'ACTIVE', '6f5cd833-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('9ed79fcd-0fb1-42b6-a1a1-017fc7f4d5b4', 'ADIDAS COPA PURE 2 LEAGUE TF - IE7497 - ĐỎ BẠC ĐÔ', 'ADIDAS COPA PURE 2 LEAGUE TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Sở hữu những bước chạm bóng tinh tế với thế hệ COPA PURE 2 hoàn toàn mới. Được trình làng nhằm chuẩn bị cho mùa giải 2023/24, ADIDAS COPA PURE 2 LEAGUE TF sở hữu những cải tiến hứa hẹn sẽ mang đến trải nghiệm chơi bóng tốt nhất cho người chơi. 

"Energy Citrus Pack" là bộ sưu tập được adidas ra mắt nhằm chuẩn bị cho giai đoạn nước rút của mùa giải. Sở hữu phối màu "Shadow Red/White/Team Solar Yellow" cổ điển nhưng không kém phần hiện đại, mẫu giày đá bóng Copa Pure 2 “Energy Citrus Pack” sẽ được những ngôi sao hàng đầu adidas mang trên chân như Declan Rice, Bernardo Silva, Alexis Mac Allister, Josko Gvardiol…. 

Thông số kỹ thuật

ADIDAS COPA PURE 2 LEAGUE TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phần upper làm từ chất liệu nhân tạo mềm mại mang lại cảm giác bóng tốt nhất cho người chơi; đồng thời giúp giảm thời gian break-in giày.

Trên thế hệ Copa Pure 2 mới nhất lần này, hãng đã bổ sung thêm cá...', 1750000.00, 'src/data/images/products/main_b9119bbc.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('d064c443-2bbb-4cb7-86be-169bfcc62c3b', 'NIKE ZOOM MERCURIAL SUPERFLY 9 ACADEMY TF - DJ5629-700 - TRẮNG KEM', 'NIKE ZOOM MERCURIAL SUPERFLY 9 ACADEMY MDS TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Tháng 6/2022, Nike chính thức trình làng thế hệ tiếp theo của dòng giày Mercurial mang tên Air Zoom Mercurial. Cải tiến lớn nhất trên thế hệ này nằm ở bộ đệm Zoom Air được thiết kế độc quyền cho bóng đá. Bên cạnh đó, mọi chi tiết trên đôi giày lần này đều được thiết kế nhằm tối ưu hoá lối chơi tốc độ. 

Thông số kỹ thuật

Mẫu giày đá bóng MERCURIAL ZOOM SUPERFLY 9 ACADEMY TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.

Phân khúc: Academy (Tầm trung).

Upper làm từ da tổng hợp mềm mại giúp tăng cảm giác bóng. Ở thế hệ 15 này, hãng đã phủ thêm lớp NikeSkin trên bề mặt upper làm tăng độ bám bóng, từ đó có thể kiểm soát bóng và rê bóng tốt hơn. 

Cấu trúc Speed Cage bên dưới bề mặt upper được làm từ chất liệu mỏng nhưng cực kỳ chắc chắn sẽ mang đến sự ôm chân vừa khít, đồng thời hạn chế sự xê dịch chân trong giày khi thi đấu ở cường độ cao.

Phần cổ thun Dynamic Fit sẽ giúp ôm trọn cổ chân củ...', 1260000.00, 'src/data/images/products/main_23c75da3.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('07766e83-83d5-4849-b336-7081e30041eb', 'ADIDAS PREDATOR 25 PRO TF - JI1185 - CAM/XANH', 'ADIDAS PREDATOR PRO TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Hãy sẵn sàng ra sân và ghi bàn cùng mẫu giày bóng đá ADIDAS PREDATOR PRO TF! Được cải tiến để tối ưu hóa khả năng tấn công của người chơi, ADIDAS PREDATOR PRO TF với những công nghệ tiên tiến nhất của nhà Ba Sọc sẽ mang đến cho bạn sức mạnh bứt phá và độ chính xác tuyệt đối trong từng pha bóng.

Phối màu này sẽ "lên chân" những ngôi sao Jude Bellingham, Pedri, Raphinha, Trent Alexander-Arnold, Paulo Dybala….trong thời gian tới đây!

Thông số kỹ thuật

ADIDAS PREDATOR PRO TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo 5-7 người.  

Phân khúc: Pro (chuyên nghiệp).

Form giày phù hợp cho chân thon đến bè vừa.

Phần upper được làm từ chất liệu da HybridTouch cải tiến. Đây là sự kết hợp hoàn hảo giữa chất liệu da lộn tổng hợp và vật liệu foil, giúp mang đến cảm giác chạm bóng êm ái, độ ôm chân vừa vặn và trọng lượng nhẹ hơn so với các thế hệ trước.

Trên thế hệ mới này, các vân cao su Strikeskin đã được tinh chỉnh với thiết kế...', 2850000.00, 'src/data/images/products/main_36ff1a73.jpg', 'ACTIVE', '6f5cd405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('79c1ab32-2a1f-4c9e-acf7-cfa6823504aa', 'NIKE ZOOM MERCURIAL VAPOR 16 PRO TF - FQ8687-600 - HỒNG TÍM/CAM', 'NIKE MERCURIAL VAPOR 16 PRO TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Thuộc bộ sưu tập Scary Good Pack, giày đá bóng Nike Mercurial Vapor 16 Pro TF là phiên bản giày đá banh đế cỏ nhân tạo TF cao cấp được Nike trình làng vào tháng 07/2025. Đây là thế hệ tiếp theo của dòng Air Zoom Mercurial, được nâng cấp toàn diện về trọng lượng, độ ôm và độ bám sân – hướng đến những người chơi tốc độ và kỹ thuật thi đấu trên mặt sân cỏ nhân tạo 5 đến 7 người.

Điểm nổi bật của Vapor 16 Pro TF

Upper Flyknit siêu nhẹ & ôm chân
Phần thân giày được làm hoàn toàn từ sợi dệt Flyknit mỏng nhẹ – lần đầu tiên xuất hiện trên dòng Mercurial TF – giúp ôm sát và thích ứng với bàn chân, mang lại cảm giác bóng chính xác và tự nhiên.

Công nghệ ACC hỗ trợ mọi điều kiện thời tiết
Lớp phủ ACC (All Conditions Control) giúp kiểm soát bóng ổn định, kể cả khi sân trơn ướt hay khô ráo.

Đệm Air Zoom êm ái, hỗ trợ bứt tốc
Bộ đệm giữ nguyên công nghệ Air Zoom như Vapor 14 & 15, giúp giảm áp lực từ mặt sân và tạo cảm giác chạy m...', 1990000.00, 'src/data/images/products/main_b9065d06.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('7e33bda9-30e2-44d5-82c0-a593e0d495d1', 'NIKE REACT PHANTOM GX PRO TF - DD9466-705 - TRẮNG/XANH LÁ MẠ', 'NIKE REACT PHANTOM GX PRO TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Nâng tầm kỹ năng của bạn cùng mẫu giày đá banh NIKE REACT PHANTOM GX PRO TF hoàn toàn mới! Là bản nâng cấp hoàn toàn mới của Phantom GT 2, Phantom GX sẽ là đôi giày hoàn hảo dành cho những ai tìm kiếm sự chính xác tuyệt đối trên sân. 

Nike khởi đầu năm 2023 với bộ sưu tập “Blast Pack” hoàn toàn mới. Ở lần phát hành này, nhà Swoosh đã giới thiệu những phiên bản Phantom GX cùng với Air Zoom Mercurial Superfly 9 và Vapor 15 trong phối màu trắng xanh vô cùng năng động.

Thông số kỹ thuật:

NIKE REACT PHANTOM GX PRO TF là mẫu giày đá banh đế TF dành cho sân cỏ nhân tạo 5-7 người. 

Phần upper làm từ da tổng hợp siêu mềm với cấu trúc tương tự sợi dệt giúp đem lại cảm giác bóng thật chân hơn cho người mang.  

Tương tự như các thế hệ tiền nhiệm, trên bề mặt Phantom GX Pro TF được trang bị thêm lớp phủ NikeSkin giúp tăng độ bám bóng, từ đó có thể kiểm soát và rê bóng tốt hơn ở bất kỳ điều kiện thời tiết. 

Hệ thống dây giày được ...', 1260000.00, 'src/data/images/products/main_64b77f65.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('93e66db6-161c-4270-932c-f2f1101aede2', 'NIKE ZOOM MERCURIAL VAPOR 16 PRO TF - FQ8687-800 - ĐỎ/TRẮNG', 'NIKE MERCURIAL VAPOR 16 PRO TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Sau chu kỳ 2 năm, tháng 7/2024, Nike đã chính thức trình làng thế hệ mới nhất của silo Air Zoom Mercurial. Nhẹ hơn - bền hơn - bùng nổ hơn, Mercurial Vapor 16 Pro TF sẽ là đôi giày bóng đá hoàn hảo dành cho những tín đồ đam mê tốc độ.

Thông số kỹ thuật

MERCURIAL VAPOR 16 PRO TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5 đến 7 người. 

Phân khúc: Pro (Chuyên nghiệp).

Form giày phù hợp cho chân thon đến bè vừa. 

Phần upper được làm hoàn toàn từ chất liệu sợi dệt Flyknit siêu nhẹ và mỏng với khả năng thích ứng tốt theo bàn chân người mang sẽ đem lại trải nghiệm chạm bóng hoàn hảo. Đặc biệt, đây cũng là lần đầu tiên sợi dệt Flyknit xuất hiện trên một thế hệ Mercurial Vapor phân khúc sân cỏ nhân tạo.

Trên bề mặt upper được trang bị một lớp phủ làm tăng độ ma sát, giúp bạn kiểm soát bóng tốt hơn khi rê dắt ở tốc độ cao và sẵn sàng ghi bàn trong bất kỳ tình huống. 

Đặc biệt, Mercurial Vapor 16 Pro TF còn được...', 2790000.00, 'src/data/images/products/main_77671bb4.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('58659122-66f9-4a04-86d2-575e3cba5bc4', 'NIKE ZOOM MERCURIAL SUPERFLY 10 ACADEMY TF - FQ8331-301 - XÁM XANH/HỒNG', 'NIKE ZOOM MERCURIAL SUPERFLY 10 ACADEMY TF - GIÀY ĐÁ BÓNG SÂN CỎ NHÂN TẠO

Sau chu kỳ 2 năm, tháng 7/2024, Nike đã chính thức trình làng thế hệ mới nhất của silo Air Zoom Mercurial. Nhẹ hơn - bền hơn - bùng nổ hơn, Mercurial Superfly 10 Academy TF sẽ là đôi giày bóng đá hoàn hảo dành cho những tín đồ đam mê tốc độ.

Thông số kỹ thuật

MERCURIAL SUPERFLY 10 ACADEMY TF là mẫu giày đá bóng đế TF dành cho sân cỏ nhân tạo từ 5 đến 7 người. 

Phân khúc: Academy (tầm trung).

Form giày phù hợp cho chân thon đến bè vừa. 

Phần upper được làm từ da tổng hợp NikeSkin mềm mỏng và đàn hồi sẽ mang lại cảm giác bóng thật chân cho bạn. Bề mặt upper được phủ một lớp PU, không chỉ giúp tăng cường độ bền cho đôi giày mà còn làm tăng ma sát khi tiếp xúc bóng, giúp bạn kiểm soát bóng tốt hơn khi rê dắt ở tốc độ cao.

Cổ giày Dynamic Fit ôm trọn cổ chân, mang lại sự chắc chắn và ngăn các hạt cao su rơi vào giày trong quá trình thi đấu. 

Đặc biệt, trên Mercurial Superfly 10 Academy TF lần này, phần cổ t...', 2750000.00, 'src/data/images/products/main_484d13a8.jpg', 'ACTIVE', '6f5c7405-d4d1-11f0-9c43-bac23ad2f5de', 'e824ecd1-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW());

-- =============================================
-- INSERT PRODUCT VARIANTS
-- =============================================

INSERT INTO product_variants (variant_id, product_id, size, color, stock, image_url) VALUES
('033d8697-bcaa-41e5-b440-93f599379572', '91a11254-ffa1-4664-adce-e47412187480', '38', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_0b0156ff.jpg'),
('af154efb-41b0-4b8f-bfa2-5f5b4a7c398e', '91a11254-ffa1-4664-adce-e47412187480', '39', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_0b0156ff.jpg'),
('7da1021e-ad68-4a54-b990-83738f1a0591', '91a11254-ffa1-4664-adce-e47412187480', '40', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_0b0156ff.jpg'),
('5aea5950-2d1d-42ba-945e-f5ed7d4c7e2d', '91a11254-ffa1-4664-adce-e47412187480', '41', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_0b0156ff.jpg'),
('3126f1c3-b7ac-46b9-8dd4-42366381704f', '91a11254-ffa1-4664-adce-e47412187480', '42', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_0b0156ff.jpg'),
('3589d772-4ba8-4ed9-8c5d-f44df1752f30', '91a11254-ffa1-4664-adce-e47412187480', '43', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_0b0156ff.jpg'),
('7614d7b5-7338-472a-9e1d-63a36c7a8fcb', '91a11254-ffa1-4664-adce-e47412187480', '44', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_0b0156ff.jpg'),
('ee1b3ec9-6e1b-439f-b6aa-76861abe62ab', '91a11254-ffa1-4664-adce-e47412187480', '45', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_0b0156ff.jpg'),
('f991440a-dd37-49c1-8cd9-3f5b147ad293', 'd39dfb40-b425-41cb-8767-bd516ea4eace', '38', 'TÍM/BẠC', 10, 'src/data/images/products/main_9001e103.jpg'),
('05a8239c-1e3c-403f-af76-14791f566938', 'd39dfb40-b425-41cb-8767-bd516ea4eace', '39', 'TÍM/BẠC', 10, 'src/data/images/products/main_9001e103.jpg'),
('81e0b182-c808-4432-90db-402608a2888b', 'd39dfb40-b425-41cb-8767-bd516ea4eace', '40', 'TÍM/BẠC', 10, 'src/data/images/products/main_9001e103.jpg'),
('4051a7dc-7faa-4538-aeb7-10771a6051c6', 'd39dfb40-b425-41cb-8767-bd516ea4eace', '41', 'TÍM/BẠC', 10, 'src/data/images/products/main_9001e103.jpg'),
('bb5e3d8d-2c36-40cf-bdc2-243779112f71', 'd39dfb40-b425-41cb-8767-bd516ea4eace', '42', 'TÍM/BẠC', 10, 'src/data/images/products/main_9001e103.jpg'),
('6d60fb9e-072c-4ca6-8161-723d745d0d7c', 'd39dfb40-b425-41cb-8767-bd516ea4eace', '43', 'TÍM/BẠC', 10, 'src/data/images/products/main_9001e103.jpg'),
('7f6704a4-0f59-4722-81e2-289986d46256', 'd39dfb40-b425-41cb-8767-bd516ea4eace', '44', 'TÍM/BẠC', 10, 'src/data/images/products/main_9001e103.jpg'),
('b0ed723f-13ff-4d65-82e2-4d658e586307', 'd39dfb40-b425-41cb-8767-bd516ea4eace', '45', 'TÍM/BẠC', 10, 'src/data/images/products/main_9001e103.jpg'),
('a9fad8bc-b747-4f97-a220-74937c95f7b1', '3f6e3d84-5cc2-4d47-ba95-fb4c4505f83b', '38', 'ĐEN/ĐỎ', 10, 'src/data/images/products/main_640d2d1a.jpg'),
('f53a39ef-bb84-4184-b99e-89388b5abe8d', '3f6e3d84-5cc2-4d47-ba95-fb4c4505f83b', '39', 'ĐEN/ĐỎ', 10, 'src/data/images/products/main_640d2d1a.jpg'),
('93d33d54-0461-4adc-8cc5-01f21edd9ffe', '3f6e3d84-5cc2-4d47-ba95-fb4c4505f83b', '40', 'ĐEN/ĐỎ', 10, 'src/data/images/products/main_640d2d1a.jpg'),
('8e552775-d306-4bd4-a29c-3400550df979', '3f6e3d84-5cc2-4d47-ba95-fb4c4505f83b', '41', 'ĐEN/ĐỎ', 10, 'src/data/images/products/main_640d2d1a.jpg'),
('06fd7bf3-2f19-42ed-80b8-868653c681d6', '3f6e3d84-5cc2-4d47-ba95-fb4c4505f83b', '42', 'ĐEN/ĐỎ', 10, 'src/data/images/products/main_640d2d1a.jpg'),
('122f92fc-700c-4b20-9581-096b93100a65', '3f6e3d84-5cc2-4d47-ba95-fb4c4505f83b', '43', 'ĐEN/ĐỎ', 10, 'src/data/images/products/main_640d2d1a.jpg'),
('e37131c9-724b-40a0-a04d-d5593a9c291d', '3f6e3d84-5cc2-4d47-ba95-fb4c4505f83b', '44', 'ĐEN/ĐỎ', 10, 'src/data/images/products/main_640d2d1a.jpg'),
('82189743-1031-4fba-a9a1-1812f2f90738', '3f6e3d84-5cc2-4d47-ba95-fb4c4505f83b', '45', 'ĐEN/ĐỎ', 10, 'src/data/images/products/main_640d2d1a.jpg'),
('11bf31b5-8638-43e2-8e54-52f80c726f0b', 'dc34e5b8-f8ce-4213-b3c8-9487478c3d4e', '38', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_7df7d677.jpg'),
('a09b2cd9-e130-4da5-ae67-eb137a1040d6', 'dc34e5b8-f8ce-4213-b3c8-9487478c3d4e', '39', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_7df7d677.jpg'),
('a5b736e3-08b4-4ce1-a4c8-9f9a183fa620', 'dc34e5b8-f8ce-4213-b3c8-9487478c3d4e', '40', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_7df7d677.jpg'),
('ee1b0762-1321-47ee-807c-d22b615c3ad6', 'dc34e5b8-f8ce-4213-b3c8-9487478c3d4e', '41', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_7df7d677.jpg'),
('5022fdb4-d8a3-495c-b7ec-35780937ad7e', 'dc34e5b8-f8ce-4213-b3c8-9487478c3d4e', '42', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_7df7d677.jpg'),
('822c4af9-1df0-46c4-addc-d74d0de599a3', 'dc34e5b8-f8ce-4213-b3c8-9487478c3d4e', '43', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_7df7d677.jpg'),
('b1cbd201-86ac-4432-b6d3-b71b8205236f', 'dc34e5b8-f8ce-4213-b3c8-9487478c3d4e', '44', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_7df7d677.jpg'),
('2b2418fd-6951-4cc3-acd1-207f7a2a6aa2', 'dc34e5b8-f8ce-4213-b3c8-9487478c3d4e', '45', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_7df7d677.jpg'),
('9cfe433b-551a-4404-8ed0-d063aea2492e', '3c4cfae1-6bd7-480a-b9df-ad16910a0f67', '38', 'VÀNG NEON', 10, 'src/data/images/products/main_36d4d8d2.jpg'),
('3cc64013-3139-49a9-bb35-0bccf9cead8f', '3c4cfae1-6bd7-480a-b9df-ad16910a0f67', '39', 'VÀNG NEON', 10, 'src/data/images/products/main_36d4d8d2.jpg'),
('8faad220-70e6-48dc-be4a-b969b8739301', '3c4cfae1-6bd7-480a-b9df-ad16910a0f67', '40', 'VÀNG NEON', 10, 'src/data/images/products/main_36d4d8d2.jpg'),
('de6c7ada-d7c2-4029-871f-10de9592da59', '3c4cfae1-6bd7-480a-b9df-ad16910a0f67', '41', 'VÀNG NEON', 10, 'src/data/images/products/main_36d4d8d2.jpg'),
('5d2b8b18-ef09-49d8-b747-4854af5fa41f', '3c4cfae1-6bd7-480a-b9df-ad16910a0f67', '42', 'VÀNG NEON', 10, 'src/data/images/products/main_36d4d8d2.jpg'),
('515a8265-de3a-47f6-bdcd-db2386ff8a91', '3c4cfae1-6bd7-480a-b9df-ad16910a0f67', '43', 'VÀNG NEON', 10, 'src/data/images/products/main_36d4d8d2.jpg'),
('5a7c2c33-5364-4135-87d8-98948ecf02e7', '3c4cfae1-6bd7-480a-b9df-ad16910a0f67', '44', 'VÀNG NEON', 10, 'src/data/images/products/main_36d4d8d2.jpg'),
('d15fc12c-e9c4-403f-a32d-dd38b00f410a', '3c4cfae1-6bd7-480a-b9df-ad16910a0f67', '45', 'VÀNG NEON', 10, 'src/data/images/products/main_36d4d8d2.jpg'),
('42c8a1f5-e9d1-481e-8758-2c4668859b07', 'f5694b02-2874-4bf7-b2fb-b178925320da', '38', 'BẠC/XANH', 10, 'src/data/images/products/main_8e3b62f9.jpg'),
('3302d679-6aaa-4cbc-b82b-336a3e9817fa', 'f5694b02-2874-4bf7-b2fb-b178925320da', '39', 'BẠC/XANH', 10, 'src/data/images/products/main_8e3b62f9.jpg'),
('8f160486-6069-402f-b995-f78368386b05', 'f5694b02-2874-4bf7-b2fb-b178925320da', '40', 'BẠC/XANH', 10, 'src/data/images/products/main_8e3b62f9.jpg'),
('6252ee79-714a-41e8-a022-ec92afb4ad12', 'f5694b02-2874-4bf7-b2fb-b178925320da', '41', 'BẠC/XANH', 10, 'src/data/images/products/main_8e3b62f9.jpg'),
('a32afb24-e2e0-4e34-a734-89461e599aa9', 'f5694b02-2874-4bf7-b2fb-b178925320da', '42', 'BẠC/XANH', 10, 'src/data/images/products/main_8e3b62f9.jpg'),
('15b63bae-935c-4d5f-990a-fe1c30dc8d10', 'f5694b02-2874-4bf7-b2fb-b178925320da', '43', 'BẠC/XANH', 10, 'src/data/images/products/main_8e3b62f9.jpg'),
('d8e17289-f2d3-48da-89fe-daf5cc4956d4', 'f5694b02-2874-4bf7-b2fb-b178925320da', '44', 'BẠC/XANH', 10, 'src/data/images/products/main_8e3b62f9.jpg'),
('49a4e0d3-aaee-4c32-83bc-165d411eea12', 'f5694b02-2874-4bf7-b2fb-b178925320da', '45', 'BẠC/XANH', 10, 'src/data/images/products/main_8e3b62f9.jpg'),
('f40bf2f4-d981-438d-a41e-4bc7faf767c8', '784dbede-9915-4332-a271-c7870caeb02e', '38', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_10bf1f7e.jpg'),
('5d73350d-33ed-4fc6-be87-cd2111d32a51', '784dbede-9915-4332-a271-c7870caeb02e', '39', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_10bf1f7e.jpg'),
('6afd9bc5-d7e9-434d-823e-79f140daace8', '784dbede-9915-4332-a271-c7870caeb02e', '40', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_10bf1f7e.jpg'),
('7f9aa13e-8410-45d1-93e6-1d38d1f728b0', '784dbede-9915-4332-a271-c7870caeb02e', '41', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_10bf1f7e.jpg'),
('78906ee3-d0a5-474a-bec7-f9d07f91bbe9', '784dbede-9915-4332-a271-c7870caeb02e', '42', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_10bf1f7e.jpg'),
('f337d5e0-9f14-4b06-9446-c20d9c741b28', '784dbede-9915-4332-a271-c7870caeb02e', '43', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_10bf1f7e.jpg'),
('6decba44-3301-4f44-a183-4030f20995ae', '784dbede-9915-4332-a271-c7870caeb02e', '44', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_10bf1f7e.jpg'),
('e87d8c8b-faae-43a7-9e21-259131efd63e', '784dbede-9915-4332-a271-c7870caeb02e', '45', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_10bf1f7e.jpg'),
('4536a2c3-d459-4ca1-880e-470025428e41', 'a95aed16-a6dc-4b3f-b3a3-618abbc4b651', '38', 'CAM/XANH', 10, 'src/data/images/products/main_f6c3558f.jpg'),
('72d32923-3c03-4b37-ad44-1cbf5a915eac', 'a95aed16-a6dc-4b3f-b3a3-618abbc4b651', '39', 'CAM/XANH', 10, 'src/data/images/products/main_f6c3558f.jpg'),
('913d5191-f18b-4f18-a857-d741b8cd70e2', 'a95aed16-a6dc-4b3f-b3a3-618abbc4b651', '40', 'CAM/XANH', 10, 'src/data/images/products/main_f6c3558f.jpg'),
('3b52803e-10f3-49f3-b5db-7a534286474c', 'a95aed16-a6dc-4b3f-b3a3-618abbc4b651', '41', 'CAM/XANH', 10, 'src/data/images/products/main_f6c3558f.jpg'),
('40add97d-3f6f-42af-8d10-9aa7fae4b50f', 'a95aed16-a6dc-4b3f-b3a3-618abbc4b651', '42', 'CAM/XANH', 10, 'src/data/images/products/main_f6c3558f.jpg'),
('60493e3a-cd88-4845-bca2-59203f0c982b', 'a95aed16-a6dc-4b3f-b3a3-618abbc4b651', '43', 'CAM/XANH', 10, 'src/data/images/products/main_f6c3558f.jpg'),
('63786488-13dc-4aa4-85f7-55f23cf07e1d', 'a95aed16-a6dc-4b3f-b3a3-618abbc4b651', '44', 'CAM/XANH', 10, 'src/data/images/products/main_f6c3558f.jpg'),
('364e8017-4b4b-464f-95ee-faf0439fc528', 'a95aed16-a6dc-4b3f-b3a3-618abbc4b651', '45', 'CAM/XANH', 10, 'src/data/images/products/main_f6c3558f.jpg'),
('fbed4236-0b4b-4751-ac03-b4b5eee7be9c', '456b8557-9e19-4635-b034-1d3955315cf1', '38', 'XANH/TRẮNG', 10, 'src/data/images/products/main_6905da91.jpg'),
('b83587e6-bf35-4b4f-a914-8a0baef6808e', '456b8557-9e19-4635-b034-1d3955315cf1', '39', 'XANH/TRẮNG', 10, 'src/data/images/products/main_6905da91.jpg'),
('5bf067c4-c0c6-4b0a-826c-eaab55e3e14a', '456b8557-9e19-4635-b034-1d3955315cf1', '40', 'XANH/TRẮNG', 10, 'src/data/images/products/main_6905da91.jpg'),
('1400915b-c43b-4cec-be26-81fbc38d66a3', '456b8557-9e19-4635-b034-1d3955315cf1', '41', 'XANH/TRẮNG', 10, 'src/data/images/products/main_6905da91.jpg'),
('34a8d64b-2d78-4028-ada9-91ab4073a9c7', '456b8557-9e19-4635-b034-1d3955315cf1', '42', 'XANH/TRẮNG', 10, 'src/data/images/products/main_6905da91.jpg'),
('11e3dd9f-b5b2-4446-9972-0c2f6fb9716a', '456b8557-9e19-4635-b034-1d3955315cf1', '43', 'XANH/TRẮNG', 10, 'src/data/images/products/main_6905da91.jpg'),
('322ca45a-3242-4bbe-b08b-53ea48b6f570', '456b8557-9e19-4635-b034-1d3955315cf1', '44', 'XANH/TRẮNG', 10, 'src/data/images/products/main_6905da91.jpg'),
('896be848-5fe3-408b-adff-485e7f13d10b', '456b8557-9e19-4635-b034-1d3955315cf1', '45', 'XANH/TRẮNG', 10, 'src/data/images/products/main_6905da91.jpg'),
('7c6c0cb8-ab6f-4c6d-a144-b419e03db755', 'e5c7c7b5-5a86-4ec9-ae90-c8a455349934', '38', 'HỒNG', 10, 'src/data/images/products/main_d4ee60d8.jpg'),
('30599b8b-d80b-4a0c-9421-92968bf05091', 'e5c7c7b5-5a86-4ec9-ae90-c8a455349934', '39', 'HỒNG', 10, 'src/data/images/products/main_d4ee60d8.jpg'),
('0e8cb869-ffc4-4613-af67-ee797384454c', 'e5c7c7b5-5a86-4ec9-ae90-c8a455349934', '40', 'HỒNG', 10, 'src/data/images/products/main_d4ee60d8.jpg'),
('6dc09603-b17c-43f1-8952-8f14c1d953ab', 'e5c7c7b5-5a86-4ec9-ae90-c8a455349934', '41', 'HỒNG', 10, 'src/data/images/products/main_d4ee60d8.jpg'),
('3064a843-2d15-4cf1-9fa9-37b2bd077a5a', 'e5c7c7b5-5a86-4ec9-ae90-c8a455349934', '42', 'HỒNG', 10, 'src/data/images/products/main_d4ee60d8.jpg'),
('0a783ade-3f6e-4bfa-bce7-9c45e99babb8', 'e5c7c7b5-5a86-4ec9-ae90-c8a455349934', '43', 'HỒNG', 10, 'src/data/images/products/main_d4ee60d8.jpg'),
('7007cece-d8c4-4184-be39-f92284b64844', 'e5c7c7b5-5a86-4ec9-ae90-c8a455349934', '44', 'HỒNG', 10, 'src/data/images/products/main_d4ee60d8.jpg'),
('e6db321e-5c4f-4022-a62b-0b5b37965310', 'e5c7c7b5-5a86-4ec9-ae90-c8a455349934', '45', 'HỒNG', 10, 'src/data/images/products/main_d4ee60d8.jpg'),
('69d06867-2811-423f-9f0e-b9777975efac', '8a6580f2-b817-4edc-9578-ad127b063193', '38', 'ĐEN', 10, 'src/data/images/products/main_6d447b45.jpg'),
('a4a84d20-eb5d-4510-a3e4-c43802b7fbfb', '8a6580f2-b817-4edc-9578-ad127b063193', '39', 'ĐEN', 10, 'src/data/images/products/main_6d447b45.jpg'),
('9216aa87-fd10-44cf-a93e-969885272a10', '8a6580f2-b817-4edc-9578-ad127b063193', '40', 'ĐEN', 10, 'src/data/images/products/main_6d447b45.jpg'),
('d3aa38ac-a780-484d-bb75-4430cbdc5c9f', '8a6580f2-b817-4edc-9578-ad127b063193', '41', 'ĐEN', 10, 'src/data/images/products/main_6d447b45.jpg'),
('c302e21c-7305-49cf-9927-e977b93914cf', '8a6580f2-b817-4edc-9578-ad127b063193', '42', 'ĐEN', 10, 'src/data/images/products/main_6d447b45.jpg'),
('253c5f77-2994-40fb-b026-fec96bee178c', '8a6580f2-b817-4edc-9578-ad127b063193', '43', 'ĐEN', 10, 'src/data/images/products/main_6d447b45.jpg'),
('00f6d4db-565b-4a4e-94bc-2f1657555ac1', '8a6580f2-b817-4edc-9578-ad127b063193', '44', 'ĐEN', 10, 'src/data/images/products/main_6d447b45.jpg'),
('8e7fa059-6d6c-44b8-a37a-87c354e005b3', '8a6580f2-b817-4edc-9578-ad127b063193', '45', 'ĐEN', 10, 'src/data/images/products/main_6d447b45.jpg'),
('fbf35582-4edf-4b84-aca5-7cbe1edd1d5d', 'ec0756a4-dd3f-447a-be83-ac971d1818ce', '38', 'TRẮNG/VÀNG CHANH', 10, 'src/data/images/products/main_d0202aca.jpg'),
('cf620440-4d4a-4c45-9786-e118795f788c', 'ec0756a4-dd3f-447a-be83-ac971d1818ce', '39', 'TRẮNG/VÀNG CHANH', 10, 'src/data/images/products/main_d0202aca.jpg'),
('82aa0206-e2ec-4780-afb1-031858dd3848', 'ec0756a4-dd3f-447a-be83-ac971d1818ce', '40', 'TRẮNG/VÀNG CHANH', 10, 'src/data/images/products/main_d0202aca.jpg'),
('b3e770d3-1fa5-4b68-a329-0e69ee76dffa', 'ec0756a4-dd3f-447a-be83-ac971d1818ce', '41', 'TRẮNG/VÀNG CHANH', 10, 'src/data/images/products/main_d0202aca.jpg'),
('d0a9330a-688e-4a74-991a-864280dc4582', 'ec0756a4-dd3f-447a-be83-ac971d1818ce', '42', 'TRẮNG/VÀNG CHANH', 10, 'src/data/images/products/main_d0202aca.jpg'),
('933dcf7c-10e4-43cc-b489-3a262cc8d55c', 'ec0756a4-dd3f-447a-be83-ac971d1818ce', '43', 'TRẮNG/VÀNG CHANH', 10, 'src/data/images/products/main_d0202aca.jpg'),
('dee3e33e-4cf1-4435-97de-26bd32b851ae', 'ec0756a4-dd3f-447a-be83-ac971d1818ce', '44', 'TRẮNG/VÀNG CHANH', 10, 'src/data/images/products/main_d0202aca.jpg'),
('ccef4b20-785f-41f9-9231-a24227911cc2', 'ec0756a4-dd3f-447a-be83-ac971d1818ce', '45', 'TRẮNG/VÀNG CHANH', 10, 'src/data/images/products/main_d0202aca.jpg'),
('2d363483-86e2-4c46-b18e-8c37867b708e', 'a5251601-73e3-49f9-9f0a-c28f1da55a25', '38', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_be145f8a.jpg'),
('df9a37e5-6321-44b4-92e1-29f215bc6f0b', 'a5251601-73e3-49f9-9f0a-c28f1da55a25', '39', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_be145f8a.jpg'),
('c3102f57-b998-4ffb-852e-448ba414948e', 'a5251601-73e3-49f9-9f0a-c28f1da55a25', '40', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_be145f8a.jpg'),
('c7962542-b941-4237-9716-4b284d995039', 'a5251601-73e3-49f9-9f0a-c28f1da55a25', '41', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_be145f8a.jpg');

INSERT INTO product_variants (variant_id, product_id, size, color, stock, image_url) VALUES
('1b7776ef-dcf4-4cd6-8680-065af534ffc9', 'a5251601-73e3-49f9-9f0a-c28f1da55a25', '42', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_be145f8a.jpg'),
('a53dd5bd-5b37-4866-a08c-8f649d766953', 'a5251601-73e3-49f9-9f0a-c28f1da55a25', '43', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_be145f8a.jpg'),
('c0180430-4fe1-48f9-a01c-785529d95110', 'a5251601-73e3-49f9-9f0a-c28f1da55a25', '44', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_be145f8a.jpg'),
('68fc9f14-f715-47ad-9ba2-767d7f69469f', 'a5251601-73e3-49f9-9f0a-c28f1da55a25', '45', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_be145f8a.jpg'),
('9f3c927a-9145-4ea1-a48b-7e1e762a1f10', 'b029e1b5-6999-4779-bf40-2a9e2b9cbd6a', '38', 'HỒNG CAM', 10, 'src/data/images/products/main_908e530f.jpg'),
('751c3e6d-89fc-493d-afad-d144d09dc9d8', 'b029e1b5-6999-4779-bf40-2a9e2b9cbd6a', '39', 'HỒNG CAM', 10, 'src/data/images/products/main_908e530f.jpg'),
('53dabb71-e341-44d1-9270-b77e1c0b90c7', 'b029e1b5-6999-4779-bf40-2a9e2b9cbd6a', '40', 'HỒNG CAM', 10, 'src/data/images/products/main_908e530f.jpg'),
('e6172ca6-3da9-4cee-845a-75b22cc9ea73', 'b029e1b5-6999-4779-bf40-2a9e2b9cbd6a', '41', 'HỒNG CAM', 10, 'src/data/images/products/main_908e530f.jpg'),
('e5a24829-bc85-4e11-9038-cb32c4e13909', 'b029e1b5-6999-4779-bf40-2a9e2b9cbd6a', '42', 'HỒNG CAM', 10, 'src/data/images/products/main_908e530f.jpg'),
('2fcd7ffd-cea9-4616-945a-74db5c5181e9', 'b029e1b5-6999-4779-bf40-2a9e2b9cbd6a', '43', 'HỒNG CAM', 10, 'src/data/images/products/main_908e530f.jpg'),
('ee4b105e-dc97-4059-b432-545650271807', 'b029e1b5-6999-4779-bf40-2a9e2b9cbd6a', '44', 'HỒNG CAM', 10, 'src/data/images/products/main_908e530f.jpg'),
('963a6a30-d964-49a5-bfb8-f34fb99b8451', 'b029e1b5-6999-4779-bf40-2a9e2b9cbd6a', '45', 'HỒNG CAM', 10, 'src/data/images/products/main_908e530f.jpg'),
('131559fa-74e7-4603-be37-6107cf56d202', '62cb5985-d4e5-4a3c-b82c-b2df7ea94ecf', '38', 'CAM/XANH', 10, 'src/data/images/products/main_5bf0b2b6.jpg'),
('d338d01e-4911-45d9-bb1f-a167e8df66e1', '62cb5985-d4e5-4a3c-b82c-b2df7ea94ecf', '39', 'CAM/XANH', 10, 'src/data/images/products/main_5bf0b2b6.jpg'),
('a904704c-5639-47fd-bb9f-e6c69ebf24a7', '62cb5985-d4e5-4a3c-b82c-b2df7ea94ecf', '40', 'CAM/XANH', 10, 'src/data/images/products/main_5bf0b2b6.jpg'),
('6c669f7b-e199-40ed-ab3c-67959ffb4ca6', '62cb5985-d4e5-4a3c-b82c-b2df7ea94ecf', '41', 'CAM/XANH', 10, 'src/data/images/products/main_5bf0b2b6.jpg'),
('f2356908-e725-40cf-9059-578e2789d1b6', '62cb5985-d4e5-4a3c-b82c-b2df7ea94ecf', '42', 'CAM/XANH', 10, 'src/data/images/products/main_5bf0b2b6.jpg'),
('f1d79d25-6cfb-42d9-92df-246f686af7a9', '62cb5985-d4e5-4a3c-b82c-b2df7ea94ecf', '43', 'CAM/XANH', 10, 'src/data/images/products/main_5bf0b2b6.jpg'),
('6746d372-1f5f-42be-8e1a-782725d61688', '62cb5985-d4e5-4a3c-b82c-b2df7ea94ecf', '44', 'CAM/XANH', 10, 'src/data/images/products/main_5bf0b2b6.jpg'),
('a88d6cda-66a9-46ba-92b9-13ffc652613a', '62cb5985-d4e5-4a3c-b82c-b2df7ea94ecf', '45', 'CAM/XANH', 10, 'src/data/images/products/main_5bf0b2b6.jpg'),
('7919ac32-3902-4bda-aa44-110b88bf9bbc', '988df8e0-62a9-4154-9eac-69a2c6b7534b', '38', 'VÀNG CAM', 10, 'src/data/images/products/main_0022471f.jpg'),
('40ce0ef8-0acd-4fb6-a07b-6be9a5525584', '988df8e0-62a9-4154-9eac-69a2c6b7534b', '39', 'VÀNG CAM', 10, 'src/data/images/products/main_0022471f.jpg'),
('20a3d7d2-ad10-4158-9096-b2f24428a25b', '988df8e0-62a9-4154-9eac-69a2c6b7534b', '40', 'VÀNG CAM', 10, 'src/data/images/products/main_0022471f.jpg'),
('3bebe87b-862f-4634-ad37-df023a03358c', '988df8e0-62a9-4154-9eac-69a2c6b7534b', '41', 'VÀNG CAM', 10, 'src/data/images/products/main_0022471f.jpg'),
('d457f27a-530e-4696-97cd-873b8776e79e', '988df8e0-62a9-4154-9eac-69a2c6b7534b', '42', 'VÀNG CAM', 10, 'src/data/images/products/main_0022471f.jpg'),
('10ed15f7-e63f-4442-8dc9-8b055fea6f60', '988df8e0-62a9-4154-9eac-69a2c6b7534b', '43', 'VÀNG CAM', 10, 'src/data/images/products/main_0022471f.jpg'),
('da625405-dc00-43bd-be52-cf5ccb3c10f9', '988df8e0-62a9-4154-9eac-69a2c6b7534b', '44', 'VÀNG CAM', 10, 'src/data/images/products/main_0022471f.jpg'),
('c34b4e76-c514-41dc-b4ce-6001d11fd442', '988df8e0-62a9-4154-9eac-69a2c6b7534b', '45', 'VÀNG CAM', 10, 'src/data/images/products/main_0022471f.jpg'),
('6a8809f5-8b94-4378-b3df-6d996ff10693', '02c24ee2-a298-46cd-ba30-65458a230ffd', '38', 'TÍM/TRẮNG', 10, 'src/data/images/products/main_03244b33.jpg'),
('53b56d7f-5b04-4f93-a8a6-29704fbbe5f5', '02c24ee2-a298-46cd-ba30-65458a230ffd', '39', 'TÍM/TRẮNG', 10, 'src/data/images/products/main_03244b33.jpg'),
('1e6238c6-aa69-4dae-ab6d-08e00e384b2f', '02c24ee2-a298-46cd-ba30-65458a230ffd', '40', 'TÍM/TRẮNG', 10, 'src/data/images/products/main_03244b33.jpg'),
('d39a4446-a480-434a-889f-2443d2a71882', '02c24ee2-a298-46cd-ba30-65458a230ffd', '41', 'TÍM/TRẮNG', 10, 'src/data/images/products/main_03244b33.jpg'),
('09878c2d-0172-462d-8b73-80e088a103bf', '02c24ee2-a298-46cd-ba30-65458a230ffd', '42', 'TÍM/TRẮNG', 10, 'src/data/images/products/main_03244b33.jpg'),
('aadd15b9-d8e7-41fb-bb03-373061cc86d5', '02c24ee2-a298-46cd-ba30-65458a230ffd', '43', 'TÍM/TRẮNG', 10, 'src/data/images/products/main_03244b33.jpg'),
('0289b1f5-108e-4e8c-8359-62501bc419d5', '02c24ee2-a298-46cd-ba30-65458a230ffd', '44', 'TÍM/TRẮNG', 10, 'src/data/images/products/main_03244b33.jpg'),
('20e23f33-e370-4ab3-be8d-9599793cbda3', '02c24ee2-a298-46cd-ba30-65458a230ffd', '45', 'TÍM/TRẮNG', 10, 'src/data/images/products/main_03244b33.jpg'),
('91cc76ce-8ea4-4aeb-81e7-2911ea6b3fbf', '562e948c-5544-4558-b3f0-499aa0477233', '38', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_7dc30339.jpg'),
('d74be5d3-6f0a-4684-8ee0-b0a1b3f664d7', '562e948c-5544-4558-b3f0-499aa0477233', '39', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_7dc30339.jpg'),
('3bff0470-9176-41bc-90bc-1fc570ee8e08', '562e948c-5544-4558-b3f0-499aa0477233', '40', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_7dc30339.jpg'),
('d466d7ab-67ae-4c8e-a11d-e8c30a10140c', '562e948c-5544-4558-b3f0-499aa0477233', '41', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_7dc30339.jpg'),
('712c776a-b488-4063-9e09-4eea0188748c', '562e948c-5544-4558-b3f0-499aa0477233', '42', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_7dc30339.jpg'),
('b57b9bd9-41c2-4ac2-a5a3-6ba28bb69e9f', '562e948c-5544-4558-b3f0-499aa0477233', '43', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_7dc30339.jpg'),
('ee5a9c42-37b4-4359-9f4c-c31335b1a3a8', '562e948c-5544-4558-b3f0-499aa0477233', '44', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_7dc30339.jpg'),
('f44c77d8-2ad2-4f18-9a3a-4d31611fac8b', '562e948c-5544-4558-b3f0-499aa0477233', '45', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_7dc30339.jpg'),
('26653ec4-a12d-4a1d-a962-1651d99c639e', '8ca8d298-53b2-4e32-a5c5-78fc31822cbe', '38', 'XANH/TRẮNG', 10, 'src/data/images/products/main_b91627b0.jpg'),
('1f539a2d-32b3-44e5-8eeb-d2061f97d690', '8ca8d298-53b2-4e32-a5c5-78fc31822cbe', '39', 'XANH/TRẮNG', 10, 'src/data/images/products/main_b91627b0.jpg'),
('deed97c3-923d-48f2-b383-9b9c46c17144', '8ca8d298-53b2-4e32-a5c5-78fc31822cbe', '40', 'XANH/TRẮNG', 10, 'src/data/images/products/main_b91627b0.jpg'),
('4ffbe0d0-f0b9-4249-84a3-17143945fad5', '8ca8d298-53b2-4e32-a5c5-78fc31822cbe', '41', 'XANH/TRẮNG', 10, 'src/data/images/products/main_b91627b0.jpg'),
('8333b813-2a05-491b-b7c7-6f9708386e1b', '8ca8d298-53b2-4e32-a5c5-78fc31822cbe', '42', 'XANH/TRẮNG', 10, 'src/data/images/products/main_b91627b0.jpg'),
('2a24bb5a-d31c-450e-bcb8-6d349f4d3da3', '8ca8d298-53b2-4e32-a5c5-78fc31822cbe', '43', 'XANH/TRẮNG', 10, 'src/data/images/products/main_b91627b0.jpg'),
('703919ef-6034-4ec8-9d12-da47008566bd', '8ca8d298-53b2-4e32-a5c5-78fc31822cbe', '44', 'XANH/TRẮNG', 10, 'src/data/images/products/main_b91627b0.jpg'),
('3c2d17d3-00f9-4ed4-8a70-c4420ffc2c22', '8ca8d298-53b2-4e32-a5c5-78fc31822cbe', '45', 'XANH/TRẮNG', 10, 'src/data/images/products/main_b91627b0.jpg'),
('2f26f8ae-0889-4a55-87b4-e53e4ce72361', '8ef7edf4-3389-464a-9c74-6f38a60da212', '38', 'VÀNG/TRẮNG', 10, 'src/data/images/products/main_8a8e0e59.jpg'),
('2421a46d-f311-42b1-ad67-0ba00816e1c6', '8ef7edf4-3389-464a-9c74-6f38a60da212', '39', 'VÀNG/TRẮNG', 10, 'src/data/images/products/main_8a8e0e59.jpg'),
('78fd522f-c3b7-48ac-94b2-366c74ecb7c3', '8ef7edf4-3389-464a-9c74-6f38a60da212', '40', 'VÀNG/TRẮNG', 10, 'src/data/images/products/main_8a8e0e59.jpg'),
('bcd4df22-a79f-4f37-b742-32a1b3f84526', '8ef7edf4-3389-464a-9c74-6f38a60da212', '41', 'VÀNG/TRẮNG', 10, 'src/data/images/products/main_8a8e0e59.jpg'),
('3accdf93-a4a4-4777-8d17-a38557e21f1f', '8ef7edf4-3389-464a-9c74-6f38a60da212', '42', 'VÀNG/TRẮNG', 10, 'src/data/images/products/main_8a8e0e59.jpg'),
('37e33085-87cc-49a0-97b6-d7baba46abba', '8ef7edf4-3389-464a-9c74-6f38a60da212', '43', 'VÀNG/TRẮNG', 10, 'src/data/images/products/main_8a8e0e59.jpg'),
('0dd73441-2fbd-411b-938a-eb761595155d', '8ef7edf4-3389-464a-9c74-6f38a60da212', '44', 'VÀNG/TRẮNG', 10, 'src/data/images/products/main_8a8e0e59.jpg'),
('43500bc7-49ec-4095-83c2-b7b6c253ea23', '8ef7edf4-3389-464a-9c74-6f38a60da212', '45', 'VÀNG/TRẮNG', 10, 'src/data/images/products/main_8a8e0e59.jpg'),
('ab4f09e6-d7c9-49dd-9f22-829023c02086', '0c164235-8cf8-4251-9b10-3e6d24b46b1d', '38', 'XANH CHUỐI', 10, 'src/data/images/products/main_9d71b4f1.jpg'),
('f55cdef2-0738-439d-8afc-266fc5d8d715', '0c164235-8cf8-4251-9b10-3e6d24b46b1d', '39', 'XANH CHUỐI', 10, 'src/data/images/products/main_9d71b4f1.jpg'),
('5e4ae884-38e4-4533-9230-aaaee2be2298', '0c164235-8cf8-4251-9b10-3e6d24b46b1d', '40', 'XANH CHUỐI', 10, 'src/data/images/products/main_9d71b4f1.jpg'),
('a653db7a-40ac-438a-bcb0-d6191dc68071', '0c164235-8cf8-4251-9b10-3e6d24b46b1d', '41', 'XANH CHUỐI', 10, 'src/data/images/products/main_9d71b4f1.jpg'),
('9ba31af5-9238-4b04-973e-7a53dea747f6', '0c164235-8cf8-4251-9b10-3e6d24b46b1d', '42', 'XANH CHUỐI', 10, 'src/data/images/products/main_9d71b4f1.jpg'),
('8b1a17de-e62b-40e5-8456-f4620d4d5c2d', '0c164235-8cf8-4251-9b10-3e6d24b46b1d', '43', 'XANH CHUỐI', 10, 'src/data/images/products/main_9d71b4f1.jpg'),
('63e577ae-fce2-463a-b383-67b6dd26e690', '0c164235-8cf8-4251-9b10-3e6d24b46b1d', '44', 'XANH CHUỐI', 10, 'src/data/images/products/main_9d71b4f1.jpg'),
('9d745c33-cde2-4d41-8a42-53e50b618937', '0c164235-8cf8-4251-9b10-3e6d24b46b1d', '45', 'XANH CHUỐI', 10, 'src/data/images/products/main_9d71b4f1.jpg'),
('cbf3e8d2-6d35-42ed-a3e8-99ff2e331ac6', '066685e7-f927-48f8-855e-646373d387f0', '38', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_356427eb.jpg'),
('60b9a7c5-80c6-485c-bdf5-7553c0159c65', '066685e7-f927-48f8-855e-646373d387f0', '39', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_356427eb.jpg'),
('b27837ad-c367-4e2f-98c7-d5d5881e91d0', '066685e7-f927-48f8-855e-646373d387f0', '40', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_356427eb.jpg'),
('abbc74c1-fcd6-4c37-aeb3-cd8dd8616174', '066685e7-f927-48f8-855e-646373d387f0', '41', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_356427eb.jpg'),
('58b91026-8a36-46a6-bf74-e72b175be7ac', '066685e7-f927-48f8-855e-646373d387f0', '42', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_356427eb.jpg'),
('270effe0-917b-4fb3-9bcb-a5cacbefdcba', '066685e7-f927-48f8-855e-646373d387f0', '43', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_356427eb.jpg'),
('6aba9d1d-9e43-4d78-8b15-7d2f069cbb1e', '066685e7-f927-48f8-855e-646373d387f0', '44', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_356427eb.jpg'),
('d7231f61-96e0-4f05-b6a8-73e115220ba5', '066685e7-f927-48f8-855e-646373d387f0', '45', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_356427eb.jpg'),
('64006e97-85e1-4a08-ac33-d9b69600cffc', '27d7c8bf-b1df-49d0-821e-c9032ca11562', '38', 'ĐEN', 10, 'src/data/images/products/main_b8ccdb99.jpg'),
('2753eb0e-8db6-48bf-b0f2-cbec1afbc4c7', '27d7c8bf-b1df-49d0-821e-c9032ca11562', '39', 'ĐEN', 10, 'src/data/images/products/main_b8ccdb99.jpg'),
('1ecd7676-90d5-4537-acc7-87668376c5c3', '27d7c8bf-b1df-49d0-821e-c9032ca11562', '40', 'ĐEN', 10, 'src/data/images/products/main_b8ccdb99.jpg'),
('bbb9cbe6-63c0-4b09-9bcd-8f37c2116558', '27d7c8bf-b1df-49d0-821e-c9032ca11562', '41', 'ĐEN', 10, 'src/data/images/products/main_b8ccdb99.jpg'),
('78c71874-c7fd-464c-9a9d-12b1baa880cb', '27d7c8bf-b1df-49d0-821e-c9032ca11562', '42', 'ĐEN', 10, 'src/data/images/products/main_b8ccdb99.jpg'),
('112eed67-f59c-4454-a318-5b7843c0b66d', '27d7c8bf-b1df-49d0-821e-c9032ca11562', '43', 'ĐEN', 10, 'src/data/images/products/main_b8ccdb99.jpg'),
('4d972885-7703-4467-a8b4-27c19dddb542', '27d7c8bf-b1df-49d0-821e-c9032ca11562', '44', 'ĐEN', 10, 'src/data/images/products/main_b8ccdb99.jpg'),
('c8fdea5a-1a3b-450a-b014-cbff99373cd6', '27d7c8bf-b1df-49d0-821e-c9032ca11562', '45', 'ĐEN', 10, 'src/data/images/products/main_b8ccdb99.jpg'),
('7d4486df-981b-434f-ada6-297f674fe367', '89004167-fe6d-4b35-af2f-64ee7c0396ba', '38', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_be2beed5.jpg'),
('98cb527b-d47c-4e71-aac9-8c7db3b867ae', '89004167-fe6d-4b35-af2f-64ee7c0396ba', '39', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_be2beed5.jpg'),
('03d1f554-b76d-4055-9c0f-7d1753596ef7', '89004167-fe6d-4b35-af2f-64ee7c0396ba', '40', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_be2beed5.jpg'),
('8053794c-50e1-4f90-9f3f-f86aebfb54a8', '89004167-fe6d-4b35-af2f-64ee7c0396ba', '41', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_be2beed5.jpg'),
('58d97a67-6dbd-4e71-80d4-4033aa2ac520', '89004167-fe6d-4b35-af2f-64ee7c0396ba', '42', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_be2beed5.jpg'),
('00ef985e-d1cf-4bcc-9f8e-9485b5756b51', '89004167-fe6d-4b35-af2f-64ee7c0396ba', '43', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_be2beed5.jpg'),
('ec008ec2-018a-43ce-a793-02b11633896f', '89004167-fe6d-4b35-af2f-64ee7c0396ba', '44', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_be2beed5.jpg'),
('0234207e-b57b-43b3-9ad8-a84d4b2d5531', '89004167-fe6d-4b35-af2f-64ee7c0396ba', '45', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_be2beed5.jpg'),
('4d1a5b38-4926-49f6-9136-4f873e345035', 'cc19c7a8-8610-4e02-8a71-97cdf7162df4', '38', 'BẠC/VÀNG', 10, 'src/data/images/products/main_31ba942c.jpg'),
('11b85204-7750-4293-b5a5-c396eba8fce1', 'cc19c7a8-8610-4e02-8a71-97cdf7162df4', '39', 'BẠC/VÀNG', 10, 'src/data/images/products/main_31ba942c.jpg'),
('9a31673a-b448-4619-bed1-6a9e9706dc84', 'cc19c7a8-8610-4e02-8a71-97cdf7162df4', '40', 'BẠC/VÀNG', 10, 'src/data/images/products/main_31ba942c.jpg'),
('e7838a95-ea02-47c1-b483-de99d78e14d9', 'cc19c7a8-8610-4e02-8a71-97cdf7162df4', '41', 'BẠC/VÀNG', 10, 'src/data/images/products/main_31ba942c.jpg'),
('0cd8f298-319b-4a7d-9197-44cd3aac5770', 'cc19c7a8-8610-4e02-8a71-97cdf7162df4', '42', 'BẠC/VÀNG', 10, 'src/data/images/products/main_31ba942c.jpg'),
('ce41dc8a-7b07-4984-b4f1-05ec5f557004', 'cc19c7a8-8610-4e02-8a71-97cdf7162df4', '43', 'BẠC/VÀNG', 10, 'src/data/images/products/main_31ba942c.jpg'),
('e47cc059-098c-473a-9075-c025dba998fd', 'cc19c7a8-8610-4e02-8a71-97cdf7162df4', '44', 'BẠC/VÀNG', 10, 'src/data/images/products/main_31ba942c.jpg'),
('bcf990a6-08ea-44e2-a2a2-ee5be252b64d', 'cc19c7a8-8610-4e02-8a71-97cdf7162df4', '45', 'BẠC/VÀNG', 10, 'src/data/images/products/main_31ba942c.jpg');

INSERT INTO product_variants (variant_id, product_id, size, color, stock, image_url) VALUES
('00ed627f-9586-4545-bfba-ea12887cbd23', '863f94c5-717b-4f43-afa5-eeffbaf73528', '38', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_b4909833.jpg'),
('8576b1bd-d5b5-432a-b2c1-867aae989906', '863f94c5-717b-4f43-afa5-eeffbaf73528', '39', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_b4909833.jpg'),
('d5733f95-6a85-439d-b06a-fbd01f2cca14', '863f94c5-717b-4f43-afa5-eeffbaf73528', '40', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_b4909833.jpg'),
('61b9b6f4-eb63-4c9e-9bc3-bfd083642f7b', '863f94c5-717b-4f43-afa5-eeffbaf73528', '41', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_b4909833.jpg'),
('43012695-673c-4253-bdb0-94556f3fc9f8', '863f94c5-717b-4f43-afa5-eeffbaf73528', '42', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_b4909833.jpg'),
('ac923c3a-ab29-4725-8a55-0981f895e36c', '863f94c5-717b-4f43-afa5-eeffbaf73528', '43', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_b4909833.jpg'),
('089478c8-84d9-45ef-9e0e-8b65377fc814', '863f94c5-717b-4f43-afa5-eeffbaf73528', '44', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_b4909833.jpg'),
('0c2f55fc-4189-4930-90c3-5127b936eeb6', '863f94c5-717b-4f43-afa5-eeffbaf73528', '45', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_b4909833.jpg'),
('98ae421b-fae7-4e6a-8fce-0951f36899ba', '450ce6b7-737b-4567-a93a-28ac5e818269', '38', 'XANH NGỌC', 10, 'src/data/images/products/main_b1c8dd00.jpg'),
('970fd90f-22a6-49ef-b061-b1fcccad5a5b', '450ce6b7-737b-4567-a93a-28ac5e818269', '39', 'XANH NGỌC', 10, 'src/data/images/products/main_b1c8dd00.jpg'),
('8c9b0e88-84c4-4284-99ec-ce54426df5ba', '450ce6b7-737b-4567-a93a-28ac5e818269', '40', 'XANH NGỌC', 10, 'src/data/images/products/main_b1c8dd00.jpg'),
('9f0c998e-2441-4339-88bb-eaeb4dc093e6', '450ce6b7-737b-4567-a93a-28ac5e818269', '41', 'XANH NGỌC', 10, 'src/data/images/products/main_b1c8dd00.jpg'),
('0c35c1c2-18c9-4745-98e2-355807df4519', '450ce6b7-737b-4567-a93a-28ac5e818269', '42', 'XANH NGỌC', 10, 'src/data/images/products/main_b1c8dd00.jpg'),
('19bbb1d8-7336-4e25-b12f-5c99aaa49253', '450ce6b7-737b-4567-a93a-28ac5e818269', '43', 'XANH NGỌC', 10, 'src/data/images/products/main_b1c8dd00.jpg'),
('9a5598a5-eb6f-403f-8e23-cac4f65d99d3', '450ce6b7-737b-4567-a93a-28ac5e818269', '44', 'XANH NGỌC', 10, 'src/data/images/products/main_b1c8dd00.jpg'),
('8c7e4ba9-8012-457e-90b5-a682ca0597ef', '450ce6b7-737b-4567-a93a-28ac5e818269', '45', 'XANH NGỌC', 10, 'src/data/images/products/main_b1c8dd00.jpg'),
('34a3859c-fb5a-477f-a1cf-43c27e995b7b', 'e4d2a08c-0538-44d4-b3c1-e33302ef6b0c', '38', 'TRẮNG/VÀNG CHANH', 10, 'src/data/images/products/main_2d8422a2.jpg'),
('d4459f4b-59a4-482a-9070-e59f05af96e3', 'e4d2a08c-0538-44d4-b3c1-e33302ef6b0c', '39', 'TRẮNG/VÀNG CHANH', 10, 'src/data/images/products/main_2d8422a2.jpg'),
('4c424727-4ba2-4c24-b2f2-618bd89f46da', 'e4d2a08c-0538-44d4-b3c1-e33302ef6b0c', '40', 'TRẮNG/VÀNG CHANH', 10, 'src/data/images/products/main_2d8422a2.jpg'),
('f6a2a644-1304-428c-9eca-17c45664d366', 'e4d2a08c-0538-44d4-b3c1-e33302ef6b0c', '41', 'TRẮNG/VÀNG CHANH', 10, 'src/data/images/products/main_2d8422a2.jpg'),
('baa6c4a7-c9c9-4a9f-a7f1-6953b178f52a', 'e4d2a08c-0538-44d4-b3c1-e33302ef6b0c', '42', 'TRẮNG/VÀNG CHANH', 10, 'src/data/images/products/main_2d8422a2.jpg'),
('233da3c8-1437-4c8a-a4ae-0dae41840d3c', 'e4d2a08c-0538-44d4-b3c1-e33302ef6b0c', '43', 'TRẮNG/VÀNG CHANH', 10, 'src/data/images/products/main_2d8422a2.jpg'),
('8568335d-bdc8-43ac-8dec-5ad6defcd7bd', 'e4d2a08c-0538-44d4-b3c1-e33302ef6b0c', '44', 'TRẮNG/VÀNG CHANH', 10, 'src/data/images/products/main_2d8422a2.jpg'),
('c75fb156-927b-4312-b878-349539d2cc2d', 'e4d2a08c-0538-44d4-b3c1-e33302ef6b0c', '45', 'TRẮNG/VÀNG CHANH', 10, 'src/data/images/products/main_2d8422a2.jpg'),
('df2d1b66-eaa0-4e4f-862f-550f75f7e156', '7a5791af-c86f-4b9a-bd88-77aa44df640a', '38', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_4d05d012.jpg'),
('17faac87-9c0b-4405-847a-f0a5a9991ce0', '7a5791af-c86f-4b9a-bd88-77aa44df640a', '39', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_4d05d012.jpg'),
('582adeb5-2a17-4892-a176-ac746fb2664a', '7a5791af-c86f-4b9a-bd88-77aa44df640a', '40', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_4d05d012.jpg'),
('092241fc-f2b8-462e-aaaa-ba61f4fe6699', '7a5791af-c86f-4b9a-bd88-77aa44df640a', '41', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_4d05d012.jpg'),
('7e67d875-050a-49bb-9822-684a3d00a5b5', '7a5791af-c86f-4b9a-bd88-77aa44df640a', '42', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_4d05d012.jpg'),
('509e9f4f-97ad-47e7-aca9-31d848db8197', '7a5791af-c86f-4b9a-bd88-77aa44df640a', '43', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_4d05d012.jpg'),
('f605ba48-a3ac-4675-8522-451a28524bd9', '7a5791af-c86f-4b9a-bd88-77aa44df640a', '44', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_4d05d012.jpg'),
('4b5e7056-2bef-4d7b-8468-6f5477d9a811', '7a5791af-c86f-4b9a-bd88-77aa44df640a', '45', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_4d05d012.jpg'),
('074cd9a8-d16b-467a-a345-8eb4b1906c2d', '821cd901-cf07-468c-89d6-f7e38411a6ac', '38', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_aef34fa4.jpg'),
('728f8c9d-6e30-40aa-8e98-30d37dbbe664', '821cd901-cf07-468c-89d6-f7e38411a6ac', '39', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_aef34fa4.jpg'),
('7d1fb9f0-19be-4eec-a955-89be77f18122', '821cd901-cf07-468c-89d6-f7e38411a6ac', '40', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_aef34fa4.jpg'),
('a2f9b8e5-d287-4790-a692-78e05941e259', '821cd901-cf07-468c-89d6-f7e38411a6ac', '41', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_aef34fa4.jpg'),
('4ca7e208-d381-4f9e-9d39-f5727d4c6e1b', '821cd901-cf07-468c-89d6-f7e38411a6ac', '42', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_aef34fa4.jpg'),
('a614ad6e-234e-45bc-b11c-0373303eee7a', '821cd901-cf07-468c-89d6-f7e38411a6ac', '43', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_aef34fa4.jpg'),
('42bde927-1be7-48f5-90be-bc66abbd7f33', '821cd901-cf07-468c-89d6-f7e38411a6ac', '44', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_aef34fa4.jpg'),
('fdc343c0-4dbd-4f19-b59a-b2193d87df94', '821cd901-cf07-468c-89d6-f7e38411a6ac', '45', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_aef34fa4.jpg'),
('3806fe9a-934b-4eaa-9ce7-3271244263fd', '9a869428-39ac-4985-922e-8840dc8bc211', '38', 'CAM/VÀNG', 10, 'src/data/images/products/main_ff05cbe1.jpg'),
('ff324fc3-f18b-47e9-8b5c-6433a8287a01', '9a869428-39ac-4985-922e-8840dc8bc211', '39', 'CAM/VÀNG', 10, 'src/data/images/products/main_ff05cbe1.jpg'),
('f9778c24-3f9a-4cee-8717-c8076c423ee5', '9a869428-39ac-4985-922e-8840dc8bc211', '40', 'CAM/VÀNG', 10, 'src/data/images/products/main_ff05cbe1.jpg'),
('319ab6cb-08ab-419c-bb78-7ec3e5bb2019', '9a869428-39ac-4985-922e-8840dc8bc211', '41', 'CAM/VÀNG', 10, 'src/data/images/products/main_ff05cbe1.jpg'),
('2c2d6231-90b5-44c3-81b9-3c2a7d998382', '9a869428-39ac-4985-922e-8840dc8bc211', '42', 'CAM/VÀNG', 10, 'src/data/images/products/main_ff05cbe1.jpg'),
('82c6d0c7-a6e0-419e-8244-18977efe5308', '9a869428-39ac-4985-922e-8840dc8bc211', '43', 'CAM/VÀNG', 10, 'src/data/images/products/main_ff05cbe1.jpg'),
('a33db536-bba3-4865-b35f-63c229253a62', '9a869428-39ac-4985-922e-8840dc8bc211', '44', 'CAM/VÀNG', 10, 'src/data/images/products/main_ff05cbe1.jpg'),
('d0fb96ae-3aa9-4057-8e8a-b36244d07681', '9a869428-39ac-4985-922e-8840dc8bc211', '45', 'CAM/VÀNG', 10, 'src/data/images/products/main_ff05cbe1.jpg'),
('a37bb536-4d38-4e49-8afc-167ca8ce419b', 'ec984e74-8405-4b08-8304-d3a5a97eebab', '38', 'ĐEN/XANH', 10, 'src/data/images/products/main_7e4bd587.jpg'),
('d5259ce4-3c5c-4969-adf1-4826d905fe51', 'ec984e74-8405-4b08-8304-d3a5a97eebab', '39', 'ĐEN/XANH', 10, 'src/data/images/products/main_7e4bd587.jpg'),
('be0fe31f-1826-4902-b30e-c44ebe47f0b2', 'ec984e74-8405-4b08-8304-d3a5a97eebab', '40', 'ĐEN/XANH', 10, 'src/data/images/products/main_7e4bd587.jpg'),
('41c77252-05bb-4715-b718-2ecbb5b34637', 'ec984e74-8405-4b08-8304-d3a5a97eebab', '41', 'ĐEN/XANH', 10, 'src/data/images/products/main_7e4bd587.jpg'),
('89c15afb-40ce-4230-9e40-5cd4460c23af', 'ec984e74-8405-4b08-8304-d3a5a97eebab', '42', 'ĐEN/XANH', 10, 'src/data/images/products/main_7e4bd587.jpg'),
('5f8e6c8f-ab76-4509-a8fd-815993345720', 'ec984e74-8405-4b08-8304-d3a5a97eebab', '43', 'ĐEN/XANH', 10, 'src/data/images/products/main_7e4bd587.jpg'),
('4477454f-8bc2-445f-9990-ae6d12e11ff8', 'ec984e74-8405-4b08-8304-d3a5a97eebab', '44', 'ĐEN/XANH', 10, 'src/data/images/products/main_7e4bd587.jpg'),
('7a855e06-e35e-4c98-80c5-73bc175fe601', 'ec984e74-8405-4b08-8304-d3a5a97eebab', '45', 'ĐEN/XANH', 10, 'src/data/images/products/main_7e4bd587.jpg'),
('16eed47e-e7a4-47c8-8280-cd4d32452544', '1dbd74f4-8f3e-4862-bbd4-fd4b9bb99b03', '38', 'TÍM THAN', 10, 'src/data/images/products/main_93c71958.jpg'),
('b9ce6f7a-3e1d-4ac1-881f-765466e03814', '1dbd74f4-8f3e-4862-bbd4-fd4b9bb99b03', '39', 'TÍM THAN', 10, 'src/data/images/products/main_93c71958.jpg'),
('d5a1b86f-ae6e-4c51-aff6-d3f9bd95381d', '1dbd74f4-8f3e-4862-bbd4-fd4b9bb99b03', '40', 'TÍM THAN', 10, 'src/data/images/products/main_93c71958.jpg'),
('8d3ba6a7-c37a-4c15-8ebf-3bd1598fc624', '1dbd74f4-8f3e-4862-bbd4-fd4b9bb99b03', '41', 'TÍM THAN', 10, 'src/data/images/products/main_93c71958.jpg'),
('c5bc10fa-c762-450f-9ab6-1dcb0fe6ce4a', '1dbd74f4-8f3e-4862-bbd4-fd4b9bb99b03', '42', 'TÍM THAN', 10, 'src/data/images/products/main_93c71958.jpg'),
('34644185-3037-402e-bb42-58ba631bcd33', '1dbd74f4-8f3e-4862-bbd4-fd4b9bb99b03', '43', 'TÍM THAN', 10, 'src/data/images/products/main_93c71958.jpg'),
('b05de17e-f7cb-4223-b927-6a0168b19558', '1dbd74f4-8f3e-4862-bbd4-fd4b9bb99b03', '44', 'TÍM THAN', 10, 'src/data/images/products/main_93c71958.jpg'),
('b5b63ecc-fbe8-408d-8295-c701556eb29d', '1dbd74f4-8f3e-4862-bbd4-fd4b9bb99b03', '45', 'TÍM THAN', 10, 'src/data/images/products/main_93c71958.jpg'),
('fa683875-b050-4b74-a9bc-80dac84b8f13', '7c029534-8ad6-4ba8-a605-046b4b420b3f', '38', 'XANH NHẠT', 10, 'src/data/images/products/main_3bfd3155.jpg'),
('64d3cc7f-d5c8-4bcc-9908-543e88e601b3', '7c029534-8ad6-4ba8-a605-046b4b420b3f', '39', 'XANH NHẠT', 10, 'src/data/images/products/main_3bfd3155.jpg'),
('0066a54e-e257-4607-a437-d3faac799b50', '7c029534-8ad6-4ba8-a605-046b4b420b3f', '40', 'XANH NHẠT', 10, 'src/data/images/products/main_3bfd3155.jpg'),
('72d47586-d4c9-4935-85ba-238dc96eb4ed', '7c029534-8ad6-4ba8-a605-046b4b420b3f', '41', 'XANH NHẠT', 10, 'src/data/images/products/main_3bfd3155.jpg'),
('209dade8-6699-40c0-aa63-1439d1ecd2c0', '7c029534-8ad6-4ba8-a605-046b4b420b3f', '42', 'XANH NHẠT', 10, 'src/data/images/products/main_3bfd3155.jpg'),
('92c96504-2fce-4137-927e-b39b43f11366', '7c029534-8ad6-4ba8-a605-046b4b420b3f', '43', 'XANH NHẠT', 10, 'src/data/images/products/main_3bfd3155.jpg'),
('159f91ff-a88f-4266-899a-cc8f1a06edb1', '7c029534-8ad6-4ba8-a605-046b4b420b3f', '44', 'XANH NHẠT', 10, 'src/data/images/products/main_3bfd3155.jpg'),
('b2e41642-d5ce-4ccf-814b-3ace9b85e433', '7c029534-8ad6-4ba8-a605-046b4b420b3f', '45', 'XANH NHẠT', 10, 'src/data/images/products/main_3bfd3155.jpg'),
('80f7289a-ae0e-4beb-bb7a-baca250666a3', 'fdbba3ca-62db-4b3b-91be-21ad403b4494', '38', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_19d27bfd.jpg'),
('3e194241-ce63-43fe-b289-72cbf3d83cf2', 'fdbba3ca-62db-4b3b-91be-21ad403b4494', '39', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_19d27bfd.jpg'),
('a35b5b73-ad48-46f4-95e5-20631d38d458', 'fdbba3ca-62db-4b3b-91be-21ad403b4494', '40', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_19d27bfd.jpg'),
('c7f677d7-b354-4177-9b47-b7033ae92c04', 'fdbba3ca-62db-4b3b-91be-21ad403b4494', '41', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_19d27bfd.jpg'),
('a2b23bcc-31be-42ae-a358-39ca9dd4a943', 'fdbba3ca-62db-4b3b-91be-21ad403b4494', '42', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_19d27bfd.jpg'),
('0aae4021-675e-4eda-b928-ded9500d1fc3', 'fdbba3ca-62db-4b3b-91be-21ad403b4494', '43', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_19d27bfd.jpg'),
('b88c676b-7224-4f59-9ebd-92f59d2179ac', 'fdbba3ca-62db-4b3b-91be-21ad403b4494', '44', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_19d27bfd.jpg'),
('56b97512-71f7-44ac-8513-9400ef5bab60', 'fdbba3ca-62db-4b3b-91be-21ad403b4494', '45', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_19d27bfd.jpg'),
('52fce2cd-e06c-4ea5-9658-e2f3e500c01c', 'e0439838-031e-4a77-bced-af28f9629276', '38', 'BẠC', 10, 'src/data/images/products/main_1cdf7042.jpg'),
('d84a535b-c8be-4a11-b6da-c0f87362138a', 'e0439838-031e-4a77-bced-af28f9629276', '39', 'BẠC', 10, 'src/data/images/products/main_1cdf7042.jpg'),
('9e4b20c8-a065-47f5-bc3c-9aacb5e0e385', 'e0439838-031e-4a77-bced-af28f9629276', '40', 'BẠC', 10, 'src/data/images/products/main_1cdf7042.jpg'),
('08d0f9f0-371d-4c92-8c7b-7d7b5503d69d', 'e0439838-031e-4a77-bced-af28f9629276', '41', 'BẠC', 10, 'src/data/images/products/main_1cdf7042.jpg'),
('de78dc26-8077-4dcf-b199-cce1f7cc723e', 'e0439838-031e-4a77-bced-af28f9629276', '42', 'BẠC', 10, 'src/data/images/products/main_1cdf7042.jpg'),
('b4e204d5-f1d3-45ae-bdb7-6906f3acda30', 'e0439838-031e-4a77-bced-af28f9629276', '43', 'BẠC', 10, 'src/data/images/products/main_1cdf7042.jpg'),
('9a69bbad-9bd7-4457-a36c-eb76377b3387', 'e0439838-031e-4a77-bced-af28f9629276', '44', 'BẠC', 10, 'src/data/images/products/main_1cdf7042.jpg'),
('d86af49b-f08b-45d4-9d99-74889790c6a8', 'e0439838-031e-4a77-bced-af28f9629276', '45', 'BẠC', 10, 'src/data/images/products/main_1cdf7042.jpg'),
('fb63030e-96f4-4766-a833-38ab1e57f233', '6d42c5a7-1041-407d-a9fa-52f6db685f33', '38', 'XANH TÍM/ĐỎ CAM', 10, 'src/data/images/products/main_cccc3f6d.jpg'),
('dcfba7cc-d182-463d-a00d-ec01c82e731a', '6d42c5a7-1041-407d-a9fa-52f6db685f33', '39', 'XANH TÍM/ĐỎ CAM', 10, 'src/data/images/products/main_cccc3f6d.jpg'),
('5494c212-706d-4b3d-881d-e6a67e3a0785', '6d42c5a7-1041-407d-a9fa-52f6db685f33', '40', 'XANH TÍM/ĐỎ CAM', 10, 'src/data/images/products/main_cccc3f6d.jpg'),
('7d029f40-15d3-40fa-a9a0-7700b5e2ff90', '6d42c5a7-1041-407d-a9fa-52f6db685f33', '41', 'XANH TÍM/ĐỎ CAM', 10, 'src/data/images/products/main_cccc3f6d.jpg'),
('821c7d73-5b93-4558-8fe3-ca3716f4c7a9', '6d42c5a7-1041-407d-a9fa-52f6db685f33', '42', 'XANH TÍM/ĐỎ CAM', 10, 'src/data/images/products/main_cccc3f6d.jpg'),
('108bb096-1a0d-423d-aedc-2ed9b4680311', '6d42c5a7-1041-407d-a9fa-52f6db685f33', '43', 'XANH TÍM/ĐỎ CAM', 10, 'src/data/images/products/main_cccc3f6d.jpg'),
('ce3af083-796b-4dad-b718-10b58e26f5cf', '6d42c5a7-1041-407d-a9fa-52f6db685f33', '44', 'XANH TÍM/ĐỎ CAM', 10, 'src/data/images/products/main_cccc3f6d.jpg'),
('a80944cb-9143-4130-a649-ed4495ff0ee4', '6d42c5a7-1041-407d-a9fa-52f6db685f33', '45', 'XANH TÍM/ĐỎ CAM', 10, 'src/data/images/products/main_cccc3f6d.jpg'),
('3e7ab7e5-af5a-4d65-a186-39456f4162b1', '3f00b2ac-3e5f-4a09-a59d-9efc0055b487', '38', 'VÀNG/CAM', 10, 'src/data/images/products/main_ecd9acdc.jpg'),
('3fdd4a52-3cbc-41ca-8045-8fb7a6b48775', '3f00b2ac-3e5f-4a09-a59d-9efc0055b487', '39', 'VÀNG/CAM', 10, 'src/data/images/products/main_ecd9acdc.jpg'),
('4424123a-7dac-41f2-93e6-26d22ca9154f', '3f00b2ac-3e5f-4a09-a59d-9efc0055b487', '40', 'VÀNG/CAM', 10, 'src/data/images/products/main_ecd9acdc.jpg'),
('b8b630a2-c7ca-4252-b88e-dd1da442e3e0', '3f00b2ac-3e5f-4a09-a59d-9efc0055b487', '41', 'VÀNG/CAM', 10, 'src/data/images/products/main_ecd9acdc.jpg');

INSERT INTO product_variants (variant_id, product_id, size, color, stock, image_url) VALUES
('0a65c5a2-87f3-4639-8647-3384891be7c4', '3f00b2ac-3e5f-4a09-a59d-9efc0055b487', '42', 'VÀNG/CAM', 10, 'src/data/images/products/main_ecd9acdc.jpg'),
('14011a4c-a72d-4229-86da-2b24c37b4fa8', '3f00b2ac-3e5f-4a09-a59d-9efc0055b487', '43', 'VÀNG/CAM', 10, 'src/data/images/products/main_ecd9acdc.jpg'),
('2dc2ac9a-e1c2-4389-a6c8-7a798495337d', '3f00b2ac-3e5f-4a09-a59d-9efc0055b487', '44', 'VÀNG/CAM', 10, 'src/data/images/products/main_ecd9acdc.jpg'),
('f0d76c8a-90df-4381-a9ea-102a83743625', '3f00b2ac-3e5f-4a09-a59d-9efc0055b487', '45', 'VÀNG/CAM', 10, 'src/data/images/products/main_ecd9acdc.jpg'),
('cd8dd2b6-858d-45e8-a59c-4f1cd6f6f919', 'feb174aa-441e-4e0b-92e4-0f830bd77c84', '38', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_929b8723.jpg'),
('81983e75-f033-43d6-9e47-1d46db56b8a1', 'feb174aa-441e-4e0b-92e4-0f830bd77c84', '39', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_929b8723.jpg'),
('b7437cb6-9a16-421c-88b4-f7f815cafba1', 'feb174aa-441e-4e0b-92e4-0f830bd77c84', '40', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_929b8723.jpg'),
('418d425a-7271-4dfa-8ffe-7a81a51f6629', 'feb174aa-441e-4e0b-92e4-0f830bd77c84', '41', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_929b8723.jpg'),
('8dacde03-abc6-431d-bcce-f36b9be4a84f', 'feb174aa-441e-4e0b-92e4-0f830bd77c84', '42', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_929b8723.jpg'),
('96f330e3-0e68-4443-8621-72c2f2be66c9', 'feb174aa-441e-4e0b-92e4-0f830bd77c84', '43', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_929b8723.jpg'),
('9502d737-a2be-4b43-877f-78097d582708', 'feb174aa-441e-4e0b-92e4-0f830bd77c84', '44', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_929b8723.jpg'),
('1f4d3ca5-dc51-4584-a6ce-73a761fafeb1', 'feb174aa-441e-4e0b-92e4-0f830bd77c84', '45', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_929b8723.jpg'),
('76eecfd9-db6c-461a-b375-59ac9aa8ad6d', 'e3d71ce9-8517-4ab2-a04a-3ac76197d622', '38', 'BẠC/VÀNG', 10, 'src/data/images/products/main_090ed3a9.jpg'),
('e5c12c59-a5d5-427b-bfd2-1df2ba022199', 'e3d71ce9-8517-4ab2-a04a-3ac76197d622', '39', 'BẠC/VÀNG', 10, 'src/data/images/products/main_090ed3a9.jpg'),
('391f3737-f1c0-43ea-8114-6a8ca13776e9', 'e3d71ce9-8517-4ab2-a04a-3ac76197d622', '40', 'BẠC/VÀNG', 10, 'src/data/images/products/main_090ed3a9.jpg'),
('00c760b6-1eba-4c2f-a249-bbc7a897a291', 'e3d71ce9-8517-4ab2-a04a-3ac76197d622', '41', 'BẠC/VÀNG', 10, 'src/data/images/products/main_090ed3a9.jpg'),
('f0897463-6422-4651-9628-64bbcdd4b474', 'e3d71ce9-8517-4ab2-a04a-3ac76197d622', '42', 'BẠC/VÀNG', 10, 'src/data/images/products/main_090ed3a9.jpg'),
('8b702521-6130-42d4-aafe-32211f7e4589', 'e3d71ce9-8517-4ab2-a04a-3ac76197d622', '43', 'BẠC/VÀNG', 10, 'src/data/images/products/main_090ed3a9.jpg'),
('4ff60d59-08d2-4b4c-afb8-bb3a0ec39249', 'e3d71ce9-8517-4ab2-a04a-3ac76197d622', '44', 'BẠC/VÀNG', 10, 'src/data/images/products/main_090ed3a9.jpg'),
('8dd40b8d-de91-4568-bbeb-1f2144df81dd', 'e3d71ce9-8517-4ab2-a04a-3ac76197d622', '45', 'BẠC/VÀNG', 10, 'src/data/images/products/main_090ed3a9.jpg'),
('97f4b7e7-a98a-4c6e-8d4f-15680d9dba46', '492de77b-f6ff-418b-83ff-71f0b39794c9', '38', 'XANH XÁM/ĐEN', 10, 'src/data/images/products/main_9b803360.jpg'),
('8dca31eb-0b3c-4abb-a351-cf9aacc88622', '492de77b-f6ff-418b-83ff-71f0b39794c9', '39', 'XANH XÁM/ĐEN', 10, 'src/data/images/products/main_9b803360.jpg'),
('3ca79579-2de8-4dbf-a09b-ca52d3672974', '492de77b-f6ff-418b-83ff-71f0b39794c9', '40', 'XANH XÁM/ĐEN', 10, 'src/data/images/products/main_9b803360.jpg'),
('81fc2e76-c53b-4c30-88cc-db72a0689516', '492de77b-f6ff-418b-83ff-71f0b39794c9', '41', 'XANH XÁM/ĐEN', 10, 'src/data/images/products/main_9b803360.jpg'),
('bedc1cf4-331d-473d-831a-d6ed037bf08e', '492de77b-f6ff-418b-83ff-71f0b39794c9', '42', 'XANH XÁM/ĐEN', 10, 'src/data/images/products/main_9b803360.jpg'),
('c620d8f1-125f-4a9b-929e-e6060cf72dac', '492de77b-f6ff-418b-83ff-71f0b39794c9', '43', 'XANH XÁM/ĐEN', 10, 'src/data/images/products/main_9b803360.jpg'),
('dc2739ba-0cb7-4d38-b2ca-d822600c2610', '492de77b-f6ff-418b-83ff-71f0b39794c9', '44', 'XANH XÁM/ĐEN', 10, 'src/data/images/products/main_9b803360.jpg'),
('adca5628-e487-4308-9daa-13ced364db2d', '492de77b-f6ff-418b-83ff-71f0b39794c9', '45', 'XANH XÁM/ĐEN', 10, 'src/data/images/products/main_9b803360.jpg'),
('dd41bc9d-e57f-4697-8dd1-37a48fa6c7e7', 'f50aeed0-5237-44fb-a90c-58f99c0c84f0', '38', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_61bcfdb5.jpg'),
('1f4b3d30-53f9-4ba5-b9c4-fd371ad7653e', 'f50aeed0-5237-44fb-a90c-58f99c0c84f0', '39', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_61bcfdb5.jpg'),
('665553ea-d32f-4f03-9875-aecd03ed6e0c', 'f50aeed0-5237-44fb-a90c-58f99c0c84f0', '40', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_61bcfdb5.jpg'),
('8c5bb3fc-58c2-43db-b7f6-984518dea95a', 'f50aeed0-5237-44fb-a90c-58f99c0c84f0', '41', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_61bcfdb5.jpg'),
('ce495914-6cf9-44e5-b1ab-ab57b9140366', 'f50aeed0-5237-44fb-a90c-58f99c0c84f0', '42', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_61bcfdb5.jpg'),
('4918f11b-628c-41a0-b4fa-0354ebd9ecbf', 'f50aeed0-5237-44fb-a90c-58f99c0c84f0', '43', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_61bcfdb5.jpg'),
('f2ef3458-1cae-4446-a1e5-3d1f42dcf6d0', 'f50aeed0-5237-44fb-a90c-58f99c0c84f0', '44', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_61bcfdb5.jpg'),
('5079436b-faf7-4e73-b635-f49ddf0671a3', 'f50aeed0-5237-44fb-a90c-58f99c0c84f0', '45', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_61bcfdb5.jpg'),
('14df01b7-9616-4e4e-8f64-fcd40e88ca0a', '7eba21c0-67e4-4322-9666-eb2172887cce', '38', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_30ab6020.jpg'),
('f49d5992-9634-4462-8f5e-01dd4ddbafcc', '7eba21c0-67e4-4322-9666-eb2172887cce', '39', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_30ab6020.jpg'),
('b600618f-7266-45dd-a5b4-083e0a52101e', '7eba21c0-67e4-4322-9666-eb2172887cce', '40', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_30ab6020.jpg'),
('d0cc1c23-c8d9-467e-9989-17c070e80297', '7eba21c0-67e4-4322-9666-eb2172887cce', '41', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_30ab6020.jpg'),
('7af0d5da-69ec-4b53-b4e4-9e7e349e21ca', '7eba21c0-67e4-4322-9666-eb2172887cce', '42', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_30ab6020.jpg'),
('f155cd18-35f2-4ce0-bb8b-55b4cebf3d5e', '7eba21c0-67e4-4322-9666-eb2172887cce', '43', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_30ab6020.jpg'),
('c080ac88-e960-46b4-b651-c9a219bcdd9f', '7eba21c0-67e4-4322-9666-eb2172887cce', '44', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_30ab6020.jpg'),
('782e9a2c-fa19-4098-b6eb-0587a9dbeb14', '7eba21c0-67e4-4322-9666-eb2172887cce', '45', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_30ab6020.jpg'),
('50291cdd-3f91-4dc2-868d-1107ae58f51d', '7819fea9-2fc3-4971-9bd4-3205fcec785c', '38', 'XANH LÁ', 10, 'src/data/images/products/main_082dc661.jpg'),
('5199edf9-196d-45c1-828c-10691107e98c', '7819fea9-2fc3-4971-9bd4-3205fcec785c', '39', 'XANH LÁ', 10, 'src/data/images/products/main_082dc661.jpg'),
('0e8f4e4b-d6b5-4231-9950-7852862bd2e3', '7819fea9-2fc3-4971-9bd4-3205fcec785c', '40', 'XANH LÁ', 10, 'src/data/images/products/main_082dc661.jpg'),
('55096065-0aec-4d51-97eb-1e1d7c2b70f1', '7819fea9-2fc3-4971-9bd4-3205fcec785c', '41', 'XANH LÁ', 10, 'src/data/images/products/main_082dc661.jpg'),
('20193e18-4b70-4b76-84a7-e51bfeb509fc', '7819fea9-2fc3-4971-9bd4-3205fcec785c', '42', 'XANH LÁ', 10, 'src/data/images/products/main_082dc661.jpg'),
('07160c29-f035-4258-bdd0-42322e18bfd2', '7819fea9-2fc3-4971-9bd4-3205fcec785c', '43', 'XANH LÁ', 10, 'src/data/images/products/main_082dc661.jpg'),
('cf76b9a1-3d03-4527-ac38-7853000f3ae1', '7819fea9-2fc3-4971-9bd4-3205fcec785c', '44', 'XANH LÁ', 10, 'src/data/images/products/main_082dc661.jpg'),
('ba3c6b85-5a51-45d9-9de1-67797c5d4900', '7819fea9-2fc3-4971-9bd4-3205fcec785c', '45', 'XANH LÁ', 10, 'src/data/images/products/main_082dc661.jpg'),
('47bf7804-c7ea-4049-aaa1-81012176ed4f', '37742f00-0cc4-40c3-8da1-bfe14bf71072', '38', 'CAM/XANH', 10, 'src/data/images/products/main_ac79af80.jpg'),
('21311c87-2881-48ae-b829-c688a62c9f98', '37742f00-0cc4-40c3-8da1-bfe14bf71072', '39', 'CAM/XANH', 10, 'src/data/images/products/main_ac79af80.jpg'),
('96a5e84a-dfd3-4341-9546-dc234002b47d', '37742f00-0cc4-40c3-8da1-bfe14bf71072', '40', 'CAM/XANH', 10, 'src/data/images/products/main_ac79af80.jpg'),
('bc9176d0-712d-4137-84e8-9d9c5ddc3e1d', '37742f00-0cc4-40c3-8da1-bfe14bf71072', '41', 'CAM/XANH', 10, 'src/data/images/products/main_ac79af80.jpg'),
('805a9502-7f8e-4e5f-b4f6-2d9b9062fbe5', '37742f00-0cc4-40c3-8da1-bfe14bf71072', '42', 'CAM/XANH', 10, 'src/data/images/products/main_ac79af80.jpg'),
('52ac517e-0482-479a-ad3f-62d17c894241', '37742f00-0cc4-40c3-8da1-bfe14bf71072', '43', 'CAM/XANH', 10, 'src/data/images/products/main_ac79af80.jpg'),
('63ff6613-65e8-438e-89a3-c740d2c0009e', '37742f00-0cc4-40c3-8da1-bfe14bf71072', '44', 'CAM/XANH', 10, 'src/data/images/products/main_ac79af80.jpg'),
('61492830-a7d8-42f6-b8ec-4638c0a4bd8f', '37742f00-0cc4-40c3-8da1-bfe14bf71072', '45', 'CAM/XANH', 10, 'src/data/images/products/main_ac79af80.jpg'),
('8849eb4c-0c7e-4bd0-bfa8-af251d8f8082', '1b4a3afc-951d-4921-8a00-bd7ababccbc5', '38', 'XANH/TRẮNG', 10, 'src/data/images/products/main_60a4be04.jpg'),
('cc487a54-57b3-4a9d-aa7e-19d5e5a72824', '1b4a3afc-951d-4921-8a00-bd7ababccbc5', '39', 'XANH/TRẮNG', 10, 'src/data/images/products/main_60a4be04.jpg'),
('4019e7ab-ce70-4500-9921-02d1fc6934c0', '1b4a3afc-951d-4921-8a00-bd7ababccbc5', '40', 'XANH/TRẮNG', 10, 'src/data/images/products/main_60a4be04.jpg'),
('b18e765a-cfe4-441b-ba00-4e8cb47bba2e', '1b4a3afc-951d-4921-8a00-bd7ababccbc5', '41', 'XANH/TRẮNG', 10, 'src/data/images/products/main_60a4be04.jpg'),
('c79befc5-3543-4d2a-bc35-878e67cfaf07', '1b4a3afc-951d-4921-8a00-bd7ababccbc5', '42', 'XANH/TRẮNG', 10, 'src/data/images/products/main_60a4be04.jpg'),
('7d5a8e25-28e6-4d86-93db-8475d7bb7b30', '1b4a3afc-951d-4921-8a00-bd7ababccbc5', '43', 'XANH/TRẮNG', 10, 'src/data/images/products/main_60a4be04.jpg'),
('93695cc3-896f-44d3-8626-6a2a3076b794', '1b4a3afc-951d-4921-8a00-bd7ababccbc5', '44', 'XANH/TRẮNG', 10, 'src/data/images/products/main_60a4be04.jpg'),
('08b93b37-33d1-44fd-9f1e-0536209a8c08', '1b4a3afc-951d-4921-8a00-bd7ababccbc5', '45', 'XANH/TRẮNG', 10, 'src/data/images/products/main_60a4be04.jpg'),
('5ffe18e4-8a86-4187-9a61-366304d0f910', 'f8ab8204-96fe-4d55-afa1-77b055efb960', '38', 'ĐEN/TÍM', 10, 'src/data/images/products/main_1a61cc2a.jpg'),
('425348d8-d863-495f-89f3-e08bce4aa039', 'f8ab8204-96fe-4d55-afa1-77b055efb960', '39', 'ĐEN/TÍM', 10, 'src/data/images/products/main_1a61cc2a.jpg'),
('8aefdd00-5477-4ec6-be25-a0a95106ed47', 'f8ab8204-96fe-4d55-afa1-77b055efb960', '40', 'ĐEN/TÍM', 10, 'src/data/images/products/main_1a61cc2a.jpg'),
('758f076b-154a-4cc6-b7d8-83778e615fb9', 'f8ab8204-96fe-4d55-afa1-77b055efb960', '41', 'ĐEN/TÍM', 10, 'src/data/images/products/main_1a61cc2a.jpg'),
('51f37e49-4fab-487b-9059-ff041fa84044', 'f8ab8204-96fe-4d55-afa1-77b055efb960', '42', 'ĐEN/TÍM', 10, 'src/data/images/products/main_1a61cc2a.jpg'),
('8058e8b8-ecf3-4cd0-83c2-85120d2b3af3', 'f8ab8204-96fe-4d55-afa1-77b055efb960', '43', 'ĐEN/TÍM', 10, 'src/data/images/products/main_1a61cc2a.jpg'),
('66c1f42d-bfbb-4358-a9de-5997562a973d', 'f8ab8204-96fe-4d55-afa1-77b055efb960', '44', 'ĐEN/TÍM', 10, 'src/data/images/products/main_1a61cc2a.jpg'),
('f06476d8-8728-49fc-b660-1115b0ab0aba', 'f8ab8204-96fe-4d55-afa1-77b055efb960', '45', 'ĐEN/TÍM', 10, 'src/data/images/products/main_1a61cc2a.jpg'),
('b5eb2f4d-8621-45cb-8b83-93e719ad3c0c', '464b6499-ad46-41a5-8381-d602e6aecfa2', '38', 'XANH TÍM/ĐỎ CAM', 10, 'src/data/images/products/main_72f374a4.jpg'),
('bd5b9b37-e13b-40bc-ac1f-4666e7e6a33e', '464b6499-ad46-41a5-8381-d602e6aecfa2', '39', 'XANH TÍM/ĐỎ CAM', 10, 'src/data/images/products/main_72f374a4.jpg'),
('491a1660-7b18-4273-b2dd-30f78fcedaff', '464b6499-ad46-41a5-8381-d602e6aecfa2', '40', 'XANH TÍM/ĐỎ CAM', 10, 'src/data/images/products/main_72f374a4.jpg'),
('b432ddf9-fb25-4dfa-80ae-f2b1e7e3bdb1', '464b6499-ad46-41a5-8381-d602e6aecfa2', '41', 'XANH TÍM/ĐỎ CAM', 10, 'src/data/images/products/main_72f374a4.jpg'),
('af0d77d3-4983-41ff-bab5-b397ce4a0b6e', '464b6499-ad46-41a5-8381-d602e6aecfa2', '42', 'XANH TÍM/ĐỎ CAM', 10, 'src/data/images/products/main_72f374a4.jpg'),
('40e8f08a-e4be-448e-8e3d-67526cef917b', '464b6499-ad46-41a5-8381-d602e6aecfa2', '43', 'XANH TÍM/ĐỎ CAM', 10, 'src/data/images/products/main_72f374a4.jpg'),
('169c8171-5962-46c2-8131-9453b4cafd16', '464b6499-ad46-41a5-8381-d602e6aecfa2', '44', 'XANH TÍM/ĐỎ CAM', 10, 'src/data/images/products/main_72f374a4.jpg'),
('2f5005bd-351f-4ce8-82ba-9dfa1bc95e45', '464b6499-ad46-41a5-8381-d602e6aecfa2', '45', 'XANH TÍM/ĐỎ CAM', 10, 'src/data/images/products/main_72f374a4.jpg'),
('90541c08-e1a3-4ae7-a689-83baa7033bbb', '22135c4e-a735-465c-b69f-4755a56f4ac8', '38', 'ĐEN/XANH', 10, 'src/data/images/products/main_62c640e4.jpg'),
('e07846f9-5a18-403c-86e0-d19f16fb6524', '22135c4e-a735-465c-b69f-4755a56f4ac8', '39', 'ĐEN/XANH', 10, 'src/data/images/products/main_62c640e4.jpg'),
('a99293a9-1705-498f-82a0-cdc95713275a', '22135c4e-a735-465c-b69f-4755a56f4ac8', '40', 'ĐEN/XANH', 10, 'src/data/images/products/main_62c640e4.jpg'),
('a2b8358b-1abd-4425-8361-d90050cfee67', '22135c4e-a735-465c-b69f-4755a56f4ac8', '41', 'ĐEN/XANH', 10, 'src/data/images/products/main_62c640e4.jpg'),
('99b9570b-00b0-4f35-84f0-7b7490f211c3', '22135c4e-a735-465c-b69f-4755a56f4ac8', '42', 'ĐEN/XANH', 10, 'src/data/images/products/main_62c640e4.jpg'),
('924774a7-8ba8-4f40-afc7-bd6c4c1ad5f3', '22135c4e-a735-465c-b69f-4755a56f4ac8', '43', 'ĐEN/XANH', 10, 'src/data/images/products/main_62c640e4.jpg'),
('3f6ef041-418c-44ce-a175-476df28dd494', '22135c4e-a735-465c-b69f-4755a56f4ac8', '44', 'ĐEN/XANH', 10, 'src/data/images/products/main_62c640e4.jpg'),
('045f525b-65f8-4196-b6fa-003d1417e163', '22135c4e-a735-465c-b69f-4755a56f4ac8', '45', 'ĐEN/XANH', 10, 'src/data/images/products/main_62c640e4.jpg'),
('b03cd312-926a-4fd5-aafb-29c942cbafa9', 'd10ec018-6660-4cf0-938b-459006a13fe7', '38', 'ĐỎ', 10, 'src/data/images/products/main_a857ceae.jpg'),
('f54c4acc-8183-4b37-8bee-c15f8a96a67b', 'd10ec018-6660-4cf0-938b-459006a13fe7', '39', 'ĐỎ', 10, 'src/data/images/products/main_a857ceae.jpg'),
('7be79123-ff0b-4778-9f12-6d6974f185b7', 'd10ec018-6660-4cf0-938b-459006a13fe7', '40', 'ĐỎ', 10, 'src/data/images/products/main_a857ceae.jpg'),
('b51d39c2-3ff6-4dcb-b1aa-1468c7a49ef3', 'd10ec018-6660-4cf0-938b-459006a13fe7', '41', 'ĐỎ', 10, 'src/data/images/products/main_a857ceae.jpg'),
('0e471038-84cf-45c6-907f-7402ac798ded', 'd10ec018-6660-4cf0-938b-459006a13fe7', '42', 'ĐỎ', 10, 'src/data/images/products/main_a857ceae.jpg'),
('3bed108a-6aee-4d34-9b02-7bf778262010', 'd10ec018-6660-4cf0-938b-459006a13fe7', '43', 'ĐỎ', 10, 'src/data/images/products/main_a857ceae.jpg'),
('014f01da-fb9a-469e-a617-8508a01aed89', 'd10ec018-6660-4cf0-938b-459006a13fe7', '44', 'ĐỎ', 10, 'src/data/images/products/main_a857ceae.jpg'),
('87f0cee0-5061-445a-abbf-56939d2df7a7', 'd10ec018-6660-4cf0-938b-459006a13fe7', '45', 'ĐỎ', 10, 'src/data/images/products/main_a857ceae.jpg');

INSERT INTO product_variants (variant_id, product_id, size, color, stock, image_url) VALUES
('d5f2b84c-66dd-47a4-87a3-da22864d2d73', '4a5c4f45-f8a9-4c8b-aa05-5e5bb961b87a', '38', 'TRẮNG/XANH', 10, 'src/data/images/products/main_4b4850d8.jpg'),
('40fc2f59-36bd-4bd6-8061-9537d891eda0', '4a5c4f45-f8a9-4c8b-aa05-5e5bb961b87a', '39', 'TRẮNG/XANH', 10, 'src/data/images/products/main_4b4850d8.jpg'),
('207f326f-3934-489f-a715-7f79f1da8dbb', '4a5c4f45-f8a9-4c8b-aa05-5e5bb961b87a', '40', 'TRẮNG/XANH', 10, 'src/data/images/products/main_4b4850d8.jpg'),
('94e76eb1-1cbc-41a8-ab4a-8bbb7438d189', '4a5c4f45-f8a9-4c8b-aa05-5e5bb961b87a', '41', 'TRẮNG/XANH', 10, 'src/data/images/products/main_4b4850d8.jpg'),
('0171cc40-198a-4fbe-bc98-bb5bd612a901', '4a5c4f45-f8a9-4c8b-aa05-5e5bb961b87a', '42', 'TRẮNG/XANH', 10, 'src/data/images/products/main_4b4850d8.jpg'),
('aade7b8d-8717-4152-bf0a-fb6e5bde8e9b', '4a5c4f45-f8a9-4c8b-aa05-5e5bb961b87a', '43', 'TRẮNG/XANH', 10, 'src/data/images/products/main_4b4850d8.jpg'),
('89f05606-7ed4-448e-9165-39d1030edcaa', '4a5c4f45-f8a9-4c8b-aa05-5e5bb961b87a', '44', 'TRẮNG/XANH', 10, 'src/data/images/products/main_4b4850d8.jpg'),
('1fa45b20-d9d8-47d0-95c4-6bf6d48b805f', '4a5c4f45-f8a9-4c8b-aa05-5e5bb961b87a', '45', 'TRẮNG/XANH', 10, 'src/data/images/products/main_4b4850d8.jpg'),
('ebf7667f-504f-489f-9ccb-7cb7d10769f3', '1e052c4d-2d98-477c-a86d-e95eb93aa911', '38', 'VÀNG/ĐEN', 10, 'src/data/images/products/main_5c70e519.jpg'),
('dc1dada2-ae33-4499-b1a6-ea67e7a28095', '1e052c4d-2d98-477c-a86d-e95eb93aa911', '39', 'VÀNG/ĐEN', 10, 'src/data/images/products/main_5c70e519.jpg'),
('46811677-0743-492d-8dd8-f5cfaae6499a', '1e052c4d-2d98-477c-a86d-e95eb93aa911', '40', 'VÀNG/ĐEN', 10, 'src/data/images/products/main_5c70e519.jpg'),
('e54bcf2e-6c34-4e85-afaa-430d4e720ebd', '1e052c4d-2d98-477c-a86d-e95eb93aa911', '41', 'VÀNG/ĐEN', 10, 'src/data/images/products/main_5c70e519.jpg'),
('d3946400-595b-4a41-abec-60ba0fc80657', '1e052c4d-2d98-477c-a86d-e95eb93aa911', '42', 'VÀNG/ĐEN', 10, 'src/data/images/products/main_5c70e519.jpg'),
('8021a69c-2ee7-4fa8-916d-825071055128', '1e052c4d-2d98-477c-a86d-e95eb93aa911', '43', 'VÀNG/ĐEN', 10, 'src/data/images/products/main_5c70e519.jpg'),
('e9e8fe9a-652e-42b3-99ff-2a702ec73c37', '1e052c4d-2d98-477c-a86d-e95eb93aa911', '44', 'VÀNG/ĐEN', 10, 'src/data/images/products/main_5c70e519.jpg'),
('2834161b-e78b-4c31-b959-ec0da03eb89f', '1e052c4d-2d98-477c-a86d-e95eb93aa911', '45', 'VÀNG/ĐEN', 10, 'src/data/images/products/main_5c70e519.jpg'),
('70bf6a90-508c-44e8-b185-a68f3ad07891', 'fb47039c-ab6d-4cd5-b76b-b0f049478a75', '38', 'XANH/HỒNG', 10, 'src/data/images/products/main_c5ab517d.jpg'),
('3ebba505-36cd-4d5d-a3e5-d6dffa57cbab', 'fb47039c-ab6d-4cd5-b76b-b0f049478a75', '39', 'XANH/HỒNG', 10, 'src/data/images/products/main_c5ab517d.jpg'),
('9f143712-1f75-4360-a3b2-899861297331', 'fb47039c-ab6d-4cd5-b76b-b0f049478a75', '40', 'XANH/HỒNG', 10, 'src/data/images/products/main_c5ab517d.jpg'),
('67e160b2-15f6-44bc-9462-336630e6f726', 'fb47039c-ab6d-4cd5-b76b-b0f049478a75', '41', 'XANH/HỒNG', 10, 'src/data/images/products/main_c5ab517d.jpg'),
('60ba2aeb-d2fc-4dad-8604-3a1c2c47b437', 'fb47039c-ab6d-4cd5-b76b-b0f049478a75', '42', 'XANH/HỒNG', 10, 'src/data/images/products/main_c5ab517d.jpg'),
('e1206eb3-81cf-4405-a470-30da1d23f898', 'fb47039c-ab6d-4cd5-b76b-b0f049478a75', '43', 'XANH/HỒNG', 10, 'src/data/images/products/main_c5ab517d.jpg'),
('7dfe312b-6e5a-4d9b-bb95-ef7069252c49', 'fb47039c-ab6d-4cd5-b76b-b0f049478a75', '44', 'XANH/HỒNG', 10, 'src/data/images/products/main_c5ab517d.jpg'),
('ef51d84e-72f1-4864-a158-44595b70cfa5', 'fb47039c-ab6d-4cd5-b76b-b0f049478a75', '45', 'XANH/HỒNG', 10, 'src/data/images/products/main_c5ab517d.jpg'),
('032b02b2-a386-4f0c-bc0b-e5a9228609ce', 'f56fa814-e355-4659-808f-029e172e41e7', '38', 'XANH TÍM/ĐỎ CAM', 10, 'src/data/images/products/main_cad499d0.jpg'),
('099ac395-4410-4b1d-8b43-bafbec8cdece', 'f56fa814-e355-4659-808f-029e172e41e7', '39', 'XANH TÍM/ĐỎ CAM', 10, 'src/data/images/products/main_cad499d0.jpg'),
('229254c1-2337-41b8-aff1-6e96bb41ab5e', 'f56fa814-e355-4659-808f-029e172e41e7', '40', 'XANH TÍM/ĐỎ CAM', 10, 'src/data/images/products/main_cad499d0.jpg'),
('f3e7bf7c-33e9-4477-9b28-9ee3490ba568', 'f56fa814-e355-4659-808f-029e172e41e7', '41', 'XANH TÍM/ĐỎ CAM', 10, 'src/data/images/products/main_cad499d0.jpg'),
('5d15225c-5ff0-46ba-a154-244fbf0f2cab', 'f56fa814-e355-4659-808f-029e172e41e7', '42', 'XANH TÍM/ĐỎ CAM', 10, 'src/data/images/products/main_cad499d0.jpg'),
('55c4de21-bb42-4997-ac85-fe19313ecdd3', 'f56fa814-e355-4659-808f-029e172e41e7', '43', 'XANH TÍM/ĐỎ CAM', 10, 'src/data/images/products/main_cad499d0.jpg'),
('b31e4690-fc0a-481f-84a6-11aea13d69b3', 'f56fa814-e355-4659-808f-029e172e41e7', '44', 'XANH TÍM/ĐỎ CAM', 10, 'src/data/images/products/main_cad499d0.jpg'),
('0d77fb65-79c3-4165-b2d2-0197683290f3', 'f56fa814-e355-4659-808f-029e172e41e7', '45', 'XANH TÍM/ĐỎ CAM', 10, 'src/data/images/products/main_cad499d0.jpg'),
('2e034c2c-a1e9-4000-865d-f9d28544ee8d', 'fe1db275-ccb3-4400-b04e-5f48b3daffdc', '38', 'ĐEN/XANH', 10, 'src/data/images/products/main_5bbee11e.jpg'),
('289e157e-56c5-4c07-b74c-f3286b5e0be1', 'fe1db275-ccb3-4400-b04e-5f48b3daffdc', '39', 'ĐEN/XANH', 10, 'src/data/images/products/main_5bbee11e.jpg'),
('fbbda025-8e7f-470a-876c-a73f279b0e6a', 'fe1db275-ccb3-4400-b04e-5f48b3daffdc', '40', 'ĐEN/XANH', 10, 'src/data/images/products/main_5bbee11e.jpg'),
('bc9a180e-2355-4c3b-b6bf-18a29f0a128c', 'fe1db275-ccb3-4400-b04e-5f48b3daffdc', '41', 'ĐEN/XANH', 10, 'src/data/images/products/main_5bbee11e.jpg'),
('271270b4-7bc2-4a43-aa94-bcd047a03ab9', 'fe1db275-ccb3-4400-b04e-5f48b3daffdc', '42', 'ĐEN/XANH', 10, 'src/data/images/products/main_5bbee11e.jpg'),
('2c85209f-7ced-48a1-88de-b3c4802e7021', 'fe1db275-ccb3-4400-b04e-5f48b3daffdc', '43', 'ĐEN/XANH', 10, 'src/data/images/products/main_5bbee11e.jpg'),
('2395eed6-8ab8-4d31-b7fa-7eab808ba70b', 'fe1db275-ccb3-4400-b04e-5f48b3daffdc', '44', 'ĐEN/XANH', 10, 'src/data/images/products/main_5bbee11e.jpg'),
('53c856ad-93b2-45f5-b125-458caab733e8', 'fe1db275-ccb3-4400-b04e-5f48b3daffdc', '45', 'ĐEN/XANH', 10, 'src/data/images/products/main_5bbee11e.jpg'),
('a783bec4-e31f-41da-8f4e-e2665975d836', 'b23fbd80-77b2-48cd-930a-f24bd6dc6caf', '38', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_1dff2b8b.jpg'),
('26e32e7d-70c4-4782-8f12-0161065fe9e0', 'b23fbd80-77b2-48cd-930a-f24bd6dc6caf', '39', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_1dff2b8b.jpg'),
('ae35d7f5-429b-41b5-9a6b-3e5bec3b450b', 'b23fbd80-77b2-48cd-930a-f24bd6dc6caf', '40', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_1dff2b8b.jpg'),
('30c7bcd0-5a57-4d1e-b831-da8cbd0f39ad', 'b23fbd80-77b2-48cd-930a-f24bd6dc6caf', '41', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_1dff2b8b.jpg'),
('b74777bb-b0f9-4921-a58b-eebfd6b00675', 'b23fbd80-77b2-48cd-930a-f24bd6dc6caf', '42', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_1dff2b8b.jpg'),
('bef1f4ff-9085-44e0-a1fe-38cbe351a7d4', 'b23fbd80-77b2-48cd-930a-f24bd6dc6caf', '43', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_1dff2b8b.jpg'),
('e0f3d5cb-ed5f-4599-a61d-877c31894273', 'b23fbd80-77b2-48cd-930a-f24bd6dc6caf', '44', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_1dff2b8b.jpg'),
('1c1d13d1-c28a-465a-a0f1-333ab8cec98c', 'b23fbd80-77b2-48cd-930a-f24bd6dc6caf', '45', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_1dff2b8b.jpg'),
('b59ef48f-b8d9-468e-883b-cf5332c7861c', 'e8998313-37b6-4f33-9a43-474857f6ebc2', '38', 'XANH/HỒNG', 10, 'src/data/images/products/main_29e0ec91.jpg'),
('0cd678c4-c9a4-46e2-9a04-1cf06df285a7', 'e8998313-37b6-4f33-9a43-474857f6ebc2', '39', 'XANH/HỒNG', 10, 'src/data/images/products/main_29e0ec91.jpg'),
('000ec0d6-8eb8-444c-8495-aa0f1c99ba11', 'e8998313-37b6-4f33-9a43-474857f6ebc2', '40', 'XANH/HỒNG', 10, 'src/data/images/products/main_29e0ec91.jpg'),
('9aa02a21-a32e-44e7-bcff-6db979929e9e', 'e8998313-37b6-4f33-9a43-474857f6ebc2', '41', 'XANH/HỒNG', 10, 'src/data/images/products/main_29e0ec91.jpg'),
('0957979f-e8e5-4c55-9dee-5dbf6904a487', 'e8998313-37b6-4f33-9a43-474857f6ebc2', '42', 'XANH/HỒNG', 10, 'src/data/images/products/main_29e0ec91.jpg'),
('a7508907-4dde-4335-9d70-d34bf111162f', 'e8998313-37b6-4f33-9a43-474857f6ebc2', '43', 'XANH/HỒNG', 10, 'src/data/images/products/main_29e0ec91.jpg'),
('44adebd9-0343-4c4a-a694-750cbe7b25c7', 'e8998313-37b6-4f33-9a43-474857f6ebc2', '44', 'XANH/HỒNG', 10, 'src/data/images/products/main_29e0ec91.jpg'),
('6c8fd5ff-e059-4d65-b40f-0303c8c6861d', 'e8998313-37b6-4f33-9a43-474857f6ebc2', '45', 'XANH/HỒNG', 10, 'src/data/images/products/main_29e0ec91.jpg'),
('ab197377-961c-41a3-b31f-d3da9e81c1f0', 'f5456862-c3f9-4e0f-8748-3e992eacda23', '38', 'XANH MINT', 10, 'src/data/images/products/main_e1f23974.jpg'),
('2ea0bdff-9bc6-415f-9a3e-302504e71555', 'f5456862-c3f9-4e0f-8748-3e992eacda23', '39', 'XANH MINT', 10, 'src/data/images/products/main_e1f23974.jpg'),
('d60b19f2-4ded-4614-917c-a0fd1193a186', 'f5456862-c3f9-4e0f-8748-3e992eacda23', '40', 'XANH MINT', 10, 'src/data/images/products/main_e1f23974.jpg'),
('c2386885-8f4c-45b7-8e7b-c857fe7e46e6', 'f5456862-c3f9-4e0f-8748-3e992eacda23', '41', 'XANH MINT', 10, 'src/data/images/products/main_e1f23974.jpg'),
('6f9ef876-0317-4def-96d4-390b606973c8', 'f5456862-c3f9-4e0f-8748-3e992eacda23', '42', 'XANH MINT', 10, 'src/data/images/products/main_e1f23974.jpg'),
('b313450b-b0c4-4ca6-b493-734c71c90747', 'f5456862-c3f9-4e0f-8748-3e992eacda23', '43', 'XANH MINT', 10, 'src/data/images/products/main_e1f23974.jpg'),
('a3cf0c09-6f25-41db-82ba-5a3c88455b15', 'f5456862-c3f9-4e0f-8748-3e992eacda23', '44', 'XANH MINT', 10, 'src/data/images/products/main_e1f23974.jpg'),
('92385b98-9ea4-4bcb-b488-f75d35c7a3b4', 'f5456862-c3f9-4e0f-8748-3e992eacda23', '45', 'XANH MINT', 10, 'src/data/images/products/main_e1f23974.jpg'),
('1c25c501-a6cc-4adb-887c-53e252af7d31', '32230b93-4ae3-4913-80a9-508416e52699', '38', 'XANH DƯƠNG', 10, 'src/data/images/products/main_0b32d784.jpg'),
('9487e848-8ac6-43a6-84a9-d856abc01129', '32230b93-4ae3-4913-80a9-508416e52699', '39', 'XANH DƯƠNG', 10, 'src/data/images/products/main_0b32d784.jpg'),
('76810941-365a-4ba4-a0e7-26fba99a67fd', '32230b93-4ae3-4913-80a9-508416e52699', '40', 'XANH DƯƠNG', 10, 'src/data/images/products/main_0b32d784.jpg'),
('dee6b29f-a1a4-42af-9d05-64181e5a38e4', '32230b93-4ae3-4913-80a9-508416e52699', '41', 'XANH DƯƠNG', 10, 'src/data/images/products/main_0b32d784.jpg'),
('b0df5e34-1680-4600-a154-efca33297a98', '32230b93-4ae3-4913-80a9-508416e52699', '42', 'XANH DƯƠNG', 10, 'src/data/images/products/main_0b32d784.jpg'),
('c0787e03-9aff-4b02-afdd-486bf8cdaa08', '32230b93-4ae3-4913-80a9-508416e52699', '43', 'XANH DƯƠNG', 10, 'src/data/images/products/main_0b32d784.jpg'),
('4ef2bcf0-cfde-4735-ac42-0e83c94129c5', '32230b93-4ae3-4913-80a9-508416e52699', '44', 'XANH DƯƠNG', 10, 'src/data/images/products/main_0b32d784.jpg'),
('9270dadd-496a-45dd-b5b3-79e01cbb6409', '32230b93-4ae3-4913-80a9-508416e52699', '45', 'XANH DƯƠNG', 10, 'src/data/images/products/main_0b32d784.jpg'),
('71156211-87f5-4336-aff9-57e4dfeb799d', 'da540cab-4cc4-42fc-ab41-6248019303b2', '38', 'WORLD CUP', 10, 'src/data/images/products/main_aaa78db0.jpg'),
('95fb9e9b-0fc5-46dc-98e7-4c832eded0db', 'da540cab-4cc4-42fc-ab41-6248019303b2', '39', 'WORLD CUP', 10, 'src/data/images/products/main_aaa78db0.jpg'),
('46f36e69-b363-4b02-ae37-3ca855052d42', 'da540cab-4cc4-42fc-ab41-6248019303b2', '40', 'WORLD CUP', 10, 'src/data/images/products/main_aaa78db0.jpg'),
('7bbca921-00c7-45d0-ae3b-ff85b311d807', 'da540cab-4cc4-42fc-ab41-6248019303b2', '41', 'WORLD CUP', 10, 'src/data/images/products/main_aaa78db0.jpg'),
('830ba9c2-a501-4a4d-bcf2-2cb41dad3e25', 'da540cab-4cc4-42fc-ab41-6248019303b2', '42', 'WORLD CUP', 10, 'src/data/images/products/main_aaa78db0.jpg'),
('f19b6415-d83b-46eb-8ba2-2f1196d86aeb', 'da540cab-4cc4-42fc-ab41-6248019303b2', '43', 'WORLD CUP', 10, 'src/data/images/products/main_aaa78db0.jpg'),
('df01e24e-fdd1-4b32-90f1-1dfc8c24d8d2', 'da540cab-4cc4-42fc-ab41-6248019303b2', '44', 'WORLD CUP', 10, 'src/data/images/products/main_aaa78db0.jpg'),
('5aee2da4-04d9-4185-ac0a-0366cfbf94ee', 'da540cab-4cc4-42fc-ab41-6248019303b2', '45', 'WORLD CUP', 10, 'src/data/images/products/main_aaa78db0.jpg'),
('6d32df6e-1ef2-4d4c-95ac-9e98101f0953', 'c6ef3476-0fdb-44dc-8b01-f99e62eacfce', '38', 'VÀNG/TRẮNG', 10, 'src/data/images/products/main_11b4b3c4.jpg'),
('7e46f976-5329-4b9d-a287-a9392aea007a', 'c6ef3476-0fdb-44dc-8b01-f99e62eacfce', '39', 'VÀNG/TRẮNG', 10, 'src/data/images/products/main_11b4b3c4.jpg'),
('032e2f96-5eda-4ca9-9a8e-0b9f2106b759', 'c6ef3476-0fdb-44dc-8b01-f99e62eacfce', '40', 'VÀNG/TRẮNG', 10, 'src/data/images/products/main_11b4b3c4.jpg'),
('107cbae7-46d4-424b-b88a-7a1b41a7ffdb', 'c6ef3476-0fdb-44dc-8b01-f99e62eacfce', '41', 'VÀNG/TRẮNG', 10, 'src/data/images/products/main_11b4b3c4.jpg'),
('03385b35-20cf-40c4-8a91-cfed8054db8c', 'c6ef3476-0fdb-44dc-8b01-f99e62eacfce', '42', 'VÀNG/TRẮNG', 10, 'src/data/images/products/main_11b4b3c4.jpg'),
('ebec89ed-fd1c-4b82-a6e9-bbad39d77805', 'c6ef3476-0fdb-44dc-8b01-f99e62eacfce', '43', 'VÀNG/TRẮNG', 10, 'src/data/images/products/main_11b4b3c4.jpg'),
('ef34a0fb-226e-4fb5-bfd3-0b2c30d201bd', 'c6ef3476-0fdb-44dc-8b01-f99e62eacfce', '44', 'VÀNG/TRẮNG', 10, 'src/data/images/products/main_11b4b3c4.jpg'),
('53649938-54f5-4c8a-a601-8d71ef943f7e', 'c6ef3476-0fdb-44dc-8b01-f99e62eacfce', '45', 'VÀNG/TRẮNG', 10, 'src/data/images/products/main_11b4b3c4.jpg'),
('51e028c2-7812-47af-986e-a9c91e0a0aa1', '7e9d9a69-2b3e-4fd9-adda-82c3e9d78ed9', '38', 'NÂU BẠC', 10, 'src/data/images/products/main_57aaaff4.jpg'),
('39c433bd-8d28-4627-a080-93aa8d688e3b', '7e9d9a69-2b3e-4fd9-adda-82c3e9d78ed9', '39', 'NÂU BẠC', 10, 'src/data/images/products/main_57aaaff4.jpg'),
('7e497819-5ce5-4e65-a553-6234da3d3cf9', '7e9d9a69-2b3e-4fd9-adda-82c3e9d78ed9', '40', 'NÂU BẠC', 10, 'src/data/images/products/main_57aaaff4.jpg'),
('dc16a732-07ff-4c48-a679-862f0ce52609', '7e9d9a69-2b3e-4fd9-adda-82c3e9d78ed9', '41', 'NÂU BẠC', 10, 'src/data/images/products/main_57aaaff4.jpg'),
('48170992-509e-48d5-9600-4f9b0dff657d', '7e9d9a69-2b3e-4fd9-adda-82c3e9d78ed9', '42', 'NÂU BẠC', 10, 'src/data/images/products/main_57aaaff4.jpg'),
('8ef9654e-c5a1-44b6-8a88-60e67d289a3e', '7e9d9a69-2b3e-4fd9-adda-82c3e9d78ed9', '43', 'NÂU BẠC', 10, 'src/data/images/products/main_57aaaff4.jpg'),
('0ed46db1-25c2-4f7d-ae64-a90d288bbedc', '7e9d9a69-2b3e-4fd9-adda-82c3e9d78ed9', '44', 'NÂU BẠC', 10, 'src/data/images/products/main_57aaaff4.jpg'),
('9bb49557-00a8-4053-9bbe-2898491b635b', '7e9d9a69-2b3e-4fd9-adda-82c3e9d78ed9', '45', 'NÂU BẠC', 10, 'src/data/images/products/main_57aaaff4.jpg'),
('7397876c-f630-458d-aaff-517ec1cd3c89', 'd049dcfc-25b2-4a21-8e7c-6fdc3949913d', '38', 'XÁM XANH/HỒNG', 10, 'src/data/images/products/main_80835bbf.jpg'),
('9be402d1-e415-449d-812f-400859fd2cec', 'd049dcfc-25b2-4a21-8e7c-6fdc3949913d', '39', 'XÁM XANH/HỒNG', 10, 'src/data/images/products/main_80835bbf.jpg'),
('7202fa10-e9a2-480a-a48a-a37723cc554a', 'd049dcfc-25b2-4a21-8e7c-6fdc3949913d', '40', 'XÁM XANH/HỒNG', 10, 'src/data/images/products/main_80835bbf.jpg'),
('f3253ea7-d0fc-4936-9182-f21193a2eada', 'd049dcfc-25b2-4a21-8e7c-6fdc3949913d', '41', 'XÁM XANH/HỒNG', 10, 'src/data/images/products/main_80835bbf.jpg');

INSERT INTO product_variants (variant_id, product_id, size, color, stock, image_url) VALUES
('3e56433c-1981-4ec0-8c52-392376e3acd4', 'd049dcfc-25b2-4a21-8e7c-6fdc3949913d', '42', 'XÁM XANH/HỒNG', 10, 'src/data/images/products/main_80835bbf.jpg'),
('3d89820a-1145-46ac-89e9-b9c68ec29372', 'd049dcfc-25b2-4a21-8e7c-6fdc3949913d', '43', 'XÁM XANH/HỒNG', 10, 'src/data/images/products/main_80835bbf.jpg'),
('bd09d05d-a7b7-4ec1-b097-ff4cc3d3be08', 'd049dcfc-25b2-4a21-8e7c-6fdc3949913d', '44', 'XÁM XANH/HỒNG', 10, 'src/data/images/products/main_80835bbf.jpg'),
('14087d55-1f0f-405b-aa66-4aaef3e70eae', 'd049dcfc-25b2-4a21-8e7c-6fdc3949913d', '45', 'XÁM XANH/HỒNG', 10, 'src/data/images/products/main_80835bbf.jpg'),
('c9056eec-ea00-49d2-9899-215dde6789e0', 'b87387e7-0a6b-404d-a416-e363acf68bae', '38', 'TRẮNG KEM', 10, 'src/data/images/products/main_1a6c595f.jpg'),
('9b355dc2-8acb-418f-b77c-ca41757dde4f', 'b87387e7-0a6b-404d-a416-e363acf68bae', '39', 'TRẮNG KEM', 10, 'src/data/images/products/main_1a6c595f.jpg'),
('c5189219-4c87-447e-b685-a70befbe0863', 'b87387e7-0a6b-404d-a416-e363acf68bae', '40', 'TRẮNG KEM', 10, 'src/data/images/products/main_1a6c595f.jpg'),
('3885a4b8-b8e9-4911-aab1-6a593cfbe958', 'b87387e7-0a6b-404d-a416-e363acf68bae', '41', 'TRẮNG KEM', 10, 'src/data/images/products/main_1a6c595f.jpg'),
('381654b4-003f-4a4e-9a68-ee491cf33f69', 'b87387e7-0a6b-404d-a416-e363acf68bae', '42', 'TRẮNG KEM', 10, 'src/data/images/products/main_1a6c595f.jpg'),
('f426a134-2ac1-4ef2-8884-20bd54e2b4b7', 'b87387e7-0a6b-404d-a416-e363acf68bae', '43', 'TRẮNG KEM', 10, 'src/data/images/products/main_1a6c595f.jpg'),
('d9a65c14-6575-45bb-a17b-7b183b8fdc8b', 'b87387e7-0a6b-404d-a416-e363acf68bae', '44', 'TRẮNG KEM', 10, 'src/data/images/products/main_1a6c595f.jpg'),
('55ff2fd9-c563-44e3-a347-2edb02d85a84', 'b87387e7-0a6b-404d-a416-e363acf68bae', '45', 'TRẮNG KEM', 10, 'src/data/images/products/main_1a6c595f.jpg'),
('ac062fc2-e6db-47e1-8763-5ce6384ff859', 'eac5a7e6-6cb3-45bc-82f7-4fd4871dae04', '38', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_45f953bf.jpg'),
('e9d25223-d408-4c91-8756-122c07346fae', 'eac5a7e6-6cb3-45bc-82f7-4fd4871dae04', '39', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_45f953bf.jpg'),
('220ad5c0-f88e-4660-9c04-fcb264dbef79', 'eac5a7e6-6cb3-45bc-82f7-4fd4871dae04', '40', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_45f953bf.jpg'),
('6c5a3b3f-10d2-4d2c-b419-446b8fcfdff4', 'eac5a7e6-6cb3-45bc-82f7-4fd4871dae04', '41', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_45f953bf.jpg'),
('97117f04-3dc6-447e-afa8-dd12506e6e65', 'eac5a7e6-6cb3-45bc-82f7-4fd4871dae04', '42', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_45f953bf.jpg'),
('cf705157-5929-48f0-83ca-fee8613bc6e4', 'eac5a7e6-6cb3-45bc-82f7-4fd4871dae04', '43', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_45f953bf.jpg'),
('aea9a25b-8ecf-4c0d-a966-b0d96435243d', 'eac5a7e6-6cb3-45bc-82f7-4fd4871dae04', '44', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_45f953bf.jpg'),
('9924ba9e-6085-4096-9430-70ee9f4f4afe', 'eac5a7e6-6cb3-45bc-82f7-4fd4871dae04', '45', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_45f953bf.jpg'),
('8e9b00dd-9627-405d-afc4-657ac3139ed7', 'fd0d9edb-3f94-42e7-ad49-9fb41cccf054', '38', 'XANH CHUỐI', 10, 'src/data/images/products/main_f7a29896.jpg'),
('b9fc58df-9a3a-4a48-aba8-1fbed071127e', 'fd0d9edb-3f94-42e7-ad49-9fb41cccf054', '39', 'XANH CHUỐI', 10, 'src/data/images/products/main_f7a29896.jpg'),
('9cf2a921-974b-4dde-9cd2-b2fc35f9b5a0', 'fd0d9edb-3f94-42e7-ad49-9fb41cccf054', '40', 'XANH CHUỐI', 10, 'src/data/images/products/main_f7a29896.jpg'),
('36f104ba-a317-406b-b666-b3a09d1f74a9', 'fd0d9edb-3f94-42e7-ad49-9fb41cccf054', '41', 'XANH CHUỐI', 10, 'src/data/images/products/main_f7a29896.jpg'),
('ace77229-9d61-4f75-97db-2b38f46c85a5', 'fd0d9edb-3f94-42e7-ad49-9fb41cccf054', '42', 'XANH CHUỐI', 10, 'src/data/images/products/main_f7a29896.jpg'),
('5941ea21-1ab2-4152-9f47-d0a873d13083', 'fd0d9edb-3f94-42e7-ad49-9fb41cccf054', '43', 'XANH CHUỐI', 10, 'src/data/images/products/main_f7a29896.jpg'),
('090adadb-576c-4cfa-b0d9-a6689a811b8b', 'fd0d9edb-3f94-42e7-ad49-9fb41cccf054', '44', 'XANH CHUỐI', 10, 'src/data/images/products/main_f7a29896.jpg'),
('ace8ff2e-8ede-4806-8e19-17d13cbbbdb6', 'fd0d9edb-3f94-42e7-ad49-9fb41cccf054', '45', 'XANH CHUỐI', 10, 'src/data/images/products/main_f7a29896.jpg'),
('bd8360d4-82e6-4bee-9331-2e1b50591b86', '9c3c3bd1-f3fb-481c-b600-2fee0e31cd4d', '38', 'XANH DẠ QUANG/ĐEN', 10, 'src/data/images/products/main_d43d9c51.jpg'),
('d890ad53-340a-431e-a04f-5d48dbe3ec4e', '9c3c3bd1-f3fb-481c-b600-2fee0e31cd4d', '39', 'XANH DẠ QUANG/ĐEN', 10, 'src/data/images/products/main_d43d9c51.jpg'),
('07584599-5da8-4eb7-94d6-f80cb1cba918', '9c3c3bd1-f3fb-481c-b600-2fee0e31cd4d', '40', 'XANH DẠ QUANG/ĐEN', 10, 'src/data/images/products/main_d43d9c51.jpg'),
('97a75161-733c-4309-92c1-3a05362e66b9', '9c3c3bd1-f3fb-481c-b600-2fee0e31cd4d', '41', 'XANH DẠ QUANG/ĐEN', 10, 'src/data/images/products/main_d43d9c51.jpg'),
('8ffba6cf-c558-4057-b5c7-c6dd1cfa46e1', '9c3c3bd1-f3fb-481c-b600-2fee0e31cd4d', '42', 'XANH DẠ QUANG/ĐEN', 10, 'src/data/images/products/main_d43d9c51.jpg'),
('a41014ba-b522-45ae-ac6f-8560531748cf', '9c3c3bd1-f3fb-481c-b600-2fee0e31cd4d', '43', 'XANH DẠ QUANG/ĐEN', 10, 'src/data/images/products/main_d43d9c51.jpg'),
('a3dc6a75-366a-4277-bebf-e5ceb8d84d9b', '9c3c3bd1-f3fb-481c-b600-2fee0e31cd4d', '44', 'XANH DẠ QUANG/ĐEN', 10, 'src/data/images/products/main_d43d9c51.jpg'),
('aee8c7cb-15ea-4988-8252-892527093a72', '9c3c3bd1-f3fb-481c-b600-2fee0e31cd4d', '45', 'XANH DẠ QUANG/ĐEN', 10, 'src/data/images/products/main_d43d9c51.jpg'),
('c430c9cc-72a9-4b49-bf2a-43e7f7277540', '9e386d86-f94e-4ae7-b6c9-26df3d849c71', '38', 'XANH MINT', 10, 'src/data/images/products/main_05357796.jpg'),
('4c8137eb-25da-422c-bf7a-60b374a1654d', '9e386d86-f94e-4ae7-b6c9-26df3d849c71', '39', 'XANH MINT', 10, 'src/data/images/products/main_05357796.jpg'),
('d06b25fb-21b6-41ad-b00b-a9f62973b431', '9e386d86-f94e-4ae7-b6c9-26df3d849c71', '40', 'XANH MINT', 10, 'src/data/images/products/main_05357796.jpg'),
('41266049-af56-46dc-8592-3f40af499658', '9e386d86-f94e-4ae7-b6c9-26df3d849c71', '41', 'XANH MINT', 10, 'src/data/images/products/main_05357796.jpg'),
('ad1b3a1f-dcef-4bf3-8fdb-e35d82ebb5b0', '9e386d86-f94e-4ae7-b6c9-26df3d849c71', '42', 'XANH MINT', 10, 'src/data/images/products/main_05357796.jpg'),
('8086ae52-1819-4049-bded-c29508ab62a0', '9e386d86-f94e-4ae7-b6c9-26df3d849c71', '43', 'XANH MINT', 10, 'src/data/images/products/main_05357796.jpg'),
('59308f6e-7567-4bf7-8545-4254f5bf9256', '9e386d86-f94e-4ae7-b6c9-26df3d849c71', '44', 'XANH MINT', 10, 'src/data/images/products/main_05357796.jpg'),
('535c40d5-5d0f-4d93-8f6f-0873102330c4', '9e386d86-f94e-4ae7-b6c9-26df3d849c71', '45', 'XANH MINT', 10, 'src/data/images/products/main_05357796.jpg'),
('204bc7b3-bcdb-48df-a06c-1538a41282d3', '36a77d5f-c4a0-4d7c-8ee9-2248ef9d80b0', '38', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_33716e18.jpg'),
('71ce7f4a-ab7b-4abf-9472-361d8b790e7b', '36a77d5f-c4a0-4d7c-8ee9-2248ef9d80b0', '39', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_33716e18.jpg'),
('d6982671-35c8-4065-80d2-dd8026952a81', '36a77d5f-c4a0-4d7c-8ee9-2248ef9d80b0', '40', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_33716e18.jpg'),
('cb40fc66-0e6f-4386-b0f7-3b4bc00e479e', '36a77d5f-c4a0-4d7c-8ee9-2248ef9d80b0', '41', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_33716e18.jpg'),
('40971497-d9ac-475d-9f52-ab856883dc4f', '36a77d5f-c4a0-4d7c-8ee9-2248ef9d80b0', '42', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_33716e18.jpg'),
('aef4f5ac-ec04-4b14-8baf-d375a4e34c3f', '36a77d5f-c4a0-4d7c-8ee9-2248ef9d80b0', '43', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_33716e18.jpg'),
('976be7cc-146d-4d71-b643-0b95f7ab4093', '36a77d5f-c4a0-4d7c-8ee9-2248ef9d80b0', '44', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_33716e18.jpg'),
('0e05d22d-8b7b-4a64-8507-0d099af95401', '36a77d5f-c4a0-4d7c-8ee9-2248ef9d80b0', '45', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_33716e18.jpg'),
('a7398cd1-409d-42c9-8111-e285a6023a28', 'ac8f18bb-57d3-4551-adb7-325ce7ed0f9d', '38', 'VÀNG CAM', 10, 'src/data/images/products/main_bca1bfe0.jpg'),
('ea41b016-d628-4e55-9d0d-8bd5bcaa2aad', 'ac8f18bb-57d3-4551-adb7-325ce7ed0f9d', '39', 'VÀNG CAM', 10, 'src/data/images/products/main_bca1bfe0.jpg'),
('801a69b1-c2ca-4965-87ab-3b3d5db4f658', 'ac8f18bb-57d3-4551-adb7-325ce7ed0f9d', '40', 'VÀNG CAM', 10, 'src/data/images/products/main_bca1bfe0.jpg'),
('e2432e46-0f21-4e8f-acc7-464c002add46', 'ac8f18bb-57d3-4551-adb7-325ce7ed0f9d', '41', 'VÀNG CAM', 10, 'src/data/images/products/main_bca1bfe0.jpg'),
('d3e5c421-eae3-4298-98ee-524b06400ea5', 'ac8f18bb-57d3-4551-adb7-325ce7ed0f9d', '42', 'VÀNG CAM', 10, 'src/data/images/products/main_bca1bfe0.jpg'),
('5a092cce-b9e4-4139-aaba-8a2423202c27', 'ac8f18bb-57d3-4551-adb7-325ce7ed0f9d', '43', 'VÀNG CAM', 10, 'src/data/images/products/main_bca1bfe0.jpg'),
('dcae5624-9b72-4fad-bd55-9a2b96a8c3d0', 'ac8f18bb-57d3-4551-adb7-325ce7ed0f9d', '44', 'VÀNG CAM', 10, 'src/data/images/products/main_bca1bfe0.jpg'),
('74da0e01-3305-45ea-8df9-17f86fe7bf92', 'ac8f18bb-57d3-4551-adb7-325ce7ed0f9d', '45', 'VÀNG CAM', 10, 'src/data/images/products/main_bca1bfe0.jpg'),
('e4dd09e8-02e1-4eaa-be9b-37229f070709', '2f955b42-270c-4362-93ae-9397038c89cc', '38', 'XANH MINT', 10, 'src/data/images/products/main_ddfe58e7.jpg'),
('23bf57f9-b84b-4c74-850c-76123df178e4', '2f955b42-270c-4362-93ae-9397038c89cc', '39', 'XANH MINT', 10, 'src/data/images/products/main_ddfe58e7.jpg'),
('7b250825-0d14-48b7-bba3-3f594a169b6a', '2f955b42-270c-4362-93ae-9397038c89cc', '40', 'XANH MINT', 10, 'src/data/images/products/main_ddfe58e7.jpg'),
('2d3e7d38-f25c-4813-9c33-0d5134e4f681', '2f955b42-270c-4362-93ae-9397038c89cc', '41', 'XANH MINT', 10, 'src/data/images/products/main_ddfe58e7.jpg'),
('1d3ba871-361b-45a4-8887-c1729d13ef3d', '2f955b42-270c-4362-93ae-9397038c89cc', '42', 'XANH MINT', 10, 'src/data/images/products/main_ddfe58e7.jpg'),
('746f7d37-18f6-4193-97b6-d150808b3aea', '2f955b42-270c-4362-93ae-9397038c89cc', '43', 'XANH MINT', 10, 'src/data/images/products/main_ddfe58e7.jpg'),
('bdef06c6-4996-4726-8bea-4d6d8c1b420a', '2f955b42-270c-4362-93ae-9397038c89cc', '44', 'XANH MINT', 10, 'src/data/images/products/main_ddfe58e7.jpg'),
('d244dd6b-c0d1-4968-80a3-4370e424290f', '2f955b42-270c-4362-93ae-9397038c89cc', '45', 'XANH MINT', 10, 'src/data/images/products/main_ddfe58e7.jpg'),
('9faacf45-8e22-40f4-b515-eb919cf34aec', '91bbf46c-bf65-4cb8-bdbf-8e215d1b8509', '38', 'CAM/ĐEN', 10, 'src/data/images/products/main_2fae5107.jpg'),
('1b2ba4f3-b191-4d04-8874-cb8c3ffc71fe', '91bbf46c-bf65-4cb8-bdbf-8e215d1b8509', '39', 'CAM/ĐEN', 10, 'src/data/images/products/main_2fae5107.jpg'),
('e5598a5e-4ce7-4f10-a312-051c3f873703', '91bbf46c-bf65-4cb8-bdbf-8e215d1b8509', '40', 'CAM/ĐEN', 10, 'src/data/images/products/main_2fae5107.jpg'),
('fceb17b2-d060-4838-94d8-c1378851858c', '91bbf46c-bf65-4cb8-bdbf-8e215d1b8509', '41', 'CAM/ĐEN', 10, 'src/data/images/products/main_2fae5107.jpg'),
('c1b6f894-0419-4add-9e12-f8d14aa94ad2', '91bbf46c-bf65-4cb8-bdbf-8e215d1b8509', '42', 'CAM/ĐEN', 10, 'src/data/images/products/main_2fae5107.jpg'),
('af14d1ac-ec5c-4fe5-ab6d-d97903f2e861', '91bbf46c-bf65-4cb8-bdbf-8e215d1b8509', '43', 'CAM/ĐEN', 10, 'src/data/images/products/main_2fae5107.jpg'),
('1f6d4ef2-1f21-44c8-9e4f-a1344fa6e42b', '91bbf46c-bf65-4cb8-bdbf-8e215d1b8509', '44', 'CAM/ĐEN', 10, 'src/data/images/products/main_2fae5107.jpg'),
('d7681bc5-8fa5-43f3-8438-04616388f86f', '91bbf46c-bf65-4cb8-bdbf-8e215d1b8509', '45', 'CAM/ĐEN', 10, 'src/data/images/products/main_2fae5107.jpg'),
('934d947f-becf-44ef-ab43-7ef88f53d85f', '943f3619-4e3e-44f0-bdf0-9d7bf17f48fb', '38', 'XANH LÁ MẠ', 10, 'src/data/images/products/main_3e1dcc08.jpg'),
('31cfe57f-1232-4352-9afd-d52a875df4e7', '943f3619-4e3e-44f0-bdf0-9d7bf17f48fb', '39', 'XANH LÁ MẠ', 10, 'src/data/images/products/main_3e1dcc08.jpg'),
('cc10603e-d35a-4608-8bee-be0c535bb28d', '943f3619-4e3e-44f0-bdf0-9d7bf17f48fb', '40', 'XANH LÁ MẠ', 10, 'src/data/images/products/main_3e1dcc08.jpg'),
('2c777032-9e68-457c-991f-5a28175ff95b', '943f3619-4e3e-44f0-bdf0-9d7bf17f48fb', '41', 'XANH LÁ MẠ', 10, 'src/data/images/products/main_3e1dcc08.jpg'),
('3044fb00-88a5-44cc-bd4c-f0a35d2f50aa', '943f3619-4e3e-44f0-bdf0-9d7bf17f48fb', '42', 'XANH LÁ MẠ', 10, 'src/data/images/products/main_3e1dcc08.jpg'),
('fabc8528-e807-4635-80b3-6c85a226ec8f', '943f3619-4e3e-44f0-bdf0-9d7bf17f48fb', '43', 'XANH LÁ MẠ', 10, 'src/data/images/products/main_3e1dcc08.jpg'),
('6c690269-81c4-4fa2-879e-551440113191', '943f3619-4e3e-44f0-bdf0-9d7bf17f48fb', '44', 'XANH LÁ MẠ', 10, 'src/data/images/products/main_3e1dcc08.jpg'),
('a7553cdf-6c4c-43f9-ae23-24f3ca14feea', '943f3619-4e3e-44f0-bdf0-9d7bf17f48fb', '45', 'XANH LÁ MẠ', 10, 'src/data/images/products/main_3e1dcc08.jpg'),
('d2f180c9-f810-43e3-befd-43ea4c6004d3', '147b162d-6a54-4bff-89cd-d15e9d7b9c5b', '38', 'TÍM/TRẮNG/VÀNG', 10, 'src/data/images/products/main_077c362d.jpg'),
('1376c37e-9a31-4c3b-874b-2814aa48c38a', '147b162d-6a54-4bff-89cd-d15e9d7b9c5b', '39', 'TÍM/TRẮNG/VÀNG', 10, 'src/data/images/products/main_077c362d.jpg'),
('9384666f-63b6-423c-a5a0-0fc0bb64ff86', '147b162d-6a54-4bff-89cd-d15e9d7b9c5b', '40', 'TÍM/TRẮNG/VÀNG', 10, 'src/data/images/products/main_077c362d.jpg'),
('d06b2914-3123-4ebb-9fd0-45b3f14defd7', '147b162d-6a54-4bff-89cd-d15e9d7b9c5b', '41', 'TÍM/TRẮNG/VÀNG', 10, 'src/data/images/products/main_077c362d.jpg'),
('d683522b-b946-43c3-9ff2-3757f03be5ba', '147b162d-6a54-4bff-89cd-d15e9d7b9c5b', '42', 'TÍM/TRẮNG/VÀNG', 10, 'src/data/images/products/main_077c362d.jpg'),
('c20954e6-8958-431d-aa89-734f15cfc248', '147b162d-6a54-4bff-89cd-d15e9d7b9c5b', '43', 'TÍM/TRẮNG/VÀNG', 10, 'src/data/images/products/main_077c362d.jpg'),
('bc9d197a-78f2-4672-a0bf-34d7329fb61f', '147b162d-6a54-4bff-89cd-d15e9d7b9c5b', '44', 'TÍM/TRẮNG/VÀNG', 10, 'src/data/images/products/main_077c362d.jpg'),
('91023091-e6e3-4b0e-a751-1772435debae', '147b162d-6a54-4bff-89cd-d15e9d7b9c5b', '45', 'TÍM/TRẮNG/VÀNG', 10, 'src/data/images/products/main_077c362d.jpg'),
('f2ebf28e-2874-46be-a18d-e4ee33562f67', '4feb2e5e-28db-4b01-be06-5eac2443d86c', '38', 'XÁM/BẠC', 10, 'src/data/images/products/main_73eb4e5b.jpg'),
('be410c89-3f5e-403e-a733-2f3fa9ced8b3', '4feb2e5e-28db-4b01-be06-5eac2443d86c', '39', 'XÁM/BẠC', 10, 'src/data/images/products/main_73eb4e5b.jpg'),
('b6d0ddfd-1129-48c2-9cbf-1f8b3abc3a7d', '4feb2e5e-28db-4b01-be06-5eac2443d86c', '40', 'XÁM/BẠC', 10, 'src/data/images/products/main_73eb4e5b.jpg'),
('bbbf8766-15e0-4cfd-bd67-447666d91e88', '4feb2e5e-28db-4b01-be06-5eac2443d86c', '41', 'XÁM/BẠC', 10, 'src/data/images/products/main_73eb4e5b.jpg'),
('3189481e-b280-49e0-ae32-cf61e64459cf', '4feb2e5e-28db-4b01-be06-5eac2443d86c', '42', 'XÁM/BẠC', 10, 'src/data/images/products/main_73eb4e5b.jpg'),
('8dd44feb-422c-4c93-a804-f3a8843a43ad', '4feb2e5e-28db-4b01-be06-5eac2443d86c', '43', 'XÁM/BẠC', 10, 'src/data/images/products/main_73eb4e5b.jpg'),
('12347b9a-560f-4783-87c7-2273b65fa585', '4feb2e5e-28db-4b01-be06-5eac2443d86c', '44', 'XÁM/BẠC', 10, 'src/data/images/products/main_73eb4e5b.jpg'),
('05e3eaff-fd05-4b9a-ba7e-a638101e22b0', '4feb2e5e-28db-4b01-be06-5eac2443d86c', '45', 'XÁM/BẠC', 10, 'src/data/images/products/main_73eb4e5b.jpg');

INSERT INTO product_variants (variant_id, product_id, size, color, stock, image_url) VALUES
('31b92592-7d13-48c9-ae93-c1419518bc9c', '371cccb0-9827-4b8d-9034-b2883350efc2', '38', 'TRẮNG/XANH MINT', 10, 'src/data/images/products/main_d4d0aedd.jpg'),
('fb052c5f-3e63-476f-a849-19eb076b9a98', '371cccb0-9827-4b8d-9034-b2883350efc2', '39', 'TRẮNG/XANH MINT', 10, 'src/data/images/products/main_d4d0aedd.jpg'),
('a9443872-c2ab-4a9a-b3e0-c90750aeabed', '371cccb0-9827-4b8d-9034-b2883350efc2', '40', 'TRẮNG/XANH MINT', 10, 'src/data/images/products/main_d4d0aedd.jpg'),
('bc30a238-2cfd-4bd9-9455-319c8e6234f6', '371cccb0-9827-4b8d-9034-b2883350efc2', '41', 'TRẮNG/XANH MINT', 10, 'src/data/images/products/main_d4d0aedd.jpg'),
('5a5a756f-2ced-49b7-9cb1-6b61fc798cd9', '371cccb0-9827-4b8d-9034-b2883350efc2', '42', 'TRẮNG/XANH MINT', 10, 'src/data/images/products/main_d4d0aedd.jpg'),
('a925a975-1b7d-4301-8c33-7fd0bd04e2b9', '371cccb0-9827-4b8d-9034-b2883350efc2', '43', 'TRẮNG/XANH MINT', 10, 'src/data/images/products/main_d4d0aedd.jpg'),
('0444cab7-ed01-4d65-840f-8bdc198a5630', '371cccb0-9827-4b8d-9034-b2883350efc2', '44', 'TRẮNG/XANH MINT', 10, 'src/data/images/products/main_d4d0aedd.jpg'),
('38700ff7-dfcb-4c7c-8206-9b51d602c068', '371cccb0-9827-4b8d-9034-b2883350efc2', '45', 'TRẮNG/XANH MINT', 10, 'src/data/images/products/main_d4d0aedd.jpg'),
('6dd09d91-e5ca-4812-8585-88e6c910190d', 'e98e6963-e311-4aee-9676-e9cf9a6f340b', '38', 'TRẮNG/ĐEN/VÀNG', 10, 'src/data/images/products/main_e50a683e.jpg'),
('242e8469-039f-42b7-a811-91c7f85bf6a2', 'e98e6963-e311-4aee-9676-e9cf9a6f340b', '39', 'TRẮNG/ĐEN/VÀNG', 10, 'src/data/images/products/main_e50a683e.jpg'),
('e7bc27a0-7da2-445f-8b6f-9a700bff436c', 'e98e6963-e311-4aee-9676-e9cf9a6f340b', '40', 'TRẮNG/ĐEN/VÀNG', 10, 'src/data/images/products/main_e50a683e.jpg'),
('4ef32a3d-e69e-4754-b6a6-d89d38f14fce', 'e98e6963-e311-4aee-9676-e9cf9a6f340b', '41', 'TRẮNG/ĐEN/VÀNG', 10, 'src/data/images/products/main_e50a683e.jpg'),
('faf0106a-ead4-4f92-8bf6-c68e884598ce', 'e98e6963-e311-4aee-9676-e9cf9a6f340b', '42', 'TRẮNG/ĐEN/VÀNG', 10, 'src/data/images/products/main_e50a683e.jpg'),
('2f5af53e-6861-468b-b83d-0d7c31a079fe', 'e98e6963-e311-4aee-9676-e9cf9a6f340b', '43', 'TRẮNG/ĐEN/VÀNG', 10, 'src/data/images/products/main_e50a683e.jpg'),
('a06f623e-2db4-45f2-94e3-cbc8cb8fe609', 'e98e6963-e311-4aee-9676-e9cf9a6f340b', '44', 'TRẮNG/ĐEN/VÀNG', 10, 'src/data/images/products/main_e50a683e.jpg'),
('050830b1-31aa-4176-b209-49caca13822d', 'e98e6963-e311-4aee-9676-e9cf9a6f340b', '45', 'TRẮNG/ĐEN/VÀNG', 10, 'src/data/images/products/main_e50a683e.jpg'),
('a6cec30a-49c7-4614-a05d-53d4e5e45a45', 'c90b0a0f-18a6-479f-b101-ba8ecf2eb3dc', '38', 'XANH/TRẮNG/ĐỎ', 10, 'src/data/images/products/main_8435116b.jpg'),
('54a44efb-af78-4bea-84f1-ff9ba9b9b32d', 'c90b0a0f-18a6-479f-b101-ba8ecf2eb3dc', '39', 'XANH/TRẮNG/ĐỎ', 10, 'src/data/images/products/main_8435116b.jpg'),
('2c384e9a-a330-4c33-8bc5-a0e6ef10dd41', 'c90b0a0f-18a6-479f-b101-ba8ecf2eb3dc', '40', 'XANH/TRẮNG/ĐỎ', 10, 'src/data/images/products/main_8435116b.jpg'),
('5863aa32-b0b4-4e5e-b2ac-c6bfb3046246', 'c90b0a0f-18a6-479f-b101-ba8ecf2eb3dc', '41', 'XANH/TRẮNG/ĐỎ', 10, 'src/data/images/products/main_8435116b.jpg'),
('cbd5f788-2dca-47ac-bb46-92ac233d8bec', 'c90b0a0f-18a6-479f-b101-ba8ecf2eb3dc', '42', 'XANH/TRẮNG/ĐỎ', 10, 'src/data/images/products/main_8435116b.jpg'),
('6b22d85a-d8e6-4930-9107-a8a76c7ff6b4', 'c90b0a0f-18a6-479f-b101-ba8ecf2eb3dc', '43', 'XANH/TRẮNG/ĐỎ', 10, 'src/data/images/products/main_8435116b.jpg'),
('99695724-8b22-419c-bccb-3d67a383ca76', 'c90b0a0f-18a6-479f-b101-ba8ecf2eb3dc', '44', 'XANH/TRẮNG/ĐỎ', 10, 'src/data/images/products/main_8435116b.jpg'),
('5a5d8f18-714f-46a5-9155-5c72e7d0661d', 'c90b0a0f-18a6-479f-b101-ba8ecf2eb3dc', '45', 'XANH/TRẮNG/ĐỎ', 10, 'src/data/images/products/main_8435116b.jpg'),
('bedcf9b1-01af-4fe1-96e3-0a5842dc0687', '645ee2ce-9f3a-43d4-8e1c-c4098116a90f', '38', 'TRẮNG/XANH', 10, 'src/data/images/products/main_5a3eb980.jpg'),
('d757ee42-243f-4e67-acd3-31593be10dbb', '645ee2ce-9f3a-43d4-8e1c-c4098116a90f', '39', 'TRẮNG/XANH', 10, 'src/data/images/products/main_5a3eb980.jpg'),
('b128e624-ebac-4b78-a2e0-f20396dc9afd', '645ee2ce-9f3a-43d4-8e1c-c4098116a90f', '40', 'TRẮNG/XANH', 10, 'src/data/images/products/main_5a3eb980.jpg'),
('d9fb67b3-c457-4594-89bc-8b9ca333f539', '645ee2ce-9f3a-43d4-8e1c-c4098116a90f', '41', 'TRẮNG/XANH', 10, 'src/data/images/products/main_5a3eb980.jpg'),
('683abb7f-ff83-487f-b7be-c5c2ea65f572', '645ee2ce-9f3a-43d4-8e1c-c4098116a90f', '42', 'TRẮNG/XANH', 10, 'src/data/images/products/main_5a3eb980.jpg'),
('3af6ad56-53f2-485d-9e21-95dec50d6daf', '645ee2ce-9f3a-43d4-8e1c-c4098116a90f', '43', 'TRẮNG/XANH', 10, 'src/data/images/products/main_5a3eb980.jpg'),
('7c127f1d-b341-4290-8555-1bd099aa8b40', '645ee2ce-9f3a-43d4-8e1c-c4098116a90f', '44', 'TRẮNG/XANH', 10, 'src/data/images/products/main_5a3eb980.jpg'),
('917ff765-dad3-4f19-81f2-dc3efc53c60c', '645ee2ce-9f3a-43d4-8e1c-c4098116a90f', '45', 'TRẮNG/XANH', 10, 'src/data/images/products/main_5a3eb980.jpg'),
('8f0bee51-ae79-409f-ada1-65db2a7e51fa', '5aba8ce7-cc1d-467a-981c-952024cba7ab', '38', 'HỒNG TÍM/CAM', 10, 'src/data/images/products/main_321a590e.jpg'),
('36a267f2-f064-46dc-b3b5-aac25802cfe2', '5aba8ce7-cc1d-467a-981c-952024cba7ab', '39', 'HỒNG TÍM/CAM', 10, 'src/data/images/products/main_321a590e.jpg'),
('1d5f8e8a-3f72-400a-8205-2abff0eb4f26', '5aba8ce7-cc1d-467a-981c-952024cba7ab', '40', 'HỒNG TÍM/CAM', 10, 'src/data/images/products/main_321a590e.jpg'),
('a69f1d37-6ed0-48c1-9016-b8e95e78db6e', '5aba8ce7-cc1d-467a-981c-952024cba7ab', '41', 'HỒNG TÍM/CAM', 10, 'src/data/images/products/main_321a590e.jpg'),
('c83d4d4f-1708-4035-a3c3-c52fc1203367', '5aba8ce7-cc1d-467a-981c-952024cba7ab', '42', 'HỒNG TÍM/CAM', 10, 'src/data/images/products/main_321a590e.jpg'),
('d0a693a8-0456-4188-bfe3-9a197448fed3', '5aba8ce7-cc1d-467a-981c-952024cba7ab', '43', 'HỒNG TÍM/CAM', 10, 'src/data/images/products/main_321a590e.jpg'),
('7ba55667-ccad-4689-b671-db67ef729081', '5aba8ce7-cc1d-467a-981c-952024cba7ab', '44', 'HỒNG TÍM/CAM', 10, 'src/data/images/products/main_321a590e.jpg'),
('06b929a4-e3c4-45a4-8b12-ec31f01845ac', '5aba8ce7-cc1d-467a-981c-952024cba7ab', '45', 'HỒNG TÍM/CAM', 10, 'src/data/images/products/main_321a590e.jpg'),
('3515347a-f814-41e9-8815-f409b2e4ef77', '4a44d3a9-024e-46df-94df-801163aa1952', '38', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_9266b7e5.jpg'),
('939d5ee8-905e-46be-abee-2f357bd63e37', '4a44d3a9-024e-46df-94df-801163aa1952', '39', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_9266b7e5.jpg'),
('e816cd68-e011-41c0-9083-44ba24a83c8d', '4a44d3a9-024e-46df-94df-801163aa1952', '40', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_9266b7e5.jpg'),
('8dc36d9e-8fec-4a8b-9609-750541ff908e', '4a44d3a9-024e-46df-94df-801163aa1952', '41', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_9266b7e5.jpg'),
('a0d07f2a-042c-412a-8cdd-a87eac9aad52', '4a44d3a9-024e-46df-94df-801163aa1952', '42', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_9266b7e5.jpg'),
('9462e598-eca5-4227-ae47-c1d794a1029c', '4a44d3a9-024e-46df-94df-801163aa1952', '43', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_9266b7e5.jpg'),
('12e45208-ff21-4afc-bb3f-535e87cb3ec6', '4a44d3a9-024e-46df-94df-801163aa1952', '44', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_9266b7e5.jpg'),
('375b5f8d-403f-42f6-b198-0b08077f6e9a', '4a44d3a9-024e-46df-94df-801163aa1952', '45', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_9266b7e5.jpg'),
('8070301a-e720-4780-bdc1-1a79ea71fda9', 'abf05b3b-1ae0-418e-9190-1500c416f029', '38', 'TRẮNG/BẠC/XANH', 10, 'src/data/images/products/main_7e6de8b6.jpg'),
('9bc1b88f-dfdb-454e-b835-53686a808ccd', 'abf05b3b-1ae0-418e-9190-1500c416f029', '39', 'TRẮNG/BẠC/XANH', 10, 'src/data/images/products/main_7e6de8b6.jpg'),
('52a87580-96e3-479d-a3ac-c487784cbfad', 'abf05b3b-1ae0-418e-9190-1500c416f029', '40', 'TRẮNG/BẠC/XANH', 10, 'src/data/images/products/main_7e6de8b6.jpg'),
('9c201efa-2806-44b9-9652-603aa619144e', 'abf05b3b-1ae0-418e-9190-1500c416f029', '41', 'TRẮNG/BẠC/XANH', 10, 'src/data/images/products/main_7e6de8b6.jpg'),
('708909f6-d38e-401c-b546-15973eaa664e', 'abf05b3b-1ae0-418e-9190-1500c416f029', '42', 'TRẮNG/BẠC/XANH', 10, 'src/data/images/products/main_7e6de8b6.jpg'),
('8ea387bc-e00e-4e07-8d47-aaf86ed5a34d', 'abf05b3b-1ae0-418e-9190-1500c416f029', '43', 'TRẮNG/BẠC/XANH', 10, 'src/data/images/products/main_7e6de8b6.jpg'),
('308b7ff8-4ed0-41e3-badc-5f28a17cf90a', 'abf05b3b-1ae0-418e-9190-1500c416f029', '44', 'TRẮNG/BẠC/XANH', 10, 'src/data/images/products/main_7e6de8b6.jpg'),
('6ab78d07-b7e0-4ae6-b4e8-6107eaa13f35', 'abf05b3b-1ae0-418e-9190-1500c416f029', '45', 'TRẮNG/BẠC/XANH', 10, 'src/data/images/products/main_7e6de8b6.jpg'),
('f4863709-b8e9-466c-bf90-36596eccb30e', '4f1d6e2b-f14f-4ddf-ab6c-cb829586766d', '38', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_5c64f249.jpg'),
('9ea8e642-fe6e-4469-b355-eb0786589065', '4f1d6e2b-f14f-4ddf-ab6c-cb829586766d', '39', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_5c64f249.jpg'),
('565ac6a0-1d83-49bd-8293-601451d07dbb', '4f1d6e2b-f14f-4ddf-ab6c-cb829586766d', '40', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_5c64f249.jpg'),
('2f00865a-4b1a-4768-9031-730919ee72c8', '4f1d6e2b-f14f-4ddf-ab6c-cb829586766d', '41', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_5c64f249.jpg'),
('878bac8b-1369-4f8e-aa08-26773e42a325', '4f1d6e2b-f14f-4ddf-ab6c-cb829586766d', '42', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_5c64f249.jpg'),
('7b3c3560-d44e-495e-bba4-29cdee1d468a', '4f1d6e2b-f14f-4ddf-ab6c-cb829586766d', '43', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_5c64f249.jpg'),
('8a7f4a6f-7c12-4719-a934-077393b0bea3', '4f1d6e2b-f14f-4ddf-ab6c-cb829586766d', '44', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_5c64f249.jpg'),
('34353329-68ce-48e5-ba81-fae47957f007', '4f1d6e2b-f14f-4ddf-ab6c-cb829586766d', '45', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_5c64f249.jpg'),
('86537a8e-fd46-40ea-b043-d8442194b066', '9a951f91-eb0a-4770-95a2-6b29954a2a46', '38', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_8d8a14f7.jpg'),
('7b8eecfd-fbb0-432f-8ddd-88995ea3b5ec', '9a951f91-eb0a-4770-95a2-6b29954a2a46', '39', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_8d8a14f7.jpg'),
('9352c70c-b92b-4b33-b16a-1c0a6b2f2225', '9a951f91-eb0a-4770-95a2-6b29954a2a46', '40', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_8d8a14f7.jpg'),
('d17fc050-2925-443b-852a-a740e7f8ae6e', '9a951f91-eb0a-4770-95a2-6b29954a2a46', '41', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_8d8a14f7.jpg'),
('e2a0371e-39f9-416f-b932-c7ce50a838d5', '9a951f91-eb0a-4770-95a2-6b29954a2a46', '42', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_8d8a14f7.jpg'),
('3418beb5-8e69-4d24-adbc-a3abe78dd6c7', '9a951f91-eb0a-4770-95a2-6b29954a2a46', '43', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_8d8a14f7.jpg'),
('313ebf25-a618-4255-b469-fc33ed0ae107', '9a951f91-eb0a-4770-95a2-6b29954a2a46', '44', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_8d8a14f7.jpg'),
('a4a7a160-ba94-48ed-9e71-e0e71dfd7ec0', '9a951f91-eb0a-4770-95a2-6b29954a2a46', '45', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_8d8a14f7.jpg'),
('b538cb1b-737b-4be5-a73d-cfce74cddaec', '0423e3eb-d982-460f-b1e8-3ab99b7f4afc', '38', 'TÍM THAN', 10, 'src/data/images/products/main_5455f661.jpg'),
('6d3ef04c-0b3d-47da-97bc-e11b1a9b217d', '0423e3eb-d982-460f-b1e8-3ab99b7f4afc', '39', 'TÍM THAN', 10, 'src/data/images/products/main_5455f661.jpg'),
('d0b58566-df31-46f5-a6e1-3d38225ddc9c', '0423e3eb-d982-460f-b1e8-3ab99b7f4afc', '40', 'TÍM THAN', 10, 'src/data/images/products/main_5455f661.jpg'),
('4c7339de-2c1d-4656-9582-50651d4baf1d', '0423e3eb-d982-460f-b1e8-3ab99b7f4afc', '41', 'TÍM THAN', 10, 'src/data/images/products/main_5455f661.jpg'),
('f9a8caa3-1969-4270-a37a-0be6f4bc7595', '0423e3eb-d982-460f-b1e8-3ab99b7f4afc', '42', 'TÍM THAN', 10, 'src/data/images/products/main_5455f661.jpg'),
('68e94aca-3a9a-4842-bea0-2456f4e629df', '0423e3eb-d982-460f-b1e8-3ab99b7f4afc', '43', 'TÍM THAN', 10, 'src/data/images/products/main_5455f661.jpg'),
('3af815bb-35ea-4003-b767-cb2214c213b5', '0423e3eb-d982-460f-b1e8-3ab99b7f4afc', '44', 'TÍM THAN', 10, 'src/data/images/products/main_5455f661.jpg'),
('c4390386-af7f-4a1a-86cf-8f946074e34d', '0423e3eb-d982-460f-b1e8-3ab99b7f4afc', '45', 'TÍM THAN', 10, 'src/data/images/products/main_5455f661.jpg'),
('4b4f6e17-de12-4538-9cad-216c803c6181', 'cbeb21cc-4994-45b2-a276-12cb673b009c', '38', 'HỒNG/XANH', 10, 'src/data/images/products/main_19e0179d.jpg'),
('dd1c94a5-a09d-43fd-8d5f-7f9ca2fde316', 'cbeb21cc-4994-45b2-a276-12cb673b009c', '39', 'HỒNG/XANH', 10, 'src/data/images/products/main_19e0179d.jpg'),
('6708fd15-e8db-4cb9-bff7-8626205e7142', 'cbeb21cc-4994-45b2-a276-12cb673b009c', '40', 'HỒNG/XANH', 10, 'src/data/images/products/main_19e0179d.jpg'),
('b7aa3f97-fefd-4a93-981e-84d1654ec06f', 'cbeb21cc-4994-45b2-a276-12cb673b009c', '41', 'HỒNG/XANH', 10, 'src/data/images/products/main_19e0179d.jpg'),
('e80e59c0-6ef0-4c87-bb70-dd48d9cf8f31', 'cbeb21cc-4994-45b2-a276-12cb673b009c', '42', 'HỒNG/XANH', 10, 'src/data/images/products/main_19e0179d.jpg'),
('a3328e07-8154-4401-b8e2-3ea4eefa1616', 'cbeb21cc-4994-45b2-a276-12cb673b009c', '43', 'HỒNG/XANH', 10, 'src/data/images/products/main_19e0179d.jpg'),
('a20957d3-da31-4e04-a142-1e4773bcac1b', 'cbeb21cc-4994-45b2-a276-12cb673b009c', '44', 'HỒNG/XANH', 10, 'src/data/images/products/main_19e0179d.jpg'),
('9251f5fc-c011-478a-98ae-a1ebbf7d1a2a', 'cbeb21cc-4994-45b2-a276-12cb673b009c', '45', 'HỒNG/XANH', 10, 'src/data/images/products/main_19e0179d.jpg'),
('3e056e7f-43bb-4369-aacd-816bfe5fa195', '6f8e3679-9547-4842-8771-9feb76048992', '38', 'XANH/TRẮNG', 10, 'src/data/images/products/main_1fb7a6d6.jpg'),
('a87e141d-4b0b-42a2-8b44-365c07bc164b', '6f8e3679-9547-4842-8771-9feb76048992', '39', 'XANH/TRẮNG', 10, 'src/data/images/products/main_1fb7a6d6.jpg'),
('74e5bad7-483b-4689-9581-17538b203a56', '6f8e3679-9547-4842-8771-9feb76048992', '40', 'XANH/TRẮNG', 10, 'src/data/images/products/main_1fb7a6d6.jpg'),
('bdaddba2-79d3-4966-aaa5-b0a8ca60ffb0', '6f8e3679-9547-4842-8771-9feb76048992', '41', 'XANH/TRẮNG', 10, 'src/data/images/products/main_1fb7a6d6.jpg'),
('a5db6559-c506-4fda-99a7-e2ab0a4a8fc7', '6f8e3679-9547-4842-8771-9feb76048992', '42', 'XANH/TRẮNG', 10, 'src/data/images/products/main_1fb7a6d6.jpg'),
('e8819911-2a9d-43c8-9a6e-26f78e3af8c3', '6f8e3679-9547-4842-8771-9feb76048992', '43', 'XANH/TRẮNG', 10, 'src/data/images/products/main_1fb7a6d6.jpg'),
('f5d242ef-e38e-480a-9a47-d753e03d0aa7', '6f8e3679-9547-4842-8771-9feb76048992', '44', 'XANH/TRẮNG', 10, 'src/data/images/products/main_1fb7a6d6.jpg'),
('3b25a2ec-86fe-4a80-b94d-1c9d4de75ca0', '6f8e3679-9547-4842-8771-9feb76048992', '45', 'XANH/TRẮNG', 10, 'src/data/images/products/main_1fb7a6d6.jpg'),
('824974db-be8f-4625-ac29-438f51efdb79', '05a03d62-70cd-4435-b094-4c460972f73d', '38', 'XANH NAVY', 10, 'src/data/images/products/main_ea837a86.jpg'),
('92890d83-3e0c-4d2e-9eed-0229a229d489', '05a03d62-70cd-4435-b094-4c460972f73d', '39', 'XANH NAVY', 10, 'src/data/images/products/main_ea837a86.jpg'),
('bcadb111-d0bb-461c-b541-d1c939ec9e66', '05a03d62-70cd-4435-b094-4c460972f73d', '40', 'XANH NAVY', 10, 'src/data/images/products/main_ea837a86.jpg'),
('ee03a00d-88d9-4095-b27f-5e3faf345791', '05a03d62-70cd-4435-b094-4c460972f73d', '41', 'XANH NAVY', 10, 'src/data/images/products/main_ea837a86.jpg');

INSERT INTO product_variants (variant_id, product_id, size, color, stock, image_url) VALUES
('4f4cb6bd-1648-4d2e-a4ca-60f1eff14265', '05a03d62-70cd-4435-b094-4c460972f73d', '42', 'XANH NAVY', 10, 'src/data/images/products/main_ea837a86.jpg'),
('831181b9-81d7-47af-ad70-7b1c92b990ac', '05a03d62-70cd-4435-b094-4c460972f73d', '43', 'XANH NAVY', 10, 'src/data/images/products/main_ea837a86.jpg'),
('33b730c1-3b0b-40f1-a3c8-ae1421dfdbb5', '05a03d62-70cd-4435-b094-4c460972f73d', '44', 'XANH NAVY', 10, 'src/data/images/products/main_ea837a86.jpg'),
('5a9b7712-eec3-42b1-8c4b-ea3a65c04f9b', '05a03d62-70cd-4435-b094-4c460972f73d', '45', 'XANH NAVY', 10, 'src/data/images/products/main_ea837a86.jpg'),
('acafbd6b-946b-46b6-910a-9f20564a8231', '812f58f9-52d4-4ada-8624-e311e36dd05c', '38', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_2af790c0.jpg'),
('3459b9ad-194e-4b16-a1ec-800e9a100c3d', '812f58f9-52d4-4ada-8624-e311e36dd05c', '39', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_2af790c0.jpg'),
('38d4354c-0aed-4716-aad5-c152c8005025', '812f58f9-52d4-4ada-8624-e311e36dd05c', '40', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_2af790c0.jpg'),
('4e2cf1e9-5054-4b6b-9b9b-2f5802b32feb', '812f58f9-52d4-4ada-8624-e311e36dd05c', '41', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_2af790c0.jpg'),
('638bfc38-5a19-4e43-a873-04bffc20d580', '812f58f9-52d4-4ada-8624-e311e36dd05c', '42', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_2af790c0.jpg'),
('76c03579-15fd-4d48-ae62-cc86ed7d8d5a', '812f58f9-52d4-4ada-8624-e311e36dd05c', '43', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_2af790c0.jpg'),
('a96bbfe9-c52d-45d7-afa3-6a05e094ac01', '812f58f9-52d4-4ada-8624-e311e36dd05c', '44', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_2af790c0.jpg'),
('87d0d39f-43da-4b4a-80c2-afd635d13710', '812f58f9-52d4-4ada-8624-e311e36dd05c', '45', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_2af790c0.jpg'),
('5c66d95f-6248-48f0-861b-9a5154e3b93f', 'eb652dcb-6cfc-4d3d-9233-a66b0b563852', '38', 'CAM/XANH', 10, 'src/data/images/products/main_f25e9775.jpg'),
('3afee7b5-b80f-4c41-bb69-ad868883fc70', 'eb652dcb-6cfc-4d3d-9233-a66b0b563852', '39', 'CAM/XANH', 10, 'src/data/images/products/main_f25e9775.jpg'),
('485cfd93-81e0-4eda-8bb4-23f15a030387', 'eb652dcb-6cfc-4d3d-9233-a66b0b563852', '40', 'CAM/XANH', 10, 'src/data/images/products/main_f25e9775.jpg'),
('1f65de69-b0aa-4350-be87-6491de65b841', 'eb652dcb-6cfc-4d3d-9233-a66b0b563852', '41', 'CAM/XANH', 10, 'src/data/images/products/main_f25e9775.jpg'),
('9f43c81a-359b-4c9c-bb10-07fc94ab2c0e', 'eb652dcb-6cfc-4d3d-9233-a66b0b563852', '42', 'CAM/XANH', 10, 'src/data/images/products/main_f25e9775.jpg'),
('75d8fe9a-071c-495c-9df6-2ceff390f815', 'eb652dcb-6cfc-4d3d-9233-a66b0b563852', '43', 'CAM/XANH', 10, 'src/data/images/products/main_f25e9775.jpg'),
('1ce23529-63f9-43f7-aea6-684d464afcce', 'eb652dcb-6cfc-4d3d-9233-a66b0b563852', '44', 'CAM/XANH', 10, 'src/data/images/products/main_f25e9775.jpg'),
('5499ddb0-6620-44f5-96d8-439f3183fb88', 'eb652dcb-6cfc-4d3d-9233-a66b0b563852', '45', 'CAM/XANH', 10, 'src/data/images/products/main_f25e9775.jpg'),
('71337060-3b50-43c2-9bbd-622c4a6a7e8d', '601a37f1-4645-4bd7-8631-71802ffc0f4f', '38', 'XANH LÁ/TÍM', 10, 'src/data/images/products/main_90da2e62.jpg'),
('c80728f6-8adb-4169-adfe-2c2da0dbc9f1', '601a37f1-4645-4bd7-8631-71802ffc0f4f', '39', 'XANH LÁ/TÍM', 10, 'src/data/images/products/main_90da2e62.jpg'),
('31bfd1df-114d-489b-8577-989fe8b8c317', '601a37f1-4645-4bd7-8631-71802ffc0f4f', '40', 'XANH LÁ/TÍM', 10, 'src/data/images/products/main_90da2e62.jpg'),
('1e99ebf5-6828-4bf6-85e6-fd7fc89d205b', '601a37f1-4645-4bd7-8631-71802ffc0f4f', '41', 'XANH LÁ/TÍM', 10, 'src/data/images/products/main_90da2e62.jpg'),
('71d28e18-9e5d-403a-a3ef-3f57369f18cf', '601a37f1-4645-4bd7-8631-71802ffc0f4f', '42', 'XANH LÁ/TÍM', 10, 'src/data/images/products/main_90da2e62.jpg'),
('8428b76f-85c2-4819-991c-65d7c19657af', '601a37f1-4645-4bd7-8631-71802ffc0f4f', '43', 'XANH LÁ/TÍM', 10, 'src/data/images/products/main_90da2e62.jpg'),
('da2a066e-e534-4d05-990d-0792ac8b8628', '601a37f1-4645-4bd7-8631-71802ffc0f4f', '44', 'XANH LÁ/TÍM', 10, 'src/data/images/products/main_90da2e62.jpg'),
('a5b353e5-4238-436c-b514-4c9804ea480c', '601a37f1-4645-4bd7-8631-71802ffc0f4f', '45', 'XANH LÁ/TÍM', 10, 'src/data/images/products/main_90da2e62.jpg'),
('7cd0a4b1-0563-4871-bee1-c605ade1ab24', '3e7e77f5-8a6d-4ed3-b19d-44b205280ed1', '38', 'XANH NAVY/TRẮNG', 10, 'src/data/images/products/main_0e79a043.jpg'),
('30a8434d-4935-4306-a721-1f2b30ec5802', '3e7e77f5-8a6d-4ed3-b19d-44b205280ed1', '39', 'XANH NAVY/TRẮNG', 10, 'src/data/images/products/main_0e79a043.jpg'),
('9b150e7d-8164-4988-b324-468fdf429eda', '3e7e77f5-8a6d-4ed3-b19d-44b205280ed1', '40', 'XANH NAVY/TRẮNG', 10, 'src/data/images/products/main_0e79a043.jpg'),
('ab27a42b-7088-4e97-806a-84dc1d88dc79', '3e7e77f5-8a6d-4ed3-b19d-44b205280ed1', '41', 'XANH NAVY/TRẮNG', 10, 'src/data/images/products/main_0e79a043.jpg'),
('b97cec11-b0a3-4106-b186-194e4df3fcb7', '3e7e77f5-8a6d-4ed3-b19d-44b205280ed1', '42', 'XANH NAVY/TRẮNG', 10, 'src/data/images/products/main_0e79a043.jpg'),
('5794acef-63b3-4d86-8daf-ef48e752c619', '3e7e77f5-8a6d-4ed3-b19d-44b205280ed1', '43', 'XANH NAVY/TRẮNG', 10, 'src/data/images/products/main_0e79a043.jpg'),
('a8c9586b-880b-45b0-9ceb-853ffcf575ff', '3e7e77f5-8a6d-4ed3-b19d-44b205280ed1', '44', 'XANH NAVY/TRẮNG', 10, 'src/data/images/products/main_0e79a043.jpg'),
('148bd200-91d5-4afd-bd7d-7f714aab5b25', '3e7e77f5-8a6d-4ed3-b19d-44b205280ed1', '45', 'XANH NAVY/TRẮNG', 10, 'src/data/images/products/main_0e79a043.jpg'),
('7aa6446f-e33c-40e8-93e3-9e9eb39167c5', 'b3faeb92-6858-45e5-b6a4-6d9066f8dc68', '38', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_77e3c187.jpg'),
('08a3218e-e162-4b00-a4a4-787eba24c887', 'b3faeb92-6858-45e5-b6a4-6d9066f8dc68', '39', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_77e3c187.jpg'),
('76c3675a-89d6-4aa1-a9ac-a92291642f90', 'b3faeb92-6858-45e5-b6a4-6d9066f8dc68', '40', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_77e3c187.jpg'),
('57141b2d-dcb2-4429-bf21-a3769d109965', 'b3faeb92-6858-45e5-b6a4-6d9066f8dc68', '41', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_77e3c187.jpg'),
('45f46818-48bf-4ee3-835b-77b7428d54ba', 'b3faeb92-6858-45e5-b6a4-6d9066f8dc68', '42', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_77e3c187.jpg'),
('0fbdc5ed-fb0c-4e05-9fcf-d5a8c2ff5b47', 'b3faeb92-6858-45e5-b6a4-6d9066f8dc68', '43', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_77e3c187.jpg'),
('b86673cb-835a-4051-9192-f03fa84d4e19', 'b3faeb92-6858-45e5-b6a4-6d9066f8dc68', '44', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_77e3c187.jpg'),
('06b221e5-7ecc-4e14-8eb9-967b9a81804a', 'b3faeb92-6858-45e5-b6a4-6d9066f8dc68', '45', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_77e3c187.jpg'),
('a39f86fb-551f-4a21-a5ff-9a4e99d2c249', '502ac2d2-7b39-4e60-ba18-4b62f5dbd5c4', '38', 'TRẮNG', 10, 'src/data/images/products/main_54d6bcda.jpg'),
('db2f47ad-c21c-4607-8122-cd42c4ab54dd', '502ac2d2-7b39-4e60-ba18-4b62f5dbd5c4', '39', 'TRẮNG', 10, 'src/data/images/products/main_54d6bcda.jpg'),
('94381b43-f55b-4897-8fc9-5a010ced2417', '502ac2d2-7b39-4e60-ba18-4b62f5dbd5c4', '40', 'TRẮNG', 10, 'src/data/images/products/main_54d6bcda.jpg'),
('c3985d4d-6210-44d4-8210-8871214f0ab2', '502ac2d2-7b39-4e60-ba18-4b62f5dbd5c4', '41', 'TRẮNG', 10, 'src/data/images/products/main_54d6bcda.jpg'),
('a7a68eec-619c-4e23-94f4-7b6b130c4eaa', '502ac2d2-7b39-4e60-ba18-4b62f5dbd5c4', '42', 'TRẮNG', 10, 'src/data/images/products/main_54d6bcda.jpg'),
('1cf4e66c-d8d9-4f3d-8c33-ca912396cf83', '502ac2d2-7b39-4e60-ba18-4b62f5dbd5c4', '43', 'TRẮNG', 10, 'src/data/images/products/main_54d6bcda.jpg'),
('4f295f03-aa79-4b50-8ae4-3c1d6e4155e8', '502ac2d2-7b39-4e60-ba18-4b62f5dbd5c4', '44', 'TRẮNG', 10, 'src/data/images/products/main_54d6bcda.jpg'),
('787f5a1f-e70f-4f65-a9c5-c3d6d71bf8b6', '502ac2d2-7b39-4e60-ba18-4b62f5dbd5c4', '45', 'TRẮNG', 10, 'src/data/images/products/main_54d6bcda.jpg'),
('66ffb645-346f-49d9-85ba-928c445eea70', '108b2618-0354-4365-8da2-bdf5eaeb3165', '38', 'TRẮNG/XANH', 10, 'src/data/images/products/main_7285e37f.jpg'),
('693883a2-9365-439a-9c52-7761ddf58067', '108b2618-0354-4365-8da2-bdf5eaeb3165', '39', 'TRẮNG/XANH', 10, 'src/data/images/products/main_7285e37f.jpg'),
('32e38baf-add8-4643-a1c5-3ad5ae943d86', '108b2618-0354-4365-8da2-bdf5eaeb3165', '40', 'TRẮNG/XANH', 10, 'src/data/images/products/main_7285e37f.jpg'),
('a0c3b508-1901-42b8-bb1b-494b6a8b178d', '108b2618-0354-4365-8da2-bdf5eaeb3165', '41', 'TRẮNG/XANH', 10, 'src/data/images/products/main_7285e37f.jpg'),
('34d61e45-755e-4d3f-903d-073929a45b21', '108b2618-0354-4365-8da2-bdf5eaeb3165', '42', 'TRẮNG/XANH', 10, 'src/data/images/products/main_7285e37f.jpg'),
('16b11532-cc1d-41f9-9d03-e7e0e4d90642', '108b2618-0354-4365-8da2-bdf5eaeb3165', '43', 'TRẮNG/XANH', 10, 'src/data/images/products/main_7285e37f.jpg'),
('1c308936-3814-4b9f-afca-c4a8c22e69d3', '108b2618-0354-4365-8da2-bdf5eaeb3165', '44', 'TRẮNG/XANH', 10, 'src/data/images/products/main_7285e37f.jpg'),
('e80bd796-5ed5-429d-8ee2-07ae42eec829', '108b2618-0354-4365-8da2-bdf5eaeb3165', '45', 'TRẮNG/XANH', 10, 'src/data/images/products/main_7285e37f.jpg'),
('088bba59-22e8-4d44-91f5-2ba2bad26ff7', '4ed0296a-edb1-42da-967b-e09055a4ebeb', '38', 'XANH CHUỐI', 10, 'src/data/images/products/main_3afd770c.jpg'),
('573980dd-0733-4134-9273-909ff95e891c', '4ed0296a-edb1-42da-967b-e09055a4ebeb', '39', 'XANH CHUỐI', 10, 'src/data/images/products/main_3afd770c.jpg'),
('a4d4f60c-1bbb-4d3e-8696-bd7b25a43013', '4ed0296a-edb1-42da-967b-e09055a4ebeb', '40', 'XANH CHUỐI', 10, 'src/data/images/products/main_3afd770c.jpg'),
('e6ba3793-29b0-42fa-b7d4-cd9bc88cb334', '4ed0296a-edb1-42da-967b-e09055a4ebeb', '41', 'XANH CHUỐI', 10, 'src/data/images/products/main_3afd770c.jpg'),
('d7ded2b9-7dbb-444c-b518-a94ace02945a', '4ed0296a-edb1-42da-967b-e09055a4ebeb', '42', 'XANH CHUỐI', 10, 'src/data/images/products/main_3afd770c.jpg'),
('a0ba853a-fd71-49b0-ad00-1e2488cc02c8', '4ed0296a-edb1-42da-967b-e09055a4ebeb', '43', 'XANH CHUỐI', 10, 'src/data/images/products/main_3afd770c.jpg'),
('a678034a-8cf0-4b36-b0fb-03babaed5aee', '4ed0296a-edb1-42da-967b-e09055a4ebeb', '44', 'XANH CHUỐI', 10, 'src/data/images/products/main_3afd770c.jpg'),
('6659151d-b3b7-41f0-a3cd-8ba9d21805ff', '4ed0296a-edb1-42da-967b-e09055a4ebeb', '45', 'XANH CHUỐI', 10, 'src/data/images/products/main_3afd770c.jpg'),
('5aaa2a37-c7cb-48ee-9bc9-bf1b75d6b6e5', '27f97f10-04e5-49b4-aec4-fc2bba78be22', '38', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_2c23ea24.jpg'),
('342acfc7-e518-4e53-9a5f-461a4e2764d8', '27f97f10-04e5-49b4-aec4-fc2bba78be22', '39', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_2c23ea24.jpg'),
('aa6475d0-07a2-47b8-a8e7-4228062e87f0', '27f97f10-04e5-49b4-aec4-fc2bba78be22', '40', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_2c23ea24.jpg'),
('9ef74839-a183-4379-bdef-e770a99d6f92', '27f97f10-04e5-49b4-aec4-fc2bba78be22', '41', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_2c23ea24.jpg'),
('83d52a15-e2a4-4b95-9a1d-f693b71d6fd1', '27f97f10-04e5-49b4-aec4-fc2bba78be22', '42', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_2c23ea24.jpg'),
('066b08d8-e0e5-48ed-b57d-4625ea77a617', '27f97f10-04e5-49b4-aec4-fc2bba78be22', '43', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_2c23ea24.jpg'),
('dc61ee18-1d4e-4f8a-bccc-d4b7be6f28e2', '27f97f10-04e5-49b4-aec4-fc2bba78be22', '44', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_2c23ea24.jpg'),
('faf5fcc9-68e5-4386-9245-2d14e62267e5', '27f97f10-04e5-49b4-aec4-fc2bba78be22', '45', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_2c23ea24.jpg'),
('4feb3f95-ab73-4bcd-a8bb-fcc1718b650e', '661ed274-000f-4818-966e-d46683e0b939', '38', 'BẠC/VÀNG', 10, 'src/data/images/products/main_494113c1.jpg'),
('57af851a-2863-4883-8b23-40be2d8a5306', '661ed274-000f-4818-966e-d46683e0b939', '39', 'BẠC/VÀNG', 10, 'src/data/images/products/main_494113c1.jpg'),
('754ec557-1e36-4be3-815d-eaa5129b4937', '661ed274-000f-4818-966e-d46683e0b939', '40', 'BẠC/VÀNG', 10, 'src/data/images/products/main_494113c1.jpg'),
('9293a02a-d2c5-4070-8d08-a3f1992e1216', '661ed274-000f-4818-966e-d46683e0b939', '41', 'BẠC/VÀNG', 10, 'src/data/images/products/main_494113c1.jpg'),
('32e09216-fbb9-4544-b3bd-9627a3309e58', '661ed274-000f-4818-966e-d46683e0b939', '42', 'BẠC/VÀNG', 10, 'src/data/images/products/main_494113c1.jpg'),
('f31a40b3-6581-4632-a6df-45c0c6f188f3', '661ed274-000f-4818-966e-d46683e0b939', '43', 'BẠC/VÀNG', 10, 'src/data/images/products/main_494113c1.jpg'),
('c95d7bb9-e38c-4a65-9abf-c5d7f3678dc2', '661ed274-000f-4818-966e-d46683e0b939', '44', 'BẠC/VÀNG', 10, 'src/data/images/products/main_494113c1.jpg'),
('3b7d34a4-da88-4a5e-a146-9926c208e73a', '661ed274-000f-4818-966e-d46683e0b939', '45', 'BẠC/VÀNG', 10, 'src/data/images/products/main_494113c1.jpg'),
('58b0d1b5-4641-47b9-8625-5dc3c3c754ab', 'fc650ced-8b88-44ee-8e5d-ba7d712d76bd', '38', 'TRẮNG KEM', 10, 'src/data/images/products/main_2a7e4aca.jpg'),
('56c70d76-030c-49ba-bca6-09b57b308ee3', 'fc650ced-8b88-44ee-8e5d-ba7d712d76bd', '39', 'TRẮNG KEM', 10, 'src/data/images/products/main_2a7e4aca.jpg'),
('9ceeec0e-5c51-491d-963b-84e012d094fe', 'fc650ced-8b88-44ee-8e5d-ba7d712d76bd', '40', 'TRẮNG KEM', 10, 'src/data/images/products/main_2a7e4aca.jpg'),
('6bbc51c2-71d1-4d04-af24-0f6b8e2997e3', 'fc650ced-8b88-44ee-8e5d-ba7d712d76bd', '41', 'TRẮNG KEM', 10, 'src/data/images/products/main_2a7e4aca.jpg'),
('73392cc5-3463-4cc3-bce4-39f8fbaeec92', 'fc650ced-8b88-44ee-8e5d-ba7d712d76bd', '42', 'TRẮNG KEM', 10, 'src/data/images/products/main_2a7e4aca.jpg'),
('dc336baa-f056-492a-ab02-ccce9d68055a', 'fc650ced-8b88-44ee-8e5d-ba7d712d76bd', '43', 'TRẮNG KEM', 10, 'src/data/images/products/main_2a7e4aca.jpg'),
('b2042968-91f5-40dc-9be6-5950ff8fc6b7', 'fc650ced-8b88-44ee-8e5d-ba7d712d76bd', '44', 'TRẮNG KEM', 10, 'src/data/images/products/main_2a7e4aca.jpg'),
('a17604a9-eeec-4a6f-b1f4-4e42d2fb8971', 'fc650ced-8b88-44ee-8e5d-ba7d712d76bd', '45', 'TRẮNG KEM', 10, 'src/data/images/products/main_2a7e4aca.jpg'),
('bf7b7453-673a-48e1-8408-0eb5cd58d922', '7ded5777-a60f-47dd-9361-b419f9d29559', '38', 'VÀNG/TRẮNG', 10, 'src/data/images/products/main_894e1b62.jpg'),
('d0795853-8c20-4958-a032-90d4ea4b594e', '7ded5777-a60f-47dd-9361-b419f9d29559', '39', 'VÀNG/TRẮNG', 10, 'src/data/images/products/main_894e1b62.jpg'),
('580a9c64-9223-4e74-a875-f6d27d953eb7', '7ded5777-a60f-47dd-9361-b419f9d29559', '40', 'VÀNG/TRẮNG', 10, 'src/data/images/products/main_894e1b62.jpg'),
('98f851b6-121e-4ef2-8d7d-7ca5263aef10', '7ded5777-a60f-47dd-9361-b419f9d29559', '41', 'VÀNG/TRẮNG', 10, 'src/data/images/products/main_894e1b62.jpg'),
('e228cbc5-6c8d-4ff8-a065-f9f3c419cbba', '7ded5777-a60f-47dd-9361-b419f9d29559', '42', 'VÀNG/TRẮNG', 10, 'src/data/images/products/main_894e1b62.jpg'),
('ed53da36-021e-4f4d-b654-f64c6810d9e8', '7ded5777-a60f-47dd-9361-b419f9d29559', '43', 'VÀNG/TRẮNG', 10, 'src/data/images/products/main_894e1b62.jpg'),
('ce71004d-0e9f-41eb-8c1c-da4ed46937b2', '7ded5777-a60f-47dd-9361-b419f9d29559', '44', 'VÀNG/TRẮNG', 10, 'src/data/images/products/main_894e1b62.jpg'),
('7c1f8ef8-c056-425e-a039-4533953ce9da', '7ded5777-a60f-47dd-9361-b419f9d29559', '45', 'VÀNG/TRẮNG', 10, 'src/data/images/products/main_894e1b62.jpg');

INSERT INTO product_variants (variant_id, product_id, size, color, stock, image_url) VALUES
('3be00c41-04e2-48d6-8ba8-16d05c1ad5ca', 'ba0127cf-6bbf-4fb5-871e-54ba62053aa1', '38', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_c956ba4a.jpg'),
('0f0e3ed7-4dd6-4626-803a-991dcb2aa4a8', 'ba0127cf-6bbf-4fb5-871e-54ba62053aa1', '39', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_c956ba4a.jpg'),
('c8738c84-e711-4302-a03e-fbe4db8bbbf6', 'ba0127cf-6bbf-4fb5-871e-54ba62053aa1', '40', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_c956ba4a.jpg'),
('84e763fa-b699-4b4f-a4f9-25098471ca44', 'ba0127cf-6bbf-4fb5-871e-54ba62053aa1', '41', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_c956ba4a.jpg'),
('ad7677cf-789e-4404-a847-46787782e645', 'ba0127cf-6bbf-4fb5-871e-54ba62053aa1', '42', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_c956ba4a.jpg'),
('b2968075-1029-452d-b948-c05450981115', 'ba0127cf-6bbf-4fb5-871e-54ba62053aa1', '43', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_c956ba4a.jpg'),
('93162e42-5992-4449-8b57-23f5205fcfdb', 'ba0127cf-6bbf-4fb5-871e-54ba62053aa1', '44', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_c956ba4a.jpg'),
('adc0ce0c-f327-41c1-a7e2-1a13e0c6b7f8', 'ba0127cf-6bbf-4fb5-871e-54ba62053aa1', '45', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_c956ba4a.jpg'),
('78999a96-2f30-451d-add7-2395fe8080bc', '90e2718f-9812-414c-a083-e9c9b20f5b0a', '38', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_80ea77cf.jpg'),
('1b70c24c-e164-475e-80f4-416d556aef8b', '90e2718f-9812-414c-a083-e9c9b20f5b0a', '39', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_80ea77cf.jpg'),
('1203d6a2-f444-4cf3-a2ef-2945c2414a48', '90e2718f-9812-414c-a083-e9c9b20f5b0a', '40', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_80ea77cf.jpg'),
('c67e5e56-7508-44b6-bf37-cf8e202f3ac1', '90e2718f-9812-414c-a083-e9c9b20f5b0a', '41', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_80ea77cf.jpg'),
('4072d6a2-f50e-4432-b262-211ba2f962ad', '90e2718f-9812-414c-a083-e9c9b20f5b0a', '42', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_80ea77cf.jpg'),
('e736c183-bbb3-431a-990c-a2e7c51759eb', '90e2718f-9812-414c-a083-e9c9b20f5b0a', '43', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_80ea77cf.jpg'),
('739ba9b6-ede1-458b-b139-0d6dd170a819', '90e2718f-9812-414c-a083-e9c9b20f5b0a', '44', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_80ea77cf.jpg'),
('260d3cb4-6030-420e-86d9-44b2bae904ab', '90e2718f-9812-414c-a083-e9c9b20f5b0a', '45', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_80ea77cf.jpg'),
('fe6c4296-5940-49a4-99a5-82f2403a9611', '10383478-2046-4541-9a53-3e523dba148f', '38', 'HỒNG/CAM', 10, 'src/data/images/products/main_4d582d23.jpg'),
('c92efcef-28fb-464e-8f1c-e98a11f02e3d', '10383478-2046-4541-9a53-3e523dba148f', '39', 'HỒNG/CAM', 10, 'src/data/images/products/main_4d582d23.jpg'),
('803f115e-bc46-45c6-bd78-ff308e95268f', '10383478-2046-4541-9a53-3e523dba148f', '40', 'HỒNG/CAM', 10, 'src/data/images/products/main_4d582d23.jpg'),
('c5dd4224-7a20-4769-a34e-6f5cf8d51b56', '10383478-2046-4541-9a53-3e523dba148f', '41', 'HỒNG/CAM', 10, 'src/data/images/products/main_4d582d23.jpg'),
('80f4eca8-58b1-47f6-9576-a7cc86925c6a', '10383478-2046-4541-9a53-3e523dba148f', '42', 'HỒNG/CAM', 10, 'src/data/images/products/main_4d582d23.jpg'),
('2e44ebc8-d0c5-45aa-ae10-c1b25b32b7d1', '10383478-2046-4541-9a53-3e523dba148f', '43', 'HỒNG/CAM', 10, 'src/data/images/products/main_4d582d23.jpg'),
('e81ffba1-b7ef-4a8b-bf7e-6aff8f6db23d', '10383478-2046-4541-9a53-3e523dba148f', '44', 'HỒNG/CAM', 10, 'src/data/images/products/main_4d582d23.jpg'),
('a8380c87-4dbf-4c82-94fe-8adf19a7d01b', '10383478-2046-4541-9a53-3e523dba148f', '45', 'HỒNG/CAM', 10, 'src/data/images/products/main_4d582d23.jpg'),
('a15836d5-a0bf-485b-bc59-4edb9a06075a', '7a16e000-8086-46e2-8f0b-0a1809b420d4', '38', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_017f8b08.jpg'),
('2b2d0343-bcb1-4927-91bb-128bff97bff2', '7a16e000-8086-46e2-8f0b-0a1809b420d4', '39', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_017f8b08.jpg'),
('2ba054de-7521-4932-90af-12651a9952b0', '7a16e000-8086-46e2-8f0b-0a1809b420d4', '40', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_017f8b08.jpg'),
('779bd338-8347-4f8e-aebb-54a5d49a2397', '7a16e000-8086-46e2-8f0b-0a1809b420d4', '41', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_017f8b08.jpg'),
('66b6b466-8b0b-45ad-b22e-c136f0f0b007', '7a16e000-8086-46e2-8f0b-0a1809b420d4', '42', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_017f8b08.jpg'),
('93113d05-f17d-4e4a-9d13-628be1bf04dc', '7a16e000-8086-46e2-8f0b-0a1809b420d4', '43', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_017f8b08.jpg'),
('e7d339a5-5d0a-4286-8a27-968c7f6697d6', '7a16e000-8086-46e2-8f0b-0a1809b420d4', '44', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_017f8b08.jpg'),
('896761fd-e4aa-4b8c-a222-8f951b0e72dc', '7a16e000-8086-46e2-8f0b-0a1809b420d4', '45', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_017f8b08.jpg'),
('25c04a0d-2b8c-41a3-a14c-dd9365e5d04d', '784523a3-6fc5-41c8-be02-f6a212f5b1a5', '38', 'XANH MẠ NON', 10, 'src/data/images/products/main_564b5a77.jpg'),
('f495a768-4e5e-484a-befc-656e1901f3c1', '784523a3-6fc5-41c8-be02-f6a212f5b1a5', '39', 'XANH MẠ NON', 10, 'src/data/images/products/main_564b5a77.jpg'),
('0ec88517-df6a-4e30-a02d-a35a3e93ecca', '784523a3-6fc5-41c8-be02-f6a212f5b1a5', '40', 'XANH MẠ NON', 10, 'src/data/images/products/main_564b5a77.jpg'),
('4bf52aaf-3c5e-4f40-8cfa-c162be93e8b9', '784523a3-6fc5-41c8-be02-f6a212f5b1a5', '41', 'XANH MẠ NON', 10, 'src/data/images/products/main_564b5a77.jpg'),
('8d64d341-055a-4d49-ba7d-0f7e1c19d055', '784523a3-6fc5-41c8-be02-f6a212f5b1a5', '42', 'XANH MẠ NON', 10, 'src/data/images/products/main_564b5a77.jpg'),
('f69cf1bb-a3fb-4844-b81c-96be663572ff', '784523a3-6fc5-41c8-be02-f6a212f5b1a5', '43', 'XANH MẠ NON', 10, 'src/data/images/products/main_564b5a77.jpg'),
('047a18cf-b23d-41fa-ab8a-153b50dc9eed', '784523a3-6fc5-41c8-be02-f6a212f5b1a5', '44', 'XANH MẠ NON', 10, 'src/data/images/products/main_564b5a77.jpg'),
('0df83bdf-fd9b-475f-8389-9c771ce21944', '784523a3-6fc5-41c8-be02-f6a212f5b1a5', '45', 'XANH MẠ NON', 10, 'src/data/images/products/main_564b5a77.jpg'),
('d22c37a1-72c0-4110-a423-1922b00736fe', 'cde3e340-361b-49f9-8db9-78d02311738c', '38', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_3822f1b2.jpg'),
('d069aeda-d6e3-446e-8abf-67cb18d0d893', 'cde3e340-361b-49f9-8db9-78d02311738c', '39', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_3822f1b2.jpg'),
('337ea68f-860d-4a54-b0f5-1c06a643aa93', 'cde3e340-361b-49f9-8db9-78d02311738c', '40', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_3822f1b2.jpg'),
('95ad61ae-121a-4f64-9a5b-c07630cc637d', 'cde3e340-361b-49f9-8db9-78d02311738c', '41', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_3822f1b2.jpg'),
('113bc487-7fc5-41f5-bf07-b984bf3e9513', 'cde3e340-361b-49f9-8db9-78d02311738c', '42', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_3822f1b2.jpg'),
('2b49f5d2-4bdc-4f02-8bd5-9d9d5c33625d', 'cde3e340-361b-49f9-8db9-78d02311738c', '43', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_3822f1b2.jpg'),
('77833c42-c799-4c14-b57c-110be04fe234', 'cde3e340-361b-49f9-8db9-78d02311738c', '44', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_3822f1b2.jpg'),
('97845f17-7172-4e87-8d30-a8372e2a1e76', 'cde3e340-361b-49f9-8db9-78d02311738c', '45', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_3822f1b2.jpg'),
('4db2e953-fe9e-43d5-ac1d-8fe736f6d7b4', '39ad98bb-8195-41b3-b39c-7de750d5fb07', '38', 'TRẮNG/XANH', 10, 'src/data/images/products/main_d927b648.jpg'),
('619ec735-4553-4b8c-962a-d032b127a0fd', '39ad98bb-8195-41b3-b39c-7de750d5fb07', '39', 'TRẮNG/XANH', 10, 'src/data/images/products/main_d927b648.jpg'),
('3d003c7e-955a-4212-b967-42b89d53f9cb', '39ad98bb-8195-41b3-b39c-7de750d5fb07', '40', 'TRẮNG/XANH', 10, 'src/data/images/products/main_d927b648.jpg'),
('aa186ba5-60fc-40aa-93f2-69c5d6a22d7d', '39ad98bb-8195-41b3-b39c-7de750d5fb07', '41', 'TRẮNG/XANH', 10, 'src/data/images/products/main_d927b648.jpg'),
('f333e6c9-e73e-4918-9535-3039fd78aff0', '39ad98bb-8195-41b3-b39c-7de750d5fb07', '42', 'TRẮNG/XANH', 10, 'src/data/images/products/main_d927b648.jpg'),
('947cffee-b59b-48d1-b53c-456a781c4beb', '39ad98bb-8195-41b3-b39c-7de750d5fb07', '43', 'TRẮNG/XANH', 10, 'src/data/images/products/main_d927b648.jpg'),
('0b9f4343-56e2-42e3-9c77-4f437241c2d9', '39ad98bb-8195-41b3-b39c-7de750d5fb07', '44', 'TRẮNG/XANH', 10, 'src/data/images/products/main_d927b648.jpg'),
('72af86df-fa1a-44e7-8884-90e0ed5e0718', '39ad98bb-8195-41b3-b39c-7de750d5fb07', '45', 'TRẮNG/XANH', 10, 'src/data/images/products/main_d927b648.jpg'),
('c2956a01-6358-4683-a812-ef3ccb2562f4', 'b67fe281-ee6a-488f-b3ed-ce1e5b401887', '38', 'XANH/HỒNG', 10, 'src/data/images/products/main_c27f5ce2.jpg'),
('59673e39-bdc0-4e13-8de8-8c7f48b1a53d', 'b67fe281-ee6a-488f-b3ed-ce1e5b401887', '39', 'XANH/HỒNG', 10, 'src/data/images/products/main_c27f5ce2.jpg'),
('acbc55cb-1345-48b6-bc2b-cce1b0610a52', 'b67fe281-ee6a-488f-b3ed-ce1e5b401887', '40', 'XANH/HỒNG', 10, 'src/data/images/products/main_c27f5ce2.jpg'),
('d891fb37-65ed-4a02-ac2f-dd86adfaf8f2', 'b67fe281-ee6a-488f-b3ed-ce1e5b401887', '41', 'XANH/HỒNG', 10, 'src/data/images/products/main_c27f5ce2.jpg'),
('7d9f2fe6-beda-45f9-8f4f-03ab243787d5', 'b67fe281-ee6a-488f-b3ed-ce1e5b401887', '42', 'XANH/HỒNG', 10, 'src/data/images/products/main_c27f5ce2.jpg'),
('efd76cc3-70cc-4aea-aaf8-eb89bfa56cd5', 'b67fe281-ee6a-488f-b3ed-ce1e5b401887', '43', 'XANH/HỒNG', 10, 'src/data/images/products/main_c27f5ce2.jpg'),
('27c673fa-b0ea-4108-829f-42749e7cfee5', 'b67fe281-ee6a-488f-b3ed-ce1e5b401887', '44', 'XANH/HỒNG', 10, 'src/data/images/products/main_c27f5ce2.jpg'),
('61dfb9a5-d98d-489e-ac1f-c9c92e056ccc', 'b67fe281-ee6a-488f-b3ed-ce1e5b401887', '45', 'XANH/HỒNG', 10, 'src/data/images/products/main_c27f5ce2.jpg'),
('f7b499a8-3305-4819-a4a4-aa7c195376d8', 'd89d77dd-b37d-4f01-9d5a-3c2a12cc08df', '38', 'ĐEN HỒNG', 10, 'src/data/images/products/main_ce09f7b9.jpg'),
('f5b8f272-2a8c-4a43-ae07-391cec210bbb', 'd89d77dd-b37d-4f01-9d5a-3c2a12cc08df', '39', 'ĐEN HỒNG', 10, 'src/data/images/products/main_ce09f7b9.jpg'),
('604d5269-e124-40f2-9bc5-e5bd80e83390', 'd89d77dd-b37d-4f01-9d5a-3c2a12cc08df', '40', 'ĐEN HỒNG', 10, 'src/data/images/products/main_ce09f7b9.jpg'),
('48090554-ea5c-4ad8-85e3-6930699fef1d', 'd89d77dd-b37d-4f01-9d5a-3c2a12cc08df', '41', 'ĐEN HỒNG', 10, 'src/data/images/products/main_ce09f7b9.jpg'),
('0ff0ef5a-63b9-4b18-96e2-c1c02138e17a', 'd89d77dd-b37d-4f01-9d5a-3c2a12cc08df', '42', 'ĐEN HỒNG', 10, 'src/data/images/products/main_ce09f7b9.jpg'),
('d108b9a8-4244-4c8f-97f5-2d3061535a48', 'd89d77dd-b37d-4f01-9d5a-3c2a12cc08df', '43', 'ĐEN HỒNG', 10, 'src/data/images/products/main_ce09f7b9.jpg'),
('75cdfd1e-87f1-47af-808f-6a7007538fd2', 'd89d77dd-b37d-4f01-9d5a-3c2a12cc08df', '44', 'ĐEN HỒNG', 10, 'src/data/images/products/main_ce09f7b9.jpg'),
('a18b8822-6bef-481f-a049-b914afa18413', 'd89d77dd-b37d-4f01-9d5a-3c2a12cc08df', '45', 'ĐEN HỒNG', 10, 'src/data/images/products/main_ce09f7b9.jpg'),
('d57e251b-f4d2-4ffe-82d7-4f698d637782', '95e151a8-f0c6-4db5-821a-e8b2478e5dbd', '38', 'ĐỎ', 10, 'src/data/images/products/main_fbe6d09f.jpg'),
('93be8a52-5493-4592-aa4d-5d9cd5d0e0da', '95e151a8-f0c6-4db5-821a-e8b2478e5dbd', '39', 'ĐỎ', 10, 'src/data/images/products/main_fbe6d09f.jpg'),
('afe768ba-5c2e-4704-9770-a29ad7bfcbad', '95e151a8-f0c6-4db5-821a-e8b2478e5dbd', '40', 'ĐỎ', 10, 'src/data/images/products/main_fbe6d09f.jpg'),
('658fd0ac-5caa-4a95-904f-f699ac83a6a1', '95e151a8-f0c6-4db5-821a-e8b2478e5dbd', '41', 'ĐỎ', 10, 'src/data/images/products/main_fbe6d09f.jpg'),
('fef77d82-bc5f-4afd-ae24-2c69412eb753', '95e151a8-f0c6-4db5-821a-e8b2478e5dbd', '42', 'ĐỎ', 10, 'src/data/images/products/main_fbe6d09f.jpg'),
('c14af19c-6171-41d0-ab34-48857e128217', '95e151a8-f0c6-4db5-821a-e8b2478e5dbd', '43', 'ĐỎ', 10, 'src/data/images/products/main_fbe6d09f.jpg'),
('97acda49-6ab4-41c5-a693-b02707c5276f', '95e151a8-f0c6-4db5-821a-e8b2478e5dbd', '44', 'ĐỎ', 10, 'src/data/images/products/main_fbe6d09f.jpg'),
('a7223d6b-5427-483c-b7d8-67237ba2f5dd', '95e151a8-f0c6-4db5-821a-e8b2478e5dbd', '45', 'ĐỎ', 10, 'src/data/images/products/main_fbe6d09f.jpg'),
('9a2e6478-1dfe-497d-8d3d-ba793c45a448', '94a82c81-7e87-4c22-b31b-559d666ddb69', '38', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_bd0feb86.jpg'),
('0ec5e153-57e6-456c-a660-27c5fe1fae52', '94a82c81-7e87-4c22-b31b-559d666ddb69', '39', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_bd0feb86.jpg'),
('d7feecf7-7987-46f1-8326-29098616ea8d', '94a82c81-7e87-4c22-b31b-559d666ddb69', '40', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_bd0feb86.jpg'),
('37c17ff5-30b0-4021-97f3-c916d9f2f4dd', '94a82c81-7e87-4c22-b31b-559d666ddb69', '41', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_bd0feb86.jpg'),
('09d6fafc-12fd-4a0c-ba2d-a33526a55b92', '94a82c81-7e87-4c22-b31b-559d666ddb69', '42', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_bd0feb86.jpg'),
('cd36fff8-60cc-4591-8122-15a35d192107', '94a82c81-7e87-4c22-b31b-559d666ddb69', '43', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_bd0feb86.jpg'),
('df66f02a-2559-4109-8cea-54b49074b83d', '94a82c81-7e87-4c22-b31b-559d666ddb69', '44', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_bd0feb86.jpg'),
('967e14a5-6ebf-497c-9737-d34a160f89e9', '94a82c81-7e87-4c22-b31b-559d666ddb69', '45', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_bd0feb86.jpg'),
('a3a751a7-295c-48c0-b512-c2ba5ee4e144', '01278f3f-6e99-4c39-9d6b-d672ab88dda4', '38', 'VÀNG/ĐEN', 10, 'src/data/images/products/main_84df1c72.jpg'),
('f9bd400d-049a-47d1-a88b-471caba93336', '01278f3f-6e99-4c39-9d6b-d672ab88dda4', '39', 'VÀNG/ĐEN', 10, 'src/data/images/products/main_84df1c72.jpg'),
('5f618b7e-d4af-4012-9fbb-b8b0801b6921', '01278f3f-6e99-4c39-9d6b-d672ab88dda4', '40', 'VÀNG/ĐEN', 10, 'src/data/images/products/main_84df1c72.jpg'),
('b37c8dd4-0b93-47ec-8563-354351a0bfea', '01278f3f-6e99-4c39-9d6b-d672ab88dda4', '41', 'VÀNG/ĐEN', 10, 'src/data/images/products/main_84df1c72.jpg'),
('f1db7b43-7dc7-47e2-a4f6-3b275320d1b5', '01278f3f-6e99-4c39-9d6b-d672ab88dda4', '42', 'VÀNG/ĐEN', 10, 'src/data/images/products/main_84df1c72.jpg'),
('8428b705-e823-4221-9c6b-ce5c8a211c8b', '01278f3f-6e99-4c39-9d6b-d672ab88dda4', '43', 'VÀNG/ĐEN', 10, 'src/data/images/products/main_84df1c72.jpg'),
('d418387d-ae1f-45ea-b4c6-f252264b90b4', '01278f3f-6e99-4c39-9d6b-d672ab88dda4', '44', 'VÀNG/ĐEN', 10, 'src/data/images/products/main_84df1c72.jpg'),
('2700cbec-3afd-42a4-9cea-5c93373d59c0', '01278f3f-6e99-4c39-9d6b-d672ab88dda4', '45', 'VÀNG/ĐEN', 10, 'src/data/images/products/main_84df1c72.jpg'),
('d5e0265a-3d26-4880-a185-1a56041bf371', '11b72eb1-2b2f-4f69-a580-e9da990ccba5', '38', 'XANH MINT', 10, 'src/data/images/products/main_24370ea1.jpg'),
('5af44693-3177-4feb-b499-6b1d2030eeb6', '11b72eb1-2b2f-4f69-a580-e9da990ccba5', '39', 'XANH MINT', 10, 'src/data/images/products/main_24370ea1.jpg'),
('65d533e0-5f71-4646-ac6d-f00e97532fcc', '11b72eb1-2b2f-4f69-a580-e9da990ccba5', '40', 'XANH MINT', 10, 'src/data/images/products/main_24370ea1.jpg'),
('aa57b854-04ed-47bc-a3fe-b4b376b46fbc', '11b72eb1-2b2f-4f69-a580-e9da990ccba5', '41', 'XANH MINT', 10, 'src/data/images/products/main_24370ea1.jpg');

INSERT INTO product_variants (variant_id, product_id, size, color, stock, image_url) VALUES
('f0529b40-0a87-42da-92bf-48d9101a773a', '11b72eb1-2b2f-4f69-a580-e9da990ccba5', '42', 'XANH MINT', 10, 'src/data/images/products/main_24370ea1.jpg'),
('83d3ba8b-ede3-4044-b637-47edfde6a85f', '11b72eb1-2b2f-4f69-a580-e9da990ccba5', '43', 'XANH MINT', 10, 'src/data/images/products/main_24370ea1.jpg'),
('f5ac0d70-e007-41a8-9ea7-c7f85587c140', '11b72eb1-2b2f-4f69-a580-e9da990ccba5', '44', 'XANH MINT', 10, 'src/data/images/products/main_24370ea1.jpg'),
('36079f93-78ab-4fcb-b509-3a9bd5032788', '11b72eb1-2b2f-4f69-a580-e9da990ccba5', '45', 'XANH MINT', 10, 'src/data/images/products/main_24370ea1.jpg'),
('e279ed50-914c-4f1c-9d0c-6ad1e61cd902', '6b95aeee-9fa9-4eef-9607-93ffc4b5e433', '38', 'XANH LÁ', 10, 'src/data/images/products/main_4b265e4b.jpg'),
('087949f2-eeb4-4015-8b8e-ba813b3a2c0e', '6b95aeee-9fa9-4eef-9607-93ffc4b5e433', '39', 'XANH LÁ', 10, 'src/data/images/products/main_4b265e4b.jpg'),
('533fb769-d738-4744-84bc-1f554604db8a', '6b95aeee-9fa9-4eef-9607-93ffc4b5e433', '40', 'XANH LÁ', 10, 'src/data/images/products/main_4b265e4b.jpg'),
('55fe182e-30cc-4a69-be3a-64cdf2a313ca', '6b95aeee-9fa9-4eef-9607-93ffc4b5e433', '41', 'XANH LÁ', 10, 'src/data/images/products/main_4b265e4b.jpg'),
('a19b51e7-eafc-4cb8-9104-2055446c0abe', '6b95aeee-9fa9-4eef-9607-93ffc4b5e433', '42', 'XANH LÁ', 10, 'src/data/images/products/main_4b265e4b.jpg'),
('c0b4b7e2-35e7-455b-8c44-be776a66f7d3', '6b95aeee-9fa9-4eef-9607-93ffc4b5e433', '43', 'XANH LÁ', 10, 'src/data/images/products/main_4b265e4b.jpg'),
('5fc01346-b9d6-444b-a52c-97a03e757407', '6b95aeee-9fa9-4eef-9607-93ffc4b5e433', '44', 'XANH LÁ', 10, 'src/data/images/products/main_4b265e4b.jpg'),
('b270c2f0-e260-4329-8ff3-153f45f3d998', '6b95aeee-9fa9-4eef-9607-93ffc4b5e433', '45', 'XANH LÁ', 10, 'src/data/images/products/main_4b265e4b.jpg'),
('45beb81b-3706-4696-b276-5ad6b03931a4', 'dc38a62d-419b-49cc-a336-b40952844ef4', '38', 'TRẮNG/CAM', 10, 'src/data/images/products/main_0ad6a908.jpg'),
('11654ca5-00a6-4c89-828c-279527225413', 'dc38a62d-419b-49cc-a336-b40952844ef4', '39', 'TRẮNG/CAM', 10, 'src/data/images/products/main_0ad6a908.jpg'),
('0d30fd6b-6dc4-4584-8465-ae020f0f72ee', 'dc38a62d-419b-49cc-a336-b40952844ef4', '40', 'TRẮNG/CAM', 10, 'src/data/images/products/main_0ad6a908.jpg'),
('1680b47e-6611-436f-8ba3-aab2e311810a', 'dc38a62d-419b-49cc-a336-b40952844ef4', '41', 'TRẮNG/CAM', 10, 'src/data/images/products/main_0ad6a908.jpg'),
('5fae36b4-d2aa-4dbd-8854-5a8dba7b4fec', 'dc38a62d-419b-49cc-a336-b40952844ef4', '42', 'TRẮNG/CAM', 10, 'src/data/images/products/main_0ad6a908.jpg'),
('31ceae13-bf6e-41e6-ba45-ea1e0e21f557', 'dc38a62d-419b-49cc-a336-b40952844ef4', '43', 'TRẮNG/CAM', 10, 'src/data/images/products/main_0ad6a908.jpg'),
('d129d5cc-1295-4772-9e73-51138845fa11', 'dc38a62d-419b-49cc-a336-b40952844ef4', '44', 'TRẮNG/CAM', 10, 'src/data/images/products/main_0ad6a908.jpg'),
('a0ed5a35-6d7e-4567-815e-f1ed93ea3dc3', 'dc38a62d-419b-49cc-a336-b40952844ef4', '45', 'TRẮNG/CAM', 10, 'src/data/images/products/main_0ad6a908.jpg'),
('c9ffacf9-9e3b-4809-8afc-352812790788', '60209e52-fc8f-4100-8014-a414f3f5aa64', '38', 'HỒNG/XANH', 10, 'src/data/images/products/main_9e52edeb.jpg'),
('7e45b819-3ff0-4740-8f7b-7bdf2d13d7df', '60209e52-fc8f-4100-8014-a414f3f5aa64', '39', 'HỒNG/XANH', 10, 'src/data/images/products/main_9e52edeb.jpg'),
('b22009b2-85fe-4a15-b023-34813e911ee3', '60209e52-fc8f-4100-8014-a414f3f5aa64', '40', 'HỒNG/XANH', 10, 'src/data/images/products/main_9e52edeb.jpg'),
('df9e5be6-bc37-4926-be4d-c47f6df9211d', '60209e52-fc8f-4100-8014-a414f3f5aa64', '41', 'HỒNG/XANH', 10, 'src/data/images/products/main_9e52edeb.jpg'),
('b6882860-098c-4d3b-a068-d0ad38960fba', '60209e52-fc8f-4100-8014-a414f3f5aa64', '42', 'HỒNG/XANH', 10, 'src/data/images/products/main_9e52edeb.jpg'),
('6c89b60e-7283-40ab-813c-8d802d9d96d2', '60209e52-fc8f-4100-8014-a414f3f5aa64', '43', 'HỒNG/XANH', 10, 'src/data/images/products/main_9e52edeb.jpg'),
('2f98cca1-d2ad-45c9-8ba3-99fc6666d23b', '60209e52-fc8f-4100-8014-a414f3f5aa64', '44', 'HỒNG/XANH', 10, 'src/data/images/products/main_9e52edeb.jpg'),
('30ca64ee-1235-453c-bef3-13e3d8ffc721', '60209e52-fc8f-4100-8014-a414f3f5aa64', '45', 'HỒNG/XANH', 10, 'src/data/images/products/main_9e52edeb.jpg'),
('8d3b7f28-537f-4fcc-bf4b-82e4524e4e5c', '489de3c7-853b-409d-bb15-80f8135a112c', '38', 'XANH/VÀNG', 10, 'src/data/images/products/main_01f02624.jpg'),
('c6a40afb-990a-4047-90f3-2f96bfb8e21d', '489de3c7-853b-409d-bb15-80f8135a112c', '39', 'XANH/VÀNG', 10, 'src/data/images/products/main_01f02624.jpg'),
('548888e1-e18d-44b9-bd5e-25b10034ba76', '489de3c7-853b-409d-bb15-80f8135a112c', '40', 'XANH/VÀNG', 10, 'src/data/images/products/main_01f02624.jpg'),
('e0ca4362-1e01-4785-9315-88da0c1161d4', '489de3c7-853b-409d-bb15-80f8135a112c', '41', 'XANH/VÀNG', 10, 'src/data/images/products/main_01f02624.jpg'),
('cc456879-81ff-43c7-983e-036ef2f4efe6', '489de3c7-853b-409d-bb15-80f8135a112c', '42', 'XANH/VÀNG', 10, 'src/data/images/products/main_01f02624.jpg'),
('de3302fb-6adf-40dc-8377-9b042984529e', '489de3c7-853b-409d-bb15-80f8135a112c', '43', 'XANH/VÀNG', 10, 'src/data/images/products/main_01f02624.jpg'),
('59879cb8-91f5-45b5-ab32-58a97dac5cb7', '489de3c7-853b-409d-bb15-80f8135a112c', '44', 'XANH/VÀNG', 10, 'src/data/images/products/main_01f02624.jpg'),
('8feb541a-5c2c-481c-9947-3a752841aadf', '489de3c7-853b-409d-bb15-80f8135a112c', '45', 'XANH/VÀNG', 10, 'src/data/images/products/main_01f02624.jpg'),
('7bcfd5d8-014d-4bb1-92f6-ba7800d4970b', '86dcc5ac-9d27-449b-bb1d-99ef050c7e5b', '38', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_fa7b5b3b.jpg'),
('b8b37778-becd-4a48-9641-59989ffd26ca', '86dcc5ac-9d27-449b-bb1d-99ef050c7e5b', '39', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_fa7b5b3b.jpg'),
('e4ffafd2-301d-482d-8248-66917cf3a6ab', '86dcc5ac-9d27-449b-bb1d-99ef050c7e5b', '40', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_fa7b5b3b.jpg'),
('50a91abb-f05f-4e34-8a0f-eda1e359b2e6', '86dcc5ac-9d27-449b-bb1d-99ef050c7e5b', '41', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_fa7b5b3b.jpg'),
('e4de4d7c-03b4-4b45-9af6-56c02c7a7fb6', '86dcc5ac-9d27-449b-bb1d-99ef050c7e5b', '42', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_fa7b5b3b.jpg'),
('9f04f4bf-1492-49f8-b48e-fd9eec38ed9f', '86dcc5ac-9d27-449b-bb1d-99ef050c7e5b', '43', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_fa7b5b3b.jpg'),
('60f1caf3-9ef9-42ff-ac23-cd2743804b45', '86dcc5ac-9d27-449b-bb1d-99ef050c7e5b', '44', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_fa7b5b3b.jpg'),
('85420481-1f55-4260-83ba-d4516cceb9f0', '86dcc5ac-9d27-449b-bb1d-99ef050c7e5b', '45', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_fa7b5b3b.jpg'),
('29b0af81-0ec3-447a-8fc7-78f37c55bccd', '23070491-5127-4f04-b025-904cfb459d85', '38', 'TRẮNG/XANH LÁ MẠ', 10, 'src/data/images/products/main_500265de.jpg'),
('0fc92dc8-6547-409d-bf98-99e72351aabe', '23070491-5127-4f04-b025-904cfb459d85', '39', 'TRẮNG/XANH LÁ MẠ', 10, 'src/data/images/products/main_500265de.jpg'),
('70074f33-889c-4c7a-86c2-b80ade243c6e', '23070491-5127-4f04-b025-904cfb459d85', '40', 'TRẮNG/XANH LÁ MẠ', 10, 'src/data/images/products/main_500265de.jpg'),
('85b39600-7da7-427a-8823-99871fe55c63', '23070491-5127-4f04-b025-904cfb459d85', '41', 'TRẮNG/XANH LÁ MẠ', 10, 'src/data/images/products/main_500265de.jpg'),
('2cd851ae-8183-47ee-ae0c-3e782bafd047', '23070491-5127-4f04-b025-904cfb459d85', '42', 'TRẮNG/XANH LÁ MẠ', 10, 'src/data/images/products/main_500265de.jpg'),
('65e7b782-cdf6-47c5-b148-35acff7db2ec', '23070491-5127-4f04-b025-904cfb459d85', '43', 'TRẮNG/XANH LÁ MẠ', 10, 'src/data/images/products/main_500265de.jpg'),
('0b3bafc3-b038-4303-9b2f-5da18b6b159b', '23070491-5127-4f04-b025-904cfb459d85', '44', 'TRẮNG/XANH LÁ MẠ', 10, 'src/data/images/products/main_500265de.jpg'),
('b844665a-3383-45e9-a484-113d2cecdf78', '23070491-5127-4f04-b025-904cfb459d85', '45', 'TRẮNG/XANH LÁ MẠ', 10, 'src/data/images/products/main_500265de.jpg'),
('4e375d76-50bb-493e-b1d6-91dc3b2f79ad', '8ff2274c-77df-4130-b3fd-356531223bb2', '38', 'CAM/XANH', 10, 'src/data/images/products/main_e10a1c9a.jpg'),
('2dd100ff-2b3c-42f1-8a73-7aa90253f274', '8ff2274c-77df-4130-b3fd-356531223bb2', '39', 'CAM/XANH', 10, 'src/data/images/products/main_e10a1c9a.jpg'),
('8d404231-ca1e-4ff6-ac4e-dcc6deecc6a3', '8ff2274c-77df-4130-b3fd-356531223bb2', '40', 'CAM/XANH', 10, 'src/data/images/products/main_e10a1c9a.jpg'),
('22d296a7-10d0-40c6-8a93-8d61ee6dc838', '8ff2274c-77df-4130-b3fd-356531223bb2', '41', 'CAM/XANH', 10, 'src/data/images/products/main_e10a1c9a.jpg'),
('2541b6f6-ba46-4435-86ef-53635de486ad', '8ff2274c-77df-4130-b3fd-356531223bb2', '42', 'CAM/XANH', 10, 'src/data/images/products/main_e10a1c9a.jpg'),
('eea05f8b-0814-463d-8658-513e2accc82e', '8ff2274c-77df-4130-b3fd-356531223bb2', '43', 'CAM/XANH', 10, 'src/data/images/products/main_e10a1c9a.jpg'),
('7f78abd3-11ad-4f69-b1ec-73c58870a236', '8ff2274c-77df-4130-b3fd-356531223bb2', '44', 'CAM/XANH', 10, 'src/data/images/products/main_e10a1c9a.jpg'),
('6cf2e2f3-0f57-4484-abec-89c4ae6918c6', '8ff2274c-77df-4130-b3fd-356531223bb2', '45', 'CAM/XANH', 10, 'src/data/images/products/main_e10a1c9a.jpg'),
('ec0ea91e-db45-4a7c-b8d3-82ffed0449b3', 'af7f35bd-82ba-41a0-9af4-fe16f04e894f', '38', 'XANH/HỒNG', 10, 'src/data/images/products/main_e60ae9d5.jpg'),
('0ac90ea9-86d2-4042-9ea6-4f6d26c81a21', 'af7f35bd-82ba-41a0-9af4-fe16f04e894f', '39', 'XANH/HỒNG', 10, 'src/data/images/products/main_e60ae9d5.jpg'),
('0d44d016-bb5f-48a4-9a68-9872e7b4e3a2', 'af7f35bd-82ba-41a0-9af4-fe16f04e894f', '40', 'XANH/HỒNG', 10, 'src/data/images/products/main_e60ae9d5.jpg'),
('11981213-1552-4467-93af-ba92931665ef', 'af7f35bd-82ba-41a0-9af4-fe16f04e894f', '41', 'XANH/HỒNG', 10, 'src/data/images/products/main_e60ae9d5.jpg'),
('59b5c4f7-03e8-42a5-b3bb-d7b538913cb5', 'af7f35bd-82ba-41a0-9af4-fe16f04e894f', '42', 'XANH/HỒNG', 10, 'src/data/images/products/main_e60ae9d5.jpg'),
('d6b4d899-b687-49e0-8e77-b13e7b519cec', 'af7f35bd-82ba-41a0-9af4-fe16f04e894f', '43', 'XANH/HỒNG', 10, 'src/data/images/products/main_e60ae9d5.jpg'),
('d826c963-cce1-4a54-84db-9f14ed83e0b7', 'af7f35bd-82ba-41a0-9af4-fe16f04e894f', '44', 'XANH/HỒNG', 10, 'src/data/images/products/main_e60ae9d5.jpg'),
('708f7ed9-beab-4636-889c-64bf3357b0ec', 'af7f35bd-82ba-41a0-9af4-fe16f04e894f', '45', 'XANH/HỒNG', 10, 'src/data/images/products/main_e60ae9d5.jpg'),
('07bee6bc-6a66-49c9-9fe4-a869074e690b', '5fd57e59-cef7-41e6-b0af-3890c5ef3695', '38', 'CAM ĐÀO/XANH NGỌC', 10, 'src/data/images/products/main_005e0369.jpg'),
('107728e9-5636-490c-9339-6d84f79e1d3f', '5fd57e59-cef7-41e6-b0af-3890c5ef3695', '39', 'CAM ĐÀO/XANH NGỌC', 10, 'src/data/images/products/main_005e0369.jpg'),
('b815f33f-4bd2-4b02-8272-a6fa03c04cdd', '5fd57e59-cef7-41e6-b0af-3890c5ef3695', '40', 'CAM ĐÀO/XANH NGỌC', 10, 'src/data/images/products/main_005e0369.jpg'),
('0c044847-366c-4731-a992-69cd1e7b3788', '5fd57e59-cef7-41e6-b0af-3890c5ef3695', '41', 'CAM ĐÀO/XANH NGỌC', 10, 'src/data/images/products/main_005e0369.jpg'),
('142788b8-4fb5-4175-90fb-ad3dd90a409c', '5fd57e59-cef7-41e6-b0af-3890c5ef3695', '42', 'CAM ĐÀO/XANH NGỌC', 10, 'src/data/images/products/main_005e0369.jpg'),
('0930aafa-cdd6-4117-a7cd-635e32cc011e', '5fd57e59-cef7-41e6-b0af-3890c5ef3695', '43', 'CAM ĐÀO/XANH NGỌC', 10, 'src/data/images/products/main_005e0369.jpg'),
('28258e40-ebc9-4dad-a657-43ef439b2ac0', '5fd57e59-cef7-41e6-b0af-3890c5ef3695', '44', 'CAM ĐÀO/XANH NGỌC', 10, 'src/data/images/products/main_005e0369.jpg'),
('b9bbb3bc-6a1d-4d33-9262-e66b308921e3', '5fd57e59-cef7-41e6-b0af-3890c5ef3695', '45', 'CAM ĐÀO/XANH NGỌC', 10, 'src/data/images/products/main_005e0369.jpg'),
('8c31fdc6-9f0c-4e8c-b459-e3c9f996345a', 'f3f14e2d-48c7-4bfc-89b9-86a0974a9145', '38', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_c9ceebe5.jpg'),
('2ea93bc7-35d7-42d3-804d-ffcc95f57c92', 'f3f14e2d-48c7-4bfc-89b9-86a0974a9145', '39', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_c9ceebe5.jpg'),
('16f91d7a-1b16-4065-923b-809204b61970', 'f3f14e2d-48c7-4bfc-89b9-86a0974a9145', '40', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_c9ceebe5.jpg'),
('ea3b603a-f715-494e-8fa4-d699ae817ade', 'f3f14e2d-48c7-4bfc-89b9-86a0974a9145', '41', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_c9ceebe5.jpg'),
('e89c8dc7-156e-456d-89f0-df8b34dbf910', 'f3f14e2d-48c7-4bfc-89b9-86a0974a9145', '42', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_c9ceebe5.jpg'),
('1fa7a63c-b33b-441f-a954-13b856ccc2e5', 'f3f14e2d-48c7-4bfc-89b9-86a0974a9145', '43', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_c9ceebe5.jpg'),
('a3ee1ec3-18fc-4b73-a25c-b79f81b46eb5', 'f3f14e2d-48c7-4bfc-89b9-86a0974a9145', '44', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_c9ceebe5.jpg'),
('d066e59b-c9aa-4788-adba-1e68347cafb5', 'f3f14e2d-48c7-4bfc-89b9-86a0974a9145', '45', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_c9ceebe5.jpg'),
('0779c528-455b-483e-ae7c-be3844b72d33', 'cb507ad2-4bcc-42e9-b983-169e4804c2f7', '38', 'ĐEN/BẠC/VÀNG', 10, 'src/data/images/products/main_2be793fc.jpg'),
('92974c66-ea0c-4686-a064-d4a9cf9914cd', 'cb507ad2-4bcc-42e9-b983-169e4804c2f7', '39', 'ĐEN/BẠC/VÀNG', 10, 'src/data/images/products/main_2be793fc.jpg'),
('6a6d758e-4b6b-4fcb-b1d0-0c63fde3b1c6', 'cb507ad2-4bcc-42e9-b983-169e4804c2f7', '40', 'ĐEN/BẠC/VÀNG', 10, 'src/data/images/products/main_2be793fc.jpg'),
('a6f817be-a511-41ef-8217-3d5f644954ba', 'cb507ad2-4bcc-42e9-b983-169e4804c2f7', '41', 'ĐEN/BẠC/VÀNG', 10, 'src/data/images/products/main_2be793fc.jpg'),
('7b1f3a62-06ce-47f5-a259-dbbfe6008a86', 'cb507ad2-4bcc-42e9-b983-169e4804c2f7', '42', 'ĐEN/BẠC/VÀNG', 10, 'src/data/images/products/main_2be793fc.jpg'),
('87a0f514-dbed-441b-b8a9-b9d4e5aacaf1', 'cb507ad2-4bcc-42e9-b983-169e4804c2f7', '43', 'ĐEN/BẠC/VÀNG', 10, 'src/data/images/products/main_2be793fc.jpg'),
('0ee80285-6159-4956-b986-6d3d8d259564', 'cb507ad2-4bcc-42e9-b983-169e4804c2f7', '44', 'ĐEN/BẠC/VÀNG', 10, 'src/data/images/products/main_2be793fc.jpg'),
('0bdfb76d-3f9f-4443-a107-4c2f0f2757b6', 'cb507ad2-4bcc-42e9-b983-169e4804c2f7', '45', 'ĐEN/BẠC/VÀNG', 10, 'src/data/images/products/main_2be793fc.jpg'),
('efc7ac61-c297-4421-8e28-48004cd7b66c', '1302430a-7018-4248-9e88-540b8c1707bb', '38', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_aa27405c.jpg'),
('6ca69277-1a8d-41fc-bacd-b43df5b87788', '1302430a-7018-4248-9e88-540b8c1707bb', '39', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_aa27405c.jpg'),
('8de1fb7b-87a4-4095-b753-3f665036dea9', '1302430a-7018-4248-9e88-540b8c1707bb', '40', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_aa27405c.jpg'),
('a1f0db54-ebe5-4c18-bed3-d3037afb3553', '1302430a-7018-4248-9e88-540b8c1707bb', '41', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_aa27405c.jpg'),
('32812a20-153b-4f2d-bb34-52ff3d514f02', '1302430a-7018-4248-9e88-540b8c1707bb', '42', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_aa27405c.jpg'),
('dd368014-28c4-4f94-ade5-fc32a400e0ee', '1302430a-7018-4248-9e88-540b8c1707bb', '43', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_aa27405c.jpg'),
('ff444d03-775c-448b-b1ca-384b2194172a', '1302430a-7018-4248-9e88-540b8c1707bb', '44', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_aa27405c.jpg'),
('ac32ba7a-c1f8-4f65-ba97-8e1ed1bbd1a9', '1302430a-7018-4248-9e88-540b8c1707bb', '45', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_aa27405c.jpg');

INSERT INTO product_variants (variant_id, product_id, size, color, stock, image_url) VALUES
('8878d12b-44d3-4658-9982-57adf3c88cbd', '7fc610d8-1b26-4d15-b149-17f3f17337b2', '38', 'ĐỎ', 10, 'src/data/images/products/main_df0166b0.jpg'),
('7e1ca2fb-39a2-448b-b548-cbda1600d92d', '7fc610d8-1b26-4d15-b149-17f3f17337b2', '39', 'ĐỎ', 10, 'src/data/images/products/main_df0166b0.jpg'),
('5ae21a09-8b72-4b07-bc41-64b8e00cc1a5', '7fc610d8-1b26-4d15-b149-17f3f17337b2', '40', 'ĐỎ', 10, 'src/data/images/products/main_df0166b0.jpg'),
('ab73b279-7a38-46c2-aa93-70dab10a8cc9', '7fc610d8-1b26-4d15-b149-17f3f17337b2', '41', 'ĐỎ', 10, 'src/data/images/products/main_df0166b0.jpg'),
('aee85881-3a81-466c-ba00-29b16604dfb3', '7fc610d8-1b26-4d15-b149-17f3f17337b2', '42', 'ĐỎ', 10, 'src/data/images/products/main_df0166b0.jpg'),
('743b0934-08fd-42d3-a51f-f8ba64ff96d2', '7fc610d8-1b26-4d15-b149-17f3f17337b2', '43', 'ĐỎ', 10, 'src/data/images/products/main_df0166b0.jpg'),
('b208db25-9e32-4b20-8009-a30fb0dcde5f', '7fc610d8-1b26-4d15-b149-17f3f17337b2', '44', 'ĐỎ', 10, 'src/data/images/products/main_df0166b0.jpg'),
('2bc20a7c-4869-40d4-ab2e-86892b26ccc9', '7fc610d8-1b26-4d15-b149-17f3f17337b2', '45', 'ĐỎ', 10, 'src/data/images/products/main_df0166b0.jpg'),
('7681bc81-0b46-4e6d-8394-c947e607e4c5', 'fdbc2e47-a40e-4958-ae42-d177852cc321', '38', 'HỒNG TÍM/CAM', 10, 'src/data/images/products/main_dae8ec00.jpg'),
('f7694737-feff-4a41-9562-459f85aa63ba', 'fdbc2e47-a40e-4958-ae42-d177852cc321', '39', 'HỒNG TÍM/CAM', 10, 'src/data/images/products/main_dae8ec00.jpg'),
('b86a0a86-744e-4fa3-bfdf-da067a5538bf', 'fdbc2e47-a40e-4958-ae42-d177852cc321', '40', 'HỒNG TÍM/CAM', 10, 'src/data/images/products/main_dae8ec00.jpg'),
('cbff5a5b-561b-4be2-8b50-86f479b1ca03', 'fdbc2e47-a40e-4958-ae42-d177852cc321', '41', 'HỒNG TÍM/CAM', 10, 'src/data/images/products/main_dae8ec00.jpg'),
('0a90268a-15a1-4cf9-9ae4-bf4007c3b58d', 'fdbc2e47-a40e-4958-ae42-d177852cc321', '42', 'HỒNG TÍM/CAM', 10, 'src/data/images/products/main_dae8ec00.jpg'),
('e535147a-ad97-4e57-b7fb-a7416c0548dc', 'fdbc2e47-a40e-4958-ae42-d177852cc321', '43', 'HỒNG TÍM/CAM', 10, 'src/data/images/products/main_dae8ec00.jpg'),
('ec215dc7-3135-4eec-973a-098a1806650e', 'fdbc2e47-a40e-4958-ae42-d177852cc321', '44', 'HỒNG TÍM/CAM', 10, 'src/data/images/products/main_dae8ec00.jpg'),
('ec2c0a87-e18f-43b1-9aa1-032b6a1a1f24', 'fdbc2e47-a40e-4958-ae42-d177852cc321', '45', 'HỒNG TÍM/CAM', 10, 'src/data/images/products/main_dae8ec00.jpg'),
('cff71d0d-261c-44d0-8f39-c5db182bd20c', '19f29e3c-4ea7-429a-bd72-e1a47f806ba0', '38', 'XANH LƠ', 10, 'src/data/images/products/main_f4d0eb75.jpg'),
('65b75497-6fca-40ee-9745-54715920a00b', '19f29e3c-4ea7-429a-bd72-e1a47f806ba0', '39', 'XANH LƠ', 10, 'src/data/images/products/main_f4d0eb75.jpg'),
('74f9e360-f067-4877-8356-6dd5f6022528', '19f29e3c-4ea7-429a-bd72-e1a47f806ba0', '40', 'XANH LƠ', 10, 'src/data/images/products/main_f4d0eb75.jpg'),
('2f5b8897-872f-41f4-929f-e806e38d146a', '19f29e3c-4ea7-429a-bd72-e1a47f806ba0', '41', 'XANH LƠ', 10, 'src/data/images/products/main_f4d0eb75.jpg'),
('740dcc04-c703-437f-a8bc-7492f801ad26', '19f29e3c-4ea7-429a-bd72-e1a47f806ba0', '42', 'XANH LƠ', 10, 'src/data/images/products/main_f4d0eb75.jpg'),
('b0108bda-b9e9-4480-b74f-1d60de2e1aeb', '19f29e3c-4ea7-429a-bd72-e1a47f806ba0', '43', 'XANH LƠ', 10, 'src/data/images/products/main_f4d0eb75.jpg'),
('4a892363-56df-47ac-8588-39ffda28b312', '19f29e3c-4ea7-429a-bd72-e1a47f806ba0', '44', 'XANH LƠ', 10, 'src/data/images/products/main_f4d0eb75.jpg'),
('4fce0f66-7dd1-4e5e-a26d-642592e14507', '19f29e3c-4ea7-429a-bd72-e1a47f806ba0', '45', 'XANH LƠ', 10, 'src/data/images/products/main_f4d0eb75.jpg'),
('5ee8d59d-193b-48d9-a5a5-c11dd15fa2a9', '20f57804-0c2d-408d-87e6-4d12b5b184d4', '38', 'XÁM/XANH', 10, 'src/data/images/products/main_831a4fae.jpg'),
('02ffd2c6-032d-47c3-a498-92c0dc5c2726', '20f57804-0c2d-408d-87e6-4d12b5b184d4', '39', 'XÁM/XANH', 10, 'src/data/images/products/main_831a4fae.jpg'),
('e6af580a-6e6c-42bf-8b8b-64c0cdf73248', '20f57804-0c2d-408d-87e6-4d12b5b184d4', '40', 'XÁM/XANH', 10, 'src/data/images/products/main_831a4fae.jpg'),
('db298ff3-1f0b-46ec-bbfa-305a89c6f04b', '20f57804-0c2d-408d-87e6-4d12b5b184d4', '41', 'XÁM/XANH', 10, 'src/data/images/products/main_831a4fae.jpg'),
('640cc6d6-8d6b-4646-a9a9-16ff992a13dd', '20f57804-0c2d-408d-87e6-4d12b5b184d4', '42', 'XÁM/XANH', 10, 'src/data/images/products/main_831a4fae.jpg'),
('d58b57ce-b5ee-4514-9861-dccca26cf60e', '20f57804-0c2d-408d-87e6-4d12b5b184d4', '43', 'XÁM/XANH', 10, 'src/data/images/products/main_831a4fae.jpg'),
('494a09b2-b249-4ec8-9084-5a9039227525', '20f57804-0c2d-408d-87e6-4d12b5b184d4', '44', 'XÁM/XANH', 10, 'src/data/images/products/main_831a4fae.jpg'),
('2663c713-6659-46a5-9a5a-8d93bd7d4fbe', '20f57804-0c2d-408d-87e6-4d12b5b184d4', '45', 'XÁM/XANH', 10, 'src/data/images/products/main_831a4fae.jpg'),
('c56a025d-3f66-46ad-830d-2fd094872910', '0025e232-baf9-4bd0-9fcb-ac73f99a2d37', '38', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_6d6bde8b.jpg'),
('737426dc-5bfb-4bf4-b2e1-068486c1f0f1', '0025e232-baf9-4bd0-9fcb-ac73f99a2d37', '39', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_6d6bde8b.jpg'),
('1fbde5d4-0761-4277-b6f5-a3c7ca951ded', '0025e232-baf9-4bd0-9fcb-ac73f99a2d37', '40', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_6d6bde8b.jpg'),
('93d447d3-a76d-44c9-8234-f4d6f73cc865', '0025e232-baf9-4bd0-9fcb-ac73f99a2d37', '41', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_6d6bde8b.jpg'),
('6227d418-f965-4f31-809d-5544120d5ff3', '0025e232-baf9-4bd0-9fcb-ac73f99a2d37', '42', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_6d6bde8b.jpg'),
('03b22faf-3d88-4f6f-8527-673d3319d726', '0025e232-baf9-4bd0-9fcb-ac73f99a2d37', '43', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_6d6bde8b.jpg'),
('f67fdbee-eb42-417e-9b9d-2924a1aeeac3', '0025e232-baf9-4bd0-9fcb-ac73f99a2d37', '44', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_6d6bde8b.jpg'),
('6b4d82af-4914-409e-8401-96cf1506f952', '0025e232-baf9-4bd0-9fcb-ac73f99a2d37', '45', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_6d6bde8b.jpg'),
('2ec42b96-0871-41d6-80b5-c960cdce252d', '7c1057ec-93e7-4c1d-afb5-ad5c742b6ba1', '38', 'HỒNG CAM', 10, 'src/data/images/products/main_124bb133.jpg'),
('f1e6720f-52d4-40ab-bf49-3469bdec2f98', '7c1057ec-93e7-4c1d-afb5-ad5c742b6ba1', '39', 'HỒNG CAM', 10, 'src/data/images/products/main_124bb133.jpg'),
('eb79e9d6-c815-46c6-b9b6-55bd3f5cd5e2', '7c1057ec-93e7-4c1d-afb5-ad5c742b6ba1', '40', 'HỒNG CAM', 10, 'src/data/images/products/main_124bb133.jpg'),
('ed6520f8-cf1b-4e4e-b346-61f0e2b05f2e', '7c1057ec-93e7-4c1d-afb5-ad5c742b6ba1', '41', 'HỒNG CAM', 10, 'src/data/images/products/main_124bb133.jpg'),
('a633cb12-3ef8-4420-a40c-33e0221e1d9d', '7c1057ec-93e7-4c1d-afb5-ad5c742b6ba1', '42', 'HỒNG CAM', 10, 'src/data/images/products/main_124bb133.jpg'),
('d6bcdec8-559d-4dad-a923-90a8caf574f2', '7c1057ec-93e7-4c1d-afb5-ad5c742b6ba1', '43', 'HỒNG CAM', 10, 'src/data/images/products/main_124bb133.jpg'),
('2b624665-782c-42af-972c-ec15168b8eb4', '7c1057ec-93e7-4c1d-afb5-ad5c742b6ba1', '44', 'HỒNG CAM', 10, 'src/data/images/products/main_124bb133.jpg'),
('f8d5d13b-0c2c-4a67-8d4c-cd16b9b9f373', '7c1057ec-93e7-4c1d-afb5-ad5c742b6ba1', '45', 'HỒNG CAM', 10, 'src/data/images/products/main_124bb133.jpg'),
('a2b91a53-bd3b-436c-98de-41cead536944', '1b2d4bd0-34ca-413a-b70c-846c092f4d2d', '38', 'XANH DƯƠNG/TRẮNG', 10, 'src/data/images/products/main_f360ec82.jpg'),
('0c8a775b-4748-418f-bada-7072ae831dc1', '1b2d4bd0-34ca-413a-b70c-846c092f4d2d', '39', 'XANH DƯƠNG/TRẮNG', 10, 'src/data/images/products/main_f360ec82.jpg'),
('77372f72-92f7-41b1-8c0b-2731e7df79c8', '1b2d4bd0-34ca-413a-b70c-846c092f4d2d', '40', 'XANH DƯƠNG/TRẮNG', 10, 'src/data/images/products/main_f360ec82.jpg'),
('4777623e-99ce-4f0b-b54f-fe84d9601c06', '1b2d4bd0-34ca-413a-b70c-846c092f4d2d', '41', 'XANH DƯƠNG/TRẮNG', 10, 'src/data/images/products/main_f360ec82.jpg'),
('ace04009-5be6-433c-a301-b79ff9385f60', '1b2d4bd0-34ca-413a-b70c-846c092f4d2d', '42', 'XANH DƯƠNG/TRẮNG', 10, 'src/data/images/products/main_f360ec82.jpg'),
('774b6f69-4def-4d97-b288-ee77a24fe027', '1b2d4bd0-34ca-413a-b70c-846c092f4d2d', '43', 'XANH DƯƠNG/TRẮNG', 10, 'src/data/images/products/main_f360ec82.jpg'),
('9f2242e3-7909-43a1-8e87-d6064ce64975', '1b2d4bd0-34ca-413a-b70c-846c092f4d2d', '44', 'XANH DƯƠNG/TRẮNG', 10, 'src/data/images/products/main_f360ec82.jpg'),
('7c1a6c00-cfcb-4dd7-8367-7305338b1ecb', '1b2d4bd0-34ca-413a-b70c-846c092f4d2d', '45', 'XANH DƯƠNG/TRẮNG', 10, 'src/data/images/products/main_f360ec82.jpg'),
('05aad782-42a3-4cad-8ffc-82eb25f89efb', '66364b72-06e5-423a-b5c8-37712d06aa89', '38', 'ĐỎ TRẮNG', 10, 'src/data/images/products/main_adedf842.jpg'),
('4a8bc5d5-6a39-458e-bc6e-5d40ce69e56c', '66364b72-06e5-423a-b5c8-37712d06aa89', '39', 'ĐỎ TRẮNG', 10, 'src/data/images/products/main_adedf842.jpg'),
('24b9af3a-7a52-4925-8517-74003af8f87c', '66364b72-06e5-423a-b5c8-37712d06aa89', '40', 'ĐỎ TRẮNG', 10, 'src/data/images/products/main_adedf842.jpg'),
('e5bad597-0fb5-4ea4-a6f6-344317785848', '66364b72-06e5-423a-b5c8-37712d06aa89', '41', 'ĐỎ TRẮNG', 10, 'src/data/images/products/main_adedf842.jpg'),
('22bfc661-68de-45c2-b084-b9829c0f3581', '66364b72-06e5-423a-b5c8-37712d06aa89', '42', 'ĐỎ TRẮNG', 10, 'src/data/images/products/main_adedf842.jpg'),
('64a04b1e-12ce-432d-8480-12691b11a193', '66364b72-06e5-423a-b5c8-37712d06aa89', '43', 'ĐỎ TRẮNG', 10, 'src/data/images/products/main_adedf842.jpg'),
('237ae257-517a-4be0-be32-0489cacbe7e7', '66364b72-06e5-423a-b5c8-37712d06aa89', '44', 'ĐỎ TRẮNG', 10, 'src/data/images/products/main_adedf842.jpg'),
('6876f017-e819-4c30-89bd-026083f2a375', '66364b72-06e5-423a-b5c8-37712d06aa89', '45', 'ĐỎ TRẮNG', 10, 'src/data/images/products/main_adedf842.jpg'),
('e16e5ec3-31c3-41ff-b5c0-8dd3f8e96860', '15780617-6459-4759-b361-64a784d2418c', '38', 'XANH LÁ MẠ', 10, 'src/data/images/products/main_ee986316.jpg'),
('a094d203-701b-4bdf-935e-0c8f08366a48', '15780617-6459-4759-b361-64a784d2418c', '39', 'XANH LÁ MẠ', 10, 'src/data/images/products/main_ee986316.jpg'),
('156b44bb-b601-4895-88a0-c56fcffe9d26', '15780617-6459-4759-b361-64a784d2418c', '40', 'XANH LÁ MẠ', 10, 'src/data/images/products/main_ee986316.jpg'),
('1cb2d2de-49f4-48a2-814f-578f8040c50c', '15780617-6459-4759-b361-64a784d2418c', '41', 'XANH LÁ MẠ', 10, 'src/data/images/products/main_ee986316.jpg'),
('7e7da38c-8029-4a53-9b9a-cda4f9eaf884', '15780617-6459-4759-b361-64a784d2418c', '42', 'XANH LÁ MẠ', 10, 'src/data/images/products/main_ee986316.jpg'),
('d1524a4a-f8a4-43ce-80dd-b3b1e15e89d8', '15780617-6459-4759-b361-64a784d2418c', '43', 'XANH LÁ MẠ', 10, 'src/data/images/products/main_ee986316.jpg'),
('ced9426f-6312-4074-b455-9baa3b9f075a', '15780617-6459-4759-b361-64a784d2418c', '44', 'XANH LÁ MẠ', 10, 'src/data/images/products/main_ee986316.jpg'),
('54954092-8d06-4008-bead-2990554912b0', '15780617-6459-4759-b361-64a784d2418c', '45', 'XANH LÁ MẠ', 10, 'src/data/images/products/main_ee986316.jpg'),
('642cbab7-851d-413b-8717-b6d2749a35b4', 'a3fdfee6-369d-4bb8-a80d-852d4212fa23', '38', 'CAM ĐÀO/XANH NGỌC', 10, 'src/data/images/products/main_c2963679.jpg'),
('e7be1a00-0cfe-4224-9101-ab51ea4deb35', 'a3fdfee6-369d-4bb8-a80d-852d4212fa23', '39', 'CAM ĐÀO/XANH NGỌC', 10, 'src/data/images/products/main_c2963679.jpg'),
('b06a1b0e-9a34-40a7-8c63-d4255c975d6d', 'a3fdfee6-369d-4bb8-a80d-852d4212fa23', '40', 'CAM ĐÀO/XANH NGỌC', 10, 'src/data/images/products/main_c2963679.jpg'),
('cf9d3ea0-1534-4d47-8590-31c9601a6425', 'a3fdfee6-369d-4bb8-a80d-852d4212fa23', '41', 'CAM ĐÀO/XANH NGỌC', 10, 'src/data/images/products/main_c2963679.jpg'),
('87b4a702-b580-4a3a-9f33-b920104f8b3f', 'a3fdfee6-369d-4bb8-a80d-852d4212fa23', '42', 'CAM ĐÀO/XANH NGỌC', 10, 'src/data/images/products/main_c2963679.jpg'),
('6771cb81-53ee-4605-afcd-aae5dba894e5', 'a3fdfee6-369d-4bb8-a80d-852d4212fa23', '43', 'CAM ĐÀO/XANH NGỌC', 10, 'src/data/images/products/main_c2963679.jpg'),
('951e4dd5-4c3c-4b56-8760-ae3ef2e6788c', 'a3fdfee6-369d-4bb8-a80d-852d4212fa23', '44', 'CAM ĐÀO/XANH NGỌC', 10, 'src/data/images/products/main_c2963679.jpg'),
('0768826c-ac89-4617-8a62-a330100bb929', 'a3fdfee6-369d-4bb8-a80d-852d4212fa23', '45', 'CAM ĐÀO/XANH NGỌC', 10, 'src/data/images/products/main_c2963679.jpg'),
('b27d3f58-8b5c-475d-bd6a-6d40954fa083', 'b6eade10-bdc0-4675-9d6a-8605173ff614', '38', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_6f9f0cad.jpg'),
('d31f9cee-bb0a-46ad-ab42-7ca9d20793c8', 'b6eade10-bdc0-4675-9d6a-8605173ff614', '39', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_6f9f0cad.jpg'),
('e80bfa92-962a-478d-8cd2-c3c567c8b02b', 'b6eade10-bdc0-4675-9d6a-8605173ff614', '40', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_6f9f0cad.jpg'),
('b9521268-0242-4723-a7df-18761f23459f', 'b6eade10-bdc0-4675-9d6a-8605173ff614', '41', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_6f9f0cad.jpg'),
('2aba6d26-9642-4105-9482-97a247d6f3f0', 'b6eade10-bdc0-4675-9d6a-8605173ff614', '42', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_6f9f0cad.jpg'),
('2ff8b52c-2edf-4e4e-a58c-2db2a50841db', 'b6eade10-bdc0-4675-9d6a-8605173ff614', '43', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_6f9f0cad.jpg'),
('f3bfb23c-b86e-4e44-89cc-bcbe31e5264c', 'b6eade10-bdc0-4675-9d6a-8605173ff614', '44', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_6f9f0cad.jpg'),
('05aba620-155f-4f48-a337-2977e112dc66', 'b6eade10-bdc0-4675-9d6a-8605173ff614', '45', 'TRẮNG/HỒNG', 10, 'src/data/images/products/main_6f9f0cad.jpg'),
('c6700695-32ab-4f7f-bca2-497a3b7059a6', '8b940765-cbb3-43d5-af1f-9527c73bec85', '38', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_fdc8b245.jpg'),
('c5794cd8-5be4-4a66-ab82-885210c06e91', '8b940765-cbb3-43d5-af1f-9527c73bec85', '39', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_fdc8b245.jpg'),
('f663a30a-b6e9-49ef-a9ac-8b3fd1514b5a', '8b940765-cbb3-43d5-af1f-9527c73bec85', '40', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_fdc8b245.jpg'),
('8b2a1630-ded1-4132-b46d-16342e1b97fe', '8b940765-cbb3-43d5-af1f-9527c73bec85', '41', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_fdc8b245.jpg'),
('82a26f3a-6070-4ef2-8a4b-2369dbb8d666', '8b940765-cbb3-43d5-af1f-9527c73bec85', '42', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_fdc8b245.jpg'),
('d77552a8-a0f1-410d-b2b4-3b441ec5031d', '8b940765-cbb3-43d5-af1f-9527c73bec85', '43', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_fdc8b245.jpg'),
('310f9368-b11a-4b3e-9b6f-baa405f51d97', '8b940765-cbb3-43d5-af1f-9527c73bec85', '44', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_fdc8b245.jpg'),
('6cecddba-e9a1-4d4e-8c86-e4dd319b2937', '8b940765-cbb3-43d5-af1f-9527c73bec85', '45', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_fdc8b245.jpg'),
('4d526e17-3b87-4bbf-a6c2-f0fd661a7f49', 'ebe1fb33-9209-4db5-9616-b054d1526a4e', '38', 'TRẮNG/ĐEN/VÀNG', 10, 'src/data/images/products/main_3e9a5b6a.jpg'),
('24e03d64-39ef-4a8c-b85c-140f8b7eec99', 'ebe1fb33-9209-4db5-9616-b054d1526a4e', '39', 'TRẮNG/ĐEN/VÀNG', 10, 'src/data/images/products/main_3e9a5b6a.jpg'),
('c3eba171-f301-4025-a7d2-353cc512ff87', 'ebe1fb33-9209-4db5-9616-b054d1526a4e', '40', 'TRẮNG/ĐEN/VÀNG', 10, 'src/data/images/products/main_3e9a5b6a.jpg'),
('e3319e25-04e2-4cbe-a2bc-410081057429', 'ebe1fb33-9209-4db5-9616-b054d1526a4e', '41', 'TRẮNG/ĐEN/VÀNG', 10, 'src/data/images/products/main_3e9a5b6a.jpg');

INSERT INTO product_variants (variant_id, product_id, size, color, stock, image_url) VALUES
('fcb67b94-21e1-4189-96ca-fa0594598168', 'ebe1fb33-9209-4db5-9616-b054d1526a4e', '42', 'TRẮNG/ĐEN/VÀNG', 10, 'src/data/images/products/main_3e9a5b6a.jpg'),
('7e095e5f-bd76-4754-ab14-e9915db9e2bf', 'ebe1fb33-9209-4db5-9616-b054d1526a4e', '43', 'TRẮNG/ĐEN/VÀNG', 10, 'src/data/images/products/main_3e9a5b6a.jpg'),
('54e0340e-5619-4f9e-bdf2-37bce1118610', 'ebe1fb33-9209-4db5-9616-b054d1526a4e', '44', 'TRẮNG/ĐEN/VÀNG', 10, 'src/data/images/products/main_3e9a5b6a.jpg'),
('4519f468-21af-47bc-9883-f0537758104a', 'ebe1fb33-9209-4db5-9616-b054d1526a4e', '45', 'TRẮNG/ĐEN/VÀNG', 10, 'src/data/images/products/main_3e9a5b6a.jpg'),
('295f47fd-b9c6-436d-8e48-b963e7c2bb91', '82287492-131c-4a70-9bc9-ed00c0d61db1', '38', 'HỒNG/ĐEN', 10, 'src/data/images/products/main_8a4d9726.jpg'),
('a54fc33c-8024-4a85-9fec-9586a44f6144', '82287492-131c-4a70-9bc9-ed00c0d61db1', '39', 'HỒNG/ĐEN', 10, 'src/data/images/products/main_8a4d9726.jpg'),
('c3e9017c-73c6-4cdd-be3d-5016eb4fcfd5', '82287492-131c-4a70-9bc9-ed00c0d61db1', '40', 'HỒNG/ĐEN', 10, 'src/data/images/products/main_8a4d9726.jpg'),
('f3b6474b-d239-448a-a4ab-f6abcc023d11', '82287492-131c-4a70-9bc9-ed00c0d61db1', '41', 'HỒNG/ĐEN', 10, 'src/data/images/products/main_8a4d9726.jpg'),
('f9f0e98b-ff5c-48ab-b9d7-89129398fe57', '82287492-131c-4a70-9bc9-ed00c0d61db1', '42', 'HỒNG/ĐEN', 10, 'src/data/images/products/main_8a4d9726.jpg'),
('c70eb25d-ca3d-4bb2-b0fa-3b198c7da97e', '82287492-131c-4a70-9bc9-ed00c0d61db1', '43', 'HỒNG/ĐEN', 10, 'src/data/images/products/main_8a4d9726.jpg'),
('40773fa3-20db-42bb-b7f2-33f05ceb4575', '82287492-131c-4a70-9bc9-ed00c0d61db1', '44', 'HỒNG/ĐEN', 10, 'src/data/images/products/main_8a4d9726.jpg'),
('ac641402-d956-42f8-9cf9-a3ebf7d5568a', '82287492-131c-4a70-9bc9-ed00c0d61db1', '45', 'HỒNG/ĐEN', 10, 'src/data/images/products/main_8a4d9726.jpg'),
('620458ec-f437-467c-977a-7f164f20dbc5', 'adcf281f-bb4e-41a9-b5de-cdb932e02224', '38', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_f8fc38dc.jpg'),
('8184afbe-feba-40ab-9a39-4b5b1f173a80', 'adcf281f-bb4e-41a9-b5de-cdb932e02224', '39', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_f8fc38dc.jpg'),
('fd77781f-1c80-442e-a1a5-63386c817858', 'adcf281f-bb4e-41a9-b5de-cdb932e02224', '40', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_f8fc38dc.jpg'),
('4eaa3208-8646-4623-b339-8c4d93b567c3', 'adcf281f-bb4e-41a9-b5de-cdb932e02224', '41', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_f8fc38dc.jpg'),
('5e7217ed-f0d8-4e14-a0a6-a3406647cfc3', 'adcf281f-bb4e-41a9-b5de-cdb932e02224', '42', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_f8fc38dc.jpg'),
('d2fc60cd-0abd-40e7-b0df-60b1f3bd72d7', 'adcf281f-bb4e-41a9-b5de-cdb932e02224', '43', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_f8fc38dc.jpg'),
('c71628db-726c-4c5f-8c0c-1938c7b04bc1', 'adcf281f-bb4e-41a9-b5de-cdb932e02224', '44', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_f8fc38dc.jpg'),
('74f95b6d-38b6-46fd-8ad2-1eac8f4bddb8', 'adcf281f-bb4e-41a9-b5de-cdb932e02224', '45', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_f8fc38dc.jpg'),
('8b7190ef-0cbb-4ab4-a565-4ae2659204b4', 'aca3e1f6-339f-4b74-8f86-e022247b2003', '38', 'TRẮNG/CAM', 10, 'src/data/images/products/main_f042c5e5.jpg'),
('cb48d79d-7107-49fc-a194-89befcc272b8', 'aca3e1f6-339f-4b74-8f86-e022247b2003', '39', 'TRẮNG/CAM', 10, 'src/data/images/products/main_f042c5e5.jpg'),
('ad1bea14-e1bb-486a-9f98-f5973ac648d0', 'aca3e1f6-339f-4b74-8f86-e022247b2003', '40', 'TRẮNG/CAM', 10, 'src/data/images/products/main_f042c5e5.jpg'),
('73c978d1-6200-42b7-b0e5-dc1a2f12dd63', 'aca3e1f6-339f-4b74-8f86-e022247b2003', '41', 'TRẮNG/CAM', 10, 'src/data/images/products/main_f042c5e5.jpg'),
('0e9fac1c-23aa-41d4-8e7e-5526b18420c9', 'aca3e1f6-339f-4b74-8f86-e022247b2003', '42', 'TRẮNG/CAM', 10, 'src/data/images/products/main_f042c5e5.jpg'),
('794c45e3-147e-4a6f-aa62-cb9dd73151b8', 'aca3e1f6-339f-4b74-8f86-e022247b2003', '43', 'TRẮNG/CAM', 10, 'src/data/images/products/main_f042c5e5.jpg'),
('0baa117a-dd2c-4131-a631-374b58313639', 'aca3e1f6-339f-4b74-8f86-e022247b2003', '44', 'TRẮNG/CAM', 10, 'src/data/images/products/main_f042c5e5.jpg'),
('110de813-5017-4130-8df2-3c695e0a5adb', 'aca3e1f6-339f-4b74-8f86-e022247b2003', '45', 'TRẮNG/CAM', 10, 'src/data/images/products/main_f042c5e5.jpg'),
('36836340-1385-4aa7-9ba8-eaa38e6843a1', 'c9659195-350f-4b6b-8418-d7a8a9360782', '38', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_43a5a06d.jpg'),
('05a17b25-0a22-465f-9536-6b7c7ccf37e7', 'c9659195-350f-4b6b-8418-d7a8a9360782', '39', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_43a5a06d.jpg'),
('4cd00748-5a7e-4b22-ba3f-c0fbfe9e95a7', 'c9659195-350f-4b6b-8418-d7a8a9360782', '40', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_43a5a06d.jpg'),
('f486f36d-3f53-4d30-8ea2-e4289ae9fe55', 'c9659195-350f-4b6b-8418-d7a8a9360782', '41', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_43a5a06d.jpg'),
('50c1d27b-5efa-4eda-918b-371849a6579a', 'c9659195-350f-4b6b-8418-d7a8a9360782', '42', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_43a5a06d.jpg'),
('c9108be9-3a3c-44f4-87c4-4d73678c4ac6', 'c9659195-350f-4b6b-8418-d7a8a9360782', '43', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_43a5a06d.jpg'),
('9566d73c-33e8-477d-9717-920bb13634a5', 'c9659195-350f-4b6b-8418-d7a8a9360782', '44', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_43a5a06d.jpg'),
('1dcf4ed1-66e5-4a82-9515-c1540919a45e', 'c9659195-350f-4b6b-8418-d7a8a9360782', '45', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_43a5a06d.jpg'),
('19e47820-9bf6-4adb-aec7-0e2e10951b45', '7a9fed17-5541-4965-b192-10b74a788e73', '38', 'XÁM/CAM', 10, 'src/data/images/products/main_278449e0.jpg'),
('6f719748-f3f3-4b96-ba00-2fb8d5bdf3f1', '7a9fed17-5541-4965-b192-10b74a788e73', '39', 'XÁM/CAM', 10, 'src/data/images/products/main_278449e0.jpg'),
('a5285859-c1b5-4ca9-a9e9-fb8d9e27f0b3', '7a9fed17-5541-4965-b192-10b74a788e73', '40', 'XÁM/CAM', 10, 'src/data/images/products/main_278449e0.jpg'),
('ffa6f430-d059-4a93-ab8e-b224ae2c9d71', '7a9fed17-5541-4965-b192-10b74a788e73', '41', 'XÁM/CAM', 10, 'src/data/images/products/main_278449e0.jpg'),
('fbdcc89f-9e80-42bb-960f-74ee575b0995', '7a9fed17-5541-4965-b192-10b74a788e73', '42', 'XÁM/CAM', 10, 'src/data/images/products/main_278449e0.jpg'),
('4a9babe2-6373-42c4-a534-817f15d27fb3', '7a9fed17-5541-4965-b192-10b74a788e73', '43', 'XÁM/CAM', 10, 'src/data/images/products/main_278449e0.jpg'),
('8b5c9fa8-fc2e-4272-9832-0ba8fea0da85', '7a9fed17-5541-4965-b192-10b74a788e73', '44', 'XÁM/CAM', 10, 'src/data/images/products/main_278449e0.jpg'),
('6abba5e6-3d08-42da-ab45-0c67c1961b4a', '7a9fed17-5541-4965-b192-10b74a788e73', '45', 'XÁM/CAM', 10, 'src/data/images/products/main_278449e0.jpg'),
('144f6a7a-2992-4dba-a861-f6d6a8a8408d', '7d3c6364-8064-4bbf-b6af-27f17eef9c36', '38', 'ĐEN/TÍM', 10, 'src/data/images/products/main_89a439f2.jpg'),
('8d158618-1910-43ed-81e1-e5a6af6e9ca0', '7d3c6364-8064-4bbf-b6af-27f17eef9c36', '39', 'ĐEN/TÍM', 10, 'src/data/images/products/main_89a439f2.jpg'),
('f84c0565-4369-4c1a-9d6d-c4f45c368836', '7d3c6364-8064-4bbf-b6af-27f17eef9c36', '40', 'ĐEN/TÍM', 10, 'src/data/images/products/main_89a439f2.jpg'),
('19373264-8d80-4d90-9b12-19307b868e1f', '7d3c6364-8064-4bbf-b6af-27f17eef9c36', '41', 'ĐEN/TÍM', 10, 'src/data/images/products/main_89a439f2.jpg'),
('62c58769-ba31-4ea3-ac47-0824fb9736c6', '7d3c6364-8064-4bbf-b6af-27f17eef9c36', '42', 'ĐEN/TÍM', 10, 'src/data/images/products/main_89a439f2.jpg'),
('9d74456c-a0cf-46ef-ad8f-54487cb53931', '7d3c6364-8064-4bbf-b6af-27f17eef9c36', '43', 'ĐEN/TÍM', 10, 'src/data/images/products/main_89a439f2.jpg'),
('7c8f58c6-5501-4401-8573-e4156bb3f205', '7d3c6364-8064-4bbf-b6af-27f17eef9c36', '44', 'ĐEN/TÍM', 10, 'src/data/images/products/main_89a439f2.jpg'),
('1c97abdf-3e68-4efa-a27d-1f7ef9914484', '7d3c6364-8064-4bbf-b6af-27f17eef9c36', '45', 'ĐEN/TÍM', 10, 'src/data/images/products/main_89a439f2.jpg'),
('d82f9f5d-a999-4e10-847a-aa7b4296b6e7', '41cd8642-ad60-4ea8-a649-89c8a3b3850b', '38', 'HỒNG/XANH', 10, 'src/data/images/products/main_0bceaf45.jpg'),
('3ee19b96-ce63-4804-8cf6-e15b0fa7f751', '41cd8642-ad60-4ea8-a649-89c8a3b3850b', '39', 'HỒNG/XANH', 10, 'src/data/images/products/main_0bceaf45.jpg'),
('5ee7ba80-b580-4f46-ad1f-ea7bafdf7c8f', '41cd8642-ad60-4ea8-a649-89c8a3b3850b', '40', 'HỒNG/XANH', 10, 'src/data/images/products/main_0bceaf45.jpg'),
('a19b7f82-f14d-49b5-9891-c2f7ae93b6e5', '41cd8642-ad60-4ea8-a649-89c8a3b3850b', '41', 'HỒNG/XANH', 10, 'src/data/images/products/main_0bceaf45.jpg'),
('3aad3f5f-97f4-4100-9862-a1c98d332b76', '41cd8642-ad60-4ea8-a649-89c8a3b3850b', '42', 'HỒNG/XANH', 10, 'src/data/images/products/main_0bceaf45.jpg'),
('5e6c9377-4b43-4e2b-a549-da80cd3c4b48', '41cd8642-ad60-4ea8-a649-89c8a3b3850b', '43', 'HỒNG/XANH', 10, 'src/data/images/products/main_0bceaf45.jpg'),
('417508cf-01b0-4d8a-a5e9-e694e767b092', '41cd8642-ad60-4ea8-a649-89c8a3b3850b', '44', 'HỒNG/XANH', 10, 'src/data/images/products/main_0bceaf45.jpg'),
('7c0da3e2-ffbd-4858-a5d4-f2e8f7bc228f', '41cd8642-ad60-4ea8-a649-89c8a3b3850b', '45', 'HỒNG/XANH', 10, 'src/data/images/products/main_0bceaf45.jpg'),
('c8f37dfc-30fc-4733-b0a0-69a09d06a7d2', '823a4d90-d623-49a6-9c00-d2ccf08931f7', '38', 'NÂU/ĐEN', 10, 'src/data/images/products/main_d19550ba.jpg'),
('627a87fe-d2e9-4647-b60f-14c997fdc51e', '823a4d90-d623-49a6-9c00-d2ccf08931f7', '39', 'NÂU/ĐEN', 10, 'src/data/images/products/main_d19550ba.jpg'),
('52494548-6535-414d-bb00-d64b0d7768a9', '823a4d90-d623-49a6-9c00-d2ccf08931f7', '40', 'NÂU/ĐEN', 10, 'src/data/images/products/main_d19550ba.jpg'),
('68eb8826-476d-4287-aaad-b50732773368', '823a4d90-d623-49a6-9c00-d2ccf08931f7', '41', 'NÂU/ĐEN', 10, 'src/data/images/products/main_d19550ba.jpg'),
('6371eda9-20e7-495c-9581-92f872636951', '823a4d90-d623-49a6-9c00-d2ccf08931f7', '42', 'NÂU/ĐEN', 10, 'src/data/images/products/main_d19550ba.jpg'),
('f1b71172-30ef-4965-992f-bf3763364a85', '823a4d90-d623-49a6-9c00-d2ccf08931f7', '43', 'NÂU/ĐEN', 10, 'src/data/images/products/main_d19550ba.jpg'),
('a7200362-0f96-4da8-baab-16ad99b9448e', '823a4d90-d623-49a6-9c00-d2ccf08931f7', '44', 'NÂU/ĐEN', 10, 'src/data/images/products/main_d19550ba.jpg'),
('e060d6af-1b5e-4b96-8d33-4e674e8a0045', '823a4d90-d623-49a6-9c00-d2ccf08931f7', '45', 'NÂU/ĐEN', 10, 'src/data/images/products/main_d19550ba.jpg'),
('6f24e730-4024-4de5-9187-c3c9b03e6d62', '1e42543b-2fa2-4f7d-a4f3-bbf8547d836a', '38', 'VÀNG NEON/TRẮNG', 10, 'src/data/images/products/main_3af5e7f4.jpg'),
('660b5060-6f73-4ab2-99d7-16285bc949cf', '1e42543b-2fa2-4f7d-a4f3-bbf8547d836a', '39', 'VÀNG NEON/TRẮNG', 10, 'src/data/images/products/main_3af5e7f4.jpg'),
('1f764cd9-0cb6-46db-a1c2-45f1adb18146', '1e42543b-2fa2-4f7d-a4f3-bbf8547d836a', '40', 'VÀNG NEON/TRẮNG', 10, 'src/data/images/products/main_3af5e7f4.jpg'),
('91460f69-8534-4f82-b126-bf32bb3c295d', '1e42543b-2fa2-4f7d-a4f3-bbf8547d836a', '41', 'VÀNG NEON/TRẮNG', 10, 'src/data/images/products/main_3af5e7f4.jpg'),
('208c7d78-8234-4293-ad52-d85922ae36be', '1e42543b-2fa2-4f7d-a4f3-bbf8547d836a', '42', 'VÀNG NEON/TRẮNG', 10, 'src/data/images/products/main_3af5e7f4.jpg'),
('1b3e7dda-7324-44fd-a0a5-5ecf9b1060e0', '1e42543b-2fa2-4f7d-a4f3-bbf8547d836a', '43', 'VÀNG NEON/TRẮNG', 10, 'src/data/images/products/main_3af5e7f4.jpg'),
('c729eed1-04c9-4cb8-bfbd-d36d39f6a089', '1e42543b-2fa2-4f7d-a4f3-bbf8547d836a', '44', 'VÀNG NEON/TRẮNG', 10, 'src/data/images/products/main_3af5e7f4.jpg'),
('20208f5c-a610-4feb-8ee4-9e96d8665154', '1e42543b-2fa2-4f7d-a4f3-bbf8547d836a', '45', 'VÀNG NEON/TRẮNG', 10, 'src/data/images/products/main_3af5e7f4.jpg'),
('c7af68cd-fc93-4f41-ba75-9d3222ec1787', '54c820d7-b90d-42d6-b37b-670abe4a40b1', '38', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_19fb4ff7.jpg'),
('699608e5-b684-4f6c-8752-69f3388b63cc', '54c820d7-b90d-42d6-b37b-670abe4a40b1', '39', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_19fb4ff7.jpg'),
('03ce032e-b3d5-4d41-a2db-2c43327f1228', '54c820d7-b90d-42d6-b37b-670abe4a40b1', '40', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_19fb4ff7.jpg'),
('2a3a5054-f7a5-45d1-81ae-54a32b06efde', '54c820d7-b90d-42d6-b37b-670abe4a40b1', '41', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_19fb4ff7.jpg'),
('86222adf-e0e6-42f8-97a7-3fb970fe93c8', '54c820d7-b90d-42d6-b37b-670abe4a40b1', '42', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_19fb4ff7.jpg'),
('37d2e83b-fbac-48e8-abfa-4fcae393896d', '54c820d7-b90d-42d6-b37b-670abe4a40b1', '43', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_19fb4ff7.jpg'),
('d67ff56a-9b1c-42b5-a1dc-3c64899f0062', '54c820d7-b90d-42d6-b37b-670abe4a40b1', '44', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_19fb4ff7.jpg'),
('fc7f3836-ff3e-43fd-8389-b22b54ba2a86', '54c820d7-b90d-42d6-b37b-670abe4a40b1', '45', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_19fb4ff7.jpg'),
('a991e9be-6239-4a68-b658-46c43dba3db1', '697f03b6-9d64-4f5d-bd75-e4da7b241f9b', '38', 'ĐỎ CAM', 10, 'src/data/images/products/main_0efb3584.jpg'),
('a8ee039d-cdf0-4d1b-937a-19f19c1453d7', '697f03b6-9d64-4f5d-bd75-e4da7b241f9b', '39', 'ĐỎ CAM', 10, 'src/data/images/products/main_0efb3584.jpg'),
('d4f23380-0eae-4c47-af4c-fd094a207137', '697f03b6-9d64-4f5d-bd75-e4da7b241f9b', '40', 'ĐỎ CAM', 10, 'src/data/images/products/main_0efb3584.jpg'),
('abf02888-0236-4409-a8fc-592d2c6bc7b8', '697f03b6-9d64-4f5d-bd75-e4da7b241f9b', '41', 'ĐỎ CAM', 10, 'src/data/images/products/main_0efb3584.jpg'),
('27925bc8-2fd1-4c6f-9073-9a143d2cd51b', '697f03b6-9d64-4f5d-bd75-e4da7b241f9b', '42', 'ĐỎ CAM', 10, 'src/data/images/products/main_0efb3584.jpg'),
('97f9cc5f-840e-47b5-afb0-df4039466b49', '697f03b6-9d64-4f5d-bd75-e4da7b241f9b', '43', 'ĐỎ CAM', 10, 'src/data/images/products/main_0efb3584.jpg'),
('3498ec13-1676-47e2-aa30-742aea2287eb', '697f03b6-9d64-4f5d-bd75-e4da7b241f9b', '44', 'ĐỎ CAM', 10, 'src/data/images/products/main_0efb3584.jpg'),
('f6a0fb2a-4dee-418d-9019-a77cf9e9149e', '697f03b6-9d64-4f5d-bd75-e4da7b241f9b', '45', 'ĐỎ CAM', 10, 'src/data/images/products/main_0efb3584.jpg'),
('ec4f98fb-e8a0-478b-a67a-3fe53562d8ae', 'f64d32e9-9dfc-4eec-bb88-f0511e0f9acd', '38', 'XANH BIỂN', 10, 'src/data/images/products/main_1d55e29e.jpg'),
('c3cbac43-a49d-4c11-956d-33433e7c0ebf', 'f64d32e9-9dfc-4eec-bb88-f0511e0f9acd', '39', 'XANH BIỂN', 10, 'src/data/images/products/main_1d55e29e.jpg'),
('b48c0e57-2f94-4f5e-b72f-0d4e9ef7cccf', 'f64d32e9-9dfc-4eec-bb88-f0511e0f9acd', '40', 'XANH BIỂN', 10, 'src/data/images/products/main_1d55e29e.jpg'),
('abea764e-6aa1-4ce7-9ca9-088c348e394f', 'f64d32e9-9dfc-4eec-bb88-f0511e0f9acd', '41', 'XANH BIỂN', 10, 'src/data/images/products/main_1d55e29e.jpg'),
('45f179d8-dd45-466d-b4e9-17dd569d2781', 'f64d32e9-9dfc-4eec-bb88-f0511e0f9acd', '42', 'XANH BIỂN', 10, 'src/data/images/products/main_1d55e29e.jpg'),
('fcb78cf4-6cd5-4d67-8548-ca400e1b836f', 'f64d32e9-9dfc-4eec-bb88-f0511e0f9acd', '43', 'XANH BIỂN', 10, 'src/data/images/products/main_1d55e29e.jpg'),
('81aa46ba-7e4c-4530-adb3-98ac1af4fb0a', 'f64d32e9-9dfc-4eec-bb88-f0511e0f9acd', '44', 'XANH BIỂN', 10, 'src/data/images/products/main_1d55e29e.jpg'),
('63390326-5708-4dd2-827d-3ebaac89f641', 'f64d32e9-9dfc-4eec-bb88-f0511e0f9acd', '45', 'XANH BIỂN', 10, 'src/data/images/products/main_1d55e29e.jpg');

INSERT INTO product_variants (variant_id, product_id, size, color, stock, image_url) VALUES
('19967dc7-6fce-4eb2-83df-bb933f608820', '58f3b802-90a1-491d-b10f-ae23746a5a35', '38', 'ĐEN', 10, 'src/data/images/products/main_159100a2.jpg'),
('c32b13be-efc2-4421-b70e-f4c9bd3d749c', '58f3b802-90a1-491d-b10f-ae23746a5a35', '39', 'ĐEN', 10, 'src/data/images/products/main_159100a2.jpg'),
('4902b3e9-103b-4aa3-b6bf-ec4a89249d82', '58f3b802-90a1-491d-b10f-ae23746a5a35', '40', 'ĐEN', 10, 'src/data/images/products/main_159100a2.jpg'),
('d657f350-555c-4916-b0a8-aaca633d7af5', '58f3b802-90a1-491d-b10f-ae23746a5a35', '41', 'ĐEN', 10, 'src/data/images/products/main_159100a2.jpg'),
('ab174714-305b-4038-bfd5-2a9cc80a0c58', '58f3b802-90a1-491d-b10f-ae23746a5a35', '42', 'ĐEN', 10, 'src/data/images/products/main_159100a2.jpg'),
('89d414c2-27dc-4026-a5c0-b8e4e462741e', '58f3b802-90a1-491d-b10f-ae23746a5a35', '43', 'ĐEN', 10, 'src/data/images/products/main_159100a2.jpg'),
('58a15b11-5575-42e0-b0bf-d9aa8e1d8d85', '58f3b802-90a1-491d-b10f-ae23746a5a35', '44', 'ĐEN', 10, 'src/data/images/products/main_159100a2.jpg'),
('5da6b5b0-0696-4ab5-9550-c5c5b76e0c60', '58f3b802-90a1-491d-b10f-ae23746a5a35', '45', 'ĐEN', 10, 'src/data/images/products/main_159100a2.jpg'),
('81810af5-cad2-408a-bedf-f3b56d48ee73', '9cf588f6-1445-4dfe-93d0-25a406c14735', '38', 'XÁM XANH/HỒNG', 10, 'src/data/images/products/main_0a770d13.jpg'),
('39dd97b3-ca37-414c-94d0-c81e61a1e35e', '9cf588f6-1445-4dfe-93d0-25a406c14735', '39', 'XÁM XANH/HỒNG', 10, 'src/data/images/products/main_0a770d13.jpg'),
('16d3f04f-2be6-437f-aa5d-21451a032538', '9cf588f6-1445-4dfe-93d0-25a406c14735', '40', 'XÁM XANH/HỒNG', 10, 'src/data/images/products/main_0a770d13.jpg'),
('b1e76886-4b40-43b5-bb10-7df84b64a139', '9cf588f6-1445-4dfe-93d0-25a406c14735', '41', 'XÁM XANH/HỒNG', 10, 'src/data/images/products/main_0a770d13.jpg'),
('c77517a7-b07f-4b21-b4e1-6329a878c219', '9cf588f6-1445-4dfe-93d0-25a406c14735', '42', 'XÁM XANH/HỒNG', 10, 'src/data/images/products/main_0a770d13.jpg'),
('f947bdea-9c10-42ba-867e-7a8174160eb7', '9cf588f6-1445-4dfe-93d0-25a406c14735', '43', 'XÁM XANH/HỒNG', 10, 'src/data/images/products/main_0a770d13.jpg'),
('375a15b8-7331-47ab-bdc9-b75f83154a00', '9cf588f6-1445-4dfe-93d0-25a406c14735', '44', 'XÁM XANH/HỒNG', 10, 'src/data/images/products/main_0a770d13.jpg'),
('c036ed39-f618-4c3f-bf8e-20617d121a00', '9cf588f6-1445-4dfe-93d0-25a406c14735', '45', 'XÁM XANH/HỒNG', 10, 'src/data/images/products/main_0a770d13.jpg'),
('1f896bf0-b9eb-4774-b10a-183f2ce5c167', '9ae8d989-3c2d-46ef-91f7-a171f4576c3f', '38', 'XANH/TRẮNG', 10, 'src/data/images/products/main_8c7de6f1.jpg'),
('6e531cb4-e6e5-4ec3-8685-7819ddf2a7b9', '9ae8d989-3c2d-46ef-91f7-a171f4576c3f', '39', 'XANH/TRẮNG', 10, 'src/data/images/products/main_8c7de6f1.jpg'),
('c5026436-60c1-4757-8026-41d4fbb80a44', '9ae8d989-3c2d-46ef-91f7-a171f4576c3f', '40', 'XANH/TRẮNG', 10, 'src/data/images/products/main_8c7de6f1.jpg'),
('05f4d278-f7d4-4887-9841-738fa818e683', '9ae8d989-3c2d-46ef-91f7-a171f4576c3f', '41', 'XANH/TRẮNG', 10, 'src/data/images/products/main_8c7de6f1.jpg'),
('6704b23b-25ad-4620-94e3-cf641e37bdce', '9ae8d989-3c2d-46ef-91f7-a171f4576c3f', '42', 'XANH/TRẮNG', 10, 'src/data/images/products/main_8c7de6f1.jpg'),
('7f6521da-0dc3-406a-b92b-e6b374370bcc', '9ae8d989-3c2d-46ef-91f7-a171f4576c3f', '43', 'XANH/TRẮNG', 10, 'src/data/images/products/main_8c7de6f1.jpg'),
('8b9410c8-e105-4429-8b7f-51af8d71833d', '9ae8d989-3c2d-46ef-91f7-a171f4576c3f', '44', 'XANH/TRẮNG', 10, 'src/data/images/products/main_8c7de6f1.jpg'),
('39eb6610-e9ac-41c9-8682-2a86ab16cd92', '9ae8d989-3c2d-46ef-91f7-a171f4576c3f', '45', 'XANH/TRẮNG', 10, 'src/data/images/products/main_8c7de6f1.jpg'),
('c5f03a98-7abd-424d-9999-ad5f82eb0083', 'a24e90c4-3c12-4079-a083-7b450876e022', '38', 'TÍM/TRẮNG/VÀNG', 10, 'src/data/images/products/main_060e244c.jpg'),
('a5cfa949-7199-49d5-9779-a0be92248ae2', 'a24e90c4-3c12-4079-a083-7b450876e022', '39', 'TÍM/TRẮNG/VÀNG', 10, 'src/data/images/products/main_060e244c.jpg'),
('2530d061-3e3d-4ef7-956a-ab77be75eb81', 'a24e90c4-3c12-4079-a083-7b450876e022', '40', 'TÍM/TRẮNG/VÀNG', 10, 'src/data/images/products/main_060e244c.jpg'),
('a7e87252-98e7-4a03-af5c-94e3b8889475', 'a24e90c4-3c12-4079-a083-7b450876e022', '41', 'TÍM/TRẮNG/VÀNG', 10, 'src/data/images/products/main_060e244c.jpg'),
('77e240a0-cb3f-41d1-8301-896e74058762', 'a24e90c4-3c12-4079-a083-7b450876e022', '42', 'TÍM/TRẮNG/VÀNG', 10, 'src/data/images/products/main_060e244c.jpg'),
('e7864ad2-9f3e-47a1-b1e6-abeeab5507d6', 'a24e90c4-3c12-4079-a083-7b450876e022', '43', 'TÍM/TRẮNG/VÀNG', 10, 'src/data/images/products/main_060e244c.jpg'),
('0897bf02-57f7-458a-adda-18a38893c6e6', 'a24e90c4-3c12-4079-a083-7b450876e022', '44', 'TÍM/TRẮNG/VÀNG', 10, 'src/data/images/products/main_060e244c.jpg'),
('64e3dc1f-674c-40fd-b1b5-e4b8d774f5aa', 'a24e90c4-3c12-4079-a083-7b450876e022', '45', 'TÍM/TRẮNG/VÀNG', 10, 'src/data/images/products/main_060e244c.jpg'),
('ff585e70-9a21-4b7e-b11a-c8af4d002b08', 'dd598489-bcba-48db-9d98-94e0e2a69c05', '38', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_dafb8707.jpg'),
('f3a4622f-0997-4e81-9f44-865eb354ac0e', 'dd598489-bcba-48db-9d98-94e0e2a69c05', '39', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_dafb8707.jpg'),
('22610ab9-4292-4a75-aba1-b60cb3d559d3', 'dd598489-bcba-48db-9d98-94e0e2a69c05', '40', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_dafb8707.jpg'),
('b7999844-6a48-44bb-8605-6c78ae126253', 'dd598489-bcba-48db-9d98-94e0e2a69c05', '41', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_dafb8707.jpg'),
('9620613d-4656-44a7-a2f1-148bb109ede6', 'dd598489-bcba-48db-9d98-94e0e2a69c05', '42', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_dafb8707.jpg'),
('797ab2da-6779-4dca-8d19-9d3aa9923693', 'dd598489-bcba-48db-9d98-94e0e2a69c05', '43', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_dafb8707.jpg'),
('cc63a71b-ab22-483d-97b4-72f4c6e7d69c', 'dd598489-bcba-48db-9d98-94e0e2a69c05', '44', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_dafb8707.jpg'),
('e06d315f-5389-4881-8a93-a8823dcd5a78', 'dd598489-bcba-48db-9d98-94e0e2a69c05', '45', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_dafb8707.jpg'),
('c6ce8055-2300-443a-98fe-bce5e9076c62', '6948b4a5-f73e-42c3-b70e-271e4a3583a7', '38', 'VÀNG/CAM', 10, 'src/data/images/products/main_d9034288.jpg'),
('916d5c02-2985-4639-bcd2-a5cdfd628966', '6948b4a5-f73e-42c3-b70e-271e4a3583a7', '39', 'VÀNG/CAM', 10, 'src/data/images/products/main_d9034288.jpg'),
('ec5aaea8-55a9-42f6-900c-df5f1dd133af', '6948b4a5-f73e-42c3-b70e-271e4a3583a7', '40', 'VÀNG/CAM', 10, 'src/data/images/products/main_d9034288.jpg'),
('3b7f5ce7-c828-46e1-8e4d-bf762eb8991a', '6948b4a5-f73e-42c3-b70e-271e4a3583a7', '41', 'VÀNG/CAM', 10, 'src/data/images/products/main_d9034288.jpg'),
('1757735d-3f06-46c1-be03-6b1693901fb7', '6948b4a5-f73e-42c3-b70e-271e4a3583a7', '42', 'VÀNG/CAM', 10, 'src/data/images/products/main_d9034288.jpg'),
('e2077eb6-8e46-479c-a6bf-8f9e30cec2c7', '6948b4a5-f73e-42c3-b70e-271e4a3583a7', '43', 'VÀNG/CAM', 10, 'src/data/images/products/main_d9034288.jpg'),
('3ea39f12-b9ff-42c9-ab67-c1ef0ed8416e', '6948b4a5-f73e-42c3-b70e-271e4a3583a7', '44', 'VÀNG/CAM', 10, 'src/data/images/products/main_d9034288.jpg'),
('2ac52343-346f-4ee3-a125-e66c46e682ba', '6948b4a5-f73e-42c3-b70e-271e4a3583a7', '45', 'VÀNG/CAM', 10, 'src/data/images/products/main_d9034288.jpg'),
('25f052e9-a52d-4714-8f80-49c9166643b3', '4465e169-ceec-4290-9016-66db0818af79', '38', 'HỒNG/ĐEN/CAM', 10, 'src/data/images/products/main_7bb205ee.jpg'),
('014b47a4-1973-4b03-8e4b-ea29b62e42d6', '4465e169-ceec-4290-9016-66db0818af79', '39', 'HỒNG/ĐEN/CAM', 10, 'src/data/images/products/main_7bb205ee.jpg'),
('81433539-f13d-4da8-ad8e-238b8bd917d1', '4465e169-ceec-4290-9016-66db0818af79', '40', 'HỒNG/ĐEN/CAM', 10, 'src/data/images/products/main_7bb205ee.jpg'),
('639293c9-240b-4539-97cb-8493bb3f0e19', '4465e169-ceec-4290-9016-66db0818af79', '41', 'HỒNG/ĐEN/CAM', 10, 'src/data/images/products/main_7bb205ee.jpg'),
('beb4d961-ca15-422e-a4a1-ba5cbcb8ae12', '4465e169-ceec-4290-9016-66db0818af79', '42', 'HỒNG/ĐEN/CAM', 10, 'src/data/images/products/main_7bb205ee.jpg'),
('025e2bf0-f3e1-43c8-bb86-b194fc53b780', '4465e169-ceec-4290-9016-66db0818af79', '43', 'HỒNG/ĐEN/CAM', 10, 'src/data/images/products/main_7bb205ee.jpg'),
('d71c5fe1-f357-4f89-880b-55b42d6b94a2', '4465e169-ceec-4290-9016-66db0818af79', '44', 'HỒNG/ĐEN/CAM', 10, 'src/data/images/products/main_7bb205ee.jpg'),
('a26c9812-4703-4f65-9a31-c4cb6a04f1dc', '4465e169-ceec-4290-9016-66db0818af79', '45', 'HỒNG/ĐEN/CAM', 10, 'src/data/images/products/main_7bb205ee.jpg'),
('ccc6aeca-5578-482c-86b6-2ed573af4799', '087f821f-c56c-45e1-a38c-ab719a0a1cfb', '38', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_14a67267.jpg'),
('85538a7d-1a66-4858-87da-8beb015ca78a', '087f821f-c56c-45e1-a38c-ab719a0a1cfb', '39', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_14a67267.jpg'),
('57d13f54-9cce-43e7-be67-613055622876', '087f821f-c56c-45e1-a38c-ab719a0a1cfb', '40', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_14a67267.jpg'),
('2901fed4-fbbe-4167-9a93-6dedb6b01f35', '087f821f-c56c-45e1-a38c-ab719a0a1cfb', '41', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_14a67267.jpg'),
('8d7d2f4c-1db7-46e1-a4d0-c1266e0d4680', '087f821f-c56c-45e1-a38c-ab719a0a1cfb', '42', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_14a67267.jpg'),
('d4ae307c-e449-47ae-b971-e2bccdf05f94', '087f821f-c56c-45e1-a38c-ab719a0a1cfb', '43', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_14a67267.jpg'),
('20196f82-e7d7-46fa-aa1f-612b783716e6', '087f821f-c56c-45e1-a38c-ab719a0a1cfb', '44', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_14a67267.jpg'),
('6cda83fd-1fdb-499e-ab9f-f6042c674aaf', '087f821f-c56c-45e1-a38c-ab719a0a1cfb', '45', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_14a67267.jpg'),
('64d3efbf-b232-4ba1-bf7f-929d63715d1f', '4542e066-c977-4779-9153-2ced5b48da43', '38', 'CAM/ĐỎ', 10, 'src/data/images/products/main_222bdc1c.jpg'),
('b392f0fd-bd94-4644-9e49-855550c3571e', '4542e066-c977-4779-9153-2ced5b48da43', '39', 'CAM/ĐỎ', 10, 'src/data/images/products/main_222bdc1c.jpg'),
('d581b3a6-1b1f-4ed8-aaf1-ae319d30a5bd', '4542e066-c977-4779-9153-2ced5b48da43', '40', 'CAM/ĐỎ', 10, 'src/data/images/products/main_222bdc1c.jpg'),
('a7d1807f-2e81-466c-93d7-eeb88e9fff53', '4542e066-c977-4779-9153-2ced5b48da43', '41', 'CAM/ĐỎ', 10, 'src/data/images/products/main_222bdc1c.jpg'),
('cf062903-d7bf-487c-be03-0a5594963748', '4542e066-c977-4779-9153-2ced5b48da43', '42', 'CAM/ĐỎ', 10, 'src/data/images/products/main_222bdc1c.jpg'),
('a80305cd-fec2-4ed7-8ea5-2bc7b048ba08', '4542e066-c977-4779-9153-2ced5b48da43', '43', 'CAM/ĐỎ', 10, 'src/data/images/products/main_222bdc1c.jpg'),
('e9d1bab8-f02e-4daf-8bff-5281665414e4', '4542e066-c977-4779-9153-2ced5b48da43', '44', 'CAM/ĐỎ', 10, 'src/data/images/products/main_222bdc1c.jpg'),
('ff62c9dc-1d26-4d68-a062-61b8d47d5917', '4542e066-c977-4779-9153-2ced5b48da43', '45', 'CAM/ĐỎ', 10, 'src/data/images/products/main_222bdc1c.jpg'),
('9767fa5b-4c92-418b-89e8-95ff3f7cb7d6', '8cd318c2-4189-466c-9df6-b1d6f2c43311', '38', 'XÁM BẠC/NEON', 10, 'src/data/images/products/main_73966cc4.jpg'),
('31464218-6fa2-4159-ae4f-09462b33ec5a', '8cd318c2-4189-466c-9df6-b1d6f2c43311', '39', 'XÁM BẠC/NEON', 10, 'src/data/images/products/main_73966cc4.jpg'),
('975dcc9f-c394-4871-abde-2f7bebdb8f6f', '8cd318c2-4189-466c-9df6-b1d6f2c43311', '40', 'XÁM BẠC/NEON', 10, 'src/data/images/products/main_73966cc4.jpg'),
('34b47f71-31d9-4729-97b4-ab54455332ce', '8cd318c2-4189-466c-9df6-b1d6f2c43311', '41', 'XÁM BẠC/NEON', 10, 'src/data/images/products/main_73966cc4.jpg'),
('6ca28965-9378-48fa-a930-f9e131c29219', '8cd318c2-4189-466c-9df6-b1d6f2c43311', '42', 'XÁM BẠC/NEON', 10, 'src/data/images/products/main_73966cc4.jpg'),
('94fd14e7-7133-454f-86f3-ab492b5d9fcc', '8cd318c2-4189-466c-9df6-b1d6f2c43311', '43', 'XÁM BẠC/NEON', 10, 'src/data/images/products/main_73966cc4.jpg'),
('bc3f9634-4734-4739-a70e-cb3cf6ce7b58', '8cd318c2-4189-466c-9df6-b1d6f2c43311', '44', 'XÁM BẠC/NEON', 10, 'src/data/images/products/main_73966cc4.jpg'),
('a0c34976-a437-4ca3-bec4-bcb1a36265a9', '8cd318c2-4189-466c-9df6-b1d6f2c43311', '45', 'XÁM BẠC/NEON', 10, 'src/data/images/products/main_73966cc4.jpg'),
('85dbbb4b-a03b-472c-9915-e206245543ec', 'cab35650-fe62-4b04-8f39-11ed5a641566', '38', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_234a513e.jpg'),
('6868fd11-fb72-48e4-9606-dd1f79967522', 'cab35650-fe62-4b04-8f39-11ed5a641566', '39', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_234a513e.jpg'),
('51586ff1-9233-4524-b06e-a66b46d6a59d', 'cab35650-fe62-4b04-8f39-11ed5a641566', '40', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_234a513e.jpg'),
('ba157f70-d3ad-464a-897d-1dbea25549a6', 'cab35650-fe62-4b04-8f39-11ed5a641566', '41', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_234a513e.jpg'),
('88065790-2598-43fa-b7d6-06d49550da70', 'cab35650-fe62-4b04-8f39-11ed5a641566', '42', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_234a513e.jpg'),
('2be8f974-77a6-41cd-bc50-93e34649dc16', 'cab35650-fe62-4b04-8f39-11ed5a641566', '43', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_234a513e.jpg'),
('90a18021-fb35-4ca2-be12-8bfe29f088a3', 'cab35650-fe62-4b04-8f39-11ed5a641566', '44', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_234a513e.jpg'),
('f98ff6d1-e994-4b51-a453-bce633630a5c', 'cab35650-fe62-4b04-8f39-11ed5a641566', '45', 'TRẮNG/ĐỎ', 10, 'src/data/images/products/main_234a513e.jpg'),
('45458238-82b3-4237-8b7b-f4502980f61a', '9daf0b2d-5ec1-429f-9f5f-55356c05630f', '38', 'XANH/TRẮNG', 10, 'src/data/images/products/main_8f953c53.jpg'),
('968276a2-14ca-405a-8ca1-172749f81837', '9daf0b2d-5ec1-429f-9f5f-55356c05630f', '39', 'XANH/TRẮNG', 10, 'src/data/images/products/main_8f953c53.jpg'),
('b119ef7a-8ff6-40cc-ab40-138993afda75', '9daf0b2d-5ec1-429f-9f5f-55356c05630f', '40', 'XANH/TRẮNG', 10, 'src/data/images/products/main_8f953c53.jpg'),
('e91f8064-69aa-4674-811c-746be993c315', '9daf0b2d-5ec1-429f-9f5f-55356c05630f', '41', 'XANH/TRẮNG', 10, 'src/data/images/products/main_8f953c53.jpg'),
('fbe90cbb-dc1d-42c7-a231-2601e2751405', '9daf0b2d-5ec1-429f-9f5f-55356c05630f', '42', 'XANH/TRẮNG', 10, 'src/data/images/products/main_8f953c53.jpg'),
('546519b5-1568-4a24-99e9-ac506f08444f', '9daf0b2d-5ec1-429f-9f5f-55356c05630f', '43', 'XANH/TRẮNG', 10, 'src/data/images/products/main_8f953c53.jpg'),
('cf9c74d8-75c6-485e-aed8-205f8acb9a10', '9daf0b2d-5ec1-429f-9f5f-55356c05630f', '44', 'XANH/TRẮNG', 10, 'src/data/images/products/main_8f953c53.jpg'),
('7a647c61-f391-47e4-b789-6f3d0b397ac7', '9daf0b2d-5ec1-429f-9f5f-55356c05630f', '45', 'XANH/TRẮNG', 10, 'src/data/images/products/main_8f953c53.jpg'),
('53c95ea1-0c00-4944-8857-d02e1889fb7f', '1bc42fc9-e88b-4540-8597-afe8acb14348', '38', 'TRẮNG/VÀNG NEON', 10, 'src/data/images/products/main_b5a7ab1e.jpg'),
('0f46eb97-1b25-4638-87cf-da5396b9c972', '1bc42fc9-e88b-4540-8597-afe8acb14348', '39', 'TRẮNG/VÀNG NEON', 10, 'src/data/images/products/main_b5a7ab1e.jpg'),
('0f0512dc-3e6e-4b55-a330-4b5935561c52', '1bc42fc9-e88b-4540-8597-afe8acb14348', '40', 'TRẮNG/VÀNG NEON', 10, 'src/data/images/products/main_b5a7ab1e.jpg'),
('05a6b842-faad-4e4e-977c-b6594813d64a', '1bc42fc9-e88b-4540-8597-afe8acb14348', '41', 'TRẮNG/VÀNG NEON', 10, 'src/data/images/products/main_b5a7ab1e.jpg');

INSERT INTO product_variants (variant_id, product_id, size, color, stock, image_url) VALUES
('b445e1dd-324e-49e5-b32d-b14605958429', '1bc42fc9-e88b-4540-8597-afe8acb14348', '42', 'TRẮNG/VÀNG NEON', 10, 'src/data/images/products/main_b5a7ab1e.jpg'),
('35aa1d79-b8d3-48d3-be8a-fad16afc957e', '1bc42fc9-e88b-4540-8597-afe8acb14348', '43', 'TRẮNG/VÀNG NEON', 10, 'src/data/images/products/main_b5a7ab1e.jpg'),
('9805e398-f76f-43db-b444-ce6a3a9bf492', '1bc42fc9-e88b-4540-8597-afe8acb14348', '44', 'TRẮNG/VÀNG NEON', 10, 'src/data/images/products/main_b5a7ab1e.jpg'),
('2f2c1bf6-62a3-44ba-a1d5-420387454502', '1bc42fc9-e88b-4540-8597-afe8acb14348', '45', 'TRẮNG/VÀNG NEON', 10, 'src/data/images/products/main_b5a7ab1e.jpg'),
('d2402fc2-baf5-404e-aef4-07cd45f389ec', 'b4ca7611-807b-4723-9a85-e2ad2f18c55a', '38', 'ĐEN/VÀNG', 10, 'src/data/images/products/main_22145e44.jpg'),
('69bdd81e-f372-4f3b-9a58-83ef5265fa92', 'b4ca7611-807b-4723-9a85-e2ad2f18c55a', '39', 'ĐEN/VÀNG', 10, 'src/data/images/products/main_22145e44.jpg'),
('dda51066-cc78-47a8-ad91-129983861d5e', 'b4ca7611-807b-4723-9a85-e2ad2f18c55a', '40', 'ĐEN/VÀNG', 10, 'src/data/images/products/main_22145e44.jpg'),
('632317f5-8955-42b3-9e45-b73d4f9678c7', 'b4ca7611-807b-4723-9a85-e2ad2f18c55a', '41', 'ĐEN/VÀNG', 10, 'src/data/images/products/main_22145e44.jpg'),
('87057151-fe73-48c2-b387-4a66ee22f79c', 'b4ca7611-807b-4723-9a85-e2ad2f18c55a', '42', 'ĐEN/VÀNG', 10, 'src/data/images/products/main_22145e44.jpg'),
('9111e405-f9a7-4569-a0c7-81792ef76d6d', 'b4ca7611-807b-4723-9a85-e2ad2f18c55a', '43', 'ĐEN/VÀNG', 10, 'src/data/images/products/main_22145e44.jpg'),
('fb9a45d3-9ecf-49df-9b51-cc6f2552620e', 'b4ca7611-807b-4723-9a85-e2ad2f18c55a', '44', 'ĐEN/VÀNG', 10, 'src/data/images/products/main_22145e44.jpg'),
('a703026a-b439-45ee-ae46-c65cf3c66a22', 'b4ca7611-807b-4723-9a85-e2ad2f18c55a', '45', 'ĐEN/VÀNG', 10, 'src/data/images/products/main_22145e44.jpg'),
('97ff53ff-aa36-4a98-862b-530a93342aab', '428c5aec-f7fc-45e6-af75-e69441b065cd', '38', 'HỒNG/ĐEN', 10, 'src/data/images/products/main_13eac9a9.jpg'),
('9a540b35-5e47-409e-9311-a8d4cba95116', '428c5aec-f7fc-45e6-af75-e69441b065cd', '39', 'HỒNG/ĐEN', 10, 'src/data/images/products/main_13eac9a9.jpg'),
('d0b9fbd1-3b6f-4812-9d4e-3f115a664946', '428c5aec-f7fc-45e6-af75-e69441b065cd', '40', 'HỒNG/ĐEN', 10, 'src/data/images/products/main_13eac9a9.jpg'),
('af574eff-1ea1-4204-bcdb-5dff103c71d8', '428c5aec-f7fc-45e6-af75-e69441b065cd', '41', 'HỒNG/ĐEN', 10, 'src/data/images/products/main_13eac9a9.jpg'),
('68ec58d4-bb18-4f10-9472-cc248ac803bb', '428c5aec-f7fc-45e6-af75-e69441b065cd', '42', 'HỒNG/ĐEN', 10, 'src/data/images/products/main_13eac9a9.jpg'),
('c5cfe5c2-1461-4589-8c13-097ca5184369', '428c5aec-f7fc-45e6-af75-e69441b065cd', '43', 'HỒNG/ĐEN', 10, 'src/data/images/products/main_13eac9a9.jpg'),
('7d7b96f1-4366-4972-aa8f-b95f5a62c7b5', '428c5aec-f7fc-45e6-af75-e69441b065cd', '44', 'HỒNG/ĐEN', 10, 'src/data/images/products/main_13eac9a9.jpg'),
('442b1b0c-22bf-4eab-bbad-29c1267a0093', '428c5aec-f7fc-45e6-af75-e69441b065cd', '45', 'HỒNG/ĐEN', 10, 'src/data/images/products/main_13eac9a9.jpg'),
('605bb182-f323-445c-a70c-9af6efea80ce', 'bc0f970b-ecbc-4816-a476-f205ed319af1', '38', 'HỒNG/ĐEN', 10, 'src/data/images/products/main_b12e0d69.jpg'),
('51b0d3dd-6116-4db9-936f-4172e6f3711c', 'bc0f970b-ecbc-4816-a476-f205ed319af1', '39', 'HỒNG/ĐEN', 10, 'src/data/images/products/main_b12e0d69.jpg'),
('8b3636f6-7a3e-4bc2-b181-c3d4654b6688', 'bc0f970b-ecbc-4816-a476-f205ed319af1', '40', 'HỒNG/ĐEN', 10, 'src/data/images/products/main_b12e0d69.jpg'),
('4622fae0-d319-4475-bfce-9cc859ceb4e2', 'bc0f970b-ecbc-4816-a476-f205ed319af1', '41', 'HỒNG/ĐEN', 10, 'src/data/images/products/main_b12e0d69.jpg'),
('bb76fb63-aaf6-4eb2-98db-29ee8a379258', 'bc0f970b-ecbc-4816-a476-f205ed319af1', '42', 'HỒNG/ĐEN', 10, 'src/data/images/products/main_b12e0d69.jpg'),
('c3ff1643-8693-4238-af8a-aef440bdb213', 'bc0f970b-ecbc-4816-a476-f205ed319af1', '43', 'HỒNG/ĐEN', 10, 'src/data/images/products/main_b12e0d69.jpg'),
('36aaaf09-6d17-4f17-8626-578a118a0098', 'bc0f970b-ecbc-4816-a476-f205ed319af1', '44', 'HỒNG/ĐEN', 10, 'src/data/images/products/main_b12e0d69.jpg'),
('a0eb2bff-47a0-45fa-bc49-0c6568c48583', 'bc0f970b-ecbc-4816-a476-f205ed319af1', '45', 'HỒNG/ĐEN', 10, 'src/data/images/products/main_b12e0d69.jpg'),
('8100595f-74f1-4b2b-bd4a-d6c625be48d1', 'ae19a2e1-1c76-4cc3-8883-5462748f347a', '38', 'VÀNG NEON/ĐEN', 10, 'src/data/images/products/main_31aa37f2.jpg'),
('b3579360-dd63-472c-92b6-68bb2079b7a9', 'ae19a2e1-1c76-4cc3-8883-5462748f347a', '39', 'VÀNG NEON/ĐEN', 10, 'src/data/images/products/main_31aa37f2.jpg'),
('0de833e7-a179-436a-a155-0b6f3d1e04dd', 'ae19a2e1-1c76-4cc3-8883-5462748f347a', '40', 'VÀNG NEON/ĐEN', 10, 'src/data/images/products/main_31aa37f2.jpg'),
('222444c7-add7-4fe9-b03a-6fac134c56cb', 'ae19a2e1-1c76-4cc3-8883-5462748f347a', '41', 'VÀNG NEON/ĐEN', 10, 'src/data/images/products/main_31aa37f2.jpg'),
('3bf8a529-f1f6-4d46-8600-ac4fc15afbd9', 'ae19a2e1-1c76-4cc3-8883-5462748f347a', '42', 'VÀNG NEON/ĐEN', 10, 'src/data/images/products/main_31aa37f2.jpg'),
('837b08a2-311b-4040-b978-788914eded12', 'ae19a2e1-1c76-4cc3-8883-5462748f347a', '43', 'VÀNG NEON/ĐEN', 10, 'src/data/images/products/main_31aa37f2.jpg'),
('01281a6e-f3ff-41da-9035-e326a021513b', 'ae19a2e1-1c76-4cc3-8883-5462748f347a', '44', 'VÀNG NEON/ĐEN', 10, 'src/data/images/products/main_31aa37f2.jpg'),
('aaa073cf-ba6c-4421-9e7f-09e2e3a30cad', 'ae19a2e1-1c76-4cc3-8883-5462748f347a', '45', 'VÀNG NEON/ĐEN', 10, 'src/data/images/products/main_31aa37f2.jpg'),
('e2e8f883-e41d-4c5e-87a8-780f8bc67b2f', '73d9d6b1-f620-4dcf-b441-37640d310191', '38', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_80ef71f1.jpg'),
('b59672af-6304-46ca-81b4-4810e6bfa373', '73d9d6b1-f620-4dcf-b441-37640d310191', '39', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_80ef71f1.jpg'),
('7e94575c-905d-4030-bfe3-503d846794db', '73d9d6b1-f620-4dcf-b441-37640d310191', '40', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_80ef71f1.jpg'),
('059f5ee7-38ca-4075-b6f8-dda2b1347577', '73d9d6b1-f620-4dcf-b441-37640d310191', '41', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_80ef71f1.jpg'),
('3d11fc6c-7626-48f0-9f47-a8a56567f557', '73d9d6b1-f620-4dcf-b441-37640d310191', '42', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_80ef71f1.jpg'),
('801933f4-095e-49fd-817d-46d8f4f542ed', '73d9d6b1-f620-4dcf-b441-37640d310191', '43', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_80ef71f1.jpg'),
('f408d7c6-a8c0-47f2-8fb6-220ca0c6340b', '73d9d6b1-f620-4dcf-b441-37640d310191', '44', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_80ef71f1.jpg'),
('5e03f352-d068-47b8-a540-254949b8bc2d', '73d9d6b1-f620-4dcf-b441-37640d310191', '45', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_80ef71f1.jpg'),
('2d1691fb-b568-4ac9-a307-baafbc7846d0', '7c34c988-e9f7-4671-9384-44a191050e25', '38', 'TRẮNG/XANH LÁ MẠ', 10, 'src/data/images/products/main_6869e792.jpg'),
('3bba3f2a-2635-437f-ab0d-39bd34804aab', '7c34c988-e9f7-4671-9384-44a191050e25', '39', 'TRẮNG/XANH LÁ MẠ', 10, 'src/data/images/products/main_6869e792.jpg'),
('89d6de5f-ffb2-47af-8ae4-07e632843976', '7c34c988-e9f7-4671-9384-44a191050e25', '40', 'TRẮNG/XANH LÁ MẠ', 10, 'src/data/images/products/main_6869e792.jpg'),
('15522072-edc4-4fe2-bfe8-03f60d0148ab', '7c34c988-e9f7-4671-9384-44a191050e25', '41', 'TRẮNG/XANH LÁ MẠ', 10, 'src/data/images/products/main_6869e792.jpg'),
('dc5bbdfa-42d0-4241-af92-7157fb3bc57f', '7c34c988-e9f7-4671-9384-44a191050e25', '42', 'TRẮNG/XANH LÁ MẠ', 10, 'src/data/images/products/main_6869e792.jpg'),
('0dac300d-8b61-4b9e-9827-88dbfbc43898', '7c34c988-e9f7-4671-9384-44a191050e25', '43', 'TRẮNG/XANH LÁ MẠ', 10, 'src/data/images/products/main_6869e792.jpg'),
('184082d5-406c-4435-96f7-4f96ad4b50de', '7c34c988-e9f7-4671-9384-44a191050e25', '44', 'TRẮNG/XANH LÁ MẠ', 10, 'src/data/images/products/main_6869e792.jpg'),
('84a2ab5c-23a4-4fdc-969c-ad0e850f2ce4', '7c34c988-e9f7-4671-9384-44a191050e25', '45', 'TRẮNG/XANH LÁ MẠ', 10, 'src/data/images/products/main_6869e792.jpg'),
('75413329-bb5d-4b14-b51e-2906182f528c', '7c48c359-2006-4b57-8220-9afd28f471fe', '38', 'ĐỎ/CAM', 10, 'src/data/images/products/main_11f08999.jpg'),
('f42b7f4a-9d2a-43ff-ac36-1e4ceb7c8a55', '7c48c359-2006-4b57-8220-9afd28f471fe', '39', 'ĐỎ/CAM', 10, 'src/data/images/products/main_11f08999.jpg'),
('2b062fd2-dfe6-411f-8b8b-a3cc99884d1a', '7c48c359-2006-4b57-8220-9afd28f471fe', '40', 'ĐỎ/CAM', 10, 'src/data/images/products/main_11f08999.jpg'),
('2477f163-28b9-4488-aac3-719d9354fa89', '7c48c359-2006-4b57-8220-9afd28f471fe', '41', 'ĐỎ/CAM', 10, 'src/data/images/products/main_11f08999.jpg'),
('fc75aad2-05df-4622-a822-1eb34bf641f6', '7c48c359-2006-4b57-8220-9afd28f471fe', '42', 'ĐỎ/CAM', 10, 'src/data/images/products/main_11f08999.jpg'),
('505bd3f2-c80d-4f6e-a3ff-fd5e7186beec', '7c48c359-2006-4b57-8220-9afd28f471fe', '43', 'ĐỎ/CAM', 10, 'src/data/images/products/main_11f08999.jpg'),
('43c07c2f-fdd6-486f-b8eb-1ac44da70a8c', '7c48c359-2006-4b57-8220-9afd28f471fe', '44', 'ĐỎ/CAM', 10, 'src/data/images/products/main_11f08999.jpg'),
('7fb97fee-b7b1-40ce-a517-f572e29ee6bc', '7c48c359-2006-4b57-8220-9afd28f471fe', '45', 'ĐỎ/CAM', 10, 'src/data/images/products/main_11f08999.jpg'),
('f446aadd-fedf-49e6-aa98-6503faa88149', '064d0126-cdd3-4499-8cbe-8307a1a5395c', '38', 'ĐỎ/CAM', 10, 'src/data/images/products/main_875e3064.jpg'),
('2cfc51c9-9f0b-4598-8b1c-be4eb44bd1fd', '064d0126-cdd3-4499-8cbe-8307a1a5395c', '39', 'ĐỎ/CAM', 10, 'src/data/images/products/main_875e3064.jpg'),
('d4943050-73ef-4f88-9fe3-5f391a145d6e', '064d0126-cdd3-4499-8cbe-8307a1a5395c', '40', 'ĐỎ/CAM', 10, 'src/data/images/products/main_875e3064.jpg'),
('91505abe-3aef-4029-9964-9bbae6012b54', '064d0126-cdd3-4499-8cbe-8307a1a5395c', '41', 'ĐỎ/CAM', 10, 'src/data/images/products/main_875e3064.jpg'),
('6e111384-9862-4f62-aefa-8fbed5b61826', '064d0126-cdd3-4499-8cbe-8307a1a5395c', '42', 'ĐỎ/CAM', 10, 'src/data/images/products/main_875e3064.jpg'),
('539ea653-c700-4d92-8936-758fea287bad', '064d0126-cdd3-4499-8cbe-8307a1a5395c', '43', 'ĐỎ/CAM', 10, 'src/data/images/products/main_875e3064.jpg'),
('1d208b48-e794-4532-b8b5-e41d79c79a72', '064d0126-cdd3-4499-8cbe-8307a1a5395c', '44', 'ĐỎ/CAM', 10, 'src/data/images/products/main_875e3064.jpg'),
('003af710-730a-471b-aa5b-3da6406d4a9d', '064d0126-cdd3-4499-8cbe-8307a1a5395c', '45', 'ĐỎ/CAM', 10, 'src/data/images/products/main_875e3064.jpg'),
('b46f4997-e9ac-4fae-ac99-fa187e5cbb7e', '947ff0dd-d4c9-4f39-b6ed-9242f6a24b15', '38', 'CAM/TÍM', 10, 'src/data/images/products/main_dd9548e1.jpg'),
('fbd9b378-6a88-4145-8b4e-a54b6161e36b', '947ff0dd-d4c9-4f39-b6ed-9242f6a24b15', '39', 'CAM/TÍM', 10, 'src/data/images/products/main_dd9548e1.jpg'),
('8daee95c-60a3-47f5-b823-2f0ce4bd05c3', '947ff0dd-d4c9-4f39-b6ed-9242f6a24b15', '40', 'CAM/TÍM', 10, 'src/data/images/products/main_dd9548e1.jpg'),
('c7171bb1-a08d-44f7-a5f6-acb26599348a', '947ff0dd-d4c9-4f39-b6ed-9242f6a24b15', '41', 'CAM/TÍM', 10, 'src/data/images/products/main_dd9548e1.jpg'),
('c8e4fd7c-b90c-4561-b9c0-f46a2d3d0fad', '947ff0dd-d4c9-4f39-b6ed-9242f6a24b15', '42', 'CAM/TÍM', 10, 'src/data/images/products/main_dd9548e1.jpg'),
('385a3642-1de4-4223-88c5-605712cfd427', '947ff0dd-d4c9-4f39-b6ed-9242f6a24b15', '43', 'CAM/TÍM', 10, 'src/data/images/products/main_dd9548e1.jpg'),
('d4e59af5-ba65-4903-b2c1-faf174ee69fc', '947ff0dd-d4c9-4f39-b6ed-9242f6a24b15', '44', 'CAM/TÍM', 10, 'src/data/images/products/main_dd9548e1.jpg'),
('ed113087-e3b7-455e-baa8-d91e5429693f', '947ff0dd-d4c9-4f39-b6ed-9242f6a24b15', '45', 'CAM/TÍM', 10, 'src/data/images/products/main_dd9548e1.jpg'),
('2c71798c-ea33-4c5b-ba47-10e7c225c7b7', 'c9d64c9e-c983-4fa0-928e-66798c12c798', '38', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_0f5390f8.jpg'),
('57e93c4c-a126-4d45-9645-0674b5b6f91f', 'c9d64c9e-c983-4fa0-928e-66798c12c798', '39', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_0f5390f8.jpg'),
('4447439b-24b4-4227-a198-a53323292425', 'c9d64c9e-c983-4fa0-928e-66798c12c798', '40', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_0f5390f8.jpg'),
('a26c62bc-5619-4c67-ae5d-d17b0e5c3541', 'c9d64c9e-c983-4fa0-928e-66798c12c798', '41', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_0f5390f8.jpg'),
('8961e95e-d8ea-4e9b-9c77-8887af73430e', 'c9d64c9e-c983-4fa0-928e-66798c12c798', '42', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_0f5390f8.jpg'),
('f6461d3b-cc97-4e89-ad0e-d9ff9b3e70c0', 'c9d64c9e-c983-4fa0-928e-66798c12c798', '43', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_0f5390f8.jpg'),
('74f01ea1-cd5e-4221-8795-fdc3e669be52', 'c9d64c9e-c983-4fa0-928e-66798c12c798', '44', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_0f5390f8.jpg'),
('9412647f-96b0-460e-81e7-91e3afe45104', 'c9d64c9e-c983-4fa0-928e-66798c12c798', '45', 'TRẮNG/ĐEN', 10, 'src/data/images/products/main_0f5390f8.jpg'),
('16ec5397-e1f5-4490-ac67-1fc92423cdb8', '8a2c13a2-ddad-48d3-a3c7-8242bf9b583b', '38', 'XANH LƠ', 10, 'src/data/images/products/main_ac0fb5f7.jpg'),
('ce930a2e-a04a-4240-b8da-7040ba318543', '8a2c13a2-ddad-48d3-a3c7-8242bf9b583b', '39', 'XANH LƠ', 10, 'src/data/images/products/main_ac0fb5f7.jpg'),
('cb2d1afe-75e5-420b-b953-cd7718c7197e', '8a2c13a2-ddad-48d3-a3c7-8242bf9b583b', '40', 'XANH LƠ', 10, 'src/data/images/products/main_ac0fb5f7.jpg'),
('f5fd366e-5dc3-4497-920c-fc935d0dff4d', '8a2c13a2-ddad-48d3-a3c7-8242bf9b583b', '41', 'XANH LƠ', 10, 'src/data/images/products/main_ac0fb5f7.jpg'),
('58799675-04e6-4b28-a80e-f514423821fe', '8a2c13a2-ddad-48d3-a3c7-8242bf9b583b', '42', 'XANH LƠ', 10, 'src/data/images/products/main_ac0fb5f7.jpg'),
('9633dc39-62c5-4533-a719-8710ea37e977', '8a2c13a2-ddad-48d3-a3c7-8242bf9b583b', '43', 'XANH LƠ', 10, 'src/data/images/products/main_ac0fb5f7.jpg'),
('9463ee1d-8abc-4d01-bdab-4ae02e4eefc7', '8a2c13a2-ddad-48d3-a3c7-8242bf9b583b', '44', 'XANH LƠ', 10, 'src/data/images/products/main_ac0fb5f7.jpg'),
('3bbd28f1-8398-4154-9442-eb9683226b5d', '8a2c13a2-ddad-48d3-a3c7-8242bf9b583b', '45', 'XANH LƠ', 10, 'src/data/images/products/main_ac0fb5f7.jpg'),
('efc5ecdb-3e45-4a50-b470-e51bf0407f83', '525b11c8-5b0b-420d-acea-0a560a6fc411', '38', 'XANH', 10, 'src/data/images/products/main_87aee48b.jpg'),
('45b89366-9b33-48b1-b3f0-2c404facf9ba', '525b11c8-5b0b-420d-acea-0a560a6fc411', '39', 'XANH', 10, 'src/data/images/products/main_87aee48b.jpg'),
('107cf412-572c-4645-9027-a3bce94dc445', '525b11c8-5b0b-420d-acea-0a560a6fc411', '40', 'XANH', 10, 'src/data/images/products/main_87aee48b.jpg'),
('f413c389-570a-4a29-b2ca-145bdd07e7b7', '525b11c8-5b0b-420d-acea-0a560a6fc411', '41', 'XANH', 10, 'src/data/images/products/main_87aee48b.jpg'),
('bd1ff258-2f26-4b93-9df6-20ad97782f6f', '525b11c8-5b0b-420d-acea-0a560a6fc411', '42', 'XANH', 10, 'src/data/images/products/main_87aee48b.jpg'),
('d15eda4a-0abb-4edd-b1ce-7c1131ca2c19', '525b11c8-5b0b-420d-acea-0a560a6fc411', '43', 'XANH', 10, 'src/data/images/products/main_87aee48b.jpg'),
('a044f70b-7871-4a4a-b74d-b39dbce4d416', '525b11c8-5b0b-420d-acea-0a560a6fc411', '44', 'XANH', 10, 'src/data/images/products/main_87aee48b.jpg'),
('dd4765ae-70a5-4077-a39e-bb1ec318bc66', '525b11c8-5b0b-420d-acea-0a560a6fc411', '45', 'XANH', 10, 'src/data/images/products/main_87aee48b.jpg');

INSERT INTO product_variants (variant_id, product_id, size, color, stock, image_url) VALUES
('2167327b-1007-4c15-8b26-5f17b15f1ebe', '2bd61f88-05bc-4dad-b7e5-82c30e511263', '38', 'CAM/ĐỎ', 10, 'src/data/images/products/main_9694a9c2.jpg'),
('d6650e5c-7245-480d-b1d1-b6af843c4722', '2bd61f88-05bc-4dad-b7e5-82c30e511263', '39', 'CAM/ĐỎ', 10, 'src/data/images/products/main_9694a9c2.jpg'),
('4dff294b-7614-46fd-b0c3-ff4d4d60079f', '2bd61f88-05bc-4dad-b7e5-82c30e511263', '40', 'CAM/ĐỎ', 10, 'src/data/images/products/main_9694a9c2.jpg'),
('948d687e-e0f3-426f-9b43-ec2b0aa09f98', '2bd61f88-05bc-4dad-b7e5-82c30e511263', '41', 'CAM/ĐỎ', 10, 'src/data/images/products/main_9694a9c2.jpg'),
('1481324a-a3ac-41ba-a8fc-ec7bda6a96af', '2bd61f88-05bc-4dad-b7e5-82c30e511263', '42', 'CAM/ĐỎ', 10, 'src/data/images/products/main_9694a9c2.jpg'),
('ace87426-1383-483e-b7e7-a99ce5d26ab0', '2bd61f88-05bc-4dad-b7e5-82c30e511263', '43', 'CAM/ĐỎ', 10, 'src/data/images/products/main_9694a9c2.jpg'),
('78c78943-626c-4963-a911-829bfe442068', '2bd61f88-05bc-4dad-b7e5-82c30e511263', '44', 'CAM/ĐỎ', 10, 'src/data/images/products/main_9694a9c2.jpg'),
('c973d66a-007c-4450-a59f-f2f6add12f54', '2bd61f88-05bc-4dad-b7e5-82c30e511263', '45', 'CAM/ĐỎ', 10, 'src/data/images/products/main_9694a9c2.jpg'),
('b828162a-fd86-4f68-adbd-76a4d59ae71d', '6b282303-614a-4a91-9587-90dc852f5f27', '38', 'ĐEN', 10, 'src/data/images/products/main_753e3aa0.jpg'),
('9cac7417-a784-4215-b8d8-5098257b40d8', '6b282303-614a-4a91-9587-90dc852f5f27', '39', 'ĐEN', 10, 'src/data/images/products/main_753e3aa0.jpg'),
('5571d33d-ecce-484f-b629-e58682255f88', '6b282303-614a-4a91-9587-90dc852f5f27', '40', 'ĐEN', 10, 'src/data/images/products/main_753e3aa0.jpg'),
('11f47943-edc2-4ab8-92aa-d17a4029e800', '6b282303-614a-4a91-9587-90dc852f5f27', '41', 'ĐEN', 10, 'src/data/images/products/main_753e3aa0.jpg'),
('63b16741-2c30-472a-a1af-040d7e519f48', '6b282303-614a-4a91-9587-90dc852f5f27', '42', 'ĐEN', 10, 'src/data/images/products/main_753e3aa0.jpg'),
('6a1fe9f7-b529-4bbe-be26-0eb243c8c411', '6b282303-614a-4a91-9587-90dc852f5f27', '43', 'ĐEN', 10, 'src/data/images/products/main_753e3aa0.jpg'),
('6ab2e7e0-4457-4593-b3c1-bb27763e728a', '6b282303-614a-4a91-9587-90dc852f5f27', '44', 'ĐEN', 10, 'src/data/images/products/main_753e3aa0.jpg'),
('759814ea-0a8e-4d95-8729-641a1d49cf6e', '6b282303-614a-4a91-9587-90dc852f5f27', '45', 'ĐEN', 10, 'src/data/images/products/main_753e3aa0.jpg'),
('9039afdc-378a-4d11-b534-a75c55d1fb93', 'fc4ef04b-fd72-43e3-9c90-04f86a8ee9d5', '38', 'VÀNG CHANH/ ĐEN', 10, 'src/data/images/products/main_73ca1793.jpg'),
('307e240d-0559-49f9-800c-3fc4bde13e9d', 'fc4ef04b-fd72-43e3-9c90-04f86a8ee9d5', '39', 'VÀNG CHANH/ ĐEN', 10, 'src/data/images/products/main_73ca1793.jpg'),
('19ca5853-fedb-4f55-ad91-24b16b215d6c', 'fc4ef04b-fd72-43e3-9c90-04f86a8ee9d5', '40', 'VÀNG CHANH/ ĐEN', 10, 'src/data/images/products/main_73ca1793.jpg'),
('b50efdb2-c755-443f-9f32-bf4d1961ceba', 'fc4ef04b-fd72-43e3-9c90-04f86a8ee9d5', '41', 'VÀNG CHANH/ ĐEN', 10, 'src/data/images/products/main_73ca1793.jpg'),
('eaca4071-7255-4014-ab67-7608e3590733', 'fc4ef04b-fd72-43e3-9c90-04f86a8ee9d5', '42', 'VÀNG CHANH/ ĐEN', 10, 'src/data/images/products/main_73ca1793.jpg'),
('f299ca6d-7c55-49a0-9ee4-00ec52c7636f', 'fc4ef04b-fd72-43e3-9c90-04f86a8ee9d5', '43', 'VÀNG CHANH/ ĐEN', 10, 'src/data/images/products/main_73ca1793.jpg'),
('b42fecfa-4d53-44d8-9bac-f1f4de42aa04', 'fc4ef04b-fd72-43e3-9c90-04f86a8ee9d5', '44', 'VÀNG CHANH/ ĐEN', 10, 'src/data/images/products/main_73ca1793.jpg'),
('7a9157cd-a25b-4445-a4f2-f9d6de9743f5', 'fc4ef04b-fd72-43e3-9c90-04f86a8ee9d5', '45', 'VÀNG CHANH/ ĐEN', 10, 'src/data/images/products/main_73ca1793.jpg'),
('bf7266e3-05c1-4ac6-ade9-fd30caee0e11', '2ad46ecb-e5b7-4025-be99-78e8a888ee2c', '38', 'XANH/TRẮNG', 10, 'src/data/images/products/main_9c94d184.jpg'),
('6bff660c-3058-45af-99a8-9a4282bcdea6', '2ad46ecb-e5b7-4025-be99-78e8a888ee2c', '39', 'XANH/TRẮNG', 10, 'src/data/images/products/main_9c94d184.jpg'),
('b543e11a-0d55-469e-805a-d0a71844fec3', '2ad46ecb-e5b7-4025-be99-78e8a888ee2c', '40', 'XANH/TRẮNG', 10, 'src/data/images/products/main_9c94d184.jpg'),
('14f2e371-b7fa-46e2-a03c-f16a97ebee41', '2ad46ecb-e5b7-4025-be99-78e8a888ee2c', '41', 'XANH/TRẮNG', 10, 'src/data/images/products/main_9c94d184.jpg'),
('98a37d53-ef2a-40c8-a1d7-f14fa7a5c5c0', '2ad46ecb-e5b7-4025-be99-78e8a888ee2c', '42', 'XANH/TRẮNG', 10, 'src/data/images/products/main_9c94d184.jpg'),
('d4c081c9-cbf3-41dc-8cc5-b9a0ef5f0d29', '2ad46ecb-e5b7-4025-be99-78e8a888ee2c', '43', 'XANH/TRẮNG', 10, 'src/data/images/products/main_9c94d184.jpg'),
('66aff68f-55f0-4283-a436-bf78c27eb1c7', '2ad46ecb-e5b7-4025-be99-78e8a888ee2c', '44', 'XANH/TRẮNG', 10, 'src/data/images/products/main_9c94d184.jpg'),
('800f26d8-329b-4a84-8d6e-f09536be514d', '2ad46ecb-e5b7-4025-be99-78e8a888ee2c', '45', 'XANH/TRẮNG', 10, 'src/data/images/products/main_9c94d184.jpg'),
('a06e1caa-9cb6-4ab3-9da5-f8c689777d19', '3bc4d9eb-663c-4d2d-9002-f4e8316eb79e', '38', 'ĐEN/HỒNG', 10, 'src/data/images/products/main_c38ac901.jpg'),
('230665fb-44e1-4174-9f83-aa3c399b21e5', '3bc4d9eb-663c-4d2d-9002-f4e8316eb79e', '39', 'ĐEN/HỒNG', 10, 'src/data/images/products/main_c38ac901.jpg'),
('43d0860d-22d7-49db-bd60-32de19a881d6', '3bc4d9eb-663c-4d2d-9002-f4e8316eb79e', '40', 'ĐEN/HỒNG', 10, 'src/data/images/products/main_c38ac901.jpg'),
('10aaeea4-c21b-4b4c-b932-3414428b5cc7', '3bc4d9eb-663c-4d2d-9002-f4e8316eb79e', '41', 'ĐEN/HỒNG', 10, 'src/data/images/products/main_c38ac901.jpg'),
('e5bde289-7ed3-4e7b-86b5-9a2d60f7b8a2', '3bc4d9eb-663c-4d2d-9002-f4e8316eb79e', '42', 'ĐEN/HỒNG', 10, 'src/data/images/products/main_c38ac901.jpg'),
('c6106e99-a1f9-4766-914c-21123ac06c9a', '3bc4d9eb-663c-4d2d-9002-f4e8316eb79e', '43', 'ĐEN/HỒNG', 10, 'src/data/images/products/main_c38ac901.jpg'),
('03f1fe7d-3862-4555-8b23-ceee6aa93586', '3bc4d9eb-663c-4d2d-9002-f4e8316eb79e', '44', 'ĐEN/HỒNG', 10, 'src/data/images/products/main_c38ac901.jpg'),
('b558e5ac-14a8-4689-abd8-5936980a259f', '3bc4d9eb-663c-4d2d-9002-f4e8316eb79e', '45', 'ĐEN/HỒNG', 10, 'src/data/images/products/main_c38ac901.jpg'),
('eb079d88-4af8-47fc-864e-396972148fec', '219d958d-28bf-427d-9585-154b400379e6', '38', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_c3cddfb9.jpg'),
('0c84e090-ae07-4d9f-99a9-f10cc85696d0', '219d958d-28bf-427d-9585-154b400379e6', '39', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_c3cddfb9.jpg'),
('18e370d3-008b-444e-ac15-a57476d4a804', '219d958d-28bf-427d-9585-154b400379e6', '40', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_c3cddfb9.jpg'),
('17a532c9-c364-4646-82f4-d5d151ae5568', '219d958d-28bf-427d-9585-154b400379e6', '41', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_c3cddfb9.jpg'),
('4ab1e207-d21f-41c8-b3eb-552570419fde', '219d958d-28bf-427d-9585-154b400379e6', '42', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_c3cddfb9.jpg'),
('5871d5fd-3346-47d8-8bb7-882b78400168', '219d958d-28bf-427d-9585-154b400379e6', '43', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_c3cddfb9.jpg'),
('2ef7e3cf-9c3f-4ab2-86ce-3c6b706a78c2', '219d958d-28bf-427d-9585-154b400379e6', '44', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_c3cddfb9.jpg'),
('cbda5992-1154-4c34-a790-20a5b22e8a1d', '219d958d-28bf-427d-9585-154b400379e6', '45', 'TRẮNG/XANH LÁ', 10, 'src/data/images/products/main_c3cddfb9.jpg'),
('ea7dbc13-3dbb-4d4d-8a45-8c88272f72f9', 'cabfd12e-05f2-47a8-ad74-bd7d542f0e34', '38', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_1d9eeb05.jpg'),
('73c09eba-3194-42ac-8002-19150d094ec5', 'cabfd12e-05f2-47a8-ad74-bd7d542f0e34', '39', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_1d9eeb05.jpg'),
('d8843a9a-2fe0-4b37-9caf-cd97e5bd4541', 'cabfd12e-05f2-47a8-ad74-bd7d542f0e34', '40', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_1d9eeb05.jpg'),
('46fe3867-6dfa-4677-82a7-e1b3321e8c20', 'cabfd12e-05f2-47a8-ad74-bd7d542f0e34', '41', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_1d9eeb05.jpg'),
('d20c5d30-ab22-4a75-b053-366fb36d2e4d', 'cabfd12e-05f2-47a8-ad74-bd7d542f0e34', '42', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_1d9eeb05.jpg'),
('85e66d82-613b-4ee2-830e-01bc526ccbf6', 'cabfd12e-05f2-47a8-ad74-bd7d542f0e34', '43', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_1d9eeb05.jpg'),
('016efc91-12ce-4ca7-a3fa-f440266c0af4', 'cabfd12e-05f2-47a8-ad74-bd7d542f0e34', '44', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_1d9eeb05.jpg'),
('0f50c3d9-6ce9-4d7e-b9e0-919bb71735d2', 'cabfd12e-05f2-47a8-ad74-bd7d542f0e34', '45', 'VÀNG CHANH/ĐEN', 10, 'src/data/images/products/main_1d9eeb05.jpg'),
('123efa77-84a2-4757-a9ec-2e7008a69abc', '2e445537-b17c-448a-9cf6-1a6082c28315', '38', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_7e7f1726.jpg'),
('fec4a14f-0c3b-46f7-89d4-1294a2f84233', '2e445537-b17c-448a-9cf6-1a6082c28315', '39', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_7e7f1726.jpg'),
('fbe2a2c4-1c33-461e-b38b-17fa7cc6e42f', '2e445537-b17c-448a-9cf6-1a6082c28315', '40', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_7e7f1726.jpg'),
('9f1e1c1d-6493-45fc-ab19-8bd27aeca745', '2e445537-b17c-448a-9cf6-1a6082c28315', '41', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_7e7f1726.jpg'),
('a8be525b-4356-4b72-866e-cc0ae388fa1e', '2e445537-b17c-448a-9cf6-1a6082c28315', '42', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_7e7f1726.jpg'),
('915b8370-72c5-4520-8177-ddd5170f7f2c', '2e445537-b17c-448a-9cf6-1a6082c28315', '43', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_7e7f1726.jpg'),
('e5c4b4ee-6d2d-4ac0-ae76-e3e9921f524b', '2e445537-b17c-448a-9cf6-1a6082c28315', '44', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_7e7f1726.jpg'),
('8754cc6f-8927-4e38-b49c-f73328d66715', '2e445537-b17c-448a-9cf6-1a6082c28315', '45', 'XÁM/XANH CHUỐI', 10, 'src/data/images/products/main_7e7f1726.jpg'),
('68762f26-32c5-4a6a-b159-b1816e6e94d3', 'baf1390a-8e20-4b4a-acc8-1019c7de7d14', '38', 'XÁM/TÍM', 10, 'src/data/images/products/main_3df6d7a8.jpg'),
('d6483637-08c0-4e04-bf4d-f4a88d122087', 'baf1390a-8e20-4b4a-acc8-1019c7de7d14', '39', 'XÁM/TÍM', 10, 'src/data/images/products/main_3df6d7a8.jpg'),
('be61c21d-e852-4f42-ba97-d8c517c4108a', 'baf1390a-8e20-4b4a-acc8-1019c7de7d14', '40', 'XÁM/TÍM', 10, 'src/data/images/products/main_3df6d7a8.jpg'),
('aa45f39f-dbb5-48ce-bfaf-988d3e6523f3', 'baf1390a-8e20-4b4a-acc8-1019c7de7d14', '41', 'XÁM/TÍM', 10, 'src/data/images/products/main_3df6d7a8.jpg'),
('376b680a-f3fc-425c-a7db-267bf313c8bc', 'baf1390a-8e20-4b4a-acc8-1019c7de7d14', '42', 'XÁM/TÍM', 10, 'src/data/images/products/main_3df6d7a8.jpg'),
('4c9ac045-d184-4cdd-8337-14cf9936c03c', 'baf1390a-8e20-4b4a-acc8-1019c7de7d14', '43', 'XÁM/TÍM', 10, 'src/data/images/products/main_3df6d7a8.jpg'),
('02a3ca63-61a9-4a24-8ce1-f1bd2ac6ed31', 'baf1390a-8e20-4b4a-acc8-1019c7de7d14', '44', 'XÁM/TÍM', 10, 'src/data/images/products/main_3df6d7a8.jpg'),
('cfbccdf2-4e5d-4e2b-827c-fac358506026', 'baf1390a-8e20-4b4a-acc8-1019c7de7d14', '45', 'XÁM/TÍM', 10, 'src/data/images/products/main_3df6d7a8.jpg'),
('329ed89f-026c-4aa1-b0a2-ac4440b505c1', '6159d67b-0eb8-4336-b23e-c37d2d36325a', '38', 'ĐỎ ĐÔ', 10, 'src/data/images/products/main_2e52265f.jpg'),
('eb600425-0803-4348-b481-010ec0c6075c', '6159d67b-0eb8-4336-b23e-c37d2d36325a', '39', 'ĐỎ ĐÔ', 10, 'src/data/images/products/main_2e52265f.jpg'),
('43be5de6-b14a-4838-aea6-1a891a34e51b', '6159d67b-0eb8-4336-b23e-c37d2d36325a', '40', 'ĐỎ ĐÔ', 10, 'src/data/images/products/main_2e52265f.jpg'),
('14f7d967-35bc-4a0a-8426-58ca79de6568', '6159d67b-0eb8-4336-b23e-c37d2d36325a', '41', 'ĐỎ ĐÔ', 10, 'src/data/images/products/main_2e52265f.jpg'),
('48364465-88c6-4c1a-badc-0af70d58db9b', '6159d67b-0eb8-4336-b23e-c37d2d36325a', '42', 'ĐỎ ĐÔ', 10, 'src/data/images/products/main_2e52265f.jpg'),
('e0b4278a-9abc-4863-9b91-3e1f37b8ce52', '6159d67b-0eb8-4336-b23e-c37d2d36325a', '43', 'ĐỎ ĐÔ', 10, 'src/data/images/products/main_2e52265f.jpg'),
('5a9b95d8-843e-4baf-b56f-d599cf0a2715', '6159d67b-0eb8-4336-b23e-c37d2d36325a', '44', 'ĐỎ ĐÔ', 10, 'src/data/images/products/main_2e52265f.jpg'),
('6be5b3b7-14c4-42c3-853d-de5cee241c41', '6159d67b-0eb8-4336-b23e-c37d2d36325a', '45', 'ĐỎ ĐÔ', 10, 'src/data/images/products/main_2e52265f.jpg'),
('57934e6d-aff3-4a3a-b686-5677b323c226', '3a4785af-55c3-4b3d-8db7-f2905c7fb8a8', '38', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_89a07b83.jpg'),
('6678c68f-0be5-47e9-a895-a27430af7be4', '3a4785af-55c3-4b3d-8db7-f2905c7fb8a8', '39', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_89a07b83.jpg'),
('40de1ef5-db50-4c91-9c4d-235a81d39d09', '3a4785af-55c3-4b3d-8db7-f2905c7fb8a8', '40', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_89a07b83.jpg'),
('4689428b-2cf7-4d77-8630-d751f634bb80', '3a4785af-55c3-4b3d-8db7-f2905c7fb8a8', '41', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_89a07b83.jpg'),
('7e46c4b7-3bb7-4ea0-9afa-08b6decbcba7', '3a4785af-55c3-4b3d-8db7-f2905c7fb8a8', '42', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_89a07b83.jpg'),
('a9cc7153-08e3-43ec-92b0-a91a03417254', '3a4785af-55c3-4b3d-8db7-f2905c7fb8a8', '43', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_89a07b83.jpg'),
('fd697fcc-6a53-4e97-8dec-bd66e2d6d9b3', '3a4785af-55c3-4b3d-8db7-f2905c7fb8a8', '44', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_89a07b83.jpg'),
('3ef78351-3dd4-47d4-b1b5-95fc411f583f', '3a4785af-55c3-4b3d-8db7-f2905c7fb8a8', '45', 'ĐEN/VÀNG CHANH', 10, 'src/data/images/products/main_89a07b83.jpg'),
('4b58b802-4a94-4594-83c4-ab3dc7f111ed', '7f1e4675-0d48-46b5-a3e7-50450e638e1b', '38', 'BẠC/VÀNG', 10, 'src/data/images/products/main_e15e6436.jpg'),
('9250a36e-55ff-4527-9d22-5cae254fd19c', '7f1e4675-0d48-46b5-a3e7-50450e638e1b', '39', 'BẠC/VÀNG', 10, 'src/data/images/products/main_e15e6436.jpg'),
('67f930f9-70e4-4a33-b5cc-8a3ca9fabc51', '7f1e4675-0d48-46b5-a3e7-50450e638e1b', '40', 'BẠC/VÀNG', 10, 'src/data/images/products/main_e15e6436.jpg'),
('4444b5cb-563d-43af-b62a-631110bb1698', '7f1e4675-0d48-46b5-a3e7-50450e638e1b', '41', 'BẠC/VÀNG', 10, 'src/data/images/products/main_e15e6436.jpg'),
('963d0b81-48f7-472e-bbe0-c8ac5404e6cb', '7f1e4675-0d48-46b5-a3e7-50450e638e1b', '42', 'BẠC/VÀNG', 10, 'src/data/images/products/main_e15e6436.jpg'),
('7246e438-79c3-4aff-8117-2900fbaa8c2d', '7f1e4675-0d48-46b5-a3e7-50450e638e1b', '43', 'BẠC/VÀNG', 10, 'src/data/images/products/main_e15e6436.jpg'),
('ae6e93b0-8456-4c5f-a413-dd4b8a2c97d8', '7f1e4675-0d48-46b5-a3e7-50450e638e1b', '44', 'BẠC/VÀNG', 10, 'src/data/images/products/main_e15e6436.jpg'),
('09f419a3-8cf3-4dee-9825-47b5e23a02fe', '7f1e4675-0d48-46b5-a3e7-50450e638e1b', '45', 'BẠC/VÀNG', 10, 'src/data/images/products/main_e15e6436.jpg'),
('c3dccb20-be3b-4c0c-851b-b95dbe9656b7', 'f9c5e5b5-75bc-4fad-9ceb-f7df54e3c5c1', '38', 'XANH XÁM/ĐEN', 10, 'src/data/images/products/main_0814eba7.jpg'),
('5570f9c0-2206-4a83-8d87-c9c5932545e5', 'f9c5e5b5-75bc-4fad-9ceb-f7df54e3c5c1', '39', 'XANH XÁM/ĐEN', 10, 'src/data/images/products/main_0814eba7.jpg'),
('7fdc5567-8d77-425d-bef1-187426f14d61', 'f9c5e5b5-75bc-4fad-9ceb-f7df54e3c5c1', '40', 'XANH XÁM/ĐEN', 10, 'src/data/images/products/main_0814eba7.jpg'),
('f07112b1-d178-4462-8dd8-0202c3a47283', 'f9c5e5b5-75bc-4fad-9ceb-f7df54e3c5c1', '41', 'XANH XÁM/ĐEN', 10, 'src/data/images/products/main_0814eba7.jpg');

INSERT INTO product_variants (variant_id, product_id, size, color, stock, image_url) VALUES
('7e51cd93-33a9-433a-a42f-e35a56cd6473', 'f9c5e5b5-75bc-4fad-9ceb-f7df54e3c5c1', '42', 'XANH XÁM/ĐEN', 10, 'src/data/images/products/main_0814eba7.jpg'),
('09b4c4b7-4c1d-4fa4-a8b5-36180c3b2a5e', 'f9c5e5b5-75bc-4fad-9ceb-f7df54e3c5c1', '43', 'XANH XÁM/ĐEN', 10, 'src/data/images/products/main_0814eba7.jpg'),
('77901139-30b5-4573-a8a4-c614d2a179e9', 'f9c5e5b5-75bc-4fad-9ceb-f7df54e3c5c1', '44', 'XANH XÁM/ĐEN', 10, 'src/data/images/products/main_0814eba7.jpg'),
('19ef11e5-b8a0-4b02-bdce-7a1e6ad2987c', 'f9c5e5b5-75bc-4fad-9ceb-f7df54e3c5c1', '45', 'XANH XÁM/ĐEN', 10, 'src/data/images/products/main_0814eba7.jpg'),
('44f80e5b-ce6a-493b-a842-8890061265ac', '733a1a55-ca05-4c24-bbf3-100713379d55', '38', 'XANH DƯƠNG', 10, 'src/data/images/products/main_c85b9cfc.jpg'),
('d0754570-5c4b-4f8b-8d92-b3a31902b3f9', '733a1a55-ca05-4c24-bbf3-100713379d55', '39', 'XANH DƯƠNG', 10, 'src/data/images/products/main_c85b9cfc.jpg'),
('b34de7b3-da6e-45cd-a579-12e879bc65e1', '733a1a55-ca05-4c24-bbf3-100713379d55', '40', 'XANH DƯƠNG', 10, 'src/data/images/products/main_c85b9cfc.jpg'),
('63711b74-3f37-460b-99cc-9f50b76b2c00', '733a1a55-ca05-4c24-bbf3-100713379d55', '41', 'XANH DƯƠNG', 10, 'src/data/images/products/main_c85b9cfc.jpg'),
('c878f7a2-4945-4710-814c-3b42b6ccfce4', '733a1a55-ca05-4c24-bbf3-100713379d55', '42', 'XANH DƯƠNG', 10, 'src/data/images/products/main_c85b9cfc.jpg'),
('c2828c83-9f23-494b-8b3f-18d9549d4aab', '733a1a55-ca05-4c24-bbf3-100713379d55', '43', 'XANH DƯƠNG', 10, 'src/data/images/products/main_c85b9cfc.jpg'),
('fb1dd9af-65fe-4d5b-9b51-9f588fe28990', '733a1a55-ca05-4c24-bbf3-100713379d55', '44', 'XANH DƯƠNG', 10, 'src/data/images/products/main_c85b9cfc.jpg'),
('679c7bfb-faea-40bd-b9ed-bd50bcb3f8b3', '733a1a55-ca05-4c24-bbf3-100713379d55', '45', 'XANH DƯƠNG', 10, 'src/data/images/products/main_c85b9cfc.jpg'),
('981662c1-c228-4a6a-b6ec-c865f850a496', 'bd22abb6-a0bf-4dc0-9b10-dff51f311126', '38', 'XÁM/BẠC', 10, 'src/data/images/products/main_c51cc9f9.jpg'),
('93d89f96-fd1b-45b9-8ad5-490209fe1bf8', 'bd22abb6-a0bf-4dc0-9b10-dff51f311126', '39', 'XÁM/BẠC', 10, 'src/data/images/products/main_c51cc9f9.jpg'),
('fb2efeb0-e2cf-4ef8-bf96-ff305cb6bbf5', 'bd22abb6-a0bf-4dc0-9b10-dff51f311126', '40', 'XÁM/BẠC', 10, 'src/data/images/products/main_c51cc9f9.jpg'),
('b9a1b151-3c8a-4a77-9b2a-2fa4c997abaa', 'bd22abb6-a0bf-4dc0-9b10-dff51f311126', '41', 'XÁM/BẠC', 10, 'src/data/images/products/main_c51cc9f9.jpg'),
('d6175b3e-5131-4823-a848-6a4f9bb39b1e', 'bd22abb6-a0bf-4dc0-9b10-dff51f311126', '42', 'XÁM/BẠC', 10, 'src/data/images/products/main_c51cc9f9.jpg'),
('0fbcc145-894a-4a13-8bf5-8c0fc2488078', 'bd22abb6-a0bf-4dc0-9b10-dff51f311126', '43', 'XÁM/BẠC', 10, 'src/data/images/products/main_c51cc9f9.jpg'),
('e11baa71-8d77-4ce4-bce6-41aee27c2c11', 'bd22abb6-a0bf-4dc0-9b10-dff51f311126', '44', 'XÁM/BẠC', 10, 'src/data/images/products/main_c51cc9f9.jpg'),
('923b0fa5-97a7-43bb-a145-60bcf230e538', 'bd22abb6-a0bf-4dc0-9b10-dff51f311126', '45', 'XÁM/BẠC', 10, 'src/data/images/products/main_c51cc9f9.jpg'),
('6b0c9ad3-7c6d-4cd3-8e6e-c6aa3b85ddca', '9ed79fcd-0fb1-42b6-a1a1-017fc7f4d5b4', '38', 'ĐỎ BẠC ĐÔ', 10, 'src/data/images/products/main_b9119bbc.jpg'),
('c0c6c4dc-5041-41ea-b3ae-fffb701070d4', '9ed79fcd-0fb1-42b6-a1a1-017fc7f4d5b4', '39', 'ĐỎ BẠC ĐÔ', 10, 'src/data/images/products/main_b9119bbc.jpg'),
('4f71949c-e1c0-449e-a238-a086e85b7b2d', '9ed79fcd-0fb1-42b6-a1a1-017fc7f4d5b4', '40', 'ĐỎ BẠC ĐÔ', 10, 'src/data/images/products/main_b9119bbc.jpg'),
('e5605a16-9539-4ffe-bf71-2cde9031fba6', '9ed79fcd-0fb1-42b6-a1a1-017fc7f4d5b4', '41', 'ĐỎ BẠC ĐÔ', 10, 'src/data/images/products/main_b9119bbc.jpg'),
('fdf37659-f3f3-4d3c-8354-072769e3aece', '9ed79fcd-0fb1-42b6-a1a1-017fc7f4d5b4', '42', 'ĐỎ BẠC ĐÔ', 10, 'src/data/images/products/main_b9119bbc.jpg'),
('9ccca0dc-79b8-45a5-9b41-fb7810f7cee2', '9ed79fcd-0fb1-42b6-a1a1-017fc7f4d5b4', '43', 'ĐỎ BẠC ĐÔ', 10, 'src/data/images/products/main_b9119bbc.jpg'),
('843f2c1a-095d-4404-92fb-c6b057750690', '9ed79fcd-0fb1-42b6-a1a1-017fc7f4d5b4', '44', 'ĐỎ BẠC ĐÔ', 10, 'src/data/images/products/main_b9119bbc.jpg'),
('0186067d-e397-4fe5-b42b-4da085937146', '9ed79fcd-0fb1-42b6-a1a1-017fc7f4d5b4', '45', 'ĐỎ BẠC ĐÔ', 10, 'src/data/images/products/main_b9119bbc.jpg'),
('807f0a66-9199-4d8c-8818-4f859e24d21b', 'd064c443-2bbb-4cb7-86be-169bfcc62c3b', '38', 'TRẮNG KEM', 10, 'src/data/images/products/main_23c75da3.jpg'),
('944c6f96-9f66-4d6d-90ea-bdb76e64ebe4', 'd064c443-2bbb-4cb7-86be-169bfcc62c3b', '39', 'TRẮNG KEM', 10, 'src/data/images/products/main_23c75da3.jpg'),
('e2b2c581-bc02-4930-b5d7-6f9b08dce507', 'd064c443-2bbb-4cb7-86be-169bfcc62c3b', '40', 'TRẮNG KEM', 10, 'src/data/images/products/main_23c75da3.jpg'),
('a50880e7-5a11-4664-808e-6cde7da1cb65', 'd064c443-2bbb-4cb7-86be-169bfcc62c3b', '41', 'TRẮNG KEM', 10, 'src/data/images/products/main_23c75da3.jpg'),
('7e5f81f4-de9e-4f9d-8717-712c58048946', 'd064c443-2bbb-4cb7-86be-169bfcc62c3b', '42', 'TRẮNG KEM', 10, 'src/data/images/products/main_23c75da3.jpg'),
('0d0d1563-b42d-454c-90e5-32b708a4376f', 'd064c443-2bbb-4cb7-86be-169bfcc62c3b', '43', 'TRẮNG KEM', 10, 'src/data/images/products/main_23c75da3.jpg'),
('39bec2c6-34c1-42f3-a1f8-ba5d707657dd', 'd064c443-2bbb-4cb7-86be-169bfcc62c3b', '44', 'TRẮNG KEM', 10, 'src/data/images/products/main_23c75da3.jpg'),
('d33b2053-763e-4546-ac53-81a0b355b278', 'd064c443-2bbb-4cb7-86be-169bfcc62c3b', '45', 'TRẮNG KEM', 10, 'src/data/images/products/main_23c75da3.jpg'),
('7286d64a-dc9c-41e2-ba18-0678fc6f8dac', '07766e83-83d5-4849-b336-7081e30041eb', '38', 'CAM/XANH', 10, 'src/data/images/products/main_36ff1a73.jpg'),
('8415bff0-5faf-469a-b170-322513f90d16', '07766e83-83d5-4849-b336-7081e30041eb', '39', 'CAM/XANH', 10, 'src/data/images/products/main_36ff1a73.jpg'),
('5f8c268e-c468-4545-a4e3-b8d14d058d5e', '07766e83-83d5-4849-b336-7081e30041eb', '40', 'CAM/XANH', 10, 'src/data/images/products/main_36ff1a73.jpg'),
('d9b386b4-25b0-4ed5-a852-4b567e425127', '07766e83-83d5-4849-b336-7081e30041eb', '41', 'CAM/XANH', 10, 'src/data/images/products/main_36ff1a73.jpg'),
('70c40de2-46e3-4249-883a-3229ed8c8016', '07766e83-83d5-4849-b336-7081e30041eb', '42', 'CAM/XANH', 10, 'src/data/images/products/main_36ff1a73.jpg'),
('56b84b09-b614-458b-8762-465139498d6a', '07766e83-83d5-4849-b336-7081e30041eb', '43', 'CAM/XANH', 10, 'src/data/images/products/main_36ff1a73.jpg'),
('6a2ae029-253c-47cf-9a63-399a7c924e82', '07766e83-83d5-4849-b336-7081e30041eb', '44', 'CAM/XANH', 10, 'src/data/images/products/main_36ff1a73.jpg'),
('d502a395-b4be-4160-aeb7-7538cfcfe909', '07766e83-83d5-4849-b336-7081e30041eb', '45', 'CAM/XANH', 10, 'src/data/images/products/main_36ff1a73.jpg'),
('f903e1c5-bb79-4863-93e9-c8d8af4e0eab', '79c1ab32-2a1f-4c9e-acf7-cfa6823504aa', '38', 'HỒNG TÍM/CAM', 10, 'src/data/images/products/main_b9065d06.jpg'),
('52e258ce-8b12-40f8-9d25-38a2eee4bf99', '79c1ab32-2a1f-4c9e-acf7-cfa6823504aa', '39', 'HỒNG TÍM/CAM', 10, 'src/data/images/products/main_b9065d06.jpg'),
('b793e3e8-b29b-4611-8199-89e101ca9154', '79c1ab32-2a1f-4c9e-acf7-cfa6823504aa', '40', 'HỒNG TÍM/CAM', 10, 'src/data/images/products/main_b9065d06.jpg'),
('3214c8f8-88d5-41e4-9f60-fd60537dce08', '79c1ab32-2a1f-4c9e-acf7-cfa6823504aa', '41', 'HỒNG TÍM/CAM', 10, 'src/data/images/products/main_b9065d06.jpg'),
('239df084-913a-4490-bb3a-45452bf5a7c8', '79c1ab32-2a1f-4c9e-acf7-cfa6823504aa', '42', 'HỒNG TÍM/CAM', 10, 'src/data/images/products/main_b9065d06.jpg'),
('2d51f116-e9af-4b86-b609-1d60b8e442b9', '79c1ab32-2a1f-4c9e-acf7-cfa6823504aa', '43', 'HỒNG TÍM/CAM', 10, 'src/data/images/products/main_b9065d06.jpg'),
('1f300654-c6c7-4a77-8ecd-163820f3c10c', '79c1ab32-2a1f-4c9e-acf7-cfa6823504aa', '44', 'HỒNG TÍM/CAM', 10, 'src/data/images/products/main_b9065d06.jpg'),
('9d5c2fac-0919-426e-bb5d-c19e8b19068e', '79c1ab32-2a1f-4c9e-acf7-cfa6823504aa', '45', 'HỒNG TÍM/CAM', 10, 'src/data/images/products/main_b9065d06.jpg'),
('ca490172-7e7c-42fc-bf0e-080568be172e', '7e33bda9-30e2-44d5-82c0-a593e0d495d1', '38', 'TRẮNG/XANH LÁ MẠ', 10, 'src/data/images/products/main_64b77f65.jpg'),
('ae57009c-4205-45a2-bda1-a1ba7c5c4172', '7e33bda9-30e2-44d5-82c0-a593e0d495d1', '39', 'TRẮNG/XANH LÁ MẠ', 10, 'src/data/images/products/main_64b77f65.jpg'),
('132a2aff-6462-4d26-92fc-4d6250b45b33', '7e33bda9-30e2-44d5-82c0-a593e0d495d1', '40', 'TRẮNG/XANH LÁ MẠ', 10, 'src/data/images/products/main_64b77f65.jpg'),
('b88ef4d4-4e94-4dba-98f7-08e903a8d80e', '7e33bda9-30e2-44d5-82c0-a593e0d495d1', '41', 'TRẮNG/XANH LÁ MẠ', 10, 'src/data/images/products/main_64b77f65.jpg'),
('85f5e3a1-9857-47fb-9126-164879366d99', '7e33bda9-30e2-44d5-82c0-a593e0d495d1', '42', 'TRẮNG/XANH LÁ MẠ', 10, 'src/data/images/products/main_64b77f65.jpg'),
('435a86de-8b86-4bc2-9a89-ffe2a92dd964', '7e33bda9-30e2-44d5-82c0-a593e0d495d1', '43', 'TRẮNG/XANH LÁ MẠ', 10, 'src/data/images/products/main_64b77f65.jpg'),
('bb2d96b1-562e-4fbd-876e-8519ef51b19f', '7e33bda9-30e2-44d5-82c0-a593e0d495d1', '44', 'TRẮNG/XANH LÁ MẠ', 10, 'src/data/images/products/main_64b77f65.jpg'),
('0e56df5a-7cd1-428d-b313-29f1c83e8fbd', '7e33bda9-30e2-44d5-82c0-a593e0d495d1', '45', 'TRẮNG/XANH LÁ MẠ', 10, 'src/data/images/products/main_64b77f65.jpg'),
('1e3a2458-a04d-4cc5-bf6f-847eb6122620', '93e66db6-161c-4270-932c-f2f1101aede2', '38', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_77671bb4.jpg'),
('09c50977-4819-4220-8c6a-889c3193f2f0', '93e66db6-161c-4270-932c-f2f1101aede2', '39', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_77671bb4.jpg'),
('877696c7-12b0-412b-9ea8-6002187c5719', '93e66db6-161c-4270-932c-f2f1101aede2', '40', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_77671bb4.jpg'),
('81da7ba2-2490-4905-9cf4-e18c73bfa769', '93e66db6-161c-4270-932c-f2f1101aede2', '41', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_77671bb4.jpg'),
('43938a5a-6f27-466b-8db4-0582faf6c8ab', '93e66db6-161c-4270-932c-f2f1101aede2', '42', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_77671bb4.jpg'),
('9ac499be-c826-40fd-b21f-7c78231d6ba2', '93e66db6-161c-4270-932c-f2f1101aede2', '43', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_77671bb4.jpg'),
('29915066-9e33-4c11-a714-3ad94a45dde7', '93e66db6-161c-4270-932c-f2f1101aede2', '44', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_77671bb4.jpg'),
('bfd3b7a5-fb0e-41d1-a73a-b73d2d5f5bbe', '93e66db6-161c-4270-932c-f2f1101aede2', '45', 'ĐỎ/TRẮNG', 10, 'src/data/images/products/main_77671bb4.jpg'),
('4a248319-616a-43f8-9aa0-68e7f6438dd9', '58659122-66f9-4a04-86d2-575e3cba5bc4', '38', 'XÁM XANH/HỒNG', 10, 'src/data/images/products/main_484d13a8.jpg'),
('18d75d49-0599-4ad8-bf77-6ec679eded47', '58659122-66f9-4a04-86d2-575e3cba5bc4', '39', 'XÁM XANH/HỒNG', 10, 'src/data/images/products/main_484d13a8.jpg'),
('ee34b208-7d2a-4c99-8fe9-f9feca5bee0a', '58659122-66f9-4a04-86d2-575e3cba5bc4', '40', 'XÁM XANH/HỒNG', 10, 'src/data/images/products/main_484d13a8.jpg'),
('8d4bc651-add9-4e89-bf78-06e5b13cfd96', '58659122-66f9-4a04-86d2-575e3cba5bc4', '41', 'XÁM XANH/HỒNG', 10, 'src/data/images/products/main_484d13a8.jpg'),
('92f42efa-849c-4904-ba36-c5f50072e64d', '58659122-66f9-4a04-86d2-575e3cba5bc4', '42', 'XÁM XANH/HỒNG', 10, 'src/data/images/products/main_484d13a8.jpg'),
('bb78ae1e-ec87-466a-b761-2a439e371066', '58659122-66f9-4a04-86d2-575e3cba5bc4', '43', 'XÁM XANH/HỒNG', 10, 'src/data/images/products/main_484d13a8.jpg'),
('af21e2b5-e57a-4090-8154-8d46cb8d1edd', '58659122-66f9-4a04-86d2-575e3cba5bc4', '44', 'XÁM XANH/HỒNG', 10, 'src/data/images/products/main_484d13a8.jpg'),
('a9cc14f1-467e-4e80-a861-4460185aec2f', '58659122-66f9-4a04-86d2-575e3cba5bc4', '45', 'XÁM XANH/HỒNG', 10, 'src/data/images/products/main_484d13a8.jpg');
