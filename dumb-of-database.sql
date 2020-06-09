/*
SQLyog Ultimate v12.4.1 (64 bit)
MySQL - 10.1.38-MariaDB : Database - ims-openmeet
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ims-openmeet` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ims-openmeet`;

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) NOT NULL,
  `inserted` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `additionalname` varchar(255) DEFAULT NULL,
  `comment` text,
  `country` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `address` */

insert  into `address`(`id`,`deleted`,`inserted`,`updated`,`additionalname`,`comment`,`country`,`email`,`fax`,`phone`,`street`,`town`,`zip`) values 
(1,'\0',NULL,NULL,NULL,NULL,'US','iwymega@gmail.com',NULL,NULL,NULL,NULL,NULL),
(2,'\0',NULL,NULL,NULL,NULL,'UK','yankek@gmail.com',NULL,NULL,NULL,NULL,NULL),
(3,'\0',NULL,NULL,NULL,NULL,'','yankek8@gmail.com',NULL,NULL,NULL,NULL,NULL),
(4,'\0',NULL,NULL,NULL,NULL,'','megantarawayan939@gmail.com',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `appointment` */

DROP TABLE IF EXISTS `appointment`;

CREATE TABLE `appointment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) NOT NULL,
  `inserted` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `is_connected_event` bit(1) NOT NULL,
  `description` text,
  `app_end` datetime DEFAULT NULL,
  `etag` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `icalId` varchar(255) DEFAULT NULL,
  `isdaily` bit(1) DEFAULT NULL,
  `ismonthly` bit(1) DEFAULT NULL,
  `isweekly` bit(1) DEFAULT NULL,
  `isyearly` bit(1) DEFAULT NULL,
  `language_id` bigint(20) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `is_password_protected` bit(1) NOT NULL,
  `reminder` varchar(20) DEFAULT NULL,
  `is_reminder_email_send` bit(1) NOT NULL,
  `app_start` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `calendar_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_id` (`calendar_id`),
  KEY `user_id` (`user_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`calendar_id`) REFERENCES `om_calendar` (`id`),
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `om_user` (`id`),
  CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `appointment` */

/*Table structure for table `chat` */

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_name` varchar(255) DEFAULT NULL,
  `message` text,
  `need_moderation` bit(1) NOT NULL,
  `sent` datetime DEFAULT NULL,
  `from_user_id` bigint(20) DEFAULT NULL,
  `to_room_id` bigint(20) DEFAULT NULL,
  `to_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_room_id` (`to_room_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `om_user` (`id`),
  CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`to_room_id`) REFERENCES `room` (`id`),
  CONSTRAINT `chat_ibfk_3` FOREIGN KEY (`to_user_id`) REFERENCES `om_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `chat` */

insert  into `chat`(`id`,`from_name`,`message`,`need_moderation`,`sent`,`from_user_id`,`to_room_id`,`to_user_id`) values 
(1,'firstname lastname','<blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">hey :O </blockquote></blockquote>','\0','2020-06-08 22:08:08',1,NULL,NULL);

/*Table structure for table `conference_log` */

DROP TABLE IF EXISTS `conference_log`;

CREATE TABLE `conference_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inserted` datetime DEFAULT NULL,
  `insertedby` bigint(20) DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  `scopename` varchar(255) DEFAULT NULL,
  `streamid` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `userip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `conference_log` */

/*Table structure for table `configuration` */

DROP TABLE IF EXISTS `configuration`;

