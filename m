Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A65DC9832F
	for <ath12k@archiver.kernel.org>; Mon, 28 Sep 2026 08:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DgIijiOieQQQ7TMGtuFw8s0h9KrytUXh1lfPR7+jo7U=; b=jez5olPhbYZYIsilyIDJQKfhbu
	bSgQbt2gbdg6ccTd9h/M3GVQSJK3N3EKqQq3C7WMPaq1yLaEiJsU+0lipEq8wCcJPzZuK1VO2Qno6
	dPkYKJV+0UajQMCQIU37aQKKSuD7B5sAtQS5rDCNS6K0d89AjGGzwGsziJQt7L0vzRuOI0jkPHp1q
	DaA22IV9ZU49M+L+QQqCrUKWs/BhMiIKKnIPb+H79+XmvSF83pf/mf7K7QH4k43O5iGRFDMnK1lB3
	uERi1Vr6l/CP16ZBjyQTVo4Gpo+YvsbqKd00w1Jx7Q1CNSAtmfXj09lQi7TDnm/tIYuFEZYQkHvgK
	4dLvKQGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6hA-000000005DO-3gYr;
	Mon, 28 Sep 2026 08:26:44 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6h8-000000005Bx-2M8Y
	for ath12k@lists.infradead.org;
	Mon, 28 Sep 2026 08:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=DgIijiOieQQQ7TMGtuFw8s0h9KrytUXh1lfPR7+jo7U=; b=G
	iTsy/9EzXaddxq/QORplh0h9EiYjI5AHvxcWCAHuPfBP+o6t5DTBjAWvBKaDiopw
	7gyagsV1kAcKKPmZ2VeVdgeltC2v6tsBiieygITgzOMDZMJoFIozhIwr8uo484bM
	rOFJAeqCcX85DyiUCjuVf9EhJxmQosHKTURfzsvR/8=
Date: Mon, 28 Sep 2026 16:26:28 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Rameshkumar Sundaram" <rameshkumar.sundaram@oss.qualcomm.com>
Cc: "Jeff Johnson" <jjohnson@kernel.org>,
	"Bhagavathi Perumal S" <quic_bperumal@quicinc.com>,
	"Balamurugan Selvarajan" <quic_bselvara@quicinc.com>,
	"Baochen Qiang" <quic_bqiang@quicinc.com>,
	"Wen Gong" <quic_wgong@quicinc.com>,
	"Carl Huang" <quic_cjhuang@quicinc.com>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH 4/5] wifi: ath12k: avoid IDR mutation during pending
 mgmt TX cleanup
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <773e57da-a9d3-41dc-805c-cb38b38b1dc4@oss.qualcomm.com>
References: <20260926154824.75224-1-yaojiale02@163.com>
 <20260926154824.75224-5-yaojiale02@163.com>
 <773e57da-a9d3-41dc-805c-cb38b38b1dc4@oss.qualcomm.com>
X-NTES-SC: AL_Qu2SAvmTvEEj7iWfZOkcn08ShO49XMOyvfoi2YFTc+gGmTzU3j0if1JyFELowOyzNySDujGrVSdF5ct2e7h6HAVSE7bc3icHKcxKdgyWrw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <77a815e.77f1.1a0e71f6167.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: iCgvCgD3X9i1JLpqNI1PAA--.50903W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8BV-uWq6JLWJ0AAA37
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_012642_955986_56243BB9 
X-CRM114-Status: GOOD (  13.71  )
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

