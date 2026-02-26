{ lib, ... }:
{
  home.file =
      let
        mapfunc = dest-path: file-names: lib.listToAttrs ( lib.map 
                                            (
                                              name: 
                                              let
                                                full-dest-path = "${dest-path}/${name}";
                                              in 
                                              {
                                                name = full-dest-path;
                                                value.source = ../home/${full-dest-path};
                                              }
                                            ) file-names
                                        );
      in 
      # kde application launcher entries
      mapfunc ".local/share/applications" [
          "civil_service_job_portal.desktop"
          "hcc_job_portal.desktop"
          "job-portal.desktop"
          "linkedin.desktop"
          "outlook.desktop"
          "universal-credit-portal.desktop"
          "youtube_likes.desktop"
          "youtube_watch_later.desktop"
          "aliexpress_nsfw.desktop"
          "plex.desktop"
          "github.desktop"
          "home_manager_kitty.desktop"
          "applications_kitty.desktop"
          "job_portal_kitty.desktop"
          "system_icons_kitty.desktop"
          "lab_kitty.desktop"
      ]
      //
      # system icons
      mapfunc "system/icons" [
        "DWP.png"
        "github.png"
        "gov.png"
        "hampshire-county-council.png"
        "linkedin.png"
        "outlook.png"
        "youtube.png"
        "aliexpress.png"
        "plex.png"
      ];

}