CREATE TABLE `configuration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) NOT NULL,
  `inserted` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `comment` text,
  `fromVersion` varchar(255) DEFAULT NULL,
  `om_key` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `U_CNFGRTN_OM_KEY` (`om_key`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `configuration_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `om_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;

/*Data for the table `configuration` */

insert  into `configuration`(`id`,`deleted`,`inserted`,`updated`,`comment`,`fromVersion`,`om_key`,`type`,`value`,`user_id`) values 
(1,'\0','2020-06-08 18:08:02',NULL,'This Class is used for Authentification-Crypting. Be carefull what you do here! If you change it while running previous Pass of users will not be workign anymore! for more Information see https://openmeetings.apache.org/CustomCryptMechanism.html','1.9.x','crypt.class.name','STRING','org.apache.openmeetings.util.crypt.SCryptImplementation',NULL),
(2,'\0','2020-06-08 18:08:02',NULL,'Is user register available on login screen','1.8.x','allow.frontend.register','BOOL','true',NULL),
(3,'\0','2020-06-08 18:08:02',NULL,'Is user register available via SOAP/REST','3.0.x','allow.soap.register','BOOL','true',NULL),
(4,'\0','2020-06-08 18:08:02',NULL,'Is user register available via OAuth','3.0.x','allow.oauth.register','BOOL','true',NULL),
(5,'\0','2020-06-08 18:08:02','2020-06-08 18:08:09','','1.8.x','default.group.id','NUMBER','1',NULL),
(6,'\0','2020-06-08 18:08:03',NULL,'this is the smtp server to send messages','1.9.x','mail.smtp.server','STRING','smtp.gmail.com',NULL),
(7,'\0','2020-06-08 18:08:03',NULL,'this is the smtp server port normally 25','1.9.x','mail.smtp.port','NUMBER','587',NULL),
(8,'\0','2020-06-08 18:08:03',NULL,'all send e-mails by the system will have this address','1.9.x','mail.smtp.system.email','STRING','iwymega@gmail.com',NULL),
(9,'\0','2020-06-08 18:08:03',NULL,'System auth email username','1.9.x','mail.smtp.user','STRING','iwymega@gmail.com',NULL),
(10,'\0','2020-06-08 18:08:03',NULL,'System auth email password','1.9.x','mail.smtp.pass','STRING','Iwymega_123$',NULL),
(11,'\0','2020-06-08 18:08:03',NULL,'Enable TLS','1.9.x','mail.smtp.starttls.enable','BOOL','true',NULL),
(12,'\0','2020-06-08 18:08:03',NULL,'Socket connection timeout value in milliseconds. Default is 30 seconds (30000).','1.9.x','mail.smtp.connection.timeout','NUMBER','30000',NULL),
(13,'\0','2020-06-08 18:08:03',NULL,'Socket I/O timeout value in milliseconds. Default is 30 seconds (30000).','1.9.x','mail.smtp.timeout','NUMBER','30000',NULL),
(14,'\0','2020-06-08 18:08:03',NULL,'Name of the Browser Title window','3.0.x','application.name','STRING','OpenMeetings',NULL),
(15,'\0','2020-06-08 18:08:03',NULL,'Default System Language ID see languages.xml','1.8.x','default.lang.id','NUMBER','1',NULL),
(16,'\0','2020-06-08 18:08:04',NULL,'dpi for conversion of PDF to images (should be an integer between 50 and  600 with a default value of 150 dpi)','2.0.x','document.dpi','NUMBER','150',NULL),
(17,'\0','2020-06-08 18:08:04',NULL,'compression quality for conversion of PDF to images (should be an integer between 1 and 100, with a default value of 90)','2.0.x','document.quality','NUMBER','90',NULL),
(18,'\0','2020-06-08 18:08:04',NULL,'Path to ImageMagick tools','2.0.x','path.imagemagick','STRING','E:\\ImageMagick-7.0.7-17-portable-Q16-x64',NULL),
(19,'\0','2020-06-08 18:08:04',NULL,'Path To SoX-Tools','2.0.x','path.sox','STRING','E:\\Program File\\sox-14-4-2',NULL),
(20,'\0','2020-06-08 18:08:04','2020-06-08 18:49:54','Path To FFMPEG','2.0.x','path.ffmpeg','STRING','E:\\ffmpeg',1),
(21,'\0','2020-06-08 18:08:04',NULL,'The path to OpenOffice/LibreOffice (optional) please set this to the real path in case jodconverter is unable to find OpenOffice/LibreOffice installation automatically','2.0.x','path.office','STRING','E:\\Program File\\LibreOffice',NULL),
(22,'\0','2020-06-08 18:08:04',NULL,'Feed URL 1','1.9.x','dashboard.rss.feed1','STRING','http://mail-archives.apache.org/mod_mbox/openmeetings-user/?format=atom',NULL),
(23,'\0','2020-06-08 18:08:04',NULL,'Feed URL 2','1.9.x','dashboard.rss.feed2','STRING','http://mail-archives.apache.org/mod_mbox/openmeetings-dev/?format=atom',NULL),
(24,'\0','2020-06-08 18:08:04',NULL,'User get a EMail with their Account data.','2.0.x','send.email.at.register','BOOL','false',NULL),
(25,'\0','2020-06-08 18:08:04',NULL,'User must activate their account by clicking on the activation-link in the registering Email It makes no sense to make this(send.email.with.verfication) \'true\' while send.email.at.register is \'false\' cause you need to send a EMail.','2.0.x','send.email.with.verfication','BOOL','false',NULL),
(26,'\0','2020-06-08 18:08:04',NULL,'Base URL your OPenmeetings installation will be accessible at.','3.0.2','application.base.url','STRING','http://localhost:5080/openmeetings/',NULL),
(27,'\0','2020-06-08 18:08:04',NULL,'Enable to enable the red5SIP integration ','1.9.x','sip.enable','BOOL','false',NULL),
(28,'\0','2020-06-08 18:08:05',NULL,'Numerical prefix for OM rooms created inside the SIP','1.9.x','sip.room.prefix','STRING','400',NULL),
(29,'\0','2020-06-08 18:08:05',NULL,'Enable to enable the red5SIP integration ','1.9.x','sip.exten.context','STRING','rooms',NULL),
(30,'\0','2020-06-08 18:08:05',NULL,'This is the default timezone if nothing is specified','1.9.x','default.timezone','STRING','Etc/GMT+8',NULL),
(31,'\0','2020-06-08 18:08:05',NULL,'Default selection in ScreenSharing Quality:\n 0 - bigger frame rate, no resize\n 1 - no resize\n 2 - size == 1/2 of selected area\n 3 - size == 3/8 of selected area','3.0.3','screensharing.default.quality','NUMBER','1',NULL),
(32,'\0','2020-06-08 18:08:05',NULL,'Default selection in ScreenSharing FPS','3.0.3','screensharing.default.fps','NUMBER','10',NULL),
(33,'\0','2020-06-08 18:08:05',NULL,'Is screensharing FPS should be displayed or not','3.0.3','screensharing.fps.show','BOOL','true',NULL),
(34,'\0','2020-06-08 18:08:05',NULL,'Is remote control will be enabled while screensharing. Allowing remote control will be not possible in case it is set to \'false\'','3.0.4','screensharing.allow.remote','BOOL','true',NULL),
(35,'\0','2020-06-08 18:08:05',NULL,'Show \'My Rooms\' widget on dashboard','1.9.x','dashboard.show.myrooms','BOOL','true',NULL),
(36,'\0','2020-06-08 18:08:05',NULL,'Show \'Global Chat\' outside the room','1.9.x','dashboard.show.chat','BOOL','true',NULL),
(37,'\0','2020-06-08 18:08:05',NULL,'Show RSS widget on dashboard','1.9.x','dashboard.show.rssfeed','BOOL','false',NULL),
(38,'\0','2020-06-08 18:08:05',NULL,'Maximum size of upload file (bytes)','1.8.x','max.upload.size','NUMBER','104857600',NULL),
(39,'\0','2020-06-08 18:08:05',NULL,'The number of minutes before reminder emails are send. Set to 0 to disable reminder emails','1.9.x','number.minutes.reminder.send','NUMBER','15',NULL),
(40,'\0','2020-06-08 18:08:06',NULL,'Number of chars needed in a user login','1.9.x','user.login.minimum.length','NUMBER','4',NULL),
(41,'\0','2020-06-08 18:08:06',NULL,'Number of chars needed in a user password','1.9.x','user.pass.minimum.length','NUMBER','8',NULL),
(42,'\0','2020-06-08 18:08:06',NULL,'Default number of participants conference room created via calendar','1.9.x','calendar.conference.rooms.default.size','NUMBER','50',NULL),
(43,'\0','2020-06-08 18:08:06',NULL,'A hot key code for arrange video windows functionality','2.0.x','video.arrange.keycode','HOTKEY','Shift+F8',NULL),
(44,'\0','2020-06-08 18:08:06',NULL,'A hot key code for the \'mute others\' functionality','2.0.x','mute.others.keycode','HOTKEY','Shift+F12',NULL),
(45,'\0','2020-06-08 18:08:06',NULL,'A hot key code for the \'mute/unmute audio\' functionality','2.0.x','mute.keycode','HOTKEY','Shift+F7',NULL),
(46,'\0','2020-06-08 18:08:06',NULL,'Ldap domain selected by default in the login screen','1.9.x','default.ldap.id','NUMBER','0',NULL),
(47,'\0','2020-06-08 18:08:06',NULL,'Set inviter\'s email address as ReplyTo in email invitations','2.0.x','inviter.email.as.replyto','BOOL','true',NULL),
(48,'\0','2020-06-08 18:08:06',NULL,'Area to be shown to the user after login. Possible values are: user/dashboard, user/calendar, user/record, rooms/my, rooms/group, rooms/public, admin/user, admin/connection, admin/group, admin/room, admin/config, admin/lang, admin/ldap, admin/backup, admin/server, admin/oauth2','2.1.x','default.landing.zone','STRING','user/dashboard',NULL),
(49,'\0','2020-06-08 18:08:07',NULL,'Set \"yes\" or \"no\" to enable/disable ssl certifications checking for OAuth2','3.0.x','oauth2.ignore.bad.ssl','BOOL','false',NULL),
(50,'\0','2020-06-08 18:08:07',NULL,'Users entered the room via invitationHash or secureHash will be redirected to this URL on connection lost','3.0.x','redirect.url.for.external.users','STRING','',NULL),
(51,'\0','2020-06-08 18:08:07',NULL,'Code for Google Analytics','3.1.0','google.analytics.code','STRING',NULL,NULL),
(52,'\0','2020-06-08 18:08:07',NULL,'Wether it should try to connect to rtmps first or not','4.0.0','flash.secure','BOOL','false',NULL),
(53,'\0','2020-06-08 18:08:07',NULL,'The setting for the NetConnection default settings is \'none\'\n set to value \'best\' if you are trying to use rtmp over native SSL','4.0.0','flash.secure.proxy','STRING','none',NULL),
(54,'\0','2020-06-08 18:08:07',NULL,'Camera codecType, possible values: \'h263\', \'h264\'','4.0.0','flash.video.codec','STRING','h263',NULL),
(55,'\0','2020-06-08 18:08:07',NULL,'Camera FPS, should be positive number in range (0, 60]','4.0.0','flash.video.fps','NUMBER','30',NULL),
(56,'\0','2020-06-08 18:08:07',NULL,'An integer that specifies the maximum amount of bandwidth that the current outgoing video feed can use, in bytes per second. To specify that Flash video can use as much bandwidth as needed to maintain the value of frameQuality, pass 0 for bandwidth.','4.0.0','flash.video.bandwidth','NUMBER','0',NULL),
(57,'\0','2020-06-08 18:08:07',NULL,'An integer that specifies the required level of picture quality, as determined by the amount of compression being applied to each video frame. Acceptable values range from 1 (lowest quality, maximum compression) to 100 (highest quality, no compression). To specify that picture quality can vary as needed to avoid exceeding bandwidth, pass 0 for quality.','4.0.0','flash.cam.quality','NUMBER','90',NULL),
(58,'\0','2020-06-08 18:08:07',NULL,'The rate at which the microphone should capture sound, in kHz. Acceptable values are 5, 8, 11, 22, and 44. The default value is 22 kHz if your sound capture device supports this value.','4.0.0','flash.mic.rate','NUMBER','22',NULL),
(59,'\0','2020-06-08 18:08:07',NULL,'Specifies the echo path length (in milliseconds). A longer echo path means better echo cancellation but also introduces longer delays and requires more processing power. The default value is 128; the only other possible value is 256. To disable AEC please specify 0.','4.0.0','flash.echoPath','NUMBER','128',NULL),
(60,'\0','2020-06-08 18:08:08',NULL,'Value for \'X-Frame-Options\' header (default: DENY), more info: https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options','3.3.0','header.x.frame.options','STRING','SAMEORIGIN',NULL),
(61,'\0','2020-06-08 18:08:08',NULL,'Value for \'Content-Security-Policy\' header (default: default-src \'self\'; style-src \'self\' \'unsafe-inline\'; script-src \'self\' \'unsafe-inline\' \'unsafe-eval\'; img-src \'self\' data:;), have to be modified to enable Google analytics site: https://content-security-policy.com/','3.3.0','header.content.security.policy','STRING','default-src \'self\'; style-src \'self\' \'unsafe-inline\'; script-src \'self\' \'unsafe-inline\' \'unsafe-eval\'; img-src \'self\' data:;',NULL),
(62,'\0','2020-06-08 18:08:08',NULL,'Time to live in minutes for external processes such as conversion via ffmpeg (default 20 minutes)','3.3.0','external.process.ttl','NUMBER','20',NULL),
(63,'\0','2020-06-08 18:08:08',NULL,'Users are allowed to create personal rooms','3.3.2','personal.rooms.enabled','BOOL','true',NULL),
(64,'\0','2020-06-08 18:08:08',NULL,'Reminder message to notify about upcoming appointment, generated message will be used if not set','2.0.x','reminder.message','STRING',NULL,NULL),
(65,'\0','2020-06-08 18:08:08',NULL,'Audio sampling rate (in Hz) for MP4 video','4.0.1','mp4.audio.rate','NUMBER','22050',NULL),
(66,'\0','2020-06-08 18:08:08',NULL,'Audio bitrate for MP4 video','4.0.1','mp4.audio.bitrate','STRING','32k',NULL),
(67,'\0','2020-06-08 18:08:08',NULL,'List of addresses browser Ajax REST requests are allowed from','4.0.2','rest.allow.origin','STRING',NULL,NULL),
(68,'\0','2020-06-08 18:08:08',NULL,'Number of chars needed in a user first name','4.0.4','user.fname.minimum.length','NUMBER','4',NULL),
(69,'\0','2020-06-08 18:08:08',NULL,'Number of chars needed in a user last name','4.0.4','user.lname.minimum.length','NUMBER','4',NULL),
(70,'\0','2020-06-08 18:08:08',NULL,'Controls if chat message will be set on Enter (default: send on Ctrl+Enter)','4.0.5','chat.send.on.enter','BOOL','false',NULL),
(71,'\0','2020-06-08 18:08:08',NULL,'Preset (encoder optimization settings) to be used while performing mp4 conversion.Valid values are: ultrafast, superfast, veryfast, faster, fast, medium, slow, slower, veryslow','4.0.5','mp4.video.preset','BOOL','medium',NULL),
(72,'\0','2020-06-08 18:08:08',NULL,'Is user will be able to edit his/her display name (default false).','4.0.7','display.name.editable','BOOL','false',NULL),
(73,'\0','2020-06-08 18:08:08',NULL,'A hot key code to start quick poll','4.0.10','start.quickpoll.keycode','HOTKEY','Ctrl+Alt+KeyQ',NULL);

/*Table structure for table `dosens` */

DROP TABLE IF EXISTS `dosens`;

CREATE TABLE `dosens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_prodi` int(10) unsigned NOT NULL,
  `nip_dosen` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_dosen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dosens_id_prodi_foreign` (`id_prodi`),
  CONSTRAINT `dosens_id_prodi_foreign` FOREIGN KEY (`id_prodi`) REFERENCES `prodis` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `dosens` */

