# hydroxide docker

This image is used for `okki.hu` services.

# usage

## fetch the image

```
docker pull garricasaurus/hydroxide-docker
```

## config dir

Create a config dir on the host, we will use this for most of the commands to mount as a volume:

```
mkdir -p $HOME/.config/hydroxide
```

## authenticate

```
docker run -it \
  -v $HOME/.config/hydroxide:/.config/hydroxide \
  hydroxide auth <proton_username>
```

Store the printed bridge password __securely__.

## verify login status

```
docker run -it \
  -v $HOME/.config/hydroxide:/.config/hydroxide \
  hydroxide status
```

## smtp server

The following command starts the smtp server on port 1025 as an always running daemon:

```
docker run -d --name hydroxide \
  --restart unless-stopped \
  -v $HOME/.config/hydroxide:/.config/hydroxide \
  -p 1025:1025 \
  hydroxide smtp
```