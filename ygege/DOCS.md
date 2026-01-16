# Home Assistant Add-on: Ygégé

High-performance indexer for YGG Torrent written in Rust.

## Installation

1. Add this repository to your Home Assistant Add-on Store.
2. Install the **Ygégé** add-on.
3. Start the add-on.
4. Watch the logs to ensure it starts successfully.

## Configuration

### Option: `log_level`

Controls the verbosity of the logs.
- **trace**: Very detailed logs.
- **debug**: Debugging information.
- **info**: Standard informational messages (Default).
- **warn**: Warnings only.
- **error**: Errors only.

## Integration

### Prowlarr
To use Ygégé with Prowlarr:
1. Ensure the add-on is running.
2. The URL for Ygégé within the Home Assistant network is usually `http://<IP_ADDRESS>:8715`.
3. If Prowlarr is also running as an add-on, you may need to use the internal Docker hostname or the HA local IP.

For more details, see the [official Ygégé repository](https://github.com/UwUDev/ygege).