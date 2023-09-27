Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E58E80A9B
	for <ath12k@archiver.kernel.org>; Wed, 27 Sep 2023 07:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RqOOZO3mFDYUCTNy1kRDVKIwUXzrEVhc6/9ZvUFiqn8=; b=kOd7s4JE1H/9+H
	d4Yf9PTpsCfzWXQvJycmzBbTrJobDnZeQ0tFVQA9bf/fXKcEPnNiDZCkKjbQwappKJD1e5+c0zMyn
	cjIyyCiX0Fm1AluLbRpyF5NCZQE7SyeRP83RuDaZWKcZHg5gCt6I8bL8KdUhpFZJCEQw6LhAhAiC5
	y4Dhp1p2ULEF4oUSEJmBu6WbFwOE4+RwkcIbDriUGXhQKH0Qnd7tQMDKNfFa4/3uBfx/vxETlGIZX
	BxKCkwu4n/o5i4Dc1btBouWOuINzjYn+g2hr1840fP1FHjzIh/rso7yTDMnC0kZN1toJnqOG3eAaT
	7mtdYcd7golQU7phhRsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlOfp-0009as-1s
	for ath12k@archiver.kernel.org;
	Wed, 27 Sep 2023 07:09:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlOfm-0009aT-26
	for ath12k@lists.infradead.org;
	Wed, 27 Sep 2023 07:09:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 184726159C;
	Wed, 27 Sep 2023 07:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34EDDC433CA;
	Wed, 27 Sep 2023 07:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695798564;
	bh=KVcZHEJQVs7mh0H6Alto+NmQq+0Rn9LfPTsz2QNIjcc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=fufmiFDen0E8zC3QDs7oukyJm8wU0a+s9Rj/x0o/Bnm5h1cSDUnQNmT5gDD3tSFds
	 DlyIaz3PlD1dv/r8LCo4SOnnliIykUoaaw/e0K/wcXYj3D+3ECg4+hFwaoD5p6seNr
	 9vLAUTpR5Paf1sqm1fsliY8LRiRneuqmcvD9ARoS/Tox2cn/6h3VgAGgg6i11qVFVV
	 CSlVugllq9qTpXg1qncdMyKRrxzQad8KrJubwWHhQ53Xx4oPmutLgKPZdvuO22Djp7
	 PUrex1K4RDio0QrOEzXxPcG8R48/O2eGqTJgeR5yerBI1zec7Oj5Khq1zxjsNYrpsj
	 Wmfjeih8jnK3g==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>
Subject: Re: ath12k-check warnings
References: <20230824025432.19406-1-quic_wgong@quicinc.com>
	<169295002356.1753110.7150166655358699685.kvalo@kernel.org>
	<5376cd01-ab3e-416f-ea73-649c82e3bc40@quicinc.com>
	<87cyyve6ul.fsf_-_@kernel.org>
	<b27fb345-b9e5-1ab0-b6df-1fad6c24a825@quicinc.com>
	<87o7hp8s0l.fsf@kernel.org>
Date: Wed, 27 Sep 2023 10:09:21 +0300
In-Reply-To: <87o7hp8s0l.fsf@kernel.org> (Kalle Valo's message of "Tue, 26 Sep
	2023 07:42:18 +0300")
Message-ID: <87bkdo853y.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_000926_733672_7E39CB74 
X-CRM114-Status: UNSURE (   8.11  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

S2FsbGUgVmFsbyA8a3ZhbG9Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPj4gL2hvbWUvd2dvbmcvb3Bl
bnNvdXJjZS9rZXJuZWwvYXRoLy4vYXRoMTJrLWNoZWNrOjMyOgo+PiBEZXByZWNhdGlvbldhcm5p
bmc6IFRoZSBkaXN0dXRpbHMgcGFja2FnZSBpcyBkZXByZWNhdGVkIGFuZCBzbGF0ZWQgZm9yCj4+
IHJlbW92YWwgaW4gUHl0aG9uIDMuMTIuIFVzZSBzZXR1cHRvb2xzIG9yIGNoZWNrIFBFUCA2MzIg
Zm9yIHBvdGVudGlhbAo+PiBhbHRlcm5hdGl2ZXMKPj4gwqAgaW1wb3J0IGRpc3R1dGlscy5zcGF3
bgo+Cj4gSSBkb24ndCBzZWUgdGhpcyB3YXJuaW5nIG9uIERlYmlhbiAxMiBidXQgSSdsbCBuZWVk
IHRvIGZpeCB0aGF0IGFzIHdlbGwuCj4gQnV0IHRoaXMgaXMgd2hhdCBJIGhhdGUgd2l0aCBweXRo
b24sIHRoZXkgYXJlIGFsd2F5cyBkZXByYWNhdGluZwo+IHNvbWV0aGluZyBhbmQgaXQncyBleHRy
YSB3b3JrIGZvciB1cy4KCkkgZml4ZWQgdGhpcyBub3c6CgpodHRwczovL2dpdGh1Yi5jb20vcWNh
L3FjYS1zd2lzcy1hcm15LWtuaWZlL2NvbW1pdC8yYmQ1Mzc2OGZhMjczZjc4ZWQwNDRhZWU5YWM4
OGRhZjJjY2MxNjgyCgpQbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IHN0aWxsIHNlZSB3YXJuaW5n
cyBmcm9tIGF0aDEyay1jaGVjayBvcgphdGgxMWstY2hlY2suIFdpdGggYXRoLmdpdCBtYXN0ZXIg
YnJhbmNoIHlvdSBzaG91bGQgZ2V0IG5vIHdhcm5pbmdzLApvdGhlcndpc2Ugc29tZXRoaW5nIGlz
IHdyb25nLgoKLS0gCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13
aXJlbGVzcy9saXN0LwoKaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxv
cGVycy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgotLSAKYXRoMTJrIG1haWxpbmcg
bGlzdAphdGgxMmtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwczovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMmsK
