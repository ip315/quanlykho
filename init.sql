CREATE DATABASE IF NOT EXISTS quan_ly_kho;
USE quan_ly_kho;

-- Tài khoản
CREATE TABLE tai_khoan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ten_dang_nhap VARCHAR(50) UNIQUE NOT NULL,
    mat_khau VARCHAR(255) NOT NULL,
    vai_tro ENUM('admin', 'nhan_vien') DEFAULT 'nhan_vien',
    ngay_tao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sản phẩm
CREATE TABLE san_pham (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ten_san_pham VARCHAR(255) NOT NULL,
    ma_san_pham VARCHAR(100) UNIQUE,
    gia_nhap DECIMAL(10,2),
    gia_ban DECIMAL(10,2),
    so_luong INT DEFAULT 0,
    ngay_tao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Nhà cung cấp
CREATE TABLE nha_cung_cap (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ten_ncc VARCHAR(255) NOT NULL,
    so_dien_thoai VARCHAR(20),
    dia_chi TEXT,
    ngay_tao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Phiếu nhập
CREATE TABLE phieu_nhap (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nha_cung_cap_id INT,
    tai_khoan_id INT,
    tong_tien DECIMAL(12,2) DEFAULT 0,
    ngay_nhap TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (nha_cung_cap_id) REFERENCES nha_cung_cap(id),
    FOREIGN KEY (tai_khoan_id) REFERENCES tai_khoan(id)
);

-- Chi tiết phiếu nhập
CREATE TABLE chi_tiet_phieu_nhap (
    id INT AUTO_INCREMENT PRIMARY KEY,
    phieu_nhap_id INT,
    san_pham_id INT,
    so_luong INT NOT NULL,
    gia DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (phieu_nhap_id) REFERENCES phieu_nhap(id),
    FOREIGN KEY (san_pham_id) REFERENCES san_pham(id)
);

-- Phiếu xuất
CREATE TABLE phieu_xuat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tai_khoan_id INT,
    tong_tien DECIMAL(12,2) DEFAULT 0,
    ngay_xuat TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (tai_khoan_id) REFERENCES tai_khoan(id)
);

-- Chi tiết phiếu xuất
CREATE TABLE chi_tiet_phieu_xuat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    phieu_xuat_id INT,
    san_pham_id INT,
    so_luong INT NOT NULL,
    gia DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (phieu_xuat_id) REFERENCES phieu_xuat(id),
    FOREIGN KEY (san_pham_id) REFERENCES san_pham(id)
);