Development image with Felix' collection of dev tools.

Useful for debugging docker networks and pods or simply hacking on some scripts.


# Usage
```
docker run -it --rm -w /mnt -v $PWD:/mnt felix/dev
```


# TODO

## HOME volume
`$HOME` as volume (maybe even mounted?)
```
# steps
dc run --rm dev
echo hi
exit

# expected
dc run --rm dev cat '$HOME/.bash_history'
# should contain "echo hi"
```

## unprivileged
Run unprivileged with username and
[configs](https://github.com/felixhummel/configs)
```
docker run -it --rm -w /mnt -v $PWD:/mnt -u alice felix/dev
# --> $ alice@450f9dafc5e7 /mnt
```

- entrypoint?
- configs should be copied from `/root` or maybe somewhere else,
  because `root` is just a user
- create new or update old?
  - create new user seems cleaner
  - update an existing user could be way faster
  - mix? hardlinks? ...


# Development
```
dc build
dc run --rm dev
```
