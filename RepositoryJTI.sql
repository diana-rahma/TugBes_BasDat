-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`role` (
  `id_role` INT NOT NULL AUTO_INCREMENT,
  `nama_role` VARCHAR(45) NULL,
  PRIMARY KEY (`id_role`))
ENGINE = InnoDB;


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
  INDEX `fk1_idx` (`id_role` ASC) ,
  CONSTRAINT `fk1`
    FOREIGN KEY (`id_role`)
    REFERENCES `mydb`.`role` (`id_role`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


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
  INDEX `fk1_idx` (`nim_nid` ASC) ,
  CONSTRAINT `fk1`
    FOREIGN KEY (`nim_nid`)
    REFERENCES `mydb`.`user` (`nim_nid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`notifikasi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`notifikasi` (
  `id_notifikasi` INT NOT NULL AUTO_INCREMENT,
  `isi_pesan` VARCHAR(999) NULL,
  `nim_nid` VARCHAR(20) NULL,
  PRIMARY KEY (`id_notifikasi`),
  INDEX `fk1_idx` (`nim_nid` ASC) ,
  CONSTRAINT `fk1`
    FOREIGN KEY (`nim_nid`)
    REFERENCES `mydb`.`user` (`nim_nid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`dokumen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`dokumen` (
  `id_dokumen` INT NOT NULL AUTO_INCREMENT,
  `judul` VARCHAR(100) NULL,
  `deskripsi` VARCHAR(225) NULL,
  `tgl_upload` DATE NULL,
  `nim/nid` VARCHAR(20) NULL,
  PRIMARY KEY (`id_dokumen`),
  INDEX `idx1` (`id_dokumen` ASC) ,
  INDEX `fk1_idx` (`nim_nid` ASC) ,
  CONSTRAINT `fk1`
    FOREIGN KEY (`nim_nid`)
    REFERENCES `mydb`.`user` (`nim_nid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pesan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pesan` (
  `id_pesan` INT NULL,
  `isi_pesan` VARCHAR(255) NULL,
  PRIMARY KEY (`id_pesan`))
ENGINE = InnoDB;


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
  CONSTRAINT `fkadm`
    FOREIGN KEY (`id_notifikasi`)
    REFERENCES `mydb`.`notifikasi` (`id_notifikasi`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk2`
    FOREIGN KEY (`id_dok_temp`)
    REFERENCES `mydb`.`dokumen_temp` (`id_dok_temp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk3`
    FOREIGN KEY (`id_dokumen`)
    REFERENCES `mydb`.`dokumen` (`id_dokumen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk4`
    FOREIGN KEY (`nim_nid`)
    REFERENCES `mydb`.`user` (`nim_nid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk5`
    FOREIGN KEY (`id_pesan`)
    REFERENCES `mydb`.`pesan` (`id_pesan`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


INSERT INTO role(id_role, nama_role) VALUES
('001', 'Mahasiswa'),
('002', 'Dosen');

INSERT INTO user(nim_nid, email, password, nama, id_role) VALUES



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
