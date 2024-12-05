<div align="center">
  <h1>Apollo</h1>
</div>

## Services
### Home Assistant
Home Assistant is an open-source home software that supports a variety of IoT platforms like LG ThinQ, Tuya, and others to be managed and controlled in the service. Paired devices can also be exposed to Apple HomeKit through a bridge.

More complex automations can also be configured through Home Assistant as opposed to Apple Home. 

### Homebridge
Homebridge is an open-source software that acts as a bridge between Apple HomeKit and smart home devices that are not natively supported. This is a secondary service that will be used for its plugins.

### Scrypted
Scrypted is an open-source video integration platform that allows exposing of unsupported cameras to Apple HomeKit with support for HomeKit Secure Video (HKSV).


## Mounting service directories
The volumes set in the compose file are intended to be remote directories from an SMB share. This prevents accidental data loss due to instance changes or maintenance. 

The remote folders expected to be mounted in `/mnt` which can be declared in `/etc/fstab`.

```
//192.168.1.2/home-assistant /mnt/home-assistant cifs user=user,password=password,mfsymlinks 0 0
``` 

## Deploying the services

Run the command below to deploy Home Assistant, Homebridge, and Scrypted.

```console
root@homelab:~/apollo$ cp .env.example .env && docker compose up -d
```
