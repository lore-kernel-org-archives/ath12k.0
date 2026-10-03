Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B2BCA5FDD
	for <ath12k@archiver.kernel.org>; Sat,  3 Oct 2026 09:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7+b9RGY9B2xgmRAdzgwC0iX58AfMLrIAj6jYe4r+8w=; b=isu1NdLQzjiofqa7VuFxWbijjO
	3fuLr2AOXuffAJTtG+jHw0ygULOdES6+eZL8tI5S2utQKcMZNzV8WxtvH45nFfWuF1eLvkrmkZgbv
	sA4B+rZZ+Olv8tsQDeWPAQR3TJVkNkXTfBY2fBbum7UXmJmQe/cG11Vd/vAnBYrlq3TEMn8jC5Xy0
	2tWVr+9CtTZmBsDE3BXszEI3MdJMgkLSRMkgX27/N1sft6x9RYE5YKbGfXUykkM8Yy5uNLC+58IFo
	oL6+LFNVrBXm05byfEOPUUE4292LcgJ9IYApDD32WFcyKYIeFT1eob4SlI9d22ZkN1YqlJN9iIrXN
	+gyKhKCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvyg-0000000DGrQ-3E06;
	Sat, 03 Oct 2026 09:24:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvyf-0000000DGrG-0JJs
	for ath12k@bombadil.infradead.org;
	Sat, 03 Oct 2026 09:24:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=t7+b9RGY9B2xgmRAdzgwC0iX58AfMLrIAj6jYe4r+8w=; b=I5xZoolvQWOv7RqKSxXtoIDJ54
	Wu4whyatVsmB28hP99nrwf1VPPv1f0YTFHUvGXZjdMMgK5eXHqsuUgXzXD9dW0iBsW8j33ByMQjbA
	F/aZsJmN32XY6XzOVQNHW4kFXS77DXCUvDTBt+s7M1Uhvxd4/Dc9q7DYpIGUltyBOCAkpX46nJptU
	mzbwoMP7ZjoLfn1/IP3Zf2NLgqttMuCXbAqTLFtYydVJ1lhGJQ6XccvoXCIh06lTSlLKPLmzgj1/p
	a+FBypu8cE715BltHf9mOfRR+yZjc3NST8/Z3urnvEum9x7kk9ewpXdLTtapzyhvfReQHgrWDYSul
	M9n1/Zew==;
