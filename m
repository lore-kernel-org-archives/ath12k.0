Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF18DE7717D
	for <ath12k@archiver.kernel.org>; Wed, 11 Dec 2024 16:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:To:Subject:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKfZ0u/IEKLisj1oouQOSY+3ZWOCKv1UR7KjCE6C8WU=; b=lo/shXrrVTMsnGNpxwiJ1pku+F
	kxNPbN9jZvZK48OYC+e4SLFQVGQtxtwRlUvc14MsDNwJLYnyKeFFFMCwqfEZ/mc9sI7AtlPoLM0ta
	QyVTPXqed9PsHDum8zvmzouHoPopWeKZfeTVDag447/1UsAwo+vc2i1Z6mHriNICveOL4bZvFW37v
	5b4HiF/0oy3aimt8w8X9cZQ2L0w8LSMWy7U331ac5wu8fVde7DXEH50DSGdIpcFWawS2FMCg+FyKS
	XfzwrwD9FhZXt2d6V5K2d5Qf8SdNzeKhpzVIIFTRzeAMMJCauLAqKlbkubnlqdQVAJDyYnkO0Wd21
	b4ZQBTkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPLi-0000000FPbu-2JMh
	for ath12k@archiver.kernel.org;
	Wed, 11 Dec 2024 16:14:06 +0000
Received: from ionic.de ([145.239.234.145] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPLg-0000000FPbG-0cEq
	for ath12k@lists.infradead.org;
	Wed, 11 Dec 2024 16:14:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1733933641; bh=YKfZ0u/IEKLisj1oouQOSY+3ZWOCKv1UR7KjCE6C8WU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Jy2scvGqL8pHU+IdFArY7/eu+U59Td7tWz46bnRu3X85sVxJmGC1IRQms0YA3QZJN
	 n13W769MGB2/T5ix25zUKpWyCD4VfeYFgCQEsYeEvRU0kVhjOEavmOQwTxWZfEw9VW
	 iOXEGjA+Sieck3uFmrB+F5dDe1GlvsoJgrpsg3JI=
Received: from [172.22.111.213] (185.102.219.38.adsl.inet-telecom.org [185.102.219.38])
	by mail.ionic.de (Postfix) with ESMTPSA id A7E4814886C9;
	Wed, 11 Dec 2024 17:14:01 +0100 (CET)
Message-ID: <375e2541-d86a-423a-a9fc-d12c71430606@ionic.de>
Date: Wed, 11 Dec 2024 17:14:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] [PATCH] wifi: ath12k: wait for chan update in reg_notifier
To: Kang Yang <quic_kangyang@quicinc.com>, ath12k@lists.infradead.org
References: <3833e16a-4209-4ce9-8c40-a5d41827a1f3@ionic.de>
 <20241017030927.1695-1-quic_kangyang@quicinc.com>
 <303a0926-e622-4fa2-ada7-05c7d758b778@ionic.de>
 <5176a1d1-c08c-4506-9dea-9aed4e54e3b7@quicinc.com>
 <8b2a2c54f34c60f2170bd0cfc01c602dbb8e5d96.1733780780.git.ionic@ionic.de>
 <71b9b05a-55b0-4727-a1a1-eb57afe55637@ionic.de>
 <3e22a453-5667-4c02-8b74-65db2f8b776a@quicinc.com>
Content-Language: en-US
From: Mihai Moldovan <ionic@ionic.de>
Autocrypt: addr=ionic@ionic.de; keydata=
 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
 S0VlnF9z
In-Reply-To: <3e22a453-5667-4c02-8b74-65db2f8b776a@quicinc.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EVMU1mUOu806GitCZz21gZua"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_081404_345482_7CAF57D0 
X-CRM114-Status: UNSURE (   5.49  )
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
--------------EVMU1mUOu806GitCZz21gZua
Content-Type: multipart/mixed; boundary="------------T2p2WaoK4nH6d5S9O2V0lyqg";
 protected-headers="v1"
