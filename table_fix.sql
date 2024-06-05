-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;

SET
    @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS,
    FOREIGN_KEY_CHECKS = 0;

SET
    @OLD_SQL_MODE = @@SQL_MODE,
    SQL_MODE = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8;

USE `mydb`;

-- -----------------------------------------------------
-- Table `mydb`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`role` (
    `id_role` INT NOT NULL AUTO_INCREMENT,
    `nama_role` VARCHAR(45) NULL,
    PRIMARY KEY (`id_role`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
    `nim_nid` VARCHAR(20) NOT NULL,
    `email` VARCHAR(45) NULL,
    `password` VARCHAR(45) NULL,
    `nama` VARCHAR(50) NULL,
    `id_role` INT NULL,
    PRIMARY KEY (`nim_nid`),
    INDEX `fkuser_idx` (`id_role` ASC),
    CONSTRAINT `fk1` FOREIGN KEY (`id_role`) REFERENCES `mydb`.`role` (`id_role`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`dokumen_temp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`dokumen_temp` (
    `id_dok_temp` INT NOT NULL AUTO_INCREMENT,
    `judul` VARCHAR(100) NULL,
    `deskripsi` VARCHAR(255) NULL,
    `tgl_upload` DATE NULL,
    `status` ENUM('Setuju', 'Tolak') NULL,
    `nim_nid` VARCHAR(20) NULL,
    PRIMARY KEY (`id_dok_temp`),
    INDEX `fkdoktempidx` (`nim_nid` ASC),
    CONSTRAINT `fkdoktemp` FOREIGN KEY (`nim_nid`) REFERENCES `mydb`.`user` (`nim_nid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`notifikasi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`notifikasi` (
    `id_notifikasi` INT NOT NULL AUTO_INCREMENT,
    `isi_pesan` VARCHAR(999) NULL,
    `nim_nid` VARCHAR(20) NULL,
    PRIMARY KEY (`id_notifikasi`),
    INDEX `fknotif_idx` (`nim_nid` ASC),
    CONSTRAINT `fknotif` FOREIGN KEY (`nim_nid`) REFERENCES `mydb`.`user` (`nim_nid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`dokumen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`dokumen` (
    `id_dokumen` INT NOT NULL AUTO_INCREMENT,
    `judul` VARCHAR(100) NULL,
    `deskripsi` VARCHAR(225) NULL,
    `tgl_upload` DATE NULL,
    `nim_nid` VARCHAR(20) NULL,
    PRIMARY KEY (`id_dokumen`),
    INDEX `idx_dok` (`id_dokumen` ASC),
    INDEX `fk_idx_nim_idx` (`nim_nid` ASC),
    CONSTRAINT `fkdok` FOREIGN KEY (`nim_nid`) REFERENCES `mydb`.`user` (`nim_nid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`pesan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pesan` (
    `id_pesan` INT NULL,
    `isi_pesan` VARCHAR(255) NULL,
    PRIMARY KEY (`id_pesan`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`admin` (
    `nip` VARCHAR(20) NOT NULL,
    `nama_admin` VARCHAR(45) NULL,
    `password` VARCHAR(45) NULL,
    `id_notifikasi` INT NULL,
    `id_dok_temp` INT NULL,
    `id_dokumen` INT NULL,
    `nim_nid` VARCHAR(20) NULL,
    `id_pesan` INT NULL,
    PRIMARY KEY (`nip`),
    INDEX `fkadm_idx` (`id_notifikasi` ASC),
    INDEX `fk2_idx` (`id_dok_temp` ASC),
    INDEX `fk3_idx` (`id_dokumen` ASC),
    INDEX `fk4_idx` (`nim_nid` ASC),
    INDEX `fk5_idx` (`id_pesan`),
    CONSTRAINT `fkadm` FOREIGN KEY (`id_notifikasi`) REFERENCES `mydb`.`notifikasi` (`id_notifikasi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk2` FOREIGN KEY (`id_dok_temp`) REFERENCES `mydb`.`dokumen_temp` (`id_dok_temp`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk3` FOREIGN KEY (`id_dokumen`) REFERENCES `mydb`.`dokumen` (`id_dokumen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk4` FOREIGN KEY (`nim_nid`) REFERENCES `mydb`.`user` (`nim_nid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk5` FOREIGN KEY (`id_pesan`) REFERENCES `mydb`.`pesan` (`id_pesan`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

INSERT INTO
    role (id_role, nama_role)
VALUES ('001', 'Mahasiswa'),
    ('002', 'Dosen');

-- Input data mahasiswa
INSERT INTO
    user (
        nim_nid,
        email,
        password,
        nama,
        id_role
    )
VALUES (
        'M001',
        'm001@student.com',
        'password1',
        'Alya Putri',
        1
    ),
    (
        'M002',
        'm002@student.com',
        'password2',
        'Bintang Pradana',
        1
    ),
    (
        'M003',
        'm003@student.com',
        'password3',
        'Citra Maharani',
        1
    ),
    (
        'M004',
        'm004@student.com',
        'password4',
        'Dimas Aditya',
        1
    ),
    (
        'M005',
        'm005@student.com',
        'password5',
        'Evelyn Natasha',
        1
    ),
    (
        'M006',
        'm006@student.com',
        'password6',
        'Farhan Rizky',
        1
    ),
    (
        'M007',
        'm007@student.com',
        'password7',
        'Gina Aulia',
        1
    ),
    (
        'M008',
        'm008@student.com',
        'password8',
        'Hafiz Kurniawan',
        1
    ),
    (
        'M009',
        'm009@student.com',
        'password9',
        'Indira Saraswati',
        1
    ),
    (
        'M010',
        'm010@student.com',
        'password10',
        'Johan Wijaya',
        1
    ),
    (
        'M011',
        'm011@student.com',
        'password11',
        'Kevin Saputra',
        1
    ),
    (
        'M012',
        'm012@student.com',
        'password12',
        'Larasati Putri',
        1
    ),
    (
        'M013',
        'm013@student.com',
        'password13',
        'Mikael Pratama',
        1
    ),
    (
        'M014',
        'm014@student.com',
        'password14',
        'Nadia Rahma',
        1
    ),
    (
        'M015',
        'm015@student.com',
        'password15',
        'Oscar Wibowo',
        1
    ),
    (
        'M016',
        'm016@student.com',
        'password16',
        'Putri Andini',
        1
    ),
    (
        'M017',
        'm017@student.com',
        'password17',
        'Rizky Febian',
        1
    ),
    (
        'M018',
        'm018@student.com',
        'password18',
        'Sinta Permata',
        1
    ),
    (
        'M019',
        'm019@student.com',
        'password19',
        'Tio Wicaksono',
        1
    ),
    (
        'M020',
        'm020@student.com',
        'password20',
        'Ulya Safitri',
        1
    );

SELECT * FROM user;

-- Input data dosen
INSERT INTO
    user (
        nim_nid,
        email,
        password,
        nama,
        id_role
    )
VALUES (
        'D001',
        'd001@faculty.com',
        'password11',
        'Prof. Dr. Ahmad Yani, M.Sc.',
        2
    ),
    (
        'D002',
        'd002@faculty.com',
        'password12',
        'Dr. Budi Hartono, M.T.',
        2
    ),
    (
        'D003',
        'd003@faculty.com',
        'password13',
        'Dr. Citra Dewi, M.Kom.',
        2
    ),
    (
        'D004',
        'd004@faculty.com',
        'password14',
        'Prof. Dr. Dedi Suryadi, M.Eng.',
        2
    ),
    (
        'D005',
        'd005@faculty.com',
        'password15',
        'Dr. Endang Priyono, M.Si.',
        2
    ),
    (
        'D006',
        'd006@faculty.com',
        'password16',
        'Prof. Dr. Farhan Maulana, M.T.',
        2
    ),
    (
        'D007',
        'd007@faculty.com',
        'password17',
        'Dr. Gita Nursanti, M.Kom.',
        2
    ),
    (
        'D008',
        'd008@faculty.com',
        'password18',
        'Prof. Dr. Hendra Gunawan, M.Eng.',
        2
    ),
    (
        'D009',
        'd009@faculty.com',
        'password19',
        'Dr. Indra Wijaya, M.Sc.',
        2
    ),
    (
        'D010',
        'd010@faculty.com',
        'password20',
        'Prof. Dr. Joko Pranoto, M.T.',
        2
    ),
    (
        'D011',
        'd011@faculty.com',
        'password21',
        'Dr. Kartika Putri, M.Kom.',
        2
    ),
    (
        'D012',
        'd012@faculty.com',
        'password22',
        'Prof. Dr. Leo Santoso, M.Sc.',
        2
    ),
    (
        'D013',
        'd013@faculty.com',
        'password23',
        'Dr. Maya Sari, M.T.',
        2
    ),
    (
        'D014',
        'd014@faculty.com',
        'password24',
        'Prof. Dr. Nanda Pratama, M.Eng.',
        2
    ),
    (
        'D015',
        'd015@faculty.com',
        'password25',
        'Dr. Oka Mahendra, M.Kom.',
        2
    ),
    (
        'D016',
        'd016@faculty.com',
        'password26',
        'Prof. Dr. Prita Anggraini, M.Sc.',
        2
    ),
    (
        'D017',
        'd017@faculty.com',
        'password27',
        'Dr. Rizal Wahyu, M.Eng.',
        2
    ),
    (
        'D018',
        'd018@faculty.com',
        'password28',
        'Prof. Dr. Sari Wulandari, M.Kom.',
        2
    ),
    (
        'D019',
        'd019@faculty.com',
        'password29',
        'Dr. Taufik Rahman, M.T.',
        2
    ),
    (
        'D020',
        'd020@faculty.com',
        'password30',
        'Prof. Dr. Umar Zain, M.Sc.',
        2
    );

-- insert dokumen temp
INSERT INTO
    dokumen_temp (
        id_dok_temp,
        judul,
        deskripsi,
        tgl_upload,
        status,
        nim_nid
    )
VALUES (
        '001',
        'Jobsheet Tree',
        'Jobsheet ASD 15',
        '2023-01-15',
        'Setuju',
        'D001'
    ),
    (
        '002',
        'Gauss Jordan',
        'Materi Aljabar Linear Pertemuan 3',
        '2023-02-20',
        'Setuju',
        'D002'
    ),
    (
        '003',
        'Determinan Matriks',
        'Materi Aljabar Linear Pertemuan 6',
        '2023-03-12',
        'Setuju',
        'D003'
    ),
    (
        '004',
        'Vektor',
        'Materi Aljabar Linear Pertemuan 12',
        '2023-04-25',
        'Setuju',
        'D004'
    ),
    (
        '005',
        'Cramer',
        'Materi Aljabar Linear Pertemuan 10',
        '2023-05-10',
        'Tolak',
        'D005'
    ),
    (
        '006',
        'Brute Force and Divide Conques',
        'Materi ASD Pertemuan 4',
        '2023-06-15',
        'Setuju',
        'D006'
    ),
    (
        '007',
        'Searching',
        'Materi ASD Pertemuan 6',
        '2023-07-20',
        'Setuju',
        'D007'
    ),
    (
        '008',
        'Double Linked List',
        'Materi ASD Pertemuan 10',
        '2023-08-30',
        'Setuju',
        'D008'
    ),
    (
        '009',
        'Pengantar Basis Data',
        'Materi Basis Data Pertemuan 1',
        '2023-09-12',
        'Setuju',
        'D009'
    ),
    (
        '010',
        'Pemetaan ERD ke Model Relasional Bagian 1',
        'Materi Basis Data Pertemuan 6',
        '2023-10-20',
        'Setuju',
        'D010'
    ),
    (
        '011',
        'Normalisasi',
        'Materi Basis Data Pertemuan 8',
        '2023-11-05',
        'Setuju',
        'D011'
    ),
    (
        '012',
        'Select Multi-Tabel',
        'Materi Basis Data Pertemuan 13',
        '2023-12-10',
        'Setuju',
        'D012'
    ),
    (
        '013',
        'ERD',
        'Materi Basis Data Pertemuan 4',
        '2024-01-15',
        'Setuju',
        'D013'
    ),
    (
        '014',
        'Makalah Jaringan Komputer',
        'Makalah tentang arsitektur dan protokol jaringan komputer.',
        '2024-01-15',
        'Setuju',
        'M014'
    ),
    (
        '015',
        'Paper Cloud Computing',
        'Paper tentang manfaat dan tantangan dalam adopsi Cloud Computing.',
        '2023-12-10',
        'Tolak',
        'M015'
    ),
    (
        '016',
        'Laporan Proyek IoT',
        'Laporan mengenai pengembangan sistem IoT untuk smart home.',
        '2023-11-05',
        'Tolak',
        'M016'
    ),
    (
        '017',
        'Laporan Pengujian Perangkat Lunak',
        'Laporan hasil pengujian perangkat lunak untuk aplikasi mobile.',
        '2024-05-10',
        'Tolak',
        'M017'
    ),
    (
        '018',
        'Makalah Keamanan Siber',
        'Makalah tentang teknik terbaru dalam keamanan siber.',
        '2024-06-15',
        'Tolak',
        'M018'
    ),
    (
        '019',
        'Laporan Riset Komputasi',
        'Laporan riset tentang penggunaan komputasi awan untuk analisis big data.',
        '2024-07-20',
        'Tolak',
        'M019'
    ),
    (
        '020',
        'Paper Pengolahan Citra',
        'Paper yang membahas teknik pengolahan citra digital.',
        '2024-08-30',
        'Tolak',
        'M020'
    );

-- insert notifikasi
INSERT INTO
    notifikasi (
        id_notifikasi,
        isi_pesan,
        nim_nid
    )
VALUES (
        1,
        'Dokumen "Jobsheet Tree" Anda telah disetujui oleh admin.',
        'D001'
    ),
    (
        2,
        'Dokumen "Gauss Jordan" Anda telah disetujui oleh admin.',
        'D002'
    ),
    (
        3,
        'Dokumen "Determinan Matriks" Anda telah disetujui oleh admin.',
        'D003'
    ),
    (
        4,
        'Dokumen "Vektor" Anda telah disetujui oleh admin.',
        'D004'
    ),
    (
        5,
        'Maaf, dokumen "Cramer" Anda belum disetujui oleh admin.',
        'D005'
    ),
    (
        6,
        'Dokumen "Brute Force and Divide Conques" Anda telah disetujui oleh admin.',
        'D006'
    ),
    (
        7,
        'Dokumen "Searching" Anda telah disetujui oleh admin.',
        'D007'
    ),
    (
        8,
        'Dokumen "Double Linked List" Anda telah disetujui oleh admin.',
        'D008'
    ),
    (
        9,
        'Dokumen "Pengantar Basis Data" Anda telah disetujui oleh admin.',
        'D009'
    ),
    (
        10,
        'Dokumen "Pemetaan ERD ke Model Relasional Bagian 1" Anda telah disetujui oleh admin.',
        'D010'
    ),
    (
        11,
        'Dokumen "Normalisasi" Anda telah disetujui oleh admin.',
        'D011'
    ),
    (
        12,
        'Dokumen "Select Multi-Tabel" Anda telah disetujui oleh admin.',
        'D012'
    ),
    (
        13,
        'Dokumen "ERD" Anda telah disetujui oleh admin.',
        'D013'
    ),
    (
        14,
        'Dokumen "Makalah Jaringan Komputer" Anda telah disetujui oleh admin.',
        'M014'
    ),
    (
        15,
        'Maaf, dokumen "Paper Cloud Computing" Anda belum disetujui oleh admin.',
        'M015'
    ),
    (
        16,
        'Maaf, dokumen "Laporan Proyek IoT" Anda belum disetujui oleh admin.',
        'M016'
    ),
    (
        17,
        'Maaf, dokumen "Laporan Pengujian Perangkat Lunak" Anda belum disetujui oleh admin.',
        'M017'
    ),
    (
        18,
        'Maaf, dokumen "Makalah Keamanan Siber" Anda belum disetujui oleh admin.',
        'M018'
    ),
    (
        19,
        'Maaf, dokumen "Laporan Riset Komputasi" Anda belum disetujui oleh admin.',
        'M019'
    ),
    (
        20,
        'Maaf, dokumen "Paper Pengolahan Citra" Anda belum disetujui oleh admin.',
        'M020'
    );

-- insert data admin
INSERT INTO
    admin (
        `nip`,
        `nama_admin`,
        `password`,
        `id_notifikasi`,
        `id_dok_temp`,
        `id_dokumen`,
        `nim_nid`,
        `id_pesan`
    )
VALUES (
        'A001',
        'Shohib Muslim',
        'adminpass1',
        NULL,
        NULL,
        NULL,
        NULL,
        NULL
    ),
    (
        'A002',
        'Rawansyah., Drs., MPd.',
        'adminpass2',
        NULL,
        NULL,
        NULL,
        NULL,
        NULL
    ),
    (
        'A003',
        'Noprianto',
        'adminpass3',
        NULL,
        NULL,
        NULL,
        NULL,
        NULL
    ),
    (
        'A004',
        'Moh. Amin',
        'adminpass4',
        NULL,
        NULL,
        NULL,
        NULL,
        NULL
    ),
    (
        'A005',
        'Hairus',
        'adminpass5',
        NULL,
        NULL,
        NULL,
        NULL,
        NULL
    );

-- insert dokumen
INSERT INTO
    dokumen (
        id_dokumen,
        judul,
        deskripsi,
        tgl_upload,
        `nim_nid`
    )
VALUES (
        1,
        'Jobsheet Tree',
        'Jobsheet ASD 15',
        '2023-01-15',
        'D001'
    ),
    (
        2,
        'Gauss Jordan',
        'Materi Aljabar Linear Pertemuan 3',
        '2023-02-20',
        'D002'
    ),
    (
        3,
        'Determinan Matriks',
        'Materi Aljabar Linear Pertemuan 6',
        '2023-03-12',
        'D003'
    ),
    (
        4,
        'Vektor',
        'Materi Aljabar Linear Pertemuan 12',
        '2023-04-25',
        'D004'
    ),
    (
        5,
        'Brute Force and Divide Conques',
        'Materi ASD Pertemuan 4',
        '2023-06-15',
        'D006'
    ),
    (
        6,
        'Searching',
        'Materi ASD Pertemuan 6',
        '2023-07-20',
        'D007'
    ),
    (
        7,
        'Double Linked List',
        'Materi ASD Pertemuan 10',
        '2023-08-30',
        'D008'
    ),
    (
        8,
        'Pengantar Basis Data',
        'Materi Basis Data Pertemuan 1',
        '2023-09-12',
        'D009'
    ),
    (
        9,
        'Pemetaan ERD ke Model Relasional Bagian 1',
        'Materi Basis Data Pertemuan 6',
        '2023-10-20',
        'D010'
    ),
    (
        10,
        'Normalisasi',
        'Materi Basis Data Pertemuan 8',
        '2023-11-05',
        'D011'
    ),
    (
        11,
        'Select Multi-Tabel',
        'Materi Basis Data Pertemuan 13',
        '2023-12-10',
        'D012'
    ),
    (
        12,
        'ERD',
        'Materi Basis Data Pertemuan 4',
        '2024-01-15',
        'D013'
    ),
    (
        13,
        'Makalah Jaringan Komputer',
        'Makalah tentang arsitektur dan protokol jaringan komputer.',
        '2024-01-15',
        'M014'
    ),
    (
        14,
        'Paper Cloud Computing',
        'Paper tentang manfaat dan tantangan dalam adopsi Cloud Computing.',
        '2023-12-10',
        'M015'
    );

-- insert pesan
INSERT INTO
    pesan (id_pesan, isi_pesan)
VALUES (
        1,
        'Dokumen telah disetujui oleh admin.'
    ),
    (
        2,
        'Dokumen telah ditolak oleh admin.'
    );

DESC ROLE;

DESC user;

DESC dokumen_temp;

DESC admin;

DESC dokumen;

DESC pesan;

DESC notifikasi;

SET SQL_MODE = @OLD_SQL_MODE;

SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;

SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;

-- Diana Rahmawati
-- pengambilan data dari dua tabel, yaitu user dan dokumen_temp, menggunakan operasi join, subquery, filter, dan sorting.
SELECT u.nama AS 'Nama User', dt.judul AS 'Judul Dokumen'
FROM dokumen_temp dt
    INNER JOIN user u ON u.nim_nid = dt.nim_nid
WHERE
    dt.nim_nid IN (
        SELECT u.nim_nid
        FROM user u
        WHERE
            u.nim_nid LIKE '%d%'
    )
ORDER BY u.nama ASC;

-- Muhammad Zaki
-- mensorting dokumen berdasarkaan tanggal uplaoad secara ascending (sorting)
SELECT * FROM dokumen_temp ORDER BY tgl_upload ASC;

-- berapa dokumen yang mengandung kata 'materi' (aggregating)
SELECT COUNT(deskripsi) FROM dokumen WHERE deskripsi LIKE '%materi%';

-- menggunakan operasi himpunan untuk mencari judul dan deskripsi kecuali materi
SELECT judul, deskripsi
FROM dokumen_temp EXCEPT
SELECT judul, deskripsi
FROM dokumen_temp
WHERE
    deskripsi LIKE '%materi%';

--  mengambil data dari tabel dokumen_temp, user, dan role. (join, filter, grouping)
SELECT u.nama, dt.judul
FROM
    dokumen_temp dt
    INNER JOIN user u on u.nim_nid = dt.nim_nid
    INNER JOIN role r on r.id_role = u.id_role
WHERE
    r.id_role = 1
    GROUP BY dt.judul;

-- Kibar Mustofa
-- Menampilkan semua pengguna dan dokumen yang diupload yang mengunggah dokumen (dari dokumen dan dokumen_temp) (sortng dan union)
SELECT nim_nid, judul, tgl_upload
FROM dokumen
UNION ALL
SELECT nim_nid, judul, tgl_upload
FROM dokumen_temp
ORDER BY judul ASC;

-- menggunakan operasi himpunan untuk mencari judul dan deskripsi yang mengandung kata 'materi'
SELECT * FROM dokumen_temp WHERE deskripsi LIKE '%materi%';