" Vim syntax file
" Language:	SQL, PL/SQL (Oracle 11g)
" Maintainer:	Christian Brabandt
" Repository:   https://github.com/chrisbra/vim-sqloracle-syntax
" License:      Vim
" Previous Maintainer:	Paul Moore
" Last Change:	2018 June 24

" Changes:
" 02.04.2016: Support for when keyword
" 03.04.2016: Support for join related keywords
" 22.07.2016: Support Oracle Q-Quote-Syntax
" 25.07.2016: Support for Oracle N'-Quote syntax
" 22.06.2018: Remove skip part for sqlString (do not escape strings)
" (https://web.archive.org/web/20150922065035/https://mariadb.com/kb/en/sql-99/character-string-literals/)
" 2020-05-03: Add PG specific keywords

if exists("b:current_syntax")
  finish
endif

syn case ignore

" The SQL reserved words, defined as keywords.

syn keyword sqlString	false null true

syn keyword sqlKeyword	access add as asc begin by case check cluster column
syn keyword sqlKeyword	cache compress connect current cursor decimal default desc
syn keyword sqlKeyword	else elsif end exception exclusive file for from returning
syn keyword sqlKeyword	function group having identified if immediate increment
syn keyword sqlKeyword	index initial initrans into is level link logging loop
syn keyword sqlKeyword	limit maxextents maxtrans mode modify monitoring
syn keyword sqlKeyword	nocache nocompress nologging noparallel nowait of offline on online start
syn keyword sqlKeyword	parallel successful synonym table tablespace then to trigger uid
syn keyword sqlKeyword	unique user validate values view when whenever where with
syn keyword sqlKeyword	offset option order pctfree pctused privileges procedure
syn keyword sqlKeyword	public resource return row rowlabel rownum rows
syn keyword sqlKeyword	session share size smallint type using
syn keyword sqlFunction	join cross inner outer left right

syn keyword sqlOperator	not and or
syn keyword sqlOperator	in any some all between exists
syn keyword sqlOperator	like escape
syn keyword sqlOperator	union intersect minus
syn keyword sqlOperator	prior distinct recursive
syn keyword sqlOperator	sysdate out
syn match   sqlOperator	"+\|-\|=\|\*\|/\|%\|\^\||/\|||/\|!!\?\|@\|&\|||\?\|#\|\~\|"
syn match   sqlOperator "<<\?\|>>\?\|<=\|>=\|<>"
syn match   sqlOperator	"->\+\|#>\+\|@>\|<@\|?[|&]*\|||\|#-\|@[?@]"
syn match   sqlDelimiter ";\|,\|\."

syn keyword sqlStatement analyze audit comment commit
syn keyword sqlStatement delete drop execute explain grant lock noaudit
syn keyword sqlStatement rename revoke rollback savepoint set
syn keyword sqlStatement truncate
" next ones are contained, so folding works.
syn keyword sqlStatement create update alter select insert contained

syn keyword sqlType	bfile blob boolean char character clob date datetime
syn keyword sqlType	dec decimal float int integer long mlslabel nchar
syn keyword sqlType	nclob number numeric nvarchar2 precision raw rowid
syn keyword sqlType	smallint real timestamp urowid varchar varchar2 varray

" variable replacement
syn match   rubySymbol  "$[0-9]\+"
syn match   sqlVariable ":\+[a-zA-Z0-9_-]\+"

" Strings:
syn region sqlString	matchgroup=Quote start=+n\?"+     end=+"+
syn region sqlString	matchgroup=Quote start=+n\?'+     end=+'+
syn region sqlString	matchgroup=Quote start=+n\?q'\z([^[(<{]\)+    end=+\z1'+
syn region sqlString	matchgroup=Quote start=+n\?q'<+   end=+>'+
syn region sqlString	matchgroup=Quote start=+n\?q'{+   end=+}'+
syn region sqlString	matchgroup=Quote start=+n\?q'(+   end=+)'+
syn region sqlString	matchgroup=Quote start=+n\?q'\[+  end=+]'+
syn region sqlString	matchgroup=Quote start=+n\?\$\$+    end=+\$\$+
syn region sqlString	matchgroup=Quote start=+n\?#{+    end=+}+ keepend

