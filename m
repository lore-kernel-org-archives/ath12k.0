Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442C5E77184
	for <ath12k@archiver.kernel.org>; Thu, 19 Dec 2024 11:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GOHBFzcYOFkHgsiA9lpKHdtAQI9Nq8ucD+JGNU1kfLM=; b=wcZ3t7gQJ9f+bfrrrhNJkWrXHr
	4XMoivKlqcpGh34kTz89nd7M2EuO4iG//ffKh/d7tpxyi6nr5oGrVIftIXRbbCsPjfOXNPqFglN+F
	Tu4iaA8rjRrz0P1sgHUBGdy1go2X4NhJEZS/NNmtS8SXMDIAgNCAOjOxpBegS4sgXnQfU4NZ6zfH4
	Al8VmMwbDayAbYkFNOY+mfQT8+xQL1suGFoXe/FWMwsryzhgA/gOjuTxLkolkMMNORachgQ3ykLCy
	N+9frRtFoPKvq0QuFTn0CbBTLm9WHStmJxbKYOEIR5D9WnepRp8avS1g3n5XcLJSzLxb9O6R/THrM
	4/6pqHfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEu5-00000001gzx-06Cz
	for ath12k@archiver.kernel.org;
	Thu, 19 Dec 2024 11:41:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEu2-00000001gzW-11Rx
	for ath12k@lists.infradead.org;
	Thu, 19 Dec 2024 11:41:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BB51CA42167;
	Thu, 19 Dec 2024 11:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05CEAC4CED0;
	Thu, 19 Dec 2024 11:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734608473;
	bh=D9IK9iJGvuIGe8Pgo91CSh72XhyjWrz511rNj93r3O8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=o4loX0/otCQKPU9R4sB8fQZ3SZIDcKk+Xv5alICsFr8JO3ushrZnvGoKo8NRkMe8Y
	 KQQj8/xxZSFvVZJZyjrkFllmLIxCn4JQasKYvnBhHh2aqMnA7Aeym28JsYnOLc1Zd3
	 hnxLuHAMN3e9eqz4JCtIfG3wSpuO7++OQNi+TFrKUnnHQOj8IOmOdUI7+iA6MYT6vF
	 tMbCF8g6zKE2tj1Jtt7X88u7RzywZIjxpGbVRIqkS7Af9N7jetkfoSFSVZ+nmD0Vsc
	 phGb5gEPyeAUCpJQbN24di0kDETiEyhZawvQ4/hEFXdnXAe1DFZ+OxI+Wj+LsyuigC
	 82kP9km2hEpyA==
From: Kalle Valo <kvalo@kernel.org>
To: Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Dinesh
 Karthikeyan <quic_dinek@quicinc.com>
Subject: Re: [PATCH 1/6] wifi: ath12k: Support Sounding Stats
References: <20241217095216.1543923-1-quic_rdevanat@quicinc.com>
	<20241217095216.1543923-2-quic_rdevanat@quicinc.com>
Date: Thu, 19 Dec 2024 13:41:10 +0200
In-Reply-To: <20241217095216.1543923-2-quic_rdevanat@quicinc.com> (Roopni
	Devanathan's message of "Tue, 17 Dec 2024 15:22:11 +0530")
Message-ID: <87frmjj3xl.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_034114_349622_6161660F 
X-CRM114-Status: UNSURE (   6.26  )
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

Roopni Devanathan <quic_rdevanat@quicinc.com> writes:

> From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
>
> Add support to request sounding stats from firmware through HTT stats
> type 22. These stats give sounding information of different Wi-Fi
> standards, channel vector upload status and correlation details.
>
> Sample output:
> -------------
> echo 22 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_TX_AC_SOUNDING_STATS_TLV:
> ac_cbf_20 = IBF: 0, SU_SIFS: 0, SU_RBO: 0, MU_SIFS: 0, MU_RBO: 0
> ac_cbf_40 = IBF: 0, SU_SIFS: 0, SU_RBO: 0, MU_SIFS: 0, MU_RBO: 0
> .....
> Sounding User_0 = 20MHz: 0, 40MHz: 0, 80MHz: 0, 160MHz: 0
> Sounding User_1 = 20MHz: 0, 40MHz: 0, 80MHz: 0, 160MHz: 0
> .....
>
> HTT_TX_AX_SOUNDING_STATS_TLV:
> ax_cbf_20 = IBF: 0, SU_SIFS: 0, SU_RBO: 0, MU_SIFS: 0, MU_RBO: 0
> ax_cbf_40 = IBF: 0, SU_SIFS: 0, SU_RBO: 0, MU_SIFS: 0, MU_RBO: 0
> .....
> Sounding User_0 = 20MHz: 0, 40MHz: 0, 80MHz: 0, 160MHz: 0
> Sounding User_1 = 20MHz: 0, 40MHz: 0, 80MHz: 0, 160MHz: 0
> .....
>
> HTT_TX_BE_SOUNDING_STATS_TLV:
> be_cbf_20 = IBF: 0, SU_SIFS: 0, SU_RBO: 0, MU_SIFS: 0, MU_RBO: 0
> be_cbf_40 = IBF: 0, SU_SIFS: 0, SU_RBO: 0, MU_SIFS: 0, MU_RBO: 0
> .....
> Sounding User_0 = 20MHz: 0, 40MHz: 0, 80MHz: 0, 160MHz: 0, 320MHz: 0
> Sounding User_1 = 20MHz: 0, 40MHz: 0, 80MHz: 0, 160MHz: 0, 320MHz: 0
> .....
>
> CV UPLOAD HANDLER STATS:
> cv_nc_mismatch_err = 0
> cv_fcs_err = 0
> cv_frag_idx_mismatch = 0
> cv_invalid_peer_id = 0
> .....
>
> CV QUERY STATS:
> cv_total_query = 0
> cv_total_pattern_query = 0
> cv_total_bw_query = 0
> cv_invalid_bw_coding = 0
> .....
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>
> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

