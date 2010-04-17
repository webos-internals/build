/** Lunabus service name */

#define LUNABUS_SERVICE_NAME        "com.palm.bus"

#define LUNABUS_SERVICE_NAME_OLD    "com.palm.lunabus"

/** Category for lunabus signal addmatch */
#define LUNABUS_SIGNAL_CATEGORY "/com/palm/bus/signal"

#define LUNABUS_SIGNAL_REGISTERED "registered"
#define LUNABUS_SIGNAL_SERVERSTATUS "ServerStatus"

/** Category for lunabus errors */
#define LUNABUS_ERROR_CATEGORY "/com/palm/bus/error"

/***
 * Error Method names
 */

/** Sent to callback when method is not handled by service. */
#define LUNABUS_ERROR_UNKNOWN_METHOD "UnknownMethod"

/** Sent to callback when service is down. */
#define LUNABUS_ERROR_SERVICE_DOWN "ServiceDown"

/** Out of memory */
#define LUNABUS_ERROR_OOM "OutOfMemory"

/**
 * UnknownError is usually as:
 * 'UnknownError (some dbus error name we don't handle yet)'
 */
#define LUNABUS_ERROR_UNKNOWN_ERROR "UnknownError"
