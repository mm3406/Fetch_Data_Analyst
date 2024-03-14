CREATE TABLE `USERS` (
    `user_id` int AUTO_INCREMENT,
    `active` tinyint NOT NULL,
    `created_date` date NOT NULL,
    `last_login` timestamp NOT NULL,
    `role` varchar(200) NOT NULL,
    `sign_up_source` varchar(200) NOT NULL,
    `state` varchar(200) NOT NULL,
    PRIMARY KEY (`user_id`)
);

CREATE TABLE `RECEIPTS` (
    `receipt_id` int AUTO_INCREMENT,
    `user_id` int NOT NULL,
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
    PRIMARY KEY (`receipt_id`),
    CONSTRAINT `fk_receipts_users` FOREIGN KEY (`user_id`) REFERENCES `USERS`(`user_id`)
);

CREATE TABLE `CPG_BRANDS` (
    `cpg_id` int AUTO_INCREMENT,
    `barcode` varchar(200) NOT NULL DEFAULT '',
    PRIMARY KEY (`cpg_id`)
);

CREATE TABLE `BRANDS` (
    `brand_id` int AUTO_INCREMENT,
    `barcode` varchar(200) NOT NULL,
    `category` varchar(200) NOT NULL DEFAULT '',
    `category_code` varchar(200) NOT NULL DEFAULT '',
    `name` varchar(200) NOT NULL DEFAULT '',
    `top_brand` tinyint NOT NULL DEFAULT 0,
    `brand_code` varchar(200) NOT NULL DEFAULT '',
    `cpg_id` int NOT NULL,
    `user_id` int NOT NULL DEFAULT 0,
    PRIMARY KEY (`brand_id`),
    CONSTRAINT `fk_brands_cpg_brands` FOREIGN KEY (`cpg_id`) REFERENCES `CPG_BRANDS`(`cpg_id`),
    CONSTRAINT `fk_brands_users` FOREIGN KEY (`user_id`) REFERENCES `USERS`(`user_id`)
);

CREATE TABLE `ITEMS` (
    `receipt_item_id` int AUTO_INCREMENT,
    `receipt_id` int NOT NULL,
    `barcode` varchar(200) NOT NULL,
    `description` varchar(200) NOT NULL DEFAULT '',
    PRIMARY KEY (`receipt_item_id`),
    CONSTRAINT `fk_items_receipts` FOREIGN KEY (`receipt_id`) REFERENCES `RECEIPTS`(`receipt_id`),
    CONSTRAINT `fk_items_brands` FOREIGN KEY (`barcode`) REFERENCES `BRANDS`(`barcode`)
);
