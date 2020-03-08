# quantum-notebook
## To start run from the working directory:
```bash
docker run -it -p 8888:8888 \
--mount type=bind,source="$(pwd)",target=/home/nagyd96/workdir nagyd96/quantum-notebook:latest
```

## If you want to run with a specific theme:
```bash
docker run -it -p 8888:8888 \
-e THEME='onedork' \
--mount type=bind,source="$(pwd)",target=/home/nagyd96/workdir nagyd96/quantum-notebook:latest
```
Available themes: [https://github.com/dunovank/jupyter-themes](https://github.com/dunovank/jupyter-themes)

