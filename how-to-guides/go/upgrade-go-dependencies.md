# Upgrade go dependency

1. Check if the dependency is also an indirect dependency.

    ```sh
    go mod why -m DEPENDENCY_URL
    ```

2. If the dependency is not an indirect dependency,

    ```sh
    go get -u DEPENDENCY_URL
    go mod tidy
    ```

3. If the dependency is an indirect dependency (on say some dependency X),

    ```sh
    go get -u DEPENDENCY_X_URL
    go mod tidy
    ```
