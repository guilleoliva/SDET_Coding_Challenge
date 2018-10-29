Feature: Github search API scenarios
  The Search API is optimized to help you find the specific item you're looking for (e.g., a specific user, a specific file in a repository, etc.).
  Think of it the way you think of performing a search on Google. It's designed to help you find the one result you're looking for (or maybe the few results you're looking for).
  Just like searching on Google, you sometimes want to see a few pages of search results so that you can find the item that best meets your needs.
  To satisfy that need, the GitHub Search API provides up to 1,000 results for each search.

Scenario: Search repositories: Find repositories via various criteria. This method returns up to 100 results per page.

  Given I call GET "https://api.github.com/search/repositories" with query params:
    | param | paramValue                   |
    | q     | tetris+language:assembly     |
    | sort  | stars                        |
    | order	| desc                         |
  Then The response status should be 200
  And The response headers should contain "X-RateLimit-Limit" with value "10"
  And The response headers should contain "server" with value "GitHub.com"
  And The response headers should contain "Content-Type" with value "application/json; charset=utf-8"
  And The response should contain "total_count" with value "1297"
  #And The response headers should contain "link" with value "<https://api.github.com/search/repositories?q=tetris+language%3Aassembly&sort=stars&order=desc&page=2>; rel="next", <https://api.github.com/search/repositories?q=tetris+language%3Aassembly&sort=stars&order=desc&page=34>; rel="last"


Scenario: Search commits: Find commits via various criteria. This method returns up to 100 results per page.

  Given I set headers to:
    | MyHeader | MyHeaderValue |
    | Accept   | application/vnd.github.cloak-preview |
  Given I call GET "https://api.github.com/search/commits" with query params:
    | param | paramValue                       |
    | q     | repo:octocat/Spoon-Knife+css     |
  Then The response status should be 200
  And The response headers should contain "X-RateLimit-Limit" with value "10"
  And The response headers should contain "server" with value "GitHub.com"
  And The response headers should contain "Content-Type" with value "application/json; charset=utf-8"
  And The response should contain "total_count" with value "1"
#And The response headers should contain "link" with value "<https://api.github.com/search/repositories?q=tetris+language%3Aassembly&sort=stars&order=desc&page=2>; rel="next", <https://api.github.com/search/repositories?q=tetris+language%3Aassembly&sort=stars&order=desc&page=34>; rel="last"


Scenario: Search code: Find file contents via various criteria. This method returns up to 100 results per page.

  Given I call GET "https://api.github.com/search/code" with query params:
    | param | paramValue                                          |
    | q     | addClass+in:file+language:js+repo:jquery/jquery     |
    | sort  | stars                                               |
    | order	| desc                                                |
  Then The response status should be 200
  And The response headers should contain "X-RateLimit-Limit" with value "10"
  And The response headers should contain "server" with value "GitHub.com"
  And The response headers should contain "Content-Type" with value "application/json; charset=utf-8"
  And The response should contain "total_count" with value "8"
#And The response headers should contain "link" with value "<https://api.github.com/search/repositories?q=tetris+language%3Aassembly&sort=stars&order=desc&page=2>; rel="next", <https://api.github.com/search/repositories?q=tetris+language%3Aassembly&sort=stars&order=desc&page=34>; rel="last"

Scenario: Search issues: Find issues by state and keyword. This method returns up to 100 results per page.

  Given I set headers to:
    | MyHeader | MyHeaderValue |
    | Accept   | application/vnd.github.v3.text-match+json |
  Given I call GET "https://api.github.com/search/issues" with query params:
    | param | paramValue                                        |
    | q     | windows+label:bug+language:python+state:open      |
    | sort  | created                                           |
    | order	| asc                                               |
  Then The response status should be 200
  And The response headers should contain "X-RateLimit-Limit" with value "10"
  And The response headers should contain "server" with value "GitHub.com"
  And The response headers should contain "Content-Type" with value "application/json; charset=utf-8"
  And The response should contain "total_count" with value "4271"
#And The response headers should contain "link" with value "<https://api.github.com/search/repositories?q=tetris+language%3Aassembly&sort=stars&order=desc&page=2>; rel="next", <https://api.github.com/search/repositories?q=tetris+language%3Aassembly&sort=stars&order=desc&page=34>; rel="last"

Scenario: Search users: Find users contents via various criteria. This method returns up to 100 results per page.

  Given I call GET "https://api.github.com/search/users" with query params:
    | param | paramValue                          |
    | q     | tom+repos:%3E42+followers:%3E1000   |
  Then The response status should be 200
  And The response headers should contain "X-RateLimit-Limit" with value "10"
  And The response headers should contain "server" with value "GitHub.com"
  And The response headers should contain "Content-Type" with value "application/json; charset=utf-8"
  And The response should contain "total_count" with value "5"
#And The response headers should contain "link" with value "<https://api.github.com/search/repositories?q=tetris+language%3Aassembly&sort=stars&order=desc&page=2>; rel="next", <https://api.github.com/search/repositories?q=tetris+language%3Aassembly&sort=stars&order=desc&page=34>; rel="last"

Scenario: Search topics: Find topics by state and keyword. This method returns up to 100 results per page.

  Given I set headers to:
    | MyHeader | MyHeaderValue |
    | Accept   | application/vnd.github.mercy-preview+json |
  Given I call GET "https://api.github.com/search/topics" with query params:
    | param | paramValu             |
    | q     | ruby+is:featured      |
  Then The response status should be 200
  And The response headers should contain "X-RateLimit-Limit" with value "10"
  And The response headers should contain "server" with value "GitHub.com"
  And The response headers should contain "Content-Type" with value "application/json; charset=utf-8"
  And The response should contain "total_count" with value "7"


Scenario: Search labels: Find labels by state and keyword. This method returns up to 100 results per page.

  Given I set headers to:
    | MyHeader | MyHeaderValue |
    | Accept   | application/vnd.github.symmetra-preview+json |
  Given I call GET "https://api.github.com/search/labels" with query params:
    | param | paramValu                                          |
    | repository_id     | 64778136&q=bug+defect+enhancement      |
  Then The response status should be 200
  And The response headers should contain "X-RateLimit-Limit" with value "10"
  And The response headers should contain "server" with value "GitHub.com"
  And The response headers should contain "Content-Type" with value "application/json; charset=utf-8"
  And The response should contain "total_count" with value "2"