Received: from m16.mail.163.com ([220.197.31.2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCvya-00000006eIJ-1UUH
	for ath12k@lists.infradead.org;
	Sat, 03 Oct 2026 09:24:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=t7+b9RGY9B2xgmRAdzgwC0iX58AfMLrIAj6jYe4r+8w=; b=A
	VPVjtmG7JKd2zPI+as26lkclMlzJKHfebKmCFNZ7VqHHPEN8juWCAAt24kV0ZV02
	ul7LMtd2X36TEri/z90aAaClxUSmdYtilendwisnx3vhYNy/Z366yKs4apLKt8eN
	D4gjl9mXzy1w7ygeFDDm0rrxexdezf8JmGzrQMczzc=
Date: Sat, 3 Oct 2026 17:23:57 +0800 (CST)
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
Subject: Re:Re:Re: [PATCH 4/5] wifi: ath12k: avoid IDR mutation during
 pending mgmt TX cleanup
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <77a815e.77f1.1a0e71f6167.Coremail.19888972804@163.com>
References: <20260926154824.75224-1-yaojiale02@163.com>
 <20260926154824.75224-5-yaojiale02@163.com>
 <773e57da-a9d3-41dc-805c-cb38b38b1dc4@oss.qualcomm.com>
 <77a815e.77f1.1a0e71f6167.Coremail.19888972804@163.com>
X-NTES-SC: AL_Qu2SA/yatkwo4SKZbekdmE8Uges8WcC0svki1YJUc+4GhzHBwiABbHpeBEnt4NmlFwSNnAm9ShFy8/5qb6BZe/A9UfNxBrVm0ZRiXauR+g==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <5fb79006.12d7.1a10113cca9.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jygvCgD3v1KtycBqfEUHAA--.63341W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8A1oomrAya0powAA3z
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_102417_497138_3CC8CBF5 
X-CRM114-Status: GOOD (  14.51  )
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

QXQgMjAyNi0wOS0yOCAxNjoyNjoyOCwgImppYWxlIHlhbyIgPDE5ODg4OTcyODA0QDE2My5jb20+
IHdyb3RlOgo+QXQgMjAyNi0wOS0yOCAxMzo0OTo1NCwgIlJhbWVzaGt1bWFyIFN1bmRhcmFtIiA8
cmFtZXNoa3VtYXIuc3VuZGFyYW1Ab3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4+T24gOS8yNi8y
MDI2IDk6MTggUE0sIEppYWxlIFlhbyB3cm90ZToKPj4+IGF0aDEya19tYWNfdHhfbWdtdF9wZW5k
aW5nX2ZyZWUoKSBpcyBwYXNzZWQgYXMgYW4gaWRyX2Zvcl9lYWNoKCkKPj4+IGNhbGxiYWNrIGFu
ZCByZW1vdmVzIHRoZSBjdXJyZW50IGVudHJ5IGZyb20gdHhtZ210X2lkci4gVGhpcyBjYW4KPj4+
IGludmFsaWRhdGUgdGhlIHJhZGl4LXRyZWUgaXRlcmF0b3IgcmV0YWluZWQgYnkgaWRyX2Zvcl9l
YWNoKCkuCj4+PiAKPj4+IEJvdGggY2FsbGVycyBkZXN0cm95IHRoZSBJRFIgaW1tZWRpYXRlbHkg
YWZ0ZXIgdGhlIHdhbGssIHNvIHJlbW92aW5nCj4+PiBlYWNoIGVudHJ5IGluIHRoZSBjYWxsYmFj
ayBpcyB1bm5lY2Vzc2FyeS4gU3BsaXQgc2tiIHJlbGVhc2UgZnJvbSBJRFIKPj4+IHJlbW92YWwg
YW5kIGxldCB0aGUgY2FsbGJhY2sgcmVsZWFzZSB0aGUgc3VwcGxpZWQgc2tiIHdpdGhvdXQgdXBk
YXRpbmcKPj4+IHRoZSBJRFIuIFRoZSBmb2xsb3dpbmcgaWRyX2Rlc3Ryb3koKSB0ZWFycyBkb3du
IHRoZSBJRFIgaXRzZWxmLgo+Pj4gCj4+PiBGaXhlczogZDg4OTkxMzIwNWNmICgid2lmaTogYXRo
MTJrOiBkcml2ZXIgZm9yIFF1YWxjb21tIFdpLUZpIDcgZGV2aWNlcyIpCj4+PiBTaWduZWQtb2Zm
LWJ5OiBKaWFsZSBZYW8gPHlhb2ppYWxlMDJAMTYzLmNvbT4KPj4+IC0tLQo+Pj4gICBkcml2ZXJz
L25ldC93aXJlbGVzcy9hdGgvYXRoMTJrL21hYy5jIHwgMjUgKysrKysrKysrKysrKysrLS0tLS0t
LS0tLQo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25z
KC0pCj4+PiAKPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTJr
L21hYy5jIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEyay9tYWMuYwo+Pj4gaW5kZXgg
OTliZjVjZjc5ZDEwLi43Njk1YjIxMTQ5ZDEgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL25ldC93
aXJlbGVzcy9hdGgvYXRoMTJrL21hYy5jCj4+PiArKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9h
dGgvYXRoMTJrL21hYy5jCj4+PiBAQCAtOTE2NiwxOCArOTE2NiwxMSBAQCBzdGF0aWMgdm9pZCBh
dGgxMmtfbWdtdF9vdmVyX3dtaV90eF9kcm9wKHN0cnVjdCBhdGgxMmsgKmFyLCBzdHJ1Y3Qgc2tf
YnVmZiAqc2tiKQo+Pj4gICAJCXdha2VfdXAoJmFyLT50eG1nbXRfZW1wdHlfd2FpdHEpOwo+Pj4g
ICB9Cj4+PiAgIAo+Pj4gLXN0YXRpYyB2b2lkIGF0aDEya19tYWNfdHhfbWdtdF9mcmVlKHN0cnVj
dCBhdGgxMmsgKmFyLCBpbnQgYnVmX2lkKQo+Pj4gK3N0YXRpYyB2b2lkIGF0aDEya19tYWNfdHhf
bWdtdF9mcmVlX3NrYihzdHJ1Y3QgYXRoMTJrICphciwKPj4+ICsJCQkJCXN0cnVjdCBza19idWZm
ICptc2R1KQo+Pj4gICB7Cj4+PiAtCXN0cnVjdCBza19idWZmICptc2R1Owo+Pj4gICAJc3RydWN0
IGllZWU4MDIxMV90eF9pbmZvICppbmZvOwo+Pj4gICAKPj4+IC0Jc3Bpbl9sb2NrX2JoKCZhci0+
dHhtZ210X2lkcl9sb2NrKTsKPj4+IC0JbXNkdSA9IGlkcl9yZW1vdmUoJmFyLT50eG1nbXRfaWRy
LCBidWZfaWQpOwo+Pj4gLQlzcGluX3VubG9ja19iaCgmYXItPnR4bWdtdF9pZHJfbG9jayk7Cj4+
PiAtCj4+PiAtCWlmICghbXNkdSkKPj4+IC0JCXJldHVybjsKPj4+IC0KPj4+ICAgCWRtYV91bm1h
cF9zaW5nbGUoYXItPmFiLT5kZXYsIEFUSDEyS19TS0JfQ0IobXNkdSktPnBhZGRyLCBtc2R1LT5s
ZW4sCj4+PiAgIAkJCSBETUFfVE9fREVWSUNFKTsKPj4+ICAgCj4+PiBAQCAtOTE4NywxMSArOTE4
MCwyMyBAQCBzdGF0aWMgdm9pZCBhdGgxMmtfbWFjX3R4X21nbXRfZnJlZShzdHJ1Y3QgYXRoMTJr
ICphciwgaW50IGJ1Zl9pZCkKPj4+ICAgCWF0aDEya19tZ210X292ZXJfd21pX3R4X2Ryb3AoYXIs
IG1zZHUpOwo+Pj4gICB9Cj4+PiAgIAo+Pj4gK3N0YXRpYyB2b2lkIGF0aDEya19tYWNfdHhfbWdt
dF9mcmVlKHN0cnVjdCBhdGgxMmsgKmFyLCBpbnQgYnVmX2lkKQo+Pj4gK3sKPj4+ICsJc3RydWN0
IHNrX2J1ZmYgKm1zZHU7Cj4+PiArCj4+PiArCXNwaW5fbG9ja19iaCgmYXItPnR4bWdtdF9pZHJf
bG9jayk7Cj4+PiArCW1zZHUgPSBpZHJfcmVtb3ZlKCZhci0+dHhtZ210X2lkciwgYnVmX2lkKTsK
Pj4+ICsJc3Bpbl91bmxvY2tfYmgoJmFyLT50eG1nbXRfaWRyX2xvY2spOwo+Pj4gKwo+Pj4gKwlp
ZiAobXNkdSkKPj4+ICsJCWF0aDEya19tYWNfdHhfbWdtdF9mcmVlX3NrYihhciwgbXNkdSk7Cj4+
PiArfQo+Pj4gKwo+Pj4gICBpbnQgYXRoMTJrX21hY190eF9tZ210X3BlbmRpbmdfZnJlZShpbnQg
YnVmX2lkLCB2b2lkICpza2IsIHZvaWQgKmN0eCkKPj4+ICAgewo+Pj4gICAJc3RydWN0IGF0aDEy
ayAqYXIgPSBjdHg7Cj4+PiAgIAo+Pj4gLQlhdGgxMmtfbWFjX3R4X21nbXRfZnJlZShhciwgYnVm
X2lkKTsKPj4+ICsJYXRoMTJrX21hY190eF9tZ210X2ZyZWVfc2tiKGFyLCBza2IpOwo+Pgo+PnRo
aXMgbm93IGtlZXBzIHRoZSBmcmVlZCBza2JzIGluIHRoZSBpZHIgZm9yIHRoZSB3aG9sZSB0aW1l
IAo+Pmlkcl9mb3JfZWFjaCgpIHJ1bnMgYXMgb3Bwb3NlZCB0byBwcmV2aW91cyBpbXBsZW1lbnRh
dGlvbiB3aGljaCByZW1vdmVkIAo+PnRoZSBpZHIgZW50cnkgYXMgd2VsbCB3aGljaCBsb29rZWQg
c2FmZS4KPgo+VGhhbmtzIGZvciB0aGUgcmV2aWV3Lgo+Cj5UaGUgb3JpZ2luYWwgaXNzdWUgaXMg
dGhlIHNhbWUgYXMgdGhlIG9uZSBmaXhlZCBieSBjb21taXQgYzM4YjFlMTk0ODVhCj4oImZpcm13
YXJlOiBhcm1fc2NtaTogQXZvaWQgSURSIHVwZGF0ZXMgd2hpbGUgY2xlYW5pbmcgY2hhbm5lbHMi
KS4KPmF0aDEya19tYWNfdHhfbWdtdF9wZW5kaW5nX2ZyZWUoKSBpcyBjYWxsZWQgZnJvbSBpZHJf
Zm9yX2VhY2goKSwgYW5kCj5hdGgxMmtfbWFjX3R4X21nbXRfZnJlZSgpIHJlbW92ZXMgdGhlIGN1
cnJlbnQgZW50cnkgZnJvbSB0aGF0IHNhbWUgSURSCj5iZWZvcmUgdGhlIGl0ZXJhdG9yIGFkdmFu
Y2VzLiBUaGlzIGNhbiBpbnZhbGlkYXRlIHRoZSBpdGVyYXRvciBzdGF0ZS4KPgo+WW91IGFyZSBy
aWdodCB0aGF0IG15IHBhdGNoIGxlYXZlcyBmcmVlZCBza2IgcG9pbnRlcnMgaW4gdGhlIElEUiB1
bnRpbAo+aWRyX2Rlc3Ryb3koKSwgd2hpY2ggaXMgdW5kZXNpcmFibGUuCj4KPkkgd2lsbCBzZW5k
IGEgdjIgdXNpbmcgaWRyX2Zvcl9lYWNoX2VudHJ5KCksIHdoaWNoIHBlcmZvcm1zIGEgZnJlc2gK
Pmlkcl9nZXRfbmV4dCgpIGxvb2t1cCBmb3IgZWFjaCBpdGVyYXRpb24uIFRoZSBlbnRyeSB3aWxs
IHRoZW4gYmUgcmVtb3ZlZAo+ZnJvbSB0aGUgSURSIGJlZm9yZSBpdHMgc2tiIGlzIGZyZWVkLCBh
dm9pZGluZyBib3RoIHRoZSBpbnZhbGlkIGl0ZXJhdG9yCj5zdGF0ZSBhbmQgc3RhbGUgc2tiIHBv
aW50ZXJzLgp2MiBpbiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjEwMDMwOTIxMDQu
NTIwMTM1LTEteWFvamlhbGUwMkAxNjMuY29tLwo+Cj5UaGFua3MsCj5KaWFsZQo+Cj4KPj4KPj4K
Pj4+ICAgCj4+PiAgIAlyZXR1cm4gMDsKPj4+ICAgfQo+Pgo+Pgo+Pi0tIAo+PlJhbWVzaAo=

