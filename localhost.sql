-- phpMyAdmin SQL Dump
-- version 3.5.8.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Ven 29 Janvier 2016 à 14:41
-- Version du serveur: 5.5.32
-- Version de PHP: 5.4.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `django`
--
CREATE DATABASE `django` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `django`;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Contenu de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add question', 1, 'add_question'),
(2, 'Can change question', 1, 'change_question'),
(3, 'Can delete question', 1, 'delete_question'),
(4, 'Can add choice', 2, 'add_choice'),
(5, 'Can change choice', 2, 'change_choice'),
(6, 'Can delete choice', 2, 'delete_choice'),
(7, 'Can add image', 3, 'add_image'),
(8, 'Can change image', 3, 'change_image'),
(9, 'Can delete image', 3, 'delete_image'),
(10, 'Can add content', 4, 'add_content'),
(11, 'Can change content', 4, 'change_content'),
(12, 'Can delete content', 4, 'delete_content'),
(13, 'Can add video', 5, 'add_video'),
(14, 'Can change video', 5, 'change_video'),
(15, 'Can delete video', 5, 'delete_video'),
(16, 'Can add log entry', 6, 'add_logentry'),
(17, 'Can change log entry', 6, 'change_logentry'),
(18, 'Can delete log entry', 6, 'delete_logentry'),
(19, 'Can add permission', 7, 'add_permission'),
(20, 'Can change permission', 7, 'change_permission'),
(21, 'Can delete permission', 7, 'delete_permission'),
(22, 'Can add group', 8, 'add_group'),
(23, 'Can change group', 8, 'change_group'),
(24, 'Can delete group', 8, 'delete_group'),
(25, 'Can add user', 9, 'add_user'),
(26, 'Can change user', 9, 'change_user'),
(27, 'Can delete user', 9, 'delete_user'),
(28, 'Can add content type', 10, 'add_contenttype'),
(29, 'Can change content type', 10, 'change_contenttype'),
(30, 'Can delete content type', 10, 'delete_contenttype'),
(31, 'Can add session', 11, 'add_session'),
(32, 'Can change session', 11, 'change_session'),
(33, 'Can delete session', 11, 'delete_session');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$24000$rtb5ZTsuhriO$fVoaOD+bg6Cl/Y0zY+0yxHwSb5PJ7BWUxwtYeWpI4YI=', '2016-01-27 09:04:23', 1, 'admin', '', '', 'smeron@lesechos.fr', 1, 1, '2016-01-27 09:04:02');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2016-01-28 13:20:17', '1', 'first', 1, 'Added. Added choice "choix 1". Added choice "choix 2". Added choice "choix 3".', 1, 1),
(2, '2016-01-29 10:36:51', '1', 'Connaissez-vous la fleur de lotus ?', 1, 'Added.', 4, 1),
(3, '2016-01-29 10:36:56', '1', 'Connaissez-vous la fleur de lotus ?', 2, 'No fields changed.', 4, 1),
(4, '2016-01-29 10:37:12', '1', 'Fleur de lotus', 1, 'Added.', 3, 1),
(5, '2016-01-29 10:37:15', '1', 'Connaissez-vous la fleur de lotus ?', 2, 'Changed image.', 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(6, 'admin', 'logentry'),
(8, 'auth', 'group'),
(7, 'auth', 'permission'),
(9, 'auth', 'user'),
(10, 'contenttypes', 'contenttype'),
(2, 'polls', 'choice'),
(4, 'polls', 'content'),
(3, 'polls', 'image'),
(1, 'polls', 'question'),
(5, 'polls', 'video'),
(11, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Contenu de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2016-01-25 11:34:39'),
(2, 'auth', '0001_initial', '2016-01-25 11:34:42'),
(3, 'admin', '0001_initial', '2016-01-25 11:34:43'),
(4, 'admin', '0002_logentry_remove_auto_add', '2016-01-25 11:34:43'),
(5, 'contenttypes', '0002_remove_content_type_name', '2016-01-25 11:34:43'),
(6, 'auth', '0002_alter_permission_name_max_length', '2016-01-25 11:34:44'),
(7, 'auth', '0003_alter_user_email_max_length', '2016-01-25 11:34:44'),
(8, 'auth', '0004_alter_user_username_opts', '2016-01-25 11:34:44'),
(9, 'auth', '0005_alter_user_last_login_null', '2016-01-25 11:34:44'),
(10, 'auth', '0006_require_contenttypes_0002', '2016-01-25 11:34:44'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2016-01-25 11:34:44'),
(12, 'polls', '0001_initial', '2016-01-25 11:34:45'),
(13, 'polls', '0002_auto_20151221_1007', '2016-01-25 11:34:46'),
(14, 'polls', '0003_auto_20151221_1116', '2016-01-25 11:34:47'),
(15, 'polls', '0004_auto_20151221_1240', '2016-01-25 11:34:47'),
(16, 'polls', '0005_content_slug', '2016-01-25 11:34:47'),
(17, 'polls', '0006_auto_20151221_1605', '2016-01-25 11:34:47'),
(18, 'polls', '0007_video', '2016-01-25 11:34:47'),
(19, 'polls', '0008_auto_20151222_0804', '2016-01-25 11:34:48'),
(20, 'polls', '0009_auto_20151222_1140', '2016-01-25 11:34:51'),
(21, 'polls', '0010_video_resume', '2016-01-25 11:34:51'),
(22, 'sessions', '0001_initial', '2016-01-25 11:34:51'),
(23, 'polls', '0011_auto_20160129_1033', '2016-01-29 10:33:30'),
(24, 'polls', '0012_auto_20160129_1034', '2016-01-29 10:34:47'),
(25, 'polls', '0013_auto_20160129_1036', '2016-01-29 10:36:42');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('xyohfide2rhzb08q0y1fqht7aiddknaj', 'MWZkMWIzYTY1NDBkMTc3Yjk2MjhmZWJjOGUzOGRiOGIwOGE1ZTM5ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjA0YTJhYWE4YTEyMDM5NzdlNzVjZjJjMzMzYzBjNjUzM2RmODA1OTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-02-10 09:04:23');

-- --------------------------------------------------------

--
-- Structure de la table `polls_choice`
--

CREATE TABLE IF NOT EXISTS `polls_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `choice_text` varchar(200) NOT NULL,
  `votes` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `polls_choice_7aa0f6ee` (`question_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `polls_choice`
--

INSERT INTO `polls_choice` (`id`, `choice_text`, `votes`, `question_id`, `created_at`, `updated_at`) VALUES
(1, 'choix 1', 0, 1, '2016-01-28 13:20:17', '2016-01-28 13:20:17'),
(2, 'choix 2', 0, 1, '2016-01-28 13:20:17', '2016-01-28 13:20:17'),
(3, 'choix 3', 0, 1, '2016-01-28 13:20:17', '2016-01-28 13:20:17');

-- --------------------------------------------------------

--
-- Structure de la table `polls_content`
--

CREATE TABLE IF NOT EXISTS `polls_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `resume` varchar(500) NOT NULL,
  `text` longtext NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `polls_content_slug_0b9c5720_uniq` (`slug`),
  KEY `polls_content_f33175e6` (`image_id`),
  KEY `polls_content_2dbcba41` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `polls_content`
--

INSERT INTO `polls_content` (`id`, `title`, `resume`, `text`, `image_id`, `created_at`, `updated_at`, `slug`) VALUES
(1, 'Connaissez-vous la fleur de lotus ?', 'Lors de notre visite au jardin botanique de Pamplemousse, nous avons rencontré de superbes fleurs de lotus et nénuphars :', '', 1, '2016-01-29 10:36:51', '2016-01-29 10:37:15', 'connaissez-vous-la-fleur-de-lotus');

-- --------------------------------------------------------

--
-- Structure de la table `polls_image`
--

CREATE TABLE IF NOT EXISTS `polls_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `upload` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `polls_image`
--

INSERT INTO `polls_image` (`id`, `title`, `upload`, `created_at`, `updated_at`) VALUES
(1, 'Fleur de lotus', 'images/IMG_3870.jpg', '2016-01-29 10:37:12', '2016-01-29 10:37:12');

-- --------------------------------------------------------

--
-- Structure de la table `polls_question`
--

CREATE TABLE IF NOT EXISTS `polls_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) NOT NULL,
  `pub_date` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `polls_question`
--

INSERT INTO `polls_question` (`id`, `question_text`, `pub_date`, `created_at`, `updated_at`) VALUES
(1, 'first', '2016-01-28 13:20:15', '2016-01-28 13:20:17', '2016-01-28 13:20:17');

-- --------------------------------------------------------

--
-- Structure de la table `polls_video`
--

CREATE TABLE IF NOT EXISTS `polls_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `upload` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `resume` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `polls_choice`
--
ALTER TABLE `polls_choice`
  ADD CONSTRAINT `polls_choice_question_id_c5b4b260_fk_polls_question_id` FOREIGN KEY (`question_id`) REFERENCES `polls_question` (`id`);

--
-- Contraintes pour la table `polls_content`
--
ALTER TABLE `polls_content`
  ADD CONSTRAINT `polls_content_image_id_66642e71_fk_polls_image_id` FOREIGN KEY (`image_id`) REFERENCES `polls_image` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
