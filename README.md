# s6-sudod scripts

A set of scripts for a basic s6-sudo based suidless sudo setup

[s6-sudod.xl](s6-sudod.xl) is heavily based on Laurent Bercot's example s6-sudod service file [http://www.skarnet.org/software/s6/s6-sudod.html](http://www.skarnet.org/software/s6/s6-sudod.html)

Example s6-sudo usage:
```sh
ssudo() {
    s6-sudo /tmp/s6-sudo-socket "$(pwd)" env PATH="${PATH}" "$@"
}
```
