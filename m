Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AEFC7EE24
	for <ath12k@archiver.kernel.org>; Thu, 18 May 2023 06:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rb493XKbo1vAxT0ALfnTToJcb7l3Q8GdNUj1p+0wmZI=; b=MtzpiyFrvcPM5p
	14oGUKMays/i1TJKiHdQyUuMoi40U95TU7NoS0sajB78xc2iqerRmSHghfBWPb2n1AMxu239TtP01
	MIY9m9EG8E/Dp1n5nRm7rlRv6RTrA8WPbhDVx5GvCqABUGh8KdYWH45xV8K1pk/FeV6b+76thiohr
	yWK+MfI1dH+EsWxqWcW0yaEpMZUKNDsYCAFM/65Lpr9vWMtn2qWwxN/d7BaGOW7f3o47/IjevS/x6
	xB0yVf5NvE809QXl2XiNBkyuBQ54uOve10A1wqLlDgbGfqu6gFoz8zLeGkGJBcMNito1iKHv8EuwI
	VojvwArv1udRo2lvDzaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzWww-00C30X-0y
	for ath12k@archiver.kernel.org;
	Thu, 18 May 2023 06:17:18 +0000
Received: from smtp-22.smtpout.orange.fr ([80.12.242.22] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzWws-00C2y8-2I
	for ath12k@lists.infradead.org;
	Thu, 18 May 2023 06:17:17 +0000
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id zWwipDLQ5jCyEzWwiphDGq; Thu, 18 May 2023 08:17:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1684390627;
	bh=lHzeDDfUlQX3RH1HXK0XsiQwqk7lqO7xwS/nUPsFcJ8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=QOwSADmn96OEyVdr0c7A5uO5YPGAzWOZyiU0QJi2BiJnl6Pt/jVDU1puyRiTyZws/
	 Y5tgDazDLcZP61+sofQWEaUzFmCo0OO3KL5ppkUwxna38ivSWqlzxe/mUZZ1rXkBfp
	 6Rp4irTvkCaJn4X3tLsg6SoKwxS/gR8ua5sEN23+I8R5pTd+oCUXqHYeCsDOp8mY76
	 97Tem981S6ocQ5+IaqA1Mwtaxs0IIs8nu2gCVPx6XIXtmRs4DujC8efA6TySfcKIym
	 vV87QeD5I5LOb2G3S8Te7GQQOpsBUbwlMG0xvsE9ME3RHih7r/o0HiJ8GPUNYWfPtB
	 Qu9l6av+Y2AHg==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 18 May 2023 08:17:07 +0200
X-ME-IP: 86.243.2.178
Message-ID: <bd9f392c-93e5-7147-0f21-f6732b210df5@wanadoo.fr>
Date: Thu, 18 May 2023 08:17:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: AW: [PATCH] wifi: ath12k: Remove some dead code
Content-Language: fr
To: Walter Harms <wharms@bfs.de>, Kalle Valo <kvalo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <c17edf0811156a33bae6c5cf1906d751cc87edd4.1682423828.git.christophe.jaillet@wanadoo.fr>
 <d0c5ed33fb1644328fbdc5d7aba20a97@bfs.de>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <d0c5ed33fb1644328fbdc5d7aba20a97@bfs.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_231715_161444_9EB22152 
X-CRM114-Status: GOOD (  13.82  )
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

TGUgMjUvMDQvMjAyMyDDoCAxNDoxMCwgV2FsdGVyIEhhcm1zIGEgw6ljcml0wqA6Cj4gRG9lcyAg
bWNzID0gQVRIMTJLX0hFX01DU19NQVggbWFrZSBzZW5zZSA/Cj4gCgpCYXNlZCBvbiBbMV0sIEkg
d291bGQgc2F5IHllcywgV01JX1JBVEVfUFJFQU1CTEVfSEUgKGkuZS4gMTEpIGxvb2tzIGxpa2Ug
CmEgdmFsaWQgdmFsdWUuCgpDSgoKWzFdOiBodHRwczovL3d3dy43c2lnbmFsLmNvbS9pbmZvL21j
cwoKPiByZSwKPiAgIHdoCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IFZvbjogQ2hyaXN0b3BoZSBKQUlMTEVUIDxjaHJpc3RvcGhlLmphaWxsZXRAd2FuYWRvby5m
cj4KPiBHZXNlbmRldDogRGllbnN0YWcsIDI1LiBBcHJpbCAyMDIzIDEzOjU3OjE5Cj4gQW46IEth
bGxlIFZhbG87IERhdmlkIFMuIE1pbGxlcjsgRXJpYyBEdW1hemV0OyBKYWt1YiBLaWNpbnNraTsg
UGFvbG8gQWJlbmkKPiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsga2VybmVsLWph
bml0b3JzQHZnZXIua2VybmVsLm9yZzsgQ2hyaXN0b3BoZSBKQUlMTEVUOyBhdGgxMmtAbGlzdHMu
aW5mcmFkZWFkLm9yZzsgbGludXgtd2lyZWxlc3NAdmdlci5rZXJuZWwub3JnOyBuZXRkZXZAdmdl
ci5rZXJuZWwub3JnCj4gQmV0cmVmZjogW1BBVENIXSB3aWZpOiBhdGgxMms6IFJlbW92ZSBzb21l
IGRlYWQgY29kZQo+IAo+IEFUSDEyS19IRV9NQ1NfTUFYID0gMTEsIHNvIHRoaXMgdGVzdCBhbmQg
dGhlIGZvbGxvd2luZyBvbmUgYXJlIHRoZSBzYW1lLgo+IFJlbW92ZSB0aGUgb25lIHdpdGggdGhl
IGhhcmQgY29kZWQgMTEgdmFsdWUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBKQUlM
TEVUIDxjaHJpc3RvcGhlLmphaWxsZXRAd2FuYWRvby5mcj4KPiAtLS0KPiAgIGRyaXZlcnMvbmV0
L3dpcmVsZXNzL2F0aC9hdGgxMmsvZHBfcnguYyB8IDUgLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9h
dGgvYXRoMTJrL2RwX3J4LmMgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTJrL2RwX3J4
LmMKPiBpbmRleCBlNzg0NzhhNWI5NzguLjc5Mzg2NTYyNTYyZiAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTJrL2RwX3J4LmMKPiArKysgYi9kcml2ZXJzL25ldC93
aXJlbGVzcy9hdGgvYXRoMTJrL2RwX3J4LmMKPiBAQCAtMTM2MiwxMSArMTM2Miw2IEBAIGF0aDEy
a191cGRhdGVfcGVyX3BlZXJfdHhfc3RhdHMoc3RydWN0IGF0aDEyayAqYXIsCj4gICAgICAgICAg
ICogRmlybXdhcmUgcmF0ZSdzIGNvbnRyb2wgdG8gYmUgc2tpcHBlZCBmb3IgdGhpcz8KPiAgICAg
ICAgICAgKi8KPiAKPiAtICAgICAgIGlmIChmbGFncyA9PSBXTUlfUkFURV9QUkVBTUJMRV9IRSAm
JiBtY3MgPiAxMSkgewo+IC0gICAgICAgICAgICAgICBhdGgxMmtfd2FybihhYiwgIkludmFsaWQg
SEUgbWNzICVkIHBlZXIgc3RhdHMiLCAgbWNzKTsKPiAtICAgICAgICAgICAgICAgcmV0dXJuOwo+
IC0gICAgICAgfQo+IC0KPiAgICAgICAgICBpZiAoZmxhZ3MgPT0gV01JX1JBVEVfUFJFQU1CTEVf
SEUgJiYgbWNzID4gQVRIMTJLX0hFX01DU19NQVgpIHsKPiAgICAgICAgICAgICAgICAgIGF0aDEy
a193YXJuKGFiLCAiSW52YWxpZCBIRSBtY3MgJWQgcGVlciBzdGF0cyIsICBtY3MpOwo+ICAgICAg
ICAgICAgICAgICAgcmV0dXJuOwo+IC0tCj4gMi4zNC4xCj4gCj4gCgoKLS0gCmF0aDEyayBtYWls
aW5nIGxpc3QKYXRoMTJrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cHM6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTJrCg==
