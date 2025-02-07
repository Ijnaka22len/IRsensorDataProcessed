import serial
import serial.tools.list_ports
import argparse

def list_ports():
    """List available serial ports."""
    # python serialPlotData.py --baudrate 115200
    ports = list(serial.tools.list_ports.comports())
    for i, p in enumerate(ports):
        print(f"{i}: {p.device} - {p.description}")
    return ports

def main():
    parser = argparse.ArgumentParser(description="Serial Port Data Viewer")
    parser.add_argument("--baudrate", type=int, default=115200, help="Baud rate (default: 115200)")
    args = parser.parse_args()

    # List and select a serial port
    ports = list_ports()
    port_id = int(input("Select port to connect to: "))
    
    # Open selected serial port
    ser = serial.Serial(port=ports[port_id].device, baudrate=args.baudrate, timeout=0.1)
    
    print(f"Connected to {ser.port} at {args.baudrate} baud.\nPress Ctrl+C to exit.")

    try:
        while True:
            line = ser.readline().decode('utf-8').strip()
            if line:
                print(line)  # Display serial data
    except KeyboardInterrupt:
        print("\nClosing serial connection.")
        ser.close()

if __name__ == "__main__":
    main()
