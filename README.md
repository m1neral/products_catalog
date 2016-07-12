# Products Catalog

[![wercker status](https://app.wercker.com/status/34fecccc3e53a9b1fecd2af7566bca62/m "wercker status")](https://app.wercker.com/project/bykey/34fecccc3e53a9b1fecd2af7566bca62)

This is a simple products catalog. Accessing the app, user will see list of products, additionally filter them by category.
Clicking on the product will show full info and reviews for this product. After signing in, user will be able to add reviews.

There may be administrative users who can manage all resources of app, including users and their roles.

## Installation

- Clone this repository:

    ```
    git clone https://github.com/m1neral/products_catalog.git
    ```
- Install gems:

    ```
    bundle
    ```
- Create config/application.yml (or rename config/application.yml.example)
- Setup database:

    ```
    rake db:setup
    ```
- Start the server:

    ```
    rails s
    ```

