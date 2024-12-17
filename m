Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258D9E7717F
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 19:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8u8IdifDqqp5EDwNDyuHe4zVVixcxghX9PwK68GiFUs=; b=I6H72odMkva+N1uh0qJuoqsdrL
	S6OWRMK6HxlqV2r9oXJhkJoSxvNt5jb1JZWqGP9pS+E0zl1Am1NI8AFHHt9MWp9YmRfSM1NulgYr8
	NbLOmWuFwaF/VBQOcAixlXH+LEfdYEW08GqoGKmr/bjB0U1kKrjpwPY26vesD19g67ycDFG9EwlPe
	E9CRxFM5IrRXHM0qLYpP07imw6XAmH3sH6O/7vOD0C7CK7g/0GchYcU63GjxGgKXK5JK3AXWTk9iz
	t2eeXgwGk+WU8D4ymg8bbxp/Mre2lkiqKZLcQCyaan1M1Y3/GwQGW3y/jzTVZLoE3b4XQ63szp++1
	Iku1ROJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdYB-0000000EfsQ-3Wop
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 19:48:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdXJ-0000000Efi0-0qZs
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 19:47:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 59E8B5C5967;
	Tue, 17 Dec 2024 19:46:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E670C4CED7;
	Tue, 17 Dec 2024 19:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734464836;
	bh=l+Oldl3gDqfdRJsg/VWcY4tx4XXTlXyc97fkXOIDLnA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=kIE6RL/wdDFYAQFI2K/V0do6sgE9hDBK4RqLFqnxe/Y8/GwaFyt3vin+FMadQvmVj
	 j/QYQaeF2/jd4Q60KhKchMiSTJSTJjqJHdeRabp2pWm0utjuEbEudB74ckdh8XJTXV
	 5PeMhJrkbXUP9Fi8hup3M5jbOKFfOpgD4HVPJ1IWMeuRrG+tGq1PkpdXE76bU+RVZI
	 9jzBKV4VaLeAUK/FM20jATDEh65rCyUN2l8l2BXF1TUQv3uk3fWk7KjbYKNPmx75D9
	 FVw2c1UujfG9I/JkIYQfOBtpbV7/yDufBA9GdWTPmXE9k9nCg4QfW1ZLfeHdUmzEK9
	 JjnqP0/jWoDBQ==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Jeff
 Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH v3 2/8] wifi: ath12k: Refactor monitor status TLV structure
References: <20241217084511.2981515-1-quic_periyasa@quicinc.com>
	<20241217084511.2981515-3-quic_periyasa@quicinc.com>
Date: Tue, 17 Dec 2024 21:47:13 +0200
In-Reply-To: <20241217084511.2981515-3-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Tue, 17 Dec 2024 14:15:05 +0530")
Message-ID: <878qseks72.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_114717_290179_01B5408B 
X-CRM114-Status: UNSURE (   8.85  )
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

> The following TLV structures and bitmask definitions were inherited from
> the ath11k but were not updated for the ath12k 802.11be hardware. These
> data structure and bitmask will be used to parse the monitor status
> TLV data in the Rx path.
>
> 1. hal_rx_ppdu_end_user_stats_ext structure
> 2. hal_rx_ppdu_end_duration structure
> 3. HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_TXBF bitmask
> 4. HAL_RX_MPDU_START_INFO1_PEERID bitmask
> 5. HAL_INVALID_PEERID
> 6. hal_rx_ppdu_end_user_stats bitmask
>
> Currently, there is no issue since the monitor status Rx path is not
> enabled. However, in the future, the monitor status Rx path will be
> enabled. Therefore, update the above TLV structures and bitmask to align
> with the ath12k 802.11be hardware.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

