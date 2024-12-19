Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECADE77184
	for <ath12k@archiver.kernel.org>; Thu, 19 Dec 2024 11:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XvnnEwsyYKooFzB7dzQJqk/DwXCH+o55BH3qxd72EMk=; b=BEEWCjgL0wXF1qCcE3YteGT1kE
	Dx6k4LNzqw8X1u92Dsjdrj4LCk/QodW7s7Hhz6gxm1REXyTl2jbgZDdxWcP8vWO02ViCeegGO/Td7
	Y4porJhZYxGQFhSybtZsWkfQEshFVshmftbmxCQk1ThfFHhbt2M6fX6ckVpMtMa5UHmgdKACqJZIU
	ZCwlW1GOlDRxW7C2ACozctQILxOAnnyClGqZFVtaet1P3RY69J9BOBpCOTCEuj+oHgnxsAqgO6DGt
	+jjaLJWDMKI2a2xI3Z/x2Yo3LUVd1sqiiKI5RVXrJ2wV1Gswx2d/PqhB1ujxqT3O0z2CyOZndK0zj
	HxJEor/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEmL-00000001fyA-0aZT
	for ath12k@archiver.kernel.org;
	Thu, 19 Dec 2024 11:33:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOElG-00000001fsn-0pgP
	for ath12k@lists.infradead.org;
	Thu, 19 Dec 2024 11:32:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C921EA420BF;
	Thu, 19 Dec 2024 11:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 425C4C4CECE;
	Thu, 19 Dec 2024 11:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734607929;
	bh=gte74b0Y8f2QJIkvnAM1b3fi665Ezbem0bk6W9zICGw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Xs9FwFnXP7a4Ue7s6lsXVnT1qwLOcVaW+raP9wSSQgVT5o9XGkIrQf9K7AwbQm+/J
	 Irb4UYbeGcVViSh5qbSQBoBXleTy+VBftwJaAuWVBjNd9w0XiGj1EAMk7glGPLFOP5
	 K/Q4m9w4xbk02lCsIPGKt3Y9EU/0633mo+XZUEzi7qA+cMgLJRdJvLYOPu7rz8xZA/
	 FB1lhGoqVsMFRbHMNz4W1NExm02pbzUxx30/Is+ZhENGpTdw0JUgZhDyrkDTqIW1Jr
	 bZEONDmbKxRPMrnAcCbv2ARz6ZWJGlojI1gul48lCMGF3+3Z30IA7yQsDUeStieAc8
	 UYxx9zwLaTzQw==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 2/3] wifi: ath12k: Refactor the monitor Tx/RX handler
 procedure arguments
References: <20241219001006.1036495-1-quic_periyasa@quicinc.com>
	<20241219001006.1036495-3-quic_periyasa@quicinc.com>
Date: Thu, 19 Dec 2024 13:32:06 +0200
In-Reply-To: <20241219001006.1036495-3-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Thu, 19 Dec 2024 05:40:05 +0530")
Message-ID: <87wmfvj4cp.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_033210_298953_19920EB8 
X-CRM114-Status: GOOD (  15.80  )
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

> Currently, the pdev handle is given along with the mac id to all the
> monitor Tx/Rx handler procedure arguments. The mac id information is
> derived from the pdev handle itself. Therefore, remove the unnecessary
> mac id argument from the handler.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp_mon.c | 29 ++++++++++++------------
>  drivers/net/wireless/ath/ath12k/dp_mon.h |  7 +++---
>  2 files changed, 17 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
> index 85ff89b91624..ae2f6847bc88 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_mon.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
> @@ -845,7 +845,7 @@ static void ath12k_dp_mon_rx_msdus_set_payload(struct ath12k *ar,
>  }
>  
>  static struct sk_buff *
> -ath12k_dp_mon_rx_merg_msdus(struct ath12k *ar, u32 mac_id,
> +ath12k_dp_mon_rx_merg_msdus(struct ath12k *ar,

BTW I find it confusing that in the commit message you talk about "pdev
handle" but in the code it's named "ar". It would be nice to have
terminology all over. No need to change anything for this patch, just a
small comment for the future.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

