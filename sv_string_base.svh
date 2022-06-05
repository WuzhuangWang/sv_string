
//
class `CLASS_STRING;
    protected string local_str;

    extern function new(string str="");

    //user base function
    extern virtual function void set_string(string str);
    extern virtual function string get_string();
    extern virtual function void clear();
    
    //letters transfer between upper and lower
    extern virtual function string upper     ();
    extern virtual function string lower     ();
    extern virtual function string swapcase  ();
    extern virtual function string capitalize();
    extern virtual function string title     ();

    extern virtual function bit isupper();
    extern virtual function bit islower();

    //sv digital or alpha judge, extract
    extern virtual function int isbin();
    extern virtual function int isdec();
    extern virtual function int ishex();
    extern virtual function bit isdigit();
    extern virtual function bit[31:0] atobin();
    extern virtual function bit[31:0] atodec();
    extern virtual function bit[31:0] atohex();
    extern virtual function bit[31:0] atoi();
    //string fill
    extern virtual function string zfill(int width,string fill_s="0", align_enum fill_pos=LEFT);

    //string find
    extern virtual function bit       startswith(string m_s);
    extern virtual function bit       endswith  (string m_s);
    extern virtual function int       find   (string m_s, int l_pos=-1,int r_pos=-1);
    extern virtual function q_int     findall(string m_s, int l_pos=-1,int r_pos=-1);

    //string join
    extern virtual function string joins(string fill_s[$], align_enum join_pos=RIGHT);


    //string sort
    extern virtual function string reverse();

    extern virtual function bit isSpace(byte unsigned ch);

    //strip,lstrip,rstrip
    extern virtual function string lstrip();
    extern virtual function string rstrip();
    extern virtual function string strip ();

    //split,splitlines
    extern virtual function q_string split (string m_s, bit save_split_ch=0,bit save_empty_ch=0);
    extern virtual function q_string splitlines();

    //replace
    extern virtual function string replace (string old_s,string new_s, int r_cnt=0);

    //==============
    extern protected function int  clip_pos(int pos); 
    extern protected function void anchor_pos(int l_pos,int r_pos, 
                                              output l_anchor,output r_anchor);

endclass

//==================================================
function int `CLASS_STRING:: clip_pos(int pos); 
    if(pos<0) return 0;
    if(pos>local_str.len) return local_str.len;
endfunction
//==================================================

//==================================================
function void `CLASS_STRING:: anchor_pos(int l_pos,int r_pos,output l_anchor,output r_anchor);
    int l,r;
    l=clip_pos(l_pos);
    r=clip_pos(r_pos);

    if(local_str.len==0) begin
        l_anchor=-1;
        r_anchor=-1;
        return;
    end

    l_anchor=l;
    r_anchor=r;
endfunction
//==================================================

//==================================================
function `CLASS_STRING::new(string str="");
    local_str=str;
endfunction
//==================================================

//==================================================
function void `CLASS_STRING:: set_string(string str);
    local_str = str;
endfunction
//==================================================

//==================================================
function string `CLASS_STRING:: get_string();
    return local_str;
endfunction
//==================================================

//==================================================
function void `CLASS_STRING:: clear();
    local_str="";
endfunction
//==================================================
    
//==================================================
function string `CLASS_STRING::upper();
    return local_str.toupper;
endfunction
//==================================================
    
//==================================================
function string `CLASS_STRING::lower();
    return local_str.tolower;
endfunction
//==================================================
    
//==================================================
function string `CLASS_STRING::swapcase();
    string rtn,str;
    foreach(local_str[i]) begin
        str=string'(local_str[i]);
        if     ((str>="A") && (str<="Z")) rtn = {rtn,str.tolower};
        else if((str>="a") && (str<="z")) rtn = {rtn,str.toupper};
        else                                    rtn = {rtn,str};
    end
    return rtn;
endfunction
//==================================================
    
//==================================================
function string `CLASS_STRING::capitalize();
    if(local_str.len>0) begin
        string str = string'(local_str[0]);
        str=str.toupper;
        if(local_str.len>1) return {str,local_str.substr(1,local_str.len-1)};
        return str;
    end
    return local_str;
endfunction
//==================================================
    
//==================================================
function string `CLASS_STRING::title();
    bit upper_flag;
    string rtn_str;
    foreach(local_str[i]) begin
        upper_flag=0;
        if(i==0) upper_flag=1;
        else begin
            if(local_str[i-1] inside {" ",","}) upper_flag=1;
        end
        if(upper_flag) rtn_str={rtn_str,local_str.substr(i,i).toupper};
        else rtn_str = {rtn_str,local_str[i]};
    end
    return rtn_str;