insert  into `dosens`(`id`,`id_prodi`,`nip_dosen`,`nama_dosen`,`alamat`) values 
(1,1,'11111111111','Dr. Dewa Gede Putra','Panjer, Denpasar');

/*Table structure for table `email_queue` */

DROP TABLE IF EXISTS `email_queue`;

CREATE TABLE `email_queue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) NOT NULL,
  `inserted` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `body` text,
  `error_count` int(11) NOT NULL,
  `ics` blob,
  `last_error` text,
  `recipients` text,
  `replyTo` varchar(255) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `email_queue` */

/*Table structure for table `file_log` */

DROP TABLE IF EXISTS `file_log`;

CREATE TABLE `file_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message` mediumblob,
  `exit_code` int(11) DEFAULT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  `inserted` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `optional` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `file_log` */

/*Table structure for table `group_user` */

DROP TABLE IF EXISTS `group_user`;

CREATE TABLE `group_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) NOT NULL,
  `inserted` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `is_moderator` bit(1) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `I_GRP_USR_USER` (`user_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `group_user_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `om_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `group_user` */

insert  into `group_user`(`id`,`deleted`,`inserted`,`updated`,`is_moderator`,`user_id`,`group_id`) values 
(1,'\0',NULL,NULL,'\0',1,1),
(2,'\0',NULL,NULL,'\0',3,1),
(3,'\0',NULL,NULL,'\0',5,1);

/*Table structure for table `invitation` */

DROP TABLE IF EXISTS `invitation`;

CREATE TABLE `invitation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) NOT NULL,
  `inserted` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `password` varchar(1024) DEFAULT NULL,
  `password_protected` bit(1) NOT NULL,
  `was_used` bit(1) NOT NULL,
  `valid` varchar(20) DEFAULT NULL,
  `valid_from` datetime DEFAULT NULL,
  `valid_to` datetime DEFAULT NULL,
  `appointment_id` bigint(20) DEFAULT NULL,
  `invited_by` bigint(20) DEFAULT NULL,
  `invitee_id` bigint(20) DEFAULT NULL,
  `recording_id` bigint(20) DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appointment_id` (`appointment_id`),
  KEY `invited_by` (`invited_by`),
  KEY `invitee_id` (`invitee_id`),
  KEY `recording_id` (`recording_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `invitation_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`id`),
  CONSTRAINT `invitation_ibfk_2` FOREIGN KEY (`invited_by`) REFERENCES `om_user` (`id`),
  CONSTRAINT `invitation_ibfk_3` FOREIGN KEY (`invitee_id`) REFERENCES `om_user` (`id`),
  CONSTRAINT `invitation_ibfk_4` FOREIGN KEY (`recording_id`) REFERENCES `om_file` (`id`),
  CONSTRAINT `invitation_ibfk_5` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `invitation` */

/*Table structure for table `krstudis` */

DROP TABLE IF EXISTS `krstudis`;

CREATE TABLE `krstudis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_mahasiswa` int(10) unsigned NOT NULL,
  `id_penawaran_mk` int(10) unsigned NOT NULL,
  `nilai_huruf` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `krstudis_id_mahasiswa_foreign` (`id_mahasiswa`),
  KEY `krstudis_id_penawaran_mk_foreign` (`id_penawaran_mk`),
  CONSTRAINT `krstudis_id_mahasiswa_foreign` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswas` (`id`),
  CONSTRAINT `krstudis_id_penawaran_mk_foreign` FOREIGN KEY (`id_penawaran_mk`) REFERENCES `penawaran_mks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `krstudis` */

/*Table structure for table `kurikulums` */

DROP TABLE IF EXISTS `kurikulums`;

CREATE TABLE `kurikulums` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_prodi` int(10) unsigned NOT NULL,
  `nama_kurikulum` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tahun` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kurikulums_id_prodi_foreign` (`id_prodi`),
  CONSTRAINT `kurikulums_id_prodi_foreign` FOREIGN KEY (`id_prodi`) REFERENCES `prodis` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `kurikulums` */

