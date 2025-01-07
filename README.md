**`!`**
> run `firefox-custom.sh` after the first launch of regular Firefox
>
> `ly.sh` might not work as you expected
> 
> `display.sh` and `cursor.sh` do not run in TTY
> 
|-------------------|--------------------------------|
| alacritty         | Terminal emulator             |
|-------------------|--------------------------------|
| sxhkd             | Hotkey daemon                 |
|-------------------|--------------------------------|
| ranger            | File manager                  |
|-------------------|--------------------------------|
| neovim            | Text editor                   |
|-------------------|--------------------------------|
| feh               | Image viewer                  |
|-------------------|--------------------------------|
| gnome-keyring     | Keyring manager               |
|-------------------|--------------------------------|
| ttf-dejavu        | Font                          |

<details>
<summary>components</summary>

| package | about |
|-----:|-----------|
|     1| JavaScript|
|     2| Python    |
|     3| SQL       |

</details>

```mermaid
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```

solid heart
  facet normal 0 0 1
    outer loop
      vertex 0 0 0
      vertex 1 0 0
      vertex 0 1 0
    endloop
  endfacet
  facet normal 0 0 -1
    outer loop
      vertex 0 0 0
      vertex 0 1 0
      vertex 1 0 0
    endloop
  endfacet
  facet normal 0 1 0
    outer loop
      vertex 0 1 0
      vertex 1 0 0
      vertex 1 1 0
    endloop
  endfacet
  facet normal 1 0 0
    outer loop
      vertex 1 0 0
      vertex 0 0 0
      vertex 1 1 0
    endloop
  endfacet
endsolid
