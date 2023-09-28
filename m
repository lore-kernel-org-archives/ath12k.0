Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB51E732DB
	for <ath12k@archiver.kernel.org>; Thu, 28 Sep 2023 15:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YG2B6MlhQ9ROUKZxd4xxFM65qOXOt34uLCZyVoJpz38=; b=L5OCAxbr0CDVEH
	xUYdtBG1PjmIQzK92IVDZbpRTxnuzbMqTPYQ5aq0d3iOQlcL+YRT6woEF7pKOqKil2C5koyp/Tq57
	vI6hjvDus+RPFqBLVvPn94yc6Q5isQNfaJjCLdzN4zmil0BUHFcch0G9OqHdhk4d27Q5PHxZZ9OiK
	1fIa9od0uEHAyv3j1Ugr+h5jIIxAgwNN0v9Gn2LRCUMfZKonC0Bqwloq+R08TKcTkwU5wlmMbdKrV
	cWqO5YivuFDSzJCqsjleRPEi6Bb+4JShxj73LZ5kwFzd0fTDitmVpYMpGw1DlmF18/A2WxR5v/dwd
	6dwLGemhfjtBRGfcgx3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlshM-005IIC-09
	for ath12k@archiver.kernel.org;
	Thu, 28 Sep 2023 15:13:04 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsh7-005I64-0B
	for ath12k@lists.infradead.org;
	Thu, 28 Sep 2023 15:13:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6B0C6CE21FB;
	Thu, 28 Sep 2023 15:12:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1104C433C7;
	Thu, 28 Sep 2023 15:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695913964;
	bh=SM8aoie+ezJU9UWpCf9w3qJBLObW5VTQZ19AGhyBUxw=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=GZj0DAFMD9JPXISv+El0rXTFMqeUskYVNuYuNVgU8ohhHofxRHXtjVIxLKE6irDsl
	 3bNss1PayM8GEbVLewPA0gB9nf3RYeCk2L1MBvH1PT9f35ddNpFZv+ggafyTQ6ZEQZ
	 q0zN5zhZp1VeBfQZbgDwnfsaJLD2+oJd5QQXL5zFgURb0oeC7X+RK34v7SZd7DgCRP
	 ruU6SzvA2r+BW5x7vqJwrAeXdrbcXkIUfOy+EeNIrqRm7olCplsXkNSENzvdYbOAVg
	 5Xd7Fvwm0zXla86xlE4krH3n8GKU5KLMq3aQKyRZNTMQJeYHJF9JXsQ9Txar7cCths
	 UM2iux660tXEA==
MIME-Version: 1.0
Subject: Re: [PATCH v2] wifi: ath12k: add msdu_end structure for WCN7850
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230911093054.74943-1-quic_kangyang@quicinc.com>
References: <20230911093054.74943-1-quic_kangyang@quicinc.com>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_kangyang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169591396177.3019228.6958340171406115973.kvalo@kernel.org>
Date: Thu, 28 Sep 2023 15:12:43 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_081254_907037_2C6E1DE9 
X-CRM114-Status: UNSURE (   9.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Kang Yang <quic_kangyang@quicinc.com> wrote:

> WCN7850 and QCN9274 currently use the same structure rx_msdu_end_qcn9274
> for msdu_end. But content of msdu_end on WCN7850 is different from that of
> QCN9274. Need to update it for WCN7850, otherwise will get the wrong
> values when using it.
> 
> For example, TID is no longer in WCN7850's msdu_end. But
> ath12k_dp_rx_process_err() and ath12k_dp_rx_process_wbm_err() still get
> TID from msdu_end. So an uncertain value will be used in these two
> functions on WCN7850.
> 
> Therefore, add new structure rx_msdu_end_wcn7850 for WCN7850.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

ed823fd113b7 wifi: ath12k: add msdu_end structure for WCN7850

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230911093054.74943-1-quic_kangyang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
