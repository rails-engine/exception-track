1.0.0
-----

- Fix assets mainfest.js missing error.
- Use custom debug log for instead of the SQL log, for avoid output too much line of logs.

0.6.2
-----

- Fix `ActionDispatch::Http::ParameterFilter` is deprecated;

0.6.1
-----

- Fix assets.precompile config.

0.6.0
-----

- Add filtered_parameters into exception info.
- Import UI Style.
- Add export button for export exceptions as a JSON file.

0.5.2
-----

- Fix gemspec for dependency with Rails 6;

0.5.1
-----

- Fix migration `longtext` not exist bug.

0.5.0
-----

- Rescue and output errors to `Rails.logger.error` when ExceptionTrackNotifier create has error.

0.4.0
-----

- Limit title max 200 chars to fix long title error.
- Change database `exception_tracks.body` field from `text` to `longtext`.

0.3.1
-----

- Remove `Rails.logger.silence` is not exist and error, when application use `Logger` not `ActiveSupport::Logger`.

0.3.0
-----

- Add `request-id`, `controller#action`, `remote-ip` to exception headers.
- Support Rails 5.2.

0.2.0
-----

- Use Kaminari instead or will_paginate.
- Change per_page to 15 items.

0.1.5
-----

- Silence Rails log on Exception Log creating.

0.1.4
-----

- Fix Pagination style.

0.1.3
-----

- Change gemspec to allow Rails 4 applications to use.

0.1.2
-----

- First release.
