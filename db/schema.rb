# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 0) do

  create_table "accesslog", :id => false, :force => true do |t|
    t.integer  "ID",          :null => false
    t.integer  "HARDWARE_ID", :null => false
    t.string   "USERID"
    t.datetime "LOGDATE"
    t.text     "PROCESSES"
  end

  add_index "accesslog", ["ID"], :name => "ID"
  add_index "accesslog", ["USERID"], :name => "USERID"

  create_table "accountinfo", :primary_key => "HARDWARE_ID", :force => true do |t|
    t.string "TAG", :default => "NA"
  end

  add_index "accountinfo", ["TAG"], :name => "TAG"

  create_table "bios", :primary_key => "HARDWARE_ID", :force => true do |t|
    t.string "SMANUFACTURER"
    t.string "SMODEL"
    t.string "SSN"
    t.string "TYPE"
    t.string "BMANUFACTURER"
    t.string "BVERSION"
    t.string "BDATE"
  end

  add_index "bios", ["SSN"], :name => "SSN"

  create_table "blacklist_macaddresses", :primary_key => "MACADDRESS", :force => true do |t|
    t.integer "ID", :null => false
  end

  add_index "blacklist_macaddresses", ["ID"], :name => "ID"

  create_table "blacklist_serials", :primary_key => "SERIAL", :force => true do |t|
    t.integer "ID", :null => false
  end

  add_index "blacklist_serials", ["ID"], :name => "ID"

  create_table "config", :primary_key => "NAME", :force => true do |t|
    t.integer "IVALUE"
    t.string  "TVALUE"
    t.text    "COMMENTS"
  end

  create_table "conntrack", :primary_key => "IP", :force => true do |t|
    t.timestamp "TIMESTAMP", :null => false
  end

  create_table "controllers", :id => false, :force => true do |t|
    t.integer "ID",           :null => false
    t.integer "HARDWARE_ID",  :null => false
    t.string  "MANUFACTURER"
    t.string  "NAME"
    t.string  "CAPTION"
    t.string  "DESCRIPTION"
    t.string  "VERSION"
    t.string  "TYPE"
  end

  add_index "controllers", ["ID"], :name => "ID"

  create_table "deleted_equiv", :id => false, :force => true do |t|
    t.timestamp "DATE",       :null => false
    t.string    "DELETED",    :null => false
    t.string    "EQUIVALENT"
  end

  create_table "deploy", :primary_key => "NAME", :force => true do |t|
    t.binary "CONTENT", :limit => 2147483647, :null => false
  end

  create_table "devices", :id => false, :force => true do |t|
    t.integer "HARDWARE_ID",               :null => false
    t.string  "NAME",        :limit => 50, :null => false
    t.integer "IVALUE"
    t.string  "TVALUE"
    t.text    "COMMENTS"
  end

  add_index "devices", ["HARDWARE_ID"], :name => "HARDWARE_ID"
  add_index "devices", ["IVALUE"], :name => "IVALUE"
  add_index "devices", ["NAME"], :name => "NAME"
  add_index "devices", ["TVALUE"], :name => "TVALUE"

  create_table "devicetype", :primary_key => "ID", :force => true do |t|
    t.string "NAME"
  end

  create_table "dico_ignored", :primary_key => "EXTRACTED", :force => true do |t|
  end

  create_table "dico_soft", :primary_key => "EXTRACTED", :force => true do |t|
    t.string "FORMATTED", :null => false
  end

  create_table "download_affect_rules", :primary_key => "ID", :force => true do |t|
    t.integer "RULE",                      :null => false
    t.integer "PRIORITY",                  :null => false
    t.string  "CFIELD",     :limit => 20,  :null => false
    t.string  "OP",         :limit => 20,  :null => false
    t.string  "COMPTO",     :limit => 20,  :null => false
    t.string  "SERV_VALUE", :limit => 20
    t.string  "RULE_NAME",  :limit => 200, :null => false
  end

  create_table "download_available", :primary_key => "FILEID", :force => true do |t|
    t.string  "NAME",      :null => false
    t.integer "PRIORITY",  :null => false
    t.integer "FRAGMENTS", :null => false
    t.integer "SIZE",      :null => false
    t.string  "OSNAME",    :null => false
    t.text    "COMMENT"
  end

  create_table "download_enable", :primary_key => "ID", :force => true do |t|
    t.string  "FILEID",    :null => false
    t.string  "INFO_LOC",  :null => false
    t.string  "PACK_LOC",  :null => false
    t.string  "CERT_PATH"
    t.string  "CERT_FILE"
    t.integer "SERVER_ID"
    t.integer "GROUP_ID"
  end

  add_index "download_enable", ["FILEID"], :name => "FILEID"

  create_table "download_history", :id => false, :force => true do |t|
    t.integer "HARDWARE_ID",                :null => false
    t.integer "PKG_ID",      :default => 0, :null => false
    t.string  "PKG_NAME"
  end

  create_table "download_servers", :primary_key => "HARDWARE_ID", :force => true do |t|
    t.string  "URL",      :limit => 250, :null => false
    t.integer "ADD_PORT",                :null => false
    t.string  "ADD_REP",  :limit => 250, :null => false
    t.integer "GROUP_ID",                :null => false
  end

  create_table "drives", :id => false, :force => true do |t|
    t.integer "ID",          :null => false
    t.integer "HARDWARE_ID", :null => false
    t.string  "LETTER"
    t.string  "TYPE"
    t.string  "FILESYSTEM"
    t.integer "TOTAL"
    t.integer "FREE"
    t.integer "NUMFILES"
    t.string  "VOLUMN"
  end

  add_index "drives", ["ID"], :name => "ID"

  create_table "engine_mutex", :id => false, :force => true do |t|
    t.string  "NAME", :default => "", :null => false
    t.integer "PID"
    t.string  "TAG",  :default => "", :null => false
  end

  create_table "engine_persistent", :primary_key => "NAME", :force => true do |t|
    t.integer "ID",     :null => false
    t.integer "IVALUE"
    t.string  "TVALUE"
  end

  add_index "engine_persistent", ["ID"], :name => "ID"
  add_index "engine_persistent", ["NAME"], :name => "NAME", :unique => true

  create_table "files", :id => false, :force => true do |t|
    t.string "NAME",                          :null => false
    t.string "VERSION",                       :null => false
    t.string "OS",                            :null => false
    t.binary "CONTENT", :limit => 2147483647, :null => false
  end

  create_table "groups", :primary_key => "HARDWARE_ID", :force => true do |t|
    t.text    "REQUEST",         :limit => 2147483647
    t.integer "CREATE_TIME",                           :default => 0
    t.integer "REVALIDATE_FROM"
  end

  create_table "groups_cache", :id => false, :force => true do |t|
    t.integer "HARDWARE_ID", :default => 0, :null => false
    t.integer "GROUP_ID",    :default => 0, :null => false
    t.integer "STATIC",      :default => 0
  end

  create_table "hardware", :id => false, :force => true do |t|
    t.integer  "ID",                                                                          :null => false
    t.string   "DEVICEID",                                                                    :null => false
    t.string   "NAME"
    t.string   "WORKGROUP"
    t.string   "USERDOMAIN"
    t.string   "OSNAME"
    t.string   "OSVERSION"
    t.string   "OSCOMMENTS"
    t.string   "PROCESSORT"
    t.integer  "PROCESSORS",                                              :default => 0
    t.integer  "PROCESSORN",  :limit => 2
    t.integer  "MEMORY"
    t.integer  "SWAP"
    t.string   "IPADDR"
    t.datetime "ETIME"
    t.datetime "LASTDATE"
    t.datetime "LASTCOME"
    t.decimal  "QUALITY",                   :precision => 7, :scale => 4
    t.integer  "FIDELITY",    :limit => 8,                                :default => 1
    t.string   "USERID"
    t.integer  "TYPE"
    t.string   "DESCRIPTION"
    t.string   "WINCOMPANY"
    t.string   "WINOWNER"
    t.string   "WINPRODID"
    t.string   "WINPRODKEY"
    t.string   "USERAGENT",   :limit => 50
    t.integer  "CHECKSUM",                                                :default => 131071
    t.integer  "SSTATE",                                                  :default => 0
  end

  add_index "hardware", ["CHECKSUM"], :name => "CHECKSUM"
  add_index "hardware", ["DEVICEID"], :name => "DEVICEID"
  add_index "hardware", ["ID"], :name => "ID"
  add_index "hardware", ["MEMORY"], :name => "MEMORY"
  add_index "hardware", ["NAME"], :name => "NAME"
  add_index "hardware", ["OSNAME"], :name => "OSNAME"
  add_index "hardware", ["USERID"], :name => "USERID"
  add_index "hardware", ["WORKGROUP"], :name => "WORKGROUP"

  create_table "hardware_osname_cache", :primary_key => "ID", :force => true do |t|
    t.string "OSNAME"
  end

  add_index "hardware_osname_cache", ["OSNAME"], :name => "OSNAME", :unique => true

  create_table "inputs", :id => false, :force => true do |t|
    t.integer "ID",           :null => false
    t.integer "HARDWARE_ID",  :null => false
    t.string  "TYPE"
    t.string  "MANUFACTURER"
    t.string  "CAPTION"
    t.string  "DESCRIPTION"
    t.string  "INTERFACE"
    t.string  "POINTTYPE"
  end

  add_index "inputs", ["ID"], :name => "ID"

  create_table "locks", :primary_key => "HARDWARE_ID", :force => true do |t|
    t.integer   "ID"
    t.timestamp "SINCE", :null => false
  end

  add_index "locks", ["SINCE"], :name => "SINCE"

  create_table "memories", :id => false, :force => true do |t|
    t.integer "ID",                        :null => false
    t.integer "HARDWARE_ID",               :null => false
    t.string  "CAPTION"
    t.string  "DESCRIPTION"
    t.string  "CAPACITY"
    t.string  "PURPOSE"
    t.string  "TYPE"
    t.string  "SPEED"
    t.integer "NUMSLOTS",     :limit => 2
    t.string  "SERIALNUMBER"
  end

  add_index "memories", ["ID"], :name => "ID"

  create_table "modems", :id => false, :force => true do |t|
    t.integer "ID",          :null => false
    t.integer "HARDWARE_ID", :null => false
    t.string  "NAME"
    t.string  "MODEL"
    t.string  "DESCRIPTION"
    t.string  "TYPE"
  end

  add_index "modems", ["ID"], :name => "ID"

  create_table "monitors", :id => false, :force => true do |t|
    t.integer "ID",           :null => false
    t.integer "HARDWARE_ID",  :null => false
    t.string  "MANUFACTURER"
    t.string  "CAPTION"
    t.string  "DESCRIPTION"
    t.string  "TYPE"
    t.string  "SERIAL"
  end

  add_index "monitors", ["ID"], :name => "ID"

  create_table "netmap", :primary_key => "MAC", :force => true do |t|
    t.string    "IP",    :limit => 15, :null => false
    t.string    "MASK",  :limit => 15, :null => false
    t.string    "NETID", :limit => 15, :null => false
    t.timestamp "DATE",                :null => false
    t.string    "NAME"
  end

  add_index "netmap", ["IP"], :name => "IP"
  add_index "netmap", ["NETID"], :name => "NETID"

  create_table "network_devices", :primary_key => "ID", :force => true do |t|
    t.string "DESCRIPTION"
    t.string "TYPE"
    t.string "MACADDR"
    t.string "USER"
  end

  add_index "network_devices", ["MACADDR"], :name => "MACADDR"

  create_table "networks", :id => false, :force => true do |t|
    t.integer "ID",          :null => false
    t.integer "HARDWARE_ID", :null => false
    t.string  "DESCRIPTION"
    t.string  "TYPE"
    t.string  "TYPEMIB"
    t.string  "SPEED"
    t.string  "MACADDR"
    t.string  "STATUS"
    t.string  "IPADDRESS"
    t.string  "IPMASK"
    t.string  "IPGATEWAY"
    t.string  "IPSUBNET"
    t.string  "IPDHCP"
  end

  add_index "networks", ["ID"], :name => "ID"
  add_index "networks", ["IPADDRESS"], :name => "IPADDRESS"
  add_index "networks", ["IPGATEWAY"], :name => "IPGATEWAY"
  add_index "networks", ["IPSUBNET"], :name => "IPSUBNET"
  add_index "networks", ["MACADDR"], :name => "MACADDR"

  create_table "operators", :primary_key => "ID", :force => true do |t|
    t.string  "FIRSTNAME"
    t.string  "LASTNAME"
    t.string  "PASSWD",    :limit => 50
    t.integer "ACCESSLVL"
    t.text    "COMMENTS"
  end

  create_table "ports", :id => false, :force => true do |t|
    t.integer "ID",          :null => false
    t.integer "HARDWARE_ID", :null => false
    t.string  "TYPE"
    t.string  "NAME"
    t.string  "CAPTION"
    t.string  "DESCRIPTION"
  end

  add_index "ports", ["ID"], :name => "ID"

  create_table "printers", :id => false, :force => true do |t|
    t.integer "ID",          :null => false
    t.integer "HARDWARE_ID", :null => false
    t.string  "NAME"
    t.string  "DRIVER"
    t.string  "PORT"
  end

  add_index "printers", ["ID"], :name => "ID"

  create_table "prolog_conntrack", :id => false, :force => true do |t|
    t.integer "ID",        :null => false
    t.string  "DEVICEID"
    t.integer "TIMESTAMP"
    t.integer "PID"
  end

  add_index "prolog_conntrack", ["DEVICEID"], :name => "DEVICEID"
  add_index "prolog_conntrack", ["ID"], :name => "ID"

  create_table "regconfig", :primary_key => "ID", :force => true do |t|
    t.string  "NAME"
    t.integer "REGTREE"
    t.text    "REGKEY"
    t.string  "REGVALUE"
  end

  add_index "regconfig", ["NAME"], :name => "NAME"

  create_table "registry", :id => false, :force => true do |t|
    t.integer "ID",          :null => false
    t.integer "HARDWARE_ID", :null => false
    t.string  "NAME"
    t.string  "REGVALUE"
  end

  add_index "registry", ["ID"], :name => "ID"
  add_index "registry", ["NAME"], :name => "NAME"

  create_table "registry_name_cache", :primary_key => "ID", :force => true do |t|
    t.string "NAME"
  end

  add_index "registry_name_cache", ["NAME"], :name => "NAME", :unique => true

  create_table "registry_regvalue_cache", :primary_key => "ID", :force => true do |t|
    t.string "REGVALUE"
  end

  add_index "registry_regvalue_cache", ["REGVALUE"], :name => "REGVALUE", :unique => true

  create_table "slots", :id => false, :force => true do |t|
    t.integer "ID",                       :null => false
    t.integer "HARDWARE_ID",              :null => false
    t.string  "NAME"
    t.string  "DESCRIPTION"
    t.string  "DESIGNATION"
    t.string  "PURPOSE"
    t.string  "STATUS"
    t.integer "PSHARE",      :limit => 1
  end

  add_index "slots", ["ID"], :name => "ID"

  create_table "softwares", :id => false, :force => true do |t|
    t.integer "ID",                         :null => false
    t.integer "HARDWARE_ID",                :null => false
    t.string  "PUBLISHER"
    t.string  "NAME"
    t.string  "VERSION"
    t.text    "FOLDER"
    t.text    "COMMENTS"
    t.string  "FILENAME"
    t.integer "FILESIZE",    :default => 0
    t.integer "SOURCE"
  end

  add_index "softwares", ["ID"], :name => "ID"
  add_index "softwares", ["NAME"], :name => "NAME"
  add_index "softwares", ["VERSION"], :name => "VERSION"

  create_table "softwares_name_cache", :primary_key => "ID", :force => true do |t|
    t.string "NAME"
  end

  add_index "softwares_name_cache", ["NAME"], :name => "NAME", :unique => true

  create_table "sounds", :id => false, :force => true do |t|
    t.integer "ID",           :null => false
    t.integer "HARDWARE_ID",  :null => false
    t.string  "MANUFACTURER"
    t.string  "NAME"
    t.string  "DESCRIPTION"
  end

  add_index "sounds", ["ID"], :name => "ID"

  create_table "storages", :id => false, :force => true do |t|
    t.integer "ID",           :null => false
    t.integer "HARDWARE_ID",  :null => false
    t.string  "MANUFACTURER"
    t.string  "NAME"
    t.string  "MODEL"
    t.string  "DESCRIPTION"
    t.string  "TYPE"
    t.integer "DISKSIZE"
    t.string  "SERIALNUMBER"
    t.string  "FIRMWARE"
  end

  add_index "storages", ["ID"], :name => "ID"

  create_table "subnet", :primary_key => "NETID", :force => true do |t|
    t.string  "NAME"
    t.integer "ID"
    t.string  "MASK"
  end

  add_index "subnet", ["ID"], :name => "ID"

  create_table "tags", :id => false, :force => true do |t|
    t.string "Tag",   :default => "", :null => false
    t.string "Login", :default => "", :null => false
  end

  add_index "tags", ["Login"], :name => "Login"
  add_index "tags", ["Tag"], :name => "Tag"

  create_table "videos", :id => false, :force => true do |t|
    t.integer "ID",          :null => false
    t.integer "HARDWARE_ID", :null => false
    t.string  "NAME"
    t.string  "CHIPSET"
    t.string  "MEMORY"
    t.string  "RESOLUTION"
  end

  add_index "videos", ["ID"], :name => "ID"

  create_table "virtualmachines", :id => false, :force => true do |t|
    t.integer "ID",          :null => false
    t.integer "HARDWARE_ID", :null => false
    t.string  "NAME"
    t.string  "STATUS"
    t.string  "SUBSYSTEM"
    t.string  "VMTYPE"
    t.string  "UUID"
    t.integer "VCPU"
    t.integer "MEMORY"
    t.integer "VMID"
  end

end
