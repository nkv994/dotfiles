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
  # ^^^ false is  for portability!

  # Adding GRUB additionally for legacy BIOS machines:
  # boot.loader.grub = {
  #     enable = true;
  #     device = "nodev";
  #     efiSupport = true;
  #     useOSProber = false;
  # };

  networking.hostName = "nikhil-nixos"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # services.getty.autologinUser = "nikhil";
  # OR if using COSMIC login manager (cosmic-greeter):
  # services.displayManager.autoLogin = {
  #     enable = true;
  #     user = "nikhil";
  # };

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

  programs.firefox = {
      enable = true;
      preferences = {
          "widget.gtk.libadwaita-colors.enabled" = false;  # To customize Firefox's theme based on desktop environment's appearance
      };
  };


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
    nwg-look
    zip
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
  # hardware.cpu.intel.updateMicrocode = true;
  # hardware.cpu.amd.updateMicrocode = true;
  # ^^^ Already managed by hardware-configuration.nix; commented out to remove any conflicts

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

  # Enable the COSMIC desktop environment
  services.desktopManager.cosmic.enable = true;

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
  # OR
  # Use COSMIC login manager instead
  services.displayManager.cosmic-greeter.enable = false;  # Conflicts with UWSM

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


  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # For downloading proprietory applications like Spotify
  nixpkgs.config.allowUnfree = true;

  # Enable the brightnessctl udev rules
  services.udev.packages = [ pkgs.brightnessctl ];
  # ^^^ The `udev` rules set correct permissions on /sys/class/backlight/* so group `video` members can write to it without `sudo` -- this is required for configuring hypridle flawlessly on Hyprland (see hypr/hypridle.conf).


  ##### MANAGING CPU OPTIMIZATIONS #####

  # Verdor and brand-specific services (only activated when matching hardware is found)
  services.thermald.enable = true;  # Intel-specific thermal daemon -- aggressively manages heat on Intel-based devices
  services.asusd.enable = true;  # ASUS-specific thermal daemon -- manages fan curves/profiles on ASUS devices

  
  # - amd_pstate=passive: Enables efficient thermal scaling on AMD CPUs without crashing Intel.
  # - intel_pstate=disable: Forces Intel CPUs to fallback to traditional ACPI scaling (crucial for Fujitsu).
  boot.kernelParams = [ "amd_pstate=passive" "intel_pstate=disable" ];

  # Load specific kernel modules. We can do so simultaneously as they remain safely dormant if the hardware isn't present.
  boot.kernelModules = [ 
    "thinkpad_acpi"   # Unlocks manual fan controls on Lenovo ThinkPads
    "coretemp"        # Enables CPU temperature sensors for Intel chips
    "k10temp"         # Enables CPU temperature sensors for AMD chips
  ];  

  # CoolerControl manages dynamic fan curves for any desktop or compatible laptop detected
  programs.coolercontrol = {
    enable = true;
    # nvidiaSupport = true; # Automatically enables if an active NVIDIA card is registered
    # ^^^ Deprecated as Nvidia drivers are autoloaded during runtime.
  };

  # COSMIC enables power-profiles-daemon implicitly; disable it in favour of auto-cpufreq
  services.power-profiles-daemon.enable = true;
  # Enable auto-cpufreq for active governor scaling
  services.auto-cpufreq.enable = false;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "never"; # Prevents hot temperature spikes on battery
    };
    charger = {
      governor = "schedutil"; # Balanced power/thermal governor
      turbo = "auto";
    };
  };  
  
  # For better GPU/graphics support
  hardware.graphics = {
      enable = true;
      enable32Bit = true;  # For 32-bit architectures, if needed
      extraPackages = with pkgs; [
        # Intel
        intel-media-driver
        intel-vaapi-driver
        # Mesa (covers most open-source drivers as fallback)
        mesa
        # For NVIDIA/AMD hardware acceleration mapping
        libva-vdpau-driver
        # For translation layers
        libvdpau-va-gl
    ];
  };
  # ^^^ Note: ~~~NVIDIA graphics support is not yet covered in order to maintain platform independence, but it may be added here at a later point of time~~~ Added NVIDIA graphics support at raw/testing stage

  # System76 Power Management and Scheduling 
  hardware.system76.power-daemon.enable = true;  # true is expected to work only on System76 specific hardwares.
  services.system76-scheduler.enable = true;

  # Recommended CPU Governor for general desktop responsiveness and thermal scaling
  # powerManagement.cpuFreqGovernor = "schedutil";   
  # ^^^ auto-cpufreq already overwrites it

  ###### ##### ##### ##### ##### ##### #
}

