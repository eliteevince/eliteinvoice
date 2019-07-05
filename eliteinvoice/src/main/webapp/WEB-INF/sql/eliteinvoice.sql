-- Adminer 4.1.0 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` int(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `postcode` varchar(100) NOT NULL,
  `logo_image` varchar(100) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) NOT NULL,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(10) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `company_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `company_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `company` (`id`, `name`, `email`, `phone`, `address`, `city`, `state`, `country`, `postcode`, `logo_image`, `created_on`, `created_by`, `modified_on`, `modified_by`, `is_deleted`) VALUES
(1,	'Company1',	'email2@test.com',	8866,	'Address',	'city',	'state',	'country',	'810',	'Koala.jpg',	'2015-04-08 15:03:05',	1,	'2015-04-21 13:20:52',	1,	0),
(2,	'Company2',	'company2@gmail.com',	0,	'test',	'NewYork',	'NewYork',	'USA',	'test123',	'Desert.jpg',	'2015-04-10 06:04:53',	1,	'2015-04-21 13:29:20',	1,	0),
(4,	'gaurav',	'test@test.com',	0,	'XYZ',	'London',	'New York',	'USA',	'810',	'skype.txt',	'2015-04-10 10:53:11',	1,	'2015-04-21 13:29:20',	1,	0),
(5,	'Company3',	'company3@gmail.com',	898989889,	'XYZ',	'New York',	'NewYork',	'USA',	'810',	'Desert.jpg',	'2015-04-15 06:40:02',	1,	'2015-04-21 13:29:20',	1,	0),
(8,	'company5',	'dev7@eliteevince.com',	8989888,	'gggggggg',	'Sydeny',	'Sydeny',	'Australiya',	'8956',	'Jellyfish.jpg',	'2015-04-15 08:42:46',	1,	'2015-04-21 13:29:20',	1,	0),
(9,	'Company6',	'company6@gmail.com',	6666666,	'6666',	'New York',	'New York',	'USA',	'666666',	'Koala.jpg',	'2015-04-22 07:24:56',	1,	'2015-04-22 13:44:04',	1,	0);

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` int(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `postcode` varchar(100) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) NOT NULL,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(10) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `customer` (`id`, `first_name`, `last_name`, `email`, `phone`, `address`, `city`, `state`, `country`, `postcode`, `created_on`, `created_by`, `modified_on`, `modified_by`, `is_deleted`) VALUES
(1,	'First Name',	'Last Name',	'customer1@gmail.com',	8866,	'XYZ',	'New York',	'New York',	'USA',	'810',	'2015-04-08 15:04:44',	1,	'2015-04-21 13:29:41',	1,	0),
(2,	'FirstName2',	'LastName2',	'property@boulle.co.uk',	542,	'XYZ',	'London',	'New York',	'USA',	'W11 4QG',	'2015-04-10 06:19:21',	1,	'2015-04-21 13:29:41',	1,	0),
(3,	'First Name 3',	'Last Name3',	'customer3@gmail.com',	33333,	'33333',	'London',	'New York',	'USA',	'3333',	'2015-04-21 12:29:46',	1,	'2015-04-22 04:58:42',	1,	1);

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ref_no` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `due_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `discount` decimal(10,2) NOT NULL,
  `shipping` varchar(100) NOT NULL,
  `notes` varchar(500) DEFAULT NULL,
  `fk_invoice_type_id` int(10) NOT NULL,
  `fk_invoice_status_id` int(10) NOT NULL,
  `fk_customer_id` int(10) NOT NULL,
  `fk_company_id` int(10) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) NOT NULL,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(10) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ref_no` (`ref_no`),
  KEY `fk_invoice_type_id` (`fk_invoice_type_id`),
  KEY `fk_invoice_status_id` (`fk_invoice_status_id`),
  KEY `fk_customer_id` (`fk_customer_id`),
  KEY `fk_company_id` (`fk_company_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_invoice_type_id`) REFERENCES `invoicetype` (`id`),
  CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`fk_invoice_status_id`) REFERENCES `invoicestatus` (`id`),
  CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `invoice_ibfk_5` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `invoice_ibfk_6` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  CONSTRAINT `invoice_ibfk_7` FOREIGN KEY (`fk_company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `invoice` (`id`, `ref_no`, `date`, `due_date`, `discount`, `shipping`, `notes`, `fk_invoice_type_id`, `fk_invoice_status_id`, `fk_customer_id`, `fk_company_id`, `created_on`, `created_by`, `modified_on`, `modified_by`, `is_deleted`) VALUES
