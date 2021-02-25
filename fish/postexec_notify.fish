# show a desktop notification after a long running command line process finishes. uses noti.

function postexec_notify --arg cmd --on-event fish_postexec
    set -l s $pipestatus
    if test "$CMD_DURATION" -ge 30000 && ! string match -rq '(^man|\s--help)(\s|$)' $cmd
        if string match "$status" -qv 0 $s
            noti --title $cmd --message 'Exited with '(string join '|' $s)' after '(math $CMD_DURATION / 1000)s
        else
            noti --title $cmd --message 'Finished in '(math $CMD_DURATION / 1000)s
        end
    end
end
