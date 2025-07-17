Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BE8C83F1A
	for <ath12k@archiver.kernel.org>; Thu, 17 Jul 2025 19:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:From:To
	:MIME-Version:Date:Message-ID:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dSXu/2v898K59P4Y9kjCadrXr6rdXFbxtjxpqQnv7Lo=; b=l7ZEmbNpksm1K8wO0n6h1bdCau
	vERnIWhPKNdNeCOXzU/6VYebZ4g/jIZ/yiHbYKKuKeb8kX2Q7T2d4oyQsaVsCcK5TCpZkmJpBMQjw
	HN21MsYMiix9bR7NBnY3E5NyBBb1KqcbqEc6CQ0z+RfPG1fz7UlWyRkqaz3qxg2s6Xq85Md7u5O/O
	DAcl2w58YbowTTPQ58miHlnymwPFq7AL4qXd9yDqsiQ2HgtALa0sz65CNpfjbYnmtvJLP8XCYCFpZ
	EHtmQup+Ejge2ph4abLptyALI9YigLwLWle8ikEeQl9ngNDyXbLmtsIGxq9XgU5dOSNidPC0A/KDF
	E+T+aung==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucTva-0000000Ay0f-1euA;
	Thu, 17 Jul 2025 19:05:58 +0000
Received: from ionic.de ([2001:41d0:700:3394:1::2] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucTvX-0000000Ay0G-1xSw
	for ath12k@lists.infradead.org;
	Thu, 17 Jul 2025 19:05:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1752779150; bh=dSXu/2v898K59P4Y9kjCadrXr6rdXFbxtjxpqQnv7Lo=;
	h=Date:To:From:Subject:From;
	b=QZxOOJZZYZwqoSz2Gj6ftB32usR7Op6G9IWPU6Hdlw1sAWyd0/VgBlkH4kPRyyhod
	 XGI1FpXoTcmyOiKgQBta3cpTReWvj8h7U5z0IhGb9dhC+5KFINT1Eu57P66T1GwW/N
	 0S1NIIHcJRuD4Yf7+CpqPsG5kwk+ZlwkexQIxM98=
Received: from [172.24.215.49] (unknown [185.102.219.57])
	by mail.ionic.de (Postfix) with ESMTPSA id ED985148096F
	for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 21:05:49 +0200 (CEST)
Message-ID: <485f4924-3bed-41eb-8ca1-5d1ccb615ce3@ionic.de>
Date: Thu, 17 Jul 2025 21:05:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: ath12k@lists.infradead.org
From: Mihai Moldovan <ionic@ionic.de>
Subject: WCN7850: DFS broken since 176f3009ae598d0523b2
Autocrypt: addr=ionic@ionic.de; keydata=
 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
 S0VlnF9z
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SZfEis1bh4LiHTPq6NDrb60k"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_120556_012207_A4AA5D15 
X-CRM114-Status: UNSURE (   8.98  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SZfEis1bh4LiHTPq6NDrb60k
Content-Type: multipart/mixed; boundary="------------9G5vpe6ubh8apEcAJ0f8ofId";
 protected-headers="v1"
From: Mihai Moldovan <ionic@ionic.de>
To: ath12k@lists.infradead.org
Message-ID: <485f4924-3bed-41eb-8ca1-5d1ccb615ce3@ionic.de>
Subject: WCN7850: DFS broken since 176f3009ae598d0523b2

--------------9G5vpe6ubh8apEcAJ0f8ofId
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KDQpJbiAxNzZmMzAwOWFlNTk4ZDA1MjNiMjY3ZGIzMTlmZTE2ZjY5NTc3MjMxWzBd
LCByYWRhciBkZXRlY3Qgd2lkdGhzIHdlcmUgcmVtb3ZlZCANCmZvciBzaW5nbGUgcGRldiBk
ZXZpY2VzLCBmdWxseSBkaXNhYmxpbmcgREZTIG9uIFdDTjc4NTAuDQoNCkkgZG8gdW5kZXJz
dGFuZCB0aGF0IHJ1bm5pbmcgREZTIG9uIHR3byBjaGFubmVscyBzaW11bHRhbmVvdXNseSBp
cyAoY3VycmVudGx5PykgDQpub3Qgc3VwcG9ydGVkLCBidXQgdGhpcyBlZmZlY3RpdmVseSBi
cmVha3Mgb3BlcmF0aW9ucyBvbiBhbGwgREZTIGNoYW5uZWxzLCBldmVuIA0KdGhvdWdoIG9u
bHkgb25lIGlzIGJlaW5nIHVzZWQuDQoNCg0KSSd2ZSB0cmllZCByZS1lbmFibGluZyB0aGUg
cmFkYXIgZGV0ZWN0IHdpZHRocywgYnV0IHRoYXQgb25seSBsZWFkIHRvIGFuIA0KaWVlZTgw
MjExIHN1YnN5c3RlbSBlcnJvciAod2hpY2ggSSBoYXZlbid0IGZ1cnRoZXIgZGVidWdnZWQp
IGFuZCBtYWRlIHRoZSBjYXJkIA0KdW51c2FibGUgYmVjYXVzZSBib290aW5nIGl0IHVwIGZh
aWxlZCwgd2hpY2ggcmVxdWlyZWQgYSBmdWxsIHBvd2VyIHNodXRkb3duIG9mIA0KdGhlIG1h
Y2hpbmUgdG8gcmVzZXQgaXQgZnJvbSB0aGlzIGJyb2tlbiBzdGF0ZSAobGl0ZXJhbGx5IGRp
c2Nvbm5lY3RpbmcgcG93ZXIgDQpwaHlzaWNhbGx5IGZvciBhIGZldyBtb21lbnRzKS4NCg0K
U2V0dGluZyBudW1fZGlmZmVyZW50X2NoYW5uZWxzIHRvIDEgZm9yIHNpbmdsZSBwZGV2IGRl
dmljZXMgYW5kIHJlLWVuYWJsaW5nIHRoZSANCnJhZGFyIGRldGVjdCB3aWR0aHMgd29ya3Mg
dG8gcmUtZW5hYmxlIERGUywgYnV0IG5hdHVyYWxseSB0aGF0IGRpc2FibGVzIE1MTy4NCg0K
SSdtIHByb2JhYmx5IGZpbmUgd2l0aCBub3QgaGF2aW5nIE1MTyBjYXBhYmlsaXRpZXMgKGF0
IGxlYXN0IGN1cnJlbnRseSksIGJ1dCANCmhhdmluZyB0byBtb2RpZnkgdGhlIHNvdXJjZSBj
b2RlIHRvIGdldCBERlMgc3VwcG9ydCBiYWNrIGNlcnRhaW5seSBpc24ndCBpZGVhbC4NCg0K
QXJlIHRoZXJlIGFueSBwbGFucyB0byBmaXggREZTIHN1cHBvcnQgZm9yIHNpbmdsZSBwZGV2
IGRldmljZXM/DQoNCg0KTWloYWkNCg0KWzBdIA0KaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5r
LzIwMjUwNDA5LWF0aDEyay13Y243ODUwLW1sby1zdXBwb3J0LXYyLTktMzgwMTEzMmNhMmMz
QHF1aWNpbmMuY29tDQo=

--------------9G5vpe6ubh8apEcAJ0f8ofId--

--------------SZfEis1bh4LiHTPq6NDrb60k
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEbhHQj3UzgcdE8cg8H9Yu2W4lOocFAmh5SY0FAwAAAAAACgkQH9Yu2W4lOodA
Ug/9E+igU6XG/3ziQkhzpCILfiTiMTJ8fS4egUEfSuBee7t4xxRjHbXvFlfafoKTE5waPkOWJMpz
n/Io/EMikvxIp0UZPrbO5YvA1GADZ2p1ZhM4G2DQPmizVt+BPDRlycSfKItvGjb/RzQC4iL8cUU0
dwtX7PFx6xrDa2p+l9gcvV0SBjHj5db8dFDDBu0oejJOwkydwmj6JNKFd2wFPfy3Fe91TV4NA5r4
wpPNcRQSaQp9WqER5AGm7zFiLIweeuBQnHVdXesK+j9XHy0QcUrkIxsyQCzCikYuXRbTsbGYcHhZ
hzhyrE2mI2ciEKBRzsH8iVqCaK5vWGFwOhU39WD+dJ1QUPCyvRZmSlLvlDz2jFT3g5osK6CDPPNe
7MQlZwh7/1xmCaqYtRqibkQcXhGcSblG5W3dGKcr4IKrRQWftKALGlms3CVnaECV2W9ZdtlAQ7Ba
wNV5BZVIi0ZzExNvZDNp1cYQZ1nbT7Xt21UvCkSd9uNCfAXo7Vu5mpGWRbCS1JFRdNIOD92jGh4X
A6mczvBIsHTF4QA9g58Zt3sKF7ZG17T5jUThQxEQO/RSqdsvoLggHm6k2LFYiuK++SaliFTDobSl
FJ0U8mHy/pRmCN3zaCnoPuB0iwThGigHyWB/sDhBxYF0JSZQTkOStd94C7Fwdq09UHE0KFWeqE38
PIY=
=/x7B
-----END PGP SIGNATURE-----

--------------SZfEis1bh4LiHTPq6NDrb60k--

