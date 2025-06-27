<?php

/**
 * @file plugins/themes/ibara/IbaraThemePlugin.php
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @class ibaraThreeThemePlugin
 * @brief Default theme
 */

namespace APP\plugins\themes\ibara;

use PKP\plugins\ThemePlugin;
use APP\core\Application;
use PKP\config\Config;

class IbaraThemePlugin extends ThemePlugin
{
	/**
	 * Initialize the theme
	 *
	 * @return null
	 */
	public function init()
	{

		// Add Style Bootstrap
		$this->addStyle('bootstrap', 'styles/bootstrap/css/bootstrap.min.css');
		$this->addStyle('icons', 'styles/bootstrap-icons/bootstrap-icons.css');
		$this->addStyle('aos', 'styles/aos/aos.css');
		$this->addStyle('fontawesome', 'styles/fontawesome/css/all.min.css');
		$this->addStyle('custom', 'styles/custom.css');
		$this->addStyle('main', 'styles/css/main.css');
		

		// Add Script
		$this->addScript('bootstrap', 'styles/bootstrap/js/bootstrap.bundle.min.js');
		$this->addScript('main', 'styles/js/main.js');
		$this->addScript('aos', 'styles/aos/aos.js');


		// Add navigation menu areas for this theme
        $this->addMenuArea(['primary', 'user']);
	}

	/**
	 * Get the display name of this plugin
	 * @return string
	 */
	function getDisplayName()
	{
		return __('plugins.themes.ibara.name');
	}

	/**
	 * Get the description of this plugin
	 * @return string
	 */
	function getDescription()
	{
		return __('plugins.themes.ibara.description');
	}
}

if (!PKP_STRICT_MODE) {
	class_alias('\APP\plugins\themes\ibara\IbaraThemePlugin', '\IbaraThemePlugin');
}
