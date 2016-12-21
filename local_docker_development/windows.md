# Windows

amazee.io uses the newest Docker for Windows version, which is currently in beta.
There is an older version of Docker called "Docker Toolbox" which is not supported by amazee.io. Read more here: [https:\/\/docs.docker.com\/engine\/installation\/windows\/](https://docs.docker.com/engine/installation/windows/)

### Prerequisites

* If not installed already, install Git for Windows: [https:\/\/git-scm.com\/download\/win](https://git-scm.com/download/win)
* Download and install Docker for Windows: [https:\/\/docs.docker.com\/docker-for-windows\/](https://docs.docker.com/docker-for-windows/)  
* Configure Docker:
  1. Share at least the Volumes which contain the Drupal Code: [https:\/\/docs.docker.com\/docker-for-windows\/\#\/shared-drives](https://docs.docker.com/docker-for-windows/#/shared-drives)
  2. Configure the Memory to at least 4GB: [https:\/\/docs.docker.com\/docker-for-windows\/\#\/advanced](https://docs.docker.com/docker-for-windows/#/advanced)

* Download an install ConEmu: [https:\/\/conemu.github.io\/](https://conemu.github.io/) \(amazee.io will work without this, but there are some issues with special characters and general things that happen inside a real linux bash, so we suggest to use that\)


### Installation

Open ConEmu and clone our amazee.io docker for windows GIT Repo:

```
git clone https://github.com/amazeeio/amazeeio-docker-windows
```

cd into `amazeeio-docker-windows`

```
cd amazeeio-docker-windows
```

Start the shared Docker containers:

```
docker-compose up -d
```

### Domain Resolving

Unfortunately the nice dnsmasq trick used on OS X and Linux does not work on Windows. So we are forced to define each single Drupal Docker Container you would like to run via the Windows Hosts File.

There is a nice tool called "Hosts File Editor" that you can find and download here: [https://github.com/scottlerch/HostsFileEditor/releases](https://github.com/scottlerch/HostsFileEditor/releases).   
We suggest to use that.

For each Drupal Docker Container you start, just define it's URL with the IP Address 127.0.0.1.

As a test define this:

| IP Address | Host Names |
| :--- | :--- |
| 127.0.0.1 | docker.amazee.io |

Click the tick in front of the IP Address and click "Save".

To test if everything works open your browser at: [http:\/\/docker.amazee.io\/stats](http://docker.amazee.io/stats), if you see a website with "HAProxy Version xxx" you are all set!

### SSH keys

amazee.io does all authentifications via SSH keys and no passwords. Some Windows users might already have SSH keys generated \(for example via PuttyGen\), this is perfectly fine, just follow [http:\/\/stackoverflow.com\/a\/2224204\/2397973](http://stackoverflow.com/a/2224204/2397973) to generate SSH keys in the OpenSSH format.

##### Generating SSH keys \(if you don't have any yet\)

Assuming you do not have SSH Keys on your computer yet, generate a pair via:

```
"C:\Program Files\Git\usr\bin\ssh-keygen.exe"
```

The quotes \(`" "`\) are important!

This will generate a keypair in the folder `.ssh` in your home folder, example: `C:\Users\[yourname]\.ssh`

##### Injecting SSH Keys

Run `ssh-key-add.cmd` from inside the `amazeeio-docker-windows` folder and pass the full path of the SSH private key you would like to inject into the container.

```
ssh-key-add.cmd C:\Users\[yourname]\.ssh\id_rsa
```
