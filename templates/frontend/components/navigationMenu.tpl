{**
 * templates/frontend/components/navigationMenu.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Primary navigation menu list for the application
 *
 * @uses navigationMenu array Hierarchical array of navigation menu item assignments
 * @uses id string Element ID to assign the outer <ul>
 * @uses ulClass string Class name(s) to assign the outer <ul>
 * @uses liClass string Class name(s) to assign all <li> elements
 *}

{if $navigationMenu}
	<ul id="{$id|escape}" class="{$ulClass|escape}">
		{foreach key=field item=navigationMenuItemAssignment from=$navigationMenu->menuTree}
			{if $navigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
				<li class="{if $navigationMenuItemAssignment->children}dropdown{else}navItem{/if}">
					<a href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}">
						{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
						{if $navigationMenuItemAssignment->children}
							<i class="bi bi-chevron-down toggle-dropdown"></i>
						{/if}
					</a>
					{if $navigationMenuItemAssignment->navigationMenuItem->getIsChildVisible() && $navigationMenuItemAssignment->children}
						<ul>
							{foreach key=childField item=childNavigationMenuItemAssignment from=$navigationMenuItemAssignment->children}
								{if $childNavigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
									<li class="{$liClass|escape}">
										<a href="{$childNavigationMenuItemAssignment->navigationMenuItem->getUrl()}">
											{$childNavigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
										</a>
									</li>
								{/if}
							{/foreach}	
						</ul>
					{/if}
				</li>
			{/if}
		{/foreach}
  </ul>
{/if}