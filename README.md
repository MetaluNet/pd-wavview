# wavview
A waveform viewer for Pure Data.

`wavview` is used to display tables containing audio data. It allows you to explore the data by zooming and scrolling, select an interval, or set an index at a given position.

It is effective for viewing long tables, see here with a 45mn long file:

![wavview in action](https://github.com/user-attachments/assets/df0e4516-eda7-44d2-810d-a103ffcf404f)

# Installation

`wavview` is fully "vanilla" and doesn't depend on any external library.

Pd >= 0.56 is required though, because `wavview` uses the new `[goprect(` message when setting its size.

## Internal functioning

`wavview` is built using data structures. The entire width of the display is split into as many elements as there are pixels. For each element, a vertical segment is drawn, going from the minimum to the maximum among the values of the samples contained into the range defined by the element (1 pixel wide * zoom_factor * table_size / display_width).

E.g: if the display is 400 pixels wide, the table contains 40000 samples, and the zoom is 1 (fullscreen), then the first element will be the segment `(0.0, min), (0.0, max)` where `min` and `max` are the minimum and maximum values among the 100 first samples.

This allows to see the peak values, whatever the zoom factor.

### downsampling

Internally, an important optimization is done: when updating to a new table, `wavview` computes 32-times-successively-downsampled min/max tables, to greatly decrease the CPU load in most drawing cases, at a RAM cost of approximately 1/16 of the initial table size.

For example, if the table is 60'000'000 samples long (~18mn at 48kHz) and the display is 400px wide, at fullscreen zoom each pixel has to take into account less than 5 values (60000000 / 400 / 32 / 32 / 32 = 4.5), instead of 150000 (= 60000000 / 400).

## Linked table

A `wavview` can be permanently associated to a given table. This way, it retains the calculated peak buffers, that can be reused by another `wavview` if it needs to display this table.

## Timeline

A timeline is available as a separate `wavview_timeline` object, so that you can add it only if you need.
It displays evenly spaced time markers, in addition to the time at left and right ends of the visible range.

## Credits

`wavview` is written by Antoine Rousseau and licensed as BSD-2.

**metalu.net** 2025
