" Vim syntax file
" Language:	CMU Pronunciation Dictionary
" Filenames:    cmudict
" Maintainer:	Reece H. Dunn <msclrhd@gmail.com>
" Last Change:	2015 Feb 25

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

let head = " ".getline(1)." ".getline(2)." ".getline(3)." ".getline(4)." ".getline(5)." "

let accent = matchstr(head, '\saccent=\zs[a-zA-Z0-9_\-]\+\ze\s')
if accent == 'en-US' || accent == 'en-GB-x-rp'
  let b:cmudict_accent = accent
elseif !exists("b:cmudict_accent")
  let b:cmudict_accent = 'en-US'
endif

let phoneset = matchstr(head, '\sphoneset=\zs[a-zA-Z0-9_\-]\+\ze\s')
if phoneset == 'arpabet' || phoneset == 'cepstral' || phoneset == 'cmu' || phoneset == 'festvox' || phoneset == 'timit'
  let b:cmudict_phoneset = phoneset
elseif !exists("b:cmudict_phoneset")
  let b:cmudict_phoneset = 'cmu'
endif

let format = matchstr(head, '\sformat=\zs[a-zA-Z0-9_\-]\+\ze\s')
if format == 'cmudict' || format == 'cmudict-weide' || format == 'cmudict-new'
  let b:cmudict_format = format
elseif !exists("b:cmudict_format")
  let b:cmudict_format = "cmudict"
endif

" phones ----------------------------------------------------------------------

syn match	cmudictPhoneStress contained	"[0-9]"

if b:cmudict_accent == 'en-US'
  if b:cmudict_phoneset == 'arpabet'
    syn match	cmudictPhone contained	"\<A[AEHOWY][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<E[HRY][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<I[HY][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<O[WY][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<U[HWX][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<[BDFGKLMNPQRSTVWYZ]\>"
    syn match	cmudictPhone contained	"\<[CDHJSTZ]H\>"
    syn match	cmudictPhone contained	"\<AXR\=0\=\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<IX0\=\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<[DN]X\>"
    syn match	cmudictPhone contained	"\<E[LMN]\>"
    syn match	cmudictPhone contained	"\<E\=NG\>"
    syn match	cmudictPhone contained	"\<H[VW]\>"
    syn match	cmudictPhone contained	"-"
  elseif b:cmudict_phoneset == 'cepstral'
    syn match	cmudictPhone contained	"\<a[aehowy][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<e[hry][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<i[h]\=[0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<o[wy][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<u[hw][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<[bdfghjklmnprstvwz]\>"
    syn match	cmudictPhone contained	"\<[cdjstz]h\>"
    syn match	cmudictPhone contained	"\<ng\>"
  elseif b:cmudict_phoneset == 'cmu'
    syn match	cmudictPhone contained	"\<A[AEHOWY][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<E[HRY][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<I[HY][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<O[WY][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<U[HW][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<[BDFGKLMNPRSTVWYZ]\>"
    syn match	cmudictPhone contained	"\<[CDHJSTZ]H\>"
    syn match	cmudictPhone contained	"\<NG\>"
  elseif b:cmudict_phoneset == 'festvox'
    syn match	cmudictPhone contained	"\<a[aehowy][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<e[hry][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<i[hy][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<o[wy][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<u[hw][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<[bdfgklmnprstvwyz]\>"
    syn match	cmudictPhone contained	"\<[cdhjstz]h\>"
    syn match	cmudictPhone contained	"\<ax0\=\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<ng\>"
  elseif b:cmudict_phoneset == 'timit'
    syn match	cmudictPhone contained	"\<a[aehowy][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<e[hry][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<i[hy][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<o[wy][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<u[hwx][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<[bdfgklmnpqrstvwyz]\>"
    syn match	cmudictPhone contained	"\<[cdhjstz]h\>"
    syn match	cmudictPhone contained	"\<axr\=0\=\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<ix0\=\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<[dn]x\>"
    syn match	cmudictPhone contained	"\<e[lmn]\>"
    syn match	cmudictPhone contained	"\<e\=ng\>"
    syn match	cmudictPhone contained	"\<[pbtdkg]cl\>"
    syn match	cmudictPhone contained	"\<h[vw]\>"
  endif
elseif b:cmudict_accent == 'en-GB-x-rp'
  if b:cmudict_phoneset == 'arpabet'
    syn match	cmudictPhone contained	"\<A[AEHOWY][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<E[AHRY][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<I[AHY]\=[0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<O[AHWY][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<U[AHWX]\=[0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<[BDFGKLMNPQRSTVWYZ]\>"
    syn match	cmudictPhone contained	"\<[CDHJSTZ]H\>"
    syn match	cmudictPhone contained	"\<AXR\=0\=\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<IX0\=\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<[DN]X\>"
    syn match	cmudictPhone contained	"\<E[LMN]\>"
    syn match	cmudictPhone contained	"\<E\=NG\>"
    syn match	cmudictPhone contained	"\<H[VW]\>"
    syn match	cmudictPhone contained	"-"
  elseif b:cmudict_phoneset == 'cepstral'
    syn match	cmudictPhone contained	"\<a[ehowy]\=[0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<e[@hry][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<i[@h]\=[0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<o[awy][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<u[hw][0-2]\>" contains=cmudictPhoneStress
    syn match	cmudictPhone contained	"\<[bdfghjklmnprstvwz]\>"
    syn match	cmudictPhone contained	"\<[cdjstz]h\>"
    syn match	cmudictPhone contained	"\<ng\>"
  endif
