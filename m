Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A22C761A6
	for <ath12k@archiver.kernel.org>; Mon, 27 Mar 2023 08:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DPz5qZOX6iG6qNrNdG137BJN/jlaE3DU/KYFgH5/rps=; b=btbkbO04pu9XJs
	1nHmkCxD8BIyEp/0ssTei7s4bLqG7QSsaG2RQdkcXFoQzB6dL5bvAyrlxNCSGQgrfvdFu+vnuelI4
	soayi3AQ9rdnP/JHYelQu4LFVs7NxPCwY6KMHTwJU9k9RWkqr3tqyy2wdSdVzViExsR29zHN9Z277
	zWI7KeXBZVEH6SdaREFNt6xbppN5S1aLS/XQ/g9cCD3rHJZMAvu1XGzVyylW9I0jCFK5zlIdAbVHh
	AF02mY4+MJG4YkZMtMqh/zrVBQO7EtBr4KvgjBzzSuaea5Se4CjzfZkj0ytvMtiF5ackdYRviHVvo
	WJgJsFIw7htDYH2l1Dxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiGU-00AGIU-0s
	for ath12k@archiver.kernel.org;
	Mon, 27 Mar 2023 08:31:42 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiGM-00AGFK-2t;
	Mon, 27 Mar 2023 08:31:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=IdKpgzCNbwY7lFmHxBGsQD8N7vPJ1zfocoC/XEPb14I=;
	t=1679905891; x=1681115491; b=pT8trNOZs/Z//LlxeDqaFeWE9nqFMv3bW3xqOekTTo0N+yw
	W5DMxAyuaTko9n55kBwZwC1+MWDic9zQRpmw0Ag+Zyr4XxaSEueXwuNT5sDIcIifhVu7c6WfJLPhQ
	nxnrPsaEl8KtHFAGetPo0lCa2DZ9ZBISC4/mxUGJyH+maX6m6xOVAqJ0Gn+jLteHhboVRfSmzl+Wt
	tj1+0D2wKyMcU6u/9kRzgk3yR+7Sb14V/TIhwUTk3yldQ3d55/q9p7vuOhDd89RK3V2Mix4GpE57F
	eCT6288wr4u3AJHtAgtUqMfInYR9s/sfBz4G9q7oV78o8D/iyp7UZSMHDIlovmAQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pgiGD-00Faeu-2T;
	Mon, 27 Mar 2023 10:31:25 +0200
Message-ID: <50719d34bc48d816d00b56d3d9efdb59e3e51a16.camel@sipsolutions.net>
Subject: Re: [PATCH 24/27] wifi: mac80211: implement link switching
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org
Date: Mon, 27 Mar 2023 10:31:24 +0200
In-Reply-To: <ca5177fe-3b9f-2309-9afd-1d5e827540f7@quicinc.com>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
	 <20220902161143.d99dfbe65c90.I92385ba882ec984a9a2ad18293173436657e82aa@changeid>
	 <ca5177fe-3b9f-2309-9afd-1d5e827540f7@quicinc.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_013135_068371_A218A56F 
X-CRM114-Status: GOOD (  15.70  )
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

