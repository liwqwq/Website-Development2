/*
 Navicat Premium Data Transfer
 Source Server         : 123
 Source Server Type    : MySQL
 Source Server Version : 80043 (8.0.43)
 Source Host           : localhost:3306
 Source Schema         : charityevents_db
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Charity Dinner');
INSERT INTO `categories` VALUES (2, 'Fun Run');
INSERT INTO `categories` VALUES (3, 'Silent Auction');
INSERT INTO `categories` VALUES (4, 'Concert');
INSERT INTO `categories` VALUES (5, 'Community Event');

-- ----------------------------
-- Table structure for organizations
-- ----------------------------
DROP TABLE IF EXISTS `organizations`;
CREATE TABLE `organizations`  (
  `organization_id` int NOT NULL AUTO_INCREMENT,
  `organization_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `contact_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of organizations
-- ----------------------------
INSERT INTO `organizations` VALUES (1, 'Love Charity Foundation', 'Dedicated to helping children in need with education and medical care', 'Phone: 02-12345678 | Email: contact@lovecharity.org');
INSERT INTO `organizations` VALUES (2, 'Green Action Alliance', 'Protecting the environment for a better planet', 'Phone: 02-87654321 | Email: info@greenaction.org.au');
INSERT INTO `organizations` VALUES (3, 'Community Care Center', 'Providing support and assistance to the community', 'Phone: 02-55556666 | Email: info@communitycare.org');

-- ----------------------------
-- Table structure for events
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events`  (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `event_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `event_datetime` datetime NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ticket_price` decimal(10, 2) NULL DEFAULT 0.00,
  `goal_amount` decimal(12, 2) NOT NULL,
  `current_amount` decimal(12, 2) NULL DEFAULT 0.00,
  `category_id` int NULL DEFAULT NULL,
  `organization_id` int NULL DEFAULT NULL,
  `is_active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`event_id`) USING BTREE,
  INDEX `category_id`(`category_id` ASC) USING BTREE,
  INDEX `organization_id`(`organization_id` ASC) USING BTREE,
  CONSTRAINT `events_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `events_ibfk_2` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`organization_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of events
-- ----------------------------
INSERT INTO `events` VALUES (1, 'Annual Charity Gala', 'Grand charity fundraising dinner featuring performances and auction', '2025-10-15 18:00:00', 'Sydney International Convention Centre', 150.00, 50000.00, 32500.00, 1, 1, 1);
INSERT INTO `events` VALUES (2, 'Hope Fun Run', '5km fun run to raise funds for children cancer research', '2025-11-20 08:00:00', 'Centennial Park', 25.00, 20000.00, 12500.00, 2, 1, 1);
INSERT INTO `events` VALUES (3, 'Classical Music Night', 'Symphony charity concert featuring classical masterpieces', '2025-12-05 19:30:00', 'Sydney Opera House', 80.00, 30000.00, 18000.00, 4, 1, 1);
INSERT INTO `events` VALUES (4, 'Eco Art Auction', 'Silent auction of artworks and collectibles', '2025-09-30 17:00:00', 'Melbourne Arts Centre', 0.00, 15000.00, 8500.00, 3, 2, 1);
INSERT INTO `events` VALUES (5, 'Beach Cleanup Day', 'Community beach cleaning volunteer event', '2025-10-08 09:00:00', 'Bondi Beach', 0.00, 5000.00, 3200.00, 5, 2, 1);
INSERT INTO `events` VALUES (6, 'Winter Charity Dinner', 'Cozy indoor fundraising dinner', '2025-06-25 19:00:00', 'Crown Melbourne', 120.00, 25000.00, 15200.00, 1, 1, 1);
INSERT INTO `events` VALUES (7, 'City Marathon', 'Full marathon charity event', '2025-08-12 06:00:00', 'Sydney Harbour Bridge', 45.00, 40000.00, 28500.00, 2, 1, 1);
INSERT INTO `events` VALUES (8, 'Jazz Night', 'Live jazz performance fundraising event', '2025-07-18 20:00:00', 'Brisbane Concert Hall', 60.00, 18000.00, 11200.00, 4, 2, 1);

SET FOREIGN_KEY_CHECKS = 1;