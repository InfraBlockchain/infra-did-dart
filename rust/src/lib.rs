use std::ffi::{CStr, CString};
use std::os::raw::c_char;

fn get_str(rust_ptr: *const c_char) -> String {
    let c_str = unsafe { CStr::from_ptr(rust_ptr) };
    let result_string = match c_str.to_str() {
        Err(_) => "input string error",
        Ok(string) => string,
    };
    return String::from(result_string);
}

fn get_ptr(rust_string: &str) -> *mut c_char {
    CString::new(rust_string).unwrap().into_raw()
}

#[no_mangle]
pub extern "C" fn random_phrase(words_number: u32) -> *mut c_char {
    let phrase = infra_did::_random_phrase(words_number);
    get_ptr(&phrase)
}

#[no_mangle]
pub extern "C" fn substrate_address(suri: *const c_char, prefix: u8) -> *mut c_char {
    let address = infra_did::_substrate_address(get_str(suri), prefix);
    get_ptr(&address)
}

#[no_mangle]
pub extern "C" fn generate_ss58_did(network_id: *const c_char) -> *mut c_char {
    let result = infra_did::_generate_ss58_did(get_str(network_id));
    get_ptr(&result)
}

#[no_mangle]
pub extern "C" fn did_to_hex_public_key(did: *mut c_char) -> *mut c_char {
    let hex_public_key = infra_did::_did_to_hex_public_key(get_str(did));
    get_ptr(&hex_public_key)
}

#[no_mangle]
pub extern "C" fn ss58_address_to_did(
    address: *mut c_char,
    network_id: *mut c_char,
) -> *mut c_char {
    let did = infra_did::_ss58_address_to_did(get_str(address), get_str(network_id));
    get_ptr(&did)
}

#[no_mangle]
pub extern "C" fn rust_cstr_free(s: *mut c_char) {
    unsafe {
        if s.is_null() {
            return;
        }
        CString::from_raw(s)
    };
}