SGksCgo+ID4gKwlsaXN0X2Zvcl9lYWNoX2VudHJ5KHN0YSwgJmxvY2FsLT5zdGFfbGlzdCwgbGlz
dCkgewo+ID4gKwkJaWYgKHNkYXRhICE9IHN0YS0+c2RhdGEpCj4gPiArCQkJY29udGludWU7Cj4g
PiArCQlyZXQgPSBkcnZfY2hhbmdlX3N0YV9saW5rcyhsb2NhbCwgc2RhdGEsICZzdGEtPnN0YSwK
PiA+ICsJCQkJCSAgIG9sZF9hY3RpdmUsCj4gPiArCQkJCQkgICBvbGRfYWN0aXZlIHwgYWN0aXZl
X2xpbmtzKTsKPiA+ICsJCVdBUk5fT05fT05DRShyZXQpOwo+ID4gKwl9Cj4gPiArCj4gPiArCXJl
dCA9IGllZWU4MDIxMV9rZXlfc3dpdGNoX2xpbmtzKHNkYXRhLCByZW0sIGFkZCk7Cj4gCj4gSSBz
ZWUgaWVlZTgwMjExX2tleV9zd2l0Y2hfbGluaygpIG9ubHkgaGFuZGxlciB0aGUgcGVyLWxpbmso
bGlua19pZCA+PSAKPiAwKSBrZXlzLAo+IAo+IFNvIEkgdGhpbmsgbG93ZXIgZHJpdmVyIGFsc28g
aW5zdGFsbCB0aGUgcGFpcndpc2Uga2V5cyhsaW5rX2lkID0gLTEpIGZvciAKPiB0aGUgYWRkZWQg
bGlua3MgYXQgdGhpcyBtb21lbnQ/CgpXZWxsIGZyb20gbWFjODAyMTEgUE9WIHRoZXkncmUgYWxy
ZWFkeSBpbnN0YWxsZWQsIHNvIHdlIGNhbid0IHJlYWxseQppbnN0YWxsIHRoZW0gYWdhaW4uIFdl
J2QgaGF2ZSB0byByZW1vdmUgdGhlbSBidXQgdGhhdCdzIHJhY3ksIG9idmlvdXNseS4KU28gSSB0
aGluayB0aGUgbG93LWxldmVsIGRyaXZlciBqdXN0IGhhcyB0byBoYW5kbGUgdGhhdCwgZS5nLiB3
aGVuIHRoZQpzdGF0aW9uIGxpbmtzIGFyZSB1cGRhdGVkIChhbmQgdGhlIGtleSBiZWxvbmdzIHRv
IHRoZSBzdGF0aW9uLikKCj4gPiArCVdBUk5fT05fT05DRShyZXQpOwo+ID4gKwo+ID4gKwlsaXN0
X2Zvcl9lYWNoX2VudHJ5KHN0YSwgJmxvY2FsLT5zdGFfbGlzdCwgbGlzdCkgewo+ID4gKwkJaWYg
KHNkYXRhICE9IHN0YS0+c2RhdGEpCj4gPiArCQkJY29udGludWU7Cj4gPiArCQlyZXQgPSBkcnZf
Y2hhbmdlX3N0YV9saW5rcyhsb2NhbCwgc2RhdGEsICZzdGEtPnN0YSwKPiA+ICsJCQkJCSAgIG9s
ZF9hY3RpdmUgfCBhY3RpdmVfbGlua3MsCj4gPiArCQkJCQkgICBhY3RpdmVfbGlua3MpOwo+ID4g
KwkJV0FSTl9PTl9PTkNFKHJldCk7Cj4gPiArCX0KPiA+ICsKPiAKPiBJIHNlZSAyIHRpbWVzIHRv
IGNhbGwgZHJ2X2NoYW5nZV9zdGFfbGluaygpIGFib3ZlLCBhbmQgd2l0aCBzZXF1ZW5jZcKgIAo+
IG9sZF9hY3RpdmUtPm9sZF9hY3RpdmUgfCBhY3RpdmVfbGlua3MtPmFjdGl2ZV9saW5rcwo+IAo+
IE1heSBJIGtub3cgaXMgaXQgaGFzIHNvbWUgZGVzaWduIGhlcmU/CgpUaGUgcHJvYmxlbSBpcyB0
aGF0IHdlIGNhbid0IHJlYWxseSBoYXZlIG5vIGxpbmtzIGFjdGl2ZSBldmVuIGFzIGFuCmludGVy
bWVkaWF0ZSBzdGVwLCBzbyB5b3UgY2FuJ3QganVzdCBkZWFjdGl2YXRlIG9sZCBhbmQgdGhlbiBh
Y3RpdmF0ZQpuZXcuCgo+ID4gKwlmb3JfZWFjaF9zZXRfYml0KGxpbmtfaWQsICZhZGQsIElFRUU4
MDIxMV9NTERfTUFYX05VTV9MSU5LUykgewo+ID4gKwkJc3RydWN0IGllZWU4MDIxMV9saW5rX2Rh
dGEgKmxpbms7Cj4gPiArCj4gPiArCQlsaW5rID0gc2RhdGFfZGVyZWZlcmVuY2Uoc2RhdGEtPmxp
bmtbbGlua19pZF0sIHNkYXRhKTsKPiA+ICsKPiA+ICsJCXJldCA9IGllZWU4MDIxMV9saW5rX3Vz
ZV9jaGFubmVsKGxpbmssICZsaW5rLT5jb25mLT5jaGFuZGVmLAo+ID4gKwkJCQkJCSBJRUVFODAy
MTFfQ0hBTkNUWF9TSEFSRUQpOwo+IAo+IEZvciB0aGUgMXN0IGxpbmsgb2YgTUxPIGNvbm5lY3Rp
b24vTk9OLU1MTyBjb25uZXRpb24sIGllZWU4MDIxMV9saW5rX3VzZV9jaGFubmVsKCkgaXMgY2Fs
bGVkIGJlZm9yZSBkcnZfY2hhbmdlX3N0YV9saW5rKCksCj4gQW5kIG5vdyBpdCBpcyBhZnRlciBk
cnZfY2hhbmdlX3N0YV9saW5rKCksIE1heSBJIGtub3cgaXMgaXQgYWxzbyBoYXMgc29tZSBkZXNp
Z24gaGVyZT8KCkhtbSwgcHJvYmFibHkgbm90IHJlYWxseSwgYXQgbGVhc3QgSSBkb24ndCByZW1l
bWJlciBhbnl0aGluZyBhYm91dCB0aGF0LgoKTm90IHN1cmUgaXQgbWFrZXMgYSBodWdlIGRpZmZl
cmVuY2U/IEJ1dCBJIHN1cHBvc2Ugd2UgY291bGQgY2hhbmdlIGl0LCBJCmRvbid0IHJlYWxseSBz
ZWUgd2h5IG5vdCBlaXRoZXIuCgo+IEFsc28gSSBzZWUgY29tbWl0KDhmYjdlMmVmNGJhYiBtYWM4
MDIxMV9od3NpbTogYWx3YXlzIGFjdGl2YXRlIGFsbCBsaW5rcykgYW5kIGllZWU4MDIxMV9pZl9w
YXJzZV9hY3RpdmVfbGlua3MoKQo+IHdpbGwgdXNlIGllZWU4MDIxMV9zZXRfYWN0aXZlX2xpbmtz
KCksIHNvIEkgdGhpbmsgaWVlZTgwMjExX3NldF9hY3RpdmVfbGlua3MoKSBoYXMgcGFzc2VkIHRl
c3QgY2FzZSB3aXRoIHNvbWUgdHlwZSBsb3dlciBkcml2ZXIvY2hpcD8KClllcywgd2UgaGF2ZSB0
aGlzIHdvcmtpbmcgb24gaXdsd2lmaS9tdm0uCgpqb2hhbm5lcwoKLS0gCmF0aDEyayBtYWlsaW5n
IGxpc3QKYXRoMTJrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cHM6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTJrCg==
