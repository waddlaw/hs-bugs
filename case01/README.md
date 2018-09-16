# case01

## バグ

```hs
$ stack build
$ stack exec case1 TypeB Csv all
```

生成されるファイル `pipeB`, `pipeC` の中身に何も出力されない。(ただし `pipeA` は正常に出力されている)

パイプラインの途中から実行する場合は正しく動く。

```hs
$ stack build
$ stack exec case1 TypeB Csv bc
```

## TypeA では正常に動作する

```hs
$ stack exec case1 TypeA Html all
```