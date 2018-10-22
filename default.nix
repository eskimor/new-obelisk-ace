{ system ? builtins.currentSystem # TODO: Get rid of this system cruft
, iosSdkVersion ? "10.2"
}:
with import ./.obelisk/impl { inherit system iosSdkVersion; };
project ./. ({ pkgs,  ... }: {
  overrides = self: super:
    {
      # reflex-dom-ace = (self.callCabal2nix "reflex-dom-ace" (pkgs.fetchFromGitHub {
      #   owner = "reflex-frp";
      #   repo = "reflex-dom-ace";
      #   rev = "24e1ee4b84f50bd5b6b4401c4bdc28963ce8d80f";
      #   sha256 = "0hdn00cd17a7zp56krqs3y5mpcml75pn8mnmhwyixqgscqd1q9y5";
      # }) {});
      reflex-dom-ace = self.callCabal2nix "reflex-dom-ace" ../../projects/reflex-dom-ace {};
    };

  android.applicationId = "systems.obsidian.obelisk.examples.minimal";
  android.displayName = "Obelisk Minimal Example";
  ios.bundleIdentifier = "systems.obsidian.obelisk.examples.minimal";
  ios.bundleName = "Obelisk Minimal Example";
})
