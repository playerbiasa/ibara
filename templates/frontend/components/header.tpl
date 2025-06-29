{**
 * lib/pkp/templates/frontend/components/header.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Common frontend site header.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}
{strip}
	{* Determine whether a logo or title string is being displayed *}
	{assign var="showingLogo" value=true}
	{if !$displayPageHeaderLogo}
		{assign var="showingLogo" value=false}
	{/if}
{/strip}
<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}{capture assign="pageTitleTranslated"}{translate key=$pageTitle}{/capture}{/if}
{include file="frontend/components/headerHead.tpl"}
<body class="pkp_page_{$requestedPage|escape} pkp_op_{$requestedOp|escape}">

	<header id="header" class="header" role="banner">
	<div class="topbar d-flex align-items-center">
      <div class="container d-flex justify-content-center">
        {if !$requestedPage || $requestedPage === 'index'}
						<h1 class="pkp_screen_reader">
							{if $currentContext}
								{$displayPageHeaderTitle|escape}
							{else}
								{$siteTitle|escape}
							{/if}
						</h1>
					{/if}
					<div>
					{capture assign="homeUrl"}
						{url page="index" router=\PKP\core\PKPApplication::ROUTE_PAGE}
					{/capture}
					{if $displayPageHeaderLogo}
						<a href="{$homeUrl}" class="is_img">
							<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" width="{$displayPageHeaderLogo.width|escape}" height="{$displayPageHeaderLogo.height|escape}" {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{/if} />
						</a>
					{elseif $displayPageHeaderTitle}
						<a href="{$homeUrl}" class="is_text">{$displayPageHeaderTitle|escape}</a>
					{else}
						<a href="{$homeUrl}" class="is_img">
							<img src="{$baseUrl}/templates/images/structure/logo.png" alt="{$applicationName|escape}" title="{$applicationName|escape}" width="180" height="90" />
						</a>
					{/if}
					</div>
      </div>
    </div>

	{capture assign="primaryMenu"}
		{load_menu name="primary" id="navigationPrimary" ulClass="pkp_navigation_primary"}
	{/capture}

	<div class="branding d-flex align-items-center">
	<div class="container d-flex align-items-center" style="gap: 40px;">
	<nav id="navmenu" class="navmenu" aria-label="{translate|escape key="common.navigation.site"}">
	{$primaryMenu}
	<i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
	</nav>
	</div>
	</div>
	</header>
	<main class="main">

    <!-- Main -->
     <div class="container mb-5 mt-3">
		