From: Mihai Moldovan <ionic@ionic.de>
To: Kang Yang <quic_kangyang@quicinc.com>, ath12k@lists.infradead.org
Message-ID: <375e2541-d86a-423a-a9fc-d12c71430606@ionic.de>
Subject: Re: [RFC] [PATCH] wifi: ath12k: wait for chan update in reg_notifier
References: <3833e16a-4209-4ce9-8c40-a5d41827a1f3@ionic.de>
 <20241017030927.1695-1-quic_kangyang@quicinc.com>
 <303a0926-e622-4fa2-ada7-05c7d758b778@ionic.de>
 <5176a1d1-c08c-4506-9dea-9aed4e54e3b7@quicinc.com>
 <8b2a2c54f34c60f2170bd0cfc01c602dbb8e5d96.1733780780.git.ionic@ionic.de>
 <71b9b05a-55b0-4727-a1a1-eb57afe55637@ionic.de>
 <3e22a453-5667-4c02-8b74-65db2f8b776a@quicinc.com>
In-Reply-To: <3e22a453-5667-4c02-8b74-65db2f8b776a@quicinc.com>

--------------T2p2WaoK4nH6d5S9O2V0lyqg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KiBPbiAxMi8xMS8yNCAwMzoxOCwgS2FuZyBZYW5nIHdyb3RlOg0KPiBJIHdpbGwgcmV2aWV3
IGFuZCB0ZXN0IHlvdXIgIlJGQyB2MiINCg0KRG9uJ3QgdGVzdCBpdCB5ZXQuDQoNCkkgZm91
bmQgb3V0IHRoYXQgaXQncyBicm9rZW4gd2hlbiBzd2l0Y2hpbmcgYmV0d2VlbiByZWdkb21z
IChydW5uaW5nIGludG8gdGhlIA0KdGltZW91dCkgdmlhOg0KDQppdyByZWcgc2V0IENODQpp
dyByZWcgc2V0IERFDQouLi4NCg0KV2lsbCBoYXZlIHRvIGZpeCB0aGF0IGZpcnN0LiBXYWl0
IGZvciB2My4NCg0KDQoNCk1paGFpDQo=

--------------T2p2WaoK4nH6d5S9O2V0lyqg--

--------------EVMU1mUOu806GitCZz21gZua
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEbhHQj3UzgcdE8cg8H9Yu2W4lOocFAmdZukkFAwAAAAAACgkQH9Yu2W4lOods
3xAA3GkNMyOjIuG/Dfun94/74s6wvuDlKCv0sqTjxahC7TTV+aJNAmjVtYQ5AflKvlaodOeE3IMd
gzHgXHad7lqFbXOoT7ALK32pVmhu6TIR7oShIoALcfEm8RbGZjQA2+F73E7O+TScRRRSP/h2+Hyf
EF32HPKakEQ5/mZVAj/BKXvjTFuyi0V0fktrv3/864d6cnHHWYvwvfGNX/LOBh29yzFFN9UAC5mu
0hGNw3PrUjncyfZkA+rsu7qWzNDoGhMTVBdPeJcXTYjVra2kbZ4z64X647/TnGsuCjSqpi05uuOc
NYyqTz2zDV2bhJzVdSsnl6XAdhRFlR2Rm5n1EU7Do4cTR5liMERbb63WHss9YUnoRwZQMEXO+u/j
gOz0gNVQwZ0qSsdg1TrjpNmbO4yimBP9S5HnbP132IWu28o/PxRG8U/No5HzY6E4kSJBODHYJ7Tr
FK0bCmT69qImDE6eUT+Nqbm1YxEgEQ/RiteAqyakZX4X3qMuzL228wlSrAJ16tkKEjPniNd9Q7TH
xe/rn+oPLgPIV6LigKhUy3cXscv27ajjaB3srswtSJR7axZ+SwE3lWJj/z6IdaZH8v6PbocA2CEE
FIcRwEe6SJWeKPgqEwJ/YkwDBmP0w+8HVmjpLbaLvy9pE4KryqxVHwfce8T9j+R2SkbHlbWQ98/H
19w=
=oTc/
-----END PGP SIGNATURE-----

--------------EVMU1mUOu806GitCZz21gZua--

