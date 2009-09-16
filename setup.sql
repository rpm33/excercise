DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `email` varchar(64) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `user_email` varchar(64),
  FOREIGN KEY ( `user_email` ) REFERENCES `user` ( `email` ),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
