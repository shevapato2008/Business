
```shell
pandoc "02_斯里兰卡起步宝石品类.md" \
    -o "02_斯里兰卡起步宝石品类.pdf" \
    --pdf-engine=xelatex \
    -V geometry:margin=1in \
    -V CJKmainfont="PingFang SC" \
    --toc --toc-depth=3
```