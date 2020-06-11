# dsBash
Your smart organized Linux &amp; MacOSX bash configurations


### Author
 Author: Mubarak Alrashidi (DeadSouL)
Package: dsBash


### Source note:
I'm using the Vim's `marker` method to fold/unfold sections in the source code. To enable it, edit any file with Vim, then type:
```
:set foldmethod=marker
```
To toggle folding use `za`.


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


### Installation
Once you cloned the repo, do the following

1. Modify `PATH/TO/dsBash/bashrc`:

    and set your terminal's background whether it's `light` or `dark`


2. Install `dsBash`:

    $ PATH/TO/dsBash/./install.sh


That's it :)


### How to use it?

To list all available aliases:
```
$ ds.alias_all
```

To list which OS aliases are being loaded:
```
$ ds.alias_loaded
```

To list the loaded Linux aliases:
```
$ ds.alias_linux
```

To list the loaded MacOSX aliases:
```
$ ds.alias_mac
```

To list the loaded MacLin aliases:
```
$ ds.alias_maclin
```

To search through loaded aliases:
```
$ ds.alias_search [KEYWORD]
```

E.g: Searching for keyword 'kill':
```
$ ds.alias_search kill
           ds.k9 :    Kill 9 process by process-id.
          ds.k9n :    Kill 9 process by process-name.
       ds.k9user :    Kill 9 user by user-name.
```


### Finally,...
Enjoy :)
