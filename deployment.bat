docker build -t aspnetapp1 .
winpty docker run -it --rm -p 5000:80 --name aspnetcore_sample aspnetapp1 .
