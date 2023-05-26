Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C802C77B7A
	for <ath12k@archiver.kernel.org>; Fri, 26 May 2023 09:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=svsoJxM8Injl4hlSvVGCw9ZKOgKWZe1wIhUiSgyyox4=; b=s5ZuLhneT6nnlx
	LdBVcLSTVuGk3RrPEIJvzH9S6eHmhoul/9ovawz2M9DRXXLHMl9iwEt2lb9bODH3KK37MaU/xKyPb
	wbDmkAk+lDaMEIx39SNeMqL1laX8ykgZ+LqwBuxN1pn+6FMxN039NTLBE1tiCdLHR23yErLForpZt
	E7ueP7b6jSYbtY5Nbyy/8qFSn+FpizBwIzyTu8Jid9cvi2rqQPqslHa+grAUkCMvpLb5+FnWwtWwE
	efHaNb3kc/TVy4imwM/glFEqjWyzYkG8BlA6UTl4daoMWfhrUOGhqLqONtVj1zcxXLcjxOb5jU2WG
	0Gm8v+5qL/2l1SIogbRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Tnv-001oSz-07
	for ath12k@archiver.kernel.org;
	Fri, 26 May 2023 09:32:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Tnr-001oR9-2A
	for ath12k@lists.infradead.org;
	Fri, 26 May 2023 09:32:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 060BE64E9E;
	Fri, 26 May 2023 09:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 667FFC4339B;
	Fri, 26 May 2023 09:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685093526;
	bh=y/K1EmIoa3slmOujvbe2/SbxkjnvSTEeTtaX5VkJ+p8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=CJn/FCYxpSMDmdMxY4QeTgaNfSry0JtSNSvrVd83JCRawbKh4Xf0hhjlupcDworBs
	 gdaPr9/FgBeT4/0D0NsjV0/C9Bm+3IG0CHKsg6wJPPvoELYLsSp2Zdz5knQfrorqTH
	 Yvpgcui/DmQCyYELBIxYfm2UOwkEVk0mbahLNoQLsYtdKj3tQld5tMQAXjnia0HSf9
	 KyC9HI8SgPCdRxtA23n9qN16oRl9F759fWOzJWFEClIyDL19d18EWsEHhH4B8iMfQv
	 19XWD9aktnOe6rAg88F2x/02kK7UqrlPenh+exTfOeePfNtKfHETavtcC6bZ/gSVyd
	 TvtW+V3+zmJyA==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2] wifi: ath12k: Use msdu_end to check MCBC
References: <20230509033638.3228-1-quic_bqiang@quicinc.com>
Date: Fri, 26 May 2023 12:32:00 +0300
In-Reply-To: <20230509033638.3228-1-quic_bqiang@quicinc.com> (Baochen Qiang's
	message of "Tue, 9 May 2023 11:36:38 +0800")
Message-ID: <878rdbl9pr.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_023207_748065_B42A2D16 
X-CRM114-Status: GOOD (  20.09  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> We are seeing a very low TCP throughput testing with some specific
> tools. This is because for sub-frames of an AMSDU, MCBC flag in
> mpdu_start may be not valid, and as a result those frames would be
> dropped by kernel.
>
> Add a new helper to get it from msdu_end.
>
> Since original helper is not used for now, add __maybe_unused
> attribute to make GCC happy.
>
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> ---
> v2:
>  1. add a new helper according to Vasanth's comment.
>  2. change to use __le16_to_cpu instead of __le32_to_cpu
>
>  drivers/net/wireless/ath/ath12k/dp_rx.c | 13 ++++++++++---
>  drivers/net/wireless/ath/ath12k/hal.c   | 14 ++++++++++++++
>  drivers/net/wireless/ath/ath12k/hal.h   |  1 +
>  3 files changed, 25 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
> index 8c8162fbe5c6..972034b7f159 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> @@ -193,13 +193,20 @@ static void ath12k_dp_rxdesc_set_msdu_len(struct ath12k_base *ab,
>  	ab->hw_params->hal_ops->rx_desc_set_msdu_len(desc, len);
>  }
>  
> -static bool ath12k_dp_rx_h_is_mcbc(struct ath12k_base *ab,
> -				   struct hal_rx_desc *desc)
> +static __maybe_unused bool ath12k_dp_rx_h_is_mcbc(struct ath12k_base *ab,
> +						  struct hal_rx_desc *desc)
>  {
>  	return (ath12k_dp_rx_h_first_msdu(ab, desc) &&
>  		ab->hw_params->hal_ops->rx_desc_is_mcbc(desc));
>  }

Using __maybe_unused is usually a bad idea, it should be used only on
very special cases.

But why do you leave struct hal_ops::rx_desc_is_mcbc? Nobody is using it
and we should not have dead code lying around.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