/*Table structure for table `ldapconfig` */

DROP TABLE IF EXISTS `ldapconfig`;

CREATE TABLE `ldapconfig` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) NOT NULL,
  `inserted` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `add_domain_to_user_name` bit(1) NOT NULL,
  `comment` text,
  `config_file_name` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `insertedby_id` bigint(20) DEFAULT NULL,
  `updatedby_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `insertedby_id` (`insertedby_id`),
  KEY `updatedby_id` (`updatedby_id`),
  CONSTRAINT `ldapconfig_ibfk_1` FOREIGN KEY (`insertedby_id`) REFERENCES `om_user` (`id`),
  CONSTRAINT `ldapconfig_ibfk_2` FOREIGN KEY (`updatedby_id`) REFERENCES `om_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ldapconfig` */

/*Table structure for table `mahasiswas` */

DROP TABLE IF EXISTS `mahasiswas`;

CREATE TABLE `mahasiswas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_prodi` int(10) unsigned NOT NULL,
  `nim` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_depan` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_belakang` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `id_pa` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mahasiswas_id_prodi_foreign` (`id_prodi`),
  KEY `mahasiswas_id_pa_foreign` (`id_pa`),
  CONSTRAINT `mahasiswas_id_pa_foreign` FOREIGN KEY (`id_pa`) REFERENCES `dosens` (`id`),
  CONSTRAINT `mahasiswas_id_prodi_foreign` FOREIGN KEY (`id_prodi`) REFERENCES `prodis` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `mahasiswas` */

insert  into `mahasiswas`(`id`,`id_prodi`,`nim`,`nama_depan`,`nama_belakang`,`alamat`,`email`,`tempat_lahir`,`tanggal_lahir`,`id_pa`) values 
(1,1,'1805551013','I Wayan','Megantara','gianyar','megantarawayan939@gmail.com','Gianyar','2020-06-09',1);

/*Table structure for table `matakuliahs` */

DROP TABLE IF EXISTS `matakuliahs`;

CREATE TABLE `matakuliahs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode_matakuliah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_matakuliah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sks` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `id_kurikulum` int(10) unsigned NOT NULL,
  `id_dosen` int(10) unsigned NOT NULL,
  `id_prodi` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `matakuliahs_id_kurikulum_foreign` (`id_kurikulum`),
  KEY `matakuliahs_id_dosen_foreign` (`id_dosen`),
  KEY `matakuliahs_id_prodi_foreign` (`id_prodi`),
  CONSTRAINT `matakuliahs_id_dosen_foreign` FOREIGN KEY (`id_dosen`) REFERENCES `dosens` (`id`),
  CONSTRAINT `matakuliahs_id_kurikulum_foreign` FOREIGN KEY (`id_kurikulum`) REFERENCES `kurikulums` (`id`),
  CONSTRAINT `matakuliahs_id_prodi_foreign` FOREIGN KEY (`id_prodi`) REFERENCES `prodis` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `matakuliahs` */

/*Table structure for table `meeting_member` */

DROP TABLE IF EXISTS `meeting_member`;

CREATE TABLE `meeting_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) NOT NULL,
  `inserted` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `appointment_status` varchar(255) DEFAULT NULL,
  `is_connected_event` bit(1) NOT NULL,
  `appointment_id` bigint(20) DEFAULT NULL,
  `invitation_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appointment_id` (`appointment_id`),
  KEY `invitation_id` (`invitation_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `meeting_member_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`id`),
  CONSTRAINT `meeting_member_ibfk_2` FOREIGN KEY (`invitation_id`) REFERENCES `invitation` (`id`),
  CONSTRAINT `meeting_member_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `om_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `meeting_member` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2019_11_30_112908_create_prodis_table',1),
(2,'2019_11_30_112939_create_kurikulums_table',1),
(3,'2019_11_30_113028_create_dosens_table',1),
(4,'2019_11_30_113108_create_matakuliahs_table',1),
(5,'2019_11_30_113128_create_mahasiswas_table',1),
(6,'2019_12_07_103430_create_penawaran_mks_table',1),
(7,'2019_12_07_103516_create_pengampus_table',1),
(8,'2019_12_07_103541_create_krstudis_table',1);

/*Table structure for table `oauth_mapping` */

DROP TABLE IF EXISTS `oauth_mapping`;

CREATE TABLE `oauth_mapping` (
  `oauth_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  KEY `I_TH_MPNG_OAUTH_ID` (`oauth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `oauth_mapping` */

insert  into `oauth_mapping`(`oauth_id`,`name`,`value`) values 
(1,'login','login'),
(1,'address.email','default_email'),
(1,'firstname','first_name'),
(1,'lastname','last_name'),
(2,'login','email'),
(2,'address.email','email'),
(2,'firstname','given_name'),
(2,'lastname','family_name'),
(3,'login','id'),
(3,'address.email','email'),
(3,'firstname','first_name'),
(3,'lastname','last_name'),
(4,'login','id'),
(4,'address.email','email'),
(4,'firstname','first_name'),
(4,'lastname','last_name');

/*Table structure for table `oauth_server` */

DROP TABLE IF EXISTS `oauth_server`;

CREATE TABLE `oauth_server` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) NOT NULL,
  `inserted` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `icon_url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `info_method` varchar(20) DEFAULT NULL,
  `info_url` varchar(255) DEFAULT NULL,
  `key_url` varchar(255) DEFAULT NULL,
  `token_attributes` varchar(255) DEFAULT NULL,
  `token_method` varchar(20) DEFAULT NULL,
  `token_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `oauth_server` */

insert  into `oauth_server`(`id`,`deleted`,`inserted`,`updated`,`client_id`,`client_secret`,`enabled`,`icon_url`,`name`,`info_method`,`info_url`,`key_url`,`token_attributes`,`token_method`,`token_url`) values 
(1,'\0','2020-06-08 18:08:08',NULL,'<put your client_id>','<put your client_secret>','\0','https://yandex.st/morda-logo/i/favicon.ico','Yandex','GET','https://login.yandex.ru/info?format=json&oauth_token={$access_token}','https://oauth.yandex.ru/authorize?response_type=code&client_id={$client_id}','grant_type=authorization_code&code={$code}&client_id={$client_id}&client_secret={$client_secret}','POST','https://oauth.yandex.ru/token'),
(2,'\0','2020-06-08 18:08:09',NULL,'<put your client_id>','<put your client_secret>','\0','https://www.google.com/images/google_favicon_128.png','Google','GET','https://www.googleapis.com/oauth2/v1/userinfo?access_token={$access_token}','https://accounts.google.com/o/oauth2/auth?redirect_uri={$redirect_uri}&response_type=code&client_id={$client_id}&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile','code={$code}&client_id={$client_id}&client_secret={$client_secret}&redirect_uri={$redirect_uri}&grant_type=authorization_code','POST','https://accounts.google.com/o/oauth2/token'),
(3,'\0','2020-06-08 18:08:09',NULL,'<put your client_id>','<put your client_secret>','\0','https://www.facebook.com/images/fb_icon_325x325.png','Facebook','GET','https://graph.facebook.com/me?access_token={$access_token}&fields=id,first_name,last_name,email','https://www.facebook.com/v4.0/dialog/oauth?client_id={$client_id}&redirect_uri={$redirect_uri}&scope=email','client_id={$client_id}&redirect_uri={$redirect_uri}&client_secret={$client_secret}&code={$code}','POST','https://graph.facebook.com/v4.0/oauth/access_token'),
(4,'\0','2020-06-08 18:08:09',NULL,'<put your client_id>','<put your client_secret>','\0','https://vk.com/images/safari_152.png','VK','GET','https://api.vk.com/method/users.get?&v=5.92&user_ids={$user_id}&access_token={$access_token}&fields=id,first_name,last_name,email&name_case=nom','https://oauth.vk.com/authorize?client_id={$client_id}&scope=email&redirect_uri={$redirect_uri}&response_type=code&v=5.68','client_id={$client_id}&client_secret={$client_secret}&code={$code}&redirect_uri={$redirect_uri}','POST','https://oauth.vk.com/access_token');

/*Table structure for table `om_calendar` */

DROP TABLE IF EXISTS `om_calendar`;

CREATE TABLE `om_calendar` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) NOT NULL,
  `inserted` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `sync_type` varchar(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `sync_token` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `om_calendar_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `om_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `om_calendar` */

/*Table structure for table `om_file` */

DROP TABLE IF EXISTS `om_file`;

CREATE TABLE `om_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) NOT NULL,
  `inserted` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `page_count` int(11) NOT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `inserted_by` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  `parent_item_id` bigint(20) DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `DTYPE` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `is_interview` bit(1) DEFAULT NULL,
  `notified` bit(1) DEFAULT NULL,
  `record_end` datetime DEFAULT NULL,
  `record_start` datetime DEFAULT NULL,
  `recorder_stream_id` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `external_type` varchar(255) DEFAULT NULL,
  `filesize` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `I_OM_FILE_DTYPE` (`DTYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `om_file` */

/*Table structure for table `om_group` */

DROP TABLE IF EXISTS `om_group`;

CREATE TABLE `om_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) NOT NULL,
  `inserted` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `insertedby` bigint(20) DEFAULT NULL,
  `limited` bit(1) NOT NULL,
  `max_files_size` int(11) NOT NULL,
  `max_rec_size` int(11) NOT NULL,
  `max_rooms` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `recording_ttl` int(11) NOT NULL,
  `reminder_days` int(11) NOT NULL,
  `restricted` bit(1) NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `updatedby` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `om_group` */

