Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB5CE8181B
	for <ath12k@archiver.kernel.org>; Tue, 26 Sep 2023 04:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KMOfSnVqnKPXwcBYnZ8uFTbUDJW0Z7ibmG5eK84eBs8=; b=ciXoAPPZiRCOcY
	W24fdJVetE/pVIlwhrnlJ23IFOIJ6VsxTjoLw7sJ5MEVIfECVFD91ivJ+jIxlJ8+5zzMSkhVnPxRp
	MyaRJCzh6Ej6SCcFGtc9+cLNMK3NECnsFJ60Fqfznht9oT+MqfhC4fuQEBkQfrEO0hPzalIrPdnhN
	gZGuu6kClUAkx4RTFpCfzNkOfbvdXVVOhu2o57YBkUPK3k5O3TMnXL/hvkI7rVFCaqU7OUpfReO7O
	kV/GVH76VThVP9dSOzImK6IWhVAf9NnKG7yBBjiroYApmYvhYKZIv1OxATL3JGsMv58/bGi6OSAgi
	uJco2ZG8ANCbo2USpb9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkztz-00FZae-0M
	for ath12k@archiver.kernel.org;
	Tue, 26 Sep 2023 04:42:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkztv-00FZa0-2Y
	for ath12k@lists.infradead.org;
	Tue, 26 Sep 2023 04:42:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1D78BB80E02;
	Tue, 26 Sep 2023 04:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8140C433C7;
	Tue, 26 Sep 2023 04:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695703341;
	bh=ELFbAulTiKpZ+L7fo1P/FIiLacUOpOyIxCPGzGhSjOg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=hE8h8U0WGmkGt4FzoqMXv9ybb/z/I8d0SdZ7jiLmBZgTtHP1feby4bWlZNSfQ7Jsu
	 MHvT/H1kCVQiCfiNhJLtMEOh9ABbXpddVvzKZqQaW2p9skzz/J+0N3k+c9Yn1y4eoq
	 zRYzaUz5MVRDbJiFfqly4iFxSKz9PKNfXvEQDDo2czHV4xeBPS1f8FhcsQdN+C9STf
	 bjSVR+TsZdUouKGZoWE4W6MVAyQHCzfXuatc/6GGdb66iyhQ57orYoK6IfLbDRjyzC
	 5wDm223SFXqIz24lbrCL2CmJUCjYpJdc0iL19+g2CYnvO6X+wiBgyW3vofbOaZdW6R
	 G7Pc6wQwZtIWw==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>
Subject: Re: ath12k-check warnings
References: <20230824025432.19406-1-quic_wgong@quicinc.com>
	<169295002356.1753110.7150166655358699685.kvalo@kernel.org>
	<5376cd01-ab3e-416f-ea73-649c82e3bc40@quicinc.com>
	<87cyyve6ul.fsf_-_@kernel.org>
	<b27fb345-b9e5-1ab0-b6df-1fad6c24a825@quicinc.com>
Date: Tue, 26 Sep 2023 07:42:18 +0300
In-Reply-To: <b27fb345-b9e5-1ab0-b6df-1fad6c24a825@quicinc.com> (Wen Gong's
	message of "Tue, 26 Sep 2023 10:32:48 +0800")
Message-ID: <87o7hp8s0l.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_214223_962704_F11A6220 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

