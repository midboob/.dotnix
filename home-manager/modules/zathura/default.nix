{ lib, ... }: {
	stylix.targets.zathura.enable = true;
	programs.zathura = {
		enable = true;

		options = {
recolor =                 "true";
recolor-keephue =         "false";
recolor-reverse-video =   "false";
completion-bg =           "#561e18";
completion-fg =           "#ffb4aa";
completion-highlight-fg = "#561e18";
completion-highlight-bg = "#ffb4aa";
default-bg =              "rgba(86, 30, 24, 0.9)";
inputbar-bg =             "#561e18";
inputbar-fg =             "#ffb4aa";
notification-bg =         "#561e18";
notification-fg =         "#ffb4aa";
notification-error-bg =   "#690005";
notification-error-fg =   "#ffb4ab";
notification-warning-bg = "#ffdad5";
notification-warning-fg = "#93000a";
statusbar-bg =            "#561e18";
statusbar-fg =            "#ffb4aa";
highlight-color =         "#ffdad5";
highlight-active-color =  "#ffb4aa";
recolor-lightcolor =      rgba(0,0,0,0);
recolor-darkcolor =       "#ffffff";
completion-highlight-fg = "#561e18";
completion-highlight-bg = #ffb4aa"";
selection-clipboard = "clipboard";
incremental-search = = true;;
search-hadjust = true;
adjust-open = width;
font = "FiraCode Nerd Font 11";
guioptions = none;
		};
	};
}
