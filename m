Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E90C88E45
	for <ath12k@archiver.kernel.org>; Sat, 12 Sep 2026 07:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWtoX2q/jGZ//1+vTBGDG8T4O15rbIPB/EVBKLVQA20=; b=JAHPtrP8i8+7TXBpu8kdvLc2Pf
	TQ8rTBxeYAcz5Avmfoj5VtasVV+ujdeQ4bev6jQmORexo8tb2Xt/p0ChsjwtMcM/0O6SIOqlXzl3c
	DX6JE/jI+hRNONIocgVmACgf6juYzEgDI6Kx29jnyJV2OGN3AlsCW0FBFmeNxCEuHxdT/+27KFOor
	cbHL/UZiDSzX9jteTkBXWeRbpWogyNVqrdm1OK8JavAkDV9c00rlQhLc0N9PrPtBoNx6VQLJXAJae
	PPWWQZbluJj2to6/L9p5uuN1C+Wl5qIjKrY8z9xIJIInM9vWFMtZmegFOlvMhUX0qDQqSAkELhpCi
	80odAGKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Idz-00000000flK-3hn8;
	Sat, 12 Sep 2026 07:59:27 +0000
Received: from lahtoruutu.iki.fi ([2a0b:5c81:1c1::37])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Idx-00000000fkH-3Qhp
	for ath12k@lists.infradead.org;
	Sat, 12 Sep 2026 07:59:27 +0000
