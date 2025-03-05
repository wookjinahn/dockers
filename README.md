# Cheat sheet

### make image using Dockerfile  
```bash
./build.sh
```

### remove image   
```bash
./build.sh -r
```

### run or exec container  
```bash
./run.sh
```

### remove container   
```bash
./run.sh -r
```

### remove all containers   
```bash
sudo docker rm -f $(sudo docker ps -aq)
```

### show all containers  
```bash
sudo docker ps -aq
```