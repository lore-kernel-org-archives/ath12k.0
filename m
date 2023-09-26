Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E619E7D270
	for <ath12k@archiver.kernel.org>; Tue, 26 Sep 2023 09:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rnTg3/AV68eqylMvJdKZ7tSuJ4aVn3WmdPaqbpQYnK8=; b=ANXgU/uUaoOFkZ
	0zicAc5+Cf63gRC1ggqebFkxZzUbGzo3qt8+TSGS8h6nt4xVzTFYIfGsZgbMygFdvD/LYnFMeZwUV
	MTPsmtedAYfTOArIAbaBDivhyBi3/mVrttfked+JDXwrLwxnNGWkgXL/s+YumIa+E+AxcLcPkbSXU
	kunVquhbojLN5HVSRWdc5T1gpGmMcqe6+GPWJvltQIDntYw+RvqRUJGGhWCCTjhthUPaD4ct4CpUM
	cCwDeTh/lZ0hYRyAIgnGtQWBlh4Y+QZdasJNIWlSJHHPa7CRXul/3yqpbZD9bw7PMAUW29CxAjcyg
	ozszsX+OhB6HYcAymnTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql4bx-00Fzgp-0X
	for ath12k@archiver.kernel.org;
	Tue, 26 Sep 2023 09:44:09 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql4bu-00FzgQ-1L
	for ath12k@lists.infradead.org;
	Tue, 26 Sep 2023 09:44:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=HmkCa+CDajndIlz08jjKz46l6h4i8QXpU+sUtr7YgfM=;
	t=1695721446; x=1696931046; b=LAgKyTbIBUt+O7CxWB4f4DB2yT72mdlP0aNEOFZ4NPlG6/z
	4wx6sIe6e3Dl741Wl/vvXJcgCWzlWt5s/oeAPzGWzElYs1bqvsrzsiczYM5PBoJAgGSc9J+LJzdiJ
	22ZjQZYl43kohqaekwMU31WwPVKMqVVrm7bWp56m5X8gPLtiII1Nm/ty+5nTfvtDfLNn999V9gRMF
	h7CblK9nYRPtDwfio2oPQDDNImC1cfSlAGGmSdaNJlau/IyakxnpJy7IOMWiY7Hh6aF8erDNNEq1F
	0UG0FGpx3XN8jwb1xTJJvTf/q3QhLpPTGa/dzGyl9x41NkwpXDKCu1DLDBUdLgjA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1ql4br-005RiW-1I;
	Tue, 26 Sep 2023 11:44:03 +0200
Message-ID: <18228b58173d9f33b1c3ddda9df5b3c4b49fb075.camel@sipsolutions.net>
Subject: Re: [PATCH 3/3] wifi: mac80211: update link RX NSS by
 ieee80211_sta_set_rx_nss() in ieee80211_assoc_config_link()
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Tue, 26 Sep 2023 11:44:02 +0200
In-Reply-To: <bfdcbf9a-0b27-1f7e-3eca-7390a9a7404e@quicinc.com>
References: <20230906103458.24092-1-quic_wgong@quicinc.com>
	 <20230906103458.24092-4-quic_wgong@quicinc.com>
	 <e6ea3009c489fae910adbf2e1c766f2d827f287f.camel@sipsolutions.net>
	 <bfdcbf9a-0b27-1f7e-3eca-7390a9a7404e@quicinc.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_024406_452725_8A5FAE36 
X-CRM114-Status: GOOD (  17.62  )
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

