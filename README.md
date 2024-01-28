<a name="readme-top"></a>

<h3 align="center"><b>Blog App</b></h3>

<p align="center">Blog App is a classic example of a blog website. It is a fully functional website that shows the list of posts and empowers readers to interact with them by adding comments and liking posts.</p>


# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [📖 My-Blog-Appp ](#-My-Blog-App-)
  - [🛠 Built With](#built-with)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [💻 Getting Started ](#-getting-started-)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ (OPTIONAL)](#faq)
- [📝 License](#license)


# 📖 My-Blog-App <a name="about-project"></a>

> The Blog app is a classic example of a blog website. It's a fully functional website that will show the list of posts and empower readers to interact with them by adding comments and liks to posts of their intrest.


## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://developer.mozilla.org/ru/docs/Web/HTML">HTML</a></li>
    <li><a href="https://developer.mozilla.org/ru/docs/Web/CSS">CSS</a></li>
    <li><a href="https://react.dev/">React.js</a></li>
  </ul>
</details>

<details>
  <summary>Ruby on Rails</summary>
  <ul>
    <li><a href="https://ruby-doc.org/core-3.2.2/">Ruby</a></li>
  </ul>
    <ul>
    <li><a href="https://rubyonrails.org/core- 7.1.2/">Rails</a></li>
  </ul>
</details>

### Key Features <a name="key-features">

- **authentication and authorization**
- **write posts**
- **like posts**
- **leave comments**
- **Create blog plost**
- **Comment on blog post**
- **Display list of comments**
- **Add User, Post, Like & Comment**
- **List all Users, Posts, Likes & Comments**
- **Sign up**
- **Log in**
- **Reset Password**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running follow these simple example steps.

### Prerequisites

In order to run this project you need:

- Mac or PC
- Code Editor (Vs Code)
- Terminal
- Install [ruby 3.2.2](https://www.ruby-lang.org/en/documentation/installation/) on your computer
- Install [rails](https://www.tutorialspoint.com/ruby-on-rails/rails-installation.htm#) on your computer
- Install [postgreSQL](https://www.postgresql.org/download/) on your computer

Install the dependencies:
> gem install
> npm install

Create database:
> bin/rails db:create

### Setup

Clone this repository by using the command line to your desired folder:  

```sh
git clone https://github.com/yusufyusie/Blog_App.git

cd Blog-App
```
Setup database:
> sudo -u postgres createuser --interactive --pwprompt
(provide the username and password described in [config/database.yml](./config/database.yml))

### Install

Install this project with:

```sh
cd Blog-App
 bundle install (install all dependencies)
```
- GitHub Actions
- Linters
  - Rubocop
- Ruby On Rails

### Usage

To run the project, execute the following command:

- Run `bundle install` in the terminal from the root folder of the project.
- Run `rails db:create` in the terminal from the root folder of the project.
- Run `rails db:migrate` in the terminal from the root folder of the project.
- Run the app with `rails c` in the terminal from the root folder of the project.
- Create a new user
```sh
```
- Run the server with `rails s` in the terminal from the root folder of the project.


### Test

```sh
  rspec
```

To run the server:
> rails server

Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

### Run tests

To run tests, run the following command:
> rspec

You can also check linter errors by running these commands:
> rubocop

For testing the confirmation emails:
> gem install mailcatcher

Open [http://localhost:1080](http://localhost:1080) to view it in your browser.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Authors <a name="authors"></a>

👤 **Yesuf Fenta**

- GitHub: [@yusufyusie](https://github.com/yusufyusie)
- Twitter: [@yusufyusiee](https://twitter.com/@yusufyusiee)
- LinkedIn: [Yesuf Fenta](https://www.linkedin.com/in/yusufyusie/)
- Frontend Mentor - [@yusufyusie](https://www.frontendmentor.io/profile/yusufyusie)


## 🔭 Future Features <a name="future-features"></a>

- **Improve styles of the project**

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/yusufyusie/Blog_App/issues)


<p align="right">(<a href="#readme-top">back to top</a>)</p>


## ⭐️ Show your support <a name="support"></a>

Leave a star if you like the project.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank Microverse for the project.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
