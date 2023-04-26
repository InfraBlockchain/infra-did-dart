use error::Error;
use infra_did::did::AddressType;
use infra_did::resolver::resolver::InfraDIDResolver;
use ssi_dids::did_resolve::{DIDResolver, ResolutionInputMetadata};

use std::ffi::{CStr, CString};
use std::os::raw::c_char;
use std::ptr;

pub mod error;
pub mod runtime;

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

fn ccchar_or_error(result: Result<*const c_char, Error>) -> *const c_char {
    // On success, pass through the string. On error, save the error for retrieval using
    // didkit_error_message, and return NULL.
    match result {
        Ok(ccchar) => ccchar,
        Err(error) => {
            error.stash();
            ptr::null()
        }
    }
}

#[no_mangle]
pub extern "C" fn infra_generate_ss58_did(network_id: *const c_char) -> *const c_char {
    ccchar_or_error(generate_ss58_did(network_id))
}

fn generate_ss58_did(network_id: *const c_char) -> Result<*const c_char, Error> {
    let result = infra_did::did::generate_ss58_did(get_str(network_id), AddressType::Ed25519);
    Ok(CString::new(result)?.into_raw())
}

#[no_mangle]
pub extern "C" fn infra_generate_ss58_did_from_phrase(
    suri: *const c_char,
    network_id: *const c_char,
) -> *const c_char {
    ccchar_or_error(generate_ss58_did_from_phrase(suri, network_id))
}

fn generate_ss58_did_from_phrase(
    suri: *const c_char,
    network_id: *const c_char,
) -> Result<*const c_char, Error> {
    let result = infra_did::did::generate_ss58_did_from_phrase(
        get_str(suri),
        get_str(network_id),
        AddressType::Ed25519,
    );
    Ok(CString::new(result)?.into_raw())
}

#[no_mangle]
pub extern "C" fn infra_did_to_hex_public_key(did: *const c_char) -> *const c_char {
    ccchar_or_error(did_to_hex_public_key(did))
}

fn did_to_hex_public_key(did: *const c_char) -> Result<*const c_char, Error> {
    let hex_public_key = infra_did::did::did_to_hex_public_key(get_str(did), AddressType::Ed25519);
    Ok(CString::new(hex_public_key)?.into_raw())
}

#[no_mangle]
pub extern "C" fn ss58_address_to_did(
    address: *mut c_char,
    network_id: *mut c_char,
) -> *mut c_char {
    let did = infra_did::did::ss58_address_to_did(get_str(address), get_str(network_id));
    get_ptr(&did.as_str())
}

#[no_mangle]
pub extern "C" fn resolve(did: *const c_char) -> *mut c_char {
    let rt = runtime::get().unwrap();
    let resolver = InfraDIDResolver::default();
    let (_, doc, _) =
        rt.block_on(resolver.resolve(get_str(did).as_str(), &ResolutionInputMetadata::default()));

    get_ptr(serde_json::to_string_pretty(&doc).unwrap().as_str())
}

#[no_mangle]
pub extern "C" fn issue_credential(
    did: *const c_char,
    credential_json: *const c_char,
    hex_private_key: *const c_char,
) -> *mut c_char {
    let rt = runtime::get().unwrap();

    let credential = rt.block_on(infra_did::verifiable::credential::issue_credential(
        get_str(did),
        get_str(hex_private_key),
        get_str(credential_json),
    ));

    get_ptr(credential.as_str())
}

#[no_mangle]
pub extern "C" fn verify_credential(credential_json: *const c_char) -> *mut c_char {
    let rt = runtime::get().unwrap();

    let verify = rt.block_on(infra_did::verifiable::credential::verify_credential(
        get_str(credential_json),
    ));

    get_ptr(verify.as_str())
}

#[no_mangle]
pub extern "C" fn issue_presentation(
    did: *const c_char,
    credential_json: *const c_char,
    hex_private_key: *const c_char,
) -> *mut c_char {
    let rt = runtime::get().unwrap();

    let presentation = rt.block_on(infra_did::verifiable::presentation::issue_presentation(
        get_str(did),
        get_str(hex_private_key),
        get_str(credential_json),
    ));

    get_ptr(presentation.as_str())
}

#[no_mangle]
pub extern "C" fn verify_presentation(presentation_json: *const c_char) -> *mut c_char {
    let rt = runtime::get().unwrap();

    let verify = rt.block_on(infra_did::verifiable::presentation::verify_presentation(
        get_str(presentation_json),
    ));

    get_ptr(verify.as_str())
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
