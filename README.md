# NAME

rdm - Manage Redmine project wiki pages

# SYNOPSIS

rdm \<subcommand\> [options]

# DESCRIPTION

rdm is a shell script for managing wiki pages in a Redmine project. It
allows users to create, list, update, and delete wiki pages, as well as
upload attachments.

# OPTIONS

## \--project PROJECT

Specify the project to work on.

## \--base-url URL

Specify the base url of the redmine instance.

## \--api-key KEY

Use the specified api-key to authenticate against your redmine server.

# SUBCOMMANDS

If the title parameter is specified as optional, fzf is called with a
list of all pages to select one.

## list [QUERY]

List Redmine wiki pages. If a query is given, filter the result
through \<grep -Ei\>.

## delete [TITLE]

Delete the specified Redmine wiki page

## edit [TITLE]

Edit the content of the specified Redmine wiki page.

## view [TITLE]

View the content of the specified Redmine wiki page in PAGER. If pager
is not set \<less -F \--no-init\> is used. The page is piped through
pandoc to generate plain output. This can be changed by the _formatter_
configuration option.

## cat [TITLE]

Write the raw content of the specified Redmine wiki page to stdout.

## attach TITLE FILES...

Attach FILES to the specified wiki page.

## search QUERY

Search for QUERY in the title and body of all wiki pages in your
project.

## replace TITLE

Replace the content of the specified wiki page with stdin.

## append TITLE

Append stdin to the content of the specified wiki page.

## prepend TITLE

Prepend stdin to the content of the specified wiki page with stdin.

## open [TITLE]

Open the specified wiki page with xdg-open. This will most likely open
the page in your browser.

## yank [TITLE]

Yank the complete url to the specified wiki page to your clipboard.

## diff TITLE [OLDER_VERSION] [NEWER_VERSION]

Diff two versions of the specified wiki page. _OLDER_VERSION_ defaults
to -1 and _NEWER_VERSION_ to the current version of the page. If
_OLDER_VERSION_ is negative it is substracted from _NEWER_VERSION_.

## rename [TITLE]

Open the rename dialog for the specified wiki page. As their's no api to
rename a page, rdm has to use the browser.

# CONFIGURATION FILE

Either \<\$XDG_CONFIG_HOME/rdm/rdmrc> or \<\~/.rdmrc\> are sourced on
startup as shell script.

For example:

    pager="less -F \--no-init"
    formatter="pandoc -f textile -t plain"
    project="foo"
    base_url="https://redmine.example.com"
    api_key="0123456789abcdef"

The following variables are used by rdm:

## base_url

Sets the base url of your redmine instance.

## project

Specify the project to work on.

## api_key

Use the specified api key to authenticate again your redmine instance.

## pager

Sets the pager used by the view command.

## formatter

Used by the view command to format the wiki page. It defaults to
\<pandoc -f textile -t plain\>. If you don't wont view to format the
page, you can get the raw content by setting _formatter_ to \<cat\>.

## user

User to login with. Must be set if apikey is missing.

## password

Password to login with. Must be set if apikey and pass_cmd is
missing.

## pass_cmd

Command to query password. Must be set if apikey and password is
missing.

# ENVIRONMENT

## RDM_PROJECT

Specify the project to work on.

## RDM_BASE_URL

Sets the base url of your redmine instance.

## RDM_API_KEY

Use the specified api key to authenticate again your redmine instance.

# COPYRIGHT AND LICENSE

Copyright 2024 Mario Domgörgen \<mario@domgoergen.com\>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
