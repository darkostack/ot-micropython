import ot

thread = ot.Instance(1)

def main():
    if thread.is_initialized():
        thread.cli_uart_init()
        thread.autocommission(0x1234, 11) #panid: 0x1234, channel: 11
        thread.autostart()
        while True:
            thread.tasklet_run()
            thread.process_drivers()

if __name__ == "__main__":
    main()
