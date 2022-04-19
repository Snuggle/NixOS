# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
	imports =
	[ 
		(modulesPath + "/installer/scan/not-detected.nix")
	];

	boot.kernelPackages = pkgs.linuxPackages_zen;
	boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "sd_mod" ];
	boot.initrd.kernelModules = [ ];
	boot.kernelParams = [ "nvidia-drm.modeset=1" ];
	boot.kernelModules = [ "kvm-amd" ];
	boot.extraModulePackages = [ ];

	boot.loader.grub.useOSProber = true;
	
	boot.plymouth.enable = false;

	hardware.nvidia.powerManagement.enable = true; # https://nixos.wiki/wiki/Nvidia#Fix_graphical_corruption_on_suspend.2Fresume

	services.xserver = {
		videoDrivers = [ "nvidia" ];
	};

	hardware.enableAllFirmware = true;

	fileSystems."/" = { 
		device = "/dev/disk/by-uuid/5c3bbd25-bf47-4fc2-9059-631bdba52f1d";
		fsType = "btrfs";
	};

	fileSystems."/boot" = { 
		device = "/dev/disk/by-uuid/E266-52DA";
		fsType = "vfat";
	};

	fileSystems."/mnt/Games" = { 
		device = "/dev/disk/by-uuid/917d6f24-1f40-4019-9efa-c9cd6be4c5f6";
		fsType = "btrfs";
		options = [ "nofail" "x-systemd.device-timeout=10s" "defaults" ];
	};

	swapDevices = [
		{ device = "/dev/disk/by-uuid/488c55c6-d271-4bc4-89b4-63690ee49c24"; }
	];

	hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
