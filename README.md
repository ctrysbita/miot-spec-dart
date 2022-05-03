# MIoT Spec

<a href="https://pub.dev/packages/miot_spec">
    <img src="https://img.shields.io/pub/v/miot_spec.svg"
    alt="Pub Package" />
</a>

Dart implementation of MIoT specification.

## CLI

The package contains a simple CLI program that built on top of miot_spec.

### Installation

- Activate from Pub:

    ```sh
    pub global activate miot_spec
    ```

- Download pre-built binary from [Github Action](https://github.com/ctrysbita/miot_spec.dart/actions)

### Example

```sh
# Download all instances.
miot_spec instances

# Get spec for instance.
miot_spec instance -t urn:miot-spec-v2:device:light:0000A001:yeelink-lamp22:1 # by type
miot_spec instance -m yeelink.light.lamp22 # by model
```