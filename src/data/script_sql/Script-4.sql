-- =============================================
-- AUTO-GENERATED SQL DATA
-- Generated at: 2025-12-11 16:07:53
-- Source: .\data\beyono_volleyball\beyono_volleyball_final.json
-- Image URLs: LOCAL
-- =============================================

-- INSERT BRANDS
INSERT IGNORE INTO brands (brand_id, name, description, is_active, created_at) VALUES
('c8c51044-6b2d-41c0-9e3f-36ff3267c930', 'BEYONO', 'Thương hiệu BEYONO', TRUE, NOW());
-- =============================================
-- INSERT CATEGORIES (tất cả 4 danh mục)
-- =============================================
INSERT IGNORE INTO categories (category_id, name, description, is_active, created_at) VALUES
('3d652877-fad8-4f71-9ca7-f92251dba55a', 'Giày cầu lông', 'Danh mục Giày cầu lông', TRUE, NOW());


-- =============================================
-- INSERT PRODUCTS
-- =============================================
INSERT INTO products (product_id, name, description, price, image_url, status, brand_id, category_id, created_at, updated_at) VALUES
('45f74bf2-a09b-4b26-8dfa-c551f5519c79', 'Giày cầu lông Beyono Fire', 'Đây là giày cầu lông', 650000.00, 'src/data/images/products/main_d791cb1c.jpg', 'ACTIVE', 'c8c51044-6b2d-41c0-9e3f-36ff3267c930', 'e8257e67-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('023e5efb-de5f-4eac-a8eb-8687fcfae8a3', 'Giày cầu lông Beyono Wind', 'Đây là giày cầu lông', 790000.00, 'src/data/images/products/main_8a357382.jpg', 'ACTIVE', 'c8c51044-6b2d-41c0-9e3f-36ff3267c930', 'e8257e67-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW());

