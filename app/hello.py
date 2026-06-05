import time


def main() -> None:
    print("Starting hello-devops service...")

    try:
        while True:
            print("Hello, DevOps!")
            time.sleep(30)
    except KeyboardInterrupt:
        print("Stopping hello-devops service...")


if __name__ == "__main__":
    main()