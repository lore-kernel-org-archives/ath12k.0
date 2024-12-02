Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C5AD10DC0
	for <ath12k@archiver.kernel.org>; Mon,  2 Dec 2024 08:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:To:Subject:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2RypotoTqnnOo6RVIEuW0U9F79btIF0fS3MtOa1rjU8=; b=Xt0HXGAMaMZSLn+zIrf4UClHC9
	XnBjpBI6KfSGfJhbLDuycJ968tcrlzNYBDFcpdqtV5C73WNZLqrtfnLwh64I9i1p7Cax+xi4xkrFn
	U3xUkpaExl7PoWaOEE5UggvjwGlWRNT80uB7m2H2qO1tv9uQuSemWnsQJaTz0e5fkiQe6aJmst6W2
	6tYDUF0ZV0ggddXlJSem30+JJOSiFSHP21jf4j4JCVm3Q223yWZoPk5kgVzbY96iQkiAfMeOT2E7E
	lm+pX0frA2FKsBxW75cFIUPXJAchbPzXX3vxjJbUx7CMMnlaaUswWl1dLAS5K376XYhGibIrH7XuA
	AQZIvfUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI25y-00000005Srr-2MSa
	for ath12k@archiver.kernel.org;
	Mon, 02 Dec 2024 08:47:54 +0000
Received: from ionic.de ([2001:41d0:700:3394:1::2] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI25v-00000005SqZ-2Ima
	for ath12k@lists.infradead.org;
	Mon, 02 Dec 2024 08:47:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1733129267; bh=2RypotoTqnnOo6RVIEuW0U9F79btIF0fS3MtOa1rjU8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=VjBOis8ybVr8Drs18fRZBIWLPh7HaH7Us2FOLiTrPFEQn0AxpDAw3Kx51dqmQjN9I
	 u59hIEXBo7J6fXSQTxu6GeDtHru6c8wPs5ejkiypI2h68lEAFhym+1fockzij7bLr8
	 XjwS25R/A3iCTR5Y9c8zyC4L9LwjurILvMDnWrvU=
Received: from [172.22.111.213] (185.102.219.38.adsl.inet-telecom.org [185.102.219.38])
	by mail.ionic.de (Postfix) with ESMTPSA id 162CF1480FD3;
	Mon, 02 Dec 2024 09:47:47 +0100 (CET)
Message-ID: <3833e16a-4209-4ce9-8c40-a5d41827a1f3@ionic.de>
Date: Mon, 2 Dec 2024 09:47:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] wifi: ath12k: store and send country code to
 firmware after recovery
To: Kang Yang <quic_kangyang@quicinc.com>, ath12k@lists.infradead.org
References: <20241017030927.1695-1-quic_kangyang@quicinc.com>
 <303a0926-e622-4fa2-ada7-05c7d758b778@ionic.de>
 <5176a1d1-c08c-4506-9dea-9aed4e54e3b7@quicinc.com>
Content-Language: en-US
From: Mihai Moldovan <ionic@ionic.de>
Autocrypt: addr=ionic@ionic.de; keydata=
 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
 S0VlnF9z
In-Reply-To: <5176a1d1-c08c-4506-9dea-9aed4e54e3b7@quicinc.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------AeLvz117D0yy0x6pUHikL1us"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_004752_062144_BA212085 
X-CRM114-Status: GOOD (  21.51  )
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
--------------AeLvz117D0yy0x6pUHikL1us
Content-Type: multipart/mixed; boundary="------------AbLivT9tXrMNdJ1HUR9Bh9Cf";
 protected-headers="v1"
From: Mihai Moldovan <ionic@ionic.de>
To: Kang Yang <quic_kangyang@quicinc.com>, ath12k@lists.infradead.org
Message-ID: <3833e16a-4209-4ce9-8c40-a5d41827a1f3@ionic.de>
Subject: Re: [PATCH v6 0/4] wifi: ath12k: store and send country code to
 firmware after recovery
References: <20241017030927.1695-1-quic_kangyang@quicinc.com>
 <303a0926-e622-4fa2-ada7-05c7d758b778@ionic.de>
 <5176a1d1-c08c-4506-9dea-9aed4e54e3b7@quicinc.com>
In-Reply-To: <5176a1d1-c08c-4506-9dea-9aed4e54e3b7@quicinc.com>

