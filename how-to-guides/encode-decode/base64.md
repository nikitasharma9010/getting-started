# Base64

## encoding to base64

- encoding string (escape newline)

    ```sh
    echo -n "STRING_TO_BE_ENCODED" | base64
    ```

- encoding file content (escape newline)

    ```sh
    base64 "FILE_PATH" | tr -d '\n'
    ```

## decoding from base64

(escape newline)

```sh
echo -n "STRING_TO_BE_DECODED" | base64 -D
```
