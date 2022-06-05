//
    `register_string_function(string,upper);
    `register_string_function(string,lower);
    `register_string_function(string,swapcase);
    `register_string_function(string,capitalize);
    `register_string_function(string,title);
    `register_string_function(bit,isupper);
    `register_string_function(bit,islower);
    `register_string_function(bit,isbin);
    `register_string_function(bit,isdec);
    `register_string_function(bit,ishex);
    `register_string_function(bit,isdigit);
    `register_string_function(bit[31:0],atobin);
    `register_string_function(bit[31:0],atodec);
    `register_string_function(bit[31:0],atohex);
    `register_string_function(bit[31:0],atoi);
    `register_string_function(q_string,splitlines);
    `register_string_function(string,reverse);
    `register_string_function(string,lstrip);
    `register_string_function(string,rstrip);
    `register_string_function(string,strip);
    `register_func_with_para(bit,startswith,m_s)
    `register_func_with_para(bit,endswith,m_s)
    `register_func_with_para(int,find,m_s)
    `register_func_with_para(q_int,findall,m_s)

    function automatic string zfill     (string src,int width,string fill_s="0", align_enum fill_pos=LEFT);
        `CLASS_STRING new_string = new(src);
        string rtn = new_string.zfill(width,fill_s,fill_pos);
        new_string=null;
        return rtn;
    endfunction
    function automatic string joins     (string src,string join_s[$], align_enum join_pos=RIGHT);
        `CLASS_STRING new_string = new(src);
        string rtn = new_string.joins(join_s,join_pos);
        new_string=null;
        return rtn;
    endfunction
    function automatic bit isSpace      (byte unsigned ch);
        `CLASS_STRING new_string = new();
        bit rtn = new_string.isSpace(ch);
        new_string=null;
        return rtn;
    endfunction
    function automatic q_string split   (string src,string m_s, bit save_split_ch=0,bit save_empty_ch=0);
        `CLASS_STRING new_string = new(src);
        q_string rtn = new_string.split(m_s,save_split_ch,save_empty_ch);
        new_string=null;
        return rtn;
    endfunction
    function automatic string replace   (string src,string old_s,string new_s, int r_cnt=0);
        `CLASS_STRING new_string = new(src);
        string rtn = new_string.replace(old_s,new_s,r_cnt);
        new_string=null;
        return rtn;
    endfunction
