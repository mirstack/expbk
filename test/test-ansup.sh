test_ansup_fails_when_empty_directory_given()
{
    assert \
        "ansup 2>&1" \
        "ERROR -- missing directory"
}

test_ansup_fails_when_too_many_parameters_specified()
{
    assert \
        "ansup one two 2>&1" \
        "ERROR -- invalid number of arguments"
}

test_ansup_fails_when_empty_action_passed()
{
    assert \
        "ansup ./test/playbooks 2>&1" \
        "ERROR -- empty action received" \
        ""
}

test_ansup_fails_when_invalid_inventory_specified()
{
    assert \
        "ansup -iinvalid_inventory ./test/playbooks 2>&1" \
        "ERROR -- inventory file not found: invalid_inventory" \
        "test data=hello output=/tmp/hello"
}

test_ansup_fails_when_invalid_action_passed()
{
    assert \
        "ansup -i./test/playbooks/test ./test/playbooks 2>&1" \
        "ERROR -- no such playbook: ./test/playbooks/invalid.yml" \
        "invalid data=hello output=/tmp/hello"
}

test_ansup_fails_when_performed_play_is_failed()
{
    output=/tmp/.ansup_test_invalid
    rm -rf $output
    mkdir -p $output

    assert \
        "ansup -i./test/playbooks/test ./test/playbooks 2>&1 | grep '^ERROR --' | sed 's/test:[0-9]\+/test:ID/'" \
        "ERROR -- play test:ID has failed" \
        "test data=hello output=$output"
}

test_ansup_succeeds_when_performed_play_finishes_without_errors()
{
    output=/tmp/.ansup_test
    rm -rf $output

    assert \
        "ansup -i./test/playbooks/test ./test/playbooks 2>&1 | grep '^INFO -- play' | sed 's/test:[0-9]\+/test:ID/'" \
        "INFO -- play test:ID finished successfully" \
        "test data=hello output=$output"

    assert \
        "cat $output" \
        "hello"
}
