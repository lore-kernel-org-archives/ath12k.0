Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7B9C02192
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 12:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NXtro45yHa54yGSeJZVdFjFxpeMWIXKzW3cPWwq1Msc=; b=c2LtYIkd9jyAOAZks7vpBCR8Id
	6hU30X4bALNEvYcmSsEzzEcTQMq57HL0u+71F/SitnbaLC2rJ+gbBpkBz34SlO+nUxMUONq/t4UFa
	VzIrX00sF9qQHdLFsbu3OsdepEEZOPT6essZ/ECxkqy8iSOQniYms42R8XMnR4YVFHl3ocG6EkHJq
	eU3L/omX6YL7hfevA9j+fGVEEu/xHPJhjTNnQ1/BCmXysJ+0ivvegl68kh4gcbBKIRirteQFh3d6Q
	932x6Deb3PdoWZIW3KdXeJSs2N+4VE0pD2l8uAh03bD8rWE3kHZMjvRX1Qmw5VFEfdaWKpMF+rFmv
	uvY2EZTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tev8E-0000000FJDL-1xQ6
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 12:00:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tethC-0000000F7SU-0Nos
	for ath12k@bombadil.infradead.org;
	Mon, 03 Feb 2025 10:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:Reply-To:From:Subject:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=NXtro45yHa54yGSeJZVdFjFxpeMWIXKzW3cPWwq1Msc=; b=ORA4fvx80E7ciQF+ml0UnGdgcU
	+nm4Bg9nw6mPjkiyL3cn+6xOC1VcHa7ASolt3YGgXTOacFmVnsWi7vKZjcqBMVrMXTk1UAI65aK8G
	y3TEC0FSZGhOYxAmXn6OgI9nVYMfH0jQIeUCSTAzM/f4xmtBEetttyTQdIkf53zVRPuTMlSYmqUps
	V7vPCU1uySrum940/I+lTqs/gwtQb9OMzA2Q7uMTxCZs12KauPRvkYElvWP+nmyRel25Ornn1W6Ew
	9llWro8BSHvBqiNb3FfwDE9A8gZ+YfjrxGHtGLSwP8tdQOzOKeqfyAOqT5qK3hVIUMw2Bq6LZ8npS
	A+vUr8Og==;
Received: from ns.iliad.fr ([212.27.33.1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teth7-0000000G3sd-2TRs
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 10:28:48 +0000
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id D665F2061E;
	Mon,  3 Feb 2025 11:28:40 +0100 (CET)
Received: from [192.168.108.70] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id C84AE200C7;
	Mon,  3 Feb 2025 11:28:40 +0100 (CET)
Message-ID: <bddeb2c0867139e801845c65a78fd415460bd398.camel@freebox.fr>
Subject: Re: [PATCH v9 7/9] wifi: ath12k: clean up 80P80 support
From: Maxime Bizon <mbizon@freebox.fr>
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Mon, 03 Feb 2025 11:28:40 +0100
In-Reply-To: <20250114003813.2783550-8-quic_pradeepc@quicinc.com>
References: <20250114003813.2783550-1-quic_pradeepc@quicinc.com>
	 <20250114003813.2783550-8-quic_pradeepc@quicinc.com>
Organization: Freebox
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_102845_804582_99828746 
X-CRM114-Status: UNSURE (   7.74  )
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
Reply-To: mbizon@freebox.fr
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Ck9uIE1vbiwgMjAyNS0wMS0xMyBhdCAxNjozOCAtMDgwMCwgUHJhZGVlcCBLdW1hciBDaGl0cmFw
dSB3cm90ZToKCkhlbGxvLAoKPiBAQCAtMjg1OSwxNiArMjg0OCwxMSBAQCBzdGF0aWMgZW51bSB3
bWlfcGh5X21vZGUgYXRoMTJrX21hY19nZXRfcGh5bW9kZV92aHQoc3RydWN0IGF0aDEyayAqYXIs
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBp
ZWVlODAyMTFfbGlua19zdGEgKmxpbmtfc3RhKQo+IMKgewo+IMKgwqDCoMKgwqDCoMKgwqBpZiAo
bGlua19zdGEtPmJhbmR3aWR0aCA9PSBJRUVFODAyMTFfU1RBX1JYX0JXXzE2MCkgewo+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzd2l0Y2ggKGxpbmtfc3RhLT52aHRfY2FwLmNhcCAm
Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBJRUVFODAy
MTFfVkhUX0NBUF9TVVBQX0NIQU5fV0lEVEhfTUFTSykgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBjYXNlIElFRUU4MDIxMV9WSFRfQ0FQX1NVUFBfQ0hBTl9XSURUSF8xNjBNSFo6
Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4g
TU9ERV8xMUFDX1ZIVDE2MDsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY2FzZSBJ
RUVFODAyMTFfVkhUX0NBUF9TVVBQX0NIQU5fV0lEVEhfMTYwXzgwUExVUzgwTUhaOgo+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIE1PREVfMTFB
Q19WSFQ4MF84MDsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGVmYXVsdDoKPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qIG5vdCBzdXJl
IGlmIHRoaXMgaXMgYSB2YWxpZCBjYXNlPyAqLwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBpZiAobGlua19zdGEtPnZodF9jYXAuY2FwICYKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIElFRUU4MDIxMV9WSFRfQ0FQX1NVUFBfQ0hBTl9XSURUSF8xNjBNSFop
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJu
IE1PREVfMTFBQ19WSFQxNjA7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiAr
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBNT0RFX1VOS05PV047CgoK
VGhpcyBicmVha3MgVkhUIDE2ME1oeiBmb3IgU1RBIHdpdGggTlNTIHJlc3RyaWN0aW9uLgoKVGhv
c2UgZG9uJ3Qgc2V0IFZIVF9DQVBfU1VQUF9DSEFOX1dJRFRIXzE2ME1IWiAoc2VlCklFRUU4MDIx
MV9WSFRfRVhUX05TU19CV19DQVBBQkxFKQoKLS0gCk1heGltZQoKCgo=


