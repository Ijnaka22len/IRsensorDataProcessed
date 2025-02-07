import serial
import numpy as np
import matplotlib.pyplot as plt
import serial.tools.list_ports

NUM_PIXELS = 768
ROWS = 24
COLS = 32

def list_ports():
    ports = list(serial.tools.list_ports.comports())
    for i, p in enumerate(ports):
        print(f"{i}: {p.device} - {p.description}")
    return ports

def read_mlx90640_frame(ser):
    frame_data = []  
    while True:
        try:
            line = ser.readline().decode('utf-8').strip()
            if "---" in line:
                if len(frame_data) == NUM_PIXELS:
                    return np.array(frame_data).reshape((ROWS, COLS))  
                else:
                    print(f"Warning: Incomplete frame received ({len(frame_data)} pixels). Resetting...")
                    frame_data = []  
                continue
            
            values = []
            for x in line.split(","):
                try:
                    values.append(float(x))
                except ValueError:
                    pass #print(f"Skipping invalid value: {x}")

            frame_data.extend(values)
            if len(frame_data) > NUM_PIXELS:
                frame_data = frame_data[:NUM_PIXELS]
        except Exception as e:
            print(f"Error reading serial: {e}")
            return None  

def main():
    print("Available Serial Ports:")
    ports = list_ports()
    selected_port = int(input("Select the port index: "))
    baud_rate = int(input("Enter the baud rate: "))
    ser = serial.Serial(ports[selected_port].device, baud_rate, timeout=0.1)
    print(f"Connected to {ser.port} at {baud_rate} baud.")

    plt.ion()
    fig, ax = plt.subplots()
    
    try:
        while True:
            thermal_data = read_mlx90640_frame(ser)
            if thermal_data is not None:
                ax.clear()
                ax.imshow(thermal_data, cmap='inferno', interpolation='nearest')
                plt.draw()
                plt.pause(0.1)
    except KeyboardInterrupt:
        print("\nClosing connection and stopping plot...")
        ser.close()

if __name__ == "__main__":
    main()
