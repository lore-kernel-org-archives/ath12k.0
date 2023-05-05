Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB75C77B7F
	for <ath12k@archiver.kernel.org>; Fri,  5 May 2023 13:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qcjdkkBbB+Ad1ZoYCvPVRqDhgrclncIUrLV/phVT6gE=; b=BCBwG4QvtPgfEp
	l9AdxsUNhOSc6TMC1zpvtDxn88M+O+h34YAPwRi2czYQfodiB/E1S+DawncHfwJC2fyjgb7qIx8y+
	1Zf2iVd2MYWrKMi0FtBDv/rjelUR9o8Gz9tOy6G8GIwzzlrjferyEwoIUP8Yk8S2JKvza/oU4/Dzy
	B1+bt3zBL9VqSzcT0vKslYJ3DerFSNA1tJA2HaJXxMONEVcR33InFo4dXcQqfFWZTBikX3ROJzEvA
	KgSx0IyNLxWVOsHjgI9bUHRxfHxKmJn3JegjVTtIoImfbyiIIc/mjsDTnWkxmWWwzbMb4hxHkB7wr
	jIR/zUQ0XCKqqoeufI9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puvNp-00Ayf1-0b
	for ath12k@archiver.kernel.org;
	Fri, 05 May 2023 13:22:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puvNm-00AyeX-1p
	for ath12k@lists.infradead.org;
	Fri, 05 May 2023 13:21:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 277846140C;
	Fri,  5 May 2023 13:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D96C433D2;
	Fri,  5 May 2023 13:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683292917;
	bh=HcqxHOun+ldbY6nh4o6lZNFHceYBOx2rf7QWpaVUt38=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=PB1PexEP983bQiVIC8yrkkhY0BfaFq8TXGZv8ipZ2cOWHRVEH9Z5wY0hXIvo0y1Gh
	 EYtMU/EKjKm8CUa1soGExVx1cF8UShzxsfxAdRDNB7RXELMDrQBALtW0GSg0nmx8Fc
	 U4vVoHczOnmNT6o+ZtoJQNhI3yMX/3KHo13fW3wudTceRScBlEGw+Qce80tXmCwCmn
	 OX6SXOQiqeMc40ypjYRWguS4fPAr8aSOjvXCtQxG3B+bOlAAX5hbcDFi5eCEZEL/90
	 LSU94T5Ev4elV+x94jd1cMPyUDilczvpT3XRftBMv1Cq9b9WCDcYrj7bwiDCZ2rtQG
	 thKUfHDHmI5Uw==
From: Kalle Valo <kvalo@kernel.org>
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Cc: ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org,  Aishwarya R <quic_aisr@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: increase vdev setup timeout
References: <20230428091041.20033-1-quic_rgnanase@quicinc.com>
Date: Fri, 05 May 2023 16:21:52 +0300
In-Reply-To: <20230428091041.20033-1-quic_rgnanase@quicinc.com> (Ramya
	Gnanasekar's message of "Fri, 28 Apr 2023 14:40:41 +0530")
Message-ID: <87354aq5fz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_062158_645915_FAE01FA0 
X-CRM114-Status: GOOD (  18.86  )
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

Ramya Gnanasekar <quic_rgnanase@quicinc.com> writes:

> From: Aishwarya R <quic_aisr@quicinc.com>
>
> When vdev start/stop happens, response from firmware is received with delay
> and hence there is a timeout before VDEV can be up/down.
> Also, with maximum peers connected and when vdev stop occurs, firmware
> will take time to clean up all the peers and vap queues.
> In such cases as well, vdev start/stop response is sent by firmware with delay.
>
> Increase the vdev setup timeout as recommended by firmware team.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0-02903-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Aishwarya R <quic_aisr@quicinc.com>
> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 2 ++
>  drivers/net/wireless/ath/ath12k/wmi.h | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 8c401145a221..d720d95eba96 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -771,6 +771,8 @@ static int ath12k_mac_vdev_setup_sync(struct ath12k *ar)
>  	if (test_bit(ATH12K_FLAG_CRASH_FLUSH, &ar->ab->dev_flags))
>  		return -ESHUTDOWN;
>  
> +	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "ath12k vdev setup timeout %d\n",
> +		   ATH12K_VDEV_SETUP_TIMEOUT_HZ);

There's no reason to have string "ath12k" in the debug message so I
removed that in the pending branch. I also added an empty line after the
debug message.

No need to resend because of these.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
