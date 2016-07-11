# Test puppet files with docker

This is a simple way to check puppet files. At the moment it supports manifests and yaml files. **TODO:** erb files.

Currently using puppet 3.7.3, since that's what I'm currently using. Adjust the `Dockerfile` accordingly.

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

**Check a manifest (using future parser, `/checkf`):**

```
docker run -t -i --rm -v $PWD:/code puppet_tests /checkf manifest.pp
```

`/checkf` will also check `yaml` files.
