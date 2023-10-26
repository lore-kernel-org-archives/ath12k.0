Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86E6C27C46
	for <ath12k@archiver.kernel.org>; Thu, 26 Oct 2023 22:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=4uviZknp9XCIhRtFk65H94X5seCd2KKvHSwSSrAqppQ=; b=IZ5qeFHB3ffSBm
	noYLG/76eCjD9ZJ2c6P1AD9/sp9VmFNW83Foh4ODDtgcqbCKF6CNcGygFG1oboiUyJcCNQm4IwBiK
	pG9/ms6De0eaeO51gGvB4/vrjSjF/KOMEgA3TIJ50AIrqtRaLzAsaZ/m8MA5Li50v+BZ5O2n3YJ9a
	tQxY0W75p4Jvdo2ymzVxCo+umSlZAOtvp43KJjvwEU6kDwKAnbIXCQwjYkQfSDggM99SsVVs2xAa9
	2ZwRy4Egf+iYVRg6HmeWbtUoJRzbYqI++QylCym/EqmdIA5UpWYXHZR7SdeCjs9LdiDmo0X4kjw6b
	wxu40HxHVbY0/adyZlFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw8Qq-00FDSI-0o
	for ath12k@archiver.kernel.org;
	Thu, 26 Oct 2023 22:02:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw8Qm-00FDRF-0q;
	Thu, 26 Oct 2023 22:02:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 98C59611F5;
	Thu, 26 Oct 2023 22:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA825C433C8;
	Thu, 26 Oct 2023 22:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698357739;
	bh=v+OwCPCkufkei1OkZ0IK7OBnZIyQ/k2CAv18GMp5ECU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=n78Q8MakmY6S/n69Ux03t5U9WUOopOaUt6nDKsoVSQ7EwfcRn4luVSqYv4gLpBVda
	 DrKIa1h7StitkkRiy4EE1uZV9ATfMIOdG1LH7fry+wsdgg7K0o8FZyDL0K8lk1O1cV
	 t8tCIDdZoIwRLbl3rrSWnJxwraxqaVw/Gir1EFKFtZzjPUiogtA2KbpA/GPnWVFE75
	 vFVT+iMPgWVgs1VDlgs/RGVAxhV9lLfl6E7IGtKj2DkZ2fYHoCBfSJQ4yR5Uj+vsRQ
	 d1R5iC/0IUud8PHKgG7cpchJEmznQsL2QPpfVhJQJ4HgyUhDYk2WkITTtzPLdgWmQ9
	 XkdZf2GExUM1w==
Date: Thu, 26 Oct 2023 17:02:16 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, ath10k@lists.infradead.org,
	ath11k@lists.infradead.org, ath12k@lists.infradead.org,
	intel-wired-lan@lists.osuosl.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org,
	Netdev <netdev@vger.kernel.org>
