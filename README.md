## Linuxbrew manager

bm.sh is a simple script to manage linuxbrew environments.
This is useful when you need to mainain several linuxbrew environments, such as for scientific projects, where you need to make sure you use consistent version numbers.
The default installation directory for environments is ~/brews/. If you want to change this, you can change it in bm.sh.

## Usage

### Make a new environment
You can create a new linuxbrew installation by
```sh
  ./bm.sh n myenv
```

### Enter into an environment

  ```sh
  ./bm.sh e myenv
 ```

### Delte an environment
 ```sh
  ./bm.sh DEL myenv
  ```

### List all environments
 ```sh
 ./bm.sh l
 ```

## Additional packages
  In addition to the manager, I also provide several formulae related to bioinformatics.
