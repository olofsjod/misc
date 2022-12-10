# Hugo-docker

## Build 
If needed, modify `run.sh`. Then run `make` to build and install the docker
image.

## Usage
Paste this following command and let `$DIR` be the path where your hugo
directory is living.

```
docker run \        
    --detach \ 
    --publish 80:1313 \
    --volume $DIR:/hugo \
    --name "hugo" \
    hugo \
    mydomain.com
```

## Uninstall

To uninstall, run `make clean`.

## License and Contribution 
This project is licensed with GPL v3. If you want to contribute, make a pull
request with your contribution. All contributions are welcome.
