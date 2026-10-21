---------------- MONITORS ----------------
hl.monitor({
    output   = "desc:Dell Inc. AW3225QF FGB8YZ3",
    mode     = "3840x2160@240.00",
    position = "0x0",
    scale    = "1",
})
hl.monitor({
    output    = "desc:AOC Q2790 GQMJ7HA001233",
    mode      = "2560x1440@59.95",
    position  = "3840x-200",
    scale     = "1",
    transform = 1,
})

---------------- ENVIRONMENT ----------------
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("WLR_DRM_DEVICES", "/dev/dri/card1")