endfunction
//==================================================

//==================================================
function bit `CLASS_STRING::isupper();
    string str;
    foreach(local_str[i]) begin
        str=string'(local_str[i]);
        if((str>="a") && (str<="z")) return 0;
    end
    return 1;
endfunction
//==================================================
    
//==================================================
function bit `CLASS_STRING::islower();
    string str;
    foreach(local_str[i]) begin
        str=string'(local_str[i]);
        if((str>="A") && (str<="Z")) return 0;
    end
    return 1;
endfunction
//==================================================

//==================================================
function int `CLASS_STRING::isbin();
    int match_pos = find("'b");
    if(match_pos<0) return -1;
    else if(match_pos+1>=local_str.len) return -1;
    for(int i=match_pos+2;i<local_str.len;i++) begin
        if(local_str[i] inside {"0","1"}) continue;
        else return -1;
    end
    return match_pos+2;
endfunction
//==================================================
    
//==================================================
function bit[31:0] `CLASS_STRING::atobin();
    string num_str;
    int match_pos = isbin();
    if(match_pos<0) return 0;
    num_str = local_str.substr(match_pos,local_str.len-1);
    return num_str.atobin;
endfunction
    
//==================================================
function int `CLASS_STRING::isdec();
    int match_pos = 0;
    for(int i=match_pos;i<local_str.len;i++) begin
        if(!((local_str[i]>="0") && (local_str[i]<="9"))) return -1;
    end
    return 0;
endfunction
//==================================================

//==================================================
function bit[31:0] `CLASS_STRING::atodec();
    string num_str;
    int match_pos = isdec();
    if(match_pos<0) return 0;
    num_str = local_str.substr(match_pos,local_str.len-1);
    return num_str.atoi;
endfunction
//==================================================

//==================================================
function int `CLASS_STRING::ishex();
    int match_pos = find("'h");
    if(match_pos<0) return -1;
    else if(match_pos+1>=local_str.len) return -1;
    for(int i=match_pos+2;i<local_str.len;i++) begin
        if(!(((local_str[i]>="a") && (local_str[i]<="z")) || 
             ((local_str[i]>="A") && (local_str[i]<="Z")) || 
             ((local_str[i]>="0") && (local_str[i]<="9")) )) return -1;
    end
    return match_pos+2;
endfunction
//==================================================
    
//==================================================
function bit[31:0] `CLASS_STRING::atohex();
    string num_str;
    int match_pos = ishex();
    if(match_pos<0) return 0;
    num_str = local_str.substr(match_pos,local_str.len-1);
    return num_str.atohex;
endfunction
//==================================================

//==================================================
function bit `CLASS_STRING::isdigit();
    if      (ishex()>=0) return 1;
    else if (isbin()>=0) return 1;
    else if (isdec()>=0) return 1;
    else                 return 0;
endfunction
//==================================================

//==================================================
function bit[31:0] `CLASS_STRING::atoi();
    if      (ishex()>=0) return atohex();
    else if (isbin()>=0) return atobin();
    else if (isdec()>=0) return atodec();
    else                 return 0;
endfunction
//==================================================
    
//==================================================
function string    `CLASS_STRING::zfill(int width,string fill_s="0", align_enum fill_pos=LEFT);
    int fill_cnt;
    string rtn;
    if(width<=local_str.len) return local_str;
    fill_cnt = (width-local_str.len)/fill_s.len;
    if(fill_pos==CENTER) fill_cnt=fill_cnt/2;
    if(fill_pos==RIGHT) rtn=local_str;
    for(int i=0;i<fill_cnt;i++) rtn = {rtn,fill_s};
    if(fill_pos==LEFT) rtn= {rtn,local_str};
    if(fill_pos==CENTER) rtn= {rtn,local_str,rtn};
    return rtn;
endfunction
//==================================================
    
//==================================================
function bit       `CLASS_STRING::startswith(string m_s);
    if(m_s.len>local_str.len) return 0;
    if(local_str.substr(0,m_s.len-1) == m_s) return 1;
    return 0;
endfunction
//==================================================
    