" Numbers:
syn match sqlNumber	"-\=\<\d*\.\=[0-9_]\>"

" Comments:
syn region sqlComment	start="/\*"  end="\*/" contains=sqlTodo,@Spell fold
syn match sqlComment	"--.*$" contains=sqlTodo,@Spell
syn match sqlComment "^rem.*$" contains=sqlTodo,@Spell

" Setup Folding:
" this is a hack, to get certain statements folded.
" the keywords create/update/alter/select/insert need to
" have contained option.
syn region sqlFold start='^\s*\zs\c\(Create\|Update\|Alter\|Select\|Insert\)' end=';$\|^$' transparent fold contains=ALL

syn sync ccomment sqlComment

" Functions:
" (Oracle 11g)
" Aggregate Functions
syn keyword sqlFunction	avg collect corr corr_s corr_k count covar_pop covar_samp cume_dist dense_rank first
syn keyword sqlFunction	group_id grouping grouping_id last max median min percentile_cont percentile_disc percent_rank rank
syn keyword sqlFunction	regr_slope regr_intercept regr_count regr_r2 regr_avgx regr_avgy regr_sxx regr_syy regr_sxy
syn keyword sqlFunction	stats_binomial_test stats_crosstab stats_f_test stats_ks_test stats_mode stats_mw_test
syn keyword sqlFunction	stats_one_way_anova stats_t_test_one stats_t_test_paired stats_t_test_indep stats_t_test_indepu
syn keyword sqlFunction	stats_wsr_test stddev stddev_pop stddev_samp sum
syn keyword sqlFunction	sys_xmlagg var_pop var_samp variance xmlagg
syn keyword sqlFunction array_agg bit_and bit_or bool_and bool_or every string_agg
" Array Functions
syn keyword sqlFunction array_append array_cat array_ndims array_fill array_length
syn keyword slqFunction array_lower array_prepend array_to_string array_upper unnest
" Char Functions
syn keyword sqlFunction	ascii chr concat initcap instr length lower lpad ltrim
syn keyword sqlFunction	nls_initcap nls_lower nlssort nls_upper regexp_instr regexp_replace
syn keyword sqlFunction	regexp_substr replace rpad rtrim soundex substr translate treat trim upper
" Comparison Functions
syn keyword sqlFunction	greatest least
" Conversion Functions
syn keyword sqlFunction	array asciistr bin_to_num cast chartorowid compose convert
syn keyword sqlFunction	decompose hextoraw numtodsinterval numtoyminterval rawtohex rawtonhex rowidtochar
syn keyword sqlFunction	rowidtonchar scn_to_timestamp timestamp_to_scn to_binary_double to_binary_float
syn keyword sqlFunction	to_char to_char to_char to_clob to_date to_dsinterval to_lob to_multi_byte
syn keyword sqlFunction	to_nchar to_nchar to_nchar to_nclob to_number to_dsinterval to_single_byte
syn keyword sqlFunction	to_timestamp to_timestamp_tz to_yminterval to_yminterval translate unistr
" DataMining Functions
syn keyword sqlFunction	cluster_id cluster_probability cluster_set feature_id feature_set
syn keyword sqlFunction	feature_value prediction prediction_bounds prediction_cost
syn keyword sqlFunction	prediction_details prediction_probability prediction_set
" Datetime Functions
syn keyword sqlFunction	add_months current_date current_timestamp dbtimezone extract
syn keyword sqlFunction	from_tz last_day localtimestamp months_between new_time
syn keyword sqlFunction	next_day numtodsinterval numtoyminterval round sessiontimezone
syn keyword sqlFunction	sys_extract_utc sysdate systimestamp to_char to_timestamp
syn keyword sqlFunction	to_timestamp_tz to_dsinterval to_yminterval trunc tz_offset
" JSON functions
syn keyword sqlFunction to_json to_jsonb array_to_json row_to_json json_object jsonb_object
syn keyword sqlFunction json_build_array jsonb_build_array json_build_object jsonb_build_object
syn keyword sqlFunction json_array_length jsonb_array_length json_each jsonb_each json_each_text jsonb_each_text
syn keyword sqlFunction json_extract_path jsonb_extract_path json_extract_path_text jsonb_extract_path_text
syn keyword sqlFunction json_object_keys jsonb_object_keys json_populate_record jsonb_populate_record
syn keyword sqlFunction json_array_elements jsonb_array_elements json_array_elements_text jsonb_array_elements_text
syn keyword sqlFunction json_typeof jsonb_typeof json_to_record jsonb_to_record json_to_recordset jsonb_to_recordset
syn keyword sqlFunction json_strip_nulls jsonb_strip_nulls jsonb_set jsonb_insert jsonb_pretty
syn keyword sqlFunction jsonb_path_exists jsonb_path_match jsonb_path_query jsonb_path_query_array jsonb_path_query_first
" Numeric Functions
syn keyword sqlFunction	abs acos asin atan atan2 bitand cbrt ceil ceiling cos cosh cot degrees div exp
syn keyword sqlFunction	floor ln log mod nanvl pi power radians random remainder round setseed sign
syn keyword sqlFunction	sin sinh sqrt tan tanh trunc width_bucket
" NLS Functions
syn keyword sqlFunction	ls_charset_decl_len nls_charset_id nls_charset_name
" String Functions
syn keyword sqlFunction bit_length char_length character_length octet_length
syn keyword sqlFunction lower upper overlay position substring trim
syn keyword sqlFunction ascii btrim chr concat concat_ws convert convert_from convert_to
syn keyword sqlFunction decode encode format initcap left length lpad ltrim md5
syn keyword sqlFunction pg_client_encoding quote_ident quote_literal quote_nullable
syn keyword sqlFunction regexp_matches regexp_replace regexp_split_to_array regexp_split_to_table
syn keyword sqlFunction repeat replace reverse right rpad rtrim split_part strpos substr
syn keyword sqlFunction to_ascii to_hex translate
" Various Functions
syn keyword sqlFunction	bfilename cardin coalesce collect decode dump empty_blob empty_clob
syn keyword sqlFunction	lnnvl nullif nvl nvl2 ora_hash powermultiset powermultiset_by_cardinality
syn keyword sqlFunction	sys_connect_by_path sys_context sys_guid sys_typeid uid user userenv vsizeality
" XML Functions
syn keyword sqlFunction	appendchildxml deletexml depth extract existsnode extractvalue insertchildxml
syn keyword sqlFunction	insertxmlbefore path sys_dburigen sys_xmlagg sys_xmlgen updatexml xmlagg xmlcast
syn keyword sqlFunction	xmlcdata xmlcolattval xmlcomment xmlconcat xmldiff xmlelement xmlexists xmlforest
syn keyword sqlFunction	xmlparse xmlpatch xmlpi xmlquery xmlroot xmlsequence xmlserialize xmltable xmltransform
" Todo:
syn keyword sqlTodo TODO FIXME XXX DEBUG NOTE contained

" Define the default highlighting.
hi def link rubySymbol          Special
hi def link sqlVariable         Special
hi def link Quote		Special
hi def link sqlComment		Comment
hi def link sqlFunction		Function
hi def link sqlKeyword		Statement
hi def link sqlNumber		Number
hi def link sqlOperator		Operator
hi def link sqlDelimiter	Delimiter
hi def link sqlSpecial		Special
hi def link sqlStatement	Keyword
hi def link sqlString		String
hi def link sqlType		Type
hi def link sqlTodo		Todo

let b:current_syntax = "sql"
" vim: ts=8
