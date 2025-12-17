{
  pkgs,
  lib,
  config,
  ...
}: {
  stylix.targets.zen-browser.profileNames = ["edward"];

  programs.zen-browser = {
    enable = true;

    profiles = {
      edward = {
        containersForce = true;
        containers = {
          Personal = {
            color = "purple";
            icon = "fingerprint";
            id = 1;
          };
        };
      };
    };

    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };
  };
}
