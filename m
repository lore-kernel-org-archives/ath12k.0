Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A15C54E58
	for <ath12k@archiver.kernel.org>; Mon, 18 Mar 2024 18:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FtQx2clLLi0JC5J6vRGrRvhI43CrSUCo3WAz8jpHxPI=; b=AE6rRiQkkxsMrw7SDdAZbwLxm3
	AFf5IbTRwl7/0FZAhG7j46M7ZHRSjrf5HF2X40m8/mkdtz+9/6m3zv64kFUilsd8GVdgr11sDkPTZ
	lZhCIDhrKMLcsLu/QqUFHOsuCEoza07ZJ9iYwDuquJWbfkeZ6ixQGmXKeut8vx77+5wPot+K9BUAm
	e9GCiyPh7aaRGxIlAmRHyrlzf++EYlzy4niHIX/4SPU/buRclKIdfwbMjBdWEEn+Y5FvAsndiCSqH
	N2MaVRfhG+Ri4cwmwwEqqrTBcNI+ltWg8BVtKQ8zLuoM4aWUcAjkVhptwXTJQ0U0orS+xXX16G03y
	UlSP22Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmHQD-00000009bWf-2BCs
	for ath12k@archiver.kernel.org;
	Mon, 18 Mar 2024 18:09:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmHQA-00000009bW7-3OZ9
	for ath12k@lists.infradead.org;
	Mon, 18 Mar 2024 18:09:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C260360C07;
	Mon, 18 Mar 2024 18:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B099C433F1;
	Mon, 18 Mar 2024 18:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710785353;
	bh=wIWY0HA295G/NniJe/M6mx6znfKdYejU/U7bItnmyzM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=WnhcRFeZsxvIVnPe9XGGfP0m+q1vpn2LReoEfvCXZDxOF6ad8REFmAxDW8PA9BkEl
	 o4KwSrZ3fFk67B3ZCsewSz2OGSEO/1zwAhJ1MvIK547qnWrtVqVrwFhVj1RyrZ83qz
	 PpkMZeFifAIK3F3HEO7P4eJGTUexrb8/gObdwwH0whwQrXaguS++eT1/2uqwQN2YsJ
	 9vPWhJJvI6V8TXJLf+8Uvr310J+hzk1P8fH9uvtOWrm/4sKpwa/iUreifDpx+2PCr8
	 KTE0V+KdgqqolvOtWVlUcVkAvfkwkVQW7TXsRi7k/Kw85XIUnDbnvR1QzSibPPdqGo
	 E7HDXQAdsChYw==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 2/3] wifi: ath12k: Optimize the lock contention of used
 list in Rx data path
References: <20240226162310.629162-1-quic_periyasa@quicinc.com>
	<20240226162310.629162-3-quic_periyasa@quicinc.com>
	<87msr4gbps.fsf@kernel.org>
	<33d25f11-d54d-6161-383d-d3823d5f6d19@quicinc.com>
Date: Mon, 18 Mar 2024 20:09:11 +0200
In-Reply-To: <33d25f11-d54d-6161-383d-d3823d5f6d19@quicinc.com> (Karthikeyan
	Periyasamy's message of "Mon, 11 Mar 2024 19:25:10 +0530")
Message-ID: <874jd3cszc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_110915_032464_620C777B 
X-CRM114-Status: GOOD (  12.43  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:

> On 3/11/2024 6:35 PM, Kalle Valo wrote:
>> Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:
>>
>>> When a packet arrives in Rx rings, the RX descriptor moves from the used
>>> list to the free list. Then, the rxdma ring gets replenished, where the Rx
>>> descriptor again moves from the free list to the used list. At the end, the
>>> descriptor came to the used list with unnecessary list movement. The
>>> descriptor used list is maintained in the Rxdma ring structure, which
>>> creates lock contention for the list operations (add, delete) in the Rx
>>> data path. Optimize the Rx data path by removing the used list from the
>>> common Rxdma ring and maintain as a local variable in the Rx ring handler
>>> itself, which avoid lock contention. Now, to find the used list descriptor
>>> during descriptor cleanup, we need to check the in_use flag for each Rx
>>> descriptor.
>>>
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>>
>>> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>> Before looking at this in detail: When optimising something it would be
>> good to have before and after numbers showing the improvement. Otherwise
>> it's just wishful thinking.
>
> I don't have numbers. Like you said, Its just a wishful think.

So do you still want us to take this?

In the future please do provide numbers to show that the optimisation
really helps as intended. Otherwise we might even go backwards.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

