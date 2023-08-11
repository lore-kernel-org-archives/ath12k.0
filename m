Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985DCC04A6A
	for <ath12k@archiver.kernel.org>; Fri, 11 Aug 2023 09:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NQoCzCYYmjTWcs2AqVqbRnkwcYMdT8j3qx4HxIXkBKY=; b=U78mzDSLl7/sUc
	bxKwWU3kq+d8B4ips6SMOG5LHejxSHAasYbI9+4hCdietChe0NUl/roheRw8y1bqqaq9j4Yea00OF
	1F7sCz+EwyOuHar1tq46qdoBtAHm1Jc9X+3YDX+F+jBXOymQ4MUK/8XYfUd+hcmYiqkNRw8aoUsgu
	1SqCsuttq7BSBYtMz4P4J3jsRqZqFiIhH1VZX7D+Va2d+IcIBsDPAIbn5GyPgXGIgB53hkalOKB7a
	juYOHwn1XnAN0MqhaqUNJoFx2Cip/K5QETmgV6gaSyUXbyBLJAC46AMXlddivjwUryWrpqs5X4Qet
	WhjX5RX1J2S15C9n/TVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUOQp-009yFT-0i
	for ath12k@archiver.kernel.org;
	Fri, 11 Aug 2023 09:27:43 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUOQm-009yEP-32
	for ath12k@lists.infradead.org;
	Fri, 11 Aug 2023 09:27:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=zmfVfOKd0cmYZ9LiURywzOadDhZw5drhnkJZBl9fPMM=;
	t=1691746060; x=1692955660; b=QqBAgEjDeFitEgR5xAJa77moT31S/fbNZQL26bBdpO+U0Qu
	zSX4QaKAwYecAs7mrYkUp86YLzsrtL3pU/BCv/64/+3pyi2uv26OFrlm3nFbcYhT2iVDAX/Crbdq6
	tSP2uWvZzk19JWTkmVRnElWxfrYoAa6sW+GW+Bwhd3cqMbfDvUgiINXnRjUV6x1AtY1LAyrnar6gf
	kxJRYPrL8NDa+GBiKc4agNPlXAup/crXUOb/o2ewT4eunugNrxkedQ1xp9knm5sFEALmVnV2KCSGu
	ME/1D6tGCE5HAStWxSx5elX8QgYYoKqkg5bX4o/Sl3IUoqbbhmg/aZUa0yG/fz8A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qUOQk-000pjM-0I;
	Fri, 11 Aug 2023 11:27:38 +0200
Message-ID: <1ec93eca79a7bc96c1498b771c3b6ea2ebc78d95.camel@sipsolutions.net>
Subject: Re: [PATCH 61/76] wifi: nl80211: add EML/MLD capabilities to
 per-iftype capabilities
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org
Cc: ath12k@lists.infradead.org, quic_rkaliapp@quicinc.com
Date: Fri, 11 Aug 2023 11:27:37 +0200
In-Reply-To: <29ab2b41-0adf-3a04-6eb9-3d5666253eb9@quicinc.com>
References: <20220713094502.163926-1-johannes@sipsolutions.net>
	 <20220713114426.4dfc9ebd0461.Ice7b841051cfeb23da17bb2caa0e45191b34c4db@changeid>
	 <d2f17799-6d90-9d72-a389-565163d723d2@quicinc.com>
	 <f577425e2d4fd6141c29bcbfbea919565da9326d.camel@sipsolutions.net>
	 <cc6b83eb-ac30-34fc-4827-290a9ae25378@quicinc.com>
	 <8627bb8a3dddc33be7f1f97f30fc0f716328ff81.camel@sipsolutions.net>
	 <29ab2b41-0adf-3a04-6eb9-3d5666253eb9@quicinc.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_022740_984351_653F5A81 
X-CRM114-Status: GOOD (  14.80  )
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