T24gRnJpLCAyMDIzLTA5LTE1IGF0IDE2OjQzICswODAwLCBXZW4gR29uZyB3cm90ZToKPiBPbiA5
LzEzLzIwMjMgNTowNCBQTSwgSm9oYW5uZXMgQmVyZyB3cm90ZToKPiA+IE9uIFdlZCwgMjAyMy0w
OS0wNiBhdCAwNjozNCAtMDQwMCwgV2VuIEdvbmcgd3JvdGU6Cj4gPiA+IEN1cnJlbnRseSBmb3Ig
TUxPIGNvbm5lY3Rpb24sIG9ubHkgZGVmbGluaydzIHJ4X25zcyBpcyBzZXQgdG8gY29ycmVjdAo+
ID4gPiB2YWx1ZS4gVGhlIG90aGVycyBsaW5rcycgcnhfbnNzIG9mIHN0cnVjdCBpZWVlODAyMTFf
bGlua19zdGEgaXMKPiA+ID4gdmFsdWUgMCBpbiBpZWVlODAyMTFfc2V0X2Fzc29jaWF0ZWQoKSwg
YmVjYXVzZSB0aGV5IGFyZSBub3QgcGFzcyBpbnRvCj4gPiA+IGllZWU4MDIxMV9zdGFfc2V0X3J4
X25zcygpIGluIG1hYzgwMjExIGV4Y2VwdCB0aGUgZGVmbGluayBpbgo+ID4gPiByYXRlX2NvbnRy
b2xfcmF0ZV9pbml0KCkuIFRoaXMgbGVhZHMgZHJpdmVyIGdldCBOU1MgPSAwIGZvciBvdGhlciBs
aW5rcy4KPiA+ID4gQWRkIHRoZSBpZWVlODAyMTFfc3RhX3NldF9yeF9uc3MoKSBpbiBpZWVlODAy
MTFfYXNzb2NfY29uZmlnX2xpbmsoKSwKPiA+ID4gdGhlbiB0aGUgb3RoZXIgbGlua3MnIHJ4X25z
cyB3aWxsIGJlIHNldCB0byB0aGUgY29ycmVjdCB2YWx1ZS4KPiA+IFRoaXMgaXMgcHJldHR5IG11
Y2ggdHJ1ZSwgYnV0IEkgYWxzbyB0aGluayBpdCdzIHByb2JsZW1hdGljIHRoZSB3YXkgeW91Cj4g
PiBwaHJhc2UgaXQuIFNvZnR3YXJlIHJhdGUgY29udHJvbCBpcyBwcmV0dHkgbXVjaCwgYXQgbGVh
c3QgY3VycmVudGx5LAo+ID4gX25vdF8gc3VwcG9ydGVkIGZvciBNTE8gKGFuZCBJIGRvbid0IHJl
YWxseSBzZWUgaG93IHRvIHN1cHBvcnQgaXQsIGlmCj4gPiBmaXJtd2FyZSBwaWNrcyB0aGUgbGlu
ayB0byB0cmFuc21pdCBvbiwgYXMgaXQgcHJvYmFibHkgc2hvdWxkKS4KPiBJIHNlYXJjaGVkIGFs
bCB0aGUgZm9sZGVyIHdpcmVsZXNzLCBJIG9ubHkgZm91bmQgNSBwbGFjZXMgaGF2ZSB0aGUgCj4g
aGFuZGxlciBvZiByYXRlX2luaXQgYmVsb3csCj4gYW5kIHRoZSBmdW5jdGlvbnMgYXJlIGFsbCBl
bXB0eS4gSXMgaXQgbWVhbnMgbm8gZHJpdmVyIHN1cHBvcnQgcmF0ZV9pbml0IAo+IGN1cnJlbnRs
eT8KPiBkcml2ZXJzL25ldC93aXJlbGVzcy9yZWFsdGVrL3J0bHdpZmkvcmMuYzozMDQ6wqDCoMKg
wqAgLnJhdGVfaW5pdCA9IAo+IHJ0bF9yYXRlX2luaXQsCj4gZHJpdmVycy9uZXQvd2lyZWxlc3Mv
aW50ZWwvaXdsd2lmaS9tdm0vcnMuYzo0MDk4OsKgIC5yYXRlX2luaXQgPSAKPiByc19yYXRlX2lu
aXRfb3BzLAo+IGRyaXZlcnMvbmV0L3dpcmVsZXNzL2ludGVsL2l3bHdpZmkvZHZtL3JzLmM6MzI3
NjrCoCAucmF0ZV9pbml0ID0gCj4gcnNfcmF0ZV9pbml0X3N0dWIsCj4gZHJpdmVycy9uZXQvd2ly
ZWxlc3MvaW50ZWwvaXdsZWdhY3kvNDk2NS1ycy5jOjI3Nzk6IC5yYXRlX2luaXQgPSAKPiBpbDQ5
NjVfcnNfcmF0ZV9pbml0X3N0dWIsCj4gZHJpdmVycy9uZXQvd2lyZWxlc3MvaW50ZWwvaXdsZWdh
Y3kvMzk0NS1ycy5jOjg2NzogLnJhdGVfaW5pdCA9IAo+IGlsMzk0NV9yc19yYXRlX2luaXRfc3R1
YiwKPiBbLi4uXQo+IAoKV2VsbCwgbWFueSBvdGhlciBkcml2ZXJzIHVzZSBtaW5zdHJlbCwgYW5k
IHRoZSBfc3R1YiBvbmVzIGluIGludGVsIGFyZQphdHVhbGx5IG5vdCBkb2luZyBhbnl0aGluZy4K
ClNvIG1vc3QgZHJpdmVycyB3b3VsZCB1c2UgCgpuZXQvbWFjODAyMTEvcmM4MDIxMV9taW5zdHJl
bF9odC5jOiAgICAgLnJhdGVfaW5pdCA9Cm1pbnN0cmVsX2h0X3JhdGVfaW5pdCwKCmhlcmUuCgpq
b2hhbm5lcwoKCi0tIAphdGgxMmsgbWFpbGluZyBsaXN0CmF0aDEya0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHBzOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEyawo=
