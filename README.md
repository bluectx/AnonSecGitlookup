# AnonSecGitlookup

<p align="center">
  <img alt="GitHub commits" src="https://badgen.net/github/commits/BlueCtx/AnonSecGitlookup">
  <img alt="GitHub watchers" src="https://badgen.net/github/watchers/BlueCtx/AnonSecGitlookup">
  <img alt="GitHub stars" src="https://badgen.net/github/stars/BlueCtx/AnonSecGitlookup">
  <br>
  <strong>Retrieve information about a GitHub username or email</strong>
  <br>
  <a href="https://anonseclab.org">anonseclab.org</a> | <a href="https://bluectx.github.io">bluectx.github.io</a>
  <br>
  contact@anonseclab.org
</p>

## Features

- [x] Find GitHub username from an email address
- [x] Find email addresses from a GitHub username (via commits and GPG keys)
- [x] Retrieve comprehensive profile information (account creation date, public gists, ID, public PGP keys, public SSH keys, followers, following, etc.)

## Requirements

- Python 3.6+
- pip

## Installation

### Linux / macOS

```bash
git clone https://github.com/BlueCtx/AnonSecGitlookup.git
cd AnonSecGitlookup
chmod +x build.sh
./build.sh
```

### Windows

```batch
git clone https://github.com/BlueCtx/AnonSecGitlookup.git
cd AnonSecGitlookup
build.bat
```

The scripts will automatically:
- Check for Python installation
- Create a virtual environment if needed
- Install all required dependencies
- Launch the application

## Usage

```bash
$ python3 aslgit.py -h

    .aMMMb  dMMMMb  .aMMMb  dMMMMb  .dMMMb  dMMMMMP .aMMMb  dMP     .aMMMb  dMMMMb 
   dMP"dMP dMP dMP dMP"dMP dMP dMP dMP" VP dMP     dMP"VMP dMP     dMP"dMP dMP"dMP 
  dMMMMMP dMP dMP dMP dMP dMP dMP  VMMMb  dMMMP   dMP     dMP     dMMMMMP dMMMMK"  
 dMP dMP dMP dMP dMP.aMP dMP dMP dP .dMP dMP     dMP.aMP dMP     dMP dMP dMP.aMF   
dMP dMP dMP dMP  VMMMP" dMP dMP  VMMMP" dMMMMMP  VMMMP" dMMMMMP dMP dMP dMMMMP"    
                                                                                   v1.0.4
By BlueCtx | https://bluectx.github.io | https://anonseclab.org
contact@anonseclab.org

usage: aslgit.py [-h] [-u USERNAME] [-e EMAIL] [--json]

options:
  -h, --help            show this help message and exit
  -u USERNAME, --username USERNAME
                        Github username of the account to search for (default: None)
  -e EMAIL, --email     Email of the account to search for github username (default: None)
  --json                Return a json output (default: False)
```

## Examples

### Search by username

```bash
$ ./aslgit.py -u bluectx

    .aMMMb  dMMMMb  .aMMMb  dMMMMb  .dMMMb  dMMMMMP .aMMMb  dMP     .aMMMb  dMMMMb 
   dMP"dMP dMP dMP dMP"dMP dMP dMP dMP" VP dMP     dMP"VMP dMP     dMP"dMP dMP"dMP 
  dMMMMMP dMP dMP dMP dMP dMP dMP  VMMMb  dMMMP   dMP     dMP     dMMMMMP dMMMMK"  
 dMP dMP dMP dMP dMP.aMP dMP dMP dP .dMP dMP     dMP.aMP dMP     dMP dMP dMP.aMF   
dMP dMP dMP dMP  VMMMP" dMP dMP  VMMMP" dMMMMMP  VMMMP" dMMMMMP dMP dMP dMMMMP"    
                                                                                   v1.0.4
By BlueCtx | https://bluectx.github.io | https://anonseclab.org
contact@anonseclab.org

[+] login : bluectx
[+] id : 245930475
[+] avatar_url : https://avatars.githubusercontent.com/u/245930475?v=4
[+] blog : https://bluectx.github.io
[+] public_repos : 3
[+] public_gists : 0
[+] followers : 0
[+] following : 0
[+] created_at : 2025-11-24T18:13:40Z
[+] updated_at : 2025-12-03T00:48:08Z
[+] public_gists : https://gist.github.com/bluectx
[+] email : contact@anonseclab.org 245930475+bluectx@users.noreply.github.com
```

### JSON output

```bash
$ ./aslgit.py -u bluectx --json
{
    "avatar_url": "https://avatars.githubusercontent.com/u/245930475?v=4",
    "blog": "https://bluectx.github.io",
    "created_at": "2025-11-24T18:13:40Z",
    "email": [
        "contact@anonseclab.org",
        "245930475+bluectx@users.noreply.github.com"
    ],
    "followers": 0,
    "following": 0,
    "id": 245930475,
    "login": "bluectx",
    "public_gists": "https://gist.github.com/bluectx",
    "public_repos": 3,
    "updated_at": "2025-12-03T00:48:08Z"
}
```

### Search by email

```bash
$ ./aslgit.py -e chrisadr@gentoo.org
[+] username : ChrisADR
```

```json
$ ./aslgit.py -e chrisadr@gentoo.org --json
{
    "username": "ChrisADR"
}
```

## How it works

### Finding email from username

The tool searches for email addresses through multiple methods:

1. **Public commits**: Scans all public commits made by the user. If an email is not hidden in the commit metadata, it will be added to the results.

2. **GPG keys**: If the user has uploaded GPG keys, the tool extracts email addresses from the GPG key content after base64 decoding.

3. **GitHub API**: Retrieves the email address directly from the GitHub user API if it's publicly available.

### Finding username from email

The tool uses:

1. **GitHub API search**: Queries GitHub's user search API with the email address.

2. **Commit spoofing** (Work In Progress): Attempts to create a spoofed commit with the email, then checks the commit history for the associated username. This method is currently under development.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

See [LICENSE](LICENSE) file for details.

## Contact

- Website: [anonseclab.org](https://anonseclab.org)
- Email: contact@anonseclab.org
- GitHub: [BlueCtx](https://github.com/BlueCtx)

---

**Note**: Contact me if you encounter any bugs.
