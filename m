Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36197E7D273
	for <ath12k@archiver.kernel.org>; Tue, 26 Sep 2023 10:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TomyCSoGe4uw0/b2J6rLM/qECjeVJIif9FX9X5CAQeU=; b=0ukw52INbqWJPQ
	qa3Ynd2TCSPODNQ+4bEl1zjFDRbuOwYllHLXEqWfImwiQ7U31R0xtyTWXFNouKgGGO/1B81m0YuCr
	OHSAOL+KFuDNUuvVfVtZePihkeeU5dT87Js6mvRC47UJliv45PBymwUZuO3oqp2qvjTD1ovJGWLDI
	J8n/fvIBiOKM28kYcQLFdCAQgPAQCJ7TgQ8W0V6+l7OxsCw390h6VL8pbvsWQCE1S5ZH6YU/tkpFU
	JvqF/xjvS+GoHx1gPsNblqqxK2eB82C2ub0CcHukxUxfMhVjxnY26GdaUQJ3WfTQdXw5rr12MJ5ix
	sME1Pc2XHPFfFG55SGSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql4rj-00G0tp-2V
	for ath12k@archiver.kernel.org;
	Tue, 26 Sep 2023 10:00:27 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql4rg-00G0tO-0t
	for ath12k@lists.infradead.org;
	Tue, 26 Sep 2023 10:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=YMkWUhPMi5MlgEJx/17dv5tGxomlRYsOBLSY0nriJC8=;
	t=1695722423; x=1696932023; b=aisXlE6wvYk1YZ5o/VXPAN+OjZm8nmkdru+EBThfbxRXLPM
	vplSnjRdwhY3GnJArLiGYUQ1XBLc8LPZ1HWwdSNMpJSC+7yOz19GNwBxxCS9KxCLRRtYAG64412UL
	9BBx4OQesGW2jYTlovAZ+fFR8NZG8FH9GE6opaCVYSxwf3OuABK+SMCVJjs+K0JN+Pj0ggsNqPddU
	YbgvfcAkOd4SXMTsaWFwmp04cPZmlT2dwx6rF7Sdr5hPpIiDyJfy1A3F2pQKz6BXyp90svYQ2Idr/
	T5rLZoUUoWMTWBjgiYUUQrx/NUKsM9dNrQMqs/8Xnb8ApJgV2TrxGhOXenmwE2vA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1ql4rd-005SgD-1e;
	Tue, 26 Sep 2023 12:00:21 +0200
Message-ID: <6892f4026a275756eecf36f46711442882aac7fd.camel@sipsolutions.net>
Subject: Re: [PATCH 2/3] wifi: mac80211: add support to allow driver to set
 active link while connection for station
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 26 Sep 2023 12:00:20 +0200
In-Reply-To: <96ae3c1d-274b-00b1-cb19-a9a301b6aa56@quicinc.com>
References: <20230906103458.24092-1-quic_wgong@quicinc.com>
	 <20230906103458.24092-3-quic_wgong@quicinc.com>
	 <4b597bba9dc13c3260f174826de38b4f1bc3bf6e.camel@sipsolutions.net>
	 <96ae3c1d-274b-00b1-cb19-a9a301b6aa56@quicinc.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_030024_335193_07B28ADA 
X-CRM114-Status: GOOD (  19.18  )
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

