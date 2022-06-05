//
`define CLASS_STRING String

typedef string q_string[$];
typedef int    q_int[$];
typedef enum {LEFT, RIGHT, CENTER} align_enum;

`define  register_string_function(func_type,func_name)\
function automatic func_type func_name (string src);\
    `CLASS_STRING new_string = new(src);\
    func_type rtn = new_string.func_name;\
    new_string=null;\
    return rtn;\
endfunction

`define  register_func_with_para(func_type,func_name,func_para)\
function automatic func_type func_name (string src,string func_para);\
    `CLASS_STRING new_string = new(src);\
    func_type rtn = new_string.func_name(func_para);\
    new_string=null;\
    return rtn;\
endfunction

