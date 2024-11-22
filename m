Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50099E6918F
	for <ath12k@archiver.kernel.org>; Fri, 22 Nov 2024 20:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJTvosLLjNvEIYt4x3YHllXp44PuQdpLXjJ2x/+x72U=; b=Csfrs2z2yOHIHvZDBDAc/8wsd2
	AmjgsgXJxfmezdOlG5c17yCGBlI/PIbwvrHnJQg+x8Bbu4Pble3VB3KzFstGnLKJ4inbPTnp6g+QK
	8oBvPRMmqFtQ3Qu5KoIbaa7nJQeAgMfn6ydM3ZM+azsoEpytrOHWQhE1ysVN/gCvRlgXwMnCMgMJQ
	BNZq0oq+5JzK20id32YKWb5gGmVGC7CY3MWJf+wUmOtkUC9ArCHcDyj2tqamDY9SCTaMhKMOEvFyJ
	6fvMKKtbAeZeL1ewzunXPsST3ZIKob5F80e+ACrOkrmV7Kk8w3W/xucG+6fJBwiKQszqyGFhRkvf4
	OCNFFJMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEa5n-00000003GSP-00qL
	for ath12k@archiver.kernel.org;
	Fri, 22 Nov 2024 20:17:27 +0000
Received: from ionic.de ([145.239.234.145] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEa5k-00000003GQn-0Qge
	for ath12k@lists.infradead.org;
	Fri, 22 Nov 2024 20:17:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1732306642; bh=fJTvosLLjNvEIYt4x3YHllXp44PuQdpLXjJ2x/+x72U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kwE0qhiuvC7gS7xYzXZJu4Gy6YUAOgJ+RjvnbVJXdRU0iQy33lgojoFUWNjog/EPJ
	 QOQc49UHMDFJdZkNpdYW/G7oTdtPVpezozuh5xbuXnurvTMaouZ3/zLLoMs/F6Q7++
	 /+RqpYlmJ+VOhOQ8EalCjbFGUeJcfd2BK/dljpio=
Received: from [172.22.111.213] (185.102.219.38.adsl.inet-telecom.org [185.102.219.38])
	by mail.ionic.de (Postfix) with ESMTPSA id 8D50B1487394;
	Fri, 22 Nov 2024 21:17:22 +0100 (CET)
Message-ID: <24d73c76-ee87-46ba-b3d2-b2a73014d77b@ionic.de>
Date: Fri, 22 Nov 2024 21:17:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] wifi: ath12k: store and send country code to
 firmware after recovery
To: Kalle Valo <kvalo@kernel.org>
Cc: ath12k@lists.infradead.org
References: <20241017030927.1695-1-quic_kangyang@quicinc.com>
 <6fbd8b55-305a-4b22-aac2-9e5ca41993e6@quicinc.com>
 <696369d4-2825-4528-93d8-e732796de1c5@ionic.de> <877c8wyhk3.fsf@kernel.org>
Content-Language: en-US
From: Mihai Moldovan <ionic@ionic.de>
Autocrypt: addr=ionic@ionic.de; keydata=
 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
 S0VlnF9z
In-Reply-To: <877c8wyhk3.fsf@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NU8UvuAd6Kg9XQSVFGhkb3HE"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_121724_303198_6E582635 
X-CRM114-Status: UNSURE (   8.59  )
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
--------------NU8UvuAd6Kg9XQSVFGhkb3HE
Content-Type: multipart/mixed; boundary="------------gxSM87trrNVNbzNkDlCGTUId";
 protected-headers="v1"
From: Mihai Moldovan <ionic@ionic.de>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath12k@lists.infradead.org
Message-ID: <24d73c76-ee87-46ba-b3d2-b2a73014d77b@ionic.de>
Subject: Re: [PATCH v6 0/4] wifi: ath12k: store and send country code to
 firmware after recovery
