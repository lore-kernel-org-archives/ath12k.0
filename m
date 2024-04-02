Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D89AC6FD1F
	for <ath12k@archiver.kernel.org>; Tue,  2 Apr 2024 11:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iA2+DGz+Ez8zuVmkgGOecQx7LD3u64Urs6Pqa2m/2Fc=; b=JjxLwck+CmNmBXE76qRyUsKQMm
	44XRJCVw32vGTFGe5cDLfQqGDIemrrKvnoTWwFk6NNJebaMkLqbc8dyWl9zTzIXMyj0F/txxVyMJz
	xHRrTZmNcgvmJ7Dhqhl0wvWsC9agP9daFYXoSs2/6u03S4SIJD+vZn+JoZhb/IHGM83YM8LhK7eYz
	M+Ho3vBqxuya5LfNrSg7mKb0FPOVYbxAlSuEA49NuT5eS3egov9jh9RA+6TU4HHVUJ8A9BjRLjhDY
	FuefUyGEqnB3hJz8Fn/sg7weYcOojWwdq0900MqAADQdrgR0tkvavYYYjQg6lpnIkoF4KM6P90qXS
	om8I5m1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrcai-0000000AvRT-3B08
	for ath12k@archiver.kernel.org;
	Tue, 02 Apr 2024 11:46:12 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrcaf-0000000AvR5-0w2N
	for ath12k@lists.infradead.org;
	Tue, 02 Apr 2024 11:46:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 146EECE1B21;
	Tue,  2 Apr 2024 11:46:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EAF0C433F1;
	Tue,  2 Apr 2024 11:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712058366;
	bh=ZuTKkEoH1PBM0P+GfAAbMX6nlQ4qj3EKg3MZpaePW7k=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=CkuyX4dq2xAN5XWVkmILrJe5t3MLyOwtfoHZy2ZfGu+0j+ea8Huvkl5S4QDuw4/aK
	 sZtHyLhZjYlz/s7h4+kTLHyDNIPNtMethZ/1GYJZxlFiLkG1GdzOQ01d0cK6zv3mJ3
	 lekPwcwfOY9sPF5xgDCW0pdpCK89KxWiBxMQyI53xE2pUeenxCAgZ/Micrm9Ksi3fa
	 D9DSfWZZuhy3Syme86UgI7VO92JzoHLismPH0DzrjkJQ30XeBSKceNYNvd51zidSBw
	 5tjXBodYJa8Yq5IAS+y8HujF7Ax6qaWCgLumbEC4ToKAPhQxUXqYmxO1e6cak2aqX8
	 EoUyKfArJ2UZg==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  P
 Praneesh <quic_ppranees@quicinc.com>
Subject: Re: [PATCH 1/2] wifi: ath12k: fix BSS chan info request WMI command
References: <20240331183232.2158756-1-quic_kathirve@quicinc.com>
	<20240331183232.2158756-2-quic_kathirve@quicinc.com>
Date: Tue, 02 Apr 2024 14:46:03 +0300
In-Reply-To: <20240331183232.2158756-2-quic_kathirve@quicinc.com> (Karthikeyan
	Kathirvel's message of "Mon, 1 Apr 2024 00:02:31 +0530")
Message-ID: <871q7o6l8k.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_044609_562957_C7D40F2C 
X-CRM114-Status: UNSURE (   9.54  )
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

Karthikeyan Kathirvel <quic_kathirve@quicinc.com> writes:

> From: P Praneesh <quic_ppranees@quicinc.com>
>
> Currently, the firmware returns incorrect pdev_id information in
> WMI_PDEV_BSS_CHAN_INFO_EVENTID, leading to incorrect filling of
> the pdev's survey information.
>
> To prevent this issue, when requesting BSS channel information
> through WMI_PDEV_BSS_CHAN_INFO_REQUEST_CMDID, firmware expects
> pdev_id as one of the arguments in this WMI command.
>
> Add pdev_id to the struct wmi_pdev_bss_chan_info_req_cmd and fill it
> during ath12k_wmi_pdev_bss_chan_info_request(). This resolves the
> issue of sending the correct pdev_id in WMI_PDEV_BSS_CHAN_INFO_EVENTID.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>
> Fixes: d889913205 ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>

What about backwards compatibility with older firmware? And what about
WCN7850?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

