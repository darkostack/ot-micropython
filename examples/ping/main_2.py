import ot

thread = ot.Instance(2)

thread.set_panid(0x1234)
thread.set_channel(11)

def main():
    if thread.is_initialized():
        thread.cli_uart_init()
        thread.autostart()
        while True:
            thread.tasklet_run()
            thread.process_drivers()

if __name__ == "__main__":
    main()
