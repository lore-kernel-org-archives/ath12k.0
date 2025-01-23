Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798E5C0218B
	for <ath12k@archiver.kernel.org>; Thu, 23 Jan 2025 11:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfLLiiHoqdrsC/WZjkpRlG6mbVSuzitipeozNWTDfMk=; b=PLrq9pgWNZTfA0B5kQP4CaQw9L
	C7leV2vYlYOHyMMAZh6ihItaa//m5EnZotfcIDNO2Wcsn31+4WdBi7XRUqNDSfZJ5zFoHNgx7OcjG
	LIbj2TeH80mHpPQD3j3gQ6mGj2FG+wqesj77l+7+bWdZw7teID9nNrGQ0sAqolmAD/kXtplXcbdha
	1JCMJ+fibcXUBD8kXy0m5J6HN0YC8LzEVZI/as9HeZL8KkUqZXT5ZPAmMRuZHd4Mqh7yb2YPqOlVx
	Q06A9VgaJ+ps5QTCSKa3L6x8LPBdUB8XIiDyH30QSqgGS/taRLPiujXDOl8u+UKD1Rpq139vVzqhQ
	j3ENCiCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tavV9-0000000CLcL-13ws
	for ath12k@archiver.kernel.org;
	Thu, 23 Jan 2025 11:35:59 +0000
Received: from ns.iliad.fr ([212.27.33.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tavV5-0000000CLbw-3DqM
	for ath12k@lists.infradead.org;
	Thu, 23 Jan 2025 11:35:57 +0000
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id 6395F200F2;
	Thu, 23 Jan 2025 12:35:54 +0100 (CET)
Received: from [192.168.108.70] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id 54B282008A;
	Thu, 23 Jan 2025 12:35:54 +0100 (CET)
Message-ID: <600e45a74fc3ca1bedc12c273a84966fdfa3d908.camel@freebox.fr>
Subject: Re: [PATCH V5 4/6] wifi: ath12k: add 6 GHz params in peer assoc
 command
From: Maxime Bizon <mbizon@freebox.fr>
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Avula Sri Charan
 <quic_asrichar@quicinc.com>
Date: Thu, 23 Jan 2025 12:35:54 +0100
In-Reply-To: <20240508173655.22191-5-quic_pradeepc@quicinc.com>
References: <20240508173655.22191-1-quic_pradeepc@quicinc.com>
	 <20240508173655.22191-5-quic_pradeepc@quicinc.com>
Organization: Freebox
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_033555_949110_97B8D2A8 
X-CRM114-Status: UNSURE (   6.08  )
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

Ck9uIFdlZCwgMjAyNC0wNS0wOCBhdCAxMDozNiAtMDcwMCwgUHJhZGVlcCBLdW1hciBDaGl0cmFw
dSB3cm90ZToKCkhlbGxvLAoKVGhpcyBwYXRjaCBoYXMgYmVlbiBtZXJnZWQsIGJ1dCB0aGVyZSBt
YXkgYmUgYSBidWcgaGVyZToKCj4gK8KgwqDCoMKgwqDCoMKgaWYgKHN0YS0+ZGVmbGluay5iYW5k
d2lkdGggPT0gSUVFRTgwMjExX1NUQV9SWF9CV180MCkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgYXJnLT5id180MCA9IHRydWU7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGlmIChzdGEt
PmRlZmxpbmsuYmFuZHdpZHRoID09IElFRUU4MDIxMV9TVEFfUlhfQldfODApCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGFyZy0+YndfODAgPSB0cnVlOwo+ICsKPiArwqDCoMKgwqDC
oMKgwqBpZiAoc3RhLT5kZWZsaW5rLmJhbmR3aWR0aCA9PSBJRUVFODAyMTFfU1RBX1JYX0JXXzE2
MCkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYXJnLT5id18xNjAgPSB0cnVlOwo+
ICsKPiArwqDCoMKgwqDCoMKgwqBpZiAoc3RhLT5kZWZsaW5rLmJhbmR3aWR0aCA9PSBJRUVFODAy
MTFfU1RBX1JYX0JXXzMyMCkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYXJnLT5i
d18zMjAgPSB0cnVlOwo+ICsKCgpEb3duc3RyZWFtIGRyaXZlciBkb2VzIHRoaXMgaW5zdGVhZDoK
CmlmIChzdGEtPmRlZmxpbmsuYmFuZHdpZHRoID49IElFRUU4MDIxMV9TVEFfUlhfQldfNDApCglh
cmctPmJ3XzQwICA9IHRydWUKWy4uLl0KCgpTbyBmb3IgYSAzMjBNaHogU1RBLCBid180MC84MC8x
NjAvMzIwIGFyZSBzZXQsIHJlc3VsdGluZyBpbiBtdWx0aXBsZQpiaXRzIFdNSV9QRUVSX3h4eE1I
WiBzZXQgdGhlIGFzc29jaWF0ZWQgV01JIGNvbW1hbmQuCgpXaGljaCBvbmUgaXMgY29ycmVjdCA/
CgooVGhpcyBpcyBmb3IgRUhULCBidXQgdGhlIHNhbWUgYXBwbGllcyBmb3IgVkhUL0hFIGNvZGUp
CgotLSAKTWF4aW1lCgoKCg==


