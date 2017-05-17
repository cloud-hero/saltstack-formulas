{% set p  = salt['pillar.get']('java', {}) %}
{% set g  = salt['grains.get']('java', {}) %}

{%- set java_home            = salt['grains.get']('java_home', salt['pillar.get']('java_home', '/usr/lib/java')) %}

{%- set default_version_name = 'jdk1.8.0_74' %}
{%- set default_prefix       = '/usr/share/java' %}
{%- set default_source_url   = 'http://download.oracle.com/otn-pub/java/jdk/8u74-b02/jdk-8u74-linux-x64.tar.gz' %}
{%- set default_source_hash  = '0bfd5d79f776d448efc64cb47075a52618ef76aabb31fde21c5c1018683cdddd' %}
{%- set default_jce_url      = 'http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip' %}
{%- set default_jce_hash     = 'f3020a3922efd6626c2fff45695d527f34a8020e938a49292561f18ad1320b59' %}
{%- set default_dl_opts      = '-b oraclelicense=accept-securebackup-cookie -L -s' %}

{%- set version_name         = g.get('version_name', p.get('version_name', default_version_name)) %}
{%- set source_url           = g.get('source_url', p.get('source_url', default_source_url)) %}

{%- if source_url == default_source_url %}
  {%- set source_hash        = default_source_hash %}
{%- else %}
  {%- set source_hash        = g.get('source_hash', p.get('source_hash', '')) %}
{%- endif %}

{%- set jce_url              = g.get('jce_url', p.get('jce_url', default_jce_url)) %}

{%- if jce_url == default_jce_url %}
  {%- set jce_hash           = default_jce_hash %}
{%- else %}
  {%- set jce_hash           = g.get('jce_hash', p.get('jce_hash', '')) %}
{%- endif %}

{%- set dl_opts              = g.get('dl_opts', p.get('dl_opts', default_dl_opts)) %}
{%- set prefix               = g.get('prefix', p.get('prefix', default_prefix)) %}
{%- set java_real_home       = prefix + '/' + version_name %}
{%- set jre_lib_sec          = java_real_home + '/jre/lib/security' %}

{%- set java = {} %}
{%- do java.update( { 'version_name'   : version_name,
                      'source_url'     : source_url,
                      'source_hash'    : source_hash,
                      'jce_url'        : jce_url,
                      'jce_hash'       : jce_hash,
                      'dl_opts'        : dl_opts,
                      'java_home'      : java_home,
                      'prefix'         : prefix,
                      'java_real_home' : java_real_home,
                      'jre_lib_sec'    : jre_lib_sec,
                    } ) %}
