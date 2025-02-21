# Book Lending Library

This is a simple book lending library application built with Ruby on Rails. It includes authentication without Devise, book borrowing, and user sessions.

## Prerequisites

Ensure you have the following installed:

- Ruby (>= 3.0)
- Rails (>= 7.0)
- SQLite3 or PostgreSQL (for database)
- Bundler

## Getting Started

### 1. Install Required Gems

Navigate to your project directory and install dependencies:

```sh
bundle install
```

### 2. Set Up the Database

Run the database migrations:

```sh
rails db:migrate
```

### 3. Add Sample Data to the Database

Seed the database with initial data:

```sh
rails db:seed
```

### 4. Creating a User for Authentication

Use Rails console to create a user:

```sh
rails console
```

```ruby
User.create!(email: "test@example.com", password: "password", password_confirmation: "password")
```

### 5. Start the Server

Run the Rails server:

```sh
rails server
```

## Conclusion

You have successfully set up a Rails-based book lending library with authentication, borrowing functionality, and session management. Happy coding!
