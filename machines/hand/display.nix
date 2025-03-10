{ config, pkgs, lib, ... }: {
  home-manager.users."breakds" = {
    home.bds.laptopXsession = true;

    programs.autorandr = {
      enable = true;
      profiles = {
        # The basic profile when only the laptop screen is used.
        "detached" = {
          fingerprint = {
            "eDP-1" = "00ffffffffffff0009e55f0900000000171d0104a51c137803de50a3544c99260f505400000001010101010101010101010101010101115cd01881e02d50302036001dbe1000001aa749d01881e02d50302036001dbe1000001a000000fe00424f452043510a202020202020000000fe004e4531333546424d2d4e34310a00fb";
          };
          config = {
            # Right
            "eDP-1" = {
              enable = true;
              primary = true;
              position = "0x0";
              mode = "2256x1504";
            };
          };
        };
        
        # Home Profile
        #
        # +-----------------------------------++--------------------+
        # |                                   ||                    |
        # |     Dell 34' Monitor (DP-4 HDMI)  ||  Laptop Display    |
        # |     3440 x 1440                   ||  (eDP-1)           |
        # |                                   ||  2556 x 1504       |
        # |                                   ||                    |
        # |                                   ||                    |
        # |                                   ||                    |
        # |                                   ||                    |
        # +-----------------------------------+|                    |
        #                                      +--------------------+
        "home" = {
          fingerprint = {
            "eDP-1" = "00ffffffffffff0009e55f0900000000171d0104a51c137803de50a3544c99260f505400000001010101010101010101010101010101115cd01881e02d50302036001dbe1000001aa749d01881e02d50302036001dbe1000001a000000fe00424f452043510a202020202020000000fe004e4531333546424d2d4e34310a00fb";
            "DP-4" = "00ffffffffffff0010ace0a04c444730291c010380502178ea0950a9554e9c26105054a54b00714f81008180a940d1c0010101010101e77c70a0d0a0295030203a00204f3100001a000000ff00465233504b3841413047444c0a000000fc0044454c4c205533343137570a20000000fd0030551e5920000a20202020202001c4020322f14d9005040302071601141f12135a2309070767030c0020003844830100009d6770a0d0a0225050205a04204f3100001a9f3d70a0d0a0155050208a00204f3100001a584d00b8a1381440942cb500204f3100001e3c41b8a060a029505020ca04204f3100001a565e00a0a0a0295030203500204f3100001a0000001b";
          };
          config = {
            # Right
            "eDP-1" = {
              enable = true;
              primary = true;
              position = "3440x0";
              mode = "2256x1504";
            };
            # Left
            "DP-4" = {
              enable = true;
              position = "0x0";
              mode = "3440x1440";
              dpi = 100;
            };
          };
        };

        "nreal-1" = {
          fingerprint = {
            "eDP-1" = "00ffffffffffff0009e55f0900000000171d0104a51c137803de50a3544c99260f505400000001010101010101010101010101010101115cd01881e02d50302036001dbe1000001aa749d01881e02d50302036001dbe1000001a000000fe00424f452043510a202020202020000000fe004e4531333546424d2d4e34310a00fb";
            "DP-1" = "00ffffffffffff003a4c323100888888081c0103800c07780a0dc9a05747982712484c00000001010101010101010101010101010101983a80507038aa402010950080387400001e983a80507038aa402010950080387400001e000000fd003282143c3c000a202020202020000000fc006e7265616c206169720a202020005e";
          };
          config = {
            # Right
            "eDP-1" = {
              enable = true;
              primary = true;
              position = "1920x0";
              mode = "2256x1504";
            };
            # Left
            "DP-1" = {
              enable = true;
              position = "0x0";
              mode = "1920x1080";
            };
          };
        };

      };
    };
  };
}
