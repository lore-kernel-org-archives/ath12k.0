Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13D7C3DA64
	for <ath12k@archiver.kernel.org>; Thu,  1 Aug 2024 15:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GIlAKYv9Gi7c9WJ8jSEaeOshqTsmaOyvz3V0NviQ1po=; b=LXzeadQENqqIc3Kt6tCCe+wu3o
	p1VKnD6Q8rdpZBJELIGIh41QUTvTwMYTB8iq2RfweJtmWMPy1m+XT0rGuAYudeR/MJrvTgri/i1ul
	n4fTjNs8CEvpuIWGqbi2sNlLyglrQa43YCuSATbRm2XmcGDH4eqYiorpH5mPy57fWQsgTWZ0AdIfE
	BmcmUQgiLwuQXAWOku8lL4Vwtf3MtIaOU1dcTsRMqJftvCaInMJWOMl8qntVK0VvQs7Nz6ar1Lvq3
	YjLcCsmzDfb07/JpwISXr1a63WsqGJRNIAGlUoG6GcaUcqt6yFaRjXiReI+0zA7D0mpOa+0hQA90j
	XqiiY8Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZXdD-00000005qKg-24nl
	for ath12k@archiver.kernel.org;
	Thu, 01 Aug 2024 15:22:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZXd9-00000005qK8-2vBf
	for ath12k@lists.infradead.org;
	Thu, 01 Aug 2024 15:22:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2BD3B628E5;
	Thu,  1 Aug 2024 15:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80225C32786;
	Thu,  1 Aug 2024 15:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722525734;
	bh=Qn9YJ7trcFj6yg58ewscujUP/3VbD9mTF4ZHn5lRbKI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=YmdiopqKIbZOBr43euRj6vpXulqD/A4Pu79AAHXmJxhVodjFp3KPpN9IffjSfcmD4
	 0For1ae3Wb/9tJq3Mreuh1cWe/6A4Te4xGSCfQdchJIMqAPLAoRv2yghx9HmNzRGya
	 4tuPfqcn1s751x7hiUuMEKmXgmw3L0AhQR8R1gbI9/qrg+vrUe2/EnkiOCdL2EWZ6I
	 hatZZK9TwfrM772xjr67voIaA92YMYxMzfym02bpW4VEHcKO+dfEq+L8Gn+XaxZbnZ
	 v+o6CQJx/Ru/Ys6GtkgMudLumVKX8pHxl1YhKJomT+Dgq5R3I0tz5zYjmy1hhDO0zW
	 HpgByY/sX1aCw==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>,  <kernel@quicinc.com>,
  <netdev@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: use 128 bytes aligned iova in transmit
 path for WCN7850
References: <20240715023814.20242-1-quic_bqiang@quicinc.com>
	<c26af1cb-747a-462d-8e13-af948bbb8171@quicinc.com>
	<df00b06a-d33b-4df8-8f44-2b7f659cb2f9@quicinc.com>
	<1aad7e68-c2d4-4b77-b526-5580860d7e3e@quicinc.com>
Date: Thu, 01 Aug 2024 18:22:11 +0300
In-Reply-To: <1aad7e68-c2d4-4b77-b526-5580860d7e3e@quicinc.com> (Baochen
	Qiang's message of "Mon, 22 Jul 2024 15:02:43 +0800")
Message-ID: <871q388dzw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_082216_049830_493DE19E 
X-CRM114-Status: GOOD (  17.76  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> On 7/22/2024 2:54 PM, Baochen Qiang wrote:
>> 
>> 
>> On 7/19/2024 10:10 PM, Jeff Johnson wrote:
>>> On 7/14/2024 7:38 PM, Baochen Qiang wrote:
>>>> In transmit path, it is likely that the iova is not aligned to PCIe TLP
>>>> max payload size, which is 128 for WCN7850. Normally in such cases hardware
>>>> is expected to split the packet into several parts in a manner such that
>>>> they, other than the first one, have aligned iova. However due to hardware
>>>> limitations, WCN7850 does not behave like that properly with some specific
>>>> unaligned iova in transmit path. This easily results in target hang in a
>>>> KPI transmit test: packet send/receive failure, WMI command send timeout
>>>> etc. Also fatal error seen in PCIe level:
>>>>
>>>> 	...
>>>> 	Capabilities: ...
>>>> 		...
>>>> 		DevSta: ... FatalErr+ ...
>>>> 		...
>>>> 	...
>>>>
>>>> Work around this by manually moving/reallocating payload buffer such that
>>>> we can map it to a 128 bytes aligned iova. The moving requires sufficient
>>>> head room or tail room in skb: for the former we can do ourselves a favor
>>>> by asking some extra bytes when registering with mac80211, while for the
>>>> latter we can do nothing.
>>>>
>>>> Moving/reallocating buffer consumes additional CPU cycles, but the good news
>>>> is that an aligned iova increases PCIe efficiency. In my tests on some X86
>>>> platforms the KPI results are almost consistent.
>>>>
>>>> Since this is seen only with WCN7850, add a new hardware parameter to
>>>> differentiate from others.
>>>
>>> I asked for expert opinion on this patch and received the following response.
>>> Baochen, can you take a look at this suggestion?
>>>
>>>> Aligning headers is sometimes done, but it appears the driver
>>>> doesn't support scatter gather? I think the author may want to advertise
>> right, ath12k does not support SG currently.
>> 
>>>> scatter and linearize manually in the driver, to a correct offset.
>> is there an existing skb API or API combinations which can do that
>> for me? I checked __skb_linearize() and it does not take an 'offset'
>> argument.
>
> or do I need to implement it myself from a very low level basis? like
> (if required) allocating skb structure, allocating/aligning payload
> buffer, copying/freeing paged frag/frag list, etc..

I don't know __skb_linearize() well enough to really comment here. I'm
leaning towards we just take this patch to ath-current for v6.11 and, if
needed, optimise it later. Thoughts?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

