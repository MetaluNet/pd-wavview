# wavview
A waveform viewer for Pure Data.

![wavview in action](https://github.com/user-attachments/assets/75e465e4-8b58-4dc1-bb2d-f5a8034a4d6d)

`wavview` is built using data structures.

The entire width of the display is split into as many elements as there are pixels. For each element, a vertical segment is drawn, going from the minimum to the maximum among the values of the samples contained into the range defined by the element (1 pixel wide * zoom_factor * table_size / display_width).

E.g: if the display is 400 pixels wide, the table contains 40000 samples, and the zoom is 1 (fullscreen), then the first element will be the segment `(0.0, min), (0.0, max)` where `min` and `max` are the minimum and maximum values among the 100 first samples.

This allows to see the peak values, whatever the zoom factor.

## Comparisons with legacy Pd table display:

Modulated frequency sweep:

![Frequency sweep](https://github.com/user-attachments/assets/bda8d0ed-f36c-48be-bb82-3c311ba6ea57)

Modulated noise:

![Modulated noise](https://github.com/user-attachments/assets/b14f6263-1bd9-488f-9ff3-e484d4d6bdab)
