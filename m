Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60305CDB485
	for <ath12k@archiver.kernel.org>; Wed, 11 Oct 2023 19:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=cRxRR6DO8dv+DzhWyaB0nPS6A9F9y2yFL1278GiyS+4=; b=i0tfyRpO3Knz5i
	mAB8GhR+6sQOylmkyGwBD8He/H2rNOcgcEvvTqtrM636fZZBMLzV9sMUMToddiPwcV6u5hFIt4XDz
	lQ5bEO3FTBiw0DSJE78+u3W3HoZCmxWqb9BW7BvX2ICNKSrpTR/a++2i7wde0gekWF40qJ2Gq4euw
	nVUIMiTqO0q72MfpFssQoy42Tl4WVH1Pkovt/Q9pWlB08l7+frAGDo3OWvuYZSiR6yjZYaXRmPSJ8
	XRMAPIRrfx+FliWyj1YzSWmfcuDa0wlKq1wG7bQd3AYQkD7uw5FC2TC+bh6rSwhMrU6PI8o2yNFxi
	aFUXbSe8oTBMibrbtB3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqewK-00GYLL-2t
	for ath12k@archiver.kernel.org;
	Wed, 11 Oct 2023 19:32:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqewG-00GYIr-1G;
	Wed, 11 Oct 2023 19:32:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CAD73CE2527;
	Wed, 11 Oct 2023 19:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9236BC433C7;
	Wed, 11 Oct 2023 19:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697052728;
	bh=4k1m5qmcSDaP+SZOYD02LNDbpXJtj+6QzJq4iZ0fBT4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=PkSkfYndzZuEdhim2WqdUnaFkJa6/ULgDeXVhLamNMtNqjpEjDLFAOpinVDtpOf9t
	 AUQ8IuXuDRsbGSvvuJcBOkesPKE+B6LOW3w499tPS1H5C+DTTGZEpqDhTJv73Rngtf
	 R8n/q+wpIprV9354P5kNeMO1/5OdiCJZC921zzltoOp4qhTV4cqy8e0kXbMRCaqp4/
	 wgSGTdLCtZ0E1cvfJh/3oqFSKgGnYoWCp1qvbc5VbvIvmnclEI+2/Ls3QSTesrpdOn
	 1i9kPgcJmtJ/9DGNbL1W+mb7/ZJBeiArthYq4x+V47gI24Zx4H0qwEfuzJhfUtgURt
	 hjOYzB4aN6mlQ==
Date: Wed, 11 Oct 2023 14:32:06 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	ath10k@lists.infradead.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, intel-wired-lan@lists.osuosl.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 04/13] PCI/ASPM: Move L0S/L1/sub states mask
 calculation into a helper
Message-ID: <20231011193206.GA1039708@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230918131103.24119-5-ilpo.jarvinen@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_123212_805787_CD3BB6C4 
X-CRM114-Status: GOOD (  19.89  )
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

