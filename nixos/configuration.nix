{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./aesthetics.nix
    ./tooling.nix
    ./packages.nix
  ];

  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
    useOSProber = true;
    splashImage = null;
    backgroundColor = null;
    theme = pkgs.sleek-grub-theme.override {
      withStyle = "dark";
      withBanner = "";
    };
  };

  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "killer";
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;

  powerManagement = {
    enable = true;
    powertop.enable = true;
  };

  time.timeZone = "America/Bogota";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CO.UTF-8";
    LC_IDENTIFICATION = "es_CO.UTF-8";
    LC_MEASUREMENT = "es_CO.UTF-8";
    LC_MONETARY = "es_CO.UTF-8";
    LC_NAME = "es_CO.UTF-8";
    LC_NUMERIC = "es_CO.UTF-8";
    LC_PAPER = "es_CO.UTF-8";
    LC_TELEPHONE = "es_CO.UTF-8";
    LC_TIME = "es_CO.UTF-8";
  };

  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    displayManager.sddm.enable = true;
    displayManager.sddm.theme = "where_is_my_sddm_theme";
    windowManager.i3.enable = true;
    windowManager.i3.package = pkgs.i3-gaps;

    libinput.enable = true;
    synaptics.enable = false;
    libinput.touchpad.naturalScrolling = true;
  };

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  users.users.dagger = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "dagger";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ firefox ];
  };

  environment.systemPackages = with pkgs; [ where-is-my-sddm-theme ];

  programs = {
    nm-applet.enable = true;
    gnupg.agent.enable = true;
    gnupg.agent.enableSSHSupport = true;
    dconf.enable = true;
    zsh.enable = true;
  };

  services = {
    thermald.enable = true;
    blueman.enable = true;
    openssh.enable = true;
    gnome.gnome-keyring.enable = true;
  };

  services.logind = {
    powerKey = "suspend";
    suspendKey = "suspend";
    hibernateKey = "suspend";
    lidSwitch = "suspend";
  };

  services.tlp = {
    enable = true;
    settings = {
      #PCIE_ASPM_ON_AC = "default";
      PCIE_ASPM_ON_BAT = "powersupersave";

      #RUNTIME_PM_ON_AC = "auto";
      RUNTIME_PM_ON_BAT = "auto";

      #PLATFORM_PROFILE_ON_AC = "balanced";
      PLATFORM_PROFILE_ON_BAT = "low-power";

      #CPU_SCALING_GOVERNOR_ON_AC = "powersave";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      #CPU_ENERGY_PERF_POLICY_ON_AC = "power";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";

      #CPU_MAX_PERF_ON_AC = 100;
      CPU_MAX_PERF_ON_BAT = 40;

      START_CHARGE_THRESH_BAT0 = 40;
      STOP_CHARGE_THRESH_BAT0 = 90;
    };
  };

  environment.variables = {
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_ENABLE_HIGHDPI_SCALING = "1";
    QT_SCREEN_SCALE_FACTORS = "1.5";
  };

  system.stateVersion = "23.11";
}
