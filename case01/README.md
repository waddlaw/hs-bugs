# case01

## バグ

```hs
$ stack build
$ stack exec case1 TypeB Csv all

$ cat pipeA
secretsecret

$ cat pipeB

$ cat pipeC
```

生成されるファイル `pipeB`, `pipeC` の中身に何も出力されない。(ただし `pipeA` は正常に出力されている)

パイプラインの途中から実行する場合は正しく動く。

```hs
$ stack build
$ stack exec case1 TypeB Csv bc

$ cat pipeA
secretsecret

$ cat pipeB
secretsecretsecretsecret

$ cat pipeC
secretsecretsecretsecretsecretsecretsecretsecret
```

## TypeA では正常に動作する

```hs
$ stack exec case1 TypeA Html all

$ cat pipeA
secretsecret

$ cat pipeB
secretsecretsecretsecret

$ cat pipeC
secretsecretsecretsecretsecretsecretsecretsecret
```