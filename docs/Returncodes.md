## wget return codes

* 0: get_exit_status(): WGET_EXIT_SUCCESS
* 1: get_exit_status(): if WGET_EXIT_UNKNOWN 1 is returned
* 2: memory allocations,
* 3: invalid or missing arguments, get_exit_status(): WGET_EXIT_MINIMUM, WGET_EXIT_IO_FAIL
* 4: get_exit_status(): WGET_EXIT_NETWORK_FAIL
* 5: get_exit_status(): WGET_EXIT_SSL_AUTH_FAIL
* 6: get_exit_status(): WGET_EXIT_SERVER_AUTH_FAIL
* 7: get_exit_status(): WGET_EXIT_PROTOCOL_ERROR
* 8: get_exit_status(): WGET_EXIT_SERVER_ERROR

## srcget:load_profile return codes

* 1: no profile id passed (invalid args)
* 2: profile file not found

## srcget:srcall

* 20: cannot find profiles directory

## srcget:listall

* 20: cannot find profiles directory

## srcget:main_single return codes

* 1: no profile passed
* 1: cannot load profile
* 3: srcurl in loaded profile is not set
* 4: fp_filter in loaded profile is not set
* 1: current_version did not return a valid version
* 3: invalid full url
* 2: file to be downloaded already exists

## srcget:geturl

return value returned by load_profile if different from 0
* 2: srcurl not valid