QXQgMjAyNi0wOS0yOCAxMzo0OTo1NCwgIlJhbWVzaGt1bWFyIFN1bmRhcmFtIiA8cmFtZXNoa3Vt
YXIuc3VuZGFyYW1Ab3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj5PbiA5LzI2LzIwMjYgOToxOCBQ
TSwgSmlhbGUgWWFvIHdyb3RlOgo+PiBhdGgxMmtfbWFjX3R4X21nbXRfcGVuZGluZ19mcmVlKCkg
aXMgcGFzc2VkIGFzIGFuIGlkcl9mb3JfZWFjaCgpCj4+IGNhbGxiYWNrIGFuZCByZW1vdmVzIHRo
ZSBjdXJyZW50IGVudHJ5IGZyb20gdHhtZ210X2lkci4gVGhpcyBjYW4KPj4gaW52YWxpZGF0ZSB0
aGUgcmFkaXgtdHJlZSBpdGVyYXRvciByZXRhaW5lZCBieSBpZHJfZm9yX2VhY2goKS4KPj4gCj4+
IEJvdGggY2FsbGVycyBkZXN0cm95IHRoZSBJRFIgaW1tZWRpYXRlbHkgYWZ0ZXIgdGhlIHdhbGss
IHNvIHJlbW92aW5nCj4+IGVhY2ggZW50cnkgaW4gdGhlIGNhbGxiYWNrIGlzIHVubmVjZXNzYXJ5
LiBTcGxpdCBza2IgcmVsZWFzZSBmcm9tIElEUgo+PiByZW1vdmFsIGFuZCBsZXQgdGhlIGNhbGxi
YWNrIHJlbGVhc2UgdGhlIHN1cHBsaWVkIHNrYiB3aXRob3V0IHVwZGF0aW5nCj4+IHRoZSBJRFIu
IFRoZSBmb2xsb3dpbmcgaWRyX2Rlc3Ryb3koKSB0ZWFycyBkb3duIHRoZSBJRFIgaXRzZWxmLgo+
PiAKPj4gRml4ZXM6IGQ4ODk5MTMyMDVjZiAoIndpZmk6IGF0aDEyazogZHJpdmVyIGZvciBRdWFs
Y29tbSBXaS1GaSA3IGRldmljZXMiKQo+PiBTaWduZWQtb2ZmLWJ5OiBKaWFsZSBZYW8gPHlhb2pp
YWxlMDJAMTYzLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEy
ay9tYWMuYyB8IDI1ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdl
ZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEyay9tYWMuYyBiL2RyaXZlcnMvbmV0L3dpcmVs
ZXNzL2F0aC9hdGgxMmsvbWFjLmMKPj4gaW5kZXggOTliZjVjZjc5ZDEwLi43Njk1YjIxMTQ5ZDEg
MTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMmsvbWFjLmMKPj4g
KysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEyay9tYWMuYwo+PiBAQCAtOTE2Niwx
OCArOTE2NiwxMSBAQCBzdGF0aWMgdm9pZCBhdGgxMmtfbWdtdF9vdmVyX3dtaV90eF9kcm9wKHN0
cnVjdCBhdGgxMmsgKmFyLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQo+PiAgIAkJd2FrZV91cCgmYXIt
PnR4bWdtdF9lbXB0eV93YWl0cSk7Cj4+ICAgfQo+PiAgIAo+PiAtc3RhdGljIHZvaWQgYXRoMTJr
X21hY190eF9tZ210X2ZyZWUoc3RydWN0IGF0aDEyayAqYXIsIGludCBidWZfaWQpCj4+ICtzdGF0
aWMgdm9pZCBhdGgxMmtfbWFjX3R4X21nbXRfZnJlZV9za2Ioc3RydWN0IGF0aDEyayAqYXIsCj4+
ICsJCQkJCXN0cnVjdCBza19idWZmICptc2R1KQo+PiAgIHsKPj4gLQlzdHJ1Y3Qgc2tfYnVmZiAq
bXNkdTsKPj4gICAJc3RydWN0IGllZWU4MDIxMV90eF9pbmZvICppbmZvOwo+PiAgIAo+PiAtCXNw
aW5fbG9ja19iaCgmYXItPnR4bWdtdF9pZHJfbG9jayk7Cj4+IC0JbXNkdSA9IGlkcl9yZW1vdmUo
JmFyLT50eG1nbXRfaWRyLCBidWZfaWQpOwo+PiAtCXNwaW5fdW5sb2NrX2JoKCZhci0+dHhtZ210
X2lkcl9sb2NrKTsKPj4gLQo+PiAtCWlmICghbXNkdSkKPj4gLQkJcmV0dXJuOwo+PiAtCj4+ICAg
CWRtYV91bm1hcF9zaW5nbGUoYXItPmFiLT5kZXYsIEFUSDEyS19TS0JfQ0IobXNkdSktPnBhZGRy
LCBtc2R1LT5sZW4sCj4+ICAgCQkJIERNQV9UT19ERVZJQ0UpOwo+PiAgIAo+PiBAQCAtOTE4Nywx
MSArOTE4MCwyMyBAQCBzdGF0aWMgdm9pZCBhdGgxMmtfbWFjX3R4X21nbXRfZnJlZShzdHJ1Y3Qg
YXRoMTJrICphciwgaW50IGJ1Zl9pZCkKPj4gICAJYXRoMTJrX21nbXRfb3Zlcl93bWlfdHhfZHJv
cChhciwgbXNkdSk7Cj4+ICAgfQo+PiAgIAo+PiArc3RhdGljIHZvaWQgYXRoMTJrX21hY190eF9t
Z210X2ZyZWUoc3RydWN0IGF0aDEyayAqYXIsIGludCBidWZfaWQpCj4+ICt7Cj4+ICsJc3RydWN0
IHNrX2J1ZmYgKm1zZHU7Cj4+ICsKPj4gKwlzcGluX2xvY2tfYmgoJmFyLT50eG1nbXRfaWRyX2xv
Y2spOwo+PiArCW1zZHUgPSBpZHJfcmVtb3ZlKCZhci0+dHhtZ210X2lkciwgYnVmX2lkKTsKPj4g
KwlzcGluX3VubG9ja19iaCgmYXItPnR4bWdtdF9pZHJfbG9jayk7Cj4+ICsKPj4gKwlpZiAobXNk
dSkKPj4gKwkJYXRoMTJrX21hY190eF9tZ210X2ZyZWVfc2tiKGFyLCBtc2R1KTsKPj4gK30KPj4g
Kwo+PiAgIGludCBhdGgxMmtfbWFjX3R4X21nbXRfcGVuZGluZ19mcmVlKGludCBidWZfaWQsIHZv
aWQgKnNrYiwgdm9pZCAqY3R4KQo+PiAgIHsKPj4gICAJc3RydWN0IGF0aDEyayAqYXIgPSBjdHg7
Cj4+ICAgCj4+IC0JYXRoMTJrX21hY190eF9tZ210X2ZyZWUoYXIsIGJ1Zl9pZCk7Cj4+ICsJYXRo
MTJrX21hY190eF9tZ210X2ZyZWVfc2tiKGFyLCBza2IpOwo+Cj50aGlzIG5vdyBrZWVwcyB0aGUg
ZnJlZWQgc2ticyBpbiB0aGUgaWRyIGZvciB0aGUgd2hvbGUgdGltZSAKPmlkcl9mb3JfZWFjaCgp
IHJ1bnMgYXMgb3Bwb3NlZCB0byBwcmV2aW91cyBpbXBsZW1lbnRhdGlvbiB3aGljaCByZW1vdmVk
IAo+dGhlIGlkciBlbnRyeSBhcyB3ZWxsIHdoaWNoIGxvb2tlZCBzYWZlLgoKVGhhbmtzIGZvciB0
aGUgcmV2aWV3LgoKVGhlIG9yaWdpbmFsIGlzc3VlIGlzIHRoZSBzYW1lIGFzIHRoZSBvbmUgZml4
ZWQgYnkgY29tbWl0IGMzOGIxZTE5NDg1YQooImZpcm13YXJlOiBhcm1fc2NtaTogQXZvaWQgSURS
IHVwZGF0ZXMgd2hpbGUgY2xlYW5pbmcgY2hhbm5lbHMiKS4KYXRoMTJrX21hY190eF9tZ210X3Bl
bmRpbmdfZnJlZSgpIGlzIGNhbGxlZCBmcm9tIGlkcl9mb3JfZWFjaCgpLCBhbmQKYXRoMTJrX21h
Y190eF9tZ210X2ZyZWUoKSByZW1vdmVzIHRoZSBjdXJyZW50IGVudHJ5IGZyb20gdGhhdCBzYW1l
IElEUgpiZWZvcmUgdGhlIGl0ZXJhdG9yIGFkdmFuY2VzLiBUaGlzIGNhbiBpbnZhbGlkYXRlIHRo
ZSBpdGVyYXRvciBzdGF0ZS4KCllvdSBhcmUgcmlnaHQgdGhhdCBteSBwYXRjaCBsZWF2ZXMgZnJl
ZWQgc2tiIHBvaW50ZXJzIGluIHRoZSBJRFIgdW50aWwKaWRyX2Rlc3Ryb3koKSwgd2hpY2ggaXMg
dW5kZXNpcmFibGUuCgpJIHdpbGwgc2VuZCBhIHYyIHVzaW5nIGlkcl9mb3JfZWFjaF9lbnRyeSgp
LCB3aGljaCBwZXJmb3JtcyBhIGZyZXNoCmlkcl9nZXRfbmV4dCgpIGxvb2t1cCBmb3IgZWFjaCBp
dGVyYXRpb24uIFRoZSBlbnRyeSB3aWxsIHRoZW4gYmUgcmVtb3ZlZApmcm9tIHRoZSBJRFIgYmVm
b3JlIGl0cyBza2IgaXMgZnJlZWQsIGF2b2lkaW5nIGJvdGggdGhlIGludmFsaWQgaXRlcmF0b3IK
c3RhdGUgYW5kIHN0YWxlIHNrYiBwb2ludGVycy4KClRoYW5rcywKSmlhbGUKCgo+Cj4KPj4gICAK
Pj4gICAJcmV0dXJuIDA7Cj4+ICAgfQo+Cj4KPi0tIAo+UmFtZXNoCg==