(1,	'77',	'2015-04-15 13:20:28',	'2015-04-15 13:20:28',	7.00,	'free',	'',	1,	1,	1,	1,	'2015-04-08 15:05:56',	1,	'2015-04-15 13:20:28',	1,	0),
(2,	'7',	'2015-04-22 14:46:21',	'2015-04-08 15:09:48',	7.00,	'free',	'',	1,	1,	1,	1,	'2015-04-08 15:09:48',	1,	'2015-04-22 14:46:21',	1,	0),
(3,	'34',	'2015-04-22 14:46:22',	'2015-04-08 15:11:34',	7.00,	'free',	'',	1,	1,	1,	1,	'2015-04-08 15:11:34',	1,	'2015-04-22 14:46:22',	1,	0),
(6,	'25',	'2015-04-21 13:59:34',	'2015-04-11 12:23:59',	1.20,	'no charge',	'',	1,	1,	2,	2,	'2015-04-10 10:36:25',	1,	'2015-04-21 13:59:34',	1,	0),
(8,	'18',	'2015-04-21 13:59:34',	'2015-04-10 14:11:33',	5.50,	'no charge',	'',	2,	2,	2,	4,	'2015-04-10 10:42:43',	1,	'2015-04-21 13:59:34',	1,	0),
(9,	'1',	'2015-04-22 14:46:22',	'2015-04-22 06:24:39',	1.20,	'no charge',	'',	2,	2,	1,	4,	'2015-04-22 06:24:39',	1,	'2015-04-22 14:46:22',	1,	0),
(10,	'2',	'2015-04-22 14:46:22',	'2015-04-22 06:25:03',	2.00,	'no charge',	'',	2,	1,	1,	1,	'2015-04-22 06:25:03',	1,	'2015-04-22 14:46:22',	1,	0),
(11,	'3',	'2015-04-22 14:46:22',	'2015-04-22 06:25:19',	0.00,	'no charge',	'',	1,	1,	1,	1,	'2015-04-22 06:25:19',	1,	'2015-04-22 14:46:22',	1,	0),
(12,	'4',	'2015-04-22 14:46:22',	'2015-04-22 06:25:33',	0.00,	'no charge',	'',	1,	1,	1,	1,	'2015-04-22 06:25:33',	1,	'2015-04-22 14:46:22',	1,	0),
(13,	'5',	'2015-04-23 06:39:58',	'2015-04-22 06:25:48',	0.00,	'no charge',	'',	1,	1,	1,	1,	'2015-04-22 06:25:48',	1,	'2015-04-23 06:39:58',	1,	0),
(14,	'9',	'2015-04-23 06:39:58',	'2015-04-22 06:26:08',	0.00,	'no charge',	'',	1,	1,	1,	1,	'2015-04-22 06:26:08',	1,	'2015-04-23 06:39:58',	1,	0),
(15,	'10',	'2015-04-23 06:39:58',	'2015-04-22 06:26:18',	0.00,	'no charge',	'',	1,	1,	1,	1,	'2015-04-22 06:26:18',	1,	'2015-04-23 06:39:58',	1,	0),
(16,	'11',	'2015-04-24 05:04:09',	'2015-04-24 05:04:09',	0.00,	'no charge',	NULL,	1,	1,	1,	1,	'2015-04-22 06:26:31',	1,	'2015-04-24 05:04:09',	1,	0);

DROP TABLE IF EXISTS `invoiceitem`;
CREATE TABLE `invoiceitem` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `fk_product_id` int(10) NOT NULL,
  `fk_taxrate_id` int(10) NOT NULL,
  `fk_invoice_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_id` (`fk_product_id`),
  KEY `fk_taxrate_id` (`fk_taxrate_id`),
  KEY `fk_invoice_id` (`fk_invoice_id`),
  CONSTRAINT `invoiceitem_ibfk_1` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `invoiceitem_ibfk_2` FOREIGN KEY (`fk_taxrate_id`) REFERENCES `taxrate` (`id`),
  CONSTRAINT `invoiceitem_ibfk_3` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `invoiceitem` (`id`, `price`, `quantity`, `fk_product_id`, `fk_taxrate_id`, `fk_invoice_id`) VALUES
(4,	111,	11,	1,	1,	1),
(5,	555,	55,	1,	1,	1),
(6,	666,	66,	1,	1,	1),
(7,	777,	77,	1,	1,	1),
(8,	888,	88,	1,	1,	2),
(9,	999,	99,	1,	1,	2);

DROP TABLE IF EXISTS `invoicestatus`;
CREATE TABLE `invoicestatus` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `invoicestatus` (`id`, `name`) VALUES
(1,	'status1'),
(2,	'Status2');

