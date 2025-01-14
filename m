Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7985CE77188
	for <ath12k@archiver.kernel.org>; Tue, 14 Jan 2025 18:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3NXrMi4wx8PYLPYZXZJngTB9cHctmJ0cx+fCGzuNog=; b=obfT0NRNpdp24i7icSCJej52p9
	oDm/yOllh6+GufVTe2tCcK4AOvwunn8zvoFSdqBBg8QmadmPop88zve0vfyrm9M+5cgu9SN90e4p3
	DupxdqLTTAhKybKnKIuvur7fomZJRLUHIDo9Q8qTICBB+cS3a9vGIsyviFDcYT2JGuedE9/tuZbgw
	GHnIpi4ca+1h7RhKR8A8Tnkb9ZdpUHtpK2v4FwJG87vBRiTil3Q9CjPMkkWiZt5+YQeUAFkJPC37p
	Jj/ruFNNKpOkKFxIJt+Ilh7lu1JXr6EMp2/B0YVqkxXNuAZRwLKVmaxGcvN1/0z9igirXAdyzGsSt
	B37IxU0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXleb-00000009QDF-131x
	for ath12k@archiver.kernel.org;
	Tue, 14 Jan 2025 18:28:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXleS-00000009QCW-1ixa
	for ath12k@lists.infradead.org;
	Tue, 14 Jan 2025 18:28:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2D18DA400C1;
	Tue, 14 Jan 2025 18:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7441C4CEDD;
	Tue, 14 Jan 2025 18:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736879311;
	bh=WOY4AGPayNCfR8xPWYGzZU8DRPDN3/lPA1u+hsfXMts=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=jGQn2wEjtVcKWRvODJf4C7GHXI2/xzIs2PbVZMVIxzHdFYDT0b/t6OR3mB/eMOwL0
	 PeTh60xa7c2VOu5L/rkYwS9O/NtM4KosXq0ZF38ufm76EUrakME1WGkt8Xhy4/Xhws
	 4zvr+FBZILRRa/Abw+cwmEcgQTndDfvEIsmO+jW0VgQl73bP99mfsLNH8HZloZCaye
	 i/zlA2uAb0oySy0sClv0gnPpPAABX/UxCuqreC7dqPXk+NZSSp2/6f09cgEmLviO+H
	 7z8g1Q/eHLpyPx67FltqBNGy9zN+sM7phBgKy57Bq/20txatJuTTI98dYFwD3AdVGo
	 89NQttngDrJxQ==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Jeff
 Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/4] wifi: ath12k: Refactor ath12k_hw set helper
 function argument
References: <20250112071630.4059410-1-quic_periyasa@quicinc.com>
	<20250112071630.4059410-2-quic_periyasa@quicinc.com>
Date: Tue, 14 Jan 2025 20:28:28 +0200
In-Reply-To: <20250112071630.4059410-2-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Sun, 12 Jan 2025 12:46:27 +0530")
Message-ID: <87plkpp7w3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_102832_523397_7504873F 
X-CRM114-Status: UNSURE (   7.82  )
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

> Currently, ath12k_hw is placed inside the ath12k_hw_group. However, the
> ath12k_hw set helper function takes the device handle and the index as
> parameters. Here, the index parameter is specific to the group handle.
> Therefore, change this helper function argument from the device handle to
> the group handle.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

