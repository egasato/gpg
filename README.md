## My GPG keys (with SSH support)

This repository contains my public GPG keys and their SSH counterpart (if it is
a supported algorithm).  The keys are exported automatically and overwritten
(because this is a repository), so if you want to always download the same
public key you should use the commit when `curl`-ing or `wget`-ing them.

The purpose of this `README.md` file is to serve as documentation, so you know
what the subkeys are for and why they might have been revoked.

### Personal opinion on revocation certificates and GPG keyservers

Although I like the idea behind the revocation system of GPG (because you can
specify the reason why you revoke a key), I do not feel like it has been
implemented correctly.  If I wanted to follow the best practices, which is
rotate the subkeys yearly (or more frequently), the size of my key (as a whole)
would grow for every rotation _ad infinitum_; after a rotation a subkey is still
associated with the master key, which means the result returned by GPG servers
MUST contain my whole subkey history and their respective revocation
certificates, making the payload bigger and slower to import over time.

I do not know what would be the best solution, maybe GPG servers should only
gossip public keys which have been signed in a specific way, but that would
probably require the keyservers to trust either each other or an attestation
service, which is a difficult matter or a no-go in a distributed network.
Anyway, my solution to prevent the keys from growing indifinitely is to not
publish them in the SKS keyserver pool but in this repository.

### Spam

You are not allowed to use the published email addresses for spamming.  I will
not use my addresses in anything that is not related to software development, so
that means that I will be able identify SPAM emails and I will block and publish
the spammer's address in my public personal blocklist, this way anybody can
copy-paste my email addresses easily (no `at` workaround) and anybody can block
automatically whoever tries to SPAM (and scam) people over the Internet.

### Security

If you want to use this repository as a template to share your own GPG keys, you
should use the included a git hook that prevents commiting private keys.  It has
been tested only under GNU/Linux (any distro should have GNU `coreutils` and
`file`), so use at your own discretion and risk on other operating systems.

### Esaú García Sánchez-Torija (Open Source Developer) <<egasato.dev@gmail.com>>

The purpose of this key is to be used in all my open source projects.  This
includes signing git commits and tags, source and binary archives (the binary
MUST use the open source code if the license is permissive) and packages and
installers (again, they MUST install the open source version of permissively
licensed projects).

The key contains an offline master key, 3 _legacy_ subkeys (using RSA, required
for special cases such as signing RPM packages) and 3 _modern_ subkeys (using
eliptic curve).  All the keys have only one capability each and you should
always, whenever possible, use the modern keys.  To help people familiar with
GPG software, the output of `gpg -K --with-subkey-fingerprint` (formatted as a
table and with the SSH MD5 fingerprint from `ssh-keygen -E md5 -lf <pub>`) is:

| Algorithm |    Date    | Capabilities |                              Fingerprint                              |                                SSH                                 |
|:---------:|:----------:|:------------:|:---------------------------------------------------------------------:|:------------------------------------------------------------------:|
|  rsa4096  | 2021-03-25 |   Certify    | [`2787 75DF 8230 FE08 7847  29E3 DCCA 6B78 DD44 8CAE`][gpg_rsa4096_c] | [`BE:A2:7B:3F:91:48:92:52:B2:E5:9C:60:7F:8D:42:1C`][ssh_rsa4096_c] |
|  rsa4096  | 2021-03-25 |     Sign     | [`E964 49E7 C137 C52C A9B9  1024 3341 2B63 D5B8 BB4B`][gpg_rsa4096_s] | [`5B:DF:A2:80:0F:9D:B7:BE:02:5C:95:6B:5C:12:69:C4`][ssh_rsa4096_s] |
|  rsa4096  | 2021-03-25 | Authenticate | [`3BF9 0520 C1C9 6BDE D0AD  EAAE 577F 2EED 10FD 6FA3`][gpg_rsa4096_a] | [`8A:94:2D:30:78:9E:04:62:09:F9:F3:BA:20:9D:C3:F4`][ssh_rsa4096_a] |
|  rsa4096  | 2021-03-25 |    Encrypt   | [`42C9 83E7 70B0 34BB EBCA  7035 CF63 CE25 B16E 16DA`][gpg_rsa4096_e] | [`B7:8D:1F:50:A4:14:9B:B7:C0:8A:10:F6:61:74:49:2E`][ssh_rsa4096_e] |
|  ed22519  | 2021-03-25 |     Sign     | [`F0EB A028 6633 8CE9 25D6  8662 4A8C BFDB 7EF0 EF46`][gpg_ed22519_s] | [`E7:CC:20:B6:3D:4D:05:DC:2B:B3:7F:23:AD:7D:69:00`][ssh_ed22519_s] |
|  ed22519  | 2021-03-25 | Authenticate | [`B384 099C 5082 B171 27FC  A332 551A 66B6 6A99 DFEE`][gpg_ed22519_a] | [`A5:C5:A6:D5:13:61:53:05:77:42:B2:63:45:EC:9E:E0`][ssh_ed22519_a] |
|  cv25519  | 2021-03-25 |    Encrypt   | [`3BBA DFEB 0565 B5B2 CC32  AEA9 CC57 D240 BAB1 62B4`][gpg_cv25519_e] |                                 -                                  |

[gpg_rsa4096_c]: pub/rsa4096_c.asc "GPG Master Key"
[gpg_rsa4096_s]: sub/rsa4096_s.asc "GPG Signing Subkey"
[gpg_rsa4096_a]: sub/rsa4096_a.asc "GPG Authentication Subkey"
[gpg_rsa4096_e]: sub/rsa4096_e.asc "GPG Encryption Subkey"
[gpg_ed22519_s]: sub/ed22519_s.asc "GPG Signing Subkey"
[gpg_ed22519_a]: sub/ed22519_a.asc "GPG Authentication Subkey"
[gpg_cv25519_e]: sub/cv25519_e.asc "GPG Encryption Subkey"
[ssh_rsa4096_c]: pub/rsa4096_c.pub "SSH Master Key"
[ssh_rsa4096_s]: sub/rsa4096_s.pub "SSH Signing Subkey"
[ssh_rsa4096_a]: sub/rsa4096_a.pub "SSH Authentication Subkey"
[ssh_rsa4096_e]: sub/rsa4096_e.pub "SSH Encryption Subkey"
[ssh_ed22519_s]: sub/ed22519_s.pub "SSH Signing Subkey"
[ssh_ed22519_a]: sub/ed22519_a.pub "SSH Authentication Subkey"
