# csharp-tensorflow-notebook
Jupyter Notebook with Csharp Keras.Net

## Build

`docker build . -t kramins/csharp-tensorflow-notebook`

## Testing

`docker run -it --rm -p 8888:8888 -v ${PWD}/work:/home/jovyan/work kramins/csharp-tensorflow-notebook`