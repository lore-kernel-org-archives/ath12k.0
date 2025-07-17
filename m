Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA73C83F34
	for <ath12k@archiver.kernel.org>; Thu, 17 Jul 2025 21:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:To:Subject:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UptPfaa7VtrnZ6mzYP+6qAvy7jYOSAPpqcj3CAk4gbw=; b=oEANTZ648D1zJYR3pZIbaKagvY
	0oI17zRg+T5JgV9K5SfbsnVkYTUgwNE5xX8cMY2TKNET6jufSxECPvkEvjMI/WwjTQDjDl5vGiUnD
	Oo29jTgENjdW52+lnfFi2nAeHTCPwFQXzPx9d+tEubCqvqAZOtcjlH6SP/RAb1/HGBGhHPD9BaraY
	mbaGYBVkRAYSsuXzHwycfILO/Qgs8y+js3i+09sQwvbrAax5/0eIFbqRb0agMIqn7FhLGqvMTJCy6
	JapgBEijsLMJDpw/UNvMxLCpysSxXRSEiIGCU5jAv4UFnwHU2iTCtfh/PUq7ej+IRQOBz9H1PJWYp
	A9Z2zpaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucVrE-0000000B9Sl-3Ndd;
	Thu, 17 Jul 2025 21:09:36 +0000
