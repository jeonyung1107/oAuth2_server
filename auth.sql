CREATE DATABASE IF NOT EXISTS `auth_server`;
CREATE TABLE `oauth_client_details`
(
    `client_id`               varchar(256) COLLATE utf8_unicode_ci NOT NULL,
    `resource_ids`            varchar(256) COLLATE utf8_unicode_ci  DEFAULT NULL,
    `client_secret`           varchar(256) COLLATE utf8_unicode_ci  DEFAULT NULL,
    `scope`                   varchar(256) COLLATE utf8_unicode_ci  DEFAULT NULL,
    `authorized_grant_types`  varchar(256) COLLATE utf8_unicode_ci  DEFAULT NULL,
    `web_server_redirect_uri` varchar(256) COLLATE utf8_unicode_ci  DEFAULT NULL,
    `authorities`             varchar(256) COLLATE utf8_unicode_ci  DEFAULT NULL,
    `access_token_validity`   int(11)                               DEFAULT NULL,
    `refresh_token_validity`  int(11)                               DEFAULT NULL,
    `additional_information`  varchar(4096) COLLATE utf8_unicode_ci DEFAULT NULL,
    `autoapprove`             varchar(256) COLLATE utf8_unicode_ci  DEFAULT NULL,
    PRIMARY KEY (`client_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_unicode_ci;

INSERT INTO oauth_client_details
(client_id,
 client_secret,
 resource_ids,
 scope,
 authorized_grant_types,
 web_server_redirect_uri,
 authorities,
 access_token_validity,
 refresh_token_validity,
 additional_information,
 autoapprove)
VALUES ('client',
        '$2a$12$IbfpHzC6gbJzSBIb7VM0NevBpq9EkaOpbkBK3xb734Aqpg5E.YVn6',
        null,
        'read,write',
        'authorization_code,password, implicit, refresh_token',
        null,
        'ROLE_YOUR_CLIENT',
        36000,
        2592000,
        null,
        null);

CREATE TABLE `user`
(
    `id`        int(11)                              NOT NULL AUTO_INCREMENT,
    `password`  varchar(100) COLLATE utf8_unicode_ci NOT NULL,
    `user_name` varchar(20) COLLATE utf8_unicode_ci  NOT NULL,
    `authority` char(60) COLLATE utf8_unicode_ci     NOT NULL,
    `reg_date`  datetime DEFAULT NOW()               NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `user_name` (`user_name`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_unicode_ci;

insert into user(user_name, password, authority, reg_date)
values ('admin', '$2a$12$1NbkynNcd6q4hjxJxWPVk.gWVxjH3OD2EwMEaBn3.0Xq0SbVNKAz.', 'ROLE_ADMIN', now());


create table oauth_approvals
(
    userId         VARCHAR(256),
    clientId       VARCHAR(256),
    scope          VARCHAR(256),
    status         VARCHAR(10),
    expiresAt      TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    lastModifiedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP()
);

