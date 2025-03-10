# OpenSCAD-DDM

A OpenSCAD code to create a custom DDM die as an STL.

Note that this may not work through the terminal alone because of the need to downlaod additional fonts, so instead you may want to install OpenSCAD on your own computer.

Download from here: https://openscad.org/downloads.html
- You may need to allow your MAC to open this file (change permissions in Security & Privacy in system settings)
- Open the ```.scad``` file in the application
- Change ```s0``` through ```s6``` variables appropriately to customize the die
- export as an STL file


## Step 1: Download and install the necessary fonts

- DejaVu Sans: https://www.fontsquirrel.com/fonts/dejavu-sans
  - Click on "DOWNLOAD TTF" button
- Noto Emoji: https://fonts.google.com/noto/specimen/Noto+Emoji
  - Click "Get Font" button to download

- Alternatively, download from the repo here
- On MACOS, open Font Book application
- Click the "+" symbol and add the ".ttf" files to add the fonts to your computer

## Step 2: Download/Install Docker

Alternatively, you can build OpenSCAD on your computer, but running it through Docker is much easier.

## Step 3: Pull the OpenSCAD Docker from DockerHub

- If you are on MACOS, you will need to first open Docker Desktop

- Open a terminal

- Run the command:
  
```docker pull openscad/openscad```

## Step 4: Run the following:


```
docker run \
    -it \
    --rm \
    -v ${stldir}:/openscad \
    -u $(id -u ${USER}):$(id -g ${USER}) \
    openscad/openscad:latest \
    openscad -o ${stlname} create_die.scad
```

where ```${stlname}``` is the name of the output STL file and ```${stldir}``` is the name of the parent directory of ```${stlname}``` (MAKE sure that create_die.scad is also in ```${stldir}```)
