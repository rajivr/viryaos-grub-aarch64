# viryaos-grub for v3.7

This directory has two docker files which is used to build and create an image
of `viryaos-grub`.

To get started first build abuild-builder-cross-aarch64 docker image.

See
[here](https://gitlab.com/ViryaOS/abuild-builder-cross-aarch64/blob/3.7-stable/README.md)
for details on how to build abuild-builder-cross-aarch64 docker image.

Then,

```
$ cd viyaos-grub

$ docker build --network=host -t viryaos-grub-builder .
```

Once the image is built, running the image with `run` script, would generate
`viryaos-grub.tar.gz` in `/tmp` directory.

```
$ cd viyaos-grub

$ docker run --network=host --rm -ti -v /tmp:/tmp -v $(pwd):/root/src \
    viryaos-grub-builder /root/src/run
```

`viryaos-grub.tar.gz` contains the grub build for `x86_64` and cross built grub
for `aarch64`.

Once `viryaos-grub.tar.gz` is built, it can be packaged as a docker image for
downstream use. This can be done using `Dockerfile.image`.

```
(inside viryaos-grub directory)

$ git rev-parse --short HEAD
```

To build the docker image

```
$ cd viryaos-grub

$ cp /tmp/viryaos-grub.tar.gz .

$ docker build -f Dockerfile.image --squash \
    -t viryaos/viryaos-grub:<VERSION>-<SHORT_SHA>-<ARCH1>.<ARCH2> .

(For example)

$ docker build -f Dockerfile.image --squash \
    -t viryaos/viryaos-grub:v3.7-abcdef1-aarch64.x86_64 .
```
