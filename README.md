# OpenSCAD-DDM

A OpenSCAD code to create a custom DDM die as an STL


## Step 1: Download/Install Docker

Alternatively, you can build OpenSCAD on your computer, but running it through Docker is much easier.

## Step 2: Pull the OpenSCAD Docker from DockerHub

- If you are on MACOS, you will need to first open Docker Desktop

- Open a terminal

- Run the command:
  
```docker pull openscad/openscad```

## Step 3: Run the following:


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
