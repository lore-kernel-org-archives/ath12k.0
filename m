Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A29A606A31A
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 04:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nf44zMuE;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=HFAL8oBg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dszobB3X2DrniL8erhzzfrWDq5pb/IBtHAO2jhrc3yU=; b=nf44zMuEFCdLNy
	b3ijTVjixDri59ciaAzTXHmsXyz8XeZyBX/k0TYePhHiuXs9yTG6qQNv3W9rDSSVT+gYfqNWfLWvd
	5mqPZCRYdAVJy9Yr56xGWEOZn6G9hjU+jG64eo/SomjgNgFB678zjuRW4R1u/sTLiOUM8nNv3SsIE
	QvNZf12+BnA+2ne/6yOlFHUDy5o4h5opsr3dP1ye7o+FsQZ+pvk60XonrZNClwKwksS+i6aDg6AUw
	e+ZEVHPM9U0eBxnS39/tMG3+bpQBMQ7o7iIEirzZGDFVs0vMsa4E/IFFQrzYr9bw2EWp2CTxuVhyA
	kyBloY3xqTQMROLdtOLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHcp-00000008JcH-1t7H;
	Thu, 29 Oct 2026 04:20:27 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHcm-00000008Jbf-1eGW;
	Thu, 29 Oct 2026 04:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=dszobB3X2DrniL8erhzzfrWDq5pb/IBtHAO2jhrc3yU=; b=H
	FAL8oBgmwoNdNsmUEIoIzFvYhUo22vwkN2AWtBjPP8+YvnWdF5fwutQoRRVV0VZT
	4Kgu3d8dr9EVDzis9MM/9KJYyqXtYLPyUCgRscChJCPmWCNyeyIeeQh9h2que45o
	luOmz5WUHISLQ0t+G8/zcFQyPbzxacfnpA6XMyPt54=
Received: from 19888972804$163.com ( [2610:150:c001:15:81:7818:302a:b455] )
 by ajax-webmail-wmsvr-40-102 (Coremail) ; Thu, 29 Oct 2026 12:20:13 +0800
 (CST)
Date: Thu, 29 Oct 2026 12:20:13 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>
Cc: "Jeff Johnson" <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, ath12k@lists.infradead.org
Subject: Re:Re: [PATCH 0/5] wifi: ath11k/ath12k: validate capability TLV
 lengths
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <35ec209a-a62c-4fd9-aaba-edeed86dedf5@oss.qualcomm.com>
References: <20261028051254.147628-1-yaojiale02@163.com>
 <35ec209a-a62c-4fd9-aaba-edeed86dedf5@oss.qualcomm.com>
