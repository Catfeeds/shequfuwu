--
-- 表的结构 `waimai_addon_apply_config`
--

CREATE TABLE IF NOT EXISTS `waimai_addon_apply_config` (
`id` int(10) unsigned NOT NULL,
  `name` text NOT NULL,
  `event` text NOT NULL,
  `time_range` text NOT NULL,
  `introduce` text NOT NULL,
  `visiter` int(11) NOT NULL,
  `apply` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `waimai_addon_apply_config`
--

INSERT INTO `waimai_addon_apply_config` (`id`, `name`, `event`, `time_range`, `introduce`, `visiter`, `apply`, `status`, `time`) VALUES
(1, '1', '1,5,3', '2', '<font color="#000000" style="font-size: 18px; background-color: yellow;">2</font>', 85, 6, 1, '2015-07-07 02:49:53');

-- --------------------------------------------------------

--
-- 表的结构 `waimai_addon_apply_record`
--

CREATE TABLE IF NOT EXISTS `waimai_addon_apply_record` (
`id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `phone` text NOT NULL,
  `event` text NOT NULL,
  `note` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `waimai_apply_config`
--
ALTER TABLE `waimai_addon_apply_config`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `waimai_apply_record`
--
ALTER TABLE `waimai_addon_apply_record`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `waimai_apply_config`
--
ALTER TABLE `waimai_addon_apply_config`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `waimai_apply_record`
--
ALTER TABLE `waimai_addon_apply_record`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;


CREATE TABLE IF NOT EXISTS `waimai_addon_apply_contact` (
`id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
--
-- Indexes for table `waimai_addon_apply_contact`
--
ALTER TABLE `waimai_addon_apply_contact`
 ADD PRIMARY KEY (`id`);
--
-- AUTO_INCREMENT for table `waimai_apply_contact`
--
ALTER TABLE `waimai_addon_apply_contact`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;