Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11122C4345F
	for <ath12k@archiver.kernel.org>; Fri, 19 Apr 2024 04:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ej7/fw9lYlLjAatAPHpa1xvllku8tukbdTdeuDUgBTI=; b=TU8Jlx2i/tHsw8fqb5215Iiizf
	jkYpPyZcDWXTtj2njRh8djIyndYZpXKCFlW6MxyLRffn1Tyh+QEi5Vv3Skr1HpTVylGtjVSFxAygi
	anf/LUkQZIJAaF5LZM/QBFIXKqwmXizx5eATTiYtRiYrg8l5vsMl35Ls6da3TTd+Z7eQceOGs+0vT
	Y0oqI+5/s6Vc/k//2aVqoYoTpV+nk3cezgZeShX5RyWCCjsXvFZnTsM+aNzMVlIo+V5ZMAJihbTcB
	M6K2aZw77ArWdMwC/PyRS/ueSqvrTD8vMbHTMf02XMi+MK0+ARKcUCeRvyY/23I8nQXEUZlMFicuN
	bdCug55A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxg11-00000004N2o-2mg8
	for ath12k@archiver.kernel.org;
	Fri, 19 Apr 2024 04:38:23 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxg0x-00000004N2M-1r16
	for ath12k@lists.infradead.org;
	Fri, 19 Apr 2024 04:38:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B718DCE19D0;
	Fri, 19 Apr 2024 04:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08906C072AA;
	Fri, 19 Apr 2024 04:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713501495;
	bh=oN18J2DU6Hqp6cJkmQ5aDnAYJ+tq1Th27S8Iarum1kA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=a69O2TQyXevQmUquepZSH/u/broFRWFUXWSPKGRYQIFAzI4bEAQtCuQUvJr58t/29
	 kZ8irE2R0HXXpgfnJ6fgZDj3cIwWv6mNWo4ldZ4cypLFNZzcwVsWumV7mFerNzmSld
	 LIyYujirby5TVs45dwiHe6A9zonWX5tFP21Ue08g32AleLYy6YkLSZ4TplCAk+4C8s
	 gIc3ty6dva4pjHh9naVG///Mrtcnsew/icNCeaFBjV96gpKt4x5+8HJHUra9iRmJOT
	 pB+tpWreY2ybhaz4zEwUEq5jUHaIXVKRXPLTTj6IC5Seh0w8mSgzFlXvxBrdGa0/mb
	 SnY3WT4PsWPLg==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: fix kernel crash during resume
References: <20240419034034.2842-1-quic_bqiang@quicinc.com>
	<87cyqmhtoi.fsf@kernel.org>