X-NTES-SC: AL_Qu2SAf6fuE4q5SSbY+kcn08ShO49XMOyvfoi2YFTc+0EoDzV3BInXF1gPGDxz8mkDT2vlyCFSTp15+JbY6xAC4wuYCmzPzzZjti2WuOfog==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <551c02b7.3ba4.1a185e31205.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZigvCgD3P75+yeJq8SNjAA--.1075W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7x7kH2riyX73gQAA3D
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_212024_813330_D30AD627 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QXQgMjAyNi0xMC0yOSAwODoyODoxMCwgIkplZmYgSm9obnNvbiIgPGplZmYuam9obnNvbkBvc3Mu
cXVhbGNvbW0uY29tPiB3cm90ZToKPk9uIDEwLzI3LzIwMjYgMTA6MTIgUE0sIEppYWxlIFlhbyB3
cm90ZToKPj4gU2V2ZXJhbCBhdGgxMWsgYW5kIGF0aDEyayBXTUkgcGFyc2VycyBjb3VudCBmaXJt
d2FyZSBUTFZzIGFuZCBsYXRlcgo+PiBjb25zdW1lIHRoZW0gYXMgYXJyYXlzIG9mIGNvbXBsZXRl
IGNhcGFiaWxpdHkgc3RydWN0dXJlcy4gIFRoZSBnZW5lcmljCj4+IGl0ZXJhdG9yIHZhbGlkYXRl
cyB0aGF0IGEgVExWIGZpdHMgaW4gaXRzIGVuY2xvc2luZyBtZXNzYWdlLCBidXQgdGhlc2UKPj4g
dGFncyBoYXZlIG5vIG1pbmltdW0tbGVuZ3RoIHBvbGljaWVzLCBzbyBhIHNob3J0IGVsZW1lbnQg
Y2FuIHN0aWxsIGNhdXNlCj4+IGFuIG91dC1vZi1ib3VuZHMgc3RydWN0dXJlIHJlYWQuCj4+IAo+
PiBBZGQgcG9saWNpZXMgZm9yIHRoZSBETUEgYnVmZmVyIHJlbGVhc2UsIGhhcmR3YXJlIG1vZGUs
IERNQSByaW5nLCBhbmQKPj4gZXh0ZW5kZWQgTUFDL1BIWSBjYXBhYmlsaXR5IFRMVnMgdXNlZCBi
eSB0aGVzZSBwYXRocy4KPj4gCj4+IEppYWxlIFlhbyAoNSk6Cj4+ICAgd2lmaTogYXRoMTFrOiB2
YWxpZGF0ZSBETUEgYnVmZmVyIHJlbGVhc2UgVExWIGxlbmd0aHMKPj4gICB3aWZpOiBhdGgxMWs6
IHZhbGlkYXRlIGhhcmR3YXJlIG1vZGUgY2FwYWJpbGl0eSBUTFZzCj4+ICAgd2lmaTogYXRoMTFr
OiB2YWxpZGF0ZSBETUEgcmluZyBjYXBhYmlsaXR5IFRMVnMKPj4gICB3aWZpOiBhdGgxMms6IHZh
bGlkYXRlIERNQSBidWZmZXIgcmVsZWFzZSBmaXhlZCBUTFYgbGVuZ3RoCj4+ICAgd2lmaTogYXRo
MTJrOiB2YWxpZGF0ZSBzZXJ2aWNlLXJlYWR5IGNhcGFiaWxpdHkgVExWIGxlbmd0aHMKPj4gCj4+
ICBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL3dtaS5jIHwgOCArKysrKysrKwo+PiAg
ZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEyay93bWkuYyB8IDggKysrKysrKysKPj4gIDIg
ZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQo+PiAKPgo+SSB3YXMgc3VycHJpc2VkIGJ5
IHRoZSBhc3ltbWV0cnkgYmV0d2VlbiBwYXRjaCAxICh3aGljaCBqdXN0IGFkZGVkIHZhbGlkYXRp
b24KPnRvIHRoZSBhcnJheSBlbnRyeSBUTFZzKSBhbmQgcGF0Y2ggNCAod2hpY2gganVzdCBhZGRl
ZCB2YWxpZGF0aW9uIHRvIHRoZSBmaXhlZAo+cGFyYW1zIFRMVikuIEFmdGVyIGEgc2Vzc2lvbiB3
aXRoIGFuIExMTSB3ZSBjYW1lIHRvIHRoZSBjb25jbHVzaW9uIHRoYXQgYm90aAo+YXJlIGluY29t
cGxldGU6Cj4KPlRoZSBETUEtYnVmLXJlbGVhc2UgZXZlbnQgaGFzIHR3byBpbmRlcGVuZGVudCBP
T0Igc2lua3MgaW4gZWFjaCBkcml2ZXIg4oCUIGEKPmZpeGVkLWhlYWRlciBjb3B5IGFuZCBhIGZp
eGVkLXN0cmlkZSBhcnJheSB3YWxrLiBCb3RoIGRyaXZlcnMgYXJlIGFmZmVjdGVkIGJ5Cj5ib3Ro
LiBUaGUgc2VyaWVzIGZpeGVzIG9ubHkgb25lIHNpbmsgcGVyIGRyaXZlciwgYW5kIGluIGEgY29t
cGxlbWVudGFyeQo+cGF0dGVybiB0aGF0IG1ha2VzIGVhY2ggZHJpdmVyIGxvb2sgImRvbmUiIGF0
IGEgZ2xhbmNlIGJ1dCBsZWF2ZXMgZWFjaCBvbmUKPmhhbGYtY292ZXJlZDoKPgo+LSBhdGgxMWs6
IHBhdGNoIDEgZ3VhcmRzIHRoZSBhcnJheSBlbGVtZW50cyAoX0VOVFJZLCBfTUVUQV9EQVRBKSDi
nIUgYnV0IHRoZQo+Zml4ZWQtaGVhZGVyIG1lbWNweSBhdCB3bWkuYzo0NjY5ICgxNiBieXRlcywg
dW5jb25kaXRpb25hbCwgZnJvbSBmaXJtd2FyZQo+cGF5bG9hZCkgaXMgc3RpbGwgdW5ndWFyZGVk
LiBOZWVkcyB0aGUgW1dNSV9UQUdfRE1BX0JVRl9SRUxFQVNFXSBwb2xpY3kuCj4tIGF0aDEyazog
cGF0Y2ggNCBndWFyZHMgdGhlIGZpeGVkIGhlYWRlciDinIUgYnV0IHRoZSBhcnJheSBzdHJpZGUg
cmVhZHMKPmV2LT5idWZfZW50cnlbaV0gLyBldi0+bWV0YV9kYXRhW2ldIGluIGRicmluZy5jIGFy
ZSBzdGlsbCB1bmd1YXJkZWQuIE5lZWRzIHRoZQo+W1dNSV9UQUdfRE1BX0JVRl9SRUxFQVNFX0VO
VFJZXSBhbmQgWy4uLl9TUEVDVFJBTF9NRVRBX0RBVEFdIHBvbGljaWVzLgo+Cj5BbmQgc2luY2Ug
eW91IGFyZSBwbGF5aW5nIGluIHRoaXMgYXJlYSwgbXkgTExNIHRoaW5rcyB0aGF0Cj5XTUlfVEFH
X0hBTF9SRUdfQ0FQQUJJTElUSUVTX0VYVCBoYXMgdGhpcyBpc3N1ZSBpbiBib3RoIGRyaXZlcnMs
IGFuZCB0aGlua3MKPnRoYXQgV01JX1RBR19SU1NJX1NUQVRTIG1heSBoYXZlIHRoaXMgaXNzdWUu
IEkgaGF2ZW4ndCB2ZXJpZmllZCB0aGF0IGFuYWx5c2lzLgoKQWdyZWUsIHRoZSB1cGRhdGVkIG9u
ZSBpcyBoZXJlLCBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjYxMDI5MDQxODExLjIz
Nzk4NzgtMS15YW9qaWFsZTAyQDE2My5jb20vCj4KPi9qZWZmCg==