INSERT INTO products (product_id, name, description, price, image_url, status, brand_id, category_id, created_at, updated_at) VALUES
('a85c35c3-a459-46c3-a5d9-8704dbd3cfc9', 'Giày bóng chuyền Beyono Sky III', 'Đây là giày bóng chuyền', 799000.00, 'src/data/images/products/main_ae69838e.jpg', 'ACTIVE', 'c8c51044-6b2d-41c0-9e3f-36ff3267c930', 'e8257e67-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('61769db8-5122-4e38-a608-56a4c0e5d124', 'Giày Thể Thao Bóng Chuyền BEYONO STORM – BORN FOR CHAMPIONS', 'Đây là giày bóng chuyền', 1290000.00, 'src/data/images/products/main_3f4c68f9.jpg', 'ACTIVE', 'c8c51044-6b2d-41c0-9e3f-36ff3267c930', 'e8257e67-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('db779f49-0b67-49bd-887c-74edba9952f5', 'Giày bóng chuyền Beyono Sky', 'Đây là giày bóng chuyền', 790000.00, 'src/data/images/products/main_60110f45.jpg', 'ACTIVE', 'c8c51044-6b2d-41c0-9e3f-36ff3267c930', 'e8257e67-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('860c525e-fe27-421e-87d5-3ced443e13b8', 'Giày bóng chuyền Beyono Limit V2', 'Đây là giày bóng chuyền', 750000.00, 'src/data/images/products/main_6cc9fe3e.jpg', 'ACTIVE', 'c8c51044-6b2d-41c0-9e3f-36ff3267c930', 'e8257e67-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('7b40a175-5878-453f-9fe4-e98ab15ad25b', 'Giày bóng chuyền Beyono Limit V1', 'Đây là giày bóng chuyền', 750000.00, 'src/data/images/products/main_2e4f5a2f.jpg', 'ACTIVE', 'c8c51044-6b2d-41c0-9e3f-36ff3267c930', 'e8257e67-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('ca928433-0d61-4308-9d9f-1c61374da39c', 'Giày bóng chuyền Beyono Captain', 'Đây là giày bóng chuyền', 850000.00, 'src/data/images/products/main_33c1a37c.jpg', 'ACTIVE', 'c8c51044-6b2d-41c0-9e3f-36ff3267c930', 'e8257e67-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('a28b3929-8585-4eb5-8182-1693756f9baa', 'Giày bóng chuyền Beyono Eagle 8 - Version II', 'Đây là giày bóng chuyền', 899000.00, 'src/data/images/products/main_861e2c2f.jpg', 'ACTIVE', 'c8c51044-6b2d-41c0-9e3f-36ff3267c930', 'e8257e67-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('e642bbf1-4164-4eb3-99ef-560836b9c0e4', 'Giày bóng chuyền Beyono Limit V3', 'Đây là giày bóng chuyền', 899000.00, 'src/data/images/products/main_2eb698fd.jpg', 'ACTIVE', 'c8c51044-6b2d-41c0-9e3f-36ff3267c930', 'e8257e67-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW()),
('d5424e97-0831-43cc-8058-e25e6f243f9e', 'Giày bóng chuyền Beyono Orca', 'Đây là giày bóng chuyền', 980000.00, 'src/data/images/products/main_fd23823b.jpg', 'ACTIVE', 'c8c51044-6b2d-41c0-9e3f-36ff3267c930', 'e8257e67-d4d3-11f0-9c43-bac23ad2f5de', NOW(), NOW());

-- =============================================
-- INSERT PRODUCT VARIANTS
-- =============================================

INSERT INTO product_variants (variant_id, product_id, size, color, stock, image_url) VALUES
('6b757695-dcab-4900-a71b-8227cb150e8f', 'a85c35c3-a459-46c3-a5d9-8704dbd3cfc9', '38', 'Default', 10, 'src/data/images/products/main_ae69838e.jpg'),
('b722b63f-5048-47f5-8c18-561f35b6e1df', 'a85c35c3-a459-46c3-a5d9-8704dbd3cfc9', '39', 'Default', 10, 'src/data/images/products/main_ae69838e.jpg'),
('a5ca38c4-e2fe-476d-bbc2-d4b98d7f41e0', 'a85c35c3-a459-46c3-a5d9-8704dbd3cfc9', '40', 'Default', 10, 'src/data/images/products/main_ae69838e.jpg'),
('23d0e659-641d-47bd-9f8e-92afb9c9a429', 'a85c35c3-a459-46c3-a5d9-8704dbd3cfc9', '41', 'Default', 10, 'src/data/images/products/main_ae69838e.jpg'),
('026932f2-0165-4223-a791-74bb47d8c09c', 'a85c35c3-a459-46c3-a5d9-8704dbd3cfc9', '42', 'Default', 10, 'src/data/images/products/main_ae69838e.jpg'),
('7b2bbe29-cc99-47fe-b7b4-c2f6def011e3', 'a85c35c3-a459-46c3-a5d9-8704dbd3cfc9', '43', 'Default', 10, 'src/data/images/products/main_ae69838e.jpg'),
('ce4d7ae5-5945-4ab3-9ea4-1eb24ad43d3c', 'a85c35c3-a459-46c3-a5d9-8704dbd3cfc9', '44', 'Default', 10, 'src/data/images/products/main_ae69838e.jpg'),
('4ed8e8f3-521f-4fc9-bcfe-6453f7f7a901', 'a85c35c3-a459-46c3-a5d9-8704dbd3cfc9', '45', 'Default', 10, 'src/data/images/products/main_ae69838e.jpg'),
('d3adbb7d-6503-46cc-8d61-02ad68809da9', '61769db8-5122-4e38-a608-56a4c0e5d124', '38', 'Default', 10, 'src/data/images/products/main_3f4c68f9.jpg'),
('20dd71bd-7569-4d31-83c8-ef537aec9d73', '61769db8-5122-4e38-a608-56a4c0e5d124', '39', 'Default', 10, 'src/data/images/products/main_3f4c68f9.jpg'),
('e5a0fca6-b85f-40fc-a3ca-89e2a9c2fdc7', '61769db8-5122-4e38-a608-56a4c0e5d124', '40', 'Default', 10, 'src/data/images/products/main_3f4c68f9.jpg'),
('bc7aa483-c8bf-458a-b285-ecf1f212607d', '61769db8-5122-4e38-a608-56a4c0e5d124', '41', 'Default', 10, 'src/data/images/products/main_3f4c68f9.jpg'),
('fa5b32be-5ed8-45c1-afe7-0a2444a6d8f6', '61769db8-5122-4e38-a608-56a4c0e5d124', '42', 'Default', 10, 'src/data/images/products/main_3f4c68f9.jpg'),
('c06cdb60-d55f-47ab-8036-4a933670d203', '61769db8-5122-4e38-a608-56a4c0e5d124', '43', 'Default', 10, 'src/data/images/products/main_3f4c68f9.jpg'),
('49670e54-df9f-4435-8863-87382d4a83d3', '61769db8-5122-4e38-a608-56a4c0e5d124', '44', 'Default', 10, 'src/data/images/products/main_3f4c68f9.jpg'),
('ebd69f8b-b986-4b81-a843-cf616a5e78b6', '61769db8-5122-4e38-a608-56a4c0e5d124', '45', 'Default', 10, 'src/data/images/products/main_3f4c68f9.jpg'),
('856ab27d-2533-445d-b726-40f6e2d9a651', 'db779f49-0b67-49bd-887c-74edba9952f5', '38', 'Default', 10, 'src/data/images/products/main_60110f45.jpg'),
('67340864-7fe0-43a0-9734-87568916a80b', 'db779f49-0b67-49bd-887c-74edba9952f5', '39', 'Default', 10, 'src/data/images/products/main_60110f45.jpg'),
('284a05fe-c3a7-4462-a8aa-62378100f333', 'db779f49-0b67-49bd-887c-74edba9952f5', '40', 'Default', 10, 'src/data/images/products/main_60110f45.jpg'),
('76011761-5992-472c-84f0-e4c90cd1dbd5', 'db779f49-0b67-49bd-887c-74edba9952f5', '41', 'Default', 10, 'src/data/images/products/main_60110f45.jpg'),
('521045cd-fefe-47ea-a116-e22eb3aaee45', 'db779f49-0b67-49bd-887c-74edba9952f5', '42', 'Default', 10, 'src/data/images/products/main_60110f45.jpg'),
('2eca4d74-8166-4fab-9e60-2c496b704423', 'db779f49-0b67-49bd-887c-74edba9952f5', '43', 'Default', 10, 'src/data/images/products/main_60110f45.jpg'),
('c8f79fcf-2630-4c62-8f89-82c90af744bf', 'db779f49-0b67-49bd-887c-74edba9952f5', '44', 'Default', 10, 'src/data/images/products/main_60110f45.jpg'),
('c32b5739-5f5b-4ed7-bae1-c3c0dd6257bf', 'db779f49-0b67-49bd-887c-74edba9952f5', '45', 'Default', 10, 'src/data/images/products/main_60110f45.jpg'),
('69fa9ea3-30e5-4640-a92b-f119503929d6', '860c525e-fe27-421e-87d5-3ced443e13b8', '38', 'Default', 10, 'src/data/images/products/main_6cc9fe3e.jpg'),
('b996e645-f570-40b8-8232-d93c328b77b2', '860c525e-fe27-421e-87d5-3ced443e13b8', '39', 'Default', 10, 'src/data/images/products/main_6cc9fe3e.jpg'),
('4db6ef48-901b-4612-9969-d9092474812f', '860c525e-fe27-421e-87d5-3ced443e13b8', '40', 'Default', 10, 'src/data/images/products/main_6cc9fe3e.jpg'),
('1fe09728-ec5e-483c-80e0-47454809daac', '860c525e-fe27-421e-87d5-3ced443e13b8', '41', 'Default', 10, 'src/data/images/products/main_6cc9fe3e.jpg'),
('87f571da-761c-440f-b1a8-52d80deb4405', '860c525e-fe27-421e-87d5-3ced443e13b8', '42', 'Default', 10, 'src/data/images/products/main_6cc9fe3e.jpg'),
('9017590c-af0a-407c-b04d-b547a54db728', '860c525e-fe27-421e-87d5-3ced443e13b8', '43', 'Default', 10, 'src/data/images/products/main_6cc9fe3e.jpg'),
('bc23f45f-7fc1-479a-b991-1736abce6cd9', '860c525e-fe27-421e-87d5-3ced443e13b8', '44', 'Default', 10, 'src/data/images/products/main_6cc9fe3e.jpg'),
('216cdf0d-862e-4774-aeb6-67f085c0d719', '860c525e-fe27-421e-87d5-3ced443e13b8', '45', 'Default', 10, 'src/data/images/products/main_6cc9fe3e.jpg'),
('21ef8f06-e376-41de-95c0-ac677855bd1b', '7b40a175-5878-453f-9fe4-e98ab15ad25b', '38', 'Default', 10, 'src/data/images/products/main_2e4f5a2f.jpg'),
('88a319de-3735-4aa9-9e3d-645f0e077fa2', '7b40a175-5878-453f-9fe4-e98ab15ad25b', '39', 'Default', 10, 'src/data/images/products/main_2e4f5a2f.jpg'),
('811bbf35-6c42-4b56-9cdb-12b80209d331', '7b40a175-5878-453f-9fe4-e98ab15ad25b', '40', 'Default', 10, 'src/data/images/products/main_2e4f5a2f.jpg'),
('d7bbd65f-a421-469a-8361-972cd68a36e7', '7b40a175-5878-453f-9fe4-e98ab15ad25b', '41', 'Default', 10, 'src/data/images/products/main_2e4f5a2f.jpg'),
('444a8c5a-a20d-4402-a370-e07655c294ea', '7b40a175-5878-453f-9fe4-e98ab15ad25b', '42', 'Default', 10, 'src/data/images/products/main_2e4f5a2f.jpg'),
('df467116-2920-47c1-95bb-14162ff0cebc', '7b40a175-5878-453f-9fe4-e98ab15ad25b', '43', 'Default', 10, 'src/data/images/products/main_2e4f5a2f.jpg'),
('5e52a85d-edde-4a2a-9bfe-9c992a9e2fbd', '7b40a175-5878-453f-9fe4-e98ab15ad25b', '44', 'Default', 10, 'src/data/images/products/main_2e4f5a2f.jpg'),
('ef43ed09-46fe-4b15-afef-6d8052046622', '7b40a175-5878-453f-9fe4-e98ab15ad25b', '45', 'Default', 10, 'src/data/images/products/main_2e4f5a2f.jpg'),
('db9be51f-4bb3-48e8-9a1f-af968d69a191', 'ca928433-0d61-4308-9d9f-1c61374da39c', '38', 'Default', 10, 'src/data/images/products/main_33c1a37c.jpg'),
('38447ec0-6dcc-46aa-98c2-b5169bf8b845', 'ca928433-0d61-4308-9d9f-1c61374da39c', '39', 'Default', 10, 'src/data/images/products/main_33c1a37c.jpg'),
('f3e21012-d461-47e2-8372-54b627039e10', 'ca928433-0d61-4308-9d9f-1c61374da39c', '40', 'Default', 10, 'src/data/images/products/main_33c1a37c.jpg'),
('f705b0ff-d6a7-4b86-91dd-10ee3116224c', 'ca928433-0d61-4308-9d9f-1c61374da39c', '41', 'Default', 10, 'src/data/images/products/main_33c1a37c.jpg'),
('576176a6-6f14-408c-9dfc-e5280ccc4d3a', 'ca928433-0d61-4308-9d9f-1c61374da39c', '42', 'Default', 10, 'src/data/images/products/main_33c1a37c.jpg'),
('5c96be80-edb5-4aa7-a033-e3a1f249b8cd', 'ca928433-0d61-4308-9d9f-1c61374da39c', '43', 'Default', 10, 'src/data/images/products/main_33c1a37c.jpg'),
('53b0b205-a8d7-4aa8-95f2-a4b9fffc5424', 'ca928433-0d61-4308-9d9f-1c61374da39c', '44', 'Default', 10, 'src/data/images/products/main_33c1a37c.jpg'),
('f7fcacff-8f99-43f4-be9f-d87146b60420', 'ca928433-0d61-4308-9d9f-1c61374da39c', '45', 'Default', 10, 'src/data/images/products/main_33c1a37c.jpg'),
('4d27f4df-48b0-4996-a5de-7c7c42457950', 'a28b3929-8585-4eb5-8182-1693756f9baa', '38', 'Default', 10, 'src/data/images/products/main_861e2c2f.jpg'),
('56c9c8b2-e924-4b3b-ac65-2b31cd26ecb6', 'a28b3929-8585-4eb5-8182-1693756f9baa', '39', 'Default', 10, 'src/data/images/products/main_861e2c2f.jpg'),
('9dfd2356-fedb-4dc7-b2cf-96fed7bd3cba', 'a28b3929-8585-4eb5-8182-1693756f9baa', '40', 'Default', 10, 'src/data/images/products/main_861e2c2f.jpg'),
('34b399a2-6a6a-4163-a721-fac967d2cad7', 'a28b3929-8585-4eb5-8182-1693756f9baa', '41', 'Default', 10, 'src/data/images/products/main_861e2c2f.jpg'),
('18353558-7df0-41d8-8d5a-9bd65d1758ea', 'a28b3929-8585-4eb5-8182-1693756f9baa', '42', 'Default', 10, 'src/data/images/products/main_861e2c2f.jpg'),
('0cfe7bff-f2e2-4340-b64e-68d72864d8d9', 'a28b3929-8585-4eb5-8182-1693756f9baa', '43', 'Default', 10, 'src/data/images/products/main_861e2c2f.jpg'),
('8868b814-d1f2-463d-9de3-671884d9f946', 'a28b3929-8585-4eb5-8182-1693756f9baa', '44', 'Default', 10, 'src/data/images/products/main_861e2c2f.jpg'),
('8fcf1896-aace-447c-b52f-644dd3f90c36', 'a28b3929-8585-4eb5-8182-1693756f9baa', '45', 'Default', 10, 'src/data/images/products/main_861e2c2f.jpg'),
('9f4a8635-72ec-4df3-b13c-1f5b28f2be34', 'e642bbf1-4164-4eb3-99ef-560836b9c0e4', '38', 'Default', 10, 'src/data/images/products/main_2eb698fd.jpg'),
('791ae607-bbb2-440b-ab69-a0ffe6b65118', 'e642bbf1-4164-4eb3-99ef-560836b9c0e4', '39', 'Default', 10, 'src/data/images/products/main_2eb698fd.jpg'),
('80dae0ec-afc4-4af3-aaa8-000f883b570d', 'e642bbf1-4164-4eb3-99ef-560836b9c0e4', '40', 'Default', 10, 'src/data/images/products/main_2eb698fd.jpg'),
('83da5736-892f-46c0-b390-9c4e5515541c', 'e642bbf1-4164-4eb3-99ef-560836b9c0e4', '41', 'Default', 10, 'src/data/images/products/main_2eb698fd.jpg'),
('40b45418-39a7-4366-a6b1-29edf086bc3c', 'e642bbf1-4164-4eb3-99ef-560836b9c0e4', '42', 'Default', 10, 'src/data/images/products/main_2eb698fd.jpg'),
('3a36372a-38ac-47ce-9ead-86e94c65d651', 'e642bbf1-4164-4eb3-99ef-560836b9c0e4', '43', 'Default', 10, 'src/data/images/products/main_2eb698fd.jpg'),
('98879c35-2fc0-4c42-8be7-19fdb657dd3a', 'e642bbf1-4164-4eb3-99ef-560836b9c0e4', '44', 'Default', 10, 'src/data/images/products/main_2eb698fd.jpg'),
('329eb3b0-8667-479b-bdcf-69c66a1b4a76', 'e642bbf1-4164-4eb3-99ef-560836b9c0e4', '45', 'Default', 10, 'src/data/images/products/main_2eb698fd.jpg'),
('4b8479e0-e9f6-434d-a483-e6d05dc14863', 'd5424e97-0831-43cc-8058-e25e6f243f9e', '38', 'Default', 10, 'src/data/images/products/main_fd23823b.jpg'),
('265547c7-746b-4af7-a23b-bbd250ea343a', 'd5424e97-0831-43cc-8058-e25e6f243f9e', '39', 'Default', 10, 'src/data/images/products/main_fd23823b.jpg'),
('2000b18c-ab78-495a-ac52-fe9cb60102fb', 'd5424e97-0831-43cc-8058-e25e6f243f9e', '40', 'Default', 10, 'src/data/images/products/main_fd23823b.jpg'),
('f77bb9ee-83ea-4251-bb63-90f40a1092ed', 'd5424e97-0831-43cc-8058-e25e6f243f9e', '41', 'Default', 10, 'src/data/images/products/main_fd23823b.jpg'),
('c68f1d0e-adf2-4e3d-86ec-dac91da752d2', 'd5424e97-0831-43cc-8058-e25e6f243f9e', '42', 'Default', 10, 'src/data/images/products/main_fd23823b.jpg'),
('c9dd237f-0145-4d11-bc3a-631fbb23a416', 'd5424e97-0831-43cc-8058-e25e6f243f9e', '43', 'Default', 10, 'src/data/images/products/main_fd23823b.jpg'),
('40c0bb84-d714-4854-879f-3cd565ae1245', 'd5424e97-0831-43cc-8058-e25e6f243f9e', '44', 'Default', 10, 'src/data/images/products/main_fd23823b.jpg'),
('49ac3493-bcbe-424d-a1ac-4db293a1c0f8', 'd5424e97-0831-43cc-8058-e25e6f243f9e', '45', 'Default', 10, 'src/data/images/products/main_fd23823b.jpg');

INSERT INTO product_variants (variant_id, product_id, size, color, stock, image_url) VALUES
('05e12e66-8a5e-4ea6-8166-85e9b4cd5175', '45f74bf2-a09b-4b26-8dfa-c551f5519c79', '38', 'Default', 10, 'src/data/images/products/main_d791cb1c.jpg'),
('4d494eea-909d-41d3-bcbd-22b11cb74441', '45f74bf2-a09b-4b26-8dfa-c551f5519c79', '39', 'Default', 10, 'src/data/images/products/main_d791cb1c.jpg'),
('745005ac-be1a-477e-9f03-51396fd9d817', '45f74bf2-a09b-4b26-8dfa-c551f5519c79', '40', 'Default', 10, 'src/data/images/products/main_d791cb1c.jpg'),
('e5829cb8-37e4-431b-9f70-7031a1778ec1', '45f74bf2-a09b-4b26-8dfa-c551f5519c79', '41', 'Default', 10, 'src/data/images/products/main_d791cb1c.jpg'),
('e8c9b982-3397-490d-a669-4f0c38d6384d', '45f74bf2-a09b-4b26-8dfa-c551f5519c79', '42', 'Default', 10, 'src/data/images/products/main_d791cb1c.jpg'),
('2e12de1a-2b7f-4d0b-b3a4-247660198e3f', '45f74bf2-a09b-4b26-8dfa-c551f5519c79', '43', 'Default', 10, 'src/data/images/products/main_d791cb1c.jpg'),
('c57e9b00-800b-4f05-b351-c6406fd97b5c', '45f74bf2-a09b-4b26-8dfa-c551f5519c79', '44', 'Default', 10, 'src/data/images/products/main_d791cb1c.jpg'),
('d163373a-37be-49bc-8073-c230f31e1d84', '45f74bf2-a09b-4b26-8dfa-c551f5519c79', '45', 'Default', 10, 'src/data/images/products/main_d791cb1c.jpg'),
('0d13e78a-7225-452c-adb0-28905d21052e', '023e5efb-de5f-4eac-a8eb-8687fcfae8a3', '38', 'Default', 10, 'src/data/images/products/main_8a357382.jpg'),
('0b8f3f75-9830-4f28-b759-34f65128b55f', '023e5efb-de5f-4eac-a8eb-8687fcfae8a3', '39', 'Default', 10, 'src/data/images/products/main_8a357382.jpg'),
('79643dfa-b76e-4c85-94af-1d946675dc19', '023e5efb-de5f-4eac-a8eb-8687fcfae8a3', '40', 'Default', 10, 'src/data/images/products/main_8a357382.jpg'),
('d7bc24d9-d4ca-43bd-9a84-559322cccaec', '023e5efb-de5f-4eac-a8eb-8687fcfae8a3', '41', 'Default', 10, 'src/data/images/products/main_8a357382.jpg'),
('2cf208cf-a063-4cbf-b7a2-d2e54c6c247a', '023e5efb-de5f-4eac-a8eb-8687fcfae8a3', '42', 'Default', 10, 'src/data/images/products/main_8a357382.jpg'),
('3d56ded8-ac1b-43e3-bb7d-0b26a45a0673', '023e5efb-de5f-4eac-a8eb-8687fcfae8a3', '43', 'Default', 10, 'src/data/images/products/main_8a357382.jpg'),
('531455e3-9f57-4136-b7fd-32bb2a6929fc', '023e5efb-de5f-4eac-a8eb-8687fcfae8a3', '44', 'Default', 10, 'src/data/images/products/main_8a357382.jpg'),
('972b0b00-0424-4577-be03-343d400f5fb1', '023e5efb-de5f-4eac-a8eb-8687fcfae8a3', '45', 'Default', 10, 'src/data/images/products/main_8a357382.jpg');
