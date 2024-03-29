# expbk

[![Build Status](https://travis-ci.org/mirstack/expbk.png?branch=master)](https://travis-ci.org/mirstack/expbk)

**Ansible playbooks executioner.**

This simple project allows to listen for events and execute ansible playbooks whenever
any of them occur.

## Installation

To install `expbk` go to [releases][releases] page and pick latest package. Download
it and unpack with desired prefix:

    $ unzip -d /usr/local expbk-*.zip

[releases]: https://github.com/mirstack/expbk/releases

### Installing from source

To install package from sources you need to have few dependencies installed first. Install
**python 2.6 or higher**, **pip 1.0 or higher** and **bash 4.0 or higher**. Later on you
should have **ansible 1.2 or higher** installed as well via **pip**. When you're ready with
your dependencies run the following:

    $ ./configure --prefix=/usr/local
    $ make install

Run `install-man` instead of `install` if you want to have man pages installed as well.

## Usage

Given an example:

    $ echo sync repo=bacon | expbk ~/playbooks

It will execute `sync.yml` playbook located in `~/playbooks` directory, with
extra variable `repo` set to `bacon`. Under the hood more or less following
command will be executed:

    $ ansible-playbook -s -c local -e "repo=bacon" ~/playbooks/sync.yml

Use `-i` to specify custom inventory file:

    $ expbk -i~/production ~/playbooks

If you want to turn the app into a continuously listening daemon then pipe it
with other long running task, like `tail` for example:

    $ tail -f /tmp/updates | expbk ~/playbooks

## Hacking

If you wanna hack on `expbk` just clone the repo and play with the code.

### Testing

You can run tests with `test` target, no extra stuff is needed:

    $ make test

### Releasing

To build a new release use bundled make target called `pack`:

    $ make pack

It will wrap the binary and other needed files into a zip archive and save
it to `pkg/expbk-x.y.z-{os}-{arch}.zip`.

## Contribute

1. Fork the project.
2. Write awesome code (in a feature branch).
3. Test, test, test...!
4. Commit, push and send Pull Request.
