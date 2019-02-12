import ot

instance = ot.Instance(2)
platform = ot.Platform(instance)

def main():
    if instance.is_initialized():
        platform.cli_uart_init()
        while True:
            platform.tasklet_run()
            platform.process_drivers()

if __name__ == "__main__":
    main()
