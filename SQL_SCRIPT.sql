CREATE TABLE  `RECEIPTS` (
	`receipt_id` int AUTO_INCREMENT NOT NULL AUTO_INCREMENT UNIQUE,
	`user_id` varchar(200) NOT NULL,
	`bonus_points_earned` decimal(10,0) NOT NULL,
	`bonus_points_earned_reason` varchar(200) NOT NULL,
	`create_date` date NOT NULL,
	`date_scanned` timestamp NOT NULL,
	`finished_date` timestamp NOT NULL,
	`modify_date` timestamp NOT NULL,
	`points_awarded_date` timestamp NOT NULL,
	`points_earned` decimal(10,0) NOT NULL,
	`purchase_date` date NOT NULL,
	`purchased_item_count` int NOT NULL,
	`reward_receipt_status` varchar(200) NOT NULL,
	`total_spent` decimal(10,0) NOT NULL,
	`name` varchar(200) NOT NULL,
	PRIMARY KEY (`receipt_id`)
);

CREATE TABLE IF NOT EXISTS `USERS` (
	`user_id` int AUTO_INCREMENT NOT NULL AUTO_INCREMENT UNIQUE,
	`active` tinyint NOT NULL,
	`created_date` date NOT NULL,
	`last_login` timestamp NOT NULL,
	`role` varchar(200) NOT NULL,
	`sign_up_source` varchar(200) NOT NULL,
	`state` varchar(200) NOT NULL,
	PRIMARY KEY (`user_id`)
);

CREATE TABLE IF NOT EXISTS `Items` (
	`receipt_item_id` int AUTO_INCREMENT NOT NULL AUTO_INCREMENT UNIQUE DEFAULT '',
	`receipt_id` varchar(200) NOT NULL,
	`barcode` varchar(200) NOT NULL,
	`description` varchar(200) NOT NULL DEFAULT '',
	PRIMARY KEY (`receipt_item_id`)
);

CREATE TABLE IF NOT EXISTS `CPG_BRANDS` (
	`cpg_id` int AUTO_INCREMENT NOT NULL AUTO_INCREMENT UNIQUE DEFAULT '',
	`barcode` varchar(200) NOT NULL DEFAULT '',
	PRIMARY KEY (`cpg_id`)
);

CREATE TABLE IF NOT EXISTS `BRANDS` (
	`brand_id` int AUTO_INCREMENT NOT NULL AUTO_INCREMENT UNIQUE DEFAULT '',
	`barcode` varchar(200) NOT NULL,
	`category` varchar(200) NOT NULL DEFAULT '',
	`category_code` varchar(200) NOT NULL DEFAULT '',
	`name` varchar(200) NOT NULL DEFAULT '',
	`top_brand` tinyint NOT NULL DEFAULT '',
	`brand_code` varchar(200) NOT NULL DEFAULT '',
	`cpg_id` varchar(200) NOT NULL DEFAULT '',
	`user_id` varchar(200) NOT NULL DEFAULT '',
	PRIMARY KEY (`brand_id`)
);

ALTER TABLE `RECEIPTS` ADD CONSTRAINT `RECEIPTS_fk1` FOREIGN KEY (`user_id`) REFERENCES `USERS`(`user_id`);

ALTER TABLE `RECEIPTS` ADD CONSTRAINT `RECEIPTS_fk14` FOREIGN KEY (`name`) REFERENCES `BRANDS`(`name`);

ALTER TABLE `Items` ADD CONSTRAINT `Items_fk1` FOREIGN KEY (`receipt_id`) REFERENCES `RECEIPTS`(`receipt_id`);

ALTER TABLE `Items` ADD CONSTRAINT `Items_fk2` FOREIGN KEY (`barcode`) REFERENCES `BRANDS`(`barcode`);

ALTER TABLE `BRANDS` ADD CONSTRAINT `BRANDS_fk7` FOREIGN KEY (`cpg_id`) REFERENCES `CPG_BRANDS`(`cpg_id`);

ALTER TABLE `BRANDS` ADD CONSTRAINT `BRANDS_fk8` FOREIGN KEY (`user_id`) REFERENCES `USERS`(`user_id`);
