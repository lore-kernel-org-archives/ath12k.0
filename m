Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCD6D711C8
	for <ath12k@archiver.kernel.org>; Wed, 20 Nov 2024 16:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:To:Subject:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lpCia7H1U+pwFsbYOveLs2fY5obGh53Bq9GJInvWJg=; b=zuAtX4KUC+x1vYwajodrmnmbxY
	CmipVG+OB+BIYQ3r5heg7kX0MaswHF2pIoaPGAo5f8Xn3h16NR4LT3oqksD0hyDBDXEmvHIUy7fQB
	dzktQ74hQucVHh1YK66lJU0KDhFnwJTjCaiJC8l424GF/qsgenghVMO959RDNBhi5bOOANZc64tqP
	XP9hCzsdWydc3nOMpbwaqWL8KZfKGuxu/j6sNGV3gwOAPIqMF+ZaJ5ql4fFctoz9SKzg8I089AC6o
	r8qr1H93Gue/NK9muJbQXO6jfhi/8t1sRdG0LAA0wNtnlYTE7VtqTfNjRnE995+j34RSvMMWIJswd
	Jwnd7gPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDnum-0000000FrAw-4C1i
	for ath12k@archiver.kernel.org;
	Wed, 20 Nov 2024 16:50:53 +0000
Received: from ionic.de ([2001:41d0:700:3394:1::2] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDnug-0000000Fr9A-1bmD
	for ath12k@lists.infradead.org;
	Wed, 20 Nov 2024 16:50:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1732121441; bh=7lpCia7H1U+pwFsbYOveLs2fY5obGh53Bq9GJInvWJg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=algnGWKsyiWmkER9ecXYqPbkn44p+isSjgVyvC+WeVSvYSGVg5QAFpkWJYfotdG0j
	 cG0EkBr461+94labn5yRNuwY1sObAWAdZmFpU4snCklGYkP9UP8/AbwqcDnNflhTU8
	 d1XIyogtrrZ5tVVjT2/vS1wwmSH5b7pXO6yWSOYw=
Received: from [172.22.111.213] (185.102.219.38.adsl.inet-telecom.org [185.102.219.38])
	by mail.ionic.de (Postfix) with ESMTPSA id 235B61480FD3
	for <ath12k@lists.infradead.org>; Wed, 20 Nov 2024 17:50:41 +0100 (CET)
Message-ID: <696369d4-2825-4528-93d8-e732796de1c5@ionic.de>
Date: Wed, 20 Nov 2024 17:50:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] wifi: ath12k: store and send country code to
 firmware after recovery
To: ath12k@lists.infradead.org
References: <20241017030927.1695-1-quic_kangyang@quicinc.com>
 <6fbd8b55-305a-4b22-aac2-9e5ca41993e6@quicinc.com>
Content-Language: en-US
From: Mihai Moldovan <ionic@ionic.de>
Autocrypt: addr=ionic@ionic.de; keydata=
 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
 S0VlnF9z
In-Reply-To: <6fbd8b55-305a-4b22-aac2-9e5ca41993e6@quicinc.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------87sadSA6JelAYTuhrLOM96zg"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_085046_901906_66557A67 
X-CRM114-Status: UNSURE (   7.89  )
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
--------------87sadSA6JelAYTuhrLOM96zg
Content-Type: multipart/mixed; boundary="------------V6v6jm1IbOD4rfQkDoEmce0U";
 protected-headers="v1"
From: Mihai Moldovan <ionic@ionic.de>
To: ath12k@lists.infradead.org
Message-ID: <696369d4-2825-4528-93d8-e732796de1c5@ionic.de>
Subject: Re: [PATCH v6 0/4] wifi: ath12k: store and send country code to
 firmware after recovery
References: <20241017030927.1695-1-quic_kangyang@quicinc.com>
 <6fbd8b55-305a-4b22-aac2-9e5ca41993e6@quicinc.com>
In-Reply-To: <6fbd8b55-305a-4b22-aac2-9e5ca41993e6@quicinc.com>

