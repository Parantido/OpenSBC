SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `opensbc`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `acc`
--

CREATE TABLE IF NOT EXISTS `acc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `method` char(16) NOT NULL DEFAULT '',
  `from_tag` char(64) NOT NULL DEFAULT '',
  `to_tag` char(64) NOT NULL DEFAULT '',
  `callid` char(64) NOT NULL DEFAULT '',
  `sip_code` char(3) NOT NULL DEFAULT '',
  `sip_reason` char(32) NOT NULL DEFAULT '',
  `time` datetime NOT NULL,
  `duration` int(11) unsigned NOT NULL DEFAULT '0',
  `setuptime` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `callid_idx` (`callid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `active_watchers`
--

CREATE TABLE IF NOT EXISTS `active_watchers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `presentity_uri` char(128) NOT NULL,
  `watcher_username` char(64) NOT NULL,
  `watcher_domain` char(64) NOT NULL,
  `to_user` char(64) NOT NULL,
  `to_domain` char(64) NOT NULL,
  `event` char(64) NOT NULL DEFAULT 'presence',
  `event_id` char(64) DEFAULT NULL,
  `to_tag` char(64) NOT NULL,
  `from_tag` char(64) NOT NULL,
  `callid` char(64) NOT NULL,
  `local_cseq` int(11) NOT NULL,
  `remote_cseq` int(11) NOT NULL,
  `contact` char(128) NOT NULL,
  `record_route` text,
  `expires` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `reason` char(64) NOT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `socket_info` char(64) NOT NULL,
  `local_contact` char(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `active_watchers_idx` (`presentity_uri`,`callid`,`to_tag`,`from_tag`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grp` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip` char(50) NOT NULL,
  `mask` tinyint(4) NOT NULL DEFAULT '32',
  `port` smallint(5) unsigned NOT NULL DEFAULT '0',
  `proto` char(4) NOT NULL DEFAULT 'any',
  `pattern` char(64) DEFAULT NULL,
  `context_info` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `aliases`
--

CREATE TABLE IF NOT EXISTS `aliases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(64) NOT NULL DEFAULT '',
  `domain` char(64) NOT NULL DEFAULT '',
  `contact` char(255) NOT NULL DEFAULT '',
  `received` char(128) DEFAULT NULL,
  `path` char(255) DEFAULT NULL,
  `expires` datetime NOT NULL DEFAULT '2020-05-28 21:32:15',
  `q` float(10,2) NOT NULL DEFAULT '1.00',
  `callid` char(255) NOT NULL DEFAULT 'Default-Call-ID',
  `cseq` int(11) NOT NULL DEFAULT '13',
  `last_modified` datetime NOT NULL DEFAULT '1900-01-01 00:00:01',
  `flags` int(11) NOT NULL DEFAULT '0',
  `cflags` char(255) DEFAULT NULL,
  `user_agent` char(255) NOT NULL DEFAULT '',
  `socket` char(64) DEFAULT NULL,
  `methods` int(11) DEFAULT NULL,
  `sip_instance` char(255) DEFAULT NULL,
  `attr` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias_idx` (`username`,`domain`,`contact`,`callid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `b2b_entities`
--

