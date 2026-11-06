{ ... }:

{
  fileSystems."/mnt/data" = {
    device = "/dev/disk/by-uuid/8590533f-09b8-4ea6-b674-af05da18362a";
    fsType = "ext4";
    options = [ "defaults" "noatime" ];
  };
}
