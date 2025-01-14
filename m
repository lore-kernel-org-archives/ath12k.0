Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8B1C02183
	for <ath12k@archiver.kernel.org>; Tue, 14 Jan 2025 19:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3NXrMi4wx8PYLPYZXZJngTB9cHctmJ0cx+fCGzuNog=; b=EXBS1pc9+9sS6d8xNwHrpcLueH
	8lOrj2QM+FiW4f5aGPndiGWC4i/Sx3zNlYCHf4bDws9IpffjPnxJqrElam6otZsDM0skCZgT8sZCq
	XeEkvBhYGb9Smd2mNKJo7IWI7Qo0YnIqCGM7vPED4983bqIDeD2Ziztd8MBvkLzSk2aq4JYt1DOFx
	muQbkEImiFq9CcL2Oa71LFavfdp2/vASKVonD1Vx/TioyvaWUa7zlu/bHJ7DjFWgLimOgGKQ6yeex
	aPW0otgMlr1ajmT3QMIux+TBhx4v9vzRX5UoGXEEBWrFZtmLnab/D5My9Rbg/z7NZgIRfGTITqPXt
	0bujBj6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmeK-00000009YAc-01mD
	for ath12k@archiver.kernel.org;
	Tue, 14 Jan 2025 19:32:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlfR-00000009QR5-0HAg
	for ath12k@lists.infradead.org;
	Tue, 14 Jan 2025 18:29:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3AB71A41B45;
	Tue, 14 Jan 2025 18:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0566BC4CEDD;
	Tue, 14 Jan 2025 18:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736879372;
	bh=WOY4AGPayNCfR8xPWYGzZU8DRPDN3/lPA1u+hsfXMts=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=MoME+fxdlvCszFOdrwvDLEHl1npu5FYyrXZHekAPDKF3/3Nje8O1N6ogi7eg/1iCu
	 HqKV2jyFO+UoPHAPWcndIkBuEx7g7tcUE8OKat2u5ZhYd/v9A0LkAvDTaoUlnSp6vO
	 PKqfu5A5tS3sBowFX2WKCgG5aDs+fGmEGcNywd+bZbAn3nHJFUc8hY2rc5sMhNvQcN
	 v+mm72kaLudjlw3m91s1+eGTYPSOwDoPCDBvg9oDcJASJEzisKIZcBaoHSCrXW3StY
	 kgefGqaLTKeWXLMpZGaafAw0I6soYcJlqiZz/hKrfOB2CqB+ED716/cde/l3FmVd+V
	 jZj+tIzOK8L4w==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Jeff
 Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/4] wifi: ath12k: Refactor ath12k_hw set helper
 function argument
References: <20250112071630.4059410-1-quic_periyasa@quicinc.com>
	<20250112071630.4059410-2-quic_periyasa@quicinc.com>
Date: Tue, 14 Jan 2025 20:29:29 +0200
In-Reply-To: <20250112071630.4059410-2-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Sun, 12 Jan 2025 12:46:27 +0530")
Message-ID: <87ldvdp7ue.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_102933_160400_C676F6BF 
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