Subject: Re: [PATCH v2 03/13] PCI/ASPM: Disable ASPM when driver requests it
Message-ID: <20231026220216.GA1752508@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a434d9f-48ec-cfe5-900-8923361798a9@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_150220_382721_C048918B 
X-CRM114-Status: GOOD (  43.35  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBPY3QgMTYsIDIwMjMgYXQgMDU6Mjc6MzdQTSArMDMwMCwgSWxwbyBKw6RydmluZW4g
d3JvdGU6Cj4gT24gRnJpLCAxMyBPY3QgMjAyMywgQmpvcm4gSGVsZ2FhcyB3cm90ZToKPiA+IE9u
IFRodSwgT2N0IDEyLCAyMDIzIGF0IDAxOjU2OjE2UE0gKzAzMDAsIElscG8gSsOkcnZpbmVuIHdy
b3RlOgo+ID4gPiBPbiBXZWQsIDExIE9jdCAyMDIzLCBCam9ybiBIZWxnYWFzIHdyb3RlOgo+ID4g
PiA+IE9uIE1vbiwgU2VwIDE4LCAyMDIzIGF0IDA0OjEwOjUzUE0gKzAzMDAsIElscG8gSsOkcnZp
bmVuIHdyb3RlOgo+ID4gPiA+ID4gUENJIGNvcmUvQVNQTSBzZXJ2aWNlIGRyaXZlciBhbGxvd3Mg
Y29udHJvbGxpbmcgQVNQTSBzdGF0ZQo+ID4gPiA+ID4gdGhyb3VnaCBwY2lfZGlzYWJsZV9saW5r
X3N0YXRlKCkgYW5kIHBjaV9lbmFibGVfbGlua19zdGF0ZSgpCj4gPiA+ID4gPiBBUEkuIEl0IHdh
cyBkZWNpZGVkIGVhcmxpZXIgKHNlZSB0aGUgTGluayBiZWxvdyksIHRvIG5vdAo+ID4gPiA+ID4g
YWxsb3cgQVNQTSBjaGFuZ2VzIHdoZW4gT1MgZG9lcyBub3QgaGF2ZSBjb250cm9sIG92ZXIgaXQg
YnV0Cj4gPiA+ID4gPiBvbmx5IGxvZyBhIHdhcm5pbmcgYWJvdXQgdGhlIHByb2JsZW0gKGNvbW1p
dCAyYWRkMGVjMTRjMjUKPiA+ID4gPiA+ICgiUENJL0FTUE06IFdhcm4gd2hlbiBkcml2ZXIgYXNr
cyB0byBkaXNhYmxlIEFTUE0sIGJ1dCB3ZQo+ID4gPiA+ID4gY2FuJ3QgZG8gaXQiKSkuIFNpbWls
YXJseSwgaWYgQVNQTSBpcyBub3QgZW5hYmxlZCB0aHJvdWdoCj4gPiA+ID4gPiBjb25maWcsIEFT
UE0gY2Fubm90IGJlIGRpc2FibGVkLgo+ID4gPiAuLi4KPiA+IAo+ID4gPiA+IFRoaXMgZGlzYWJs
ZXMgKmFsbCogQVNQTSBzdGF0ZXMsIHVubGlrZSB0aGUgdmVyc2lvbiB3aGVuCj4gPiA+ID4gQ09O
RklHX1BDSUVBU1BNIGlzIGVuYWJsZWQuICBJIHN1cHBvc2UgdGhlcmUncyBhIHJlYXNvbiwgYW5k
Cj4gPiA+ID4gbWF5YmUgYSBjb21tZW50IGNvdWxkIGVsYWJvcmF0ZSBvbiBpdD8KPiA+ID4gPgo+
ID4gPiA+IFdoZW4gQ09ORklHX1BDSUVBU1BNIGlzIG5vdCBlbmFibGVkLCBJIGRvbid0IHRoaW5r
IHdlIGFjdGl2ZWx5Cj4gPiA+ID4gKmRpc2FibGUqIEFTUE0gaW4gdGhlIGhhcmR3YXJlOyB3ZSBq
dXN0IGxlYXZlIGl0IGFzLWlzLCBzbwo+ID4gPiA+IGZpcm13YXJlIG1pZ2h0IGhhdmUgbGVmdCBp
dCBlbmFibGVkLgo+ID4gPiAKPiA+ID4gVGhpcyB3aG9sZSB0cmlja2VyeSBpcyBpbnRlbmRlZCBm
b3IgZHJpdmVycyB0aGF0IGRvIG5vdCB3YW50IHRvCj4gPiA+IGhhdmUgQVNQTSBiZWNhdXNlIHRo
ZSBkZXZpY2VzIGFyZSBicm9rZW4gd2l0aCBpdC4gU28gbGVhdmluZyBpdAo+ID4gPiBhcy1pcyBp
cyBub3QgcmVhbGx5IGFuIG9wdGlvbiAoYXMgZGVtb25zdHJhdGVkIGJ5IHRoZSBjdXN0b20KPiA+
ID4gd29ya2Fyb3VuZHMpLgo+ID4gCj4gPiBSaWdodC4KPiA+IAo+ID4gPiA+IENvbmNlcHR1YWxs
eSBpdCBzZWVtcyBsaWtlIHRoZSBMTktDVEwgdXBkYXRlcyBoZXJlIHNob3VsZCBiZQo+ID4gPiA+
IHRoZSBzYW1lIHdoZXRoZXIgQ09ORklHX1BDSUVBU1BNIGlzIGVuYWJsZWQgb3Igbm90IChzdWJq
ZWN0IHRvCj4gPiA+ID4gdGhlIHF1ZXN0aW9uIGFib3ZlKS4KPiA+ID4gPiAKPiA+ID4gPiBXaGVu
IENPTkZJR19QQ0lFQVNQTSBpcyBlbmFibGVkLCB3ZSBtaWdodCBuZWVkIHRvIGRvIG1vcmUKPiA+
ID4gPiBzdHVmZiwgYnV0IGl0IHNlZW1zIGxpa2UgdGhlIGNvcmUgc2hvdWxkIGJlIHRoZSBzYW1l
Lgo+ID4gPiAKPiA+ID4gU28geW91IHRoaW5rIGl0J3Mgc2FmZXIgdG8gcGFydGlhbGx5IGRpc2Fi
bGUgQVNQTSAoYXMgcGVyCj4gPiA+IGRyaXZlcidzIHJlcXVlc3QpIHJhdGhlciB0aGFuIGRpc2Fi
bGUgaXQgY29tcGxldGVseT8gSSBnb3QgdGhlCj4gPiA+IGltcHJlc3Npb24gdGhhdCB0aGUgbGF0
dGVyIG1pZ2h0IGJlIHNhZmVyIGZyb20gd2hhdCBSYWZhZWwgc2FpZAo+ID4gPiBlYXJsaWVyIGJ1
dCBJIHN1cHBvc2UgSSBtaWdodCBoYXZlIG1pc2ludGVycHJldGVkIGhpbSBzaW5jZSBoZQo+ID4g
PiBkaWRuJ3QgZXhhY3RseSBzYXkgdGhhdCBpdCBtaWdodCBiZSBzYWZlciB0byBfY29tcGxldGVs
eV8KPiA+ID4gZGlzYWJsZSBpdC4KPiA+IAo+ID4gTXkgcXVlc3Rpb24gaXMgd2hldGhlciB0aGUg
c3RhdGUgb2YgdGhlIGRldmljZSBzaG91bGQgZGVwZW5kIG9uCj4gPiBDT05GSUdfUENJRUFTUE0u
ICBJZiB0aGUgZHJpdmVyIGRvZXMgdGhpczoKPiA+IAo+ID4gICBwY2lfZGlzYWJsZV9saW5rX3N0
YXRlKFBDSUVfTElOS19TVEFURV9MMFMpCj4gPiAKPiA+IGRvIHdlIHdhbnQgdG8gbGVhdmUgTDEg
ZW5hYmxlZCB3aGVuIENPTkZJR19QQ0lFQVNQTT15IGJ1dCBkaXNhYmxlIEwxCj4gPiB3aGVuIENP
TkZJR19QQ0lFQVNQTSBpcyB1bnNldD8KPiA+IAo+ID4gSSBjYW4gc2VlIGFyZ3VtZW50cyBib3Ro
IHdheXMuICBNeSB0aG91Z2h0IHdhcyB0aGF0IGl0IHdvdWxkIGJlIG5pY2UKPiA+IHRvIGVuZCB1
cCB3aXRoIGEgc2luZ2xlIGltcGxlbWVudGF0aW9uIG9mIHBjaV9kaXNhYmxlX2xpbmtfc3RhdGUo
KQo+ID4gd2l0aCBhbiAjaWZkZWYgYXJvdW5kIHRoZSBDT05GSUdfUENJRUFTUE0tZW5hYmxlZCBz
dHVmZiBiZWNhdXNlIGl0Cj4gPiBtYWtlcyB0aGUgY29kZSBlYXNpZXIgdG8gcmVhZC4KClJlc3Bv
bmRpbmcgdG8gbXlzZWxmIGhlcmUsIEkgdGhpbmsgd2Ugc2hvdWxkIGRvIHRoZSBwYXJ0aWFsIGRp
c2FibGVzCmJlY2F1c2UgaXQgbWF0Y2hlcyB3aGF0IHRoZSBkcml2ZXJzIGRpZCBwcmV2aW91c2x5
IGJ5IGhhbmQsIHdlIGNhbgpyZWR1Y2UgdGhlIG51bWJlciBvZiBjb2RlIHBhdGhzLCBhbmQgdGhl
IHJlc3VsdGluZyBkZXZpY2Ugc3RhdGUgd2lsbApiZSB0aGUgc2FtZSByZWdhcmRsZXNzIG9mIENP
TkZJR19QQ0lFQVNQTS4KCj4gSSB0aGluayB0aGVyZSdzIHN0aWxsIG9uZSBpbXBvcnRhbnQgdGhp
bmcgdG8gZGlzY3VzcyBhbmQgbm9uZSBvZiB0aGUKPiBjb21tZW50cyBoYXZlIGNvdmVyZWQgdGhh
dCBhcmVhIHNvIGZhci4KPiAKPiBUaGUgZHJpdmVycyB0aGF0IGhhdmUgd29ya2Fyb3VuZCBhcmUg
bm90IGdvaW5nIHRvIHR1cm4gbW9yZQo+IGRhbmdlcm91cyB0aGFuIHRoZXkncmUgYWxyZWFkeSB3
aXRob3V0IHRoaXMgY2hhbmdlLCBzbyB3ZSdyZSBtb3N0bHkKPiB3aXRoaW4gY2hhcnRlZCB3YXRl
cnMgdGhlcmUgZXZlbiB3aXRoIHdoYXQgeW91IHByb3Bvc2UuIEhvd2V2ZXIsIEkKPiB0aGluayB0
aGUgYmlnZ2VyIGNhdGNoIGFuZCBwb3RlbnRpYWwgc291cmNlIG9mIHByb2JsZW1zLCB3aXRoIGJv
dGgKPiB0aGlzIHYyIGFuZCB5b3VyIGFsdGVybmF0aXZlLCBhcmUgdGhlIGRyaXZlcnMgdGhhdCBk
byBub3QgaGF2ZSB0aGUKPiB3b3JrYXJvdW5kcyBhcm91bmQgQ09ORklHX1BDSUVBU1BNPW4gYW5k
L29yIF9PU0MgcGVybWlzc2lvbnMuIFRob3NlCj4gY29kZSBwYXRocyBqdXN0IGNhbGwgcGNpX2Rp
c2FibGVfbGlua19zdGF0ZSgpIGFuZCBkbyBub3RoaW5nIGVsc2UuCj4gCj4gRG8geW91IHRoaW5r
IGl0J3Mgb2theSB0byBhbHRlciB0aGUgYmVoYXZpb3IgZm9yIHRob3NlIGRyaXZlcnMgdG9vCj4g
KGRpc2FibGUgQVNQTSB3aGVyZSBpdCBwcmV2aW91c2x5IHdhcyBhIG5vLW9wKT8KClllcy4gIEkg
YXNzdW1lIHRoZSByZWFzb24gdGhvc2UgZHJpdmVycyBjYWxsIHBjaV9kaXNhYmxlX2xpbmtfc3Rh
dGUoKQppcyBiZWNhdXNlIHNvbWUgaGFyZHdhcmUgZGVmZWN0IG1lYW5zIEFTUE0gZG9lc24ndCB3
b3JrIGNvcnJlY3RseS4KClRoaXMgY2hhbmdlIG1lYW5zIHBjaV9kaXNhYmxlX2xpbmtfc3RhdGUo
KSB3aWxsIGRpc2FibGUgQVNQTSBldmVuIHdoZW4KdGhlIE9TIGRvZXNuJ3Qgb3duIEFTUE0gb3Ig
Q09ORklHX1BDSUVBU1BNIGlzIHVuc2V0LiAgSSB0aGluayB0aG9zZQpjYXNlcyBhcmUgdW51c3Vh
bCBhbmQgcHJvYmFibHkgbm90IHdlbGwgdGVzdGVkLCBhbmQgSSBzdXNwZWN0IHRoYXQgaWYKd2Ug
KmRpZCogdGVzdCB0aGVtLCB3ZSdkIGZpbmQgdGhhdCBBU1BNIGRvZXNuJ3Qgd29yayB3aXRoIHRo
ZSBjdXJyZW50Cmtlcm5lbC4KClNvIEkgdGhpbmsgdGhpcyBpcyBtb3JlIGxpa2VseSB0byAqZml4
KiBzb21ldGhpbmcgdGhhbiB0byBicmVhayBpdC4KCkJqb3JuCgotLSAKYXRoMTJrIG1haWxpbmcg
bGlzdAphdGgxMmtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwczovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMmsK
