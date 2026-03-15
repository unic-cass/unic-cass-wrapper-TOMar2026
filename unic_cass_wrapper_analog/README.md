# UNIC-CASS-WRAPPER Analog


This repository has the files to generate the ananalog padring for UNICASS.

It has essentially VDD, VSS and analog IOs, that we can find in two versions
2mx2m and 3mx3m.

To generate the padring we might need first to make sure we have librelane and
PDK repo updated in repository root by:

```
git submodule update --init --recursive
```

Then we can enter to each specific folder for the corresponding size and run:

```
make librelane
make make_analog_padring
```

It should generate the corresponding padring using the configuration in
`config.json` file which indicates the position of each IO cell and
`src/user_project_wrapper.sv` which defines the connectivity.

After the padring is generated, the result is copied to `final` folder, from
where can use the `gds/user_project_wrapper.gds` as the gds that contains the
padring.