--------------AbLivT9tXrMNdJ1HUR9Bh9Cf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KiBPbiAxMi8yLzI0IDAyOjUzLCBLYW5nIFlhbmcgd3JvdGU6DQo+IE9uIDExLzI5LzIwMjQg
ODoxOCBQTSwgTWloYWkgTW9sZG92YW4gd3JvdGU6DQo+PiBIYXZlIHlvdSB0ZXN0ZWQgdGhp
cyBpbiBBUCBtb2RlIG9yIHdhcyB0ZXN0aW5nIGxpbWl0ZWQgdG8gU1RBIG1vZGU/DQo+IA0K
PiBOb3QgeWV0Lg0KDQpPa2F5LCBzbyBhIHVzZWZ1bCBoZWFkcy11cCwgSSBndWVzcyENCg0K
DQo+PiBFdmVuIHdpdGggdGhpcyBwYXRjaCBzZXQsIGhvc3RhcGQgZmFpbHMgdG8gc3RhcnQg
b24gYSBjaGFubmVsIHRoYXQgaXMNCj4+IGRpc2FibGVkIGluIHRoZSBkZWZhdWx0IHJlZ2Rv
bWFpbiwgZXZlbiBpZiAxMWQgaXMgZW5hYmxlZCBhbmQgYSBDQw0KPj4gc3BlY2lmaWVkLCBl
dmVuIGFmdGVyIGEgQ0MgdXBkYXRlIGlzIHJlcXVlc3RlZCBhbmQgQ0hBTkVMX0xJU1RfVVBE
QVRFIGlzDQo+PiBiZWluZyByZWNlaXZlZC4NCj4+DQo+IA0KPiBXaGF0IGlzIHRoZSBwcm9i
YWJpbGl0eSBvZiBmYWlsdXJlPw0KDQpJbiBteSB0ZXN0cywgMTAwICUgcmVwcm9kdWNpYmxl
LCBidXQgSSBhZG1pdCBJIGhhdmVuJ3Qgc3RyZXNzLXRlc3RlZCBpdC4NCg0KSXQgYWx3YXlz
IGZhaWxzIHRoZSBmaXJzdCB0aW1lIGhvc3RhcGQgaXMgc3RhcnRlZCBpZiB0aGUgZGVmYXVs
dCBydWxlcyBkZWZpbmUgDQpOT19JUiBvbiB0aGUgY2hhbm5lbCB5b3Ugd2FudCB0byB1c2Ug
KGV2ZW4gaWYgQ0MgcnVsZXMgZGlzYWdyZWUpIGFuZCBjYW4gYWxzbyANCmVhc2lseSBiZSBy
ZXByb2R1Y2VkIGJ5LCBlLmcuLCB1c2luZyBjaGFubmVsIDEwMCB3aXRoIGhvc3RhcGQgYW5k
IHNldHRpbmcgQ0MgZm9yIA0KaW5zdGFuY2UgdG8gREUgb3IgVVMgaW4gdGhlIGhvc3RhcGQg
Y29uZmlnIGZpbGU6DQoNCiMgQ2hpbmVzZSByZWd1bGF0b3J5IGRvZXMgbm90IGFsbG93IG9w
ZXJhdGlvbiBvbiBjaGFubmVscyA5NiB0byAxMjguDQppdyByZWcgc2V0IENOOyBob3N0YXBk
IC4uLiA9PiBmYWlscw0KaXcgcmVnIHNldCBERTsgaG9zdGFwZCAuLi4gPT4gd29ya3MNCg0K
THVja2lseSBpdCdzIHJlYWxseSBlYXN5IHRvIHJlcHJvZHVjZS4NCg0KDQpob3N0YXBkIGlz
IHNwZWNpYWwgaW4gdGhlIHNlbnNlIHRoYXQgaXQncyB1c2luZyBuZXRsaW5rIGRpcmVjdGx5
IGFuZCB0aGlzIGlzIA0KcHJvYmFibHkgdmVyeSBmYXN0Lg0KDQpJIHdhcyBuZXZlciBhYmxl
IHRvIHJlcHJvZHVjZSB0aGUgaXNzdWUgd2l0aCBpdyByZWcgc2V0IENOOyBpdyByZWcgc2V0
IERFOyBpdyANCmxpc3QsIGJ1dCBJIGRvbid0IGZpbmQgdGhhdCBzdXJwcmlzaW5nIGR1ZSB0
byBhbGwgdGhlIG92ZXJoZWFkIGFuZCBoaWdobHkgDQpkaWZmZXJlbnQgY29kZSBwYXRoLg0K
DQoNCj4+IFlvdSByZWNlbnRseSByZS1zdWJtaXR0ZWQgYSBwYXRjaCBzZXQgZm9yIGF0aDEx
ayBieSBXZW4gR29uZ1swXSB0aGF0IGlzDQo+PiBzdXBwb3NlZCB0byBmaXggYSByYWNlIGNv
bmRpdGlvbiBkdXJpbmcgcmVnIHVwZGF0ZXMgYW5kIHRoaXMgc21lbGxzIGxpa2UNCj4+IHRo
ZSBzYW1lIGlzc3VlLiBJJ2xsIHRyeSB0byBwb3J0IGl0IHRvIGF0aDEyayBvbiB0b3Agb2Yg
dGhpcyBwYXRjaCBzZXQNCj4+IHRvIHNlZSBpZiBpdCBmaXhlcyB0aGlzIGlzc3VlLg0KPj4N
Cj4+DQo+IA0KPiBUaGFua3MgZm9yIHRyeWluZywgY3VycmVudGx5LCBpJ20gb2NjdXBpZWQg
Ynkgb3RoZXIgdGFza3MuLi4NCg0KQWxsIGdvb2QuDQoNCklmIGFuZCB3aGVuIHlvdSB0cnks
IGFub3RoZXIgaGVhZHMtdXA6IGF0aDEyayBpcyBjdXJyZW50bHkgcnVubmluZyBpbnRvIGFu
IHJ0bG4gDQpkZWFkbG9jayBxdWl0ZSBvZnRlbiAoYnV0IG5vdCBhbHdheXMpIHdoZW4gaG9z
dGFwZCBpcyBzdG9wcGVkIChvciBmYWlscykgYmVjYXVzZSANCnRoYXQncyBhbHNvIGJyaW5n
aW5nIHRoZSBpbnRlcmZhY2UgZG93bi4NCg0KRm9ydHVuYXRlbHksIEJhb2NoZW4gUWlhbmcg
cG9ydGVkIHRoZSBmaXggZm9yIHRoaXMgaXNzdWUgZnJvbSBhdGgxMWsgdG8gDQphdGgxMmtb
MF0sIGJ1dCBpdCB3YXNuJ3QgYXBwbGllZCB0byBhdGgtbmV4dCBvciBtYWluIHlldCwgc28g
eW91IHdpbGwgbGlrZWx5IHNlZSANCmEgdmVyeSBpcnJpdGF0aW5nIGRlYWRsb2NrIHJlcXVp
cmluZyBhIGhhcmQgbWFjaGluZSByZXNldCBpZiB5b3UgZG9uJ3QgYWxzbyB1c2UgDQpoaXMg
cGF0Y2ggd2hlbiB0ZXN0aW5nLg0KDQpIaXMgcGF0Y2gsIGFwYXJ0IGZyb20gZml4aW5nIHRo
ZSBkZWFkbG9jaywgYWxzbyBwb3J0cyBzb21lIHBhcnRzIG9mIHRoZSBhdGgxMWsgDQpwYXRj
aCBzZXQgSSBtZW50aW9uZWQgaW4gbXkgcHJldmlvdXMgbWFpbCwgYnV0IHVuZm9ydHVuYXRl
bHkgZG9lc24ndCBmaXggdGhlIA0KY2hhbiBsaXN0IHVwZGF0ZSByYWNlIEknbSBzZWVpbmcu
DQoNCkknbGwgZGlnIGZ1cnRoZXIgaW50byBpdCBhbmQgaG9wZSB0byBjb21lIHVwIHdpdGgg
c29tZXRoaW5nIHVzYWJsZSBpbiB0aGUgbmV4dCANCmZldyBkYXlzLg0KDQoNCg0KTWloYWkN
Cg0KDQpbMF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYXRoMTJrLzIwMjQwODMwMDIzOTAx
LjIwNDc0Ni0xLXF1aWNfYnFpYW5nQHF1aWNpbmMuY29tLw0K

