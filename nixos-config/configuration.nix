# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;
  # ^^^ false is important for portability!

  networking.hostName = "nikhil-nixos"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  services.getty.autologinUser = "nikhil";



  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
  services.libinput.touchpad.naturalScrolling = true;  # Gets overwritten by Hyprland config.

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nikhil = {
    isNormalUser = true;
    extraGroups = [ 
        "wheel"  # Enable ‘sudo’ for the user
        "video"  # Grant user access to backlight control
    ];
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    waybar          # Status bar
    wofi            # App launcher (or rofi-wayland)
    dunst           # Notifications
    hyprpaper       # Wallpaper
    hyprlock        # Screen locker
    hypridle        # Idle daemon
    grim            # Screenshots
    slurp           # Region selection for screenshots
    wl-clipboard    # Clipboard
    xdg-utils       # xdg-open, etc.
    kitty           # Default terminal in Hyprland config
    polkit_gnome    # Authentication agent for Hyprland
    thunar          # File manager
    xdg-desktop-portal-gtk
    brightnessctl
    openfortivpn
    spotify
    hyprlauncher    # Menu app for Hyprland
    libnotify
  ];

  # Setting up freqently usable Nerd fonts
  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
    nerd-fonts.iosevka-term-slab
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    nerd-fonts.hack
  ];
  
  environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";             # Electron apps use Wayland 
      WLR_NO_HARDWARE_CURSORS = "1";    # Fix cursor on some GPUs
      XDG_SESSION_TYPE = "wayland";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 57621 ];  # To sync local tracks from filesystem with mobile devices in the same network
  networking.firewall.allowedUDPPorts = [ 5353 ];  # To enable discovery of Google Cast devices (and possibly other Spotify Connect devices) in the same network by the Spotify app
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;
  # ^^^ system.copySystemConfiguration is not supported with flakes.

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment? (Yes.)

  # Hardware-agnostic specifications

  # Don't pin the specific CPU microcode
  # Remove or comment out:
  hardware.cpu.intel.updateMicrocode = true;
  hardware.cpu.amd.updateMicrocode = true;

  # Support both instead:
  hardware.enableRedistributableFirmware = true;

  # Managing the swap partition

  # Enable Hyprland at the system level
  programs.hyprland = {
      enable = true;
      xwayland.enable = true;  # For X11 app compatibility
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
      withUWSM = true;
  };

  # Reqired: a display manager to launch Hyprland
  # Configuring simple desktop display manager
  services.displayManager.sddm = {  
      enable = true;
      wayland.enable = true;
      settings = {
          General.InputMethod = "";
          X11.KeyboardLayout = "us";
      };
  };

  # Required for screen-sharing/portals
  xdg.portal = {
      enable = true;
      # extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];  # xdg-desktop-portal-hyprland is already added in hyprland.nixosModules.default
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Polkit for privilege escalation (needed by many GUI apps)
  security.polkit.enable = true;
  # Also needed for Hyprland privilege escalation
  security.rtkit.enable = true;

  # For better GPU/graphics support
  hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        # Intel
        intel-media-driver
        intel-vaapi-driver
        # Mesa (covers most open-source drivers as fallback)
        mesa
    ];
  };
  # ^^^ Note: NVIDIA graphics support is not yet covered in order to maintain platform independence, but it may be added here at a later point of time.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # For downloading proprietory applications like Spotify
  nixpkgs.config.allowUnfree = true;

  # Enable the brightnessctl udev rules
  services.udev.packages = [ pkgs.brightnessctl ];
  # ^^^ The `udev` rules set correct permissions on /sys/class/backlight/* so group `video` members can write to it without `sudo` -- this is required for configuring hypridle flawlessly on Hyprland (see hypr/hypridle.conf).
}

