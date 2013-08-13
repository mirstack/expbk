# ansup

[![Build Status](https://travis-ci.org/mirstack/ansup.png?branch=master)](https://travis-ci.org/mirstack/ansup)

**Ansible powered updater.**

This simple project allows to listen for events in the system and trigger ansible 
playbooks whenever such event occurs.

## Installation

To install `ansup` go to [releases][releases] page and pick latest package. Download
it and unpack with desired prefix:

    $ unzip -d /usr/local ansup-*.zip

[releases]: https://github.com/mirstack/ansup/releases

### Installing from source

To install package from sources you need to have few dependencies installed first. Install
**python 2.6 or higher**, **pip 1.0 or higher** and **bash 4.0 or higher**. Later on you
should have **ansible 1.2 or higher** installed as well via **pip**. When you're ready with
your dependencies run the following:

    $ ./configure --prefix=/usr/local
    $ make install
    
Run `install-man` instead of `install` if you want to have man pages installed as well.

## Usage

...

## Hacking

If you wanna hack on `ansup` just clone the repo and play with the code. 

### Testing

You can run tests with `test` target, no extra stuff is needed:

    $ make test

### Releasing

To build a new release use bundled make target called `pack`:

    $ make pack

It will wrap the binary and other needed files into a zip archive and save
it to `pkg/ansup-x.y.z-{os}-{arch}.zip`.

## Contribute

1. Fork the project.
2. Write awesome code (in a feature branch).
3. Test, test, test...!
4. Commit, push and send Pull Request.