Date: Fri, 19 Apr 2024 07:38:11 +0300
In-Reply-To: <87cyqmhtoi.fsf@kernel.org> (Kalle Valo's message of "Fri, 19 Apr
	2024 07:18:05 +0300")
Message-ID: <87frvivufg.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_213819_872450_9EC712D2 
X-CRM114-Status: GOOD (  19.28  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Baochen Qiang <quic_bqiang@quicinc.com> writes:
>
>> Currently during resume, QMI target memory is not properly handled, resulting
>> in kernel crash in case DMA remap is not supported:
>>
>> BUG: Bad page state in process kworker/u16:54  pfn:36e80
>> page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x36e80
>> page dumped because: nonzero _refcount
>> Call Trace:
>>  bad_page
>>  free_page_is_bad_report
>>  __free_pages_ok
>>  __free_pages
>>  dma_direct_free
>>  dma_free_attrs
>>  ath12k_qmi_free_target_mem_chunk
>>  ath12k_qmi_msg_mem_request_cb
>>
>> The reason is:
>> Once ath12k module is loaded, firmware sends memory request to host. In case
>> DMA remap not supported, ath12k refuses the first request due to failure in
>> allocating with large segment size:
>>
>> ath12k_pci 0000:04:00.0: qmi firmware request memory request
>> ath12k_pci 0000:04:00.0: qmi mem seg type 1 size 7077888
>> ath12k_pci 0000:04:00.0: qmi mem seg type 4 size 8454144
>> ath12k_pci 0000:04:00.0: qmi dma allocation failed (7077888 B type 1), will try later with small size
>> ath12k_pci 0000:04:00.0: qmi delays mem_request 2
>> ath12k_pci 0000:04:00.0: qmi firmware request memory request
>>
>> Later firmware comes back with more but small segments and allocation
>> succeeds:
>>
>> ath12k_pci 0000:04:00.0: qmi mem seg type 1 size 524288
>> ath12k_pci 0000:04:00.0: qmi mem seg type 1 size 524288
>> ath12k_pci 0000:04:00.0: qmi mem seg type 1 size 524288
>> ath12k_pci 0000:04:00.0: qmi mem seg type 1 size 524288
>> ath12k_pci 0000:04:00.0: qmi mem seg type 1 size 524288
>> ath12k_pci 0000:04:00.0: qmi mem seg type 1 size 524288
>> ath12k_pci 0000:04:00.0: qmi mem seg type 1 size 524288
>> ath12k_pci 0000:04:00.0: qmi mem seg type 1 size 262144
>> ath12k_pci 0000:04:00.0: qmi mem seg type 1 size 524288
>> ath12k_pci 0000:04:00.0: qmi mem seg type 1 size 524288
>> ath12k_pci 0000:04:00.0: qmi mem seg type 1 size 524288
>> ath12k_pci 0000:04:00.0: qmi mem seg type 1 size 524288
>> ath12k_pci 0000:04:00.0: qmi mem seg type 1 size 524288
>> ath12k_pci 0000:04:00.0: qmi mem seg type 4 size 524288
>> ath12k_pci 0000:04:00.0: qmi mem seg type 4 size 524288
>> ath12k_pci 0000:04:00.0: qmi mem seg type 4 size 524288
>> ath12k_pci 0000:04:00.0: qmi mem seg type 4 size 524288
>> ath12k_pci 0000:04:00.0: qmi mem seg type 4 size 524288
>> ath12k_pci 0000:04:00.0: qmi mem seg type 4 size 524288
>> ath12k_pci 0000:04:00.0: qmi mem seg type 4 size 524288
>> ath12k_pci 0000:04:00.0: qmi mem seg type 4 size 524288
>> ath12k_pci 0000:04:00.0: qmi mem seg type 4 size 524288
>> ath12k_pci 0000:04:00.0: qmi mem seg type 4 size 524288
>> ath12k_pci 0000:04:00.0: qmi mem seg type 4 size 524288
>> ath12k_pci 0000:04:00.0: qmi mem seg type 4 size 524288
>> ath12k_pci 0000:04:00.0: qmi mem seg type 4 size 524288
>> ath12k_pci 0000:04:00.0: qmi mem seg type 4 size 524288
>> ath12k_pci 0000:04:00.0: qmi mem seg type 4 size 524288
>> ath12k_pci 0000:04:00.0: qmi mem seg type 4 size 524288
>> ath12k_pci 0000:04:00.0: qmi mem seg type 4 size 65536
>> ath12k_pci 0000:04:00.0: qmi mem seg type 1 size 524288
>>
>> Now ath12k is working. If suspend is triggered, firmware will be reloaded
>> during resume. As same as before, firmware requests two large segments at
>> first. In ath12k_qmi_msg_mem_request_cb() segment count and size are
>> assigned:
>>
>> 	ab->qmi.mem_seg_count == 2
>> 	ab->qmi.target_mem[0].size == 7077888
>> 	ab->qmi.target_mem[1].size == 8454144
>>
>> Then allocation failed like before and ath12k_qmi_free_target_mem_chunk()
>> is called to free all allocated segments. Note the first segment is skipped
>> because its v.addr is cleared due to allocation failure:
>>
>> 	chunk->v.addr = dma_alloc_coherent()
>>
>> Also note that this leaks that segment because it has not been freed.
>>
>> While freeing the second segment, a size of 8454144 is passed to
>> dma_free_coherent(). However remember that this segment is allocated at
>> the first time firmware is loaded, before suspend. So its real size is
>> 524288, much smaller than 8454144. As a result kernel found we are freeing
>> some memory which is in use and thus crashed.
>>
>> So one possible fix would be to free those segments during suspend. This
>> works because with them freed, ath12k_qmi_free_target_mem_chunk() does
>> nothing: all segment addresses are NULL so dma_free_coherent() is not called.
>>
>> But note that ath11k has similar logic but never hits this issue. Reviewing
>> code there shows the luck comes from QMI memory reuse logic. So the decision
>> is to port it to ath12k. Like in ath11k, the crash is avoided by adding
>> prev_size to target_mem_chunk structure and caching real segment size in it,
>> then prev_size instead of current size is passed to dma_free_coherent(),
>> no unexpected memory is freed now.
>>
>> Also reuse m3 buffer.
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Fixes: 64430ddfb132 ("wifi: ath12k: support suspend/resume")

ERROR: Commit id not found from current branch: Fixes: 64430ddfb132 ("wifi: ath12k: support suspend/resume")

Do note that commit ids in the pending branch are not stable so fixes
tags cannot be used for those commits.

>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>
> To keep git bisect clean should this patch be applied before applying
> the suspend patchset? No need resend or anything, just checking what
> should be the correct order.

Ah, I just checked and it looks like this patch depends on the suspend
patchset. I now applied this patch to pendign branch
(ath-pending-202404190433).

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