CREATE TABLE IF NOT EXISTS `b2b_entities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(2) NOT NULL,
  `state` int(2) NOT NULL,
  `ruri` char(128) DEFAULT NULL,
  `from_uri` char(128) NOT NULL,
  `to_uri` char(128) NOT NULL,
  `from_dname` char(64) DEFAULT NULL,
  `to_dname` char(64) DEFAULT NULL,
  `tag0` char(64) NOT NULL,
  `tag1` char(64) DEFAULT NULL,
  `callid` char(64) NOT NULL,
  `cseq0` int(11) NOT NULL,
  `cseq1` int(11) DEFAULT NULL,
  `contact0` char(128) NOT NULL,
  `contact1` char(128) DEFAULT NULL,
  `route0` text,
  `route1` text,
  `sockinfo_srv` char(64) DEFAULT NULL,
  `param` char(128) NOT NULL,
  `lm` int(11) NOT NULL,
  `lrc` int(11) DEFAULT NULL,
  `lic` int(11) DEFAULT NULL,
  `leg_cseq` int(11) DEFAULT NULL,
  `leg_route` text,
  `leg_tag` char(64) DEFAULT NULL,
  `leg_contact` char(128) DEFAULT NULL,
  `leg_sockinfo` char(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `b2b_entities_idx` (`type`,`tag0`,`tag1`,`callid`),
  KEY `b2b_entities_param` (`param`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `b2b_logic`
--

CREATE TABLE IF NOT EXISTS `b2b_logic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `si_key` char(64) NOT NULL,
  `scenario` char(64) NOT NULL,
  `sstate` int(2) NOT NULL,
  `next_sstate` int(2) NOT NULL,
  `sparam0` char(64) DEFAULT NULL,
  `sparam1` char(64) DEFAULT NULL,
  `sparam2` char(64) DEFAULT NULL,
  `sparam3` char(64) DEFAULT NULL,
  `sparam4` char(64) DEFAULT NULL,
  `sdp` tinytext,
  `lifetime` int(10) NOT NULL DEFAULT '0',
  `e1_type` int(2) NOT NULL,
  `e1_sid` char(64) NOT NULL,
  `e1_from` char(128) NOT NULL,
  `e1_to` char(128) NOT NULL,
  `e1_key` char(64) NOT NULL,
  `e2_type` int(2) NOT NULL,
  `e2_sid` char(64) NOT NULL,
  `e2_from` char(128) NOT NULL,
  `e2_to` char(128) NOT NULL,
  `e2_key` char(64) NOT NULL,
  `e3_type` int(2) DEFAULT NULL,
  `e3_sid` char(64) DEFAULT NULL,
  `e3_from` char(128) DEFAULT NULL,
  `e3_to` char(128) DEFAULT NULL,
  `e3_key` char(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `b2b_logic_idx` (`si_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `cachedb`
--

CREATE TABLE IF NOT EXISTS `cachedb` (
  `keyname` char(255) NOT NULL,
  `value` text NOT NULL,
  `counter` int(10) NOT NULL DEFAULT '0',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`keyname`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `carrierfailureroute`
--

CREATE TABLE IF NOT EXISTS `carrierfailureroute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `carrier` int(10) unsigned NOT NULL DEFAULT '0',
  `domain` char(64) NOT NULL DEFAULT '',
  `scan_prefix` char(64) NOT NULL DEFAULT '',
  `host_name` char(128) NOT NULL DEFAULT '',
  `reply_code` char(3) NOT NULL DEFAULT '',
  `flags` int(11) unsigned NOT NULL DEFAULT '0',
  `mask` int(11) unsigned NOT NULL DEFAULT '0',
  `next_domain` char(64) NOT NULL DEFAULT '',
  `description` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `carrierroute`
--

CREATE TABLE IF NOT EXISTS `carrierroute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `carrier` int(10) unsigned NOT NULL DEFAULT '0',
  `domain` char(64) NOT NULL DEFAULT '',
  `scan_prefix` char(64) NOT NULL DEFAULT '',
  `flags` int(11) unsigned NOT NULL DEFAULT '0',
  `mask` int(11) unsigned NOT NULL DEFAULT '0',
  `prob` float NOT NULL DEFAULT '0',
  `strip` int(11) unsigned NOT NULL DEFAULT '0',
  `rewrite_host` char(128) NOT NULL DEFAULT '',
  `rewrite_prefix` char(64) NOT NULL DEFAULT '',
  `rewrite_suffix` char(64) NOT NULL DEFAULT '',
  `description` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `cc_agents`
--

CREATE TABLE IF NOT EXISTS `cc_agents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` char(128) NOT NULL,
  `location` char(128) NOT NULL,
  `logstate` int(10) unsigned NOT NULL DEFAULT '0',
  `skills` char(255) NOT NULL,
  `last_call_end` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_agentid` (`agentid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `cc_calls`
--

CREATE TABLE IF NOT EXISTS `cc_calls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` int(11) NOT NULL,
  `ig_cback` int(11) NOT NULL,
  `no_rej` int(11) NOT NULL,
  `setup_time` int(11) NOT NULL,
  `eta` int(11) NOT NULL,
  `last_start` int(11) NOT NULL,
  `recv_time` int(11) NOT NULL,
  `caller_dn` char(128) NOT NULL,
  `caller_un` char(128) NOT NULL,
  `b2buaid` char(128) NOT NULL DEFAULT '',
  `flow` char(128) NOT NULL,
  `agent` char(128) NOT NULL,
  PRIMARY KEY (`b2buaid`),
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `cc_cdrs`
--

CREATE TABLE IF NOT EXISTS `cc_cdrs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `caller` char(64) NOT NULL,
  `received_timestamp` datetime NOT NULL,
  `wait_time` int(11) unsigned NOT NULL DEFAULT '0',
  `pickup_time` int(11) unsigned NOT NULL DEFAULT '0',
  `talk_time` int(11) unsigned NOT NULL DEFAULT '0',
  `flow_id` char(128) NOT NULL,
  `agent_id` char(128) DEFAULT NULL,
  `call_type` int(11) NOT NULL DEFAULT '-1',
  `rejected` int(11) unsigned NOT NULL DEFAULT '0',
  `fstats` int(11) unsigned NOT NULL DEFAULT '0',
  `cid` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `cc_flows`
--

CREATE TABLE IF NOT EXISTS `cc_flows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `flowid` char(64) NOT NULL,
  `priority` int(11) unsigned NOT NULL DEFAULT '256',
  `skill` char(64) NOT NULL,
  `prependcid` char(32) NOT NULL,
  `message_welcome` char(128) DEFAULT NULL,
  `message_queue` char(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_flowid` (`flowid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `cpl`
--

CREATE TABLE IF NOT EXISTS `cpl` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(64) NOT NULL,
  `domain` char(64) NOT NULL DEFAULT '',
  `cpl_xml` text,
  `cpl_bin` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_idx` (`username`,`domain`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `address1` varchar(200) DEFAULT NULL,
  `address2` varchar(200) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip` varchar(12) DEFAULT NULL,
  `phone1` varchar(50) DEFAULT NULL,
  `phone2` varchar(50) DEFAULT NULL,
  `phone3` varchar(50) DEFAULT NULL,
  `ptype1` varchar(50) DEFAULT NULL,
  `ptype2` varchar(50) DEFAULT NULL,
  `ptype3` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `skypeid` varchar(255) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `notes` text,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `domain_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_subscriber_domain1_idx` (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `dbaliases`
--

CREATE TABLE IF NOT EXISTS `dbaliases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias_username` char(64) NOT NULL DEFAULT '',
  `alias_domain` char(64) NOT NULL DEFAULT '',
  `username` char(64) NOT NULL DEFAULT '',
  `domain` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias_idx` (`alias_username`,`alias_domain`),
  KEY `target_idx` (`username`,`domain`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `dialog`
--

CREATE TABLE IF NOT EXISTS `dialog` (
  `dlg_id` bigint(10) unsigned NOT NULL,
  `callid` char(255) NOT NULL,
  `from_uri` char(128) NOT NULL,
  `from_tag` char(64) NOT NULL,
  `to_uri` char(128) NOT NULL,
  `to_tag` char(64) NOT NULL,
  `mangled_from_uri` char(64) DEFAULT NULL,
  `mangled_to_uri` char(64) DEFAULT NULL,
  `caller_cseq` char(11) NOT NULL,
  `callee_cseq` char(11) NOT NULL,
  `caller_ping_cseq` int(11) unsigned NOT NULL,
  `callee_ping_cseq` int(11) unsigned NOT NULL,
  `caller_route_set` text,
  `callee_route_set` text,
  `caller_contact` char(128) NOT NULL,
  `callee_contact` char(128) NOT NULL,
  `caller_sock` char(64) NOT NULL,
  `callee_sock` char(64) NOT NULL,
  `state` int(10) unsigned NOT NULL,
  `start_time` int(10) unsigned NOT NULL,
  `timeout` int(10) unsigned NOT NULL,
  `vars` blob,
  `profiles` text,
  `script_flags` int(10) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dlg_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `dialplan`
--

CREATE TABLE IF NOT EXISTS `dialplan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dpid` int(11) NOT NULL,
  `pr` int(11) NOT NULL,
  `match_op` int(11) NOT NULL,
  `match_exp` char(64) NOT NULL,
  `match_flags` int(11) NOT NULL,
  `subst_exp` char(64) NOT NULL,
  `repl_exp` char(32) NOT NULL,
  `disabled` int(11) NOT NULL DEFAULT '0',
  `attrs` char(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `dispatcher`
--

CREATE TABLE IF NOT EXISTS `dispatcher` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `setid` int(11) NOT NULL DEFAULT '0',
  `destination` char(192) NOT NULL DEFAULT '',
  `socket` char(128) DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '1',
  `attrs` char(128) NOT NULL DEFAULT '',
  `description` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `domain`
--

CREATE TABLE IF NOT EXISTS `domain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` char(64) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '1900-01-01 00:00:01',
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain_idx` (`domain`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `domainpolicy`
--

CREATE TABLE IF NOT EXISTS `domainpolicy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule` char(255) NOT NULL,
  `type` char(255) NOT NULL,
  `att` char(255) DEFAULT NULL,
  `val` char(128) DEFAULT NULL,
  `description` char(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rav_idx` (`rule`,`att`,`val`),
  KEY `rule_idx` (`rule`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `dr_carriers`
--

CREATE TABLE IF NOT EXISTS `dr_carriers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `carrierid` char(64) NOT NULL,
  `gwlist` char(255) NOT NULL,
  `flags` int(11) unsigned NOT NULL DEFAULT '0',
  `state` int(11) unsigned NOT NULL DEFAULT '0',
  `attrs` char(255) DEFAULT '',
  `description` char(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dr_carrier_idx` (`carrierid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `dr_gateways`
--

CREATE TABLE IF NOT EXISTS `dr_gateways` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gwid` char(64) NOT NULL,
  `type` int(11) unsigned NOT NULL DEFAULT '0',
  `address` char(128) NOT NULL,
  `strip` int(11) unsigned NOT NULL DEFAULT '0',
  `pri_prefix` char(16) DEFAULT NULL,
  `attrs` char(255) DEFAULT NULL,
  `probe_mode` int(11) unsigned NOT NULL DEFAULT '0',
  `state` int(11) unsigned NOT NULL DEFAULT '0',
  `socket` char(128) DEFAULT NULL,
  `description` char(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dr_gw_idx` (`gwid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `dr_groups`
--

CREATE TABLE IF NOT EXISTS `dr_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(64) NOT NULL,
  `domain` char(128) NOT NULL DEFAULT '',
  `groupid` int(11) unsigned NOT NULL DEFAULT '0',
  `description` char(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `dr_rules`
--

CREATE TABLE IF NOT EXISTS `dr_rules` (
  `ruleid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` char(255) NOT NULL,
  `prefix` char(64) NOT NULL,
  `timerec` char(255) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `routeid` char(255) DEFAULT NULL,
  `gwlist` char(255) NOT NULL,
  `attrs` char(255) DEFAULT NULL,
  `description` char(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`ruleid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `globalblacklist`
--

CREATE TABLE IF NOT EXISTS `globalblacklist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prefix` char(64) NOT NULL DEFAULT '',
  `whitelist` tinyint(1) NOT NULL DEFAULT '0',
  `description` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `globalblacklist_idx` (`prefix`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `grp`
--

CREATE TABLE IF NOT EXISTS `grp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(64) NOT NULL DEFAULT '',
  `domain` char(64) NOT NULL DEFAULT '',
  `grp` char(64) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '1900-01-01 00:00:01',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_group_idx` (`username`,`domain`,`grp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `imc_members`
--

CREATE TABLE IF NOT EXISTS `imc_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(64) NOT NULL,
  `domain` char(64) NOT NULL,
  `room` char(64) NOT NULL,
  `flag` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_room_idx` (`username`,`domain`,`room`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `imc_rooms`
--

CREATE TABLE IF NOT EXISTS `imc_rooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(64) NOT NULL,
  `domain` char(64) NOT NULL,
  `flag` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_domain_idx` (`name`,`domain`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `load_balancer`
--

CREATE TABLE IF NOT EXISTS `load_balancer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) unsigned NOT NULL DEFAULT '0',
  `dst_uri` char(128) NOT NULL,
  `resources` char(255) NOT NULL,
  `probe_mode` int(11) unsigned NOT NULL DEFAULT '0',
  `description` char(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `dsturi_idx` (`dst_uri`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(64) NOT NULL DEFAULT '',
  `domain` char(64) NOT NULL DEFAULT '',
  `contact` char(255) NOT NULL DEFAULT '',
  `received` char(128) DEFAULT NULL,
  `path` char(255) DEFAULT NULL,
  `expires` datetime NOT NULL DEFAULT '2020-05-28 21:32:15',
  `q` float(10,2) NOT NULL DEFAULT '1.00',
  `callid` char(255) NOT NULL DEFAULT 'Default-Call-ID',
  `cseq` int(11) NOT NULL DEFAULT '13',
  `last_modified` datetime NOT NULL DEFAULT '1900-01-01 00:00:01',
  `flags` int(11) NOT NULL DEFAULT '0',
  `cflags` char(255) DEFAULT NULL,
  `user_agent` char(255) NOT NULL DEFAULT '',
  `socket` char(64) DEFAULT NULL,
  `methods` int(11) DEFAULT NULL,
  `sip_instance` char(255) DEFAULT NULL,
  `attr` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_contact_idx` (`username`,`domain`,`contact`,`callid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1438692500),
('m130524_201442_init', 1438692506),
('m150214_044831_init_user', 1439113901);

-- --------------------------------------------------------

--
-- Struttura della tabella `missed_calls`
--

CREATE TABLE IF NOT EXISTS `missed_calls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `method` char(16) NOT NULL DEFAULT '',
  `from_tag` char(64) NOT NULL DEFAULT '',
  `to_tag` char(64) NOT NULL DEFAULT '',
  `callid` char(64) NOT NULL DEFAULT '',
  `sip_code` char(3) NOT NULL DEFAULT '',
  `sip_reason` char(32) NOT NULL DEFAULT '',
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `callid_idx` (`callid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `pdt`
--

CREATE TABLE IF NOT EXISTS `pdt` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sdomain` char(128) NOT NULL,
  `prefix` char(32) NOT NULL,
  `domain` char(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sdomain_prefix_idx` (`sdomain`,`prefix`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `presentity`
--

CREATE TABLE IF NOT EXISTS `presentity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(64) NOT NULL,
  `domain` char(64) NOT NULL,
  `event` char(64) NOT NULL,
  `etag` char(64) NOT NULL,
  `expires` int(11) NOT NULL,
  `received_time` int(11) NOT NULL,
  `body` blob NOT NULL,
  `extra_hdrs` blob NOT NULL,
  `sender` char(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `presentity_idx` (`username`,`domain`,`event`,`etag`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'https://scontent-fra3-1.xx.fbcdn.net/hphotos-xaf1/v/t1.0-9/10922874_10206129286540150_4681276363695842244_n.jpg?oh=25bfabbdcb8ce5109ae6064d3f8c1daf&oe=5652F30A',
  PRIMARY KEY (`id`),
  KEY `profile_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `profile`
--

INSERT INTO `profile` (`id`, `user_id`, `create_time`, `update_time`, `full_name`, `avatar_url`) VALUES
(1, 1, '2015-08-09 14:51:41', '2015-08-10 11:24:04', 'Administrator', 'https://scontent-fra3-1.xx.fbcdn.net/hphotos-xaf1/v/t1.0-9/10922874_10206129286540150_4681276363695842244_n.jpg?oh=25bfabbdcb8ce5109ae6064d3f8c1daf&oe=5652F30A');

-- --------------------------------------------------------

--
-- Struttura della tabella `pua`
--

CREATE TABLE IF NOT EXISTS `pua` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pres_uri` char(128) NOT NULL,
  `pres_id` char(255) NOT NULL,
  `event` int(11) NOT NULL,
  `expires` int(11) NOT NULL,
  `desired_expires` int(11) NOT NULL,
  `flag` int(11) NOT NULL,
  `etag` char(64) DEFAULT NULL,
  `tuple_id` char(64) DEFAULT NULL,
  `watcher_uri` char(128) DEFAULT NULL,
  `to_uri` char(128) DEFAULT NULL,
  `call_id` char(64) DEFAULT NULL,
  `to_tag` char(64) DEFAULT NULL,
  `from_tag` char(64) DEFAULT NULL,
  `cseq` int(11) DEFAULT NULL,
  `record_route` text,
  `contact` char(128) DEFAULT NULL,
  `remote_contact` char(128) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `extra_headers` text,
  PRIMARY KEY (`id`),
  KEY `del1_idx` (`pres_uri`,`event`),
  KEY `del2_idx` (`expires`),
  KEY `update_idx` (`pres_uri`,`pres_id`,`flag`,`event`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `registrant`
--

CREATE TABLE IF NOT EXISTS `registrant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `registrar` char(128) NOT NULL DEFAULT '',
  `proxy` char(128) DEFAULT NULL,
  `aor` char(128) NOT NULL DEFAULT '',
  `third_party_registrant` char(128) DEFAULT NULL,
  `username` char(64) DEFAULT NULL,
  `password` char(64) DEFAULT NULL,
  `binding_URI` char(128) NOT NULL DEFAULT '',
  `binding_params` char(64) DEFAULT NULL,
  `expiry` int(1) unsigned DEFAULT NULL,
  `forced_socket` char(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `aor_idx` (`aor`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `re_grp`
--

CREATE TABLE IF NOT EXISTS `re_grp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reg_exp` char(128) NOT NULL DEFAULT '',
  `group_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `group_idx` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `rls_presentity`
--

CREATE TABLE IF NOT EXISTS `rls_presentity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rlsubs_did` char(255) NOT NULL,
  `resource_uri` char(128) NOT NULL,
  `content_type` char(255) NOT NULL,
  `presence_state` blob NOT NULL,
  `expires` int(11) NOT NULL,
  `updated` int(11) NOT NULL,
  `auth_state` int(11) NOT NULL,
  `reason` char(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rls_presentity_idx` (`rlsubs_did`,`resource_uri`),
  KEY `updated_idx` (`updated`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `rls_watchers`
--

CREATE TABLE IF NOT EXISTS `rls_watchers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `presentity_uri` char(128) NOT NULL,
  `to_user` char(64) NOT NULL,
  `to_domain` char(64) NOT NULL,
  `watcher_username` char(64) NOT NULL,
  `watcher_domain` char(64) NOT NULL,
  `event` char(64) NOT NULL DEFAULT 'presence',
  `event_id` char(64) DEFAULT NULL,
  `to_tag` char(64) NOT NULL,
  `from_tag` char(64) NOT NULL,
  `callid` char(64) NOT NULL,
  `local_cseq` int(11) NOT NULL,
  `remote_cseq` int(11) NOT NULL,
  `contact` char(64) NOT NULL,
  `record_route` text,
  `expires` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `reason` char(64) NOT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `socket_info` char(64) NOT NULL,
  `local_contact` char(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rls_watcher_idx` (`presentity_uri`,`callid`,`to_tag`,`from_tag`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `can_admin` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dump dei dati per la tabella `role`
--

INSERT INTO `role` (`id`, `name`, `create_time`, `update_time`, `can_admin`) VALUES
(1, 'Admin', '2015-08-09 14:51:41', NULL, 1),
(2, 'User', '2015-08-09 14:51:41', NULL, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `route_tree`
--

CREATE TABLE IF NOT EXISTS `route_tree` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `carrier` char(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `rtpproxy_sockets`
--

CREATE TABLE IF NOT EXISTS `rtpproxy_sockets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rtpproxy_sock` text NOT NULL,
  `set_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `silo`
--

CREATE TABLE IF NOT EXISTS `silo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `src_addr` char(128) NOT NULL DEFAULT '',
  `dst_addr` char(128) NOT NULL DEFAULT '',
  `username` char(64) NOT NULL DEFAULT '',
  `domain` char(64) NOT NULL DEFAULT '',
  `inc_time` int(11) NOT NULL DEFAULT '0',
  `exp_time` int(11) NOT NULL DEFAULT '0',
  `snd_time` int(11) NOT NULL DEFAULT '0',
  `ctype` char(255) DEFAULT NULL,
  `body` blob,
  PRIMARY KEY (`id`),
  KEY `account_idx` (`username`,`domain`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `sip_trace`
--

CREATE TABLE IF NOT EXISTS `sip_trace` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time_stamp` datetime NOT NULL DEFAULT '1900-01-01 00:00:01',
  `callid` char(255) NOT NULL DEFAULT '',
  `traced_user` char(128) DEFAULT NULL,
  `msg` text NOT NULL,
  `method` char(32) NOT NULL DEFAULT '',
  `status` char(128) DEFAULT NULL,
  `fromip` char(50) NOT NULL DEFAULT '',
  `toip` char(50) NOT NULL DEFAULT '',
  `fromtag` char(64) NOT NULL DEFAULT '',
  `direction` char(4) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `traced_user_idx` (`traced_user`),
  KEY `date_idx` (`time_stamp`),
  KEY `fromip_idx` (`fromip`),
  KEY `callid_idx` (`callid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `speed_dial`
--

CREATE TABLE IF NOT EXISTS `speed_dial` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(64) NOT NULL DEFAULT '',
  `domain` char(64) NOT NULL DEFAULT '',
  `sd_username` char(64) NOT NULL DEFAULT '',
  `sd_domain` char(64) NOT NULL DEFAULT '',
  `new_uri` char(128) NOT NULL DEFAULT '',
  `fname` char(64) NOT NULL DEFAULT '',
  `lname` char(64) NOT NULL DEFAULT '',
  `description` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `speed_dial_idx` (`username`,`domain`,`sd_domain`,`sd_username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `subscriber`
--

CREATE TABLE IF NOT EXISTS `subscriber` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(64) NOT NULL DEFAULT '',
  `domain` char(64) NOT NULL DEFAULT '',
  `password` char(25) NOT NULL DEFAULT '',
  `email_address` char(64) NOT NULL DEFAULT '',
  `ha1` char(64) NOT NULL DEFAULT '',
  `ha1b` char(64) NOT NULL DEFAULT '',
  `rpid` char(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_idx` (`username`,`domain`),
  KEY `username_idx` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `uri`
--

CREATE TABLE IF NOT EXISTS `uri` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(64) NOT NULL DEFAULT '',
  `domain` char(64) NOT NULL DEFAULT '',
  `uri_user` char(64) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '1900-01-01 00:00:01',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_idx` (`username`,`domain`,`uri_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `api_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_time` timestamp NULL DEFAULT NULL,
  `create_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `ban_time` timestamp NULL DEFAULT NULL,
  `ban_reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img_url` blob NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_email` (`email`),
  UNIQUE KEY `user_username` (`username`),
  KEY `user_role_id` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `user`
--

INSERT INTO `user` (`id`, `role_id`, `status`, `email`, `new_email`, `username`, `password`, `display_name`, `auth_key`, `api_key`, `login_ip`, `login_time`, `create_ip`, `create_time`, `update_time`, `ban_time`, `ban_reason`, `img_url`) VALUES
(1, 1, 1, 'admin@techfusion.it', NULL, 'admin', '$2y$13$bppiUiSLH0Muq/B78GuUP.oMeppWMIUhE9eVJqziCoEF/RpCFRyfG', 'Danilo Santoro', 'ZwT46oEfU2QYhBrKC5J44M9vSAUxeWpU', '_DH1tOm_-v5yOzeBhGcRtX8hZn0TKyCa', '85.18.194.158', '2015-08-25 13:30:29', NULL, '2015-08-09 14:51:41', '2015-08-09 15:07:25', NULL, NULL, 0xffd8ffe000104a46494600010101004800480000ffdb00430001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101ffdb00430101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101ffc200110800dc00dc03011100021101031101ffc4001e0000010403010101000000000000000000060405070800030902010affc4001c0100010501010100000000000000000000040002030506010708ffda000c03010002100310000001a39605aa77235634e6391a5c807bd3e67457adc5c228947eeec80bafd1746a7ecaf03a70cfd9fe8408aae3bd7dbd3ed2d647a634a1ac8fcc4741bae0e5eebb5c6d071285d1562d2d302190b38d0468634c847ee7209639c79cd8d51ea79c3b9f39c8f53e4f89e511f63c5db003a2f0acfbde3d7f15e72e27b702153e193217f8ea1f6cbdb0c55bdb036b3f3d57cf4458d191500242c5b3f1f18d0b8d276a205d0de390711dc33ca39ab93fcfdc17d79be93fdcbcf5242aa58e41e8d00eb2985ed451628692b9d341a67e4eedc51c51b44773eb4d5e43c4f5d6f28a685df9229ea78138723cc51149ea27a6af35b3377cc3c8844b823dbbaf0eb6091911fb4d748c890e9cd9de9cce9a1559d1ed3e737bf99d5e97712c4b12c4b128cb3178b9cd58f66fe3143daa1ec8ec72385143a8abf735d165fd588d809e6689da19df62259e71d34b0fc6a3d1099e73f69d4a1e0ea3ea33bebab12c4b12c4b12c4b12c4b12c4b12f8971ab25a6e4bdf0d1dda5720998a44b1b5395dc586a4bb35809142a0adba0ced5cd4615672139676d4e42f3b7b6157662f2a3ef7b8962589625f12fa96258962589018d3fe78f1fb4a59bfca0eca3fb1cdbe1e71eb361aa6c08ca83eb1ea78e6277289eb7235f75fe7afbc535d059f4373d63d9bdb63fd77b8962421d5c7a3f8209bde3af7e258962589550acb2e25e73534e3739109286b6585f48b6989db974bc252c54a9da79d531130e1617397d2fc7d41b5d21d658d92cfd9fe8aaff344854589624dc952d9158be29618b12c4b12c4a94d25bf1e28f4750b5f9a1b3a3e9e7947aa9103681f631bf74a7e6392b985ece900dca0dabc6544dbf9d96c2ebaf86d37766fb3f335cd7e258962434c444e5efab12c4b12c4a9bd45b71af3da2a91b1cd9db09b699ad1c3ba6a44d0cb388566499ad8e93eb62cbfc9bd4e32da4b8a6da2c8a6ef2e5e32ff00b536b4b61b4555b38be75625e5ab4712a7ac4b12c4b12aea01bc3ec8eb6a16db3363938e6aaeabaddd5239df2d8ddb1fe77e90c97b9ea7ba6cdcaa7d5d8ecf59d7db8a388c133a03e57b6a35ea18a18d0d49839137115b7b2aa6f5e409ac0f3989625f12f09446bbc40f3bdd555db66ac54bd1ca4bd07b409b6e6b0ee94f9f709e9fead69eafef7cf8f5e14cf416e2f694e294e5da6f34d8f21bdbbcfdf260d7bfba9ef26ebd477bd4bab74fcf822fb116026c958e2961077425dc98f1da32facb99dc889e29efa1bb008bdd1a4acd14a94da07d7a8ff518417963b6b18e2f6f9dad34772d320552f6b52ae40b64ebd762d3d6b9cbdd6d8637226950b15a93c7eb0eda3b5edaf4e9967bcf3d5ac104e6f0ec478b51fca8aeb8d3a06c250e3e07b404e1c0d8492b0264023f16d6a16ffcb208b3057922fc978b5b27c7f11f38c8f60595392911155902274563b8323437a45c8ed4e23d1249a0d1be531d119f38299048224a5e8c3b8a38b0b6c9b5b2ca630ad858b5d74994ec1e8711f9f13e015b217e3e3dfdeaf4d6a73f4f391c14f719a3900e0d8e86d6c4549f554f824a886ed7e2ee6b1e77d2c1043a352e68e26018e76ca4d3885ac408733ad2a751516be311dc79baab5ace4a5906a4c1dd658d4f3826e7f9ef5e1cc3b108ddc699ca21cd758f6dab5dc4547805956f703331c682def3ef3de970dcd106d9553c4574e7cb0244beb29498492cd5599cf0f4bf32916c69e0e9248b49875ce399f63493c6dfc8f4293dbfb23865b27613aef0a1a54c74655d150d1b91bda6a1e786f791747e8d10f2deb75d571bc9d9a9a2334c4c4504d68f376724beb3943eb3e4faa2575422e9e1e1a52605b2b36bf9e1cb573a55176d30248df7bb7ac6e9610d84d1919f78048bb3742eddc75060b4f40eb76cc0a755215a8f364a01c4a00fba312af6e3cf692ec71d35d695dc80e6e131e3f8286619f8afbc715c95059096293f50428fe58bdb1fedeb58ebc47d681e4482bf7f5b56e0d0711c5d16c0ac9e22ba1fb28e4f00e78e563dc9493d5d63da2c29e64867984b6099b0142e3946abe8d27390d79c0d2c436507e9f60035c6beb52897a290f099ab507360d3ee4dadd0693836368a333a9e6fa3db18c76bb5e245d6d87b1d517bd91d0f9cc8f615ce53b528eb172adbe4e7e1cda4a431cc720c60241cc87f44c3049a25f78b62e6be75539e5c0c958095cb2b05f327bb6aca6f2b9ea718d64424b0ce285d54c5597f6db2dada3fea1e3d2ee93392f67e5f49c74e54ecd8dba7648dde478118f10129e4841ed20656f599a9028d91cc6fe49d17817208f62118deb078f7b28f8d62d240a2b6552d8480730581657ddbf44a827a2f99a1f45c01cd5caaaa089053133f9f5ea4b63cff0025617fbceccb779f8ff319f4dd4bc46c58def46c7e3873a393b790b74d09a3b5b8de61e9d3866f4a0c5f0727156110faef12aebd3498eeceaeab7a879393dfd11d06abdd417b38a660a6ea3e08be9464a5b065318b69045d7d17e7c2f22764d23673a659ed3dab4a2a9ebff33db5a18f032675ae2fa1be5be9105d36b580e8534b17a5cf09fbaff375fb519c8ef6d873e9c794e8ec25d026be9e5c674f846a6d54754ae9b4b9aab5d8c484a68839ea3af8ed7659a8b19d4d1a90cd14076b5a0c14dfa0cf33d42374d48293d2597a4894ab4f197fac71b2869b03f9e8d4825ba008d4a8e7aced934c25130ceb961a1caa94e98c512c4a19d5c5339ef784c6fd50ab239278b5caf5cc8211287b555845bef9e3d48ebd2b251b89b500a9d787bc51fd7e06b4fa1f9b8487c8cbbd772a293edc7b1d5063d0b3446f7498a49a6190f8196c388c9d486dd7787f936b6984a38c4a347d2a388c822ec016fe594a998d7cfb53f6f29ec389b180b3fe9f453d3fc3200d0e491c7d79625cf4d8c4d6eedbf73cb47902dc40f4a39aaec9dc9347511b5c571b7fffc4002f100001050002010402020004070000000004010203050600071208111314152120221016233017253132333536ffda0008010100010502d00e89350cc8542e74c3cf7ec42c6cdce9f648628c41bee5d2d34ff0595d3158682ef9a80493c09d227b199c7ab82ac3e50a4d1ff6e758ff00ed69e270d4ddbf32a15409e7656c42bec15df532f4ec52ac2e26f9ad3ae8073b8342da9a8ecfbb532ceb53fb913acf300e4b3ab10a704668e0630aaa569d53570c8a5e987f8cca693ec8692ab25d0fb39d40ef38ff00ed7e817c9b940cd911c21d02dd78be97ae8dfac589a6123c07645aa9c5e61511f2c8b23f46bf5eb7250afcd03d4a33aab331fd7da58a814da03bedd91de40d637dd78112eae32fc560e608ff00c9d0d397f4ec2e07512c8877dfa0a49d60b1b5896039c3116b51418c282904cfe6c1730f41f8fbb31eadbe9e2e4b77290d1cbaa4443d84677620d9b24a89590d3834f64511a0cee90fb2aac86b61a1cc7566ed6cf2d566d6bb634baed00c3fa7ddcc84dcf406ded4c03d3ce90582c696c8b95b9ed09b5b4d8bda4253fa9b7b290574d76258c355d15d88c886f4d5d82afd6f4b58d3cd0340a9126b346f26bb899c274decb35f94fe7e58d5e2d99fc86f6c22e05a59bdaaf40440eebced6aa5e45247347edfec36911bc4a95e2563b895bc4af44e204c4e6aeeebb274faad41b7471d7dc22ea772ca54b3f1ac6378c11f371290ff0069022a254722718479bc0b19e170562c54ea6ec5fa4e45454ff77bab54fb7d058986186a2b59292befcafab36c65a7c07bf04ca0d0f1b490234fcb8f3f2ff209136411f04a27cade428d95d4d2a44ceafd325f50ff00b9a7b4fc2d05cbdf34c5c9f0932bbe651e094a93374f18900af6448ae5448dfcf91386890110ec29be0e2cce48c535ed754d848ce756dead6683f85f5c0d9fa7b9ee6da5c910f68ef2367f1ee633eae22c7fe9750fc44f97bae473c8e8c715e8810c88f58d39e08de3a3e7d595e97f52e921b1025af2c644770625833b2b692492d39a96555fe258831c35874e75f0e68186c8568dfc7bc5aab9bb45444bf77ca4568ae9cfaa06300292cc4123fce44e70d67e4aa6af9c862b782dac4ee4af14f837550a8914c4c320c29333b26900e9809d26c97f0b58fcc445f74fe3ddc9ef94b36ffa778d552714021771747be190b6b0a70b00f1f210848e219ad978756bdab602c48d16792a3863a0b91eeb3b615938aa4ba5c682b191d784003669ae6bd3fc5c88e4853da2fe3da758fb3c5d9b7f564df90dc084bf72e97c1f616918ea114e7c905839ea399f2a6a2f11027d84f3ced3a1fa342e4923b0860abb68c37056f990fe21bb26dfdede2b2b0a6cdd5ec34f55419fec5dc075d91ecfecdb03c2eecec69ed70fa02f6393fe0e735897fa9c68c11f18ee927249cd5b63249c922deba42a650a33649850abb800b5b189443b921bba9024420018360c00404b9bac9c72b65592fe72c61ccbcb92465552cfe7a2d1ddcab7179a4f72acf54aac96d9c567ebed992d503d53b7aac36509f51dd72c965f528297199ea536464361dd5d95a0059a6bdd5d58be76f47d7d70e286bea8155bd7e2fd4aab5ad6395d9e7fccccdc4fe49123e5023f7e1a2b8c1cfa814b6c5549013555beecd904c4373941fe60b5ec4d747e14c6383afcf9528805093357d7d1cf3443d0ab831aa9eb541d4673457c34aefb4caf2db2b2d65fad3cb2b4125084cf58c8e4aabe6ca4d15dfcad2df958bc73e44caae22ce3890fbe995292352618e448df0c6ae17f25ee50d1c64a5719043cdd8b2d9570b719dcb496bd77a8268b4633838f403f913730adb5cd9c51df5c2c716a2e1dedafbab3bcb2b1295eb1a892b039096c62483c5f4ca1607ce955ed675d4534070535294c17104109464317d8c8fddc5c7e4c66806ae0e19237a41af04126ed625b4a1723d1ca9191b7b09a2acb4cf3ecefee26131783120aff00ccd1c0cae82a457e732edae5cf67ad211aaaba48e258dfb35a2592270ee147fa47421af88b505dbc1a5ea8d9019ab949124cd42c9774667c0301faa4064c923954999be32ca8ae7ca8c98233e16cd60c4532686666608547ab91a72ce8c37aa04175bb9f52baff008a2ba611f012125f68229a1bfbb04c2011a1fb19f03eb10046cd157671a7d3a8440950c911b508c65084b0919eb7aedb6777f8913137dd4418d16e5204e6a2a0792b8b7a72cbe4e40a2fd8f61117fa4ad82712043470246d1fe8d193e62775bbb99c7c4768daf5ed85d6ac9d4ea20b32221d3ec8150a38e6ceeb18adcc530a138c8670f91deb6ad12f5ec78da381cd6eac74841d1341b1c3f6fc599e76bde6276f80e8a636d3749172611a4c17e1cb58699fb80fcf3ec26ac6dc06a46c1c8758595b5d3bfcab68c5a0895bcb8b7667e93cd26b408e9a47667a5747a1c24c904c7c26931a3d8e6b1c488571a41b190d633c039741240474276022bba47b3d153a83b04398aeb0ec4fac4e2f7024a4e77470c7e9c0694dd57c7c48f9dbd40c16537c7e38163e4b0432be283cf95e2c51f2458dea341f1c7db7664acaa449f5b199f2749a1ee6bd8b0b827d49851566dfa44257cac5fd39b10961218263fce3b19c81a7f8a2e7c517118ce783179e0ce7c31f278226af873e3e77087f632c5d87c4e049fb0b33cc620d159ace3bca46c847c2b5e5ca71171e9fec76a443e933fd5cafa799b217375d2406a6ee1f4d38288767a79eb769917a7cea98a1dbb7a2faf5b4ba18b4b612c9cb34f227e6454f9b892f3ec3511b7814965f2f1cbe5c46f3c39daffacc6d025f7afb045e006b266f946fe4963143cb2ba456e24270916726ff00973676aabe46353ec27148fd69b745e61da7ee2d55c21e3a190e72ba1a91a493df85a794bf72b038bf28ce7e4d8bc4b2673f28335d36b2a923a93073c5def7961301369fd5ceacd5c7eff6bb7a437c2453f3ea2bc69cd091f764af26b1b1266cde6fe378b3a44dec0ecddd0f7980eebd956f27f527ae89e0fa80ec3b72ec3b53b2816d9dc90492aff7e5aebcd3ea6b0b64d12aaaf1d139dc7f636e6549371b47f1faad4bf8fbaba938f28c7f112695d27704587ea03cc90a92b802ed4ba6ac868690d7fed927970baa8657b295ef681561572424ac8f30f4806d843f923007244a6130b44addb0e04a56b1d772a929cf9bcb860f95fc5647acf5f7accff45558bc0f239c0a08abfcf9f8d6f03a371e69de989a3b57d38d1c767b3e8ea5ca51d98b1d8491d7c90cb92ab68711337834872bf8c93c15655e24ca9c94873d6093e36dddafbb49b259e7af8647f2ce4fb94b2c130ee6792f33f92d4e827c67a72bf7a677ac7259c441f87dcd1d3721ed3c34dc891a9cf64f6a4399537353bdb3d156e31e6979dec8d152d5e7cafe842da10f96bf21bbb83ee724fa2ce2397de6f147a3b8b2fe858a7348d47d8c91770e79220207c6f999248b58132b0616d2bf40debeea2eacb2e56d2d7d541677b4344dbbef6cf07cd07716bae7929c49127caabc8a2915b2ca2c3c3b4a30c5e1fb44d19f7dddba451cc3c8356fe4f0753d71b6c6d55acd559e12e81d7844c130e4110c8f62c8e6f13cddcea7ac0011fb108cb329ef6de23ecc13fecc7f764541dae896589c34f53624d6969db9b09c30b296dab72748ee5dcff819b7e37a336dc4e8bd9f09b28daa7d9f9b2773cb2e0342a587ca46489ed1b2c1a5dc4dd2743197be7928a674fda8b168b6c1fd3d7ba3feb255105cf616b9fccf0dd39249969a2bbb911ffbe024b839d8b0133c733a381ce648d21661c8a7b9f8f919e03d2ab4f7955c03bab6a0f28bbcd48207d5668a86591ebc9e477882efe95ec4840ab858f695e2f61c8d68de9fff00fb7d5cae04dc8cef8b51da10c6cb9546fbea35b76b2c7ef237c51f3cad4e20f178b878f9e08c9a17ababd3ff00196c6f227ab5442e6e34d9d18d2e7914295fc10e27e2ffc40042110001020304070408040601040300000001021100032104123141051322516171813291a1f006101442b1c1d1e1152352622030337282f1432492a2b2345383ffda0008010301013f012a60f8c5e718e20d1fa78c2017c32f50483c2198b41f533c5e6d909a7d633113310460e3080629009a562ccf7d046f03bcd4758d20bbda4a716ff9e50e9b298b731ab018746c3c1bd47185406eb03111614b284c38276c8e09a9f856167db6dea7145cf604e49e1c1845be6b7e5834094269835c4887785627ce503685dc1aaff683b279379ce359c3c7ed17f878fda12b7cbc7ed0a5d4d3c7ed014f97a95b237c2557b8402062fd03c282886d5cca7ec35ce1367b42c6cc999cae91f283227a4d64cc047ed278e348b931c7e5af1cd316555c282a14bc31a3b189b26f6982827635c8593c28bc3c318b6cc0b52a8c2fa9b903cb746f8d6b3ecf8fda1590de2f425255c840150d5c22d07d92c130e2b5b212aecb5f1d5f13f68d0d22fcc5cd58bccf74b7bd4f97c62d4b515aab89fb79a42c290dfb846d6e7e3bf3e3ca129ba6aaca1589391c0e580867cbd6c4ef84d31a520937b36710894bb4109960acbe4e43f18b3e819cef69988960fba8a280e5ca24e8db148c13ac2d8cd483d5ce709d52432508618301f48d784e600e4041b4a4e63c20cc4285520a4ef01a0c9b2abb5287fda1871f9f389da325ad466c9580b56254710dbfcd22d562b4c97a6b01cc0279b4211b0ad9a8a6157dd0251f79157388e3f489c9bca4dda0081860fba2484a65ac2e600acaf2802dd6254c9099882a989297ab11e3c2348dad368414a164a75e0a538b204a4a5db75e04f38b35b2c565b289299c4cd50bca58b3e0ac2eb9f0e11af924ba96b5d5f0baf5fd3953cbc4eb4c9594b05304f8c0b44901aeabc3eb0513145c215d635138a122e60f5ea7842644e0fb188681649e5b629bdfe51f87cee1e7ac0b14d01894f9aefdd09b1a9ea53e7ac59b457b413b61291da3768466db42ad12e549b1cb09921290284dd049e3c3c6153fde7ed71e906d8038340d8bc4dd21741ba5f757ce71f88cdc8f8bc1b6cd25c9f1836bb43ff50b6e84e90b40036a998cd9eb5fb538c4bd22583d3fcbed12ed64dea82083887cb2dde4c5af46ebaf4fb32c85312b964d0be2525c55fddbadc614952094ac3114e3f086e27be3bfbff8d56fb3fefe91f88c9182571f894bfd1320e91dc82dc7183a457eea00e71f884dfd298b24db45b2726525296f7d4dd94e70abb2109424763c4e27bc93169b7a12e083c930bd23417526991e79f9c2153e64e512580dc98a1a6312ecb3a67610471292c7840d1b6b6aa0f1d93e708559a7a1446ae61033ba7e305c50b8e078c053531e1ba254f20e604227a4802f815dfe11a42c89b4cb13a5117d3884d54b03962d87468667071143c3f9da3247b3ca135436e6540fdb88ae7dd168b4cd37b699c9e39b79ee82a51510a2e77c1439c71e1f78d1da22d56f9a12941b9798ab86fcbb9fac58fd1ab34820cedb22bd96a82ffa94f9426c7213d942070b83eb024ca6fe9a7ba26d8644d0dab4f44c692f47e42a5de4065872e139e54bd9533ac5a2cb32cf3540d698b367ccc0516c18f3ee8055faa2c4ad841ceb43fdc7e31a5ecc255a04e40d9989da6a242b13be31fe65965ebad3265ef5871bc3b97ff178b4510129c532d811f007944c982f2926b530a232358b1483689889757bc9bcd53550f9468bb24bb349404208d9a921b6a9e313701e47a8180771850bc083986efa469fd1bb0a5cb4b1097748a93b9c670ed426a286010e18c4899ab20b5125f862f16895ed96498c2ad793bef0ddd3e701b20d88ee2dfc262bc7f8b44a2f5b659fd1795cf66ef83f1c2275011b9fe916a94654d3985390a66cb0c4f2c61f69219c9200e71a0346a6584cd98906650a836f2e9ad7dd6ca1296a0a089b2dd2efd1bef0107745d802b0992e7b5857b2f93ef8b759f59255ef6346e043e31a4ec532cb3d459d0b2e0b3352b997af28416507844d1d8ddc717ff716298a986e602a19f1a7489e8d5ce9a866659a73afcff99a10ff00d67f89f845a338d2049328638fc62c328ccb4205d26b837111a395ab4253c2a78fdb0e91ed92d152a46eed08fc464a8b5f410e330df184ce44cec949e2088375d8b3c15cb47e978f694a7303ac19e85248bc966df8c7a41644ce96e964818103861d4c4d4042aee2d9f18929755e7388f0ff0051a3f52149ba368be388e3c0c6964145ba70de659e6f2d0fe3fccd0b4b63fec57cbe913d4ef16dedcb3cde3455df6a0b5aae2121ef35ecc519c63ce0e965d7503f2c12c4d0a8025f2a39c31a5626dbed6661da2c54f75f0e0f08b5ce071c727fb7978d1fa6899ba855e4a85017704be0ec211699b743dd3f435ed723d3a4690b5aa5cb52e94c19589e6d13edd3ced5e572bc7e9ba2cba72d2165284af64d6f2dc10ffd9f5899a5913a434f494ab1531bcc0614ba1e801c46313152a6ae62e5d537ce218f77de12967233cbcfd23464825485de6e0df37f9469aae9099c02073fcb4ff33474dd55b6413d951b8776d160f1684ee18d70c62d692b9a0622ea80dcecd16315d560c1f7410129dac5bfd44f9884105468f9183312a977a590ec7135a60fe708b21aba9ef0da7f732af38d1690bb1493303beb2aac5b5ab189e11a765dcb4dc4aaea0a5ee8347ded842c5d0ea98e55d94935a5030e112ed09f6cb4cbbc000a414d7855ba9af18513359292dbd4337de6272cd92d210412951abe1fdd125d4b6ab1296ff23f43163b35c44bdf90ccd0e51a5a6855b27900769297ff00f34023bc17e30f0fc61f8c03c60a886e7008201a79e9fc495dc5a55fa54957717891313364ca9a0dff00cbaf03ba348a4a27a6eabb4e006c1fad71e11a3d0b52c938f67c7cd226495a8871b219f9307e516bb04a54a510f4ab42a42c5250bac0366f4cf0c4c59ecd6bbf290a637d99b98a67f28b2c932acf265b609dcd5528a8f8968f4a2ccc8933c24b8649a6574d7c889f2d7366a14165294dda5d7c589f7866fbe2468b99366cc5ccbc801458dd7bc3fee0de312e5191b38818139e67e2d1a48033c387748e85f18b1a81992d176a5aafb8b619c4f9e2cf67beeca12d93bc93908b40257b57ef2c956d4b228e49236aad0b0a451685a334de4f6939118634a579c291325817e5ad2541d2142eb8dfc6906cb3d12d13169012becd6a68eecd847b3cc4ca4ce2d754f76b52428a5b85442ec9353285a15742546e800de2ec4f0dd12acf3152d2a4dd63799d4c68a5270e63ba09e3132d410a29fd3c7787f9c4b9dac18366f0ff00680e41f35fac26a2b523b4f88dcfd1a342db025ac8bc0a8a828f75c0fcf0e116ed1a9364996a09beb42c0486bc71cbbb28b0d8ee4b0bfd66bfb4fe9e06048746fa1ca15652bbc3223744ad1e4aaeb70008f348b168d972d7296b6d620ee0c0365ba01e9fee916e9027cab8a4850523121fabc5b3446a16a57681218b38c07c30a6e84598948183708b459981072cfa3c5be4a75883434c6347e8599a916d9c152e58504a2853798b9e783f2ac696d20d3912655c589242b7a1c0663df16dd253ad6b94b9926420c84b2754900138876cb07e462d7a46d16b5ca5ce08694025006f1838ddf68b4dbed56cd5fb42d2a12d822e97200a3701c2173e64c01d6b3743072683746b977424951030dd5ac6b54a0d50077419f749483871e00c2486721fac4f4025531b118724818f16dd165280412970310f8f85224cd972d77948d6768017aeb5e25bdd5765fab6504ed2884b24971e5a1336ea569ba0decf3146eb12d652b0526e286071fa468851b56800a2ca52d7365e15042a6329f3c30a36f8b259c4b4ea8e2a2e5c603bfc63d89407e51053b8e599cf7bc7b2afdebbd07de35499352973ddf5e11285e6560f963f4809177a631354e8486c0342d2260d4ac02900876ab2aa7e3f38558542928052060086ff00c9cbf744eb24e5129d4f0ed38c3fb625e871315a99ad79732f055dbd740f76eb87e778728f48a6cbb0e84b34840babf6850776701152cdf331324cc5aaf6c9330de402ada3d32e71312534506560462d9630a43e7e100308bb405fa3416147afab540d5f1e1ea9a192f883962d97de04dd5aabd934e00ef89687a7eaa03cf8c04146cd48c8c308baeadc3ba3d0eb63c8b4e8e5e2858992dcefdb55d7fee20b7285d271f3ba2592e6be5a00dc22687e3095042534cfe512e6851e187fa89b3d1ae12d17880872f83bfc616768a999dbe0202de5b610547078b2a1ed17dbb2ac7be91e964e33edd2acca74cb94cabbeeed212a516c3035e18c202ad16b2a4b8124ec918040a063b9dbaf489ffd45b8cfe504039b43316c7083b8784355c8ef8a7083c22e9cab1302aeb3758d5872935e3bb8b459d178a517b060edf784cabf7c02952906a87f1fb78c4f9573683905bdd66a31cce6f0ccdce3465b3d86db2ad1ee864cc0f76f82455d8b30c98bb6232bc89bab9d2969992e6a02b1aa4d3648abff00753942295dff002a7ca0cc09049c1b7c2ad72dcb578defb40b4de2063fe5f6843a6afba9f77f944eb4225dd51454a98907ed132dc85e05873fb6f891382d142efe5e0e31295765ce5debace634b5b04f9b68b463ff001cb2784b12cf88262cc832acab9cdb4b2cd86cef7e7c3389e85d091456079fd0d38c190b0a4a0d14ac01ddbe35134950005e45561f002b42d5d9da66cdb8c265aabc0728129452554a1019f1854a648552a5a958bb0b4ead577c60a6f0aa8577c1b3b2dc178b2ca09997d5b492ce3161407e11350bb0da04d4550a379245491b95f3e862604cf95ac05c104f23f22f1aae3d9ab42b6ead4c8654a7ca343e909926d5674294a12d4ab850544237e079425741b5bf3e25bc22d2b5ea5570b934afca2ce84eb2ecc5a6843870c1dbebdf12e55990a76cb861be1264b9aa6e36643e15826c4aa382f80d931a42c6847e62366f11f97810d4c3f763c418b08c7fb7e6214432892c1aa7752348e9bb6fb54e952d6d225aca4242f13bc814c1e173bda4250b64ed3ab754e3dc5e17685b6ad37ae23658764819c2a7294962b34c013d9e5bab5898b52ca54a51529344a89720703178d4bd4e35c614a2d8c0dd91351be30873134bac98262f333d1399ddf5dd12272471c7a88bc99b28a166f5764fe9a78f8449bf2f5887796d78166141cce3847689c9c430141e73804a54950ed24829e6ff00478b25a75f2652c2b14871baeec9af34ee808bf2faee789fa3a5cf510eb0431bc92ce5865c30c78c7e06a9a1e54f9a95252cc5cde1c0df0d5e70743e920e9bb30d0ffcad88e45a247a3d6d2359366aa5f0bc555ef4c2ec13a59485cc54cba462f5cff51e51211712ed5219b7758d3169165b24c53d6bc1cb50671317794b5e256bbdcbebe112839a62701c616808294156dac765bb2f8675ad3285029241ca0fab186e300be50c7210ca391f18128a98ef85c93b41890a0d844a94b977810a2ca0cef51427a65d206f76fdbbb8b43aae9a9663bf8bc209735cbe6203b571f57a3d68754c9047f4ea1ff4acb92385e247384aaea06e78925dd4de442678965dbc19a05ba4ab13b5ce91af4281bac7941635506e70a53151dc1da3d2bb715ae4c94ba5174a9601a1ab3a8784538562cc9bb304c576102f2b83391d48c2240d7cd9b6a50a25d3290aed15386ba3364f8d627312725135de3fd4143e71aa3c6352dc20a5b673fa8fbc4b9186ff00942d375574614c38878be6358bdf1ae5793f68beaed758f689bbc7746b546b9c6b49c40f843d1e2ff0f1fb47a37f996bb4a4509b2de19d52b66cbc9103482e5952169ec96ede3ff8c68fb6ebd65045c6c0debd79f85d0dbb1fa45c7718c26c42f5f735cb014ea7742137726e31a42d82cca00e629b4d97231edb327a8265e271179e9dc3cee8d3852ab74c04beae5264f5525331fa29575b36770ed1765b82ecc1b0c7c601977562f5178d3061777e78c2ad172ea25259082f8d54a621ddb89a47b42f70cfc635ebe1dd1ad7c44226317c1bceea4266eb96aa01871c001c3c308a0c042eaac3f81fd55e30914e30922ee50a66a363947a24df8a286fb32875be0f80ac69dd1fabbd6892592407b983efa6748b1da4ca57698a58e3d62c36f4cc960a99db126a7844a9e09c8f88f3f78b65b93674a961894e097c7a4691d20ab5aa551c8bca63c09a1f84685d1ab4253689c52f3085201ed5d511419dd6dd1a5493a46d8eff00fc89803ee49ba3b99a140b4578c57d4cd886e917921e830c63597b8448a391d7afa978e3174e5177bf745d56ef1fb7a87f0757e8df38f43ac8fadb51153335492d8009725f9d1bac4d94152d485244c4a810461f58b6687548fcc452528b8a3a99d94e1f22e070897ad920355197ba5f9560db6760094efdafb06a44e9d6a9d32ea028b9fd6fe176344684255ed56c4d01fcb4637eace70bac460ca767a3c2b65200601376e8030092ff0068f4924eab4ada40a098133d14fd4945e1d14545f3dc235b754c6be7ac0561062f25b0da6317c9835801bfd459f029fd4417e5041185614824bb1f8c06cbd4fc614ce70810086ca2f0381ee837b27e1162b24fb6cd9722424999316137882529df7b75295ce346e8e97a3acb2acd28d10e56a3da54c512a593bd94a5253fb024650bc21494aa8a008e4f169b04b5289964a787da3f0c51352a3be956ff005167b0c99252abae70da186748978f489ea641ad4651e9521333556a709500659c890f875c626b939e316798ce955773c1538f517ca2ad5809259813d22549562c47484a0246d579c2a64a4921d10edc60a8bf0dd17a189cbcf745defdc43410407849631a3e5a672d9452f7804a49c6a1f978c684b3592c62f5f9099aaa3921d381a56a7ba061df9be66afc7185e1d609630a157f53bdde709537c22dd38a42af2ae2462ac723953e31a5edabb5cfc7f2904a425dc28e179da95c98f385aeacd871895daf5cb953147b25b7fdbef08b335565dc60ccd4dee79e1c38c03225f4f3c6176a1ff1827cf28267ccad40e7f6ac1431625fef5f9c1f5278f8c7a39a3e5e91b6ca4ac8d5ca056b49c1775454c77b8a47a4526c765d2ca936750d5eac29410d750ba6c9038104a71ef85a2c7325d2f0580f4ec9353ddc3a439bca63efb7480e855f4ecaf250a1e15847b7cc5037d79292a7552b8831a0b4c5a264c4d92d2a0abc9099449759284d456a77f282f9bf58510f941801da91304b96854d5ac2508a92481ddc62dbe9568eb3ac2137d4eeea07b24601de8f94695f48ecf6bb32e548be95ae8544e09639c4c9a1985788dfbe31206f8459c240fd5bdf7d604b635ce95fbc2244946d2b6b9b14fd3ef0ab484d1029c30f8415ce9bc13ddcea5be306524556b7fedce35884bdd4b73c60ce590ca2a01f37103861013d6357fb635498d1f6d9fa366eb6ca42578390e385386ece2d04ce9b327a8154c9cb2b98e715177229b23f6d79c0c306c6128db5d7051cbef0c49d9179b2f2f16593327ca96654b255758a4558f9e112661b1db252d419722685949d92c529052f567157638e112a689f2e5ac1a2d17f7b707cf1c69025821e0cb03278d5abdd0c72e7fee3d2bd20a4ad1610b1fd30a99714c5f02086e3be27043545edce736c70df0425b0c62626e9f54824cb4125cd7ff630f78ee6af9c20acbddcb0e84560009a803a878099a4386ba78b618d3cbc290f981e7a46aabdb4c6ad19903c61923050eefb88d94ee1dc20a93bc77c5e1be2f8766eb0e6164b9a9f2212087a63167fea17700b5783011e8d4b932ac3669c84de5de509a48abdf1da3beebd374699414696b51512a4ae7020e29b8508c3264a69ba91e8d4d169d1f25d4eb96572d4e769af51fa6109b3d045a0a2ce8993e62c2654b0ea513747798d2be99a2513274722faff00fb565d23641d9545a6d369b54f5da672d4a9b31555392c8fd2e7278beacc9239c5226cb0a96a208bce1b7b5308d5dd4827178934969cbb5ffb18e50c5ea0c5e1bc40580d5e8f099a5ea84aa9ef80478bc2b5049bd2ee9cee767a13e3d60c894a1f96b2fc703050a49663485e5eb188e7ea5768f9c87aa4f6c731126d33a4e8599aa5947fd4014e21516c52b5925d454e94124d49bc013f18f43547f3d2f40a34ff0021080f741c0b0ef31e94697b7dbb485aecb3a71122cd3552a5a25ec0b89bcc14dda818778f1fe101e040c4738567cbe5ea188e70a240a47b9d0c02420379c609263fffc400461100010204030504070604030705000000010211000304211231410522516171133281a1144291b1c1e1f00610235262d1152033f1077282243034435392d25493b2c2e2ffda0008010201013f0190e10533023162b1b6223ae6d0a97771cada6518715a0230ad56b5afe10ab68f02e9cb8c001fdf1350090524662c3e5f7107165c216fa4246ef507e31843871af0829176b5b3f08ecc3b93d6368da5ac3eedfa6adf28a2b6cc94dffa79c7c77a361277536b9c44f3798a2e7abc2b4eb7840dd0397be12314f4b9b7c3874898004e9af8e70a768dab3ffe5fe721015cd4c9cf913ed101a9367a88b1448590daaf096f12728d8b24a9289aa1bc4625122eea24905f53ac70e0f0320d9412d7e1187125df31f084a8b918598e177f942ac4f87ba159420e21ed856eb6b00b87817855b9c5c90035f372cd026a5ef662d89c612dcdc59f32c5af9c2e7c84a9d53e483c3b4060d548524913e4dc1ff9897c9b2897390a25226ca516fce236849269e6361275bbe9e7630e656c9284ff0050495ca4e84959cf93026de71b169cc99292aba9294a4e998cf33f5ac4c4e65f32348ecec2fa0d390e71286298a5689b75faf189eb65a124b0565e166cf585b00e4d83fba143d2b6a21214f253be78029bf11a88dad518049a696a01730870cfb9772cfc6cd1432c7a3201dc2c3116fca5b2b68dafb624113712bd542b0f5e7cba41527a412958b27ca251d1fc21618e4cfeff00de14ee5fead1630c13cbe70a0f030e139307f089d3e5d3a0cc9ab4a120392a2136e4f159f6a29d0e9a596a9a5392d5bc95167b1d58dbc2276dada951bc899d9027242c823a3414d44c56254f9ca39975abf78f45528851c59e65efca3d1093696ceda74812152cba66292ae4483ef833768a1fb2ab0b1ff4e724ad397e6275e3a7844bda9569560aa9685a467d9071e1a718d97b5296a0aa5a26265ad4c7b39ca095102c5926fa5a2a2627b6400a18183b1ddf1d2264f4329a626c9b00afd3149311d89c531214547749b81c5a2793327c8cca258249d1f1122fee8a998a5489a99601514db8f8738a0a499226998b45d5214f661da76aad5ac4a1afc217415553b4a5d54e44b44a97ba3f13b4514bbe5a0ccf5f6c2a6012f0cb0dba407f8f2f8452cc12241410f31533193a331b08993f129c0d2254d9280714c96402521942e7e11e994c9987f150d6d72b0fad2276d2a3091f8a0dfa373ccbf941da94212714fde62e30fb2f8b83691fc5e8537ed1fc227edda17490a512e1c364cdaf4e51336fd2e1dd0a279dbe06277da2448967b297da2c974efb04ab4b605620ecf9454ceabda2b5cca89aa38f24a5d294df267bf944ba32a4d8643870fabc4aa19aa01a5b9fafde29b644c58c7311846af72c2dcb844ad914cc3120c1d9b4da25bc1fcf581414bacb04f1fa113764d24d0e94e0571cc7016dd8a8d8d809662342123ff2e5c626ecd0920ef624b8c49dc2c74ccc5156aa8b0d3d4052e595ee2c9de49e06c5c00f771d212b97346241c4f7b7b232ff0071fc3aa8f2d7581b26a0b12b1e307644d3eba23f82aff3a63f8227f3c0d89280bcc57368acd9f4d494eb9ab98b25b712fde57f6789723b4ba95dec87ba28f66ad7a0667df16cf47891b31206f611fe50071cbeb38952654a0c94df8919f8c3f13942ea65205e66b925506be9d36c44f8fce113e42d21495dce84c662d9728619344ea69330ea950232c8b37be27d329e60c26ca76c3a7ed1475668ea04999792bb03a4a2a3eb7e5b927a5e0104020b837078ff00bedad38d44e284a9e54b60dfadda28a8a44a48380159424951162e97eee8c183bdf3d5a129d0301c00f9c00c1a2a2b645324998acb4d4f28aafb40b9c5629f72590c9389c9b32bd51eb3c2eaea4dfb43d3e8c2aa2613752b1717f65be712768ce4000ab2d5da366eda98578267772baaf7e6dc4c2272169c492e7870f1f94137789aa510e007d6d988daa9c4b5ee0412c0a87f953702defd2362549553f61314ea428e07cca7fded54c32a9e7283be05311ea9c2c0f2bc5366ac79aa63ef66abf3ce25207668387d517f06f74308a9a84d3a0a89191ccc6d6da0a9d34872c0be7d624cd528ddcf5fb8e7f74a5942ddd8020fb9e362d7e29a25acf78b00a39fb602470e3ef820358456d3266159245c65d12df089534d0d74a77c3898f0c27ca05c03c403edbff200e40e25bdb09a501209be91d84ad42bc05bf9b6b2b0d1a83b3a93ecd4449482417fa7eb14137b690064a406377d6c72e104346deda8ac6a928500966e3ea87e199f65a264f0a2c73e31255bd6bc130d6fb9531890de2fc474f8c5255044d4149c24170af18a2ac454a12d6535c627cacfdd19e7fbc28b3189d216bc413abb1ebfb3f18daf4c9a7485ad431327ae6fc628a676b4b266714f5c894fc3f97d266a00015ac1993545caefecf77f36db07d1437fd64bff009709cf9626f18a54b9032cbc7946c96489c1ef6f6b7d08ac9e29e9e6ccb6ea72eb68da18a6acac825d4efc0184502a6280c2a059ddb3109d9d312cc9538e50a90b97de491d7e70cf1d81e778346a528f7b4e3064aa5adb09b6ac636255142824df3cf5b9f742541690a559f431326e125232d0e971fbc6dceda6956256ea6f63e5d23612f16cd9377c2569e2c7b5596f6107a7f2ccee93c20643f9b6cffc29ea3df14eb6522dabe7f2e71b308ece696d5fe3e51b58e2a75ca1fd49d64a7966f09d948ce72b7ace1ac1b2f5af66272bb88a7d9f47825d86232fbcdd34f9c2a925b966d465c2dc62af652849edb74a1f2c88b1bb39869772320f98e1f38a49499ca4a1be3e5f38954c896dddb714f03c5e2b3634ac2898662026627106942d6cbfa97ebe50ad9eba7585c822604f2c1d7557c6252d625cbc630ee64eff000f842c8574178fb4359852a92006b2b16ba8e17ce3eccbab65208b833e65feba7dd7e1e7f7a83a48e2211dd1f5aff36d095dad24eb770631d121cc53cc4eac1a6666d6e1140c8a759559c6b671a794560c2844f7727753c42589b1e1684a8aee2f9bfce293f112033102dc7a476694a83a775c39f1bfb2f1b41bb2dc6c04dbf36473e51585a72f05ae3bbfe50fe71b16e8c46ea0acf5685a316ea52e4d886e3c7e31512268d9944a094151c6e40bb0767e99463ecd4aed080740ec0dac0758908f4ba5591de4a6c751d2264d4a24152ad842b168775c1f6b46d5aeede7cc723b34aec55de376c26f95f2e31f6669154db2e5214ed3714d18bd5798b208e0e9f28ecd3f9bce3b07e7f4d1e8a3f2c2a992039212f90e7c3a98452a5618b41025154b566951cf82b78791fe63295352b4612ca494ff00dc1b97be2a50b9551369ca706198e0e6e01cf0b067ea63664cf4da52898960004a40372199471375d0c6d3c32a54a929b20311bf88e47908953d32df525dbae514b58b041201b69bbe6c629e753a52a54f49595856ee3c381dc3e4a7d0e41f8c57cf9677e989c12d44cc2ab8018866e2ed1367a6a27ce58b70e6c9032b33b7c6360ce0a2b4e265277ae73b80dca2455c8453ad3325e29aec08564f95f09770dd39c4fad9322449422663c285023362a38b2bdc3373e5150b953c266050725c8c39612dc7946cc5b532b09c897e62fec8da415e8d50537ef123c093c629294d7ed144809b2e76feb8520bb9c9eeda8892912d12e5208fc34a5180171ba1b3e79e5625afaa1409d0dd8905d8e79372844c4ac6eab8bf813fb3c4b9ce55ab16f9c3898ade2ccc5b36b44b980e267b16bdbc7e51573a589eb052a7dd7616ee0e5c2053cc25390c5a9c9a11b209de99342716576113367a25162b2a19022f78f47963a73ccc09484106cc6d0ac285a5880149661a1c9fe31f69a83f10574bba42302f0070f738d4dd19f9c6c6aa9c0ac63c12d8a462533053f3e662b2accc59411fd319f11962e91daba9c0d73109ac32c0cf3689bb4d562c46578a8ad5996b48c58166eddd26f7894e5454efc4f4e7d2de114f33b159502cac7a16247ed14bb531324f271c399e99c4ca94bb850bf38139248be76f6f8c50546044c9591cf3b911b776b9a594a9728cb519e92161446e86c3eebc7d97d8e254a995b518fb5a83bb63b895b2c14ea1c0b728934e994e94acb29c3bdc62773ed2f12e44b924896e5ee49d79f5842129eea425ddd8367010943e121f503df01b1680b8bc337ac0f8f9c108531606cde66149ef2486fcbfa46832bf94492a51009e007944f94a53e2dd62e919e21e4de71310a3bacc441c4b467742ee33d0f3b79c075e76c37e2edece5134029b8073b2838b822e358a992286a974f241c066a6624139e3c33660c8db1a94070168da0b2662541d2ac393fc6d08aa7ef0188736f26f8c4b5e3f64118993ce27ab02952dacd6e512f10e2c5fd8f0ff00883ac22590312557cd9b36d1df5ca0cfd16ac1e7fb42674a00133f2cc61bb3def8be1ed895b50266b21f0241372c55a3626e6f91cb2d625534cda152af5d52895b2936befa43be80a5395db489757290e972d24494cc643252a08ea5fca254e4cd00a7bba1e30957281c61ae4bc160059dff007687f3b74e709dd0cfafbeff00182fabf8c53e153a1f0ab124a4e44870edd3e11509ed6566d3502c3d650e3c488a85165292f6521c8e412e2de2f1a1989f5ac5a067ef89a40c46ccd61c728db0c2a2455b300e95a475c21f9b6515e652c89b2c92e30172e3a75b40ced128948040cdb28ed6fc39c764b9aa59d711baaee9e03f6828c218a40cf20c3c3dfd615473184d74e07b377df9fd67124fe187ef0c56d6ca2de5153799c7ee92139a9b76f768d94b0891513c30528e0944fe609601279f7bc61413269194314ca8654cb77966ee78a865f57a35112929c3924b5bac2576ee5fa476ad66bf080b2fdd8759987bbd9eee107a076e6ef0ad2ecc7dbca31ab3721f4f00202b89894b46f1c5bd9a79369e2dcb3d759954854b4af1615a06f0cf10cb3b35db4315b52243ccef218a948767b3e6c72e912f68cb4315e212a6dd27309274d347e1126722603763ea8cf10e3a379c56ff00c34de386c46878fd345524ce9465ddc5d2f7de03c333ec7e5181610b4cd1eb9f718c17cdaff5ac4bb5bd9ce30ab8423739f97ef1313da72e50259008497e4a361ce04b525ce763f4f1569285027d61d21373d2302a614cb424a953084800b7c0c5051764296988c9467ccd7961e7662fa3b359e26913ab11281644b97d779c74d224e1191bea9e0c7e39e512e6050272bb71f18c632b7888c5191e918d07df782a49364f9fff0098973fb5405e3b1e70a9fd912a777e7c808455256920b391ed8ae38a591a949001c8386114b353572154d32d325b86d3775114b31689dd9ccdc5c9212d9634ab79c71184de2b67914ab2d6559f3e7191f8c54c94cc953086c4062b664e5f1820853333344b4e2574bc2a5af024e15107d6625eede59460529c32835cd8e51866649c247139f3f8c2a44dc2eac864da9892a5774a4917e915aac403866367f184dbfcd72c79139f2f846ccd914d2e9a4cd9894fa42d0959294874850717d394762992ac692e720fde03fbc53d1a65e25a9b1cc3882cf798e8f01012ab00f67619f580848c920741184682300091a9f38bc1657384818721afbe24209468dc0066f17f8089b25dada88452294fd9b15246263670e32b98a8a55a92858030eabcca4a4b5d1d4710e226d0cd9751e93245d3df19099c5b871d627144c5c99a87ed3180b4b736209d3268da0b29a5eeee92ccfc8f28c5ee1ee8d15d22a2591309cddbdc3dd12992ace24ed234c9c2c852402e1434372d6e663d3e5d403ba03f00cde2d7e8d12e5ca21271e6787ea3ce3b5952ad65f17e1e713b68531494265a10588c4e0e6336c238f18aa5e32c327777e5f5ac6cea4355594f2825c28efab827132adaeef311804b404819042472084e16f1ce2661c21c753c20d42d44a929fc397ba0e2cf9e56e97896a765e7880fda33809b7dc006cefc1be704368d056016897b4e9929b0223f89d317c4a3958156ad0368d2e17131942f653183b429c9c48988089a9de4e21620617507cdc6278357217bbdacbddde0ac49b9c9b3e703b1fea054b18f4045af85db4767f178dad352a9225a18b3174ddcb10d6d61bdc3ddf7564a284899a2ce11d5232f65e32ce1473e967faf08933720d0663076f289d57986ced0598ea6f01dc0f28fb2f4a076f54c1c284b961af701f0fb5cc16d62b57f878519a88030ea0d94dd2ef130f6425d28f5c625cc1901fabc78f4894a12d06eeedd9a5f85894f52e6dac4b9c08e2467027001396f7779dc8b71bc09a14f7030e65c5bac76896c78861fccf6f6c4dda046ea709fd472f0e71294a582a597255f00d18127303c0341928cda13290748f459243917eb0ba390d92b3d14df031e8b281618fae33ee689f2f05b128df58d5a021b5f28da1b9474ebcffda88232cd0d9c7a209812a06cd8bbbaf0cfcfca2a6514b7844b1bd73e518918021bc7a93a37c627250f6bc4a91dae261dd6193be5cc366dac2a9d3292a5ccb002d6d7db1b26b974d4a8024a958a72a6be222c09461ee1ef00f8bc18e7076acec334760b256774e3ee0cd9bb3dee1eac2ebaa26196a452118199e6f78f13f836189f8c4944d998a6ceb2e66ed8b848cd9adc394145d1bfdc19367afe684a163104afbc5ef66f3bc293501493da5a5f7473ef3e7c4f0f64767b42628a3b418661ef365e18afed113a9d74b2d08334a96bba94cc9b6402711d183bf38624dd595f2f9c48ee78fc04621c614abd8da3281318342d4496631ade27dcfd7386e5f76d60db325b8622a9efc199fa3d9e36455a663485b12f6c5f978748aaa40e5419415927301ad9758992594d91e1052a1c5b8c264294ae2fab448a254a27162c36ff0051e5c780e7ec8dad512d64c8944ab0b05ddc02f7079c50b26964a41070a2ff00f713f1843153381131296b28740446229b88ed8eb9c054c5fe66f18972310c44b0232f26f16844a09eee9c22b1454a94ee2c6c7a9e30801f2d225304f8fed0b66b0d7eebf08bf08716b2ac5fbbf382a49f50be96f644cb9b820f001ff6891b3e7ce6514e1967539900b1b59b23ac23654a4972e4731f331f6a30cb9926910e13d976c47fa886f1cdf9b359e2529485852494a93707c629769a6702263768901c626703d61bb9b5db8eb0b14f380292ca777c3a7b4728f47402c576d3772e7de8972a44b4e2331ffd2dff00d8c6d1da6a083269c8dc0dda6bbc1dd9ad8496ef5d9e1588ba8a9d44b92d9f9c7d9c4499bb3a4ad48c6b0a5ca5ddaf896a49cbf29486f1e50bd95267cadd4f647460fea9b7ab0ba032cb28a9ddb2e76b3f0bc0a407bca7e81be263d11b2c87d1d6254b4775bc63b3e7e5012dac5625d52efa1d3e7094106cc7c9bdf1da25162b95c6f3403ec6fef9c1a44bb14071a111e8d2c1ba516e420ca462ee25ba08ece5fe54fb20a25fe54fb204b492004a5df844bd9eb15066cd0025cd88b7f66804330c9cdbc62b2aa45148995150a6972d254520b4c57008e25dbc22bf692f6854cca956265eea01f52500c917c9c0c6afd44984e2d1fc21248c2af592ec75cc98935534277cb8e475faf381582ce03f3f2789d53317bae027f41854b17393fed099414a4a5ddcb47d989665a6753622412958d405e10de2d96b12c04211bc1f0dc3e47f78da5212a485cb031123b43a70cf8e18ecb0e90cac9a1018e5a43c2e66105458246649c8713c236bfda8d91424f6b5a852d0184993816ade4e2cf173cfd53d2368ff008815d52a549d972132527704c9d28ad6a1fa7f53ddc691e8ff006aab9ea4ff001099da7ae89b3e520e1dddd97ea80cdcc82ad60adfd6dee3cbeb9c155ef7851833c27bc1b85fe502a12726f6fca29d6173d03891e5fda1497115e4c9070e20129254a00db75f2d7db1b7aaab2ad413d94f5c849cd38803639db2eaf031377746f65b86912cb278c21d7a373cff006801837de4f27faca28a94165e1c454c128caee35bfba36450a29a4826f3161c9c385b5033564187c204b7189fcbe7156c9939dd45db8612479f94150e31d2f155b428e8506656544ba748ff00a8a0eecec002492c236a7f8834a818364cb5d44f05b187c04faa47e1a9d9c38b5ecfac4f9ff6c3ed0974f6a895333407956cbbde3f979e91b3ff00c3f9ca9826ed69e112c395254bed1f8fe2634e9fa7772bb5e83657d9dd9e512a44a973e6a756ed5b992d87361089ab503869529485614e57000bb610d771e1020e70ac8c6d39aa9497de63a70e7146664ca50b6de2aef2b329be47ac53fa68aa9783084a48331dec9704b73c3e70fb8951cb03f5ca16b130292b46e2b3491a65974bc4d9db325ca98926561629523759ff00291f08da92252d4b9f4c81293898cb60949193a465a13d4c071127965cb2cbee6862a2025ee5ad141f676aab3f152b404a6d857de2e751af2e4d1b37624e9150933bb354b9376003155861e1a93e112a4105c82919b656f7650ab2776eda0fda2a6699c4a70b016cadce274b2941284e35312063ecefa39d78346d9db7f6ac4ef45a6a0552267af04b98133269526c83603f0c12fbdfeb8a5fb1bb42b49a8db358b256719056a5103f2ef1cbac526c4d8bb388ece58a8981bbe944c20e608b1639334099348c14f2532c7ea185ba8683b38ad4f5334ceb8dcc58a50e832cbbdcde24d2ca93dc4a2586b610037b0404801837f7bfdcd0458f48a9a24549254ae059ad6f11c229e94225046839476694659ea78c4d51f4796059d203c29494a14a98a64a6c55c9ae7c385e3684d448a89a4cf0994a9988159677761849b757f084ca13a43db0cdeea86f0cf0b8c9ee395ed0b9410b525bba59f27f0f99846ee9f08782a170f7ca367d3cc983b4ec97845816b3f17f8451aaaa5ccff672a00d96fabeb8746079bb3d9e25aa6766973855eb733c62927f6c863de4303777e7906b4301a4540c33a601a11e690af8c382e088992dcebbb93b10c6ea6186cee6ef9c4da654d494be10746f988abaaa4d96a426a14c14ccd2d4b5bf31cf4be444236d51abfa689ea7e12efe2926dedce0ed894030a7ab2ad7f0b2e07bde3036b026d4f57ffb23ff00384ed0b7f42abc650ffca020ab8886c36e1f776777d3eed78c2e662c032013e71b496d46b486c456900f5f847db59d53336b4fa5c644b4a10a94124b384b6e0ea74d636114cefb39b28a404ae46344e03bd75cd62bd7bf7bebce3684b089afa14df9ab8f58c563bdc75896b5cc289684954c5a99219dfc23667d969f54d3abb0ca41be16c2a6496d46640f389122929a9514d2a5cbecd03ba529de50f5c8e3ce0ca42662972d2996eddd0d901c3a462e71473bb19c957aabeff3d2fcf8409e854c042884ea146cdee8a9bce9845ddbff00888ca065047285a10bb2d29535b7920b3f5113366524e042901045c2a5a4053f5039c0d8d849eceaa7beb8d459bfb44ba332b3998cf1832f8a5f9b4085e67eb4811a7b60c0d3afc6151b56d4abea2368d052cedbf46664a0ac546165f538d314294895b4d09484a65cd404a4580fc341cbac6d3424ca94a6b96f71844a42d68491652920f4258c6c4d8f414d265d4cb920cd7c2ebdeb10f937110145682a2deb65616240f21f76b1813c3e9e0d8da12a3c63330aef7d7284e9f76107310a481784a4110b4a5b28c09b5a3fffc4005310000201020403030708050a010a070100010203041100051221132231324151061423426171811533526291a1c1f0244372b1d110202534538292b2e1f1630716306494a2c2c3d2e235364483a3b3d3e3ffda0008010100063f028ab61f99ac40f716f9cb0ff32efd3e95ba62b32b97a4a8d2477ee603986fbdc595fbfa31c78490c9efb346c3ff0012ff0087ae28b334d84b1e9936ecb5b50bdbc0ea5f80c5451bf62ae161a49b02c97e9fb51b38e9d428c4b4ed7f46ed1ff84d8118a694f6e0f46cde1fabfb3955b6f106d88031ed1688fb788a557df762a47b86260401acea1d7d6b1fe38aa8bfb291c8f658a497ff0037bfbb14f274d3347d3d8e3f0f1efc467c60fb79dc7e7db8cd63eb78ae3e30cebfbedf67760edc4a79978751093749233b1d8fac3aa9ea1bd98cb594d978725bbcfea6dbded7b587df84efe48c1e9df347f93b6292224164a76b91d92ccccf7b9b6d738686e0949a28cd8dc5e9e956336f1b35ff001b1c06fece295be2c387ff00998ac3ff00589145bc15b47ee03c3f1c33746ac9f6fef4a7ff002e0b7bbd98a65b6c24563b5f64f48db785877dbedc18c5ed02243f1dddcfb2ccfa36b74df0260398b0d1cbebdf4456fda9e445f675c430201fa252a20f032dadff007a43f7e278c3f114c8d63ff0e2f4711b7d70359db76df12d4bdb4c4a7adfb4d726dfb29a89fa375f7e2494facc7af70ee1d0f41b62a32e7de6a6f4b4de24750a3e24a7ecb0efc45502faa290165f15e8ebe23526a07dbf6e12ae11782b235901fae02ff986963edbe2bb2e3cd245e9e10de3bb6dff00dce53b6dc4c2d446c0353ca84a13676537d561e16bab5fbd8038e30ecd4c61efdda9790fc6da4fc4df15d44dccda7889f15d3f732a777ad88dedcf03a9bf7f2bea17e9ba9fbbdd8a79c76658763e3627dbdc197f762be9ff00b4881b7c1d0ff997ecf7e3daa7a7bbdd8a0a8bfce4477e9f45bc7eb62b8a5255490c9000254a795e362bc45235aa15bf36fbdfadfc3078b4753176afc48254b5badf528e96380fb71a94d24bed093830bafb05ec6dd2f6b75189aa0fea5216f8ab33f5dbbd314fe5049346233956c756cd57cd4fc25e84b79c295d237d8f81c42e4fce9a99ceff004cc7f9ebbe2ba73d9861dcfbceafdd1ef82e6e4b3163edd4757b46328a13d56212b8dfb488a9d07d677b0fb3d95352c3d1d340ccc7b85cff00fcd24fcf469ac499a66722fbdddaf6b7e76d8628a69c147a49a398a9fd670e2d4548bf678cead7b755b62a0a35a6646e1dbe93031a1f6682c661ed87150e0dc711950f7694d87c0f6be3eec4511e592ab988f5acd62e48fd9d098d85feff00c311ccd71c3631cabf53b2eb6f60bf536d43d983343bc356bc7423b376eddbe3cdfdfc4f4a4dea72f6e247e2d16fcbf151227f757c710484da373c193f664b0d5f06d2d7f018a80a6cb23f123d3b72c9cd6dbe89e5ebdd8865fd6d13f0dbc748e5bef73d83193ee3efc440f666d511fefeebff007c2fdf89d2d601c91fb2dcc3e1661df8cbc52c12d554df842282369653a7521e5404eda1093d003bedd3ce734aca6a4d71b2bd1c1fa6552f30b2bba48946bd17d2435354007e60245e19926f304ab9d99981cc257abd00f369582d1d1b69fed1e958fd62355d380b0d3704698cd2d3d3d2141ec920488a9d97b06fcb6e9862f573ee37d550c58fbcef7e83f8e2cb593dfd95322f67b3eb0e9dd71b6025569ac8ac3d1d6470d5c46c75805670e0ee2fdc5762a4103125f28cbe13326895e891b2f775b38d969dd29011a890dc1bf4f0da4f2769f3bcca0a1478aa32fa1cc3833d25254acd249330aba554974ce26906834b26866041ed0c4550623534294c3f4ea4d73d22ea91c7a57d20c0761cb3ac7d6dd6f6cc8861c5975c61750d4de89556c2ff004a538a729415af119a20ce94b39411974566d412c6c08defefeb81e6f90679324704680c794d7bab13aa43a48a7dc5dac74f78f8e2b618bc95f289ab2b098d54649990e4368ee49a6d2005e21ebd08f65e864aaf257378a9927592569e98c0a021d563c73193a880bb0b6f7361be218aa28da18d327a7d536a879f309eaaa24aa88a24af25e08852a862bc3b6c8c77c669150d0a42cf782804d5b4abe8c270d6762b2cba0de49a603b439548b8c44f53f244508901903662ccfa14dc85e1d34839bbaedefb770952abc9f8608e311c4af5b59aadda66223cb9d412c48b03baaaf7e3872d66432b97672de715bb5ec028fe8ff01f693813d26595f28a80246e1d1d4310deb6c136db98fb6fef2299f23cdb8b4cde83fa3eaae508ecdf8636eef0d93e01d3c9ace78720d125e8a451a1b7f5adb86dfbfefc3f9b7933989889d51b3089363fb7303cbd3148df204c93c63439966816e3b8dd646f0b9dbbfe18a9866cba9e386a52d66ab5e57d256e6c0fb09b7522ddc3092717288191836f5729d254dc74a717df14b519ee7796d389858d2d1eaa9ae911356b9638db871c49b04e2cc74ea3b072acb81479653c74d4cbbb396692aaa8f52f3cf212c431ecc602c2b6bc7126e31a98b0fa5fbbf8fbb7b2db04ec2fde7a923b80e6bfbf618e56b9f66df729fc71c8da7dbeefb6ff00de38de53e3e1fbb171295b781b1b7db8d465d62fde3ff10b1c03246512f6e2f453f7ee3c4d9ba58e165a79de26d8f237211de19475b8d9ba8d3ca56d7c41966774747472f2a4399d2d2d3c09a8d93f4a48556c5aebe9e25b6e78aaa017c24b13ac9148a1e3911b523a30bab2b0d882370475ff00a1e5a7a74f7220fdcb8e910f87fedc754fb31db1fe13fc71f39ff77fd71da3f662a336ac2f270fd1d3532b00f5352c098e24f6595a495bd4851d8062029a9cd6be5d534ed64525b4451748e18a337d1142a7917c6e589249246bb9bedbefdd7efebdd7fb304e961ef3b7b94775b1b923d97fcfefc5dfec1b9fc3f0c7a28a63d2c74f29fc7e1d7e1be35ac2fd2f6b1fbb1cf149dfea9b7dd8b30ecee41fddeec02c4e90c2c9eaedeeb7e7a6d82355e307e363fe6c2307e86e4dedf67d63f7fbfac790671316a49dd7ccaa9d8da99e4b591f593a2291bb5bd9246d560a5ce0104107704778ff00a6972b824228b24bd20e7e57aaed5749a435bb623a7dd755a10c2c188c04e3158cb388a38f979179388d7e6bb69db7d81d878b6be623b8f71d56f69b8b7bf0586c1b75fc47bfbf012088b5fd63b28f6937eec2c955e95cefb74fb4fe0a7ae2dc25e9eb6df600a3eff7ed8b18a2dbf6437c76c1f463bfa0bff0fe1e38678620580e91af3d81b9dba74bf43d47bb050dca152558dc5fc1bf875c02fb01e3aae4f80b03d7db6c004c8b6b594f79f01fc6d8a75524ba5b4eff004770357682f89f11d6d6c0a79a5d55d9595a7951be7381a479bc86fbb8b068f5f5e4e6e6ff00a5cdb33d7a1a928a6689bfeb0e3854c3a375a878c0b8237df6c544aeccc6532bbb310493abb476077dd9b4efbef7b0c162da5e33b1ef3a4580efea6e4fb31c406ddfd76f1b1f6ffbe238156fb8bfdbdffef84f4617617f69dbbf1a42f875f7dc7e7db8efb75176f1bf4fb7bbedc58eff00bbeebe2de1f77e7e3e389174eec8c2e0ee0dbd9b61a6887771069ec907aedbe9607a81b1277df709a3aec4f4dbd9f0fb700b47aceaebd49dbe975b8fb861788965d56b7d5fad7ebecf0f1c50491b6982b1928aa97b41e2a8703a5c5991cac9afea8bdc120ff32bf39ab0ed0504066648fb7235c2471af70324ae89a8ecbab51d8624f31ad8f25a4e768e0a25895846a19bd2564e0ccefa45b95a20cfd9845c0c694f292b585fac8b4f2b7f8a4899ade02ffceaa88100d756d0d3589b5c24be747ecf3607a1d86f61cca7bf620d80ee63e1617fdffdeb0662390bb91f137b0fbf7c058c75fb3f7db73efc473c8baa436627c0772fdd7eedcfc00445eefcfe7efc7a460a7b9bf0dbf8dbd98d37d561d77fcfc6d8007c3a7e1b6fe3b60102e5bbbfd7bb17dc35ba5cfe7c3132cb1dd197a0f775dbd9b11f76d87888f47ac88e437b35b703df620f4dfe1800dfdeabd3bbaf8fe6f8d265d85bd973b5afdfa81eb736dfc6d853082b3412874f0d57bf775500127ae9e9e38cbebc0b79dd2413dbc0c9182c3e0d71fcc9e8eb218ea296a6368678255d51cb1b8b3230f03f68ea31039a2ce956aa658e3a5a6ae97cd35bded1f11c35447d18ff005a5fdae985a5a4f277295896e7d351c7572b13d59ea2ac4d3c8c6c37790ff3b2dfa07394461e37a2ab2bde3a6927bedd76ea1f4f77136ea79c06f6ec3fdba0180bd05835bad8581fdfeec411dae0b0dbecb5beef6e2146015d941606e3e036eec101d35d8f335addff009f6e39655f036ff43b6395cfb7f8fb3eff007e2c0f8fe7c705b89703dbfe5c052c3a6f72074fb3edc3c6bbbf7776f6e9d6f8bfd026c17c6fd7dbf9efc595f4e93eb5ad6fb3f77fae03ca19a32daaca56edd3a123bbbb7eeb7b711aac2cb2bdc82798b3580d4cdbf77b346ad2058e938ca2dd5239e2607d568eaa61a7ecb5bd9d77b8fe69900e7a6961ab4f1bd34ab2903de81d7e3804743b8f71fe7520001fe9ba53bf75a9eaefefdbf23b40fec9b5f7bf0dacfbf885fa3f67d0b0b5b558a8b293e173eb0dfedc2b104c1425649dac2c2ff3710df9a491afa5179acae4da38ddd3871abb82bfdaac474dae39424dbefba173d7720f48b5af00709b569ab998c932b3d9a416658830d2968d55428d7a2e58b5e4e29b9b5e2ab049b7d56a1b6af0bc80036df6c4335356cd26a4e21a77580d52690c5c320a8556d206a3c22cda2f2344aaae56f1cd3b6dcc3cd50807a8dd6a9bd5df700edef382b24d3c654b837a550574f5d5aeae1d1a37beb64d3de458e15a9f3baa790b6992139588386a2f660ff2afa73b0b2a59406bebd40ae218be54ccaa4491717d1d0d2e81230d412cb9e4b2055beeec88dd74c070de71551d29eab356c350a188e818534350ea7c4e965f58e8b5f1e75534a7e4e95c3d357d3bc7534532ca58c023aa859915dd119b833f0aa366d512db11e967b5d540df4c69df6f6fd6b926c4f5c718172cf7b83bec2c755bd5049e5e517defd714b01aca459b8f5924909a8844b1992a6428248f89ad4b269650c16e8ca4280462eacac3c54823eefe6153d0820fb88b6117e8ae9ff0f2fe1fcecd0449c49a878398c6b62495a57bd469b5f9bcd1a7ee3f8890dbaadce91d6d60db74ec8d43e363b72694e621801b76b716b0ebaba6de3f6629a9741b1cbe7cd2a5fbcd4d5b98a32534a91c1a311a462fd4caeafe94869ceb1d588d7b2c318b6efdfa798000599dbdc70159a66765b269408195893ad2f663f454ea26c0f71be219ef2f02e164526ccdd2e031b8d763b6aeb7c0883d952779207e8da80886c6dd56c3c2c7df6c2698cf2430fa35f9b8af1a6bb01caa5daed6ea35735cef846472d70aa4924dca5b4c66f7da36d8dfea9e8a2c642648d1363dae84dc35bb86f61b2fc71939e32aca4578d5286659b4d46ece547a355d7c242e77e1127617c701e2a090e91a9254598b093a152d60e8c6fcfece9b6331a57a33e6733f0f31a38f7a4a8a17d1af54563a2585c89e9e71cd04aaa62d3b5aaf29898cc94d50f1249cb6740d78e426e3ac566b1f1f7e2fca0800bdd6c59949b8d57d81ed6c3a7286f570d4f1c9cda83bb01a4b0813cce35dac6d78e4ea6f6d388592b6aa0acce6633de3a895248e829fb362186912b10e3a5d5dbc315d9bc9e50677c5ae93e4ecb13e54ac016c2f3d4a2f1bf5614aab01f3896db5dcd7e7759e5767ef0436a3a0866cdf309526ae94037d0f390c90a739ea3b56b328c4ae7cb0cea6cbe8538d39778e412b1bf029c79cabe9e2b024ddacb124858aec44bc1f2991f27a288d456ced956532c6c14b7a3a791e8b88c246f450bead5246ad2ec4818c93ca082b5636aca675a95f368cfe974f533d3ce6c364bb477d0bca06e363fcd2cecaaa3ab31000f793b62aa8f39f29b23a18aae9a7824e3e6b471c9c39a3689ca2197512031b594ef89041530d6c31978e3aaa76d54d5411d912a21945d59264005c5cdb86c3c4ae7397ca23a8816a380248d64b09e368248cab07468cc72c886f7b8240dba6619d5548a269324a313684b2ea9653185444165d063236d945d4596f8f4933046bbf5b0774b95d57046c79829eeebdf8515cb148225b23e80addf6e65607bf6b5bdb8e1c71cb2c729bdb8ad60fa81249d6a5aebddab6eaa41c1ad7a7a870b1305712e977ad66414eb2a981c4b03289178519a76d3aa6137a168e56e29f4aeab2bea3d59e65b807dd8e054eb559fce2681618c3096b5235b46faa44e1a491f3c8e859cf9ba858dd8e26a658e56599c1e23bb9d2754645b51db49565e6b8707a6c1c532c10c55cfe6eccc46a456a89d563667bf145b84342a0dad663eae23576558b8923451a24ec29d66d32b53711c93c356178cc8db12dd7562a278d134c94510d27956453ac3f4bebdc123572dc75bdad02d0d257c7e51c73d18ce6b6aaa225a09f4d0c4bc0a2a65763a8b345e95f47cd310a4c8da64a962aadc0b47736f48e394281e0f662baad652ec3bb1c28d99fcf2ac451b0ded4e9b171fb31234ac7a769afdf88b2ccbd791248729a00375e146dc2d7d2e56faa4661fabdfa0c50793d9723bc59708b2aa6ee59ea4b2ad44dd2dcd29b4926e34a6bbdb197f93940acf4f95a8a71a16de7799cb6f399957d7632370d4f716717b118a3f2568352cf568af9acf176aaeb2a4aaf9a44c05cc50ae88794fa47b2b1da418a1f276906ba9a868e5af68c82f3563d963a71a4df4c175500ec64dfa8385f27abeae27a9a7afa89e406a215113d4c54d2c90a02d7d11ca641ed6d46d7c3c141366b9acca1885a5a0e02c9a7a88dabe4a424f80d38a8f913c9a99e5881655ccabd212ca3b478504329d4bde9c4bfb475156b96e5f9250d5400baa1a7a9aa6310ed95e2d4aa974ebbc563f47152cbe5456d25552932bc396ad3d02c94deb15f368524bc47c1efa7b44dc62b72dcd339cd2bb31a4125752355575554354416fd2603c49589651ceabdfb2f40715540496cc32526b69b576a5a0936a98878f09c87f7103a0389721a9369e00f2d1b1037849bcb4fddb8924e247d7e75f4fcd2e175a33d4bb99002e42e88c5b982aeef2496d5dcba36b5c9c2349cde7a268ee7b9454cc6153e37691f867dc3b5a7057a037b30ef3f88ea0fdbecc6aea75f686fb74b7bb7b604b5205a1b358d80b7369d4001ccda481da92520f2b9b9c0853969524d6b08bf3c971e9196e50305001d3d2c12e556eda86dcca2dcbe3efe9eedfa776224eccb13931b93d2450595be3d3c6d7e988595386e22fd26366b8e30da4753b724b6d5a7f54d75ece96310eaae503585c0f11e917729d36d8f504f5c2690da76d37375b1039b40e526d6f1fb3197f15b87179a49e71315b8a7a6a6d53d4ced6df4c50ea76dbddecaeaa992584499979fc4842ef0cb33c9044cb63a4c482253baf565dc1c574141324f439415cae2b7cd54e7136a158c49b7123a283d1c7a4e8b9a8b6abdf19b7948f1c492449f25e5ab1a05fd2ea85de4b13d60879ae3b63525ad8cdbcacabd065a58fe4dc9fd1a2eaccead5af22aa2aa1f3684990937bab5afca315fe56d7c867a987565b92096c7899954a9e34f63b68a5889736d8b332f5c5779659bbf9cf99de93268e4550b519bcab70eb1a044e0d121e3b5b6d4d71cea7157e57666cd349c49a0ca5673a9aa73292e66abe6eb1d2dd9b6e5e2f2a9051713f957981d5595af347934527334929d427cc4ab755849291b6f7949faad87cca9c0e1cd3c9679e7e1b4ac3497906addd4b1235f7b871dd8199d1f254404356c2a6cc8c0ff00598c7d063db0bb21d8dae4e1733a61a25523cf23d562b27f6817fb397bf602fdd88738a35f44ee43a036e14f6b98db6ecb7697b8836f60a7ce29230f4757be8bd84529da7a592db01d74dfa83b74c257d25343534b98c626a1925ba79bf5e2c21d476975b452a9db4953dc314798d270be4dcc53ce559f655a6756f3ca7db62630b20d16624e85505f97060a56534d552c5554b2f52d452d9e3d04753a7d1dfb9d01ec9de2aaa91a6d95ba2b037479a6a89e1496cdb7cc47233af74bd9f0c529203e81529dd6655a8985ede076db6e9f6f317baf5e8c0fbc30d8fb6e4ff9b008e82e08d23531dfa69b69b5bb5dff0047c76d93736f026d76f61b6dee02f7c24f28278b778f57d1decde1ea9b7db85553eb9240e8b6d86feee9df8760398732fe1fc3124679591d85fbc1074ffadb0b6768d924593580197e2073274f578a1ba6941be3471d0b0b7284a8d47ea8260006df48a0dbc2d848e322313545347592b359a4a54733f08b7ab1bce90ea5df5b69690f28b4d267dabe4fafa45a65481ea44951241412068639294a5444d5132a20992488c77d7c45d8e32e7cb7c9eae932b8e19abe7962a79248454d4bbf2ea259dbcdd418aeecc42f57277394792f4eaad2522a3d642bcd2c99b660431526d62d1ab2471efb07236c649e4665ba641421619953a4f9d55906ae56ef22127877fd5a8905ad8ca7c8dc90f169b2c2b964565e496b59af98d7bdbbb5872ef6b08e266daf6c65fe4964642e5191abd31ab36e09582ef9ae7137ab691d5db51621c08c03e9309454c4527931e4fd31bcdeac396536f3541f1aacc24175f59d997af0db121bf98f93d93c00c8d6e4a0caa9b68e25ee3513db44637d73316dc25b05f298aa6972ca645a2a0a7a55729153417e1872a0de66d7c494924967f0b61737cbd6c8085ada5ea2267ed232f7d34dd158f43cbb1188b31a34d74154385514e4fcd163cf4d2dfc36e13902e37bf8da4bcf93e668016fa0a4f2483b84d4cddaefb7c2d3e4598483cceb6cd4f51b70e3988bd25627d47b88e5b11b121b78cdab3c97adf47548ef2e5a49b04ae407541a8feaeb631c9ddaf4b6fab157e4f4eceb5f4e65accbc482c44d02daa28d772c5a600be9e50aea714fe77cb51e4ed542d33b76fe469ea23e3391eb79a36a1d391186dbe331a01656a7a8fd099245d35103410d6c7c3209360d5954a4f426c37b9b352d5452c524553501389195d703aa9d6a4a8b82daecd7656dfa5b77f6db57c0fddeef0efdf1d4f7fe40fc9c15f67c714ec4b709638e07d0ba9a05b0425945db909b9b063deaad8578e55915ecc1bc7577fb76c45928576ab31acd2c9c23c0891fb09acec647035d975055d2ae55f97151574eb68e665636ecebd0bac8f1e7bfefc2d88dedf9ee3816dcec6c3d6b9f8785be188e8a9e3692a2ba41147c20d78e30f1b995b493f368ba4b1d29aa45df6c792b944d98d34c68e18ea2af2cb4e6a11a791aa2a2a263c2f37d2d043040a38bc5d44f2053cd53c6711f0e89e3663abe7ea14992c00d768d7504555d5a63450b7db19a79575999c13d2d13bd42d43d355243f2a5672d1a180a34d2ad396e2698d0b7229b691a8e77e54c99ad24d56de77459355d4712956a2be704d5d6c6264e2eb86076e18d1bbb98db4b74aff2878f4e338cfd64cb728e2d42452d3e5ae74e639942b29495e59d879ac3205b20e24b7b3606571cd12f951e542c0d534e388d55164d338f35a28d82e98e5af7b4d3a97591e3d10e87d9843e42e592cb3794157534ef9d1a7457865ac71c99719d5f598e835005787a38bc499dd7495c2790992da56132d46759b87f43254c0ac6a99db644cbe817915e4ea51987a493537c97e4cf0fe4ca41c3f39921569330a91f3f5cda812bc63658d6f610c71f4e984cc6951538de8ab32f6ec387f9c0abdf0b9eeeb13f43b0b688ef365b5ea78901235a2f83784d03734520edd878b0c4f94d41e2514e3894b5361fa34ac2c8e7a6907b33a0df7d56f11934a9ab32a69655ca66d4089f41b4b405d493cfdba566ed11a57636c50f94d5d97494b5342b1c6d309627965a78c6aa7a99234632c72436b169147123b3eeab8a1f2aa8470a469956bd536e066b0eece57fb3ad41c6b746bc8bd49c79295d4288f97f9475f4f1555338d70fa6942e65452aee0e961c45437079076313d1ad2d3d399630a92431c71bc6c9630d8a00c154a20d3f405bc31514f346236869e18146a0cfc3a6e2466492c0004f269f117dad6b54eb23ea8f6201ec2772badb624927d983e3dfdfd7f27f0c6c6e7c7d5b1c2a76b56cde1dfd7f8e23d3b0b8d216dca7bec3bbae11ca2737a2121517f68d56bf53b777374be347152e7bafa486eed8dbbf6f6e0293d397c46c7f27f3bc01f7d7c8a7da3985fc360d73e36eb6b61e6953d0d3d3b07a995d228695385233d4c92c9c891c313f164661a02a73db7c673e52528925cb69a4868e8ea241b4d4740b1059b43a2baf9d98a27d2fcf799cb0b8618a3f2669a5e6238f56a9bf6bb0ad6fee587ed0c64de49d20fd2279a3abad1cdcf9856f2c69275da9298a6ab5f4066245c5865fe4c5233c19264303254d491a5569a9ad3e6f9a36c6f255497584efc46f371eb62bbca4aea4e1f92de4a410c34196b72a48b4b75c9f2640756a7a87533d6ec6d171f590185ebffe51737093671994d510f93b4f27ab52de8e7cd92373fd572a4229e8c05606a2c3a45ac79f35e6f2afca40c2910da4a9cbf2fab3a5aa8afce79fe665b4c27b4b0313b3ca5709e4b655a66cf335b0ceea9187a18c5dbe4ce36fc3829c0e36632ec18ad9af18031f2565596e5d9c4707f5accab61e2b55d71feb0f4f661a6916c91403a958cc8777389a09e2f49048d1c8baae0143a4e92a74b8d81054e961cc36c6db5fbb55fdbd6ffed8be9327b357f1e97c0cca829a579f2a68eba668f86d3d2241321e3c4afb1689f43af2bdbabda20c7169922944d00a7af82c3413226d2a21be98a61768c1de360f09e689b19a6515c952729cf15568e5010c088d2318aa1b52df8b48fa774705575ebd770a32cf276a96a1eaa8733accca0d423302494796d6b99223da293c2aafd92a4aa3dd4f5e989eb453c7e75120bcbd990c3d929716e277154736b8d88c5d2d600adbafda6ddc7a9ff4c6deb585bf3d30d1cf5302ca8b7914c8358eee972db6dfee31a94348c7a3f4fb30b18692129cdd09fddf8eded38549e39245077924e5371dc074dbdbedc1aba7aa4b7af1b9512231e6f0dfc6e09bef8dba5958f877eaecdb6badfc7dbdf8f1175d1b0db755241bfb7bfa5b6b633ea38331fe8fa8f28ea329cbe086281164cbb2cb2d4492bac41eb04b50221fa43491a8b08947753643955252564d5795c3055ad507d1066358eb56f54cb1bc7a8d34640642c1784181b117c6639ce6350d3d0d0b3d6cb7b5a6f376b53a6dca0d5d4e9e55017497d0a00b6331f28eaa42d5958d3d0e583513c29aa14b56d545a89d0b4d011145a3a3cba6fb620c9e975be79e53b40f57ccc655cb4c83cc283884f29aa93f4ba917168d615936b9c52793105470bc9ff2715f30cff3153c95156a079fd603fac6e9976569b9fa3b31c4de54e67070b20c9562cbf22ca7f5750d0ade83295f14403cf33592e4b02c35169970d9fd61f39f2933c2df24d385bf98c137a315fc11d876f98cb22db4a03280c38789323a0612e7798a9f97b303272d141f392d0f1b711a20f4b99cf7ddc79b82c12c7ccb24cb69b30a584da4afaba392792aea7f5b3269f9a80f2ac311e611a877b33901a82b978d5512de8dc3a8f3e87d4114aec14c84762e6cfd8b87db1533431d6a4d4a6f2d26a8f8a22079e60a4ee226e5900e74b93a748bad1cede7069aacf0fce53469824074c91ce3a878c1d47aea4e74d431590c1f282562d34cd1a2cd18f3f8990f11295d08d5c5a7259549b4d1dd373cb88734a7827972e35be6f9a527a3e3411cb66b105c05498fa581d6eab511953a43ba494d98c39ad0c798cb24072a8de78d6b9269ee8d04b083c5e15f669349881d2cad7b622a8aa9bfa6323c9f35a6a98db57167a677a7a6a79a5d637960e3cd4f210cc74f00c963a71d31340eb7596278d80f07057e077db15f4f342cad14f2258ec5887e596c7e9eccbdd6208b5f1e2c3a5c0f6826c3a7bf7c48fccb2a9d51bade337faae0822fe20f5c449a60ab85228a09a32744da11b76d7ebca46dbdef6bed72714ba72bae11c11cdea41cf76886d69c8d3a55ba95ea36c114f454b052ac9552234e1a491fce508e291d952baae06ebb5f55f4e95a9abad9e56d6bc34d5270f428dd9a3d977ee1a6c7737df7e235fb28a3debf9e6f774c6779eceda1e8b2e94d09ebaab6565828540f5879d4b1bb036e5527a0c655493bb343945279e5796e6f4edab32ae2c7a96766584f7dc5b6036ce33f94fe9150d2d2d1f88a8cc3571190f779b52ea02df4c018a8cf69ea68a869ef357d40ac79926a9868e1d71a45a2264e1a233cc75bade4e4fad8225ffe0be4f436d3d0553237636db8b9855f6bfe08276d24e2a33a92ef9c67064a6cad16faa9e294f06a2ae25eaa42fe83456ff884760623f25a8a55405856f9475e4fa3578149313b83bd2e5885b6fd75631039b8784ad9a229e4d6457a6c9f2f7e56cceacf39e37d292a5ad5599cdfab874c03d4bf9ec89e71e52e6dbd0c400032ba790592754dc43398ecb4518b0a3a71c6362534cd9551d42ac20717ca1ce89bac815ae69a16075494c8fb46a3d257d50bfcd85c0ff9b909a3ca9098e00cd0096a4a76eae76941324d29d9d93d1a6810a6d160d37985254d035a4874e6901abcba623734f23f0b8b0eaedc65975ad8d9251a8ad4fc809f29521e4aa8abf2e31e6310db45547e7571294e52e4699e3e5979ec7054f91d5f2e579922f9ed1433d0c8f97d40eccd4da6a8ab701ceb88adf5c178dedd0bc0fe4ae73e7f93babe5798434d75a8a58c86e06a88b30923369202fe32407a2e13365f22fca18fcf2f4b9ee55f255615975599e780244470e61e991873535583eab6f2e475597672946e0d764d5b51975645c2948d494f53789781c70385286204352ab26c849c66f9b55c1253e634d903e5d98a4d13c524d2c95d4060ace7500f1a2a5749add258357eb3f9693388ac0660d2453a9d46d534d1c6524eb6b3446da477a16ef6c03b585eff0013b5bdff001c6be8d6fbbf36eb82c8786f6dc771f6823dc7f3b62dc601badafcdddd2fe3df6efdf7c6a95f577e8bee4fb7d9d7a75daf82fb74b01ee1dd8b8e8c6f71efb7e7bbefc793de4eb7f5629f2c569fed8a34b144b201be98638e76ea4169351ecf2d755f49b349da25bf5e06be2ca07b0fa25f7786321f25e9535b3cead503bb8d3b23ca5fc04508443f479af6c51f91b9290b575d4a94844655241411d9267b6c75d64fcbca092bc50794e21c992393871deb73265b336be8e3befc15b53c6a7f5ee49ef3815b128695c2506490a1e26930a2432d4c005cc8b0b929035bd2543eb0392d89b291208dd57cebca4afebe6b12104d1b3df9f80cc03229bd4e60c910bf0c5e9abde9bf45889a5f26f2765d6d56faecd573c605e54e373d438feb959a6997d146c124cbe9d9aa33bac577cdebb765cbe16b71a9d5d7d71d9aa78b7be9a3a7bf35e286a4b45974444a2915ad2564db6aa9cc2553da2bcb1c10b37023e45983190bac14ce6186385152345454402e34aae9e502db0c7cda7f847f0c7613ecc76571d063a63751f60c0d08aa4dee42804f4eff00e5a5553a5c6624c6de0de69506c7d8c14a9f7ded87a6736e1b35adaad71b15d8b7c40be3b25069bef6f70f036f8608a745763f4bf877fe77c713d1a2b30bf213636f554b281d06a3b0df6b9c699100626dcad7057fd4f8634b6ae201ca77b74be9dbd96f67d98a6a5a7dee5049725906dadb55af6dbadf48f16def819f479f65f431d4f93d0e554914f453cf2d29e2bf1aad8c52449234a8f32a2861a78972cd6b63276a8f2ae9f8395c718929e3c99dc564ab299a592476cc574895b4a69d2d68934837e6c7cbf96f95f3b6686ae3aae33e4f0f0ec2432494fc2358c383316d32efab42a842877c41e517947e52e775b9941a384b047975351c5c30dc3e1d2bd2d485e1b36b4bbb5995756adef574c6bfca79057ceb515b2fca3471d454b2ebd2924f165a9270753b398810ad273303616a5ae7a6cde6a8a2823a7a42f9b4e890470a688f851d3ac288eb72e24550fc5266d5c4e6c4b4e3c9c99e19e659e74933bcf5b8f2a6ad0d31f9441934ea62aac4a8625f4ebdf0f3ff00cd9a0ce33ca18383051d354d6564948224e1c514d51355cb1512a7678697997af0d6fab19b56c192e579251462922a7a2cb60e146ab7a8d226624b4ee806cf21661a9ae7a60f874c5cff0066be1e2de38b8371e3fcb6030f94ac83cfe2884ef4e0aeb580f66664d571193ca1fa16e51bedfc9eefc7f9603e199c5f7d3d50ff005c0ae8088c6bbcad73cae7d6ed5887b6f65ea2fdf85466656888d7ce01d5a8598ee76b5cdc9b5be04ea6ebd3f85ff8ff00be15ae01fc9dce3575d0a6de0763bfbafd3a58f4eb88f8526aa8757755bdb40763acb1ebb01dfdfc830279be76a05d76df49d3a8b1f16651a3c13148c52686d494f108e475653a031e3a2c72c8805406120ecc9a3489111815c0df17d43edfe4dbaf75f0af9c54d351c6e64314147e6d53593ad9b87c18257329b9035c92c70c42fdaefc54d165f5f365f95c8da559129e2cca48ad63c6aaa648c26bdcb25384daca5986a2f3c0cc471d48673ccfb9ed6fd4dfbfbf152b133319a442e5c824e853a76017a6a3e3fc80dafc83f7b621a7cbc958235d2aaceefa54740ad23b3d874b1e9dd8ed8f6ef8ede3b58d4cf1863b31240242ef6bdc1dbdfb634c9554711f16a8897ecbb8b7da71e734d3453c46475124522491929cae03a12b756054efb1b8387a1adaa9f35cda2bf172cc9d629e5a661ea564f24b15353c97eb0f124a94ed3c01482658bc97ca72cc8e03f3551520e6b9828df9af32c54018fd1345285e9a9b638cc6b3caccf27cce25cc23868206868e92188c34e649e458a8a9a9a3666f3a8903b06215182daed778dd55d1c732900a9bf711bfd9832c25bcdc3dd384baa48afdccb63ae106db770b0503738be94a946de37590dee796fa4f4f6f5217bbb8fcd300b60fe27d800dc786f6f678e342270d4f4d57ee5b8d31a02647beea072def7c0adaf5dd86a4867b9949b82b2ca3b2bb7622d8c77b9b3f4d46d603eeff006c5564d0794d9ad2e529e6ad4d4d4951e6518a6e047e8f5d2086691038656324af7d3a09b5c60c555997cb1118d921a7cde492440f61c361537f3950bb0edb21e6ba6d7c3c4722c9627462a559abdec478daa1074b116ea0dfdf1d165791e515555310b1414d4398d44ac77e88b5f7e82ffc30d4b9c53d3651555116a8d7e48a9a49238db6e243e7ceed2106e04a23e186bdb563ce7309ea2aea2a5f4b544aef3bb3df94173ac8fab7b28eec7c3f7f87e7e1883258e9329cab2b8386f2d3e5340299ab6680725466152ef3d555ca0ea71ae6d1ad8be8d5a74ca630e1758de4464d5cbd5750048ff6df1f9fdf8be93ece5276c7ff0032e643f61a28fda7748d7ddf8e37f2973be9dd5d3af7fd4651f9def8f4be50e7affb59a575bffdd83c4cdb317bf5d75d54c0fc1a6b60eba99dbdad2cbb8f6ddb7c695e248cdd02eb763ee1b927c3190f91de4e549ff9d5510e65f2a5622b47f23475d99e655322c535d6f99b453c081e30e94885db88b568162692572cce4b331275316b962c4937624924f5df738868a8e232cb33e81d742dfabc8fd11105d98dbd8013618a2cae9db52d347e9a5d36335448c64a89dbf6dd8e8fa281177b62fe07f3f662dd54dfaffafbff00d70d2a1313f5bc6cc97f80b0f8dbedc2abd4ca478dc0009f1d36ead6e9f44604cd69a61eb4b7737ee2036c08ff00518bfb6f83bfabecfcfeec4158ac0480f0a4bff65a8953ef04b003bef6c4423173b0f1d96fb6dd4fe3b8c0aeae82a1cc4f1c234695332b862048ccc74842a4060a5ac74db61689e88d5657242e248a6a5f452c7201a4389e07e3ebb5f9b55f73d01c0a8aece25cc6a348512d6d6cb5128404d90354b99028bf67a0be3b58d8df6f1fc6fecc01419be7798679208bd0c594c3459643cc3ce17ce25ad96b67d297d0e94706a7ddacbd10d3e5f2c34d33710d6d6de9e9b87d032c9269e3036e94eb2bf7e9df75973eaf9abe5b8269a8af4f4c3ea35430f3897dad10a43e185a7a5c832b4897a0343048c4d80bb4932492c8db0bbc8ecc7bce371f1fcfe7ae3c76c51d0c1a78d5b554d4916a06c24a999204bf7e9d6cb7b6f6bf7e21f35f2a5aa9fe52cbe96b15f249297452d5d4431cd514cde7f3a543d345371ca5c25a3911a7464618a1cbfe5bf2825496a275adac6c9e2a6a54a7868a79b5c552f2491f11ea852c28486461249a6ecb6c55f94394e71993798d0d5cb24198454a66e28a8a7a689d1e0e1a469224d29d0eaeec0c6ebd978f05d25d13f7ead92402fb9b5ecc7b885b316e6b5af82d514a262d27069a3d5aa3691807323b21f9b8e3ea1bb4c4822eae00a960a679005d60690a356cabb6c3efb69c5aff000c7beffe98b7ddf9fcfc31ddeec0b634dff3eefc717fbf05036c2ec77f0fcf5c33feacdc2dfc3a5c6f6b9db7b5f092cae608579b96eafbec2f6ef3ddefbe2ba3a5825a8103d217312b4a29d7885b8f2b2295556de2bb15bbb81dac049e29217eba66468dbec600fb3f9129f25cbf31a977e61c049b405bdb55d7aadf6245ed88e6f2ab354a385ac4d1c5fa4d581f44b2b685277b135178fa3c07b38068728867a816fd2ab956a65b8e8555944111077d51c2b21f59dbae39b6c2fca79a65d405b7515957040cdfb225752df01897fa6e0878733443ce03c3c50a14f1a2565d4616d5a559829255b6b6e7a63b87c3e18cab357a7f39196661455fc01270b8fe69511d470b88524d1af4680fc37d24ead26c719ff94451a885566f050e5f97b563d64196c306554bc430b3470219676e2cce4411832ca3529e1f3249511ea97cea511cee14cd534bc40cce1a4f5833490c6cfb5a3e5e80e33cca33ecca8c1cdb2fa9a3a6cba9916a7366924a7d0ac94d13c7c314f516a83533b454e0a10f2c7e8d71325c0119704f70e1b10cdbf8fabded716c7a190c1129ed2921987b5bbffdbd98869a972ace5ab0e865a8ab59a8e1a78cf6647aa9f854f04405dac1c122e12366b2e32a3355c95b9ad2c51479ccbc4596369e41da8ca2465628e42238cc838d247679fd36bbfe07a62fe36f67bfdf8fc3f775dbecc5ff003f9f8623829e179e69182471448d248edb6caaa0b31f628fc4e172dcee36a0ac969e2a98e290abfa09d7924d50974d3d54efb488f19f488ca1de9a64978d6f488c0a88cead5737e563b208d94310c4fd1b86909692c0d8eda56fb1b7b6d88e9e352d7517d1706c77bfb478d87f0c49f274aeb5f018eaa62c495975a0d74d245b03120d3a548d42e6ec711be62be6f344d20a84748ea68e53270f9265a94a9969e0d516b4f36b00cee396e1714f53e7d41e5057448247a0a757a048ec773352cb6cc2700ec67f431b7728536c0a6cbe8a9682016f454b0a42a6db0d5a00d46deb35dbdb8d79ae69454361ab4d44e82661ff000e01799ffb91b13878f27a4a9cd26170b2c8451d2786ae60f50c3ea986227e90c18e2ad19553ff006596030330fad544bd57f8658d4fd1c3cb34f24f2beef24aeeece4f52cee5893ed2c4e37fe3806cb1a9dc3cd22428478ab4ce9abbfb1a8edd3177a92cbd0b53c12b807c3d379b96f7a064fadd0e3cd69e95a448adc5a9967d2c6f7d47851ab245f513892906e5dcae3e489b2ca6aec83cedabaa20e379955ac82211495099969938712a85bac94955c4b70e248cbb491434797569c9a82188434d1531f482002c82393d1d657cc23d00d74ef4942fdb832f939b1256d7cf39139b97965692b330defaa5918df45fad80897f548bdd2a70c46f33c8cebf457d402e6fdfbfec8be21cbb2fa69ab2b272dc2a784a867e1a34ae753322aaa46af23bb32ac68accc748be32af95cc54b55e6b12cd19963e1f9e24616ac2d42398e7225126e8f29b763572e339caf2ae0b35387a29b891180acef12cb4f5251c0aae0cccdcae60874ba4a58bf0c299609538524323c6f19dcabc674b83fde0477e2e3bbf0c5b1dffedf61ff007ea71559f4f574c731671474f4fc489a6a1848bc93baea2619aabb1171746a8237e1eae36d2d7794f4b475d4f97c4ed11aa891a41abb314265b9bccc42a431b5a562a36eb8a9aacb68e2cae88c9fa352538b24712f6759f5e56b9323df4dce840230a30aff00ad8fe7517bf603575f8fefc43a0598c8bb8b269417e4d6aa5b73d3a8fdd88ea01feb108330d5705ec049ef07af4f5b71b60cf4e6c1efa93b883eaf81f89f6621aea1aea8cba581f5a494d2bc4d1bf8c7a0ad988d40fb0d8dfa63cda5ccaa2aa9a4508ee3874d5361eb25651ac153149b75679636bfa446189aab29cd282b159aee2bf324833089cefa2ae39b999d7a0923d71c9d4693e8d6fa32ddc6dfa6ff00fe76dfdf8ec65dff006d1ffa3f3e38ece5bff6d1ff00a71b9cb3fed7ff00b30e428d5dee6e58ff0079af73fefbe2c1beefdde37c47491baa3d4cca1e5736540ee06a90805828dba0240bd81e986a5a03e7b5927cf55346bc15606c894d0f31609eac92963c42644489cdb1e715f79eadb9969d8ebd2c7bea7eb7fc1bdc5ed25bb25f34cd4bb68b70a1b76df7d01bba2856dd2d63755d3624e1eb991a38755b9bd6372588dcec2fb6fdfb6324d712cc949479ad6b6a50c358a49e08db707759275d24f4205acd638cc6aaad565a935d99c334922872be6d5f3c3c24d77d11208f44690e845f58492371b1e5864b345179cd6c94f9cd255154e24f46079b3d3defac45453f2c409d1e96478d225d9b388b4da39664ad8beb25746950c45edd266951beb237c3dff6f7e1568e192a6592e043182ec74aea66b0e8a8a0b33b102351a988404874a99d73dcd92c3ccb2fa9fe8ea67dae2aabe2b4956c37568680c5082a0a666e6c98a8cc5aa0d24f28654f3466a7f368bd5a7a7e1152b1002caa18dfb4f76df105157665595397523b490435126bf48469d6cddb92cb709c567e1866d1a75b5f61b6049ea1e57efba9ebf9fdd850952155b48522531b7c77d3b136dfefc51a97636d42ec2dcbc388730f1f87eec156bfd520f8f43f9f03e186b3dd6fb7bbf3febd31a1dbafd2efbfbeff009db1778dc391da8ce9bfb2ff0081b8f6607c879d677978537114756ad49f1a49236a56f73467db802be5cab305f1a9a1e0cc7fbd433d3a7ff87112e7196d3474aec1659e89e6e2400feb041299b8ca3d640e8f6dd6ec34949e1cf72a31c82ebaab608db7df992474911bc55d55874231727c7c7bb04dfb37fc07e38afaafd6a68443f4448581b7b748d2a7b831efd257e505dea5ea2584337308d5006d510f56437ddf736ece9dee6a1c6b9091dadc6f76bdbc6f8911d55d6dd185c7e7dd8d01405d27946c3c3112f86539aadfbedaa98ff98dfdfecc79692c3ffd167d98cf0a316d37962827756319493419a577e5915b7d25b472e3fe4c7314b0abcee3cf68f3396dfd6a04c9f2dad8d580b2af0ea5da452817ae96d4aaa06533851c49f2d96390f8882a7527c7f489013de2c3bb1a748b7df8afcaa2a85a5a1e2491c9152a705aa511c694a9981334b186557e1193822401c26a17c6a2c7af71f7ff00be115ba5ff00118516db6dbbbbb0397aff001c0ebf6e23d3f48628c9ea1ca5f7dc0863ebbf5dafefc7c3f8e0eddd8dbf36be2d706de23f3e18162176ee1edf7e183b5fb5d7ae185fbf1b4a4589fc31ffc4002810010101000300020202020203010100000111210031415161718191a120b1c1e130d1f0f110ffda0008010100013f21b0cf86019c1ee11d935748cd4f56085aa7a1093d193d103e9cdc6c343f62f3005cfa61522b5bc203e702df9c0aa3e2a8b103de5ed0fec8ab58a275faeaf12f56c56235f37515f41c46edf7c16cfbc876989780c157c5bad13e46e1d41e95e2bb6d018ebd54eb40e6dcd8507c8fe8f6fb2702bf5c90c40bd2c9e8957a3906d0227ae6f98f9412502e73e83c6133a104163db9780a9490ba0c176ac5fb3d4ba38f4286b14bf26fdbc7255ad504013ed419d87316862843511a18197009224023e700cbebc7df9e37f6b889988d9f8d54b7b68b9ab774044c7e854de77a0270ad1af4aa0012d146d569544f6da90887cc9c3c29a88a808bae0496e23c17041f5174bf96bf67966eaafcc4aca6d5db6e840cf3fd0029b3e5cd48b46c317a66c8840ccc9c462376c2375ebe7205a2b0043bf07a49d8028baeb839be1a697dd8aeea201c76e37e508dfc46280b4b9655dc09244a0fd048a73096c8c0178fa112da500f195521677f1b20676d8ae706d1f3c0b1e804ee88e907085f68a5192b5d275d7c2f1df2cd68f6c7d6aa65807a70ec33e4b1990fb778ff005968101494b38a059f1f729d4dbb6aa01006007b7a711ce2cfac243ca5fd11de56a4d7e336a8275e05a16c6aa601dd1400697d30151b1100644da8d611d831b1d8aa0c5e5856b4d59b3885105be3b3bfdce8713461eb5f488653108047b79f15218049a7ba9f168270a972ff00c95bddd2bd9d6f2dae8443449d37fa24edc53805f29802f9748ed1910231f3058905c28f5cd25c96ae8ed886d76bab44b25a0683c5669418e04a03ab0c68bbf0bf59fa9c3d3a90b7a3adb0520f83c453d061685313af541e703b12d9659d9f0b72b809142c170d867ce7d17378c9c477089023b3dbac83c7d26ed6c9b549ad96de70cce07f949da4cf2ec1c25214e423d6e9a3b5cec401117d72313c4fea3edc0bae525ccc00cd24393f682460003fdf52142e284c10766d2f921c9849c520a0b4b156f649365bb3873d086a543024e220d679ca958730405c8f540a78667085821a1581b2aa1e04ec71dd054eaf4b01d80de2ed9ef4551a07812bea409674b490e843d5422ca5084540aecd03878e93c2a30fa19e3d9bf647b705292f2bf7845c0ef4d95867d40bc57233b927e0b726af21005c9b3b1cde6990703692e6501941207450a713080fbeca130910f83623c4e418254056f83ae1274a2f767b6ec1bb4383d080f89eaca3ee90035e1ce90e8312b362fabbe82fae3198f6403e49e593a95253b06ea2d40d75671308309d0af1b4b0fa389010992d300a05cddebd36bfe92d8608c808e21658cb68b849860e18f03348af53622d1ad69801149c1f534c1128a178bf0991e13166f67e66dc43e4f503ae228551a7a82fc87c28fe7786e75510d645e9bfbf0dce62ed2b923ede4d607efa0f147a034ffd81df7aab795b60f6b76ea01b063b0e18c6d3acd7d0c2c6a0b1ca5516923d92428471482bf711032ab85902267ffc4fc7f1fe72b189fa083d5fafef873fac33fe9c3112bdc5bafd1fdf10c7bfcfff00467e3e39db7e534fed5c23fe31ff00e710c00a0f72306c9c3abd39a4020a98518d78478cc910434ba12baa9a6b93b3440c1044c3b10037a4d7a96a633b265edba23ea0a92f0a1157655533f08f6a0ebe393283507c9d2c5a7ad1c148790eff007d8cd7a9e374e303e53ac1db7b5a969f6eb047e239f8823b8b13ed34e3213b066898e0cf30204006d1546e47e1c8dd4c9889b24040763045b091c639f4e0cf2991010ad788405c28844044d11311111ffcaf223887670311836e266a9ceab4a84d3587180abc2c9d047474ed016604fd729f16b61b83e47ad929b783885d01aea80145d1cce5db208405f60a4b00c63eb86624d2225cec06a2225d2492130e54feca7a769efbca83a3a157a3b16fd41385218552ac5ec720a21f2384118e21d48cf8c7d1202f29119800d9d296b2e7550971df9f987a019f16599c112cd6240a27d901158805a94535776202914f72bff9023946f3084aedc861ae74efa8296a5b4fe01c1f2e2db02ed00021e102bc26acdb615884d353a6fd91e51424542f4a2f51c9aac978b8aaae5a09c874f53279468d1dc5d5f00a017f3ef1ef1d31932ae8ea440d6bba380deef63dd99d8778377bb778e2a22efafd8e933e9d7a792f980a2107c8176dc16ca73c2824c28868aba9b515c057e75f8bf9745205bdf15dda0bb5060a0bbe90e8963107a5093d23296a3b3bc08e4ce7131dc49741c88ebf9ff7fe1312f358fee18fd913879736f66f73da556963a75db994fcb430ec961fe3913087459f294ce85cf2a68d296015d852d0a00b42b852314c4c3e05ebe59365e35616150d30682a0eff004038c1571f4be650e95e8f270409f64612e01f1dd93e6393548bb3d8959555fdb9eb8d510692085706149f07b9538ae0eafde699ff00007ef89d88cd2f57a4a67dfdd799a498c53185ca1eb1469ef1612d4305d56ba44e80950a76f38b482fca017db4f1dc15bd75a9ecfc226874ce40e4ef21b4d41e0c68ef096994301af1f07a7e02222eddb9ad75935d3bff0000429a1919f60f9101041e31bee7f39b1245654f255861974046347000813fcb65601f7961dac835088e5a73d255f19b96b0fe8a972b03140667b371b84892a6e235ae84f1e86bfbe66a1cf19d16f8db80176f3eade20a743ead977fded5168b5fbc2afcf775e19e85c5ecf7a517aecef0185e3f976ce8df1ea7160c06abbafc942dfbb7be0540354022bf0021d0eb792c028aebe4147453a9de76e2418b4d40d9a24108933dc9810629e0d4b1eaaf52e70d2ab0d570901641a8909c4756b3512121d5652aa16ca8880a26320be4c1243fc366a2a7804f7f1c67bc275444f9d07f8ff2779353c1d2fa6c80bb4a38f68588e17dc986eb0841782ee0a00020c8009f97e9cd8f03c30c7e524cf70498019044fa116bd9aa1c50d942fd42b153408e5bca0157a1bb784d0351a6b5bd88c155cce9e0a7d9c674a3a32c330a26710a092ef89dd704dbb80ee9f9cc14e0ea372700a4a495e18b89b7b888bf244a6950e20043178b2e74430c49763b25022d9dd512cd942e9140571561db4961ee56346929b8ff0034fa94d790b13831cba4afc293fc04ca20fa847f0f2dde1fe59d504a088ca30d40960ce1ea0e148bcfd64879546714a279577f0fdfa1283c38b3120954fe03544221c00d74710e4147b28e1ba9c75748c44de31a3081e258b13416294862ac08bbc5194f110d4115f4ecc30b96d0ab44206bf9a422568e85b558c5805ef8fe6b965075780778a612521c1620bf01db991131cfc47d7eb95ea5eecfd83962c76c134161703df22b496c85112b4e314d781b413618512c1402de43874f7579357430ae8787842907606b64c4621b4924b937f06410a5092572ec65090b26b0560b8f1a528cad8494cda43e4ae332e89952d649023dc0274e1f9fc020103fc75a080b7ca01fb7812da937960fc013394ef9127496c523470c8fa029e7644369eb896149fb4eb80090811cf547986f8358022107a8928e58b16402046413d35e1b5889403e38762870203f2d148b147ac7026f3572054b7175f4e4ce0d11865167b5d425e79dea10a6a92d24256de296a63cb2b2976d790a86dd538d0819da820648bad4b22b71d0024a543883ed120713026ef164057de6178cb710a06c789cb6a1a868ad7025522a113bd32525087e654983a9a7489486de68ba781f291d3105d36cc444e1c04d46dba5259a2c2231708509dc78c6978679c96110b5061ac1271660e845f489a853fb39ae2f00d02e18c28cdb801cb313a21ce56020573d29eab7bc2eb4af22eba8fae9df9be4a1c5f23d36a1196e27c060e5a5924ca02fdbc260448743a79946b4bc2b5e680f432dbd99aa36a62abbe5c11eeda1908e0498e2b8fb9b48529e81af3de9e657c711c684485dd090df5ac72921ac71e74f24e9923c4d99abaada1138bcb74b9aad4355c28cc0d4787abcd435b90c2bbd9f227d6a082790204516231c851c9a540f0200503d070dc25b02cc4a6001b08b3846ec33271c2c6024128e10b818c15329935b0e3413d4dd55078c276c71b0f8a57d28a806ea0bfe518a9c0297a2a5d5e26b4d41599c46322edc8a8a1305a8068853b37989a47d506cac03caa2f516310ee20febdb5f0b45b9d1004a674f44721aa8f2049a3a2b151fa704f8314f6303deb56e5aba48ebba8054043bebcadda40b7a00b4b6d1539b5363bbe36920016acb027560d4ad5aa4868f2047471b6702d326ab9dbad70778253fdb0c4e210a8286b3a0d81373a4d0c55f905984a8061ad8c9c42393f56d498a050313472164cceb0f487e843a77c31f14dd7a02d7c32a8df4b5b802bd25e077d251bd6d5ee0c83db02760c7c20e14e4f53086328816ad10683c007df8f44ace56f985af1995559a51b5499325e700e02271ce963a91af482f5f368090723806c0e2157252b19b14e768f50519cfb06c902059413d82b3a724068a0a5690e160928ec4d9c2d0a6a2344369ef3986dbd0c4fade89bacf102880d3d88b6a6e96f01c0c279ff986ec2f550852976a93608a3400c4e3e6214221d1484641ec9e25f034544ca4680ac04701f143b0e145b0f57713c9014fb48233e5432de28b82089278c27c457178ec2e896bd46239055c8155825d161e03d25e3a919b5ac82fb2307f8141c1756abd5c02fd33adc7f5c99eb7d6ebcfcb7dfcf21dd0e993034165aa2084741db3094651326753917b5a5699cbbe04055ee65553fcb9f82bdaf3a8031a881d5347557f1ef08317443f12e3c61dfad79e9f7813d869d5311c52a09dcd09619135be3c80ab974052e12ed68851cae6721a204191e1f79d0f50fe4ad7c0e1d8ce1a8e0967ebdf983b62b0d7f6765d6e419737ee8372669940dbea6de30b588c2c3ce211c82d2293f043c20a839239d45d664ced70c79182ae32381ece61930e84a566e731b5a0e8a187893e49d630067205b68adfa1c7155e2784d00c135893976488ed39b019b2646f4875d5353817015577ba1914c075e203929118e67853e71c19266b3c26c347e00391c3fe2f411a677f7d96e800c87b85e9d02ea13cea3f3c0f9e7a14630ccf459e6b029aca03d4bd056949ea8b38f20c50e6b0634df6d69c87997fcac840430c754e54bbd583e90451cd53e8bc69e09bfda4e85b516500e1a3d2e1aeb2cda2d04710bb53a162534a8e17a0ccd13e26c76b5d94dabceca86ec23d04e010b9782f674b2002033518dae3b80e19ec67a0a27c9426ce224ff19ac90c4e275fd4d88aa7e7522811028efd849d782a99f98f35b00160c73a05e6827cca32ea05089bac7949362255b0e99d813f6ba8bece82fe3a747c69731e36e2f741577b10604011fa043e58fb441c79c402a2d6664a65021c5231212199a6d88cd21c2a4d7ff37feb8cba67db45f35c808f0e0aa58ac5dd44852483b7d43921a6d199d8ae032fbd6724a8d191826069d7e3c156b455e90f82c80cb312138050a14b8ebd50eba0bc089ec2d660d88d3c785238701e3d3623834708866ad448396ac36cc203a047b559c447c90c961727ca8d25d791597cbe9bbcceca93c6ac49a688dd5a2c236d0f8f586e8379f9c817540a052e40ec3411c9fc7e11822e59404b2104abc77d56a09bd28bf85ed49a3416b91b89536165d707857b8132981c092e280e55f989ad039296fa4c66e427568dc78263a300be602cd0343909223048cdb4582a3c08ca77680e9ba01d6f23a60bf1787c6a66eb0de9b1c325cd32e6f86f6eb5995cef41a746138d12080176ba04e4b13c7cdfbef9d55ba0ac41f8157efae60db0f008651b82c108e5d2a26aa110b05f01d19782c2b36034d21b00ff006e2209807bea84e4b2a949a6ff0031328c144d4d99de20507ada016bad2b48e7131b217448b3dca75af3177587ba53c3b5b49c84ef81447a7a26edc09a05de3a31f47891471f9046983ba60a827adc3af3bd2b69c79a607a1cf6a5d4d17a04c5cbe24a7ea13c13a0d602d6c2763e630582f81cd1d8cbe089232c010068c5798c614a40ff00682656adf0411956f32a54af136e4566e194621e8640438bbf106207901eb627808bddb9d6ca5be4581c6730e3113d214c827c8051011081bb5262672025ce307b382505585cde582d39f829d70069fb7a39484bbc757abc3ebffd7f1c92437fefbffefae2ccd7800d8f7364973934061fbf051aa881834126ce5c195760a763cccc0aeacbceccaab22769ed21d492ce286554aa83c3c03ba55570ac203c2ecab5e843e09bafc56eb04060601f0f50f39064b0607b6e6e97453cc72807d8746059476308783b3418c818da95004f91c596b4e08a7d9176850bcdfd346c0cfc280443c1b340c82078d18202c039da69d10a983770fd4e01a8d681a52ad62120fc0b69fa2c23359f78be55411dfa30c1642957e24d2b323902ec0cb1c5e4f592f8f1488018066715ff009efc4fa2fc03fd4e7fd33eff003c988e789d7eb78fb11f9ff5fef8af64fb4ff8fae22e61a091415edef8661fcfbc077feb8b6060e96a3cc9486cbae0b95fd4c14022af542a902f3ac72b453e0df9b7be2c5e782526d85df7e329f38e285012a49a2506562d0179dfa2414759d4f89e787216a1255ede83155f7a51c2047f8eabc4f51181280da5be8e9805c1384490db8cc87b8adc14e2e5a5cb3fcbf1a029c90030c3e0489b22809cd9dfc0834f6153e1de671e6956609c40981f21c19d270361e134a7278a7c2a51e8824ad7ced0ce78d3cc74c58e990c8bf0b999dfd1e4fe3929a5817c07f6b2649f7c9024881a22522763e7cf1f1c19df5fcf013a048403ff00be38a20d679ba098a2828f8fbe7e7bfe05e537b04e3e1e0be3e77f8f99fd708ea0b4bdf6c7e2fe87bd27051605e7cd02186c76f0dcceed64b41ab0878721840d075ef617e0c82f83bc55025eb33d53dd81afcc9cf790100a4a8a2a982a94c0967d5f164317ecb3403924deb55fc642404703381d6eff005c51c8318e7194028561e96ef9c813b9807fa3feb8565fdfbc9acb1e817cbfbe043e047fc5e8bbc41446025259812d089c6812b8b80505dd546a5aefb9c7971980c638631adefbe22ee7cc3cefbee3f9cf3be3fc0038cf2df8eb339047e389332ac2e674e97ebfb0faf587eb670ba03eabf9fae0088d3c473e67e3fa38a81e3ba54645286aa80f19400a549b8fea037be5bd72cb8c183250804e1aa4b9512908248f865b1d629e343423bf3c066fb690246abaaaf2069423e0aa2577b0d5f9bc34daeff69a692f040a46689cbd25400b0254e185b7a1683985121a34039c4a7656d2bd7860868f48c6397511197e641287265982fdc8753ca78b7de1a43a30c023814b4ce4b0e4908d6265a19a5e6a6665288e93b4c16e23c4808c553863d3469ec73e876c02334465551483934e4385478450200e06aa7c8c4f976046a29d9708a6d5dd358a3f0da1185c02812d0463e5d509208caadf86121fc232e29f9f38a0a29a68a5b7e3be4e417d41e812448f6958189fd566d2a803e10efa09e22a2206e0b9bedfd7c3c9acb4241d5669dfbfae3ed74d5b42eb87b02f4f070210da78145411ae09a619ac0f11ca004c370b3edfcf792e76002946f0dcdd242b146b47a6adee33c01f0711985439d9c0aff769f2b267acef989212bb2c42bf4c14b20aef89280aa83655d3f62dedcee0a012038a8f6577b0d41a8bb9bfcf3ddcb6c55568d5b417f79b3043566623c19cc7b7b2224abfed9e1c55183b988a7f6a691f1040919a20bdfdcc2d2710d845b9363c331e1d2762cbc0f4d0368dd1cadb943c12fc92b7e55e2ca08f4f6413ad04b9f57c670d23f402f97e048abfd6f3bd3340d173fe4c214794f79101832d82066bd9e082cc210d6065e8504819cf503e480f40083f5e6294863ee33b8fcbd6762273d330b8061f9c51dcdf263c7ab4c17c102291f0a3c3a9c5995bfdca9a465ce4e09d96b215c1c21014ecce8f7aaab7c534159d992b69557400b80a316da9b43f3170ae8d30bbc4427a3e5b85f1c87cea763428ef97a27e23ca55318c8c086a7cb7be51559daded7afe33b86f8b6523c166775411dd2b07b253961e1c86b3bebf66623d70b8ebf2afc7d1cdf1f9270e8421d217adefbc0f3efeee61438805b8a5de9e88fbca034eceac5215a52249887bc3235534a43e9aca75ba2d168d95d09e14ec2e774abff1b8a7da519c2b02c9f5fcca1877c376223f4ec2061729f837b034623f28f2771917b096fe895211de88e27a80787d64ef303f01f070e4488bd354d59db73a8a62949d6d2e9b5470e8277e2f8fbd4f3af0fcf0f9645e9a4ed7a9f5fef978521957029df29719ce895ff063b45b61878f4f62e15fd7752341c55a7c625f7b15d8fd2e7dfaf7c376800b5bd3afc5f77c8e8b6dec54cec098ae4d1914cdb211c4456fd9d31db906c6c387252e3f23e615fe40fd9c717169ae9e89f693310d322fda888bd9fe5a39f8586478755f3999d193f8e9f6f23da44f80591f45efae459f782d1da60eb78b1751027cb608f0ae0f8e6732d684809f342021f277a83de80534cc0945c01671623e58bcb9ce83da2037a3997daf315b0ca27fb18b8917fa2cba87812e7ed84fe3c6d5c6f8a7f3528bde861d703aa2527a513bb0b93b382ac57dac3cbbd3b93463b79f4ed88c97ee170e3b217ee7a5f4cefaf39358a07d90214a2ac79b3aa656fa0e00b7b87508cf1ef8f496ae88968a0352c2a4b2848ed3c386b4f0453245c8d3b052bb5b3af40db5fac75e050a0327829055426a8a9383f95cc64d862d2ca0aafd07bab34a802871ab3c7b80ba6db5cf156927c507ab8900ec31c9c453f862e6fabf3f5f86e710657c75ff00df9e358768f2dc77214b115aa9a92fd1872365081a21774b8083e17c2d36b5b1871a54310aa0d6af714c921c552f7158089f07a0ece9aa10e26894009258cf6a9ef978d4cb02ef8901f0d1f67892c05a5c6c60f73d30f0b6fa2488ad501b29dc1e74e6bdbd02d62d334bd8f7c6bb88eacdf90682745ec7d12c61a2f32f019a31f189e58fc0edf173d20deff39f2f9f7def3a8b33f1bfe370b72bcb38a56b9d54768df83e0e2251ea441d98997ebfbe56ee87c5bb90f903b9a57d02a14b33dd70d8a4e9fc8a093686404a78a1231e97c4df13b68bc2eee4168fa92323210066987e70dce069c11d67c9085fe10084935e1005ec804a3f50c0095e9ce5d9b421242d4f9735807010853c743b7c79a4f87eaf368f653834dbb0ae33b593491d708479559c1ab681b33d9b4295ae9df521a96bd19b0dc838a523f4cc335cf3877919a43e63e41c7bba2a2398ea9af00f46ed35d0d47c2f70a808f46c162c2141934d4683090edd3bf03878f86dd3c7bdf51ced559e2a8230423a446ab3aea5f5383651a37d37b66098f9d0e246b7e65458d3cfd11bc95fcfad0d52bdf436fd21668bf625ab2b5dbc267212c30041c0255389139bb56fbc75137e1e3534847e44afe2d3efea8b2806c351b2570aa1547af0171c5784c9363110c69c23d96b385b0e809e434783b3b6749f5e75f0f9ee2621780846207c4bf9face7e38afd8efe5b9e3e9c9eea313ac11c1b54782690f61a6d875e8382f6ee00638ff0032a05d6f944d2c59ea1dff00ae1151640c2440901d00a45544812e3d752aaeac9c2da6d97c30fc7cce78c4fd0d1d37fbbce9fd5580f6f803f91cfd72753ab9d313eaff007c5e50bbdd2a144919efd1c074ec46821a7f68852cea5cebd3d7edefe3aebeb791760001ebb9fd777bbb790f3b7bb4ae8dce8b394516614b54ddfc8fdf99cc072858709debefbef79881908b893ebdf8e0c091438690cdbffbe0481080fa3e579fffda000c03010002000300000010b5672031f56b10afcb2dcfd27dcb260b6dd2cd7dfea1e72937ae9e7db25133caad1a9b4d9f421bd4000075e561937f4d6b120000000013a0368f6f825c000400002393e24281138010200011994eda8d2fd401200000e41469a840bb80024000103eebe14d7339091b0000e7d087e09af5dd032004418cc2a98d0d01bbf0fae2f86905ace412180f60318243f19f18595b9c1798b2ec93d5aa8835f86a025a66805b17d830da99ca22c669ba0f078cf1a11ee156e488de05db8919913318738d5d9439807ff83b7a046770e6b847bb858dc3cb0e6c34cc99244c4564f35b7d4c3f0189f3c415fbb30a6f6c1f4e47b1af1e54f744a951a628e3911cbab1fa587136c85f29bf30683e3fe51e270e1721b03b89c0cf73ff005f807e28d03f93c446459a450078277dffc4002811010100020202010402020301000000000111213100415161718191a1f0b1c1d1e11020f130ffda0008010301013f108d9058671e7fafcf12fa20f6341bf4c77667805519191334f3f1cc77938e6127b00a78ff004efe9c82aa0995f31dfab392869cfa7a795082cce2b32d9f1788d81f9e56622820ceceb1b5beef0b82cb94f1efeb3edc29b564fa29498126fe49912e5ebb7e3cfae55d8faa6782450592b323d1e367e8c8054341a82fb3249f3c99a88bb10a18af53bdf133b1010104000e088c608f29e4fb9cd9fbd73433de3ece3d79eb988b32772ef1d5c1f2b39582b9ccf19de1c7f7386c35c385609a8d21c37bac15789102a91d019e36471c95aa3168d4358fc2df4212d0af99edfe3f4389c4b31def0f1c53fac2d989813786bf9c0c36d2f174cf0f17eb0d73f5fc31fcb1f1e2ff006dfebebeb96262cbdaebd26fcbfe2259c99f80ebe5e7f9c5e9842eef61e0f3c32879671c9d964d74b6e7ed39424c05ddbf82710f260285a74275f4eb8142b49105a16e2e0658dc28f092a65540696be50907bbd71412850298346544e88e3339909852a8064b7277fddc72aa810aa86888c889964eba028464c8b3b5304ba2e70de3399865724030e814e9bad853d0bf39d6cf6dce9c54e210ca3849b8f17f85e38f8bf85c4f0ef77c6338794264b2d99d62649bf8171c720aa35254cf7fbe3837f061501a4e83b0b15a930b034414a3bcc3e25079e2235427c619eb04f0af8c8b0a45ba97a8dbf38f8e118b85ec64f40897b2b2bbe03c3a459323de3ae0612c9032c0c74c447d9382a898560b0f2cd1effe0534a7c33f8e6d457b8b6637dea7d3854a114569d9fe1d7342f8059217d6efaf3c4812448b5c81267378d45a2b9d61a65cba1a21df32dad24c04601c67c82f538890289611b8f01f6647df253c163e835e3ff38235a8f5951cd4d4c66e7bef990510a13187854126f6eaf1bc454581e8108c8a3b2dc544690094308955000f1475c494696ee6481c8a9891d98a2a8b6de053f2b018f5e0e14cb90ed949697a4f538a250151810a470e5c39a6b8183680155956266931f7e077742670e058d44b7333d9428b1417619e3595eef34a24bd0a0034c0824613271a14caaf61992649e16ad5383d1b3584431acceb1df8e1eae5cf6aaf6ba43e9c7605ca0486b73d9d1c031825939a9a89166f3cda8e4153147c3e275c4a0532a1332d1d7c9766395f567658fc2ee8673c26025baed41a76dfe21cb4189329e4f5fd37c4039ea503254915f0cc22522f0291ccd52987a673c772c300e88de702e29413065e36f929945a42206776af58e84221122728fa5c25efefc541cfef47c2799fc713315964182682180ebdf15401699b13d89f80e0d213695544771720d4269b95c0b05afe0bfc713821322881052a5c99191c62784a01b090a0290e018e371655605d2901b323f7c5f2cbff008e4f6a76a5fcbff788959c94eaf99f71dec77c993410603f8f6e271d823ad9afe3e786acd84b3a187c66cf5c88a1daae3d0066fbfe78a2a3af91afadfe2f06353916c28452e401c57d3c89a9050eccfaae532e76f2a92b8dc31d8752e726b3aa7055507372c3732a19c8c786064a364d8a875efd95cf1b544321545ce8f36fdfdf32c74b88298332f72f4e1790a2335242b918b7cbce8e32485b9ec3a677fce71cc11a3004af48f9bf5bc0786174edb43ab529e5bc0d4c501b12c67597d79f057904ca9cda514b96f94bdf1a8c6cf920a528006301a694808882451b13a7d3ff00d73d15e8f2f47d78f1436444653251e080567b4e1c20e91791ed93ba717916117a77355f376f7c4b914132e83c2f9fc7be12b79880991b6fa2ef0322f5a052120171301664116e4d280d0766f20fc1c9557c931cbfcf1d20b9c16b72c4a664f644eea1d011015480f92c6592872a7914dbc211f02dbe701c937624a8d6b45c4661eb8c4c891d6e79cdefde4386a11cfb2a4c4f1874ef5b93202c0a2c651694d5ce0ec41469e4f4c7f3ff00d077613ac818ec9aa33188de41fb1be9364f654c40f58339800b30b95cb70ae8d9d378e8e63145afafefe9c8e1828318040b6be64d179d59ba86a9b0d7dd96f7c1024057415554f0d55ddb5d5e53c9f7e000287cfcfee39e40674a339b20b53970f2bc26410774ac160ab6b05343c436b468d68c6f88e23c5662b905c93ed35fbb6a580a8e94971b277e77c28db7e1641466d26332356e2900c0265133da2fbb7feb509e7f8cf7f4fd78ff00e57f7fbf39ff00b3cec2bcb97ac9b369c2169e41d99ec74eb66fce3cf2f0f4d2b951923bed2c341024190b534be0de7e9df0c9a75086c5d231a48eba11a4304b35e275cc09d8fb11817e5e3c9ef816d6bc1fe5f1f9e57787c4ff007cc62ef1afaf9ceb5ca9afd6260ea5d56cf171ca9e82f05a0d2c1f19734d35213f13180119027d1df010a1afafede3f41c0bf26493c36aef6ce180a29e6a1ce80cc64e593e0a9538f607c47189ff00d1acbe32bd075d6ff8f3c686e55fec3f13d79e10960306cdbc5eabf52f18e00349bf24e048307a042a0ae2d996b1cf481902ac91dc6ac49f6bae82474838315d023bfdb3a231141b80a2effae22b29047793187391388176694a33c39b3edcca7388b25b88e7fdf01542b8c1e12e4738d3388cad804a8a13028e1975b7094c4f3b2658b3667d99eb8d510220e6418f0f4b8746f88db454644d6e2880958a5cf109702ea148f3122ea8f87ffa7b2b835287dfb6be672d324bddf13a30ddfaef8c3a814f00aafd075bde5e3cd6af726164b58faa258706016cc145c82259465ae3cc6f5361823306585ac2ca732141e0b81532bbd12b2f6a815cbce1a336a82a04f0f0a2a86f7551967a162691e118d2006a838062269f331952fa3b18d404876c3e6a32f04414138431191b3d0113185d30b6c5c365b82a2dcf1185c07c96e94fa6df6324690d22637aca5f0f7c58adddb73661d48394eb07138b2376c3a9834390bef27fd4637f7cf16ababff6be106ab0224b55525e2644508908da84d63ac72425311425f011a5d93d71736598d4e4279eef9c4f7c8e4658b85c58f824e21f045d56e5f038fac714ad962841286bbc608be3993962915650d10f92cf62ead4a032262a33b30405d04e9e0262ed83a202940a897c3e79a401c80559b26038d333cb4a938092175316013b49c013d05a01660e4052aa121e78c68e20cd1457128951949e380e8030cc0049bc208f62271a655d7a4331b24baef29c6e0840184f930005819131477f77fcfebca974f37c7eefe9cf8fbeff001fd7a7efc47b25e9b7318ddd3e99f85d195451e86e5f07eece44191aec8a662ce2f9ce7cff00da045642c311ccc68cf5be4005c9abf9022864714242e2b0020a2e7235b56ab3ab40014b926f0cef101ec7bb8e0a2c2de7e174a5ca6f8735c64731f344fcfc7071460a64962a0283b973655c0138106a8a068955d89889cbc564f8008ae976ccb8b00bf2394b6e42428615a35c7a6b0b3029d310d04cbb9c4f948eb60ae1b330634f496188f786a58ac8e8ba1ce62fe220f51ca23824c25b7a51c213d410b19436262121799194dbb20c1b8bf3275ca261b88aac1902810a9d5c3d97c642f41b92912e0dd2709d5ecc3d65463690bab78c51402525050906f5665bc8d45b348a461cf07206675c53c798759216088a8c61df2b9758e44b0ccb0bd1ef801d338cff003ebd77c0782c572589ebd31be98e8c02815d1303e7bf1e31df2940554a3b43681bd39cfce39520b04a1af0e9f87cfc81595090b45478550784989c2a7a9a4b242b0521f6987801053318c905945e8e2a0f0ed96fd952fc20d28caf5ccc26575ad5338c93ed3ec84dea50393101c77bd99f3cc2155814160092668cc81a99380a142ae4c83499204ea8721ec2ceb1547c911f09e4e061800606302367f061328862b8cc0d433b5d914335c560c07289a10297fd481c822a6e0b2ff00edd33c31436006077805f2f6431edbcab83ad880a80324189561ca563054666351ec8f456ef986eb82530d1385590f83911a8efae820be2aa6783a24d14e0d5d11a0ce61c192005982455c1e0d7f2e622c2a8a54ce32dc777e7820dcd02a03238d083b862f004223a6d44cf95fadef84198c0463dd8e7e8273ae83cfe605d9e1623d8f60748dc96b063a75e393c82680210e480043c9581c88f358e61a74b9f1d784888b507d81c36389acef8f1502650d3abb18de37d700459db44cbc90060c3299c0d7044521029117b1338178850191f255ab541284c21edaf401706fdcd277caa43cf9d34d970edfd663a140c30dbbc34680cfc1c5825547e459f699ebde348b7edb04b277e2fd78bd1021548570840e627c3876d854128be82047ce338acd24494e1c0994bd6ade0800008425cf24732585ad70f40109683704c83d82bb5fb5b002a2caa89e49d4abcb604a06178416197076724348fb74eb38e60f72be2d57df9e158a572aa19ee99fa77c095aac9de10df6247f18e5c27913eff00cfc77c2c592ae1bd76bd073a9d78ebedc9532a30c3099a35d3bb9e2612cc8d58d8e8613adbd391745811a1214c822b1ea533c0290452a2874e9c7f0ef7cc9909738ebbfa4e218306489950de2b9604a72a6ab16592756242442bde40226a1ace5f66ebb788b26c1cba813ceb1fdbd89706332eaf7eace14816a5d2bafe4e4041008c265f1f175e0e382d4013aa45f61aa9dc719e4e2096aa07c6c530a5bd4906026083093c651b3ce73c7c4805ae2bdf7ef131d8bd54871c4be778f7cbeb66b365d8f5414f21c5f320a8fb430a8905a170824801c442b952e4561d0260032298c854c76d7cdab9e1e1006e12b8716eb37e8711991b2e4682efa2ce2a0ba748f0ee7c99f8eb92e4122a3a3b6f83ec7c70bd5fc461f4eb81140875359cbac655be34f1f61e35f5eff5e30e3b46a8552e8b3c53594db7dd4c44a1132375229bb71979c164f6709489b96ba5e651a00c90621ad73a1f3e1b0c30355158e81062b06030a4adc263de6e67ef7c4b49a1620f6da0a6ec4e37b00005a922806e95c4d5e6b19c21a828cf9ed423e780b4c0b848da633e1303deb9190220065875581a6f33ae34934ed8eacc17aebe79686c458c025993ce7f0f202b025591725f66efde71e71125cd817112843cee72b69192e8b4a4572430779a65c4f88fd81e03e03b3332b0a95c7dbc71f4b4d8ce7e60c1131a9737958b150a73d8348c00cd542f32f5436b51a9354aba50385a19289aafcba27bb71cb570532132a168301b05013289b2281c98b9f5d3bd71bf8e21617761269137dce01098421445bbf59f7f6e7cbf1fef8285142c6d3e6e9dcfbea02904385ad97b30e7adf5dbd2dbe707ba1ebd314aef8e9141c00704d0c4af6d667827b7b151cb0543a56745e45e5c912688ce834dddd55e20ac317da1e498def89c2dea0ba500532abdd5d3a08ff829115219108999db4f342a818829da4a13a8d21c9b20c297de598e3ed796d5a4301480bb6abe5dd785522d170c86b3afc673c1e898330342bb1103e3be1f6bc1d45c8819ccf1b185ed018097000321a203745377882430353c77cff18fb625002281f22e04dc78c7ea006f162850b3bf5390be2860b5ae5b912f76a6798901c235824188a1930701442dc442a464f43bcef825ccc09b023409a3ff005b56865b6122edc01c4c292f9f36fdfbf3c484ac8d18bca76e7be140183a0c1f6d78e43bfeff009e62c98937f5b8f1c8a93eb7fd3c4a4326fd631936645328de069a18366c7c331bcb2e3cf1b805333b831e02e6d661c2eed965868010a9a2b91c61ad50c4102d2945c4be8fbef9ab40ebe72eddaf79e6f0cc18805463f62f32f48f7aabad6a3a2599978475963d916db3af1befca9a144a06307a76742a64134a11891d64146416303d495800d072788572d70def8760ca59c8c5f1dcc7c4e246f020420168d13c2525a73348b8ba28ae158902446d0dc9ca1052caa48b8163fd70df45d9a947173b4ccf8715dd0c06e205bda6e631879db2d74854b9d8d0c9ae0cef19237b3a7ea477def9a9f3fd3c582f82f2eba99bbf5ebcef98e7a6753599b7e2fd67322462e5be09a3b7f7b1f343cdff005d6bfd714551f289dfc78f787a78825051a491997dc7e27d9b1c18c81b68688c9770fa4971a82a82cc116cc9a262f2b78a1bc119f077043d71722379401fe45beef7cde0e72ab9e8c99df672c2972ab6ed9bcea7fc3b620bd4d8886689e439dac995017d2df6e199a0b6e38160c8ad08d016dac3ce4c7a0c620ef0793eb07fb29c3b2a88a14743870005c4c38e4b230a08668eb14a98bbe328156001118631e04d7591e128eea309835a6477d55e3754040c408c4110a4a4f46286c283b4f25ebf9fbf092467489813506f9544f1c23e62317408b80b0e9159c0a26431d81875a327413ae18277d086b59c61b9efd72c61437ba3d74e7b378afc7148cd3ee77aa5b4c63e7d1951acc8ada1e7c276939402ad6699e8d01c6b3a3cabc461402220c130c6dfc73defdffd732118098fe4b667e3982667feb3dbebc59c91d062535705b2eb9d001e25c7ef9a7ad414376b8d51f08f8cf9e0f441293b7cc7cbd78f1c2f1f4b2f8bdcf5e3fe302a2e24aa445d90cdc533ae643bb90c62cb9a715de1e615d07b413c93955721c11842490c5efe9ca2b28647002789f09bccaf249d5f567c4c7ddd795e6b0d95a52a0773ec01d72d8aaa093095fa18c633c41fe3401576a45ab3a1ace5fd1b3e99b317c6647e97999c03104f9207008b232a24c891a421e0ecd9932ce404daaa95296572cb0ce8e7a3ed72950b7a31e0c753d4faf742f02e411c842a7c87381c3728a9cf01b4330963daae1954ca175b9fe7c7128e583cbd7a9ff4104c7dbf4fc7cf01701f8feff4df1088794977fc72057c2dde6d339dfa3ae40146c453b5d8be3f1cc6d9e8d4773ab3945a0665c38407b846619e3a428252ad53f015ce73ece2aa7d721b94f9c779f15f039138980a77e70f572713693b103e1a897793ece6721510ae24cc69b9292eb3c4a5f683682d8007980019e130185052a60a898382aaf2f24148cc10ea003c04e740effc9d7ef6700681f1788b77f7d7f7c0684ca84f37af39e38363058fe4e241745a0b72e9c783054bd7230c76c13bd3d6a79cfdd8180184685505b8ae4d67195c2aed5f96f11740c30ef57c7878d005bd287e7953e1ed9e8bef0eb17b9ce8eb7a1fedf7f8e2261226cfdff1df377e3fb386cf935f3cb7f9e7edf199f8febcf1989ece8f7b6f180f7eb8193d7c604959255064c9938da84e689445d84dcf58bc26756200a00380469049414c3689dcdb34cc1badfade1c20751346d04c84e728e4e6a27aa83bf477bb71f3304a215a8b6482062393416a0d1e48832da6c04b63a76f135666df1a8bd3cdc5598703665cea53074ebc24e50828f77e9eee71bf39e287cfef8780b551447bca75e211b8df1046bf5f9f5c597549e7a9cf22fd078b9abb319efdbcf49803aad4cdb3c9be1145dc9a645bddf1f5e3f82ca04100dd372e89790728ce9ccfddfbde793b9f5f8ff1fe3d70eff2dff5feb3c493261e2e0038b2d4c9e8ce390ab59da79fdfeb882028f6b88fd8b3b7fcdee94d2e593099de03b70678230684ccb61014146bda1cd2694c5b58210d69a8c9a08b163ef1a78f3db422040608e66a1bc99e25e113ac3a824ccc43bf97418bd8ad36f78009758782dae02d5da8c24c48cbf4ca5c8097321d78fdef86e0191a8a4610ddc7ee958ff140582914400ae5b9673339111ccef4e87ebe795148130396a41c6d861d13738e504cda13e9f9fe353882d4af977f7e046d7d78cf000425ae49dbfe38de5a96271bc4bbf2e386d4a10a026cc1856be6b9c70ca853264f9cf66a5f7e9e294525a9720f53a66bae77a7878d7d1f18fc6b8948c49a5c0173e698c7f19f87e7fd7155284246bd1276224bd4eb3498bec148e73ee13aaac99b9196937da51d26338f23eec62d3836c0494a09a102f8a0a39863efa950b82e4a00e497e38d4b0328904501062e318182caebf87f0f2ee2c9dfa1f1cc8bde27e77f4f1c188f86f1b0937737a7581dbbf1e388d42a9199292e9d7f554cc058c5cb11bb64b0d27863c519b884031a18d2c348473c4ab7dbe93f9f5e70adeb58b7fe70a27833ce71a1197b7f83b114ca1aad527a7b1138aa08b0ae0bdc9867665eb1e0584310300c254a0ed87765d8142318401e4608b275b538cd4c95de4117b98639a9f3fe7977fbe7fb27f4f14ba931a7daf7f9e01d8582506d20c115b31c984b75268e0e083255cada54a961e0b3290119ec9978444c28171140c30c6a4e322a7b0963a233ebae5c823d661b7acca4983983719ea80bdc305707387889982e3297ebdf296693d5d13ebe2ce3130dcdc6719cf1564450598962dd63b783c25c261c89768cfe1e22f0c6b0482940f744d9c1293dff0061dad86136f9e4b7167256b2a4cad573ddaf0ae2ab956b9cef7e73bbf2f0828f602aa83770201310f38700d194a856add276fce67175341d06092bf55ce425e360a3000039c9007c931a870352a1bb9862a042247a49cd2d5c095c17b4c63c36e85bc81360c8dc135b2b642a4df24e1a000b27ae971d712829728966dbf9bcbb23868c3b33dfc7d7854cc305a601b7571febc73467e4805f8b27d3fd9e7f143655ab4224be08a091f131605a4f655305de00893d185a9576e32edd4d3cb7455dacc6e26fdfc3d2ae542d250052c8a7a66e4e4c0a134114a01d25a74cd71d7533521c646e470c4bcb0710062a1d18783c26f8716db99e175e35c893637adfded819c7183a0c529d0ce31dbed9e03fe4802645532ccc66ef1298a7900142a59947018cf0484a61bd7b911f575e1e1e268a62498ce6b5fa67d7348f634f4f33d41abdc99de803bd6bae0c89f22d909f76ff001c33d1c45e8740dab8fcf5c71a0e30761c180d705144e0d092230d1c0ca1ef880195b92e6304b94b3efae23210a28e304c617737997e82a608ae2aef110c7bab9efa59223c8ef2eff8b85a97714c878b8c635abef913e34d3698fdfa73d2fbfd7f7fd9cc401c81dabd9f15fb73d8fef8f1f0730fd04053a78f7e0e28a87258e5735c65f769aef823e0041361e1a14fa52f21182b34950c90a9b2f45e3e85c4c0b5b301180f4707082948924ab20971226381a800f1b32b9c7f7aeece270f8900d0200afbbe739318c0b91829e0cb08eef7a727d42f3339030cd78319a0033a5247707ce6f9fcf156d318fbfeefae514084d4151bcee66d6178ba0542254c3bdbd77dfc718267817e3f8b687bc7051c91718b5f58deb9108322a8d24cabe00db89d72bfe63cbfddc708c34680673a97be39746920b94c175f91bcca25720a062390423d0608698a426e218eceef8ebe22f1bab60a37384b4cf9f9cf35f93fc7fcfd807ec8ff00effc7e69ff000660e9a1f5e5bc1a3042806e388b92868a85de505c842e0e26a960f043bf6785df09f107f0f07f84ab4149160aa65cf31055882b5820af78c7fd42a964fef8010305feef1f8f33f97f38e6bf37fc3f11fc9c20a4ccf5a7eff5a6f19e0aa56ae5fbf1dd22b3fd3e2714162a6541ed3b3c1cffc4002811010100020202020104030101010000000111213100415161718191a1b1c1f010d1e120f130ffda0008010201013f10ba4da8a071596566acec5e2ada19020005c6ba71379bc49a98c97575eba5fc730aa18411a5de9454c6a7cf1489ba60f4efbffbee722cca9425d53bf8b7c678008017d31f9d5f5ef1cc9148fa20df0c54719ecff165125562980fae500acb99753b9d710602204c96c6b791fbe12869a229d52faffe3c030131047405f13f409eb8c2146dbde3bbef1170db7bab3439ddd17af674ea638464131f002aa92373778cbbe22e66426525e4723e46e786338933d11333ab37da79e41c4158930975ec6fdf26e018d718315c6518e287738d814c024d9c29e0c078c6b1c8262319bab871e716ff00f788c5528968a265580ce10eb0440c220c4891597b3a09c53a2524b50288bb6555bc309b304eb4fd7e4e10212301a95d4eadfdf92e36ecb2f52e67e1f8e0c84278972c7697ec3946432955dd9135aafcf045f979a1fe67d5e6c7c67e70e3d6ff008e5524876bdbf0867f3f3c72a64cf130b7bbe39a04de2f85378f1c152cc5e69f2426b6cf7c000c914022dd3752637be9aa60501512193909a061111972c95185cb8fdb7c219c2b98434cb8c79fcf1940c002543c37a26fbbe4e23a2c38423aca1e0525e0d8a31b1a457b02d058a4387324dc16a23514c8eb09c999d24e95336e75a87cf08ac97bd0ddfbbac747325444a16a9a692974c7bc3ca430f91918236fb174c1e3800097edeffbada716cd510b0c1e46db20e477c60d51ca9218512410cb9eb840c543a01683d8a7a5f6e4ab2931b614a934ce5f3c02148245b36ee1e6f04009854c1d9e3df9c63e9d6960013a9600eb092732aa0ad4839a674c5f696f8e0081e956ea377503f072e0c37addfafefe8f3461684d57427bbf77800a58ff001be20c40d2006cf29018115da47ce3eb871e5de002380abe8a189792c339362361116c306c2ace668b15ed037750f3b22e33c472929459ea95b769931973c4354a0164405d6357cae71be7552ae2cde83283ee7ae45308b860614122f42a7870da6c6a1442930623ed704e3012294bad1393570e0e52fa522d5dc34f086870ae50c0076a042ff1cab42a5244cc882c2c99336733a641eb013a5d02ad301be3d139aa1a666b853198bd71c51bc99103b92f6db470c5784a18440d26cb812270baa42c1546618ca4cba1309cbe68354a0a239a98c7d716862061d94fda747c7126e04a19b33a0f9f9c716f04b4088cce37e619596e548adc4a687f6093e5d7044614039450647217e059cb0ac3a23a7cbebf5e4306a34600ce1503912cc4aca1839ac48e4dcd98ff0051a022b3308b46208284a5df37c8020a1340861c6f4d0702122225d84d522b7b65be4e1cb139def3977a8fc4e45071ac84501728818db629383680685dceb77bb9bf9e0871030222173434e74419717919e74a17ce15dfbe8f9e650423b099230000731cbb6829491328ef21052ae17adbc16100546cb428a2878c6f846cd64a18bba194934cf08040d8c92bb7c44f4f8e018007d7dfff00865062b5815c8aeeb9def1df32405cd23060b0f018c61cf02053d39c9819373babcab5314a03806321866718ae6f16c227c7edc0081de830e219ebf55e1a730df1c04cc0999f777a968a9197403b0cfb74f347dcbc14a117c7707cb03d626806d3812b739ed3831f244d4619e5f1e97cf111c005454002abd499fcfbe0431c105b18a5a844f9639e08d00ecab4bf2dc9f5c047489d24e8b2b898d5e0ec543b511db8ebcbe7df17282784c7f7fef0031c10066010d8004c8e48aa72e88a0a30dc80767663f4e178e085d81bc07332aa735344081a07b1d27c7ffad0cb80cafae533c9c530270d105eafb3996541480411b191a34c16b2c53b3832c2e3afd4e48ab2e679575eaf0a6936b08160ce7b30e3c3c281418a036143096b86f778aaa4b842ca65b95ff7c58a106d0a0560e025368b4b8788ef59a4c49a96e59c60c16182aea10cd73962621382c08e4ba673d9e8d33758aacc8d13bc812eaebf8e31a3de5c0e25c55b6b26bbe481417b04b03432792c95e609bab4e00a659e32cd77c2f646a4f850746c2fdf7bff00f461b00c05181ec311a4627b581dbd45111f639b98f3142b782c0817b981b813806403ea63f8e59f1600220c96470bfcef95590a34b011bef327d07200b2eeb1943bc60b8eb5a1e2bdb8f6ff00dfee7df1d4fc7e807f8cde0e05085c64da363c2a0dee6364362dc07901988322d590d290f4484190ef9700a88132c8e0ef5d0de1b462a0645e13cabdf8e361c2769a19b1163d0303338801a028dc0067bdff00ac7fe212c483e2a5fabc5e04b55cd8ba71d6e16cf6a53225736cc8fc4beeff00e8c0bdce1a1142f6067afdcb214884d2068fa1e062c4888c4a05b0ad0264633f21a82a901ac920b77e409ef7d702d120e18cb082a2df2198287a359bdefa98f385f8d7008c188d83a7c3338fabdce509277bbe78555987af1f7fc3fe01dc4868c0366d2ebc3de1140745d2524375cdc470f2263042aa9c9d231eaca8ae897292cb4f3199f4f1bd4d2e2957140a8bb4acd102fea0e846cc85b3ad58f04ad4f7f2c87cf18d677ff81468c4c8ee269fcf132328a9491e9ba41d9c70a54d11000220eb7b76e7ff004c89ca33d2fc01b34deb9645680ea94a1ef254ee3e270a00d0aa5614be4b87afae2c14ae497ecd6ffa70ac760aa8068d500d6afdde0730852a2675636dd38c3ae0b44158b3d86bdc37f5c02f5d8bf2682bbfa92f4300046989e63f86ef82c427032c5fabfd7934c9c8050815c788fc6af276e3aeb776cf786fc782ea2c85340cef7186b893ac91c02260fb3d7e3f138810012db03bd254724afcf0179505a20cec8a5a1535e1812e73cf633c2c8da8753ff3a4dc23d990a389bddf9c7154b7067df7ff00a73d5fbe5fd1fe7963d0fb36cc2c79761ae1539e4570663a7473de049ae0502218ad50d1d32487cab38806488ed482b1a01d9ece182f011d02eead43e02f5c4ab00842e6ab45a8628902e396745941953e887076e7db30d4822d5132b2866f6323083e2ae5c0453a19c9c5622a681a415a5267230c161c48282329a3111174321b3c078526545be0c5812a572c3a823250d1330b8ba1c22be4476114b09a4b99bf5c3c6b8870641490576143178489c49ac2e267546ee14c5e226c4f913f7e2d40279c3f48ebfce6a942efdea975c576766778477f1f5aff00d1050b012a8a478c365d3ef882e1c40d09b68b318f56e490841b8905c984511d44f5c2643eea2a259a6031016708cd6a0674ab19320ad323aeb910d5b0d307d3221ac38e12805800c433d5597847df1d29c70971b1aac1ad697272493185607a448f6c6eadb90903168a73a5721761c98200c8501533517284de2727b4042933369119c1034c680518044205ab8101aaeef33ead965c4622a328cbe0e24419f766cd36e96db7b9cbd818ca0c69db55883c1c09414e845060908995198e698850740df682f78fd48999364373b34ffc3f1ef9e5c27837d3afe3ae5f08364172018ca06b6bd62b01082e69772c8cee45bd3039160d0017240cc442100035ff00905d0bf05fdb871a19970aa8c77ac9eb7c4d6f20748c8684f92b9384be34f1548a0a3920c552b300544333c9a22e6be8da1e8414b002a3cae63d0ebe0b0bd155c031e4ae33aa1c384cbb4442da0c2ab11479866c320b82842868b986e313b580a8c9d80cab8707b719b236318b32aeac98ce96d28950e04054aa20dc9395f95b1b1cc819068859a0a353e019257dcbd066b4dc6dea8ec04b9858f7a90550ed226a61b8b44cacf50e9ea2752425160103219b6912abbd120e94f3655948bc45090ae442ac2911699f3c88a020610817f544a6baa824c926cfc019a31d099eb9570104680e325ae746e677c4904b306419cab1f62e6df326596a2aa2377207c2275c004184a8969140dc3fa53c490825b825c34cb0dbdc1e213068e5ed9ce3af3f5c61047a3dc74abe687a9c8a68cd08e9dc4acfed8359ecd20c4a0d35037144ca41d791c8d94cd8aedca2f1e85504c014b02a84cb6e38a2176954f00ab69016e53d70910e33214430de913d4d638e609422ac22d734d4f99ae04116c54902b4b24ccc9218d3d2ac296554185f67ba72c4936ab930cad80c2c0d35ceda2cd82e666998f31f1c50ec50cd05905c6997e860ba87685a186e737f3f3c10324509b5362ef7bf2f1e8c56580247760a2d63d79e237364c9405c28c3b5b0589b60859343181923b5d353500d8b3556d11434844f6723344512e535158ae57399b1b2cc204d3560572e5f3c7a827405f2819b2583d3c003539104700bdc04fd275c45c0ad4039ed7e77ef3c151624c1c98afae558ab55582203119efe1cb9e04935917f767b97be63a5a20d6d99c8371e072d27f11b6a331b32783cf30232c52900b43b25a7cb84432ec7b943c69b4c5d3c560f040f46b0c16177c7565402488e096183010ccce454d5034ec3ce3f30e198005500654900c4a52c5ef91d5bd03ac9dccef50e014c1038a22e44a627be38545b92648591e97b2eb1c674ca10f609ef23a0cfbcf1d21cc57acf8ee67bb8f4f0234457c218320ca63c3c2a580bbc9f12fe7589aeb97942a1902414450c224c6227324910d4cba52229a38288b8302b165a8b7186465403793566472021c48a66f087540bb20c2c98c89b6ef4f323e9e7e3d797cffc5a8f7f87fe70666a924d66eefaf1c4da52dd91d9a6e8c7edbe6189ecf6f08d9e31f3b1342189a88b06a2c986db2e2c126a4f94afbdf1a20b81cb09b944c535875c49134590f710c8c226161dbcacd3dea449b030076dbdf20a0028bc0996ca1acd7fe4c226505d20c47a988fae141813822343a5ddcacbd57952e9108a9879010ee9f460cd202969d1919b82c87100765d8e5d12fd673d71dc381f44cdfb3f6e06300a5ac1aae648d7c4e0771080c790708d10630bf29aba126db9936dac6cbb78b616af82a3de41b9821874b15812ac6c873a0fc64c654ad5aef75b8c7cfe2f10e82f4c2debcff7aeb9228273430a0193a50cfce0c7206de1085b0da040d728e3828e3c420303600cb33d5e034941196d050c6c0f897be34d55baacfb067823fee3400e20eca136dbf975df225536e313f6be27e38cefc413ae682c53bcf5c1846c30c502c797c1c1aa4a1531c513d80fdf26ab490f9fe9c1298a60c8152ae6d3e1a10f1038a2aa7187cd2cc32437c3cf3dc5e46eaec05d4f7cf047425945809817bb89c2d082b42a561f6487dfae1af905311b17da94962d1a1ca6a0372d01bedf7a30ed5d48c56e7219353eca702848748f99b8eebafd4bc46573016a8352ed976bd1796c28bb7707beb437ae639e32e7c3df87ff0033412aa183169239a465e9978c10241264366d7ad0c7789c3e62300e34b8cba7731938675821d2e7711c78fe2715b1305adbdf8278fe782699194db7410ce0e85985f4b21d90427ecb2b26902cc942025aa86a6564bb2700ca85002842dad41d083b60f3abe64b90172c4d49194cf09207bcd1cf86eee9c86a6b91826f6dfd897faf1896a42a1990705b66b25d92f0482b8e88531d2f9baeb8b1146456680d2a471bf8c70804f47572dc3d9af58cbc4130c0328807b7007e7f27929514a04c25f39eb3c73d0c0a2261c816759158ef83e54230a19ae1d6be37c17848d8805b2022310739e149a5268a8fc061bc866e2f0506e48e592c6d6c9d3d7ae0218420ef262ae598f7cb83b0444982adf3b7cdbc9e5980fc9af7fb6fae141010026990c885159131397020ea10632e3152fe71327c24006aedf0a0d4031e1c9802acfa262dc365e87916841458adb536dbf7ae11aa0b199303e710bef372d0403e40204aaa00aea2e381b46098c00a111ca2378dbc851666cb283499c8f326b3c88e8aca6983986dc71e671a850c62378c6693d7034096a015f38efdf06d25c0858d737c8fdfe39602572288c39dfafd781428ecabe0f6f44fe38c8090d92eb17fdf9e1c083d10bb4de7538442868bd85c97b31b378cec6542cc78738d19981fae38d59b56244e4ce81a0e2ed2d95835c662a092b00c04e17c319535742d50507899df0656053a8112e00831a140b04ab010643b2ed8c4865bc68d6fb2ec7acf114acacb2f8754baf3c0532b392125dbd1f167bc1a5c2018957e17ab4ef58e36258094be7293035ea4671398cb06565e8e630ce7e568052e2ca198575e9ebabc538117300659911d7c0e9c9c05e1018a9744946dabdc08871eeaa224805ab8524cef8dda6497351b20a521ef9a4249a15819dbc8926764bf24e95164cc33173238e3518c09b134c70b697beb937e6034547b049a2ceb3c0a9677abfc9c90cf975edf7fe174e6b9ec8a0546fccc5ef8229b92d1b3ac071d21a4bf65f1ef818476c833d86b31f9fae56c5b8000c50562cf2d526650963c28af4946c8ac33ebae145e442d2d00c028e4451e04fe1e562706949d477b1db7944db2993c9b6f82f27f4ea030876857b70f2b18d03f407c7df8efcf016866ecff007c81dac4301280c58b918dcce111816050d9e3dedf7be314d6ec3143479b34f3392125d248ca31234eb24eb3d47c205b0983afb3de5e229ccb47425cfe03b7bbdf02a44155155a9573747d1e394554a4567e358bafae5e819115170bda530d55579d13e63bc761bfc72cb3bdaca868b448810446721d40088add98151944a780628992070035720a4034b6f11a1406552ddf67478bae548024a0cc65780465ce2706701a40010c87194def9031542398ced3639bd39e3c90ac1c478abf2b852f5cad84a8a93085d4253a6f12484d7fa2be78f58ebf63cdf5cae6206b09f88714934392354219ebf9f3c78a3ecad3db43f9ef8090b40a815a38062fabe7830209ba69eaef0c7c7cf1264f059e7d5fe7991b5febbe110c34c1322ae85746a2e7841344a5dc0ebf3e5f0b78cc10510c430288af953c62e478616013cb347ce35cb28504ce5a0ca20303065c64e51615c924c3eefe86bbcf20605165445f01f62520c26767caf40170a5c553d61e31b55054717adba255484c80e5119f057e618bde3876334b45c8214a23979cf17845e4c8080e20be1027130c84195a5d9a32930cf7c0c05448c0fcaad763be0c020e43097b1a6650cc29c06639e252b9118122fe4382010132a29c6d9da286ce0764a8fd1fbbc7337f3fd079e971154d35f05fd6f05d14c4c78e484596ae76aebbdebeb91603a7315c01319330f675cc832111cecd27e9c6ec56976e81efa99e56f6f33fe701580af832f026803808dacb22a43144bbe34922a758c453b2680190c61ab2d0ba07218464c66e739bc009e993c20758ff005e7902b440763d19d61c7d70d08d61926bd6f19f4de9e5f8158c420209221592ba667063a804390160572298be5e5cc51046558cb210fb3d7270ee2d0a5099f6f045b62b4102e87c7ebf3cd717ac66777d7f6f1bad026edd63f4d5f5f4a8030d591d9fa5fdfc3334d08d9ac80c9497db77c52a92a088fa8795713fd7213c1d9c42d6960e3638c2714a872fdcff007fd872c840b99f5533e69f23c90c1e56ba7d18f8fbce5cf597a3cbc9e7fc9cc4ab9de6b3e37d7f69c6ca90fa3e44f9cfc70c62cca454205471a2a337d7030b1dc7ddcf433d6fe787dc57b81b495032a026f94a9358337cb685e8462262b5b0b42b1088cdd0d90f2460e019ec144ec4c6cf3d703b042c00568b131d4a16af179804a9c12746544b027c54ab4a91a622ac55ebd3c9de019d4e1b7330d43e7a542a802551c452015198a832904f8552b941de73382551ae04d1add86fb25e0139c54399b157ff0003c71942356183a521d22ebb87138a014cabe6eaf53ef80452b0e4ca6c5f6bd431b4e0a822163b04249eeeff003be00210747ff5cbd72a492776ede55e14653dcf0c74935bede648a1156452b6d7c07bbcd3b74c49ce5b48d0cb01858014d152d0d5494e076d051f9e6bc70aa14424beb1eb80262c9d7cef5c704cee70d7e3f7fc786a2400872a0526beb279398a35a0c1a4126095362dc872e2001020057430a67ddbc9d2b2ed10b4694c1c1e46fecf601329280e7b0e34d53375e4f1f1f5c9652c450400b8679353f3ca8040991caf4eb7d63e15812b2c9339d8b9279d193c707ddec00708086cf23e0ede29371375260b37b17c7df238c48b4ddccea86e6f1c6d26a5564666090228206f91980605f2be230ead4e0465a40ea244a07dd5e2b22ad24bdecc7edd4fac5927898cdffb7f5eb8a8b36064ec7fbf7df106de04e0d10305a400bb56facf2917a91404296f41926d1c4444a80083266806b09414e2daa52380001810e4330c96744d6625f099ee7c03ae256cedb1704c4c63df8f3cc2b359dffcfef8e0d402a2ceba9a778773df164a3beff3d35e3bd5e1658badd784eea0d92e44e0c16dc18d61cef8fb64d44a902093b8ae02ca681652403a4662aa2873d9522500a96413a564012e774e86d320ee4dfa751c63e9b43a0c4edf664edef3adf251687725faafeffe62a683552d2bda5b3b7bdde5146126dc85d42b3f49a9865cc4c5ec51a52cbd03a970e32bf0c6d098fc722dc92875116e60a60c8b4e24e933d3fc97e07f8e6f47c0255f06655c19e591764ac24da5190006b48aa6a2cf68f54528205e2845a80056910fdccf01c03428550a02dadc5345e0490606619110211aaae71cb09a010621054a05cd5cc245d18f8ef9b2475fb1fdfd38148dcfc7be0ee82641ae11866b7c7eb327041c81031523763ae269a50401b0816c222f46f30d12eba4a0ce95c83f3c30d9031182d466843dd3131c8691e6642d8e56620b9d646b32d44198412949951cde040885d1ace3331fdc4bc4e6d6095ec7d61b7ddf9e47c3f8794653015d18fefe381516e6528bb3e263be0c2700cd50cd957be34210e116d4ad58222b002d2b587981310841021260e86a4e21244171b40690d49bf8bca94c0186007816dbd5b6b791b883940b0e42876d463383c55ae42894a49401cab799b385ba321a0181110cddd503f0480d82ec3664796448038ed5000f5b3df05025256b612818689bccbc7a1cc072a69d9eee7858105681952bf55beffc165c16e27d5df67efc8a5dc6a77e6ff7cf1eb0d0a3400c301f4ede068928f90492b9cb9bd67d085323e06e4eb18b5d714129eab317123d06cfc3c7d2422aa844b8459b26ccf1e5df0fb008a738225f2e59857bf38b1233163154caa2ce5c790ef69dfee710d011c01a5fa6e73fa73e3faffcf8fe9c9e210f945107abd3f0f1ca464ad92312552e13cae2725e0123841230c81d8ab008a3001b947b815126437c17283b7074bd0e33f2e5e1539c125eb3e4675af79e0c944130648ef4a3ebad70c9013ceb5ebfbe65b125cba2e215b6046e53c72c9cd825fcc9131d74cc1c840409301808568ad41d717b960547130046aa230015bcc40c603039a6c44d0962ccf050b5d4a1ab77dfc1e7cf153e674dddd2e4b0ce42e2f129205ae3d4cff4e2c2da873f39fe7957197c99785894a1498c2535dc79612c2d9617ccd5e22d0228c9464c788c8fdf24123e2e01093431d747e86174815c0cbde51ebad9c450ab639a06558a731dc10d3252250390adb36c4e116254b1296a418c58f663922191476c2cc29f8c7230491348ec150f8eb137cc41d612a190251305876b63090808930330a655af4f1c20921620e819cbef993bfe5f8dff007f1c4ccba8590c7b40157474f118ea4431b8e19d4f3df5560143b12247c627fce654c8f8d33e37cc85cdbbcf6e3f8e2c22cbd1d677ff007d70ebe08b605628836e3cf9e61601e598103013858cc5e0408f4eb240c85101af2d9c3c1b066abe72e73eb7bc9d85c8b1926e3ccccd7d7377e3f939fa73f69fdf7cddf8fe4e1fb7f97353e7f879afc1faff000ebc73a7dff7f5e35061107d853f138bbb850912a48d1cdb78492958cc4182a571955739e3c8602fac5fefe65d734176f0a382d8c589a73d1c692454128c40184772f95e180166080780d60beebfe1cb1d50fa43fdf317ca7ece0218044fb07f7794b96bf9395056aa7e903f0639bfe3f8ff006e69f2fe7fc1334515fa81fa7f77c2006565c6a3e03c1c1aa5512e355f5fdf9078218657d7ed3fe75c7a0d781eded17f5e7fffc4002410010101010101010002020203010000000111210031415120611071819130a1e1b1ffda0008010100013f102d07f7150a31ba09359e5bde39f247aa209929ca9cf91298d229a8c1948062449682f3b6fc10194bc8999ac294518a05b40a68c7810ea2652e1648a27c135a153b2816963c1e212f20e0981c59b6585fa55240d20c1c862188e4b4e1951201311a8bb01dee16da4a285144371068c2732148dbdae681427a970915390c81021d0e1ce163e54971458188a0287ad9ea7a100a41276419c351d87181522360d14a883752a565d4232b1518232dfd0fcc700c5061dee5240001f8585b028102a4625c604a8608841c8b7962c0006600ae380ac09669c4940f0d3da1e090e83b7f3537b0a24f84c9c60454d683e78500d8b981cdb00cd2b7aaad241eaa55020f84100a9d4232c6ccf240d0b2f2abe14d44d9207c0941ea91480c5973e8d8610bad09c0df074a74a430441a2875c21eb232dd32d700717732e2d2189030cd76f0dcaa0c63f420328a16a61732781837c69a213350305fc4061f4aa184dd3f38d2911456f805077a46b19242609140ec87f005ceb25105f10b51d248d4da40a411730842c31f0c907c6919645706e89782924c484c0808841b93bea409303c853e54c05bf04cca3da864300e175857b7bf2b0cca883cc33d09a0c6c01e0e59f7a556f1a934b4a94288b8fde7074596865e5100843c6b57c8110115f9cd2e1d63b29d4ec1b4808887454852d1aef06aecc4dabcb12dc84f60aa104c1d713078a60a2ad2afb5e0e3ecb0df482dddc921202586b92d7281079f82eefa2e46526d4e8a3825108e0085485d206b497787f538a35e12d1c02af22a04288da4498cc730460748dc403d5b316618cf09410821260d1e9a8de0cdba31c434005ca808e5e570b8499820ae1a23d123210ac540b64215490ead95e5722640504547dfa094ded01c79d9d55ce156a913231f9fb7f4f7046b0d1bf3a125dfacebbf8030fb2c4fd8a11e5d4d5e15a70cb6e2b0118e1d1266b210434a332ddb5ef6e3c875e345ea3a42a2df392474604d5fa68c6f37dd25678f2ca1f3bc672226c55a5596d686eca725c795938a279028f66229dfce3181468680e9deec484f663afb389f080ede6c2ac8c436778d4c47bc4afaf57d50369e0a42f4e093b29a8260c02e5b2080ba4052d7009481e020e115e2003352fc28428140d42ec2c1966367839386748d21d64254ec34c2b659ca2eca250480e546812d2caed653fef138546fe10b1049e759be46f6393ba766b321112dfaa3fa25c7c209355ed1e87eaaa82c8ec28c7b7f2ebd602770487687ec2b6191a38a2605a6db6b8a1a85534ab17b78eb56c0b86402f90055309802c2ada9e4b2a0521602442defc8159ba949e7dd107df0d8189e51511c3bd278d8135942c15ab0257e8a1560282256bd81e7e6118d209e5df10017535550b5b362c07b90861284578020a1e889546a8b46b5a4faeffbe090907e85ff00bffe740f09fe21ecdfdfe06dd558e0459623a8a0be9e96f3428a44a61a1ff5e832f222d024909588fb7c0395f78002f4d6cf0ac80f8b03a3ded84dbfdb282bc3cdb0cf3850bc68936fc65fecd3bc1f8121481823ebccb221157bb11004bb25648162120c1ba8a5044e1a0e4d1bf060a5c78ac7122c714020ec70ee8969713cedd044fab168285822b2c00a804ffa12b2a48b8095274203e8534a98553b9fb122104551440eaf31748dd01283a307410a0a73527666548590159e8924d06808a40652091c2559d770022874fa272d6121e1e3872cad55153e6bcca2b49645e41014444537ff002f87fd3ffe747d09d108a6e55ce95be9eb1810cd8807de775c8636a695a8ecb5d88279224681280a02855190cef514b7cdc222d4e511e171499db6dd39e40045007dc7698b0212385447b2a0eb8c19003acd0831b79381889b0a82b51123c169c9714514268ea31a146a6f6faa0a74b312c7868690bd59aac669206ece5ae8a7d5478b01a41741c3174c1530f44501a93a0b0175b02584c1c6f5c6973ef9a633f953f4ff00b3f909a1a86689099abc9853cb10aa689122203221464e4f5a641994ca42da9d82580b7dc4fe90564048e8b20149f991140a670a4cc1646420c180f2b1c7212a58f38442fd53828086494b0dc5b8cab84df30987d54544a105a115c6fbf686e55562021a84f64ed839d2ac902420af41082ea8035b90c169171e9119850074d35512320c4d81746110430361405e5d790f4a840341f275871ced91d551848c48efa131085c5bb577fb6a7fef7f862ed142fcbac55e1cd8312c980c6f7e786efa0fbcc0474a5002957f94ab83d049d557571e1714c5bcd6f0f7b3c1af9b01e8e9b5406094a61417366c90a5703507e046112e9e7451712940c019c8637057cfd42400884f826c9b8d076bd02bf840190e86c000b501925002494037b40c268c0c828d205b88a3f06641bbe4878b4d60e979c69c94d5342004d1b0c9cc1144d9b53477d0dacfc911ec52f802be310c2efb5cca0a0004108e96c3acdf1adc4c4928e439ee074d28927d2513be1182c8c701fa9c75ebfe49a3a6be5e5d0a253cb6abb3a24b9d876121eb891a098deaa648a43f896a68a3e9894c24001e4241bb5088fb6401accf28c015e067d9b5dc2b77e3236b4b1b84af888b10d1880217299c0d075ac5ca9209757a7dd901883513970b64ac022022f842c0a6ab2ca5ad4090c845283e95e35948285829240028312f270a213320e825f414d4c1715309117622313118b1d67825a0ea270f20d7d09c631b4354026c45091307533702ca920514ad44120b4efa9d3b285e00d4137604b0fe37ac07d8a6e6671260a7b2a587f8e8fa8661a94d0ba96ac2213dc6ab404cfe287fe7f9796cae2ea2aa4722a3b862b07883b4d92d416c47a3e9d9ea4af658c051b9bb826a8a0900f5b38a7277c2735510ee4b60358ac0f94016a2d7046523992119321026f4733b7be154de2c090b1f0423044f3bc770d2680b07e41c01a6471212ae0914baf0b011e72a6a67b6a048be4fad83458a58505f89b91c1745d2ea0ce0a36a65466e0911373164c54084e5f0e160b645b3e2d1b87c035ce6b0bb1832a327eac1fd8ff8a794be4a7bf9d47c47e7bf7f3ff670b2150224572283cc10196103433e67f291b6036c821966c481c85730634a446d2b06a7be9781749cb8501b50a349d1e26c0d2cf1adf96045dbf71d316c1040cd7b68f96ec2a184e70209f5c427ab0d05307c9814316349265b1c2002490b21154476bedb60cda206c04c770f01819e6481b86c44e410b04a551f329059bf0c73b163444281848127ad48e6a75cea8ad74eaafe1321ed2d80b02a2d58f4b47df0323453bf29de1a1d1b27d3a66406484dd08b01fd0ac6d154c6f11ec1a40a7bc13bfdff0080d70272f764834fe8e83ba1d69c019d42fa5c1606c6490ea3110a524bf853ca5f65f9fbc6d5d14e2a1a86a801bd775cda93ec6a9e809d38f179c316a0bb2ceac36abb4be875b23e2c9a9e8987c700fa0b21b40420409b39a03ea66684c20d49599910e0c7ea1f9712a044ce064233f0f7d5142f56db1a55062983562fc54422684c04a304b22aff00991fc627348b0302e58aba6b929a52a36dff001c8b8b40d1f94055184f8c8800070f6027bb2d815a49a84020bae2abaa43e271858ca3d4d247719ce161c1d918a36059e2c9d2001bc36ad0cce6868a9115aa7d29eaa6a8d0481bad27d385a196005c021e66eb650bfb511d850f0bc3343d460f26b1145053b5532414a11152b580619d78643c0e9263573c5f841dc061cebcb06ca144d4e3607936a511690e2a2c70ab86bb4921708f2aed781ca0d60fac986c173d730acc65b5c5d7707e82e05dc07dc231cd27076ef5042c052953818370b2cb8dac9750295c46cc341513ee2e8082c1e2ab8a43c17cc4b23738a86085613855d4ac071ea2c384d58813e11ea304461742478e3f87ee9935096e0d40411942821ea45915773680237d659073b485284463386e0501abd39311bc819576f9d9a22b94e85f046d7aba560ad34c4662c1b2005bb610e998e80eba24bed0a6337c3582446e695bf08c432b938e4ca271e0106a0c5f2bbf7dc3c899f50a61b1225a3440243fb53bf1fc103a489c90a5226824a49132105decaa59e36041a8726af18e389107affa5a6a33ab27691a4a6ab876557991b4b1e7a0e4c5e1d1f04ab035dcb00d4c52d307ce038fbd78d60b7a1208b5d536475a808c7c1c54010e0de100206e712584d505bae93b3c71052011f13647cf5645415a464d56b25042482089311bccb0a20e0c4d4af73258f408503c2a363a6a465b33d30174b62342878c80ca8c6cb34cc9e1b1066443dc93c6996544b9c5f8ebaa72317cf048c16fee40223e780068c09ae3367c5c354c79e4769ee243631a85af2ea6c19d38e17349369af00d1d282b888f6c48d4b7ba209da7dc434f80498e300639bc3429e4156843803b5c9426f985518a85d6d017a9efd9831302371a22d85db961e42dad8274689af4426e5641057c4a3f897b2890b3fb352d8318119a54193ba9e6b151a3c19d86a128587068c4b9b8c9d89f4f20aa4d198052cec8c13c4d51480140d6a29901c032c1f503a824f042eb59079110a82fc2350709533ebd11fcc0ca654cd113c8130ec37fa7885b09281b82c94e0d8dada46c83c9153e4900328b0f6ec4bcac1b1f01034016c87fa5eae96205c13409923c9cf4a57dca3966016d0ea6b70179e19b74ebafa19e1a99d8c445b1072faa8453135638c6bed456dba8334564e11cde252e082c88001e51b73c7f810548a0e11f8b24657b846dbc5011d0683143e0b5c4b94517e7967c3031720a580e52c019992eb78933dcad3036d1dc97bfd6bcdb4d81f43ab390ed0371a094aa2ace5c004264f445ae4afd3e15ea6cd1702024787348488a17d8354654782935005d062a3e037cc4e13adbb3b136fac08007ea7c1fa2da02ad67d3262961149a9a201d64c18234b580609436e114a59032a690b916e509392dae7270dc10563460449c41ca4937a868d0d1a00661862a0205985081670009608eeca2f04b8783b216bea0bd1ad4404543015457aabf9f1a3bee123870dc02d9760bbf85b44a874b4001c843e1e02e17b77c084b10c1c2023320c3716e882fd8294342f7c16036701ce22a7f4bebd08613254fbaf6fc286967d23334eb2cf080fb8d4e6539e9001179e22a5f84ce837c088d8fe91b194231b641e0f3038a982154c033800218c6e84daaf70ad50881249911a48785b7de538da041a1256763dd2b8458a7740c1d5496a2ea158bc7d02c10b200079ee6bb860986824424ea9feabb5002ae8bd00de6d6271bbf6c8a08a2f468b38353d6b8643143823dd5049b25aba0049489106eecaa9985b6cb4383f1e08a62d51761a413352c517702236dbcf70725da34e81df454aa9286da653bb188a3a479627316818e7d3a13e15a0171ddbf4e5a08b453a7a9942342fe641704701f0fb198081e4e05f26440c3f9b0c95e912561f40ee444ad97dd62eef3d75ace920f7a8ed884366f7c2ac101d0a951cb1d44f143d27ac01d8f08105747071bef84f78253e916951b992bcdafdbd2f308781479561392771222613f2ef53854b929433938bf9c68372725b2a206123d046be990f1c04085229c8043f43da5552fb2ee5800071461c839907a48631e1a561c2b115eebd455cdd99052d2925ba9044c1e963686a6c2ea02d4249a630559633b204bc4198cba2a8fe809b160120cadc7826680027c86c267c0d30005f2213993234e410cea28851b1029c662d0d6272c0b7853c257ac8a5060b5c06c11d2992e8388e6952369af9e880882082f560c07821576b5e7a52046af403484b0ad524f160deedc7f2abd631d6050ae88884485ba9b97161ff05f51b0471c171d8365261154c03f4509dc11fa8a93212121a120eb1e322d88110f85b13ca771b9010a2b2e9a6b6c7961b9010d984270c39ce857a8700cdb1aa3172eb63a60a33180ad8b7d24e0086967a1604f86a517890851765f457753f0410f2ef27a1116a3742632606b000c386c10a51b99cd1a0a26ce11aa8d3c04102e004574ad38ae84584a02190249bf64d00546c128aed318ef22104062004c06093bd8aa0450c8000a883c2fda3ae1a1307d115a83d7238892da00450281968102da7aa2f2cd32bf4b5600d4498707050c3076e9d7a45288d7d9a4a1772fd80f3c95485905a365387a6a46c6470eca1f26c427376d5aa5568a3033e2345d68e6a82946a522acaf184cca22e4a953aa2839ec136760b61c760724465ffeb4b72d307806d5aad5a5feed7bbefe3de9828c1d860123cffe762775c933e369509b75dce18212d8ebea189feb187e75494835752f859749f6afebc3c8e93228cd44a1c0d07dd5847c74441622809db24bc400fda830bf9292fd5f9c49e9902bf76936a63e986c54ba28648a08e829c813800b1858328dc20201f058865d34853bf1324a949f34984895004b15702409afe807ad60b704aa1c8495033a9a190b5572fd2ea405030250816aa05e9408211481d7968750a8f7ab0192f0be1ed9d5d657866d2681ed51682897559bcd70b2d5328e91d10c2f4bfc586434681e3ea4b53c2ada4fcdb5b30558ea9f307ae691971182e5cee7e8c826e080ff00a0c1622e80b17a74518905140a803305a2335a6b1a0b1666c1085042a8943490aad2840a2c5889f81253135373fe7e31ccf73846514a2f8abfbebf33f3884e588e508c20260bf033928a3fdc083ce38c082c535f018ff61fdd481abcc6292a03a2ae34a07a7c1af3a817cb5b114a1fdd67fc3c65b105ab1f082848ba577381498805445ad6127d29c12c7c98d0d4873871467960282196649a3f0e53b7bd934ca810d069558894c1031be852082840d0017491531b3f40669238f0c88a29cb48b90308137f8014d9aa218804b009384fe3a045a70a66c04a201434f14dc74285a067e40ba25c541cf505fed3aa4143d5557cf73faa7e251e29c750a8fd4d8a0c141b14067cae0224bc26d983bdc8ea0be2c7d86a3c06fcca5c88a329844d708a89a0ae132b89b063ae0048040b74d3efac0811557812d4c949578d747ead58aa1d78d0ad6228004870044d6e0102d268603a23fae38fad76cf8083f1881f5413a3816a2157cdaa530ba239acae12f88324e06cd05ecc6cce512e282191e0e0fddeb11a85c9594670ef2864d9e86a60e73111416f484c751526747ab18e5f2d76343b148316a583725305aa424ce13b8b00b8cbbc47099a8c948600100004dcd45ec1402ce66160ca38a1bd7c0fb073263b80dc62bc1c24a4cc10e1cd04f88940101630530af5ac142a7471ff0059abb6ed0f37621c9a4816b60d8f880e204883eba48f97243142939a806b63ac8356b50e00b882f0322b4d29a0851d182d4b36e05810982cd75c433b8a31afcb7897ab0074440ca2a2d253874615b10fb57e8108480400cd1a494302b52c158d04201949a4c516103aa309e8b917ece15a428060d311b731a0869ac4770a85462620d06ad751103e2a8003a60ea9b19a495ab4e9a29401cff506200e802875e18e0731a7425e168e2a29a9d2a46343672564d4d10aa2e01780857a040f9aae1e8446cce664f834c086c10055ada882ac050208a4b3e0e044f0a9313a8ead93a29045807d200ea8775af410a33a6b109a00c859c3369ec34020404142dca83c61c28022e500151aca0d1e7a58282714b3535109c73ad8334004129316ce1bda28cde75f32a3952dfb590355a907b45c703450423e8541509c8000460347805b01f48149328293c8c0c0713c410b6752b4a5844b11e795498d523f4132a39551b15edc16e685125bc4f23ec783df8985510202625019fa942880c017604d828214501518814836208693d52165b2b49d1b1800a886e8041c3b463723c24d6b9dba140143e46db8151431b36a320b570635a504910f6aa86236b443bb4524e70023e908a8817128052d5f9ce42c0400404841ad0fd0c854560d58061cecc2fd0b353e4a9001b87d7b5360154208d35040681f9e2200c261ac00285141459b644b81f128ca8fa5c10b93814874d252e0c6923407a1e7abf1c51119d1aa2119324e121390e6a32c8e12a423aa950cb366093d3665ac0de452844f45795015a442c90a48580eac01cad85868090a52e084c47f3b4e106348e28809c8c75bd0e18369ea0070830cc9575722d1891360a04c9000b80033c01020fb5b2d225c164fc1575549f63f486aa48e798a5987e811408645a4ac1097872901226901c420054b54bcf8cdd14c42de47b00415e8d79b23e7963628a8466308167cdc0b42d7b95e4d84893c2ad4954348014f64b16f3cd9186b8310ab7073885f3a103edf15627b000f79822e4519043e0e0ed553444910e2c440be2a524c0a91f24c0c21030f0ca54021355b21a26fe8c3389425851111a248ba37111b7358211891061a00810acbc1722eb124bf3322b02e5fef530ba3dc4982a59020c10e2dc1e397d80618c0728804f7dfdf93c90dc35d03404be14511d818a2ed50cfa40100de9183b07c24d1d2bf9c5a82362d1f45ea08d4a024102af4bfd048a146059014212dbce3c80e268d9d90e4eb6f262e82800169d5a80a8a5760ab0542cf3ad5615189da887220c8253d56f56bcd8d333eccf5489596cd575112ce19ea9a2036264e3bdbd132984b579c1392511bb7ef9a3361a2c26799d98084284bc18a5ab17e28311f3d501fa2c66b301c0791c7128a36d19026c02cc2474a58b6c9a1fa6537e97304e92353b697425fa702561a51417aaaa94ae533c605504f129c00a162a1cc84480704ea7c00e3c94cd136c383193bc7c2e1f9b5f9096668788860c66c0af100b4e45344d5689006d04e21120ca02c50cbfce7c49834491bc4843596229609ac79d232482d080a0c1a3843f1a80f9d79cc30fbd628f2851be5b28696757e68db17640247da62484352659bea58a6604292298f68f4a48205e8a2d5460071e55aad200efc689181555555145d4687df659382e8634f0a3190068a45347ea37977406abc3adafc2cb6feeabfe58de98c79c5bcb3b1226d20cc1a674c1427b82986c400d23b10819e24dd6f51103c688650d161559dee68d9edca88927953a851f2e72aed442d2a5d2bd18968ddc1202c2730a6c2d789a448c518e0d9471a3619188e771f91160a156a683bad7008eace6ccdc3fba946ab5a0c4d4b1632f0fc032ab182808806a19f7d8b030d6ce820fc5d958f648d330d1c174348bc42b936030c80a4fdd3b9f100a440996d50236d2842946d83c80c54540d7042326f0f2090033018834b430d0085295596a891590e791285641d0170010f0c0905850eaa510e98ace8164c16a062ac6a274841e37a21522b0e1c405782c9004f2e2ea30c1b6b891a7b8592846204d1e01dd7497db50b217bd687a0196d40fa5d3f7c6a0c296de20680ac03cbca4f9d5cb1a82f4b55558e8a6e30aa11403038d3a20047cc2a0bcd4116180901076cf2ec885dac51888e86aa1b782d10db1b9b32721080b00291a9497c253c51716697c354c74f5e236677921178eccf4d5aaccc5f543682c418236e26958f6d455305ac455e4a230cae00881817f4d6f49ea01aa8dd4810fc06843a222001e37e5a0d022512b63058bd4e890a20dd1a87239e9dafeb4a30431c71081c036f35d3ea2fc2c0a58668c140339fbe1e39705812142087d8dd08596ddef6d11218481422111455f4f1a624d0fda668f44f4107e16ea8caaa8417802e00a31c5004c3a8ac7dfe88d079aa172c905525d957c03e77ffd9);

-- --------------------------------------------------------

--
-- Struttura della tabella `userblacklist`
--

CREATE TABLE IF NOT EXISTS `userblacklist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(64) NOT NULL DEFAULT '',
  `domain` char(64) NOT NULL DEFAULT '',
  `prefix` char(64) NOT NULL DEFAULT '',
  `whitelist` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userblacklist_idx` (`username`,`domain`,`prefix`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `user_auth`
--

CREATE TABLE IF NOT EXISTS `user_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_attributes` text COLLATE utf8_unicode_ci NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_auth_provider_id` (`provider_id`),
  KEY `user_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `user_key`
--

CREATE TABLE IF NOT EXISTS `user_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  `key_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `consume_time` timestamp NULL DEFAULT NULL,
  `expire_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_key_key` (`key_value`),
  KEY `user_key_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `user_key`
--

INSERT INTO `user_key` (`id`, `user_id`, `type`, `key_value`, `create_time`, `consume_time`, `expire_time`) VALUES
(1, 1, 2, 'A8kaGqtrmRM2XEXaui4fWD5h3PJhl4fb', '2015-08-09 14:57:49', NULL, '2015-08-09 15:07:25');

-- --------------------------------------------------------

--
-- Struttura della tabella `usr_preferences`
--

CREATE TABLE IF NOT EXISTS `usr_preferences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(64) NOT NULL DEFAULT '',
  `username` char(128) NOT NULL DEFAULT '0',
  `domain` char(64) NOT NULL DEFAULT '',
  `attribute` char(32) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  `value` char(128) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '1900-01-01 00:00:01',
  PRIMARY KEY (`id`),
  KEY `ua_idx` (`uuid`,`attribute`),
  KEY `uda_idx` (`username`,`domain`,`attribute`),
  KEY `value_idx` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `version`
--

CREATE TABLE IF NOT EXISTS `version` (
  `table_name` char(32) NOT NULL,
  `table_version` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `t_name_idx` (`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `version`
--

INSERT INTO `version` (`table_name`, `table_version`) VALUES
('acc', 6),
('missed_calls', 4),
('domain', 2),
('grp', 3),
('re_grp', 2),
('address', 5),
('aliases', 1009),
('location', 1009),
('silo', 6),
('dbaliases', 2),
('uri', 2),
('rtpproxy_sockets', 0),
('speed_dial', 3),
('usr_preferences', 3),
('subscriber', 7),
('pdt', 2),
('dialog', 9),
('dispatcher', 6),
('dialplan', 4),
('dr_gateways', 6),
('dr_rules', 3),
('dr_carriers', 2),
('dr_groups', 2),
('load_balancer', 2),
('presentity', 5),
('active_watchers', 10),
('watchers', 4),
('xcap', 4),
('pua', 8),
('rls_presentity', 1),
('rls_watchers', 2),
('imc_rooms', 2),
('imc_members', 2),
('cpl', 2),
('sip_trace', 3),
('domainpolicy', 3),
('carrierroute', 3),
('carrierfailureroute', 2),
('route_tree', 2),
('userblacklist', 2),
('globalblacklist', 2),
('b2b_entities', 1),
('b2b_logic', 2),
('cachedb', 2),
('registrant', 1),
('cc_flows', 1),
('cc_agents', 1),
('cc_cdrs', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `watchers`
--

CREATE TABLE IF NOT EXISTS `watchers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `presentity_uri` char(128) NOT NULL,
  `watcher_username` char(64) NOT NULL,
  `watcher_domain` char(64) NOT NULL,
  `event` char(64) NOT NULL DEFAULT 'presence',
  `status` int(11) NOT NULL,
  `reason` char(64) DEFAULT NULL,
  `inserted_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `watcher_idx` (`presentity_uri`,`watcher_username`,`watcher_domain`,`event`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `xcap`
--

CREATE TABLE IF NOT EXISTS `xcap` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(64) NOT NULL,
  `domain` char(64) NOT NULL,
  `doc` blob NOT NULL,
  `doc_type` int(11) NOT NULL,
  `etag` char(64) NOT NULL,
  `source` int(11) NOT NULL,
  `doc_uri` char(128) NOT NULL,
  `port` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_doc_type_idx` (`username`,`domain`,`doc_type`,`doc_uri`),
  KEY `source_idx` (`source`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Limiti per la tabella `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Limiti per la tabella `user_auth`
--
ALTER TABLE `user_auth`
  ADD CONSTRAINT `user_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Limiti per la tabella `user_key`
--
ALTER TABLE `user_key`
  ADD CONSTRAINT `user_key_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
