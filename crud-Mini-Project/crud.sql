SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- =========================
-- DROP (اختياري) لتفادي التعارض لو الجداول موجودة
-- =========================
DROP TABLE IF EXISTS `student`;
DROP TABLE IF EXISTS `studentclass`;

-- =========================
-- Table: studentclass
-- =========================
CREATE TABLE `studentclass` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- بيانات تجريبية للـ studentclass
INSERT INTO `studentclass` (`cid`, `cname`) VALUES
(1, 'Bsc'),
(2, 'Prof'),
(3, 'Phd'),
(4, 'Msc');

-- =========================
-- Table: student
-- =========================
CREATE TABLE `student` (
  `sid` int(10) NOT NULL AUTO_INCREMENT,
  `sname` varchar(30) NOT NULL,
  `saddress` varchar(15) NOT NULL,
  `sclass` int(11) NOT NULL,
  `sphone` varchar(11) NOT NULL,
  PRIMARY KEY (`sid`),
  KEY `idx_student_sclass` (`sclass`),
  CONSTRAINT `fk_student_class`
    FOREIGN KEY (`sclass`) REFERENCES `studentclass` (`cid`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- بيانات تجريبية للطلاب
INSERT INTO `student` (`sid`, `sname`, `saddress`, `sclass`, `sphone`) VALUES
(1, 'Ali Ahmad',   'gaza',  1, '97000000001'),
(2, 'Omar Saleh',  'rafah',  2, '97000000002'),
(3, 'Noor Hasan',  'gaza',  3, '97000000003'),
(4, 'Sara Khaled', 'khan',  4, '97000000004');

COMMIT;
