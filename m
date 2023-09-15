Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F220EE644C
	for <ath12k@archiver.kernel.org>; Fri, 15 Sep 2023 10:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=S/2ydHzyw1NpO2JOf0sYb50gB6fOJmSOyOCI5je9Ea8=; b=cWnsPdgy4YSSK498WMO0/DeCdh
	QOajYLYmnc5aivuDj68xkX7K+p5RrpbasHhm9EnmItA6w+g+QnME8kL7Mq0ioQs+7ToblPNyxLFDp
	tRqnCm5ZyMwzNvz7OpRGG7ijwyWoDp0j8GZnIoox8f/hF0MRU4qNf5hFg1fZm4VTwIUfjXY/dmDtM
	QMhdPipZRnz+02lSJ0ZA5UYDxD+AfbT2MHDv5i0dUACuYNypafRjiqEXctrvG0E5DQD6wqjzPs96/
	OZP4zGvyqu6h6JuyqWH0JK+lBsJnldTbvNNcqDTWfXm1uMKriarqeVZZlJxKuesgqorb/zfcbHrBx
	mk+ByEhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh5hh-00AMMk-31
	for ath12k@archiver.kernel.org;
	Fri, 15 Sep 2023 10:05:37 +0000
Received: from [42.101.60.195] (helo=mail.nfschina.com)
	by bombadil.infradead.org with smtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh5hf-00AMLY-0Q
	for ath12k@lists.infradead.org;
	Fri, 15 Sep 2023 10:05:37 +0000