DROP TABLE IF EXISTS `invoicetype`;
CREATE TABLE `invoicetype` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `invoicetype` (`id`, `name`) VALUES
(1,	'type1'),
(2,	'type2');

DROP TABLE IF EXISTS `invoice_product`;
CREATE TABLE `invoice_product` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fk_invoice_id` int(10) NOT NULL,
  `fk_product_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_id` (`fk_invoice_id`),
  KEY `fk_product_id` (`fk_product_id`),
  CONSTRAINT `invoice_product_ibfk_1` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoice` (`id`),
  CONSTRAINT `invoice_product_ibfk_2` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `invoice_product` (`id`, `fk_invoice_id`, `fk_product_id`) VALUES
(1,	1,	8),
(2,	1,	9),
(3,	1,	12),
(4,	1,	13);

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) NOT NULL,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(10) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `product` (`id`, `name`, `price`, `created_on`, `created_by`, `modified_on`, `modified_by`, `is_deleted`) VALUES
(1,	'Product1',	77,	'2015-04-09 13:36:14',	1,	'2015-04-23 08:37:11',	1,	0),
(2,	'product2',	36,	'2015-04-09 14:18:13',	1,	'2015-04-23 08:37:11',	1,	0),
(3,	'item',	546,	'2015-04-10 14:36:33',	1,	'2015-04-23 08:37:11',	1,	0),
(4,	'item',	546,	'2015-04-10 14:36:33',	1,	'2015-04-23 08:37:11',	1,	0),
(5,	'rerr',	45,	'2015-04-10 14:36:51',	1,	'2015-04-23 08:37:11',	1,	0),
(6,	'product23',	23,	'2015-04-10 14:37:15',	1,	'2015-04-23 08:37:11',	1,	0),
(7,	'product23',	23,	'2015-04-10 14:37:15',	1,	'2015-04-23 08:37:11',	1,	0),
(8,	'mobile',	45000,	'2015-04-10 14:38:07',	1,	'2015-04-23 08:37:11',	1,	0),
(9,	'Laptop',	50000,	'2015-04-10 14:38:27',	1,	'2015-04-23 08:37:11',	1,	0),
(10,	'iPhone 6s',	50000,	'2015-04-15 06:41:50',	1,	'2015-04-23 08:37:11',	1,	0),
(11,	'iPhone 6s',	50000,	'2015-04-15 06:42:54',	1,	'2015-04-23 08:37:11',	1,	0),
(12,	'hoodies',	2000,	'2015-04-15 06:43:28',	1,	'2015-04-23 08:37:11',	1,	0),
(13,	'Bag',	1500,	'2015-04-15 11:34:01',	1,	'2015-04-23 08:37:11',	1,	0);

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `role` (`id`, `name`) VALUES
(1,	'role1');

DROP TABLE IF EXISTS `taxrate`;
CREATE TABLE `taxrate` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `rate` int(10) NOT NULL,
  `fk_tax_rate_type_id` int(10) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) NOT NULL,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(10) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `fk_tax_rate_type_id` (`fk_tax_rate_type_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `taxrate_ibfk_1` FOREIGN KEY (`fk_tax_rate_type_id`) REFERENCES `taxratetype` (`id`),
  CONSTRAINT `taxrate_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `taxrate_ibfk_3` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `taxrate` (`id`, `name`, `rate`, `fk_tax_rate_type_id`, `created_on`, `created_by`, `modified_on`, `modified_by`, `is_deleted`) VALUES
(1,	'Taxrate1',	11,	2,	'2015-04-09 08:48:34',	1,	'2015-04-21 14:00:45',	1,	0),
(2,	'name',	65,	1,	'2015-04-09 13:08:37',	1,	'2015-04-21 14:00:45',	1,	0),
(3,	'JMD',	7,	2,	'2015-04-09 13:12:21',	1,	'2015-04-15 12:49:27',	1,	0),
(4,	'bhai',	34,	2,	'2015-04-09 14:37:25',	1,	'2015-04-21 14:00:45',	1,	0);

DROP TABLE IF EXISTS `taxratetype`;
CREATE TABLE `taxratetype` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `taxratetype` (`id`, `name`) VALUES
(1,	'Fixed'),
(2,	'Percentage');

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `fk_role_id` int(10) NOT NULL,
  `last_modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `fk_role_id` (`fk_role_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`fk_role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `user` (`id`, `username`, `password`, `fk_role_id`, `last_modified_on`, `is_deleted`) VALUES
(1,	'user1',	'password',	1,	'2015-04-15 13:29:17',	0),
(2,	'admin',	'admin',	1,	'2015-04-21 14:00:34',	0);

-- 2015-04-24 07:24:54
