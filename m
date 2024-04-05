Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D44CD1297
	for <ath12k@archiver.kernel.org>; Fri,  5 Apr 2024 12:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhQ1glK4YxVSrmM6hOiORyOzVWiwcBYsYUnw3AZyA1w=; b=uhrr7n2ue5RAxGLB5o4HAldp2x
	FAjNeT6ppUlibwRQO6q6hjg8wFM5CE04VVFnLZB64x6ChW3+ajlxDJhcO9vmpEcbLzEGHUDJsYqwT
	TTmArvex61HiQYgNq94Pq/+7goEuLH19cw+bnWZ7ARortqb9QHl52osYiS8Ok9SLkIPzIfz+cRy1S
	kzxIrazyuP2KNMw3ymDOyDBB9y99ll5TTA79/hd4LRXvOCHgUy9tzOhYVrnsr3Q+zh6q8l4l/sVM2
	FBzx/yvwpkO20iONe96asJBwn005GRIrQfV1Jenn+nOrmcvXDkCf0TJgT1KeO2hZdKn5ifA/47RWz
	YqPn5LzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsj8F-000000074xb-2Tac
	for ath12k@archiver.kernel.org;
	Fri, 05 Apr 2024 12:57:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsj8C-000000074tT-0o2t
	for ath12k@lists.infradead.org;
	Fri, 05 Apr 2024 12:57:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 576476139D;
	Fri,  5 Apr 2024 12:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F109C433C7;
	Fri,  5 Apr 2024 12:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712321839;
	bh=wUCIFs3hVW+MtJ+Dbhk7eN7aU5AeyqZdLHy+SF21Bdc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=P/tkFW6/72WuwK6CgXslwnlAUnyxvreLi6L+XASUS8BBYDyYio2TDc2CQ/rSAJnX3
	 AjXbx4pqKXL7+781n8uwHyxlrn5w+rwSu3HiZqCdCtXgJuxzh3/qv2IUOOsTFbslOZ
	 3wvJBgXKZZO02Q91qm76NHWIqNgzse0CxE5yVqRRluyH2UNl6pAsxabMQArMF8W7p0
	 Xn0PmabNQP9yuatEtXYxsRGUwlOuD/dSD/0AAHnTjkZG3vbyBoV3MT2SSAutZ57VD2
	 5v0Cmu1/94LXD6UQjnTV4KJh+SbiAyOLKTGIga6ea6P23gE7xK1fZVRsmRvW+sZKaO
	 e3lDXaZXC7tBg==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] [RESEND] wifi: ath12k: extend the link capable flag
References: <20240403042056.1504209-1-quic_periyasa@quicinc.com>
	<20240403042056.1504209-2-quic_periyasa@quicinc.com>
Date: Fri, 05 Apr 2024 15:57:16 +0300
In-Reply-To: <20240403042056.1504209-2-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Wed, 3 Apr 2024 09:50:55 +0530")
Message-ID: <87il0w2cib.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_055720_438724_D3CB0C8D 
X-CRM114-Status: UNSURE (   9.72  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:

> Link capability categorized as Single Link Operation (SLO) and Multi Link
> Operation (MLO).
>
>  - Intra-device SLO/MLO refers to links present within a device
>  - Inter-device SLO/MLO refers to links present across multiple devices
>
> Currently, driver uses a boolean variable to represent intra-device SLO/MLO
> capability. To accommodate inter-device SLO/MLO capabilities within the
> same variable, modify the existing variable name and type. Define a new
> enumeration for the link capabilities to accommodate both intra-device
> and inter-device scenarios. Populate the enum based on the supported
> capabilities.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

[...]

> +enum ath12k_link_capable_flags {
> +	ATH12k_INTRA_DEVICE_MLO_SUPPORT	= BIT(0),
> +	ATH12k_INTER_DEVICE_MLO_SUPPORT	= BIT(1),
> +};

I did s/ATH12k/ATH12K/ on this patch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=c15ec7e3397e7a400b2a6a3cb232f95a94c95989

We have also another similar typo in ath12k:

dp.c:1350:	spt_idx = u32_get_bits(cookie, ATH12k_DP_CC_COOKIE_SPT);
dp.c:1368:	spt_idx = u32_get_bits(cookie, ATH12k_DP_CC_COOKIE_SPT);
dp.h:248:#define ATH12k_DP_CC_COOKIE_SPT	GENMASK(8, 0)

Patches welcome.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