--------------AbLivT9tXrMNdJ1HUR9Bh9Cf--

--------------AeLvz117D0yy0x6pUHikL1us
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEbhHQj3UzgcdE8cg8H9Yu2W4lOocFAmdNdDEFAwAAAAAACgkQH9Yu2W4lOoeM
HhAA2jjxopXrubBp38bwg1xgmIt5R4KcEftWTuYGi/h0i7o5I9tyNsT0YjFnO1hgdgQhMnRvNKgv
ZgKvfxFV9PQ+R1pZiTb2pRtGbnPoJjJxLXncJbXeI+J1cyzSMaQ9KbtHMh0gaxDXXj7mstXcqhxL
clVR8yhotWkfoTDnaqqaV+tbAsFxIw9AGVcDPyZUxEehKQQloz40HfgEYRMBImtgYpyNHV5EKSir
hhF435WnYcGYCkiY3qSyJ2dtYPLF+kc9qJNzkOG0VQK0hMXZo18OhE1yuVbnK2k11KaGy5p8fUwI
YH0AokUu9iBmvIOG6CUugd1oatrc3YGIdLSjp9H1LH8r3Vgck0ESLEvcbwAeHpjTN5ed4/c0Xepb
DTvSCGElhtmv74cF/NhmpAHGDDaplUfpav92fQjEoqtqop/lJJsEhSdPDKC8YYh6YlaqFg04dtri
RoTmY7WhpOuvGBqneEhdwz9XfhqUlIDjcqKwIo4c3KzN5S6iw6f5MS/P6m6jr0EBDhhWCcGB+mp/
ij/18B0pwCJru1u7DYsp2D5sgfJJJzgX+wQLrroEem8Gk++sGFF4uHrapwXQU7FJntLtrB8Ywfhl
8zfjgfoPNnsSaKHAVJwWChwTFWbxSdrEMPBBt8VQYd6iDQwEubxjvVv/OxPklYMIwJxM/Mde3XNH
mW4=
=PN2W
-----END PGP SIGNATURE-----

--------------AeLvz117D0yy0x6pUHikL1us--