Received: from [172.30.11.106] (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 959CE60AB00DC;
	Fri, 15 Sep 2023 18:05:30 +0800 (CST)
Message-ID: <5bb164e7-c147-64d1-031d-0ba20cfffa77@nfschina.com>
Date: Fri, 15 Sep 2023 18:05:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH wireless-next 7/9] wifi: ath12k: Remove unnecessary
 (void*) conversions
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, kvalo@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
X-MD-Sfrom: yunchuan@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: yunchuan <yunchuan@nfschina.com>
In-Reply-To: <7427d5aa-902a-4013-8aa9-f986bb5218a4@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_030535_340526_6BBC64A0 
X-CRM114-Status: GOOD (  15.18  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

T24gMjAyMy85LzE1IDAxOjA2LCBKZWZmIEpvaG5zb24gd3JvdGU6Cj4gT24gOS8xMy8yMDIzIDk6
MDUgUE0sIFd1IFl1bmNodWFuIHdyb3RlOgo+PiBObyBuZWVkIGNhc3QgKHZvaWQqKSB0byAoc3Ry
dWN0IGhhbF9yeF9wcGR1X2VuZF91c2VyX3N0YXRzICopLAo+PiAoc3RydWN0IGF0aDEya19yeF9k
ZXNjX2luZm8gKikgb3IgKHN0cnVjdCBoYWxfdHhfbXNkdV9leHRfZGVzYyAqKS4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogV3UgWXVuY2h1YW4gPHl1bmNodWFuQG5mc2NoaW5hLmNvbT4KPj4gLS0tCj4+
IMKgIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMmsvZHBfbW9uLmMgfCA2ICsrLS0tLQo+
PiDCoCBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTJrL2RwX3J4LmPCoCB8IDIgKy0KPj4g
wqAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEyay9kcF90eC5jwqAgfCAyICstCj4+IMKg
IDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEyay9kcF9tb24uYyAKPj4g
Yi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTJrL2RwX21vbi5jCj4+IGluZGV4IGYxZTU3
ZTk4YmRjNi4uNDFjZmU3YmQ4NjVmIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVz
cy9hdGgvYXRoMTJrL2RwX21vbi5jCj4+ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9h
dGgxMmsvZHBfbW9uLmMKPj4gQEAgLTEzLDggKzEzLDcgQEAKPj4gwqAgc3RhdGljIHZvaWQgYXRo
MTJrX2RwX21vbl9yeF9oYW5kbGVfb2ZkbWFfaW5mbyh2b2lkICpyeF90bHYsCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBo
YWxfcnhfdXNlcl9zdGF0dXMgKnJ4X3VzZXJfc3RhdHVzKQo+PiDCoCB7Cj4+IC3CoMKgwqAgc3Ry
dWN0IGhhbF9yeF9wcGR1X2VuZF91c2VyX3N0YXRzICpwcGR1X2VuZF91c2VyID0KPj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoc3RydWN0IGhhbF9yeF9wcGR1X2VuZF91c2VyX3N0
YXRzICopcnhfdGx2Owo+PiArwqDCoMKgIHN0cnVjdCBoYWxfcnhfcHBkdV9lbmRfdXNlcl9zdGF0
cyAqcHBkdV9lbmRfdXNlciA9IHJ4X3RsdjsKPj4gwqAgwqDCoMKgwqDCoCByeF91c2VyX3N0YXR1
cy0+dWxfb2ZkbWFfdXNlcl92MF93b3JkMCA9Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBfX2xlMzJf
dG9fY3B1KHBwZHVfZW5kX3VzZXItPnVzcl9yZXNwX3JlZik7Cj4+IEBAIC0yNiw4ICsyNSw3IEBA
IHN0YXRpYyB2b2lkCj4+IMKgIGF0aDEya19kcF9tb25fcnhfcG9wdWxhdGVfYnl0ZV9jb3VudCh2
b2lkICpyeF90bHYsIHZvaWQgKnBwZHVpbmZvLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgaGFsX3J4X3VzZXJfc3RhdHVzICpyeF91c2VyX3N0
YXR1cykKPj4gwqAgewo+PiAtwqDCoMKgIHN0cnVjdCBoYWxfcnhfcHBkdV9lbmRfdXNlcl9zdGF0
cyAqcHBkdV9lbmRfdXNlciA9Cj4+IC3CoMKgwqDCoMKgwqDCoCAoc3RydWN0IGhhbF9yeF9wcGR1
X2VuZF91c2VyX3N0YXRzICopcnhfdGx2Owo+PiArwqDCoMKgIHN0cnVjdCBoYWxfcnhfcHBkdV9l
bmRfdXNlcl9zdGF0cyAqcHBkdV9lbmRfdXNlciA9IHJ4X3RsdjsKPj4gwqDCoMKgwqDCoCB1MzIg
bXBkdV9va19ieXRlX2NvdW50ID0gCj4+IF9fbGUzMl90b19jcHUocHBkdV9lbmRfdXNlci0+bXBk
dV9va19jbnQpOwo+PiDCoMKgwqDCoMKgIHUzMiBtcGR1X2Vycl9ieXRlX2NvdW50ID0gCj4+IF9f
bGUzMl90b19jcHUocHBkdV9lbmRfdXNlci0+bXBkdV9lcnJfY250KTsKPgo+IGZvciBib3RoIG9m
IHRoZSBhYm92ZSBJTU8gdGhlIGJldHRlciBzb2x1dGlvbiBpcyB0byBjaGFuZ2UgdGhlIAo+IHBy
b3RvdHlwZSB0byByZXBsYWNlIHZvaWQgKnJ4X3RsdiB3aXRoIHN0cnVjdCAKPiBoYWxfcnhfcHBk
dV9lbmRfdXNlcl9zdGF0cyAqcHBkdV9lbmRfdXNlciBhbmQgdG8gcmVtb3ZlIHRoZSBsb2NhbCAK
PiB2YXJpYWJsZQo+Cj4gZnVydGhlciwgSSB0aGluayB5b3UgY2FuIGFkZCBjb25zdCB0byB0aGF0
IHNpbmNlIHRoZSBUTFYgaXMgb25seSByZWFkLCAKPiBub3Qgd3JpdHRlbgo+Cj4gdGhpcyBiZXR0
ZXIgZGVzY3JpYmVzIHRoYXQgdGhlIGZ1bmN0aW9uIHJlcXVpcmVzIGEgc3BlY2lmaWMgZmxhdm9y
IG9mIAo+IFJYIFRMViByYXRoZXIgdGhhbiBoYW5kbGluZyBhbnkgUlggVExWCj4KSGksCgpTb3Vu
ZHMgbGlrZSBhIGdvb2QgaWRlYSwgSSB3aWxsIGNoZWNrIG90aGVyIHBhdGNoZXMgZm9yIHRoaXMg
c2l0dWF0aW9uLgpUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbnMuCgpXdSBZdW5jaHVhbgoKCgot
LSAKYXRoMTJrIG1haWxpbmcgbGlzdAphdGgxMmtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwczov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMmsK
