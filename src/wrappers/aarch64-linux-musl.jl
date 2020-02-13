# Autogenerated wrapper script for tree_sitter_c_jll for aarch64-linux-musl
export libtreesitter, libtreesitter_c

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libtreesitter`
const libtreesitter_splitpath = ["lib", "libtreesitter.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libtreesitter_path = ""

# libtreesitter-specific global declaration
# This will be filled out by __init__()
libtreesitter_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libtreesitter = "libtreesitter.so"


# Relative path to `libtreesitter_c`
const libtreesitter_c_splitpath = ["lib", "libtreesitter_c.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libtreesitter_c_path = ""

# libtreesitter_c-specific global declaration
# This will be filled out by __init__()
libtreesitter_c_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libtreesitter_c = "libtreesitter_c.so"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"tree_sitter_c")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    global libtreesitter_path = normpath(joinpath(artifact_dir, libtreesitter_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libtreesitter_handle = dlopen(libtreesitter_path)
    push!(LIBPATH_list, dirname(libtreesitter_path))

    global libtreesitter_c_path = normpath(joinpath(artifact_dir, libtreesitter_c_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libtreesitter_c_handle = dlopen(libtreesitter_c_path)
    push!(LIBPATH_list, dirname(libtreesitter_c_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