T24gRnJpLCAyMDIzLTA4LTExIGF0IDE3OjI0ICswODAwLCBXZW4gR29uZyB3cm90ZToKPiA+IAo+
ID4gQW5kIGFnYWluLCB3aGF0IHdvdWxkIHlvdSBkbyB3aXRoIGl0PyBOb3QgYWR2ZXJ0aXNlIEVN
TCB3aGVuIHlvdSBoYXZlCj4gPiBzZWxlY3RlZCBsaW5rcyB0aGF0IGFyZSBub3QgaW4gdGhlIG1h
cD8gQW5kIGlmIHRoZSBsaW5rcyBjaGFuZ2UKPiA+IGR5bmFtaWNhbGx5IGluIHRoZSBmdXR1cmU/
IFlvdSdkIHByb2JhYmx5IG5lZWQgYSBidW5jaCBvZiB2YWxpZGF0aW9uIGZvcgo+ID4gdGhhdC4K
PiBGb3IgZXhhbXBsZSwgZm9yIHN0YXRpb24sIE5PVCBzdXBwb3J0IEVNTCBvbiAyIEdIeiwgc3Vw
cG9ydCBFTUwgb24gNSAKPiBHSHovNiBHSHouCj4gCj4gV2hlbiBjb25uZWN0IHRvIDIvMyBsaW5r
cyBBUCwgdGhlbiBFTUwgc2hvdWxkIE5PVCBhZGQgaW4gYXNzb2MgcmVxIHdoaWxlIAo+IGNvbm5l
Y3QgdG8gQVAgd2hpY2ggaXMgMiBHSHorNSBHSHogb3IgMiBHSHorNiBHSHogb3IgMiBHSHorNSBH
SHorNiBHSHouCj4gCj4gRU1MIHNob3VsZCBhZGQgaW4gYXNzb2MgcmVxIHdoaWxlIGNvbm5lY3Qg
dG8gQVAgd2hpY2ggaXMgNSBHSHorNiBHSHouCgpPSywgYXQgbGVhc3QgdGhhdCBhbnN3ZXJzIHRo
ZSBxdWVzdGlvbiB3aGF0IHlvdSdkIHdhbnQgdG8gZG8gd2l0aCBpdCA6KQoKPiBGb3IgZHluYW1p
YyBsaW5rIGNoYW5nZSwgaXQgaXMgYW5vdGhlciBuZXcgdG9waWMsIHNvIEkgaGF2ZSBub3QgZ29v
ZCBhZHZpc2UKPiBmb3IgdGhhdC7wn5iBCgpCdXQgZXZlcnlvbmUncyBsb29raW5nIGF0IHRoYXQ/
CgpIb25lc3RseSBJJ20gbm90IGV2ZW4gc3VyZSAtIGFuZCB5b3UgbWlnaHQga25vdyBiZXR0ZXIg
LSB3aGF0IHRoZSBFTUwKY2FwYWJpbGl0aWVzIG1hdHRlciBmb3IgaWYgeW91IG5ldmVyIGVuYWJs
ZSBFTUwuCgpTbyBhbG1vc3QgZmVlbHMgbGlrZSBpZiB5b3UgbmV2ZXIgc2VuZCB0aGUgRU1MIE9N
TiBmcmFtZSAodGhhbmtzIGZvciB0aGUKbmFtZSEpIHRoZSBBUCB3b3VsZG4ndCByZWFsbHkgY2Fy
ZSwgYW5kIHRoYXQncyBzb21ldGhpbmcgeW91IGNvdWxkIGRvCnZlcnkgZWFzaWx5IHdpdGhvdXQg
Y2hhbmdpbmcgaXQsIGkuZS4geW91IHByZXRlbmQgdGhhdCB5b3VyIDIuNCBHSHoKYWN0dWFsbHkg
aGFzIEVNTCwgeW91IGp1c3QgbmV2ZXIgZW5hYmxlIGl0IGluIGNhc2UgMi40IEdIeiBpcyBhY3Rp
dmU/Cgpqb2hhbm5lcwoKLS0gCmF0aDEyayBtYWlsaW5nIGxpc3QKYXRoMTJrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRo
MTJrCg==
