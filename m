Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB96C48BC4
	for <ath12k@archiver.kernel.org>; Wed, 14 Feb 2024 08:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/7ea6UP2OzTQrZH35UkG4ZHVTy7nXw7YU5wfworoz8=; b=cXosoA332QokJkygSRNttAWvit
	ez+YuNHwbUjbCoCASDcZZjjFsS0g6AkUHFKd6G/8e93KbuPzBmB3oVgFAq9voCqKw2Lp6CJ/Gzayx
	h6VykHmlRJ86co49bsQoxZqMpX4OjhJ3nADJfi3qIoVmBj/zALGmhyTTPRbO/np4XDikRz18Wbghz
	zYGj8cslL82X4AA/fx8tZFcntbeI/E/NuTwN4UywbMaMPciorYlcCMmQHdNV3dre0pg83dQ+wHmXD
	BmUgPEpTzdjLUQwOssV+YdTaf5s6wFbiKfS/k4LzZA6+fX54PvqFk530QE8qGRyRgBnvagCr06hot
	7lF1hWhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raASG-0000000C7xo-0c8s
	for ath12k@archiver.kernel.org;
	Wed, 14 Feb 2024 08:17:20 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raASC-0000000C7xS-2qsQ
	for ath12k@lists.infradead.org;
	Wed, 14 Feb 2024 08:17:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0D7F1CE1CAB;
	Wed, 14 Feb 2024 08:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A56C433C7;
	Wed, 14 Feb 2024 08:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707898634;
	bh=BCtWazdp6icgtK7NoWSSj5u5eKBWafsHPj4odfX5HHw=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=NaZGd/1WalptFAhwAsuV70DrkkPA21efnGoOPQPm7DGMkMcR10jeyBwR6hMNO+8+8
	 wSFnHfoF18LHjhkqYG4FVipomOgX537uiRKDFSdVsY9M7Zqj0Exy5xTXz+RTls1sS8
	 U/cYTGiWFToY72isB8GlGrGs2lCrBet9UhshvrlFl0HE9WaXusLSiurTi1/XrrivDd
	 ZNMQTIr64OBRZemkCA4vZwJKVkeM4igqzf5W/xdUwxLrNtcNOFO7Qkbthnmt+Nl3mL
	 uP+WJBPMkcp+oisyxPdyEhBbUfcGaTBgiX1+xgtV2nDE7eZSMAzNY96rBNadgn7Gub
	 0i3FUpdjte3Kw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] wifi: ath12k: Do not use scan_flags from struct
 ath12k_wmi_scan_req_arg
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240211145548.1939610-2-nico.escande@gmail.com>
References: <20240211145548.1939610-2-nico.escande@gmail.com>
To: Nicolas Escande <nico.escande@gmail.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170789863172.3088943.4868050703546189476.kvalo@kernel.org>
Date: Wed, 14 Feb 2024 08:17:13 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_001716_935453_485E9393 
X-CRM114-Status: UNSURE (   5.85  )
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

Nicolas Escande <nico.escande@gmail.com> wrote:

> As discussed in [1] to fix the mismatch between the WMI_SCAN_XXX macros &
> their corresponding scan_f_xxx bitfield equivalent, lets stop using the
> scan_flags in the union altogether.
> 
> [1] https://lore.kernel.org/all/4be7d62e-cb59-462d-aac2-94e27efc22ff@quicinc.com/
> 
> Tested-on: QCN9274 hw2.0 PCI CI_WLAN.WBE.1.3-02907.1-QCAHKSWPL_SILICONZ-10
> 
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

bcdb44f30be9 wifi: ath12k: Do not use scan_flags from struct ath12k_wmi_scan_req_arg
80fd22d7d41a wifi: ath12k: Remove unused scan_flags from struct ath12k_wmi_scan_req_arg

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240211145548.1939610-2-nico.escande@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