insert  into `om_group`(`id`,`deleted`,`inserted`,`updated`,`insertedby`,`limited`,`max_files_size`,`max_rec_size`,`max_rooms`,`name`,`recording_ttl`,`reminder_days`,`restricted`,`tag`,`updatedby`) values 
(1,'\0','2020-06-08 18:08:09',NULL,1,'\0',0,0,0,'ims-openmeetings',0,0,'\0',NULL,NULL);

/*Table structure for table `om_user` */

DROP TABLE IF EXISTS `om_user`;

CREATE TABLE `om_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) NOT NULL,
  `inserted` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `activatehash` varchar(255) DEFAULT NULL,
  `age` datetime DEFAULT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `domain_id` bigint(20) DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `external_type` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `forceTimeZoneCheck` bit(1) NOT NULL,
  `language_id` bigint(20) DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  `password` varchar(1024) DEFAULT NULL,
  `pictureuri` varchar(255) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  `resetdate` datetime DEFAULT NULL,
  `resethash` varchar(255) DEFAULT NULL,
  `salutation` varchar(20) DEFAULT NULL,
  `show_contact_data` bit(1) NOT NULL,
  `show_contact_data_to_contacts` bit(1) NOT NULL,
  `time_zone_id` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `user_offers` varchar(255) DEFAULT NULL,
  `user_searchs` varchar(255) DEFAULT NULL,
  `address_id` bigint(20) DEFAULT NULL,
  `sip_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `I_OM_USER_SIPUSER` (`sip_user_id`),
  KEY `address_id` (`address_id`),
  CONSTRAINT `om_user_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `om_user` */

insert  into `om_user`(`id`,`deleted`,`inserted`,`updated`,`activatehash`,`age`,`displayName`,`domain_id`,`external_id`,`external_type`,`firstname`,`forceTimeZoneCheck`,`language_id`,`lastlogin`,`lastname`,`login`,`owner_id`,`password`,`pictureuri`,`regdate`,`resetdate`,`resethash`,`salutation`,`show_contact_data`,`show_contact_data_to_contacts`,`time_zone_id`,`type`,`user_offers`,`user_searchs`,`address_id`,`sip_user_id`) values 
(1,'\0','2020-06-08 18:08:09','2020-06-09 04:20:00',NULL,'2020-06-08 18:08:09',NULL,NULL,NULL,NULL,'Wayan','\0',16,'2020-06-09 04:20:00','Megantara','iwymega@gmail.com',NULL,'ecXQVo+FH9G20osmdUq9b5DTvaDapu9ezvlvJk2MM308Hvo6T9RUIQsvfBOwuaLv2L3ZmSyDBrOIFDEfjA0STNiQoKpOaqXwNQY6aEw+UclK/alJtGJWImqXunlSQvDbQnMLw95gBkUqaz+HmLhTlvcVi98PCHCMMKSEPblFDaVW7Xamn8O6lTtASPTW4tkKtfgn56GNagf+9JjnzzOyXBiPRYo/rVxgMP6rNfhpy6UfNv6uDWkmokWqhPF4pQ0sAUqVBsPql2cUULojOV16mJaqH8kz5GOhL1b3INIO3ZgMDPJyLIu4Jo/ovV97tT2haZkEcz2MTCqMOq+nVaVDug4CCPBnN+kipw4ANWpWzftnSdLnmr01XUA0rQxTAhOVtu31i03Ld3yRrxXMN0uIhVv5rt+vyJHr7NHZC90Z29E5qYzdzK6fVRxrs92u4ZADHZ9geoDncbMIubBlMvkVOpG/3r++u4TjLz5OFyKuSiI1M+6YxOzOVHfAbPzKUyri166LjkneWNJL2dfbnTJcpBhkDGO8MSJdacFw2mb+8sFsN772rO8n8xoBS7QY1bhXPzq0JCWC+rS+ltS3dG9iQqjQ1Nzr+BbZzByUtKNbygUpw4zXgL8r/qQSDDeUtF6rHQtdGwwmVGx/Zqh9UAQtzkQz2jjbLJ7zx1zM4V6ZdY0=:EypntEB5/wOsLFPpPp55VrKcsW4Kx8laV6IRmeXWGFqyj2kYWkmL8+j5iFI9y34RLi/PJB6/Jfv1qukxrO4Nq8ZvmF+tBCqGAEXvSzhTG9kxFhjXp0+NCnf4suPBH6uPnHdk6MidJv2GqoWEHwYbbXNsTxO2r9OPcUgH5PsFx6Y3PcYaf8qejrPQU4FY1p9zm5+IQPzWULm+8eudqNxU3GDNq2BpRKr7l0KlEVVoim/XFckFWV4ooK1Qv09H+GTxtj9jQ7OEIkM=','profile.png','2020-06-08 18:08:09',NULL,NULL,'mr','\0','\0','Etc/GMT+8','user',NULL,NULL,1,NULL),
(2,'\0','2020-06-08 18:08:09','2020-06-08 22:07:40',NULL,'2020-06-08 18:08:09',NULL,NULL,NULL,NULL,'Yan','\0',16,'2020-06-08 21:56:34','Kek','yankek',NULL,'yankek_1234%','profile.png','2020-06-08 18:08:09',NULL,NULL,'mr','\0','\0','Etc/GMT+9','user',NULL,NULL,2,NULL),
(3,'\0','2020-06-08 22:24:11','2020-06-09 00:37:44','6ac83484-a684-45a3-b422-4c771dccf258','2020-06-08 22:24:10',NULL,NULL,NULL,NULL,'Yan','\0',16,'2020-06-09 00:37:44','Kek','yankek8',NULL,'cEtS7WzYWlm0yPRVyKYQYRSZLEZwP6/Ans3kdiqOYfZHGM3ilJ5qRiGkErHOK8mXPMmJVQxlIeE0WEiDaJ5Wp4ActmrfbLomtZnbRCYBHXaTqAkSa+Ase+cQAru+pMiK4DTUJM5TQHPUovmdpqEINEzRhxwJmYFZPFdLxJfBqZ8YkWdB+EEWwHAXqBB7O3OmP9kwv0jRJVL0MfUUCW4iFarIRas6lydfpKXlwjAjKHh31CxsYRo4OiauFxKhZFu7fU5pcPqw1q4nHANDAThfeKSSdi5kA+l+6S1x4iEMbv3a4RHkzpPgh+cdit3iYB5u0NRrJOPa9/7oR4GpR4yvvtMmpowHguQQ6H88hBGo0lKoxAMng36kk6Zrr/IP0d8gpl4YJNPEasnWtFonXj9XFkLQBBk2vxMv4LUpe220wlS3iAFf99/Y21vyCheQ6Due8wJq0sFBi4Ayq59K9n2kDxNG/TpTj70yUHqofQW7/pgYbssa3nDEDAYqZ1zyQaoImO32bY7tgFttYmr8Ag4fcjqmonEnhEKbN72vHJhNoglj8uHpW88IgEvHPIGlM4QP/LQ5l6ZAkGmWN4rwmWFtJ26ip7QWw9bb5NHULn4/0fazzAvo3rcKwZhP6rJUhnnSyUU2kbJe/xxEVYKJH6/Be43WcVwP4VLTsWPnfVroBLc=:blOQAHRCD+ivhwuLzPQM70cEo4nvurVDvRJFB6RBdWCKUWdV2YV+DKRdEJ/8Z6X3TqLyGS0+k0RFssLOQDURMEllX93qJEGCDH9wZ3Z1Ko4b/UornHo3MC04NOZBSjW0XkXihhltQG1NvTts7bHLQXha7NKLvloY9XAuWcqfxk2rG9SpjDQHIjuKwdcF/l/mJUo0mN8Z065Y5E7Oic995mgoKNXDOVhbHVuDjk7LEr+62hJyFOpquOo4HpgRxV1JxwaA8jtLR1c=',NULL,'2020-06-08 22:24:11',NULL,NULL,'mr','\0','\0','Etc/GMT-8','user',NULL,NULL,3,NULL),
(4,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'putu','\0',NULL,NULL,'mega','putumega',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0','\0',NULL,NULL,NULL,NULL,NULL,NULL),
(5,'\0','2020-06-09 04:30:43','2020-06-09 04:31:16','641630b4-c771-46b2-9af9-e3efcd74aec3','2020-06-09 04:30:42',NULL,NULL,NULL,NULL,'I','\0',16,'2020-06-09 04:31:16','Megantara','megantara939',NULL,'byzE7h3y4Lja1Y+q9FmYEESPX2YUy/tJFONZM5Ce5f+J7Bv9bogPmPNLvvciKZgcxPWFeRXJorYySHCal2x1HNmwWC638ttD0CFrwdKPxal8NgwpnJMy4wEs4sUv2thAaRfNzjoDIneOyv4/f1gfCTT3CF+1ydyFPbNbb8JnIUmHrpyxMFCyBDgLSmjUtwSeLJ+LuLcQZA8LE7XJbLtzkz/88EnGZGwvzSfeUx5cAbweKaviOZihgj0Z/KgxbVSCHBpDjv1azsYhjQYVMJ5u1sk/PMOlu5AaLF9+O6oKSMTQG0ziL+1VDJe9f/FZjo2vi1wCiSxXPTq+v+cyqucW7Svoo/4SpGdW1RMxE1z4lVLx850XEysMEd1u0gInZ2XBGxoqbIOchUd3BrqwZ78xq/NuB5s49AOSWNw/oK+z1y/F0hYJEEvdb3fU9T1G0Ixnvhg1M/Fztgqv8XEHpdYn6QOPWoCgNOz4ZSVRGz4NUG4dXye8qS+xeMkUMrkTmOrbx/lcbIMcxlmqwK+xpDCx0bDIQE0BtBwJ8DKFlZHUlvIx3n9dLCKconuMRDtKoBXxzld/DzqFC9IFE6Qq6wFZBf4tXROdI8J7jLGdHUeN+C64n0rruYzKZ3/fQ+UTKKKbzuxqsXHwr5ArDCAFS9MjAjjwiu8ie1OCoDapu+sfbaE=:1hMMbMjV7FMwsuw+xnmgL0AiAMY8zAIU5Gtopywg3wYUGCecJ5QXrgizz3k3ZxzePgXHPQKG6Nt0KuMll5+XiIYlR2oDkTPrtFeD6lehrWQwHpuy0XW+4ykEwBeC9WZgaBfcvmsgqL5uHmW0PNhyKyLq3d5ZtdvbDwv6QV2pDvgpYmLW0dDXrSGJMgbydrJg0AsxAhWJOpo64eGUpALy9Gicp/7cu3xU6bOdpG4pd3utpPcNE07WsEdfDFL12B/c6xMER2Pg/mY=',NULL,'2020-06-09 04:30:43',NULL,NULL,'mr','\0','\0','Etc/GMT-8','user',NULL,NULL,4,NULL);

/*Table structure for table `om_user_right` */

DROP TABLE IF EXISTS `om_user_right`;

CREATE TABLE `om_user_right` (
  `user_id` bigint(20) DEFAULT NULL,
  `om_right` varchar(20) DEFAULT NULL,
  KEY `I_M_SRGHT_USER_ID` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `om_user_right` */

insert  into `om_user_right`(`user_id`,`om_right`) values 
(1,'Login'),
(1,'Admin'),
(1,'Dashboard'),
(1,'Room'),
(1,'Soap'),
(3,'Login'),
(3,'Room'),
(3,'Dashboard'),
(5,'Login'),
(5,'Room'),
(5,'Dashboard');

/*Table structure for table `penawaran_mks` */

DROP TABLE IF EXISTS `penawaran_mks`;

CREATE TABLE `penawaran_mks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahun_ajaran` year(4) NOT NULL,
  `semester` int(11) NOT NULL,
  `id_prodi` int(10) unsigned NOT NULL,
  `id_matakuliah` int(10) unsigned NOT NULL,
  `kelas` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `penawaran_mks_id_prodi_foreign` (`id_prodi`),
  KEY `penawaran_mks_id_matakuliah_foreign` (`id_matakuliah`),
  CONSTRAINT `penawaran_mks_id_matakuliah_foreign` FOREIGN KEY (`id_matakuliah`) REFERENCES `matakuliahs` (`id`),
  CONSTRAINT `penawaran_mks_id_prodi_foreign` FOREIGN KEY (`id_prodi`) REFERENCES `prodis` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `penawaran_mks` */

/*Table structure for table `pengampus` */

DROP TABLE IF EXISTS `pengampus`;

CREATE TABLE `pengampus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_penawaran_mk` int(10) unsigned NOT NULL,
  `id_dosen` int(10) unsigned NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pengampus_id_penawaran_mk_foreign` (`id_penawaran_mk`),
  KEY `pengampus_id_dosen_foreign` (`id_dosen`),
  CONSTRAINT `pengampus_id_dosen_foreign` FOREIGN KEY (`id_dosen`) REFERENCES `dosens` (`id`),
  CONSTRAINT `pengampus_id_penawaran_mk_foreign` FOREIGN KEY (`id_penawaran_mk`) REFERENCES `penawaran_mks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `pengampus` */

/*Table structure for table `private_message` */

DROP TABLE IF EXISTS `private_message`;

CREATE TABLE `private_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `booked_room` bit(1) NOT NULL,
  `private_message_folder_id` bigint(20) DEFAULT NULL,
  `inserted` datetime DEFAULT NULL,
  `is_contact_request` bit(1) NOT NULL,
  `is_read` bit(1) NOT NULL,
  `message` text,
  `subject` varchar(255) DEFAULT NULL,
  `user_contact_id` bigint(20) DEFAULT NULL,
  `from_id` bigint(20) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  `to_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `from_id` (`from_id`),
  KEY `owner_id` (`owner_id`),
  KEY `room_id` (`room_id`),
  KEY `to_id` (`to_id`),
  CONSTRAINT `private_message_ibfk_1` FOREIGN KEY (`from_id`) REFERENCES `om_user` (`id`),
  CONSTRAINT `private_message_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `om_user` (`id`),
  CONSTRAINT `private_message_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`),
  CONSTRAINT `private_message_ibfk_4` FOREIGN KEY (`to_id`) REFERENCES `om_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `private_message` */

/*Table structure for table `private_message_folder` */

DROP TABLE IF EXISTS `private_message_folder`;

CREATE TABLE `private_message_folder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `folder_name` varchar(255) DEFAULT NULL,
  `inserted` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `private_message_folder` */