--------------V6v6jm1IbOD4rfQkDoEmce0U
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KiBPbiAxMC8xNy8yNCAyMDo1NSwgSmVmZiBKb2huc29uIHdyb3RlOg0KPiBUaGlzIHNlcmll
cyBsb29rcyBvayB0byBtZSwgYnV0IGl0IGNvbmZsaWN0cyB3aXRoIHRoZSBNTE8gYnJhbmNo
IHNvIEknbGwgZGVmZXINCj4gdGhpcyB1bnRpbCB0aGUgTUxPIGJyYW5jaCBpcyBtZXJnZWQu
DQoNCkkgY2FuIHVuZGVyc3RhbmQgcHJpb3JpdGl6aW5nIE1MTywgYnV0IHdvdWxkIGxpa2Ug
dG8gcG9pbnQgb3V0IHRoYXQgd2l0aG91dCANCnRoZXNlIGNoYW5nZXMsIEFQIG1vZGUgaXMg
ZXNzZW50aWFsbHkgYnJva2VuL2Rpc2FibGVkIGhhcmQgb24gbm9uLTIuNCBHSHogYmFuZHMg
DQooYW5kIGV2ZW4gdGhlIDIuNCBHSHogYmFuZCBpcyByZXN0cmljdGVkIHRvIGNoYW5uZWxz
IDEgdG8gMTEpLg0KDQpJZiB5b3Ugd2FudCB0bzoNCg0KVGVzdGVkLW9uOiBXQ043ODUwIGh3
Mi4wIFBDSSBXTEFOLkhNVC4xLjAuYzUtMDA0ODEtUUNBSE1UU1dQTF9WMS4wX1YyLjBfU0lM
SUNPTlotMw0KVGVzdGVkLWJ5OiBNaWhhaSBNb2xkb3ZhbiA8aW9uaWNAaW9uaWMuZGU+DQo=


--------------V6v6jm1IbOD4rfQkDoEmce0U--

--------------87sadSA6JelAYTuhrLOM96zg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEbhHQj3UzgcdE8cg8H9Yu2W4lOocFAmc+E2AFAwAAAAAACgkQH9Yu2W4lOoc1
dRAAmNQ1EznSM8g4Vg0HGzpei3vUCqJN/UZxXsCtH21Obsi7YMVFEJ0D/h4GXItPct+N5xiZKMRv
CLlXv7TUU4ixde7uTs4BFoSu4vG0U70banWb1IHXa6D3NvdGJRmgJ5Nx3lm/+t0MCTy4RXZiEEM1
5A/kdPzR6fLk0aAzk6JD101Mf6s4BYn+2XeDO+C6ARAV3rycG3YPDSTw9SDg8gX+UT65nWXdJQXq
zdBttSg26v5j7GojtEiqH6pQt9VYE24kZa/prDhVahcj5npkke6vy/iPcn0D6SUOkmlAOrclZvC4
ZlpQwh2mi9IzXtXw7v1F48sBhJcPJo6ZnqawfURx80xLrin07ilWt0CQ4KhyMuE+Of633K3hnLoB
fN4uT1+8hMhkZt/kAhxCWN/gaPovLKmE/BoeEHFnNjz+WEdlZKLU6Gh5PyZM0Irps0XW+da2sVXk
tdpQaSyMaLb3/pBc5CRV1AkrwdPVj5kZUw87fpJ9n2HjWZpiU9LLGSYnCFBfJI5V6xtSXxjyi5EH
1JAda2hwWnT5midzh7ts1+jPtUlfT5Hv/xRP+uF6sZiHU5Ez6b3V6ERK2/+ZMOH3P/zxK+FVvJK8
U1f0bp8nyu3duHLO7a7CZWQgwt4Ya0Hmy7t3FEojL1FNaXne8GKLUaoldJqC2bEjXRfrniRHfLwE
z6g=
=JZCc
-----END PGP SIGNATURE-----

--------------87sadSA6JelAYTuhrLOM96zg--

