Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E4DC52D7B
	for <ath12k@archiver.kernel.org>; Tue, 13 Aug 2024 09:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5Wa5WoaE8vEEzbPOiCelU1UFATtAqkRV8PJ2jtek2k=; b=pquSRMUG2zpqdqbJfHOU3FkbRz
	zPDyX4yQrn8/eeY5Ma9Hbd0jmu6tylOequ3y/3/djfHPFZb1JH0JN6OCYy5gnfW+H9ytnPu/r/LHS
	fzPEHEkGw8P6/RDCKAPU2fxF+gaZ4NZxDxJGz8zOLkVJrD1cE2l/v4BlY2WwYKyHQwWz8BYzQ5UOb
	of4eGdnMmDTdti+W+B74ZR1g51JlaYAh2P4osjm8VFqWI2y/1nZp/F2UExmf3ejialbt+Byo149fx
	23Wjxs3eecCG17v7fNql7SYhRryl1Oj7OkTbecWQynMm9b63NuEFNee1KOx+2BXiqAzfI9QhzoWj8
	w45Y32RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdoJ6-00000003Eix-136J
	for ath12k@archiver.kernel.org;
	Tue, 13 Aug 2024 09:59:12 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdoJ1-00000003EfO-0n45;
	Tue, 13 Aug 2024 09:59:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 708C7CE1232;
	Tue, 13 Aug 2024 09:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5FAC4AF09;
	Tue, 13 Aug 2024 09:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723543144;
	bh=pzpoiFfq+2ivyX/04lGLavlOS/9I6phiMjzd/5Zydhc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=X3Ow85ZE7SAClwfDmI6sr+FFRdLqMvqPXPkPBYTU9TFgBAzBEuYgeD7Z2QN4jFk6l
	 GdiVYuaRfh7w5lmZR9UI8kikUrjsO1gnzEQSHW0Ji9hKwgkrIZM6YJECDvGIW3PHbu
	 sxJZuGLjlszvMhf/iLrTLA1QKuIDSHjku67Izbmr2mMXn02XKqwi7TJr/vXtZBNxqI
	 RF2lbsk5O8vABjcXZ5cw8DgGlI7AQgVK2Nk1g7iHeKD+H1Dk2eATEEpLMV5Ck5iHAy
	 as0ah4WraZaH64WW4F0XMJVcwQ1V1pm1lV9BfpXiH/XKucGRCryY7M+62r3i75PtV6
	 pCODkIjxGfnWA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: pull-request: ath-next-20240812
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <9ee38166-782b-409d-a2df-e2cee6e2ae21@quicinc.com>
References: <9ee38166-782b-409d-a2df-e2cee6e2ae21@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 <ath10k@lists.infradead.org>, <ath11k@lists.infradead.org>,
 <ath12k@lists.infradead.org>, <quic_jjohnson@quicinc.com>,
 <quic_kvalo@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172354314111.731215.9038812147638682056.kvalo@kernel.org>
Date: Tue, 13 Aug 2024 09:59:02 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_025907_597630_7D83658B 
X-CRM114-Status: GOOD (  14.74  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> The following changes since commit c1cacb01f35589bd41360cdb7535afc792c08a7c:
> 
>   Merge tag 'ath-next-20240702' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath (2024-07-03 16:57:16 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20240812
> 
> for you to fetch changes up to 89fbe672bd0e5e5c39600fcc7a3bca0b8a212d23:
> 
>   Revert "wifi: ath9k: use devm for request_irq()" (2024-08-10 10:21:58 +0300)
> 
> ----------------------------------------------------------------
> ath.git patches for v6.12
> 
> This is a fairly light pull request since ath12k is still working on
> MLO-related changes, and the other drivers are mostly in maintenance
> mode with a few cleanups and bug fixes.
> 
> Major changes:
> 
> ath12k
> 
> * DebugFS support for transmit DE stats
> * Make ASPM support hardware-dependent
> * Align BSS Channel information command and message with firmware
> 
> ath11k
> 
> * Use work queue for beacon tx events
> 
> ath9k
> 
> * Use devm for gpio_request_one
> * Use unmanaged PCI functions in ath9k_pci_owl_loader()
> 
> ----------------------------------------------------------------
> Aditya Kumar Singh (1):
>       wifi: ath12k: restore ASPM for supported hardwares only
> 
> Baochen Qiang (1):
>       wifi: ath12k: fix invalid AMPDU factor calculation in ath12k_peer_assoc_h_he()
> 
> Dinesh Karthikeyan (1):
>       wifi: ath12k: Support Transmit DE stats
> 
> Dmitry Kandybka (1):
>       wifi: ath9k: fix possible integer overflow in ath9k_get_et_stats()
> 
> Heiner Kallweit (1):
>       wifi: ath9k: use unmanaged PCI functions in ath9k_pci_owl_loader
> 
> Kang Yang (1):
>       wifi: ath11k: use work queue to process beacon tx event
> 
> Karthikeyan Periyasamy (2):
>       wifi: ath12k: fix array out-of-bound access in SoC stats
>       wifi: ath11k: fix array out-of-bound access in SoC stats
> 
> P Praneesh (2):
>       wifi: ath12k: fix BSS chan info request WMI command
>       wifi: ath12k: match WMI BSS chan info structure with firmware definition
> 
> Rosen Penev (2):
>       wifi: ath9k: use devm for request_irq()
>       wifi: ath9k: use devm for gpio_request_one()
> 
> Thorsten Blum (1):
>       wifi: ath9k: Use swap() to improve ath9k_hw_get_nf_hist_mid()
> 
> Toke Høiland-Jørgensen (2):
>       wifi: ath9k: Remove error checks when creating debugfs entries
>       Revert "wifi: ath9k: use devm for request_irq()"
> 
>  drivers/net/wireless/ath/ath11k/core.h             |   1 +
>  drivers/net/wireless/ath/ath11k/dp_rx.c            |   2 +-
>  drivers/net/wireless/ath/ath11k/mac.c              |  12 +
>  drivers/net/wireless/ath/ath11k/wmi.c              |   4 +-
>  .../net/wireless/ath/ath12k/debugfs_htt_stats.c    | 354 +++++++++++++++++++++
>  .../net/wireless/ath/ath12k/debugfs_htt_stats.h    | 126 ++++++++
>  drivers/net/wireless/ath/ath12k/dp_rx.c            |   2 +-
>  drivers/net/wireless/ath/ath12k/hw.c               |   6 +
>  drivers/net/wireless/ath/ath12k/hw.h               |   1 +
>  drivers/net/wireless/ath/ath12k/mac.c              |   5 +-
>  drivers/net/wireless/ath/ath12k/pci.c              |   3 +-
>  drivers/net/wireless/ath/ath12k/wmi.c              |   1 +
>  drivers/net/wireless/ath/ath12k/wmi.h              |   3 +-
>  .../net/wireless/ath/ath9k/ath9k_pci_owl_loader.c  |   8 +-
>  drivers/net/wireless/ath/ath9k/calib.c             |   7 +-
>  drivers/net/wireless/ath/ath9k/debug.c             |   6 +-
>  drivers/net/wireless/ath/ath9k/htc_drv_debug.c     |   2 -
>  drivers/net/wireless/ath/ath9k/hw.c                |   6 +-
>  18 files changed, 521 insertions(+), 28 deletions(-)

Pulled, thanks.

ae98f5c9fd8b Merge tag 'ath-next-20240812' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/9ee38166-782b-409d-a2df-e2cee6e2ae21@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


