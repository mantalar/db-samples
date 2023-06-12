-- MySQL dump 10.13  Distrib 5.5.42, for Win64 (x86)
--
-- Host: localhost    Database: perpus
-- ------------------------------------------------------
-- Server version	5.5.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `anggota`
--
DROP DATABASE IF EXISTS PERPUS;
CREATE DATABASE PERPUS;
USE PERPUS;

DROP TABLE IF EXISTS `anggota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anggota` (
  `NoAnggota` varchar(10) NOT NULL,
  `IDPengenal` varchar(16) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  `MasaBerlaku` date NOT NULL,
  `phone` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`NoAnggota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anggota`
--

LOCK TABLES `anggota` WRITE;
/*!40000 ALTER TABLE `anggota` DISABLE KEYS */;
INSERT INTO `anggota` VALUES ('E020321098','6203012609010008','Haris Rizki','Jalan Kayu Tangi 2','2024-11-02','08135031113'),('E020321103','6202061812020003','M. Kahfi Ramadhani','Jalan Kayu Tangi 2','2024-11-02','085393414223'),('E020321105','6371041001020002','Muhammad Aditya','Jalan Alalak Tengah','2024-11-02','085822995157'),('E020321107','6371070308020008','Muhammad Rizky','Jalan Hasan Basri','2024-11-02','0895806206807'),('E020321108','6371030205030003','Muhammad Saufi','Jalan Belitung','2024-11-02','085822989902'),('E020321110','6309115908030001','Muna Shofia','Jalan Gatot Subroto','2024-11-02','081998200377'),('E020321112','6310034111030001','Noor Azemi','Jalan Kayu Tangi 1','2024-11-02','081350446514'),('E020321113','6371046112020007','Nor Nabila','Jalan Alalak Selatan','2024-11-02','87844292680'),('E020321119','6371034402030011','Roziyatin','Jalan Pasirmas','2024-11-02','082199413968'),('E020321121','6310065708030001','Wizriyati Sukma','Jalan Perdagangan','2024-11-02','082350834978');
/*!40000 ALTER TABLE `anggota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_peminjaman`
--

DROP TABLE IF EXISTS `detail_peminjaman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_peminjaman` (
  `NoKoleksi` varchar(16) NOT NULL,
  `NoPinjam` varchar(10) NOT NULL,
  PRIMARY KEY (`NoKoleksi`,`NoPinjam`),
  KEY `NoPinjam` (`NoPinjam`),
  CONSTRAINT `detail_peminjaman_ibfk_1` FOREIGN KEY (`NoKoleksi`) REFERENCES `koleksi` (`ID`),
  CONSTRAINT `detail_peminjaman_ibfk_2` FOREIGN KEY (`NoPinjam`) REFERENCES `peminjaman` (`NoPinjam`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_peminjaman`
--

LOCK TABLES `detail_peminjaman` WRITE;
/*!40000 ALTER TABLE `detail_peminjaman` DISABLE KEYS */;
INSERT INTO `detail_peminjaman` VALUES ('004','1'),('005','1'),('500','1'),('005.5','2'),('320','2'),('330.072','2'),('331.2','3'),('338.04','3'),('346','3'),('650','4'),('651.3','4'),('658.403','4'),('658.4038','5'),('658.8','5'),('813','5');
/*!40000 ALTER TABLE `detail_peminjaman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jeniskoleksi`
--

DROP TABLE IF EXISTS `jeniskoleksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jeniskoleksi` (
  `ID` varchar(4) NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `Lokasi` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jeniskoleksi`
--

LOCK TABLES `jeniskoleksi` WRITE;
/*!40000 ALTER TABLE `jeniskoleksi` DISABLE KEYS */;
INSERT INTO `jeniskoleksi` VALUES ('000','Generalities(Karya Umum)','000 - 099'),('100','Philosopy and Psychology(Filsafat dan Psikologi','100 - 199'),('200','Religion(Agama)','200 - 299'),('300','Social Science(Ilmu - ilmu sosial)','300 - 399'),('400','Language(Bahasa)','400 - 499'),('500','Natural Science and Mathematics(Ilmu - ilmu Alam dan Matematika)','500 - 599'),('600','Technology and Applied Science(Teknologi dan ilmu - ilmu terapan','600 - 699'),('700','The Art, Fine and Sport (Kesenian, hiburan dan olahraga)','700 - 799'),('800','Literature and Rhetoric(kesusastraan)','800 - 899'),('900','Geography and History(Geografi dan Sejarah)','900 - 999');
/*!40000 ALTER TABLE `jeniskoleksi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koleksi`
--

DROP TABLE IF EXISTS `koleksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koleksi` (
  `ID` varchar(16) NOT NULL,
  `Judul` varchar(100) NOT NULL,
  `Penerbit` varchar(60) DEFAULT NULL,
  `Pengarang` varchar(60) DEFAULT NULL,
  `TahunTerbit` year(4) NOT NULL,
  `Jenis` varchar(4) NOT NULL,
  `ISBN` varchar(13) DEFAULT NULL,
  `Cover` enum('Hard','Soft') NOT NULL,
  `Halaman` int(4) DEFAULT NULL,
  `Status` enum('ada','dipinjam') NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Jenis` (`Jenis`),
  CONSTRAINT `koleksi_ibfk_1` FOREIGN KEY (`Jenis`) REFERENCES `jeniskoleksi` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koleksi`
--

LOCK TABLES `koleksi` WRITE;
/*!40000 ALTER TABLE `koleksi` DISABLE KEYS */;
INSERT INTO `koleksi` VALUES ('004','Having Fun With Computer','C.V ANDI OFFSET','Abdul Kadir',2010,'600','9789792917819','Hard',348,'dipinjam'),('005','Kumpulan Tool Proteksi PC dan Jaringan','Andi','Wahana Komputer',2005,'600','9797630641','Hard',253,'dipinjam'),('005.5','Mudah dan cepat menguasai aplikasi perkantoran','Informatika Bandung','Bernard Renaldy',2010,'600','9789791153812','Hard',237,'dipinjam'),('297.1226','Ayat - ayat ekonomi syariah','Pustaka Pelajar','Dwi Suwiknyi, SEI.,MSI',2010,'600','9786028764407','Hard',320,'ada'),('320','Teori - Teori Ekonomi Politik','Pustaka Pelajar','James A. Caporaso dan David P.Levina',2008,'600','6028300071','Hard',598,'dipinjam'),('330.072','Metodologi Penelitian ekonomi','PT Rajagrafindo Persada','Muhammad Teguh',2005,'500','9794216666','Hard',258,'dipinjam'),('331.2','Mencegah Post - Power sysndrome Pascapensiun','Salemba Empat','Tarmizi Yusuf',2009,'600','9789790610507','Hard',148,'dipinjam'),('332.17','Dasar - Dasar operasi Bank : American Institute of Banking','PT RINEKA CIPTA, Jakarta','Ali, Hasymi',1991,'600','9795181793','Hard',417,'ada'),('338.04','2nd Preneurship(Melirik untung dari Bisnis Barang 2ND Tahun krisis)','C.V ANDI OFFSET','Senja Nilaisari dan Media Service',2014,'600','9789792943436','Hard',210,'dipinjam'),('346','Pembaruan Hukum Perdata','UII Press Yogyakarta(Anggota IKAPI)','M.Natsir Asnawi, S.HI., MH.',2019,'600','9786026215642','Hard',184,'dipinjam'),('346.08','Hukum Perbankan dan surat berharga','CV. BUDI UTAMA','Rani Apriani, S.E.,S.H.,M.H. & Dr. Hartanto, S.H., M.H',2019,'600','9786232092174','Hard',124,'ada'),('500','Ilmu Alamiah Dasar','Ombak','Maslikhah dan Peni Susapti',2013,'600','603258079','Hard',288,'dipinjam'),('650','Bisnis Pengantar(Konsep, strategi, dan kasus)','CAPS','drs. Sunardi, M.Si., Akt. & Anita Primastiwi, SE.,M.Sc',2012,'600','6029324105','Hard',224,'dipinjam'),('651.3','Manajemen Pelayanan Prima','ALFABETA','Doni Juni Priansa',2017,'600','9786022893288','Hard',368,'dipinjam'),('657.45','Audit Sektor Publik','Bumi Aksara','Ihyaul Ulum M.D',2009,'600','9789790105621','Hard',245,'ada'),('658.403','Sistem Informasi Manajemen','Penerbit ANDI','Tata Sutabri, S.KOM., MM',2005,'600','9797315878','Hard',300,'dipinjam'),('658.4038','Konsep dasar sistem informasi manajemen','depublish(CV Budi Utama)','Setyorini, S.KOM.,m.m',2016,'600','6024011283','Hard',216,'dipinjam'),('658.8','Pemasaran Esensi dan Aplikasi','C.V ANDI OFFSET','Fandy Tjiptono, Ph.D, Anastasia Diana',2016,'600','9789792960310','Hard',386,'dipinjam'),('658.9','Manajemen Pemasaran Jasa','ALFABETA BANDUNG','Dr. Muhammad Adam, S.E., M.B.A',2018,'600','9786022891413','Hard',142,'ada'),('813','Milea:Suara dari Dilan','Pastel Books','Pidi Baiq',2017,'700','9786020851563','Hard',360,'dipinjam');
/*!40000 ALTER TABLE `koleksi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peminjaman`
--

DROP TABLE IF EXISTS `peminjaman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peminjaman` (
  `NoPinjam` varchar(10) NOT NULL,
  `TglPinjam` date NOT NULL,
  `Petugas` varchar(18) DEFAULT NULL,
  `Anggota` varchar(10) NOT NULL,
  `TglKembali` date DEFAULT NULL,
  PRIMARY KEY (`NoPinjam`),
  KEY `Petugas` (`Petugas`),
  KEY `Anggota` (`Anggota`),
  CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`Petugas`) REFERENCES `petugas` (`NIP`),
  CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`Anggota`) REFERENCES `anggota` (`NoAnggota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peminjaman`
--

LOCK TABLES `peminjaman` WRITE;
/*!40000 ALTER TABLE `peminjaman` DISABLE KEYS */;
INSERT INTO `peminjaman` VALUES ('1','2021-11-01','196412012014091002','E020321110','2022-01-01'),('2','2021-11-05','197405092001122001','E020321113','2022-01-04'),('3','2021-11-24','198107152005011002','E020321119','2022-01-10'),('4','2021-12-11','198203052005011001','E020321108',NULL),('5','2021-11-24','198107152005011002','E020321105',NULL);
/*!40000 ALTER TABLE `peminjaman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `petugas`
--

DROP TABLE IF EXISTS `petugas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `petugas` (
  `NIP` varchar(18) NOT NULL DEFAULT '',
  `Nama` varchar(30) NOT NULL,
  `Alamat` varchar(100) NOT NULL,
  `Phone` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`NIP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `petugas`
--

LOCK TABLES `petugas` WRITE;
/*!40000 ALTER TABLE `petugas` DISABLE KEYS */;
INSERT INTO `petugas` VALUES ('196412012014091002','Syarifuddin, SE','Banjarmasin','085101160150'),('197405092001122001','Rismaniah, S.Sos','Banjarmasin','085101160150'),('198107152005011002','Asrani, S.I.Pust','Banjarmasin','085101160150'),('198203052005011001','Muhammad Thaha, S.I.Pust','Banjarmasin','085101160150');
/*!40000 ALTER TABLE `petugas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-14  2:48:51