T24gTW9uLCBTZXAgMTgsIDIwMjMgYXQgMDQ6MTA6NTRQTSArMDMwMCwgSWxwbyBKw6RydmluZW4g
d3JvdGU6Cj4gQVNQTSBzZXJ2aWNlIGRyaXZlciBkb2VzIHRoZSBzYW1lIEwwUyAvIEwxUyAvIHN1
YiBzdGF0ZXMgYWxsb3dlZAo+IGNhbGN1bGF0aW9uIGluIF9fcGNpX2Rpc2FibGVfbGlua19zdGF0
ZSgpIGFuZAo+IHBjaV9zZXRfZGVmYXVsdF9saW5rX3N0YXRlKCkuCgpJcyB0aGVyZSBhIHR5cG8g
b3Igc29tZXRoaW5nIGhlcmU/ICBUaGlzIHBhdGNoIG9ubHkgYWRkcyBhIGNhbGwgdG8KX19wY2lf
ZGlzYWJsZV9saW5rX3N0YXRlKCksIG5vdCB0byBwY2lfc2V0X2RlZmF1bHRfbGlua19zdGF0ZSgp
LgoKPiBDcmVhdGUgYSBoZWxwZXIgdG8gY2FsY3VsYXRlIHRoZSBtYXNrIGZvciB0aGUgYWxsb3dl
ZCBzdGF0ZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSWxwbyBKw6RydmluZW4gPGlscG8uamFydmlu
ZW5AbGludXguaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3BjaS9wY2llL2FzcG0uYyB8IDMz
ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjEg
aW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
cGNpL3BjaWUvYXNwbS5jIGIvZHJpdmVycy9wY2kvcGNpZS9hc3BtLmMKPiBpbmRleCBlYzZkN2Ew
OTJhYzEuLjkxZGM5NWFjYTkwZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BjaS9wY2llL2FzcG0u
Ywo+ICsrKyBiL2RyaXZlcnMvcGNpL3BjaWUvYXNwbS5jCj4gQEAgLTEwMzQsNiArMTAzNCwyNiBA
QCBzdGF0aWMgc3RydWN0IHBjaWVfbGlua19zdGF0ZSAqcGNpZV9hc3BtX2dldF9saW5rKHN0cnVj
dCBwY2lfZGV2ICpwZGV2KQo+ICAJcmV0dXJuIGJyaWRnZS0+bGlua19zdGF0ZTsKPiAgfQo+ICAK
PiArc3RhdGljIHU4IHBjaV9saW5rX3N0YXRlX21hc2soaW50IHN0YXRlKQo+ICt7Cj4gKwl1OCBy
ZXN1bHQgPSAwOwo+ICsKPiArCWlmIChzdGF0ZSAmIFBDSUVfTElOS19TVEFURV9MMFMpCj4gKwkJ
cmVzdWx0IHw9IEFTUE1fU1RBVEVfTDBTOwo+ICsJaWYgKHN0YXRlICYgUENJRV9MSU5LX1NUQVRF
X0wxKQo+ICsJCXJlc3VsdCB8PSBBU1BNX1NUQVRFX0wxOwo+ICsJaWYgKHN0YXRlICYgUENJRV9M
SU5LX1NUQVRFX0wxXzEpCj4gKwkJcmVzdWx0IHw9IEFTUE1fU1RBVEVfTDFfMTsKPiArCWlmIChz
dGF0ZSAmIFBDSUVfTElOS19TVEFURV9MMV8yKQo+ICsJCXJlc3VsdCB8PSBBU1BNX1NUQVRFX0wx
XzI7Cj4gKwlpZiAoc3RhdGUgJiBQQ0lFX0xJTktfU1RBVEVfTDFfMV9QQ0lQTSkKPiArCQlyZXN1
bHQgfD0gQVNQTV9TVEFURV9MMV8xX1BDSVBNOwo+ICsJaWYgKHN0YXRlICYgUENJRV9MSU5LX1NU
QVRFX0wxXzJfUENJUE0pCj4gKwkJcmVzdWx0IHw9IEFTUE1fU1RBVEVfTDFfMl9QQ0lQTTsKPiAr
Cj4gKwlyZXR1cm4gcmVzdWx0Owo+ICt9Cj4gKwo+ICBzdGF0aWMgaW50IF9fcGNpX2Rpc2FibGVf
bGlua19zdGF0ZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgaW50IHN0YXRlLCBib29sIHNlbSkKPiAg
ewo+ICAJc3RydWN0IHBjaWVfbGlua19zdGF0ZSAqbGluayA9IHBjaWVfYXNwbV9nZXRfbGluayhw
ZGV2KTsKPiBAQCAtMTA2MywxOCArMTA4Myw3IEBAIHN0YXRpYyBpbnQgX19wY2lfZGlzYWJsZV9s
aW5rX3N0YXRlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBpbnQgc3RhdGUsIGJvb2wgc2VtKQo+ICAJ
aWYgKHNlbSkKPiAgCQlkb3duX3JlYWQoJnBjaV9idXNfc2VtKTsKPiAgCW11dGV4X2xvY2soJmFz
cG1fbG9jayk7Cj4gLQlpZiAoc3RhdGUgJiBQQ0lFX0xJTktfU1RBVEVfTDBTKQo+IC0JCWxpbmst
PmFzcG1fZGlzYWJsZSB8PSBBU1BNX1NUQVRFX0wwUzsKPiAtCWlmIChzdGF0ZSAmIFBDSUVfTElO
S19TVEFURV9MMSkKPiAtCQlsaW5rLT5hc3BtX2Rpc2FibGUgfD0gQVNQTV9TVEFURV9MMTsKPiAt
CWlmIChzdGF0ZSAmIFBDSUVfTElOS19TVEFURV9MMV8xKQo+IC0JCWxpbmstPmFzcG1fZGlzYWJs
ZSB8PSBBU1BNX1NUQVRFX0wxXzE7Cj4gLQlpZiAoc3RhdGUgJiBQQ0lFX0xJTktfU1RBVEVfTDFf
MikKPiAtCQlsaW5rLT5hc3BtX2Rpc2FibGUgfD0gQVNQTV9TVEFURV9MMV8yOwo+IC0JaWYgKHN0
YXRlICYgUENJRV9MSU5LX1NUQVRFX0wxXzFfUENJUE0pCj4gLQkJbGluay0+YXNwbV9kaXNhYmxl
IHw9IEFTUE1fU1RBVEVfTDFfMV9QQ0lQTTsKPiAtCWlmIChzdGF0ZSAmIFBDSUVfTElOS19TVEFU
RV9MMV8yX1BDSVBNKQo+IC0JCWxpbmstPmFzcG1fZGlzYWJsZSB8PSBBU1BNX1NUQVRFX0wxXzJf
UENJUE07Cj4gKwlsaW5rLT5hc3BtX2Rpc2FibGUgfD0gcGNpX2xpbmtfc3RhdGVfbWFzayhzdGF0
ZSk7Cj4gIAlwY2llX2NvbmZpZ19hc3BtX2xpbmsobGluaywgcG9saWN5X3RvX2FzcG1fc3RhdGUo
bGluaykpOwo+ICAKPiAgCWlmIChzdGF0ZSAmIFBDSUVfTElOS19TVEFURV9DTEtQTSkKPiAtLSAK
PiAyLjMwLjIKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0Cj4gbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCgotLSAKYXRoMTJrIG1haWxpbmcgbGlzdAphdGgx
MmtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwczovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hdGgxMmsK
