# theScore "the Rush" Interview Challenge
At theScore, we are always looking for intelligent, resourceful, full-stack developers to join our growing team. To help us evaluate new talent, we have created this take-home interview question. This question should take you no more than a few hours.

**All candidates must complete this before the possibility of an in-person interview. During the in-person interview, your submitted project will be used as the base for further extensions.**

### Why a take-home challenge?
In-person coding interviews can be stressful and can hide some people's full potential. A take-home gives you a chance work in a less stressful environment and showcase your talent.

We want you to be at your best and most comfortable.

### A bit about our tech stack
As outlined in our job description, you will come across technologies which include a server-side web framework (like Elixir/Phoenix, Ruby on Rails or a modern Javascript framework) and a front-end Javascript framework (like ReactJS)

### Challenge Background
We have sets of records representing football players' rushing statistics. All records have the following attributes:
* `Player` (Player's name)
* `Team` (Player's team abbreviation)
* `Pos` (Player's postion)
* `Att/G` (Rushing Attempts Per Game Average)
* `Att` (Rushing Attempts)
* `Yds` (Total Rushing Yards)
* `Avg` (Rushing Average Yards Per Attempt)
* `Yds/G` (Rushing Yards Per Game)
* `TD` (Total Rushing Touchdowns)
* `Lng` (Longest Rush -- a `T` represents a touchdown occurred)
* `1st` (Rushing First Downs)
* `1st%` (Rushing First Down Percentage)
* `20+` (Rushing 20+ Yards Each)
* `40+` (Rushing 40+ Yards Each)
* `FUM` (Rushing Fumbles)

In this repo is a sample data file [`rushing.json`](/rushing.json).

##### Challenge Requirements
1. Create a web app. This must be able to do the following steps
    1. Create a webpage which displays a table with the contents of [`rushing.json`](/rushing.json)
    2. The user should be able to sort the players by _Total Rushing Yards_, _Longest Rush_ and _Total Rushing Touchdowns_
    3. The user should be able to filter by the player's name
    4. The user should be able to download the sorted data as a CSV, as well as a filtered subset
    
2. The system should be able to potentially support larger sets of data on the order of 10k records.

3. Update the section `Installation and running this solution` in the README file explaining how to run your code

### Submitting a solution
1. Download this repo
2. Complete the problem outlined in the `Requirements` section
3. In your personal public GitHub repo, create a new public repo with this implementation
4. Provide this link to your contact at theScore

We will evaluate you on your ability to solve the problem defined in the requirements section as well as your choice of frameworks, and general coding style.

### Help
If you have any questions regarding requirements, do not hesitate to email your contact at theScore for clarification.

### Installation and running this solution

The application may be installed and run as follows.

#### Clone this Repo

```bash
$ git clone https://github.com/LatitudeAdjustment/rush.git
```

Change into the base folder to run subsequent commands.

```bash
$ cd rush
```

#### Requirements

Postgres, Erlang/Elixir and Phoenix are required to run the Rush server application.

#### Postgres

Postgres may be installed using the following instructions:

[Postgres Installation](https://wiki.postgresql.org/wiki/Detailed_installation_guides)

#### Erlang and Elixir

Versions of Erlang, Elixir are specified in ASDF .tool-versions file.
ASDF may be used to install Erlang and Elixir for this application via `asdf install`.

If not using ASDF, Erlang, Elixir and Hex may be installed using the links at
the following page.

[Phoenix Installation](https://hexdocs.pm/phoenix/installation.html)

#### Phoenix Installation

Along with Erlang and Elixir Phoenix installation may also be found here:

[Phoenix Installation](https://hexdocs.pm/phoenix/installation.html)

#### Get and Build Dependencies

From the base folder get and compile dependencies.

```bash
$ cd rush
$ mix deps.get
$ mix deps.compile
```

#### Create the Database

From the base folder type `mix setup` or 
`mix ecto.create && mix ecto.migrate && mix run ./priv/repo/seeds.exs`

#### Start the Server

Start the rush server using either of the following commands.

```bash
$ mix phx.server
```

From within iex:

```bash
$ iex -S mix phx.server
```

#### Access the Application

The following page will show the rushing stats:

Local URL is [`localhost:4000`](http://localhost:4000).


