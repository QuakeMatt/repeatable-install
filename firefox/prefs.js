// Native notifications
user_pref("alerts.useSystemBackend", true);

// Disable screenshot extension
user_pref("extensions.screenshots.disabled", true);

// Always show the download button
user_pref("browser.download.autohideButton", false);

// Disable all homepage widgets
user_pref("browser.newtabpage.activity-stream.feeds.snippets", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.highlights", false);
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
user_pref("browser.newtabpage.activity-stream.migrationExpired", true);
user_pref("browser.newtabpage.activity-stream.prerender", false);

// Switch to the dark theme
user_pref("lightweightThemes.persisted.headerURL", false);
user_pref("lightweightThemes.selectedThemeID", "firefox-compact-dark@mozilla.org");

// Better default fonts
user_pref("font.name.monospace.x-western", "Consolas");
user_pref("font.name.sans-serif.x-western", "Segoe UI");
user_pref("font.name.serif.x-western", "Cambria");

// Usability tweaks
user_pref("layout.spellcheckDefault", 0);
user_pref("layout.word_select.eat_space_to_next_word", false);

// Faster full-screen transition
user_pref("full-screen-api.transition-duration.enter", "120 120");
user_pref("full-screen-api.transition-duration.leave", "120 120");
user_pref("full-screen-api.warning.timeout", 0);

// Edge-style scrolling
user_pref("apz.overscroll.enabled", true);
user_pref("general.smoothScroll.currentVelocityWeighting", "0.15");
user_pref("general.smoothScroll.lines.durationMaxMS", 300);
user_pref("general.smoothScroll.mouseWheel.durationMaxMS", 300);
user_pref("general.smoothScroll.msdPhysics.enabled", true);
user_pref("general.smoothScroll.msdPhysics.motionBeginSpringConstant", 800);
user_pref("general.smoothScroll.msdPhysics.regularSpringConstant", 600);
user_pref("general.smoothScroll.msdPhysics.slowdownSpringConstant", 1000);
user_pref("general.smoothScroll.stopDecelerationWeighting", "0.9");
user_pref("general.warnOnAboutConfig", false);
user_pref("mousewheel.min_line_scroll_amount", 34);

// Edge-style font rendering
user_pref("gfx.font_rendering.cleartype_params.force_gdi_classic_for_families", "");
user_pref("gfx.font_rendering.cleartype_params.force_gdi_classic_max_size", 1);
user_pref("gfx.font_rendering.cleartype_params.rendering_mode", 0);
