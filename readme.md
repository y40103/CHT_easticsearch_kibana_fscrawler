## Feature

- elasticsearch / kibana / fscrawler 整合
- 已增加繁體中文分析器


## QuickStart

Port: 9200,5601


```bash

cd efk/
# 至該目錄

docker-compose up -d
# 佈署

docker-compose down
# 解除佈署

```
[kibana登陸](http://localhost:5601)

## Basic Auth

**for kibana,elasticsearch basic_auth**

- username: elastic 
- password: dev123



## FSCrawler

- 資料來源目錄: data/  
fscrawler預設index為idx,會抽取底下文檔內容寫入elasticsearch中的idx




### 設定檔

|                         路徑 |                           說明 |
|---------------------------|-----------------------------|
|./config/idx/_settings.yaml |               fscrawler 設定文件 |
|   ./_default/7/ fscrawler的 |es相關設定 settings , mappings ... |

_settings.yaml 預設關閉ocr, ocr為CPU密集, 有需要可自行調整  
詳細可參考 [fscrawler](https://fscrawler.readthedocs.io/en/latest/index.html)
```yaml
name: "idx"
fs:
  update_RATE: "15"
  indexed_chars: "100%"
  lang_detect: true
  continue_on_error: true
  remove_deleted: true

  includes:
    - "*.doc"
    - "*.ppt"
    - "*.pdf"
    - "*.docx"
    - "*.xls"
    - "*.xlsx"
    - "*.pptx"
    - "*.txt"
  excludes:
    - "*~*"


  ignore_above: "128m"
  filename_as_id: true
  add_filesize: true
  ocr:
    language: "chi_tra+eng"
    enabled: false
    pdf_strategy: "ocr_and_text"
elasticsearch:
  bulk_size: 1000
  byte_size : "10mb"
  nodes:
    - url: "http://165.28.0.2:9200"
  username: "elastic"
  password: "dev123"
rest :
  url: "http://165.28.0.4:8080"
```