endif

" entry -----------------------------------------------------------------------

syn match	cmudictEntryLine				"^[^A-Za-z0-9]\=[^ \t(#]\+" contains=@cmudictEntryOrError nextgroup=@cmudictPronunciationOrVariant

syn cluster	cmudictEntryOrError				contains=cmudictEntryError,cmudictEntry
syn match	cmudictEntryError contained			"[^ \t]\+"

if b:cmudict_format == 'cmudict' || b:cmudict_format == 'cmudict-weide'
  syn match	cmudictEntry contained				"^[^A-Za-z0-9]\=[^a-z \t(#]\+"
elseif b:cmudict_format == 'cmudict-new'
  syn match	cmudictEntry contained				"^[^A-Za-z0-9]\=[^A-Z \t(#]\+"
end

syn match	cmudictVariant contained			"[^()]\+"
syn region	cmudictEntryVariant contained			start='(' end=')' contains=cmudictVariant nextgroup=cmudictPronunciationErrorFirst

syn cluster	cmudictPronunciationOrVariant			contains=cmudictPronunciationErrorFirst,cmudictEntryVariant

" pronunciation ---------------------------------------------------------------

syn cluster	cmudictPronunciationOrComment			contains=cmudictCommentEntry,cmudictPronunciationError

syn match	cmudictPhoneAndStress contained			"[^ \t]\+" contains=cmudictPhone

syn match	cmudictPronunciationErrorFirst contained	"[ \t]\+[^ \t#]\+" contains=cmudictPronunciationFirst,cmudictPhoneAndStress nextgroup=@cmudictPronunciationOrComment
syn match	cmudictPronunciationErrorFirst contained	"[ \t]\+$"
if b:cmudict_format == 'cmudict' || b:cmudict_format == 'cmudict-weide'
  syn match	cmudictPronunciationFirst contained		"  [^ \t#]\+" contains=cmudictPhoneAndStress
elseif b:cmudict_format == 'cmudict-new'
  syn match	cmudictPronunciationFirst contained		" [^ \t#]\+" contains=cmudictPhoneAndStress
endif

syn match	cmudictPronunciationError contained		"[ \t]\+[^ \t#]\+" contains=cmudictPronunciation,cmudictPhoneAndStress nextgroup=@cmudictPronunciationOrComment
syn match	cmudictPronunciationError contained		"[ \t]\+$"
syn match	cmudictPronunciation contained			" [^ \t#]\+" contains=cmudictPhoneAndStress

" comments --------------------------------------------------------------------

syn match	cmudictMetadataOperator contained	"="
syn match	cmudictMetadataKey contained		" [a-zA-Z0-9\_\-]\+=" contains=cmudictMetadataOperator

syn match	cmudictMetadataPreProc contained	"@@"
syn match	cmudictMetadata contained		"@@.\+@@" contains=cmudictMetadataPreProc,cmudictMetadataKey

if b:cmudict_format == 'cmudict' || b:cmudict_format == 'cmudict-new'
  syn region	cmudictCommentLine			start='^;;;' end='$' contains=cmudictMetadata
  syn region	cmudictCommentError			start='^##' end='$'
elseif b:cmudict_format == 'cmudict-weide'
  syn region	cmudictCommentError			start='^;;;' end='$'
  syn region	cmudictCommentLine			start='^##' end='$' contains=cmudictMetadata
endif

syn region	cmudictCommentEntry contained		start='\s\+#' end='$' contains=cmudictMetadata

" syntax highlight definitions ------------------------------------------------

hi def link cmudictCommentEntry			cmudictComment
hi def link cmudictCommentLine			cmudictComment
hi def link cmudictCommentError			Error
hi def link cmudictComment			Comment
hi def link cmudictEntryError			Error
hi def link cmudictEntry			Identifier
hi def link cmudictEntryVariant			None
hi def link cmudictVariant			Constant
hi def link cmudictPronunciationErrorFirst	Error
hi def link cmudictPronunciationError		Error
hi def link cmudictPhoneStress			Constant
hi def link cmudictPhoneAndStress		Error
hi def link cmudictPhone			None
hi def link cmudictMetadataOperator		None
hi def link cmudictMetadataPreProc		PreProc
hi def link cmudictMetadataKey			Type
hi def link cmudictMetadata			Constant

let b:current_syntax = "cmudict"
" vim: ts=8
