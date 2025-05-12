# CAT-SCAN
CAT-SCAN is a set of automations to streamline the process of scanning files for malware using tools like ClamAV in a Docker Container.

## Prerequisites

*   Docker
*   Docker Compose

***todo: simple instructions to setup prerequisites on linux*** 

# ClamAV

ClamAV is an open source (GPLv2) anti-virus toolkit. Read more in the official docs [here](https://docs.clamav.net/).

## Setup

1. Clone this repository or download the `docker-compose.yml` and `scan.sh` files.

2. Run `chmod +x scan.sh` to make the script executable.

## Usage

1. Place the file you wish to scan in the same directory as the `docker-compose.yml` and `scan.sh` files. For files on the internet, use the `wget` command to download file from a url.
- Example : `wget https://github.com/Consumer-Rights-Wiki-Org/cat-scan/file-name file-name`

2.  Start the ClamAV container:
    
```bash
sudo docker-compose up -d
``` 
3. Run the `scan.sh` script with the file name as an argument:
 ```bash
sudo ./scan.sh file-name
```
4. Review results:
   
   ![clamav.png](https://github.com/Consumer-Rights-Wiki-Org/CAT-SCAN/blob/main/clamav.png?raw=true)

## Notes

- The script will remove the file from your system after scanning it. If you do not want this to happend, delete or comment out the last line in `scan.sh`: `docker exec "$CONTAINER_NAME" rm "/files/$FILENAME"`