Received: from fauth-c1-smtp.messagingengine.com (fauth-c1-smtp.messagingengine.com [204.75.18.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hhkMH5wN1z49PxF;
	Sat, 12 Sep 2026 10:59:07 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1789199949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kWtoX2q/jGZ//1+vTBGDG8T4O15rbIPB/EVBKLVQA20=;
	b=rIKx9+YTPFzEYDNNxordJYyoCmAqrZLD25Y5cUn5RvEM1KvSo+Em4s0laHm/Gd464TvUdo
	3oX5/VUgnZFVhH63Fvz7zAMRAGR6RH7kpwZLN1pdXCMShtHo3SjSmd5nr6mb5eGaI8j7lw
	Hmx6Bxltx+70vyZGatKUUecfw6KyoaQhtFlattYicoig6fuwVoOCIvnfV+nV6mgQclG2uc
	W5976zhzNUMUFVrerB7qFgct4gIcwzVNFmSytvnzRe+FI6mT+a8dbfadNzNU/rDEofNMqq
	wJMNI5Hv3Z8Pl6FbZbIjqyWyxRMqbDdvCu/rIEs/B/ISdRrsgs/O8MkbN3rQCA==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1789199949;
	b=r++//lUYXyN0/JBnME3rIQutYFg0R26WIxvtSoBTkW6gvyLMB82hDsucUYKR+XckZsFLhQ
	RIkyi9VaV8LM2nCIMZqdMv+5lGXq3/lX0iQl+PY9tSj2wWCFjVY92HCFZN/VuoWOBHwb2w
	VbXDkWhHUlEk9YY80ddrqSN3nHp3taZpd3dpBF5zcmdBr051BfJP1kYO1td5Zp6MSD5f3d
	tWPAQartVwO3u56e68ExfPr1fUg4GgvIC9DOrjD9/8c1OdScEClsP2jpyf/EUYJwXwql8w
	+ZVOs8/OkOwO5MvjI+Zc6qg+s3OqsieFOEnid4/SIvps3tlcqDQs6J2kf8fx5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1789199949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kWtoX2q/jGZ//1+vTBGDG8T4O15rbIPB/EVBKLVQA20=;
	b=bJ0MLPFeVC83YyE2gOoGTW0Xrq+W+2Pup+taQ4jTnV1ZaN8LrhptjOr/kKKh5LIVm+k0yl
	FY5LJup9MqbxW9HTeoS7PwE17JO4zGRADWR+wtbL1kTcWe8CNTa4WkaufiEh+8Ko1NFaVK
	0N3BDtYGGUaLSsXsBKELMflZVqqCaaAAA4m8DruDsBxrMl6W4bCFVvRL80xqGZwme7pRmz
	tXCpjTeJt3O3gR1hA7q3A8jae3qPj1L2ep8mIcgysuqtRwYIankxgq/6950cIn9U4mg+6u
	5uA5ukKnQI4O5ZQdCdg0NhTCvWjPMfv7JXNJ44zdad1V/gY6Pphk1bpbkp7ccQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=jmtilli smtp.mailfrom=juha-matti.tilli@iki.fi
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 88644198004A;
	Sat, 12 Sep 2026 03:59:06 -0400 (EDT)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-02.internal (MEProxy); Sat, 12 Sep 2026 03:59:06 -0400
X-ME-Sender: <xms:Rwalamwxsu26ZEAS5voScVlywrSY1nhVUTKXq3cCPVO3bORaiKI0WQ>
    <xme:RwalatHmZGDCrKjVl44ZugsMgSP-83xtoEiRnWXbEa594O-wzVVXEOaS37DOktAxZ
    4sdKJ1HSC1VSuv0EC7SHScw5yENnTPd1ZiKGEFNV7szZcRnIbl0xl0>
X-ME-Proxy-Cause: dmFkZTFEXGNHCKhuAHtyaQNCz9mF0LZj+0EMZrDTZmy3QBtpWwkxw8Zh/OO90gMbHDDFgT
    rbvZjVfyzbe7pkuXoVe4F/B+gfkty3EASgQrgf67g1gdMjrMwpOFHdiISUkhGVC3bvpJ9v
    A91YgggnXoVf0wSMRnkH/4DlMkIjf+ckzw7bbjyYzmMwVAMq2ftHOT3fnqksac5SBbsmIa
    MaWjmODyRy0ISaJM+6j9CoXe9+qacm+h1bg9tNmq/kjTbQPDkj/cxQkqm5oWG/imqJqNJs
    Ev2UEr8Eg77CV9+/3aghkj2fBy7lSvVvXi3yrGhTiR19pRxc5DHSStlNeaVEV1VLGnx+TT
    ZYeGFc/3MyJHxUijdmDRETWFGoaVjYJAdy1uZQ/BfFqdZAqgxHenipTtFZ+IsAkjZV82et
    gYjy9Mrr0CxGBXCBY1gjGvAMwjbuPDk7V5PvJKRykqP8MnmE6N5FOiABM14uiaEeRu+Le3
    uHBEaMbVg7qJTalVLlsh9Imxuv55Qyvo3/xt1DGbpovUZCUaT2W2s8VIJI2wXY1hnINTO7
    ZGpqOFUev7REkutW6tUhurd8LQBWLSTGVe0PRDkwpzJCTQPdGQxKqrkfewZC4O+6lWMbRA
    Wu1nZnQ4La7Mwtb9p3zmrEEuuwQHxIEdOcO30Im3b01LDr8JJ1MMMtqcoukQ
X-ME-Proxy: <xmx:SgalanJwwwbuJsLQgae23CqvUJjCBfbiUimryUZ_BVZMVHowVP0KSA>
    <xmx:SgalagAkJ3r3T_wIeqZo1ZRDMk6UNekCYm1Igx-rQlq1g3bzFzQh_A>
    <xmx:SgalaoScTpCd1L-V1EcbcZqBRrWadwyH-hQgdE5LxFjo5cFTHYGotA>
    <xmx:SgalahqLyq8KMc4R3N09DShooKOVboWooC2HMbjuNW16yJBdUFescg>
    <xmx:SgalahV9QqOmNXwtcBK-HLYKgjWLCsxT90vaUs6jp6PopLystOxxEea7>
Feedback-ID: i02414972:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 5DC57F80087; Sat, 12 Sep 2026 03:59:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Av35K2MZ7qUg
Date: Sat, 12 Sep 2026 10:58:42 +0300
From: "Juha-Matti Tilli" <juha-matti.tilli@iki.fi>
To: "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 "Kalle Valo" <kvalo@kernel.org>, "Jeff Johnson" <jjohnson@kernel.org>,
 "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>,
 "Mihai Moldovan" <ionic@ionic.de>, linux-wireless@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <65bea1ee-edf5-4884-98e7-f9d6237f8999@app.fastmail.com>
In-Reply-To: <d91ce2be-6489-4399-b035-23f6aec0371f@oss.qualcomm.com>
References: <20260908093145.2492666-1-juha-matti.tilli@iki.fi>
 <d91ce2be-6489-4399-b035-23f6aec0371f@oss.qualcomm.com>
Subject: Re: [PATCH v3 00/12] ath1{1,2}k: support multiple PCI devices in one system
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_005926_015060_BEB75F4E 
X-CRM114-Status: GOOD (  16.81  )
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

On Fri, Sep 11, 2026, at 22:15, Jeff Johnson wrote:
> On 9/8/2026 2:31 AM, Juha-Matti Tilli wrote:
> > Hello,
> > 
> > As you may well know, multiple identical ath11k and ath12k devices are
> > not supported in a single Linux host because they use conflicting QRTR
> > node IDs. Fortunately, Denis Kenzior created a patchset to support
> > multiple QRTR endpoints with identical node IDs, and Mihai Moldovan
> > refined it, after which I took over the patchset and refined it more.
> > 
> > [snip]
> 
> How are you populating the list of recipients for your e-mail?
> 
> You are including folks no longer involved in kernel development, but more
> importantly, you are using an obsolete e-mail address for the MHI maintainer
> (Mani). I've replaced his address in my reply.
> 
> Please make sure to use scripts/get_maintainer.pl to get an accurate list of
> recipients.

Hello,

I will post a new patchset without messed-up threading later. The e-mail
list was populated from Mihai's patchset from 2024, and I indeed noticed 
that Mani's e-mail address was old, which would have been fixed in the
next version anyway. I will also do an estimate of how recently the
recipients have been doing kernel development, based on the Linux kernel
commit history, and what kind of development they have done (in what
subsystems), and remove addresses that haven't been part of relevant
kernel subsystem development recently (except maybe Denis and Mihai
could be listed as the patches were originally theirs). Of course,
get_maintainer.pl result will be included.

I will also join the modified recipient lists of Denis's patchset and
Mihai's patchset, as they are related to each other, and Mihai's patches
require Denis's patches.

I hope that with these modifications, the patchsets could be taken into
consideration and review.

At least my git send-email settings and changed SMTP server settings
should prevent the previous mistake in the next series, and if not, now
I know --in-reply-to and --no-thread. Also shorter CC list will make SMTP
server limits less likely.

BR, Juha-Matti

