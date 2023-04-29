Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6DFC7618E
	for <ath12k@archiver.kernel.org>; Sat, 29 Apr 2023 05:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBDInCoDQfNovfjo/JumIjz1o4vdgkTHDmNrO4Qva5Y=; b=qmSdioXFp4jIGX
	2xnx6MEsl+jw6dCp0YzVjuVL0hkm6Ns9u9VqvBOCeTIyWE2nF/wrUOXXkG1uK47sI61MlR45OE5v4
	6jQUR6unggSZXmiH4dc1p+bEKqXFQX/QUGGIqhoU2ysPaO1LUlOgG55l42IR8djDFhytmr2FR2n/0
	6XnLD/K2du6IeGFGFDZiIV3qN8kZ2M4K4SmHr5Z//G4a+LIk39qe3WAAWMy22Tzr6oTHu9VniE+AK
	n+bdpX91ftCLL2kLWRKIe7BSmp4JcaM8eil/jZxN9y9Ts+4NzshceuTz8q3kOv2Wbd081L76Nt09H
	peMKEQdhlUpTo/XVD11Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pscuE-00CFeO-0v
	for ath12k@archiver.kernel.org;
	Sat, 29 Apr 2023 05:13:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pscuB-00CFdi-0x
	for ath12k@lists.infradead.org;
	Sat, 29 Apr 2023 05:13:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 54ADB60F10;
	Sat, 29 Apr 2023 05:13:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED7EDC433D2;
	Sat, 29 Apr 2023 05:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682745233;
	bh=r5E86GbWJoJSovVkNlKmvYTpBcDKf9qHb5WfgtRMnPU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=AkqJM+UZ3+8pA/CHuwgCuvbc2YkQmbPyqgdP/+NN815bVfV72mcp58BJoA9d9fDx6
	 l5eyFs3T8Rz5cIvnjxrH8xotThEpDRpVxxm9VU/g1pavD0qSGgwTEDxlc3VCrGWJ+d
	 0kb4gjThSlv0eg9RJyqh4ZxLiwibr5ZHG0QTUEXDh20+YbjL0j69wJdlvc/tU82twQ
	 fSlv8WCDFeZkg23UiW5Y1UYFIPR+D+s/krPFlYHkcZuk2g7aGqgW8W9DypNp8h/dKl
	 PktU8PXhLCDUEPzIHbRvimQgHSqQN14qHY3xarNpONueVkCaK02KB2+XeRLBklffgG
	 JKqaimEqqaZmQ==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: Use msdu_end to check MCBC
References: <20230427013021.29792-1-quic_bqiang@quicinc.com>
Date: Sat, 29 Apr 2023 08:13:48 +0300
In-Reply-To: <20230427013021.29792-1-quic_bqiang@quicinc.com> (Baochen Qiang's
	message of "Thu, 27 Apr 2023 09:30:21 +0800")
Message-ID: <87zg6rqnhv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_221355_373899_0292DA11 
X-CRM114-Status: GOOD (  15.65  )
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
> Change to get it from msdu_end.
>
> Tested-on: WCN7850 hw2.0 PCI
> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/hal.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath12k/hal.c
> b/drivers/net/wireless/ath/ath12k/hal.c
> index 0ec53afe9915..980ec2024b37 100644
> --- a/drivers/net/wireless/ath/ath12k/hal.c
> +++ b/drivers/net/wireless/ath/ath12k/hal.c
> @@ -889,8 +889,8 @@ static u8
> *ath12k_hw_wcn7850_rx_desc_mpdu_start_addr2(struct hal_rx_desc *desc)
>  
>  static bool ath12k_hw_wcn7850_rx_desc_is_mcbc(struct hal_rx_desc *desc)
>  {
> -	return __le32_to_cpu(desc->u.wcn7850.mpdu_start.info6) &
> -	       RX_MPDU_START_INFO6_MCAST_BCAST;
> +	return __le32_to_cpu(desc->u.wcn7850.msdu_end.info5) &
> +	       RX_MSDU_END_INFO5_DA_IS_MCBC;

New warnings:

drivers/net/wireless/ath/ath12k/hal.c:892:16: warning: cast to restricted __le32
drivers/net/wireless/ath/ath12k/hal.c:892:16: warning: cast from restricted __le16

Please remember always run ath12k-check (with sparse installed).

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
