# viryaos-grub-aarch64

## `Dockerfile.image`

```
$ cd viryaos-grub-aarch64/

$ docker build --force-rm --squash --file Dockerfile.image -t viryaos-grub-aarch64 .
```

## `/vos_run`

Go to the directory containing `ViryaOS` tree.

```
$ docker run --rm -ti -v $(pwd):/home/builder/src \
    viryaos-grub-aarch64 /vos_run
```

## `Dockerfile.package`

```
$ cd viryaos-grub-aarch64

$ docker build --force-rm --squash --file Dockerfile.package -t viryaos-grub-aarch64-package . 
```