Received: from ionic.de ([2001:41d0:700:3394:1::2] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucVrB-0000000B9SG-3sNa
	for ath12k@lists.infradead.org;
	Thu, 17 Jul 2025 21:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1752786570; bh=UptPfaa7VtrnZ6mzYP+6qAvy7jYOSAPpqcj3CAk4gbw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=jGeyAn8jdQWtx94NAfmfsk7k9zwGNjJhGI7VsimbE3WOQGgfWaTOtF9CgtcjrvLRH
	 LMZJ8akqIaLZsdR9W2QZME5iSbX4icye3rYU6IZFWmosPpvWhiQV3nMVzmJ90jqdZ9
	 c3iXbv52AtV1G/BLy20Dn8RUWOPfti1y++PvFWGM=
Received: from [172.24.215.49] (unknown [185.102.219.57])
	by mail.ionic.de (Postfix) with ESMTPSA id DCD711480AF7
	for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 23:09:30 +0200 (CEST)
Message-ID: <0c1b3bf9-8e05-42da-87ff-673ef79a1e89@ionic.de>
Date: Thu, 17 Jul 2025 23:09:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WCN7850: DFS broken since 176f3009ae598d0523b2
To: ath12k@lists.infradead.org
References: <485f4924-3bed-41eb-8ca1-5d1ccb615ce3@ionic.de>
 <047cc072-ed79-48cb-8869-fe72a5d7703c@oss.qualcomm.com>
Content-Language: en-US
From: Mihai Moldovan <ionic@ionic.de>
Autocrypt: addr=ionic@ionic.de; keydata=
 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
 S0VlnF9z
In-Reply-To: <047cc072-ed79-48cb-8869-fe72a5d7703c@oss.qualcomm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Y0MlOfAld0cP3WdYDmOAD4OM"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_140934_159256_ED2BB9F5 
X-CRM114-Status: UNSURE (   7.55  )
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
--------------Y0MlOfAld0cP3WdYDmOAD4OM
Content-Type: multipart/mixed; boundary="------------ycSjXW0sQZ54Nsf8hDSFdOdH";
 protected-headers="v1"
From: Mihai Moldovan <ionic@ionic.de>
To: ath12k@lists.infradead.org
Message-ID: <0c1b3bf9-8e05-42da-87ff-673ef79a1e89@ionic.de>
Subject: Re: WCN7850: DFS broken since 176f3009ae598d0523b2
References: <485f4924-3bed-41eb-8ca1-5d1ccb615ce3@ionic.de>
 <047cc072-ed79-48cb-8869-fe72a5d7703c@oss.qualcomm.com>
In-Reply-To: <047cc072-ed79-48cb-8869-fe72a5d7703c@oss.qualcomm.com>

--------------ycSjXW0sQZ54Nsf8hDSFdOdH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KiBPbiA3LzE3LzI1IDIxOjE3LCBKZWZmIEpvaG5zb24gd3JvdGU6DQo+IENhbiB5b3UgcGxl
YXNlIG9wZW4gYSB0aWNrZXQgaW4gQnVnemlsbGEgc28gdGhpcyBjYW4gYmUgdHJhY2tlZD8N
Cg0KVGhhbmtzLCBkb25lLCB3aXRoIHNsaWdodGx5IGFtZW5kZWQgY29udGVudCB0byBwb2lu
dCBvdXQgdGhhdCBvbmx5IGJlYWNvbmluZyANCm1vZGVzIGFyZSBhZmZlY3RlZCAobmF0dXJh
bGx5KTogaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMjAz
NDYNCg0KDQpXaGlsZSB0aGF0IHRlY2huaWNhbGx5IGlzIGEgcmVncmVzc2lvbiwgSSB3b3Vs
ZG4ndCBoYXZlIGNhbGxlZCBpdCBhcyBzdWNoIG9yIGEgDQpidWcsIGJlY2F1c2UgdGhlIGJy
ZWFrYWdlIHdhcyBkZWxpYmVyYXRlIGFjY29yZGluZyB0byB0aGUgY29tbWl0IG1lc3NhZ2Uu
IEl0IA0KanVzdCBzdHJ1Y2sgbWUgb2RkIHRoYXQgbm90aGluZyB3YXMgZG9uZSBhYm91dCB0
aGlzIGV2ZW4gdGhyZWUgbW9udGhzIGFmdGVyIHRoZSANCmRlbGliZXJhdGUgY2hhbmdlIC0g
ZXNwZWNpYWxseSB0aGF0IHRoZXJlIGlzIG5vIHdheSB0byBlYXNpbHkgZ2V0IGJhY2sgREZT
IA0Kc3VwcG9ydCBpbiBub24tTUxPIHNldHVwcy4NCg0KDQoNCk1paGFpDQo=

--------------ycSjXW0sQZ54Nsf8hDSFdOdH--

--------------Y0MlOfAld0cP3WdYDmOAD4OM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEbhHQj3UzgcdE8cg8H9Yu2W4lOocFAmh5ZooFAwAAAAAACgkQH9Yu2W4lOoeq
ZRAA428ga9u7nx0A230w/z+bMYe5UF9gmL4MbgwWMHXwKaQc2Zy1pFbYOAxOEPCZkmBNOO0vAIq9
mLdT69Cp6R1XVLokbMqm3AqNW1n9ck5EEdg1R+9DXFY206wtngy0REAiqzilbkpzGwckQ1ENci5R
x1TX7FYJ963u1vueEiS2mOqjx9aHGRx1Kdr3DJeicrW8s2tgG+U8lCwEdNFP7n7h/M2FcCxiZtVM
PTIfZXkuTUqgo3aKWf+RaDLtXu+mZ//jGZKIJUgoCHiJDW/FubPIwzcutCsCLnBe69jdQ61IOJZz
B3RfKj9TuVAixKcUnUb0xtyEC4SgFFxi+LTkSgZuTGQvaCGy7pX8HdxluDeFOy/2WNcFJ+VhyZnN
fQP5oLANV44u+M1E3t4cVEQOpqfTMH4bjBFDPt6no8T0gJxzSLpDW5qYhKjweY0gaG06nQDDgutV
EGxoj3THJpt0a1Xm+GRonc39KwpdoTedAR2Rbf9DcLZ1MOFfWIcWOl8x2JRct8/seiEcWfeb0X/g
/tv+7jJ/fTmn9QA0MaF/V2t+FS8kOgOdcjHiKLIYmhqqrVbAVKI2aq9bxpbeJzMf30bz0WEaBgnb
Bc09dXKH8h+UaeVNeUSzDyhw1602PQaRCruwthNP1Ek8SDRw0kYNgdC02wYPe4v+8GS1JfhIjkPo
ElM=
=CLlo
-----END PGP SIGNATURE-----

--------------Y0MlOfAld0cP3WdYDmOAD4OM--