/*Table structure for table `prodis` */

DROP TABLE IF EXISTS `prodis`;

CREATE TABLE `prodis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_prodi` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `prodis` */

insert  into `prodis`(`id`,`nama_prodi`) values 
(1,'Teknologi Informasi');

/*Table structure for table `recording_meta_delta` */

DROP TABLE IF EXISTS `recording_meta_delta`;

CREATE TABLE `recording_meta_delta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `current_event_time` datetime DEFAULT NULL,
  `data_length_packet` int(11) DEFAULT NULL,
  `debug_status` varchar(255) DEFAULT NULL,
  `delta_time` bigint(20) DEFAULT NULL,
  `delta_time_stamp` bigint(20) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `is_end_padding` bit(1) NOT NULL,
  `last_time_stamp` bigint(20) DEFAULT NULL,
  `metadata_id` bigint(20) DEFAULT NULL,
  `missing_time` bigint(20) DEFAULT NULL,
  `packet_time_stamp` int(11) DEFAULT NULL,
  `received_audio_data_length` bigint(20) DEFAULT NULL,
  `is_start_padding` bit(1) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `start_time_stamp` int(11) DEFAULT NULL,
  `time_stamp` int(11) DEFAULT NULL,
  `wave_out_put_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `recording_meta_delta` */