Cj4gRm9yIGllZWU4MDIxMV9zZXRfYWN0aXZlX2xpbmtzKCksIGRyaXZlciBuZWVkIHNhdmUgYW5k
IGluc3RhbGwgcGFpcndpc2UKPiBrZXlzIGZvciB0aGUgb3RoZXIgbGlua3MgYXMgeW91IHNhaWQg
aW4gbGluayBiZWxvdy4gQnV0IGRyaXZlciBkbyBub3QKPiBzYXZlIHRoZSBrZXkgZGF0YSBjdXJy
ZW50bHkuIFNvIGRyaXZlciBjb3VsZCBub3QgaW5zdGFsbCB0aGUgcGFpcndpc2UKPiBrZXlzIGJ5
IGl0c2VsZi4KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC13aXJlbGVzcy81MDcxOWQz
NGJjNDhkODE2ZDAwYjU2ZDNkOWVmZGI1OWUzZTUxYTE2LmNhbWVsQHNpcHNvbHV0aW9ucy5uZXQv
CgpXZWxsIGl0IGNhbiBzdGlsbCBlYXNpbHkgaXRlcmF0ZSB0aGUga2V5cywgYnV0IE9LLCBJIGNh
biBidXkgdGhpcwphcmd1bWVudC4gWW91IHNob3VsZCBwcm9iYWJseSBtZW50aW9uIGl0IGFsbCBp
biB0aGUgY29tbWl0IGxvZyB0aG91Z2guCgo+ID4gPiBAQCAtMTY2LDYgKzE2NywxMyBAQCBzdGF0
aWMgdm9pZCBpZWVlODAyMTFfc2V0X3ZpZl9saW5rc19iaXRtYXBzKHN0cnVjdCBpZWVlODAyMTFf
c3ViX2lmX2RhdGEgKnNkYXRhLAo+ID4gPiAgIAkJV0FSTl9PTihkb3JtYW50X2xpbmtzKTsKPiA+
ID4gICAJCWJyZWFrOwo+ID4gPiAgIAljYXNlIE5MODAyMTFfSUZUWVBFX1NUQVRJT046Cj4gPiA+
ICsJCWFjdGl2ZV9saW5rcyA9IGRydl9jYWxjdWxhdGVfYWN0aXZlX2xpbmtzKHNkYXRhLT5sb2Nh
bCwgc2RhdGEsCj4gPiA+ICsJCQkJCQkJICB2YWxpZF9saW5rcyAmIH5kb3JtYW50X2xpbmtzKTsK
PiA+ID4gKwkJaWYgKGFjdGl2ZV9saW5rcykgewo+ID4gPiArCQkJc2RhdGEtPnZpZi5hY3RpdmVf
bGlua3MgPSBhY3RpdmVfbGlua3M7Cj4gPiA+ICsJCQlicmVhazsKPiA+ID4gKwkJfQo+ID4gPiAK
PiA+IEkgYWxzbyBfcmVhbGx5XyBkb24ndCB0aGluayB0aGlzIHNob3VsZCBvcGVyYXRlIGF0IHRo
aXMgbG93LWxldmVsCj4gPiBpbmZyYXN0cnVjdHVyZS4KPiAKPiBJIHJlYWxseSB3YW50IHRvIGtu
b3cgdGhlIHJlYXNvbiB3aHkgYWN0aXZlICpvbmx5KiB0aGUgYXNzb2MgbGluayBmb3IgCj4gc3Rh
dGlvbiwgYnV0Cj4gCj4gYWN0aXZlICphbGwqIGxpbmtzIGZvciBBUCBoZXJl8J+YgT8KCldlbGws
IGZhaXIgcG9pbnQuCgpJIHdhcyBzb21laG93IGFueXdheSB0aGlua2luZyB0aGF0IGl0IHNob3Vs
ZCBiZSB0aGUgb3RoZXIgd2F5IGFyb3VuZCwgSQptZWFuLCBpbiB0aGUgc2Vuc2UgdGhhdCB0aGlz
IGNvZGUgaGVyZSBpcyBqdXN0IG1lY2hhbmlzbSwgYW5kIHRoZSBwb2xpY3kKc2hvdWxkJ3ZlIGJl
ZW4gaW4gaGlnaGVyLWxldmVsIGNvZGUgLi4uIGJ1dCBzb21laG93IHRoYXQncyBub3Qgd2hhdCB3
ZQplbmRlZCB1cCBkb2lnbiBoZXJlLgoKCkl0IHJlYWxseSBmZWVscyB3cm9uZyB0byBtZSB0byBo
YXZlIHRoZSBkcml2ZXIgaW52b2x2ZWQgaW4gdGhpcyBsb3ctCmxldmVsIGluZnJhc3RydWN0dXJl
LCBidXQgT1RPSCB0aGF0IHJlYWxseSBpcyBob3cgaXQgd29ya3Mgbm93PwoKCk1heWJlIHJlYWxs
eSB3aGF0IHlvdSB3YW50IGlzIGEgZHJpdmVyIGZsYWcgc2F5aW5nCklFRUU4MDIxMV9IV19NQU5B
R0VTX0FDVElWRV9MSU5LUyBvciBzb21ldGhpbmcsIGFuZCB0aGVuIGZyb20gYSBtYWM4MDIxMQpw
ZXJzcGVjdGl2ZSB5b3UgZG9uJ3Qgc2V0IGFjdGl2ZSBsaW5rcyBhdCBhbGw/IFRob3VnaCBJJ20g
bm90IHN1cmUgdGhhdAp3b3JrcyB3aXRoIFRUTE0sIGZvciBpbnN0YW5jZT8gQW5kIG1heWJlIHlv
dSdkIHN0aWxsIHdhbnQgdGhlIGRlYnVnZnM/CgpCdXQgaW4gZmFjdCwgaWYgeW91IGRvIHN0aWxs
IHdhbnQgc29tZXRoaW5nIGZyb20gbWFjODAyMTEgZm9yIGRlYnVnZnMgb3IKVFRMTSwgdGhlbiB0
aGlzIGNvZGUgaGVyZSBpcyBub3QgcmVhbGx5IHJpZ2h0LCBzaW5jZSB5b3UnZCBpbnRlcmFjdCB3
aXRoCl9hbGxfIGF0dGVtcHRzIGluIG1hYzgwMjExIHRvIGFjdGl2YXRlIG9yIGRlYWN0aXZhdGUg
bGlua3MgLSB3aGVuIGFsbAp5b3UgcmVhbGx5IHdhbnRlZCB3YXMgdGhlIHZlcnkgZmlyc3Qgb25l
LgoKV2hpY2ggdG9kYXkgbWFjODAyMTEgYWNoaWV2ZXMgYnkgYmFpbGluZyBvdXQKImlmIChzZGF0
YS0+dmlmLmFjdGl2ZV9saW5rcykiLCBhbmQgd2hpbGUgeW91IGNvdWxkIGRvIHRoZSBzYW1lIGlu
IHRoZQpkcml2ZXIsIGl0IGZlZWxzIHJlYWxseSBicml0dGxlIC8gZXJyb3ItcHJvbmUgdG8gbWUu
CgoKSSB0aGluayBpdCdkIGJlIGJldHRlciB0aGFuIGFsbCB0aGVzZSBjYWxsYmFja3MgdG8gZW5j
b2RlIHRoZSBzcGVjaWZpYwpiZWhhdmlvdXIgeW91IG5lZWQgaW4gYSBmbGFnLCBlLmcuICJhY3Rp
dmF0ZSBhbGwgU1RBIGxpbmtzIG9uIGFzc29jIiBvcgpzb21ldGhpbmc/Cgpqb2hhbm5lcwoKLS0g
CmF0aDEyayBtYWlsaW5nIGxpc3QKYXRoMTJrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cHM6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTJrCg==
