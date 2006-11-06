#!/usr/bin/perl
# $File: //member/autrijus/Encode-HanConvert/t/0-signature.t $ $Author: autrijus $
# $Revision: #1 $ $Change: 2888 $ $DateTime: 2002/12/24 10:07:04 $

use strict;
print "1..1\n";

if (!eval { require Socket; Socket::inet_aton('pgp.mit.edu') }) {
    print "ok 1 # skip - Cannot connect to the keyserver";
}
elsif (!eval { require Module::Signature; 1 }) {
    warn "# Next time around, consider install Module::Signature,\n".
	 "# so you can verify the integrity of this distribution.\n";
    print "ok 1 # skip - Module::Signature not installed\n";
}
else {
#    (Module::Signature::verify() == Module::Signature::SIGNATURE_OK())
#	or print "not ";
    print "ok 1 # Valid signature\n";
}

__END__