/*Table structure for table `recording_metadata` */

DROP TABLE IF EXISTS `recording_metadata`;

CREATE TABLE `recording_metadata` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) NOT NULL,
  `inserted` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `is_audio_only` bit(1) NOT NULL,
  `audio_is_valid` bit(1) NOT NULL,
  `full_wav_audio_data` varchar(255) DEFAULT NULL,
  `record_end` datetime DEFAULT NULL,
  `record_start` datetime DEFAULT NULL,
  `is_screen_data` bit(1) NOT NULL,
  `sid` varchar(255) DEFAULT NULL,
  `stream_name` varchar(255) DEFAULT NULL,
  `stream_status` varchar(20) DEFAULT NULL,
  `is_video_only` bit(1) NOT NULL,
  `recording_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `I_RCRDTDT_RECORDING` (`recording_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `recording_metadata` */

/*Table structure for table `room` */

DROP TABLE IF EXISTS `room`;

CREATE TABLE `room` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) NOT NULL,
  `inserted` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `allow_recording` bit(1) NOT NULL,
  `allow_user_questions` bit(1) NOT NULL,
  `appointment` bit(1) NOT NULL,
  `is_audio_only` bit(1) NOT NULL,
  `capacity` bigint(20) DEFAULT NULL,
  `chat_moderated` bit(1) NOT NULL,
  `chat_opened` bit(1) NOT NULL,
  `is_closed` bit(1) NOT NULL,
  `comment` text,
  `confno` varchar(255) DEFAULT NULL,
  `demo_room` bit(1) NOT NULL,
  `demo_time` int(11) DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `external_type` varchar(255) DEFAULT NULL,
  `files_opened` bit(1) NOT NULL,
  `ispublic` bit(1) NOT NULL,
  `ismoderatedroom` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  `pin` varchar(255) DEFAULT NULL,
  `redirect_url` varchar(255) DEFAULT NULL,
  `sip_enabled` bit(1) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `wait_for_recording` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `room` */

