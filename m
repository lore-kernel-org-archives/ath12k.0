Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4E0CA5FDD
	for <ath12k@archiver.kernel.org>; Sat,  3 Oct 2026 10:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvkC8Ak0od0aDwF+zPCA7ymzYYL+KvnWU2x6jJM+vLo=; b=OMjysk+Zzp6Jgopk7vMAcM+Bmw
	R0q4idu4Ff4iOrSQcu6d+YD6H3VmwGdE0HBsftzgiNrdZIFRcmrIkjXGuxsGronUQ/tk8UiW5tZQV
	RNRUpWmsD+ncHDRQplt8exlb+Ib4Auc4j7tRlv9kUFpCbfyJuJ3LFHkcgd9h/VUT7NKn6Rv43nW8H
	cxNSm7Sk1QhFvYLqlcQpF47aIVMhamvXuUz6te5B+86yNr5603TV5+4aCbzRLyDG//OfQ2cy5dZYN
	jN6nMqYR83rOuUfUBYCP+pXw+SdirBKHaQBbNmU5KIObwgRuvrXjlpKUHfO5Crlppmgt/s/vFyiBf
	S0m0Vd3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwsn-0000000DMHS-0nNO;
	Sat, 03 Oct 2026 10:22:21 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwsk-0000000DMGf-3mD8
	for ath12k@lists.infradead.org;
	Sat, 03 Oct 2026 10:22:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=OvkC8Ak0od0aDwF+zPCA7ymzYYL+KvnWU2x6jJM+vLo=; b=M
	B97Y/q0xrrReRlu5KC9sYbsUniQjvS8pnJX9rbcpnyNX2cMOlWZ7wQdNKe+LNQ4o
	OxuBvxxrkq//KkkRQ7BTx95UZCosi4B135uISxa6hltLNR54OpdkMJH1h3YnP4bD
	jsceTZUmUjHT5Y+crtvfGXKGuxYtLoJvVhFH7w6Ktw=
Date: Sat, 3 Oct 2026 18:22:07 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Baochen Qiang" <baochen.qiang@oss.qualcomm.com>
Cc: "Jeff Johnson" <jjohnson@kernel.org>,
	"Baochen Qiang" <quic_bqiang@quicinc.com>,
	"Vasanthakumar Thiagarajan" <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re:Re: [PATCH] wifi: ath12k: validate MAC/PHY capability count
 before saving
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <bb1831c7-9281-434b-8324-ea93e3d08e33@oss.qualcomm.com>
References: <20260925121739.2061979-1-yaojiale02@163.com>
 <bb1831c7-9281-434b-8324-ea93e3d08e33@oss.qualcomm.com>
X-NTES-SC: AL_Qu2SA/yZvUEp4SWaYukdmE8Uges8WcC0svki1YJUc+4GhzHBwiABbHpeBEnt4NmlFwSNnAm9ShFy8/5qb6BZCBucED2rynwL3IB5ycHYDg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <1a47e7a8.1453.1a101490eaf.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jygvCgD3dxZP18Bqk0cHAA--.9443W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzg-TDmrA109KrAAA3I
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_032219_313928_0373BCDD 
X-CRM114-Status: GOOD (  16.61  )
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

