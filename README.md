JuceDevMachine:

A basic docker file for the envrionment needed to build JUCE in containers

To use in your own docker file, you can just use:
```dockerfile
FROM docker.io/eyalamirmusic/juce_dev_machine:latest AS base
```

A built version for both Linux/x64 and Linux/ARM exists here:
https://hub.docker.com/repository/docker/eyalamirmusic/juce_dev_machine

**How to build:**
You can of course just copy/paste the contents of this dockerfile into yours, nothing out of the ordinary here.

For my use cases, I wanted a multi platform build so it could be consumed by x64 and ARM machines.
So, I've used the instructions here:
https://medium.com/nttlabs/buildx-multiarch-2c6c2df00ca2

```
docker buildx create --use --name=qemu
docker buildx inspect --bootstrap
docker buildx build \
  --push -t eyalamirmusic/juce_dev_machine:latest \
  --platform=linux/amd64,linux/arm64 .
```