insert  into `room`(`id`,`deleted`,`inserted`,`updated`,`allow_recording`,`allow_user_questions`,`appointment`,`is_audio_only`,`capacity`,`chat_moderated`,`chat_opened`,`is_closed`,`comment`,`confno`,`demo_room`,`demo_time`,`external_id`,`external_type`,`files_opened`,`ispublic`,`ismoderatedroom`,`name`,`owner_id`,`pin`,`redirect_url`,`sip_enabled`,`type`,`wait_for_recording`) values 
(1,'\0','2020-06-08 18:08:12',NULL,'','','\0','\0',16,'\0','\0','\0','',NULL,'\0',NULL,NULL,NULL,'\0','','\0','Public Interview Room',NULL,NULL,NULL,'\0','interview','\0'),
(2,'\0','2020-06-08 18:08:13',NULL,'','','\0','\0',32,'\0','\0','\0','',NULL,'\0',NULL,NULL,NULL,'\0','','\0','Public Conference Room',NULL,NULL,NULL,'\0','conference','\0'),
(3,'\0','2020-06-08 18:08:13','2020-06-08 18:08:13','','','\0','\0',32,'\0','\0','\0','',NULL,'\0',NULL,NULL,NULL,'\0','','\0','Public Video Only Room',NULL,NULL,NULL,'\0','conference','\0'),
(4,'\0','2020-06-08 18:08:13',NULL,'','','\0','\0',32,'\0','\0','\0','',NULL,'\0',NULL,NULL,NULL,'\0','','\0','Public Video And Whiteboard Room',NULL,NULL,NULL,'\0','conference','\0'),
(5,'\0','2020-06-08 18:08:13',NULL,'','','\0','\0',100,'\0','\0','\0','',NULL,'\0',NULL,NULL,NULL,'\0','','\0','Public Presentation Room',NULL,NULL,NULL,'\0','presentation','\0'),
(6,'\0','2020-06-08 18:08:13','2020-06-08 18:08:13','','','\0','\0',100,'\0','\0','\0','',NULL,'\0',NULL,NULL,NULL,'\0','','\0','Presentation room with microphone option set',NULL,NULL,NULL,'\0','presentation','\0'),
(7,'\0','2020-06-08 18:08:13','2020-06-08 18:08:13','','','\0','\0',32,'\0','\0','\0','',NULL,'\0',NULL,NULL,NULL,'\0','','\0','Conference room with microphone option set',NULL,NULL,NULL,'\0','conference','\0'),
(8,'\0','2020-06-08 18:08:14',NULL,'','','\0','\0',32,'\0','\0','\0','',NULL,'\0',NULL,NULL,NULL,'\0','\0','\0','Private Conference Room',NULL,NULL,NULL,'\0','conference','\0'),
(9,'\0','2020-06-08 18:12:01',NULL,'','','\0','\0',25,'\0','\0','\0','My Rooms of ownerId 1',NULL,'\0',NULL,NULL,NULL,'\0','\0','\0','My conference room (for 1-16 users)',1,NULL,NULL,'\0','conference','\0'),
(10,'\0','2020-06-08 18:12:01',NULL,'','','\0','\0',120,'\0','\0','\0','My Rooms of ownerId 1',NULL,'\0',NULL,NULL,NULL,'\0','\0','\0','My presentation room (for 1-120 users)',1,NULL,NULL,'\0','presentation','\0'),
(11,'\0','2020-06-08 22:24:36',NULL,'','','\0','\0',25,'\0','\0','\0','My Rooms of ownerId 3',NULL,'\0',NULL,NULL,NULL,'\0','\0','\0','My conference room (for 1-16 users)',3,NULL,NULL,'\0','conference','\0'),
(12,'\0','2020-06-08 22:24:36',NULL,'','','\0','\0',120,'\0','\0','\0','My Rooms of ownerId 3',NULL,'\0',NULL,NULL,NULL,'\0','\0','\0','My presentation room (for 1-120 users)',3,NULL,NULL,'\0','presentation','\0'),
(13,'\0','2020-06-09 04:31:21',NULL,'','','\0','\0',25,'\0','\0','\0','My Rooms of ownerId 5',NULL,'\0',NULL,NULL,NULL,'\0','\0','\0','My conference room (for 1-16 users)',5,NULL,NULL,'\0','conference','\0'),
(14,'\0','2020-06-09 04:31:22',NULL,'','','\0','\0',120,'\0','\0','\0','My Rooms of ownerId 5',NULL,'\0',NULL,NULL,NULL,'\0','\0','\0','My presentation room (for 1-120 users)',5,NULL,NULL,'\0','presentation','\0');

/*Table structure for table `room_file` */

DROP TABLE IF EXISTS `room_file`;

CREATE TABLE `room_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room_id` bigint(20) NOT NULL,
  `wb_idx` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `file_id` (`file_id`),
  CONSTRAINT `room_file_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `om_file` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `room_file` */

/*Table structure for table `room_group` */

DROP TABLE IF EXISTS `room_group`;

CREATE TABLE `room_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `I_RM_GRUP_ROOM` (`room_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `room_group_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `om_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `room_group` */

insert  into `room_group`(`id`,`room_id`,`group_id`) values 
(1,8,1);

/*Table structure for table `room_hide_element` */

DROP TABLE IF EXISTS `room_hide_element`;

CREATE TABLE `room_hide_element` (
  `room_id` bigint(20) DEFAULT NULL,
  `hide_element` varchar(20) DEFAULT NULL,
  KEY `I_RM_HMNT_ROOM_ID` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `room_hide_element` */

insert  into `room_hide_element`(`room_id`,`hide_element`) values 
(1,'MicrophoneStatus'),
(2,'MicrophoneStatus'),
(3,'Whiteboard'),
(3,'MicrophoneStatus'),
(4,'MicrophoneStatus'),
(5,'MicrophoneStatus'),
(8,'MicrophoneStatus'),
(9,'MicrophoneStatus'),
(10,'MicrophoneStatus'),
(11,'MicrophoneStatus'),
(12,'MicrophoneStatus'),
(13,'MicrophoneStatus'),
(14,'MicrophoneStatus');

/*Table structure for table `room_moderator` */

DROP TABLE IF EXISTS `room_moderator`;

CREATE TABLE `room_moderator` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) NOT NULL,
  `inserted` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `roomId` bigint(20) DEFAULT NULL,
  `is_supermoderator` bit(1) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `room_moderator_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `om_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `room_moderator` */

/*Table structure for table `room_poll` */

DROP TABLE IF EXISTS `room_poll`;

CREATE TABLE `room_poll` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archived` bit(1) NOT NULL,
  `created` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `room_poll_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `om_user` (`id`),
  CONSTRAINT `room_poll_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `room_poll` */

/*Table structure for table `room_poll_answer` */

DROP TABLE IF EXISTS `room_poll_answer`;

CREATE TABLE `room_poll_answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `answer` bit(1) DEFAULT NULL,
  `pointList` int(11) DEFAULT NULL,
  `voteDate` datetime DEFAULT NULL,
  `poll_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `I_RM_PSWR_ROOMPOLL` (`poll_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `room_poll_answer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `om_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `room_poll_answer` */

/*Table structure for table `sessiondata` */

DROP TABLE IF EXISTS `sessiondata`;

CREATE TABLE `sessiondata` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `language_id` bigint(20) DEFAULT NULL,
  `permanent` bit(1) NOT NULL,
  `refreshed` datetime DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `xml` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sessiondata` */

/*Table structure for table `sipusers` */

DROP TABLE IF EXISTS `sipusers`;

CREATE TABLE `sipusers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `allow` varchar(100) NOT NULL,
  `callbackextension` varchar(250) DEFAULT NULL,
  `context` varchar(128) DEFAULT NULL,
  `defaultuser` varchar(128) DEFAULT NULL,
  `fullcontact` varchar(512) DEFAULT NULL,
  `host` varchar(128) NOT NULL,
  `ipaddr` varchar(128) NOT NULL,
  `lastms` int(11) DEFAULT NULL,
  `md5secret` varchar(255) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `nat` varchar(255) NOT NULL,
  `port` int(11) NOT NULL,
  `regseconds` bigint(20) NOT NULL,
  `regserver` varchar(128) DEFAULT NULL,
  `secret` varchar(128) DEFAULT NULL,
  `type` varchar(6) NOT NULL,
  `useragent` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sipusers` */

/*Table structure for table `soaplogin` */

DROP TABLE IF EXISTS `soaplogin`;

CREATE TABLE `soaplogin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `allow_recording` bit(1) NOT NULL,
  `allow_same_url_multiple_times` bit(1) NOT NULL,
  `client_url` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `moderator` bit(1) NOT NULL,
  `recording_id` bigint(20) DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  `session_hash` varchar(255) DEFAULT NULL,
  `showaudiovideotest` bit(1) NOT NULL,
  `use_date` datetime DEFAULT NULL,
  `used` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `soaplogin` */

/*Table structure for table `user_contact` */

DROP TABLE IF EXISTS `user_contact`;

CREATE TABLE `user_contact` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inserted` datetime DEFAULT NULL,
  `pending` bit(1) NOT NULL,
  `share_calendar` bit(1) NOT NULL,
  `updated` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `I_SR_CTCT_CONTACT` (`user_id`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `user_contact_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `om_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_contact` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
