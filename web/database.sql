SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


-- --------------------------------------------------------


CREATE TABLE IF NOT EXISTS `ninux_cp_content` (
  `id` mediumint(9) NOT NULL auto_increment,
  `item_id` varchar(100) NOT NULL,
  `title` varchar(250) NOT NULL,
  `file` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;


INSERT INTO `ninux_cp_content` (`id`, `item_id`, `title`, `file`) VALUES
(1, 'home', '', 'home.tpl'),
(2, 'config_page', 'Pagina di configurazione del device', 'config_page.tpl'),
(3, 'editor', 'Editor di configurazione del device', 'editor.tpl'),
(4, 'personal', 'Configurazioni personali', 'personal.tpl'),
(5, 'register', 'Registrazione', 'register.tpl'),
(6, 'reset_password', 'Reimposta password', 'reset_password.tpl'),
(7, 'login', 'Accedi all''area personale', 'login.tpl');

-- --------------------------------------------------------


CREATE TABLE IF NOT EXISTS `ninux_cp_menu` (
  `id` mediumint(9) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `title` varchar(100) NOT NULL,
  `link` varchar(256) NOT NULL,
  `item_id` varchar(50) NOT NULL,
  `position` enum('top-left','top-right') NOT NULL,
  `order` tinyint(4) NOT NULL,
  `need_login` enum('0','1') NOT NULL default '0',
  `is_login_btn` enum('0','1') NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;


INSERT INTO `ninux_cp_menu` (`id`, `name`, `title`, `link`, `item_id`, `position`, `order`, `need_login`, `is_login_btn`) VALUES
(1, 'Home', 'Pagina principale', '', 'home', 'top-left', 1, '0', '0'),
(2, 'Configurazione del device', 'Pagina di configurazione del device', '', 'config_page', 'top-left', 2, '0', '0'),
(3, 'Editor', 'Editor delle configurazioni', '', 'editor', 'top-left', 3, '0', '0'),
(4, 'Accedi', 'Accedi all''area personale', '', 'login', 'top-right', 1, '0', '1'),
(5, 'Le mie configurazioni', 'Vai all''area personale', '', 'personal', 'top-right', 1, '1', '0'),
(6, 'Esci', 'Esci dall''area personale', '?logout=true', 'logout', 'top-right', 2, '1', '0');

-- --------------------------------------------------------


CREATE TABLE IF NOT EXISTS `ninux_cp_personal_configs` (
  `id` mediumint(9) NOT NULL auto_increment,
  `user_id` mediumint(9) NOT NULL,
  `session_id` varchar(100) NOT NULL,
  `title` varchar(500) NOT NULL,
  `config` text NOT NULL,
  `is_temp` enum('0','1') NOT NULL,
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `ninux_cp_users` (
  `id` mediumint(9) NOT NULL auto_increment,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `token` text NOT NULL,
  `is_active` enum('0','1') NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