QXQgMjAyNi0wOS0yOSAxMTozMjozMywgIkJhb2NoZW4gUWlhbmciIDxiYW9jaGVuLnFpYW5nQG9z
cy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4KPk9uIDkvMjUvMjAyNiA4OjE3IFBNLCBKaWFsZSBZ
YW8gd3JvdGU6Cj4+IEZpcm13YXJlIHN1cHBsaWVzIHRoZSBoYXJkd2FyZSBtb2RlIGNvdW50IGFu
ZCB0aGUgUEhZIGJpdG1hcCBmb3IgZWFjaAo+PiBtb2RlIGluIHRoZSBzZXJ2aWNlLXJlYWR5IGV2
ZW50Cj4KPnRvIGJlIGFjY3VyYXRlLCBpdCBpcyBzZXJ2aWNlIHJlYWR5IGV4dCBldmVudC4gd2Ug
ZG8gaGF2ZSBhbm90aGVyIGV2ZW50IG5hbWVkIHNlcnZpY2UgcmVhZHkuCj4KPj4gQSBtaXNtYXRj
aAo+PiBiZXR3ZWVuIHRoZSBhZHZlcnRpc2VkIHRvdGFsIGFuZCB0aGUgbnVtYmVyIG9mIHBhcnNl
ZCBjYXBhYmlsaXR5IFRMVnMgY2FuCj4+IGFsc28gbWFrZSB0aGUgc291cmNlIHBvaW50ZXIgYWR2
YW5jZSBiZXlvbmQgaXRzIGFsbG9jYXRpb24uCj4KPlRoaXMgY2xhaW0gZG9lc24ndCBob2xkLiBU
aGUgc291cmNlIGJ1ZmZlciBtYWNfcGh5X2NhcHMgaXMga3phbGxvYydkIGZvciB0b3RfcGh5X2lk
Cj5lbGVtZW50cywgYW5kIHRoZSBsb29wJ3MgbWFjX3BoeV9jYXArKyBydW5zIGV4YWN0bHkgdG90
X3BoeV9pZCB0aW1lcyB0b3RhbCwgc28gdGhlIHNvdXJjZQo+cG9pbnRlciByZWFkcyBhdCBtb3N0
IHRvdF9waHlfaWQgZW50cmllcyChqiBwcmVjaXNlbHkgdGhlIGFsbG9jYXRpb24gYm91bmQsIG5l
dmVyIHBhc3QgaXQuCj4KPlRoZSBuX21hY19waHlfY2FwcyA+IHRvdF9waHlfaWQgY2FzZSBpcyBh
bHJlYWR5IHJlamVjdGVkIGF0IHBhcnNlIHRpbWUgaW4KPmF0aDEya193bWlfbWFjX3BoeV9jYXBz
X3BhcnNlKCkuIFRoZSBvbmx5IG1pc21hdGNoIHRoYXQgY2FuIGFjdHVhbGx5IHJlYWNoCj5zYXZl
X2FsbF9tYWNfcGh5X2luZm8oKSBpcyBuX21hY19waHlfY2FwcyA8IHRvdF9waHlfaWQsIGluIHdo
aWNoIGNhc2UgdGhlIGxvb3AgcmVhZHMKPnplcm9lZC1idXQtYWxsb2NhdGVkIHNvdXJjZSBlbnRy
aWVzIGFuZCBwb3B1bGF0ZXMgbWFjX3BoeV9pbmZvIHdpdGggYWxsLXplcm8gUEhZIGluZm8goaog
YQo+Y29ycmVjdG5lc3MgYnVnLCBub3QgYSBzb3VyY2UtYnVmZmVyIG92ZXJydW4uCj4KPj4gCj4+
IFZhbGlkYXRlIGJvdGggY291bnRzIGJlZm9yZSB3cml0aW5nIGFueSBlbnRyaWVzIGFuZCBwcm9w
YWdhdGUgdGhlIGVycm9yIHRvCj4+IHRoZSBzZXJ2aWNlLXJlYWR5IHBhcnNlci4KPj4gCj4+IEZp
eGVzOiAwNjJhZGUyMzk5MWUgKCJ3aWZpOiBhdGgxMms6IHBhcnNlIGFuZCBzYXZlIGhhcmR3YXJl
IG1vZGUgaW5mbyBmcm9tIFdNSV9TRVJWSUNFX1JFQURZX0VYVF9FVkVOVElEIGV2ZW50IGZvciBs
YXRlciB1c2UiKQo+PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+PiBTaWduZWQtb2ZmLWJ5
OiBKaWFsZSBZYW8gPHlhb2ppYWxlMDJAMTYzLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL25ldC93
aXJlbGVzcy9hdGgvYXRoMTJrL3dtaS5jIHwgMjIgKysrKysrKysrKysrKysrKysrKystLQo+PiAg
MSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+IAo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEyay93bWkuYyBiL2RyaXZl
cnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMmsvd21pLmMKPj4gaW5kZXggZDUxNjBhZjYwZTAwLi41
OWFjMTdmMGQ0OGQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgx
Mmsvd21pLmMKPj4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEyay93bWkuYwo+
PiBAQCAtNTAwNCw3ICs1MDA0LDcgQEAgYXRoMTJrX3dtaV9zYXZlX21hY19waHlfaW5mbyhzdHJ1
Y3QgYXRoMTJrX2Jhc2UgKmFiLAo+PiAgCQkJCQlfX2xlMzJfdG9fY3B1KG1hY19waHlfY2FwLT5o
aWdoXzVnaHpfY2hhbl9mcmVxKTsKPj4gIH0KPj4gIAo+PiAtc3RhdGljIHZvaWQKPj4gK3N0YXRp
YyBpbnQKPj4gIGF0aDEya193bWlfc2F2ZV9hbGxfbWFjX3BoeV9pbmZvKHN0cnVjdCBhdGgxMmtf
YmFzZSAqYWIsCj4+ICAJCQkJIHN0cnVjdCBhdGgxMmtfd21pX3N2Y19yZHlfZXh0X3BhcnNlICpz
dmNfcmR5X2V4dCkKPj4gIHsKPj4gQEAgLTUwMTUsNiArNTAxNSwyMCBAQCBhdGgxMmtfd21pX3Nh
dmVfYWxsX21hY19waHlfaW5mbyhzdHJ1Y3QgYXRoMTJrX2Jhc2UgKmFiLAo+PiAgCXUzMiBod19t
b2RlX2lkLCBwaHlfYml0X21hcDsKPj4gIAl1OCBod19pZHg7Cj4+ICAKPj4gKwlpZiAoc3ZjX3Jk
eV9leHQtPnRvdF9waHlfaWQgPiBBUlJBWV9TSVpFKHN2Y19leHRfaW5mby0+bWFjX3BoeV9pbmZv
KSkgewo+PiArCQlhdGgxMmtfd2FybihhYiwgInRvbyBtYW55IFBIWSBlbnRyaWVzICV1IChtYXgg
JXp1KVxuIiwKPj4gKwkJCSAgICBzdmNfcmR5X2V4dC0+dG90X3BoeV9pZCwKPj4gKwkJCSAgICBB
UlJBWV9TSVpFKHN2Y19leHRfaW5mby0+bWFjX3BoeV9pbmZvKSk7Cj4+ICsJCXJldHVybiAtRUlO
VkFMOwo+PiArCX0KPj4gKwo+PiArCWlmIChzdmNfcmR5X2V4dC0+bl9tYWNfcGh5X2NhcHMgIT0g
c3ZjX3JkeV9leHQtPnRvdF9waHlfaWQpIHsKPgo+cGVyIGNvbW1lbnQgYWJvdmUsIHNob3VsZCB3
ZSB1c2UgJzwnIGluc3RlYWQgb2YgJyE9JyA/Cj4KPkJlc2lkZXMsIEkgdGhpbmsgdGhlIHJpZ2h0
IHBsYWNlIGZvciBzdWNoIGNoZWNrIHNob3VsZCBiZSBpbgo+YXRoMTJrX3dtaV9zdmNfcmR5X2V4
dF9wYXJzZSgpLCByaWdodCBiZWZvcmUgYXRoMTJrX3dtaV9zYXZlX2FsbF9tYWNfcGh5X2luZm8o
KSBhbmQgYWZ0ZXIKPm1hYyBwaHkgY2FwIHBhcnNlID8KClRoYW5rcyBmb3IgeW91ciByZXZpZXcs
IHlvdSBhcmUgYWxsIHJpZ2h0LCBob3cgYWJvdXQgdGhpcyBuZXcgb25lPwoKaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjYxMDAzMTAxOTQ0LjU5NjU0Ni0xLXlhb2ppYWxlMDJAMTYzLmNv
bQoKPgo+PiArCQlhdGgxMmtfd2FybihhYiwgImludmFsaWQgbnVtYmVyIG9mIE1BQy9QSFkgY2Fw
cyAldSwgZXhwZWN0ZWQgJXVcbiIsCj4+ICsJCQkgICAgc3ZjX3JkeV9leHQtPm5fbWFjX3BoeV9j
YXBzLAo+PiArCQkJICAgIHN2Y19yZHlfZXh0LT50b3RfcGh5X2lkKTsKPj4gKwkJcmV0dXJuIC1F
SU5WQUw7Cj4+ICsJfQo+PiArCj4+ICAJbWFjX3BoeV9pbmZvID0gJnN2Y19leHRfaW5mby0+bWFj
X3BoeV9pbmZvWzBdOwo+PiAgCW1hY19waHlfY2FwID0gc3ZjX3JkeV9leHQtPm1hY19waHlfY2Fw
czsKPj4gIAo+PiBAQCAtNTA0NCw2ICs1MDU4LDggQEAgYXRoMTJrX3dtaV9zYXZlX2FsbF9tYWNf
cGh5X2luZm8oc3RydWN0IGF0aDEya19iYXNlICphYiwKPj4gIAkJCXBoeV9iaXRfbWFwID4+PSAx
Owo+PiAgCQl9Cj4+ICAJfQo+PiArCj4+ICsJcmV0dXJuIDA7Cj4+ICB9Cj4+ICAKPj4gIHN0YXRp
YyBpbnQgYXRoMTJrX3dtaV9zdmNfcmR5X2V4dF9wYXJzZShzdHJ1Y3QgYXRoMTJrX2Jhc2UgKmFi
LAo+PiBAQCAtNTA5NCw3ICs1MTEwLDkgQEAgc3RhdGljIGludCBhdGgxMmtfd21pX3N2Y19yZHlf
ZXh0X3BhcnNlKHN0cnVjdCBhdGgxMmtfYmFzZSAqYWIsCj4+ICAJCQkJcmV0dXJuIHJldDsKPj4g
IAkJCX0KPj4gIAo+PiAtCQkJYXRoMTJrX3dtaV9zYXZlX2FsbF9tYWNfcGh5X2luZm8oYWIsIHN2
Y19yZHlfZXh0KTsKPj4gKwkJCXJldCA9IGF0aDEya193bWlfc2F2ZV9hbGxfbWFjX3BoeV9pbmZv
KGFiLCBzdmNfcmR5X2V4dCk7Cj4+ICsJCQlpZiAocmV0KQo+PiArCQkJCXJldHVybiByZXQ7Cj4+
ICAKPj4gIAkJCXN2Y19yZHlfZXh0LT5tYWNfcGh5X2RvbmUgPSB0cnVlOwo+PiAgCQl9IGVsc2Ug
aWYgKCFzdmNfcmR5X2V4dC0+ZXh0X2hhbF9yZWdfZG9uZSkgewo=

