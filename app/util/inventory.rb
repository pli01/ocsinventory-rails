def gb_to_kb(val_in_gigs)
  return nil if nil_or_empty(val_in_gigs)
  return val_in_gigs.to_i * 1024 * 1024
end

def kb_to_gb(val_in_kb)
  return nil if nil_or_empty(val_in_kb)
  return val_in_kb.to_i / 1024 / 1024
end
def mb_to_kb(val_in_mb)
  return nil if nil_or_empty(val_in_mb)
  return val_in_mb.to_i * 1024
end

def kb_to_mb(val_in_kb)
  return nil if nil_or_empty(val_in_kb)
  return val_in_kb.to_i / 1024
end

def nil_or_empty(val)
  if val.nil? or (val.kind_of?(String) and val.empty?)
    return true
  else
    return false
  end
end