References: <20241017030927.1695-1-quic_kangyang@quicinc.com>
 <6fbd8b55-305a-4b22-aac2-9e5ca41993e6@quicinc.com>
 <696369d4-2825-4528-93d8-e732796de1c5@ionic.de> <877c8wyhk3.fsf@kernel.org>
In-Reply-To: <877c8wyhk3.fsf@kernel.org>

--------------gxSM87trrNVNbzNkDlCGTUId
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KiBPbiAxMS8yMS8yNCAxMjowMywgS2FsbGUgVmFsbyB3cm90ZToNCj4gQnV0IHRoaXMgaXMg
bm90IGEgcmVncmVzc2lvbiwgcmlnaHQ/IEkgbWVhbiwgaGFzIGl0IGJlZW4gYWx3YXlzIGJy
b2tlbj8NCg0KWWVhaCwgdHJ1ZSwgdG8gdGhlIGJlc3Qgb2YgbXkga25vd2xlZGdlLCBydW5u
aW5nIGFuIEFQIG5ldmVyIHdvcmtlZCBvbiBhIG5vbi0yLjQgDQpHSHogYmFuZCB3aXRoIGF0
aDEyayBzaW5jZSBpdHMgaW5jZXB0aW9uLCBzbyBpdCdzIG5vdCBhIHJlZ3Jlc3Npb24uDQoN
Cg0KSnVzdCB3YW50ZWQgdG8gcG9pbnQgdGhhdCBvdXQgYW5kIG9mZmVyIG15IHRlc3Rpbmcg
aW5wdXQgdGhhdCBpdCB3b3JrcyB3aXRoIHRoaXMgDQpwYXRjaCBzZXQgZm9yIHRoZSBoYXJk
d2FyZSBJIHRlc3RlZC4NCg0KDQoNCk1paGFpDQo=

--------------gxSM87trrNVNbzNkDlCGTUId--

--------------NU8UvuAd6Kg9XQSVFGhkb3HE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEbhHQj3UzgcdE8cg8H9Yu2W4lOocFAmdA5tEFAwAAAAAACgkQH9Yu2W4lOocS
ahAAq/0cKkw2pos2WDtxiWDUTyCtYdKH1NDH07eu2NmlwhqZ2XXe27j8vMcNcrDNwy7n4wNHEaG0
XRNZYq67IeHD1WmSA1MJa4uZGt/h+mQcbfuK8fG4d3/qQ7hAfBqxNjClKxXlxEww6oLQH7PaH2FF
21PIt1nvMulCJ95o/Z5CFHG0K2KnaumUTIzXU8J5aBegrUXJQGYoRyHqsiLovI+lx7Hvb0gAJsus
gTwxrpaeeueYDaAkID3vVB3PL9dEtq4jB58mQa65zObYsiqy+0d6yorBeHgl4lAVh10BNZuuJVcA
G9rjmmZLji7f/MUVRKAU2JlRjf9GFpGi8Mmb2cCGG4E5er0BjFcGwBIoYrmO3rxkhf5tMM0NEpCL
9yUw+zAZeioeu+LkkTmLgb52LGYzm75DXHVMHIa+T5J50IQi6We16IHjhovFe/bNlx03NTwXHIJ6
KcaPG6B72dwBzJOpbdcdSGVMlpZEHgEloHQakcfbpb1pQx6KZ8nnz7yziHw5F65azLMkOWxVXf3w
W23Qn57hWTVeByKagfhYonJxNvvwxwRpFbVM2X7/3DRAsKXqj7/IDewAtYrFloIlV+M9vVo1irfO
z92NzFCFqG6B4RdLyMaMZrGcq//5dxmUC0IeP7msG7ywMU0azC3poK1tQMK5X+pVXc7ZpKDlxB5m
UbA=
=JrjU
-----END PGP SIGNATURE-----

--------------NU8UvuAd6Kg9XQSVFGhkb3HE--

