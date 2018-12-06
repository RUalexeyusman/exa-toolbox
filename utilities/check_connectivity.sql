/*
    This script is to check network connectivity from an Exasol database to a host.
    Returns either "OK" in case of success or an exception.
    See more at https://www.exasol.com/support/browse/SOL-307
*/

CREATE SCHEMA IF NOT EXISTS EXA_toolbox;

--/
CREATE OR REPLACE LUA SCALAR SCRIPT check_connectivity(hostname VARCHAR(4096), port VARCHAR(4096)) RETURNS VARCHAR(4096) AS

socket = require("socket")
function run(ctx)
    sock = assert(socket.tcp())
    assert(sock:connect(ctx.hostname, ctx.port))
    sock:close()
    return 'OK'
end
/

-- Example:
-- SELECT check_connectivity('exasol.com', '80');

-- EOF