V2VuIEdvbmcgPHF1aWNfd2dvbmdAcXVpY2luYy5jb20+IHdyaXRlczoKCj4gSSB1cGRhdGVkIHRv
IGxhdGVzdCBjb21taXQgb2YgcWNhLXN3aXNzLWFybXkta25pZmUgKDlhMTZhNGEgLQo+IGF0aDEx
ay1jaGVjazogdmVyaWZ5IGNoZWNrcGF0Y2gucGwgbWQ1c3VtKSwKPgo+IGFuZCBpdCBzdGlsbCBw
cmludCBhYm91dCB+NTAwICJub3RlOiBpbiBpbmNsdWRlZCBmaWxlIC4uLiIsIHRoZXkgYXJlCj4g
cHJpbnQgYnkgc3BhcnNlLCBub3QgYnkgY2hlY2twYXRjaC5wbC4KCkFoLCBJIG1pc3NlZCB0aGF0
IHRoZXNlIGFyZSBjb21pbmcgZnJvbSBzcGFyc2UuCgo+IHdnb25nQHdnb25nLUxhdGl0dWRlLUU2
NDMwOn4vb3BlbnNvdXJjZS9rZXJuZWwvYXRoJCAuL2F0aDEyay1jaGVjayAtLXZlcnNpb24KPiAv
aG9tZS93Z29uZy9vcGVuc291cmNlL2tlcm5lbC9hdGgvLi9hdGgxMmstY2hlY2s6MzI6Cj4gRGVw
cmVjYXRpb25XYXJuaW5nOiBUaGUgZGlzdHV0aWxzIHBhY2thZ2UgaXMgZGVwcmVjYXRlZCBhbmQg
c2xhdGVkIGZvcgo+IHJlbW92YWwgaW4gUHl0aG9uIDMuMTIuIFVzZSBzZXR1cHRvb2xzIG9yIGNo
ZWNrIFBFUCA2MzIgZm9yIHBvdGVudGlhbAo+IGFsdGVybmF0aXZlcwo+IMKgIGltcG9ydCBkaXN0
dXRpbHMuc3Bhd24KPiBhdGgxMmstY2hlY2sgKG1kNXN1bSBhOTM0ZTE4YTZmN2M0MzllMzUxNjk1
MjY4NDcxMTU2YykKPgo+IGdjYzrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdjYyAoVWJ1bnR1IDEx
LjQuMC0xdWJ1bnR1MX4yMi4wNCkgMTEuNC4wCj4gc3BhcnNlOsKgwqDCoMKgwqDCoMKgwqAgMC42
LjQgKFVidW50dTogMC42LjQtMikKPiBjaGVja3BhdGNoLnBsOsKgIFZlcnNpb246IDAuMzIgKG1k
NXN1bSA0N2VmMzI3ZDc3MmMxNTZlNTNhMzY1OTc3MjNmYzc4MSkKPiBndGFnczrCoMKgwqDCoMKg
wqDCoMKgwqAgZ3RhZ3MgKEdsb2JhbCkgNi42LjcKCkkgZ3Vlc3MgeW91ciBzcGFyc2UgaXMgdG9v
IG9sZC4gSSdtIHVzaW5nOgoKJCBhdGgxMmstY2hlY2sgLS12ZXJzaW9uCmF0aDEyay1jaGVjayAo
bWQ1c3VtIGE5MzRlMThhNmY3YzQzOWUzNTE2OTUyNjg0NzExNTZjKQoKZ2NjOgkJZ2NjIChEZWJp
YW4gMTIuMi4wLTE0KSAxMi4yLjAKc3BhcnNlOgkJdjAuNi40LTM5LWdjZTFhNjcyMGY2OWUKY2hl
Y2twYXRjaC5wbDoJVmVyc2lvbjogMC4zMiAobWQ1c3VtIDQ3ZWYzMjdkNzcyYzE1NmU1M2EzNjU5
NzcyM2ZjNzgxKQpndGFnczoJCWd0YWdzIChHbG9iYWwpIDYuNi45CgpJIHJlY29tbWVuZCBpbnN0
YWxsaW5nIHNwYXJzZSBkaXJlY3RseSBmcm9tIGdpdCwgaXQncyBxdWl0ZSBlYXN5OgoKaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2RldmVsL3NwYXJzZS9zcGFyc2UuZ2l0LwoKPiAvaG9t
ZS93Z29uZy9vcGVuc291cmNlL2tlcm5lbC9hdGgvLi9hdGgxMmstY2hlY2s6MzI6Cj4gRGVwcmVj
YXRpb25XYXJuaW5nOiBUaGUgZGlzdHV0aWxzIHBhY2thZ2UgaXMgZGVwcmVjYXRlZCBhbmQgc2xh
dGVkIGZvcgo+IHJlbW92YWwgaW4gUHl0aG9uIDMuMTIuIFVzZSBzZXR1cHRvb2xzIG9yIGNoZWNr
IFBFUCA2MzIgZm9yIHBvdGVudGlhbAo+IGFsdGVybmF0aXZlcwo+IMKgIGltcG9ydCBkaXN0dXRp
bHMuc3Bhd24KCkkgZG9uJ3Qgc2VlIHRoaXMgd2FybmluZyBvbiBEZWJpYW4gMTIgYnV0IEknbGwg
bmVlZCB0byBmaXggdGhhdCBhcyB3ZWxsLgpCdXQgdGhpcyBpcyB3aGF0IEkgaGF0ZSB3aXRoIHB5
dGhvbiwgdGhleSBhcmUgYWx3YXlzIGRlcHJhY2F0aW5nCnNvbWV0aGluZyBhbmQgaXQncyBleHRy
YSB3b3JrIGZvciB1cy4KCi0tIApodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3Qv
bGludXgtd2lyZWxlc3MvbGlzdC8KCmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2Vu
L2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKLS0gCmF0aDEyayBt
YWlsaW5nIGxpc3QKYXRoMTJrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cHM6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTJrCg==
