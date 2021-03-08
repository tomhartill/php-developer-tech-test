-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.27-MariaDB-1:10.3.27+maria~focal - mariadb.org binary distribution
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table interview.companies
CREATE TABLE IF NOT EXISTS `companies` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `credits` varchar(255) NOT NULL DEFAULT '''0''',
  `description` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  UNIQUE KEY `unique_id` (`id`),
  UNIQUE KEY `unique_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table interview.companies: ~10 rows (approximately)
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` (`id`, `active`, `name`, `credits`, `description`, `email`, `phone`, `website`) VALUES
	(1, 1, 'Tacos or Death Surveyors', '2', 'Give me tacos, or give me death. 50 cent tacos! I’ll take 30.  This will be 5 times this week and it’s only Tuesday.', 'tacotaco@tacosordeath.com', '01234 567890', 'https://www.taconsordeath.com'),
	(2, 1, 'Barbacoa Surveyors', '13', 'BARBACOA!! Shrimp tacos are tasty tacos! BARBACOA!! Tacos dorados called flautas, or taquitos, for which the tortillas are filled with pre-cooked shredded chicken, beef or barbacoa, rolled into an elongated cylinder and deep-fried until crisp. ', 'flautas@barbacoa-surveys.com', '01234 567890', 'https://www.barbacoa-surveys.com'),
	(3, 1, 'Tasty Carnitas Surveys', '3', 'Make it a double there pal. It’s raining tacos, from out of the sky, tacos, don’t even ask why. CARNITAS!! Fish tacos: lettuce or cabbage, pico de gallo, avocado and a sour cream or citrus/mayonnaise sauce, all placed on top of a corn or flour tortilla. Does guac cost extra?', 'tasty@carnitas-surveys.com', '01234 567890', 'https://www.carnitas-surveys.com'),
	(4, 1, 'El Pollo Diablo Surveys', '19', 'Ooh, with diced onions and a pinch of cilantro. Add in a few el Pastor with guac and diced onions. These tacos are lit ', 'bokbok@diablo-surveyors.com', '01234 567890', 'https://diablo-surveyors.com'),
	(5, 1, 'De Adobada Surveys', '6', 'How do you feel about hard shelled tacos? It’s long been rumored that the chupacabra is really just a crazed man who’s local taco shop went out of business. Tacos, again? This will be 5 times this week and it’s only Tuesday.', 'deadobada@deadobada.com', '01234 567890', 'https://www.deadobada.com'),
	(6, 1, 'Al Pastor Surveys', '5', 'Every day is taco ipsum tuesday. CARNITAS!! TACOS!! Josh’s taco shack is the best taco shack. Give me all your tacos. Tacos Al pastor/De Adobada are made of thin pork steaks seasoned with adobo seasoning, then skewered and overlapped on one another on a vertical rotisserie cooked and flame-broiled as it spins. ', 'al@pastor-surveys.com', '01234 567890', 'https://www.pastor-surveys.com'),
	(7, 1, 'Cholula Surveyors', '18', 'Um, Tabasco? No thanks, do you have any Cholula? BARBACOA!! Say taco one more time. BARBACOA!! Burritos are very tasty. ', 'lit@cholula-surveyors.com', '01234 567890', 'https://www.cholula-surveyors.com'),
	(8, 1, 'Carne Asada Surveys', '1', 'Tacos dorados called flautas, or taquitos, for which the tortillas are filled with pre-cooked shredded chicken, beef or barbacoa, rolled into an elongated cylinder and deep-fried until crisp. I’d have to say, those tacos are on fleek. ', 'crispy@carne-asada-surveyors.com', '01234 567890', 'https://www.carne-asada-surveyors.com'),
	(9, 0, 'Josh\'s Taco Shack', '0', 'Josh’s taco shack is the best taco shack.', 'josh@tacoshack.com', '01234 567890', 'https://www.tacoshack.com'),
	(10, 0, 'Buuuu Riiii Tooo Surveys', '99', 'I’ve been following that taco truck around all day. If you were a taco, would you eat yourself?', 'ri@burritosurveys.com', '01234 567890', 'https://www.burritosurveys.com');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;

-- Dumping structure for table interview.company_matching_settings
CREATE TABLE IF NOT EXISTS `company_matching_settings` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `company_id` int(255) NOT NULL,
  `postcodes` text NOT NULL,
  `bedrooms` text NOT NULL,
  `type` varchar(25) NOT NULL,
  UNIQUE KEY `unique_id` (`id`),
  KEY `lnk_companies_company_postcode_choices` (`company_id`) USING BTREE,
  CONSTRAINT `lnk_companies_company_postcode_choices` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table interview.company_matching_settings: ~30 rows (approximately)
/*!40000 ALTER TABLE `company_matching_settings` DISABLE KEYS */;
INSERT INTO `company_matching_settings` (`id`, `company_id`, `postcodes`, `bedrooms`, `type`) VALUES
	(1, 1, '["CF"]', '["1","2","3","4","5"]', 'building'),
	(2, 2, '["CF"]', '["2","3","4"]', 'building'),
	(3, 3, '["CF"]', '["3","4","5"]', 'building'),
	(4, 4, '["CF"]', '["2","3","4","5"]', 'building'),
	(5, 1, '["CF"]', '["1","2","3","4","5"]', 'homebuyer'),
	(6, 2, '["CF"]', '["2","3","4"]', 'homebuyer'),
	(7, 3, '["CF"]', '["3","4","5"]', 'homebuyer'),
	(8, 4, '["CF"]', '["2","3","4","5"]', 'homebuyer'),
	(9, 1, '["CF"]', '["1","2","3","4","5"]', 'valuation'),
	(10, 2, '["CF"]', '["2","3","4"]', 'valuation'),
	(11, 3, '["CF"]', '["3","4","5"]', 'valuation'),
	(12, 4, '["CF"]', '["2","3","4","5"]', 'valuation'),
	(13, 9, '["CF"]', '["1"]', 'building'),
	(14, 9, '["CF"]', '["1"]', 'homebuyer'),
	(15, 9, '["CF"]', '["1"]', 'valuation'),
	(16, 5, '["B"]', '["1","2","3","4","5"]', 'building'),
	(17, 6, '["B"]', '["2","3"]', 'building'),
	(18, 7, '["B"]', '["2","3","4","5"]', 'building'),
	(19, 8, '["B"]', '["3","4","5"]', 'building'),
	(20, 5, '["B"]', '["3","4","5"]', 'homebuyer'),
	(21, 6, '["B"]', '["2","3","4","5"]', 'homebuyer'),
	(22, 7, '["B"]', '["2","3"]', 'homebuyer'),
	(23, 8, '["B"]', '["1","2","3","4","5"]', 'homebuyer'),
	(24, 5, '["B"]', '["2","3"]', 'valuation'),
	(25, 6, '["B"]', '["3","4","5"]', 'valuation'),
	(26, 7, '["B"]', '["1","2","3","4","5"]', 'valuation'),
	(27, 8, '["B"]', '["2","3","4","5"]', 'valuation'),
	(28, 10, '["B"]', '["3","4"]', 'building'),
	(29, 10, '["B"]', '["3","4"]', 'homebuyer'),
	(30, 10, '["B"]', '["3","4"]', 'valuation');
/*!40000 ALTER TABLE `company_matching_settings` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