//==================================================
function bit       `CLASS_STRING::endswith  (string m_s);
    if(m_s.len>local_str.len) return 0;
    if(local_str.substr(local_str.len-m_s.len,local_str.len-1) == m_s) return 1;
    return 0;
endfunction
//==================================================
    
//==================================================
function int       `CLASS_STRING::find   (string m_s, int l_pos=-1,int r_pos=-1);
    for(int i=0;i<local_str.len;i++) begin
        //if(i+m_s.len+1 > local_str.len) return -1;
        if(local_str.substr(i,i+m_s.len-1)==m_s) return i;
    end
    return -1;
endfunction
//==================================================
    
//==================================================
function q_int     `CLASS_STRING::findall(string m_s, int l_pos=-1,int r_pos=-1);
    int rtn[$];
    for(int i=0;i<local_str.len;i++) begin
        //if(i+m_s.len+1 > local_str.len) break;
        if(local_str.substr(i,i+m_s.len-1)==m_s) rtn.push_back(i);
    end
    return rtn;
endfunction
//==================================================
    
//==================================================
function string    `CLASS_STRING::joins(string fill_s[$], align_enum join_pos=RIGHT);
    string rtn;
    if(join_pos==RIGHT) rtn=local_str;
    foreach(fill_s[i]) rtn = {rtn,fill_s[i]};
    if(join_pos==LEFT) rtn = {rtn,local_str};
    if(join_pos==CENTER) rtn = {rtn,local_str,rtn};
    return rtn;
endfunction
//==================================================

//==================================================
function string `CLASS_STRING:: reverse();
    string rtn;
    for(int i=local_str.len-1;i>=0;i--) rtn={rtn,local_str[i]};
    return rtn;
endfunction
//==================================================
    
//==================================================
function string `CLASS_STRING::lstrip();
    int first=0;
    int last=local_str.len-1;
    while ((first <= last) && isSpace(local_str[first])) first++;
    return local_str.substr(first, last);
endfunction
//==================================================

//==================================================
function string `CLASS_STRING::rstrip();
    int first=0;
    int last=local_str.len-1;
    while ((first <= last) && isSpace(local_str[last])) last--;
    return local_str.substr(first, last);
endfunction
//==================================================

//==================================================
function string `CLASS_STRING::strip();
    int first=0;
    int last=local_str.len-1;
    while ((first <= last) && isSpace(local_str[first])) first++;
    while ((first <= last) && isSpace(local_str[last])) last--;
    return local_str.substr(first, last);
endfunction
//==================================================

//==================================================
function bit `CLASS_STRING:: isSpace(byte unsigned ch);
  return (ch inside {"\t", "\n", " ","\v","\a","\f"});
endfunction
//==================================================

//==================================================
function q_string `CLASS_STRING::split(string m_s, bit save_split_ch=0,bit save_empty_ch=0);
    string tmp_str;
    split = {};
    if (m_s == "") split.push_back(local_str);
    else begin
        int anchor = 0;
        for(int i=0;i<local_str.len;) begin
            if(local_str.substr(i,i+m_s.len-1) == m_s) begin
                tmp_str = local_str.substr(anchor, i-1);
                if ((tmp_str.len>0) || (save_empty_ch==1)) split.push_back(tmp_str);
                if (save_split_ch) split.push_back(m_s);
                anchor = i+m_s.len;
                i = anchor;
            end else i++;
        end
        tmp_str = local_str.substr(anchor, local_str.len()-1);
        if((tmp_str.len>0) || (save_empty_ch==1)) split.push_back(tmp_str);
    end
endfunction
//==================================================

//==================================================
function q_string `CLASS_STRING:: splitlines();
    splitlines=split("\n");
endfunction
//==================================================

//==================================================
function string `CLASS_STRING:: replace (string old_s,string new_s, int r_cnt=0);
    string rtn_str,tmp_str;
    int   split_pos[$], anchor=0;

    if(find(old_s)<0) return local_str;

    split_pos = findall(old_s);
    if((r_cnt>0) && (r_cnt<split_pos.size)) split_pos = split_pos[0:r_cnt-1];

    foreach(split_pos[i]) begin
        tmp_str = local_str.substr(anchor,split_pos[i]-1);
        rtn_str = {rtn_str,tmp_str,new_s};
        anchor = split_pos[i]+old_s.len;
    end
    tmp_str = local_str.substr(anchor,local_str.len-1);
    rtn_str = {rtn_str,tmp_str};
    return rtn_str;
endfunction
//==================================================
