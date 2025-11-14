# LINU LINUX CORE SYSTEM

The core/ directory contains the foundational system configuration and package lists that every LINU Linux build inherits. It defines the common base that all profiles extend.

## system-config/sources.list
Debian apt sources used inside the Cubic chroot. These repositories form the default package sources for all build profiles.

## essential-packages/base.list
The minimal set of packages required to produce a functional Debian-based system. Each build profile layers additional packages and configuration on top of this base.
