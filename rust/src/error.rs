use std::ffi::CString;
use std::os::raw::c_int;

use std::cell::RefCell;
thread_local! {
    pub static LAST_ERROR: RefCell<Option<(i32, CString)>> = RefCell::new(None);
}

#[derive(thiserror::Error, Debug)]
pub enum Error {
    #[error(transparent)]
    Null(#[from] std::ffi::NulError),
    #[error(transparent)]
    Utf8(#[from] std::str::Utf8Error),
    #[error(transparent)]
    Borrow(#[from] std::cell::BorrowError),
    #[error(transparent)]
    IO(#[from] std::io::Error),
    #[error("Unable to generate DID")]
    UnableToGenerateDID,
    #[error("Unknown DID method")]
    UnknownDIDMethod,
    #[error("Unable to get verification method")]
    UnableToGetVerificationMethod,
    #[error("Unknown proof format: {0}")]
    UnknownProofFormat(String),

    #[doc(hidden)]
    #[error("")]
    __Nonexhaustive,
}

impl Error {
    pub fn stash(self) {
        LAST_ERROR.with(|stash| {
            stash.replace(Some((
                self.get_code(),
                CString::new(self.to_string()).unwrap(),
            )))
        });
    }

    fn get_code(&self) -> c_int {
        // TODO: try to give each individual error its own number
        match self {
            Error::Null(_) => 1,
            Error::Utf8(_) => 2,
            _ => -1,
        }
    }
}
