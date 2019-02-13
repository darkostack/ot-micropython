import ot

thread = ot.Instance(1)

def main():
    if thread.is_initialized():
        thread.ncp_init();
        while True:
            thread.process()

if __name__ == "__main__":
    main()
