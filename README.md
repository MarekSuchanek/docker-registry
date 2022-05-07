# Registry with Garbage Collection

*Docker Registry with CRON that runs garbage collection periodically*

## Usage

Simply use the `GC_CRON` environment variable to set when the garbage collection should be triggered. You can use this for your `docker-compose.yml`:

```yaml
version: '3'

services:
  registry:
    image: mareksuchanek/docker-registry
    restart: always
    environment:
      GC_CRON: "*/5 * * * *"
```

Visit [`example/`](example) for more details.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for more details.
