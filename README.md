# dsBash
Your smart organized Linux &amp; MacOSX bash configurations


### Author
 Author: Mubarak Alrashidi (DeadSouL)
Package: dsBash


### Installation
Once you cloned the repo, do the following

1. Modify `PATH/TO/dsBash/bashrc`:

    and set your terminal's background whether it's `light` or `dark`


2. Install `dsBash`:

    $ PATH/TO/dsBash/./install.sh


That's it :)


### The idea of dsBash
To have an easy way to setup your bash environment cross your `Linux` distros and `MacOSX` to act the way you used to, and have your custom aliases


### dsBash files:
    Has two main types:
        1. `alias`: which will contain your aliases, categorized in 3 sections
            A. Aliases that would work on `Linux`, should be in `alias.linux`
            B. Aliases that would work on `MacOSX`, should be in `alias.mac`
            C. Aliases that would work on both `Linux` and `MacOSX`, should be in `alias.maclin`
        2. `bashrc` which will contain your bashrc
            The same concept of `aliases` applies to `bashrc.linux`, `bashrc.mac` and `bashrc.maclin`

    After installation, it will automatically detect your operating system and loads the right `aliases` and `bashrcs` 
    So that it can work fine on both `Linux` and `MacOSX`.


### Finally,...
Enjoy :)
