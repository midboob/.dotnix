{ pkg, lib, config, ...}: {

	programs.chromium = {
		enable = true;
		extensions = {};
	};
}
