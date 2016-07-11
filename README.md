# Test puppet files with docker

This is a simple way to check puppet files. At the moment it supports manifests and yaml files. I use this across a couple of macOS machines running the beta version of Docker (as of 11th July 2016).

Using puppet 3.7.3. Adjust the `Dockerfile` accordingly.

## Build

```
docker build -t puppet_tests -f Dockerfile .
```

## Run

**Check a manifest (`/check`):**

```
docker run -t -i --rm -v $PWD:/code puppet_tests /check manifest.pp
```

**Check a yaml file (`/check`):**

```
docker run -t -i --rm -v $PWD:/code puppet_tests /check hiera.yaml
```

**Check a manifest using the future parser (`/checkf`):**

```
docker run -t -i --rm -v $PWD:/code puppet_tests /checkf manifest.pp
```

`/checkf` will also check `yaml` files.

## TODO

- Check erb files (`erb -T - file.erb`).
- Will this work on Windows using docker toolbox? Using `%CD%` instead of `$PWD`.

