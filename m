Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15F9CD128A
	for <ath12k@archiver.kernel.org>; Thu, 11 Apr 2024 09:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qb6jt6PvVwoLULilcXMSDZp7vaCn/4G5M+/2GvRm7jc=; b=2izNp3NTJ75miV9nZzCNny7UQ8
	wEcv5E1EQ4rxUCRfvJ5wuFbxcyqfL4O3vF6GTALJm401uxdQFIMEp8FD0DNED9kKm99kYA98AUV4J
	EKgdgZUVEYhZWXdweO6kWHb3hASOvIupoFRuQpbLEaP0pVbKxNCUAoKVr7eMeLS2PaLaiM1Wu7MKH
	wnyyg0C6b2P/UhZPrHG73JW4nWBYJMN0qu3JJqyUao1xGD54GKLxBGz+v9U04HVssllayv90NW/5M
	MrKOBVgEsr13sPbvYwIqGsAKDEkJW5BpaFy7CAWm6x+iSNgZVcS0TQ3B60RTlm6jjGhdzuE0uPz+U
	1kYJPlAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rur0L-0000000BNuL-2pS1
	for ath12k@archiver.kernel.org;
	Thu, 11 Apr 2024 09:46:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rur0I-0000000BNsf-15s4
	for ath12k@lists.infradead.org;
	Thu, 11 Apr 2024 09:45:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9AB626201D;
	Thu, 11 Apr 2024 09:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CEC2C43390;
	Thu, 11 Apr 2024 09:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712828757;
	bh=BYThVt2f6ZbPfcrZfcye+ZzXWaZShz25k/PsRATYf4Q=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=t1z4+Ogl824G3HpZumwr43fb8pleL8qgj1kirCLEf81bAGfHFtywR0NGLNGg2Zv+6
	 ck1mvIFRUCGv3fxN9yTpMeNyNUILTiKIGfgpzHqPTir/t8I9iGu4r9GrAr/TASDtqu
	 07kkjpDPDYai2n3j3k3tpwaDA8qCkFm7xffkp8lBkf+QPbuNZTEIhMT4NgXHZ8j4Lo
	 3BkR2bA9WLKM6TioQtsxZ+W02jW47pZwfmYusowg76t5blc0hawOlVTWltS+arrY0O
	 S1E5RNieGo1Pl+pKALcQ02d/28ZUJP2AI08WCJRzyIxubuMXNeetg8jOZl1pRJPwTP
	 5hMxp/jsxt5Pg==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Jeff
 Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH v2 4/4] wifi: ath12k: Refactor data path cmem init
References: <20240409151415.1226109-1-quic_periyasa@quicinc.com>
	<20240409151415.1226109-5-quic_periyasa@quicinc.com>
Date: Thu, 11 Apr 2024 12:45:54 +0300
In-Reply-To: <20240409151415.1226109-5-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Tue, 9 Apr 2024 20:44:15 +0530")
Message-ID: <877ch4z0z1.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_024558_365720_CFBA1F02 
X-CRM114-Status: GOOD (  11.47  )
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

> Move the data path Tx and Rx descriptor primary page table CMEM
> configuration into a helper function. This will make the code more
> scalable for configuring partner device in support of multi-device MLO.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

[...]

> +static void ath12k_dp_cmem_init(struct ath12k_base *ab,
> +				struct ath12k_dp *dp,
> +				enum ath12k_dp_desc_type type)
> +{
> +	u32 cmem_base;
> +	int i, start, end;
> +
> +	cmem_base = ab->qmi.dev_mem[ATH12K_QMI_DEVMEM_CMEM_INDEX].start;
> +
> +	switch (type) {
> +	case ATH12K_DP_TX_DESC:
> +		start = ATH12K_TX_SPT_PAGE_OFFSET;
> +		end = start + ATH12K_NUM_TX_SPT_PAGES;
> +		break;
> +	case ATH12K_DP_RX_DESC:
> +		start = ATH12K_RX_SPT_PAGE_OFFSET;
> +		end = start + ATH12K_NUM_RX_SPT_PAGES;
> +		break;
> +	default:
> +		ath12k_err(ab, "invalid descriptor type %d in cmem init\n", type);
> +		return;
> +	}
> +
> +	/* Write to PPT in CMEM */
> +	for (i = start; i < end; i++)
> +		ath12k_hif_write32(ab, cmem_base + ATH12K_PPT_ADDR_OFFSET(i),
> +				   dp->spt_info[i].paddr >> ATH12K_SPT_4K_ALIGN_OFFSET);
> +}

Here's a good example why I don't like functions returning void. How do
we handle the errors in this case?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

