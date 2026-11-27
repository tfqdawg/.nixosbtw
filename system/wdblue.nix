{ ... }:

{
	fileSystems."/mnt/wdblue" = {
		device = "/dev/disk/by-uuid/e4f8d264-2918-4d1d-8075-349d475d5939";
		fsType = "ext4";
		options = [ "defaults" "nofail" ];
	};
}
