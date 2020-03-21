# Widgets App
A simple app to List, Search and Create Widgets.


## Getting started

This app makes use of the widget API to create new widget, list all widgets, list person widget and search through widget.

### Prerequisites

This project runs on [Ruby](https://www.ruby-lang.org/en/documentation/installation/), and [Rails](http://installrails.com/)

You would need to have the following gems


```bash
 rest-client

 donenv
```

`rest-client` is used for the API calls and `dotenv` for storing variable used in the project

create the `.env` in at the root of the project. In the `env` file add:

```bash
CLIENT_ID = xxxxx

CLIENT_SECRET =  xxxx
```

After installation, run `ruby -v` to make sure Ruby installed correctly.
Example:


Also make sure that Rails is installed, but running `rails -v`.
Example:


### Installing

clone the repo and go to the project directory:

```bash
git clone https://github.com/SunnyAsar/showoff_widget
cd showoff_widget
```

Install gems:

```bash
bundle install
```

### Start development server

Run the server with the following command:

```bash
rails s
```

## Contributors

<table>
  <tr>
    <td align="center"><a href="https://github.com/SunnyAsar"><sub><b>SunnyAsar</b></sub></a><br /></td>
    
</table>


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

