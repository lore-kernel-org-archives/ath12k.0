Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DFDC31D97
	for <ath12k@archiver.kernel.org>; Wed,  3 Jul 2024 13:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIIt7UxsMutUGFGlmTLTXp4QmO6Uexc1k0fzGyd2Sz4=; b=TqoLuGU2jaDp1mPapNE2n90X6m
	VSdpVmzcVZlc68ZW/MkC0EqyfVcgW7D+USeMQtY72aN568++KXd92Dth2lq++fEEbAotoJvAL3YOk
	Oti6zD1UBziRGtFs4mWof13n9SpIFne/Av7adXHkTdmM6dGi0HI/28/XQp3VB24xr0f5HMGGkL4mz
	csvvl1iZYNyy1Iqk+XG+0/MYShWagL5M49ScbRRdKhK7VjMl39nowmmDfuQtOT9DqqWNyefrpSMPx
	n/CxWnsiIa52Im1yjql8GwFjtkakVRBdYKVE1zmVuu4qV1cyoGNQodKpGCOmIz+/q0Pn7Y7sCqTNu
	2qqfgZFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP0Ud-0000000ANgz-3MBh
	for ath12k@archiver.kernel.org;
	Wed, 03 Jul 2024 13:57:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP0UQ-0000000ANe3-42EI;
	Wed, 03 Jul 2024 13:57:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DA6C361E00;
	Wed,  3 Jul 2024 13:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D36ABC2BD10;
	Wed,  3 Jul 2024 13:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720015061;
	bh=0ghaEkln6muWfC3OI81no2MWCwPisboChG+ZgTv+5GY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=RuauIKrGtL3QwP+hft0nomDS/ic+9Y4AFfMW0vgfjnVF3DGiY1QpQfEJs+Gl8r1C3
	 8Q3IL4RlW1QS6021izmkr08dRqXBWKH0w36slu4onjSLV/TvgbQdZgZN2162wEtB3x
	 xNLVIOxxXg13s1qo2YDsQMey3jqbTWliRsCS5qnywUo2B2/PgguJYVxHVg2ynkcb7W
	 InDnXORbQzku7sJ1isWn3eYL4Olksqv0MpfSPe3PSRUzoffn+8ObBF52WeAbqjLpn0
	 7NO6AYN4ymnrZvGWfcTUclpQibamNDNs7io1MGERJ/BvVXWSl6rrjuryQ0k8v0g8dJ
	 X353rxOyqAmog==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: pull-request: ath-next-20240702
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <812acd8a-fc26-4611-8a7a-c3a1d6197d00@quicinc.com>
References: <812acd8a-fc26-4611-8a7a-c3a1d6197d00@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <linux-wireless@vger.kernel.org>, <ath10k@lists.infradead.org>,
 <ath11k@lists.infradead.org>, <ath12k@lists.infradead.org>,
 <quic_jjohnson@quicinc.com>, <quic_kvalo@quicinc.com>, Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172001505815.3343449.10854537825180902753.kvalo@kernel.org>
Date: Wed,  3 Jul 2024 13:57:39 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_065743_144383_D67673B1 
X-CRM114-Status: GOOD (  16.09  )
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

> The following changes since commit bb678f01804ccaa861b012b2b9426d69673d8a84:
> 
>   Merge branch 'intel-wired-lan-driver-updates-2024-06-03' (2024-06-10 19:52:50 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20240702
> 
> for you to fetch changes up to 5344fc76f8944249026884157f846f88489edfc0:
> 
>   wifi: ath12k: Support TQM stats (2024-07-01 21:57:28 +0300)
> 
> ----------------------------------------------------------------
> ath.git patches for v6.11
> 
> We have moved to a new group-managed repo, and this is the first pull
> request from that repo, and from me. Fingers crossed...
> 
> We have some new features in ath12k along with some cleanups in ath11k
> and ath12k. Also notable are some device-tree changes to allow certain
> ath11k and ath12k devices to work with a new power sequencing
> subsystem.
> 
> Major changes:
> 
> ath12k
> 
> * DebugFS support for datapath statistics
> * WCN7850: support for WoW (Wake on WLAN)
> * WCN7850: device-tree bindings
> 
> ath11k
> 
> * QCA6390: device-tree bindings
> 
> ----------------------------------------------------------------
> Aaradhana Sahu (3):
>       wifi: ath12k: Fix WARN_ON during firmware crash in split-phy
>       wifi: ath12k: fix NULL pointer access in ath12k_mac_op_get_survey()
>       wifi: ath12k: fix uninitialize symbol error on ath12k_peer_assoc_h_he()
> 
> Aditya Kumar Singh (3):
>       wifi: ath12k: fix per pdev debugfs registration
>       wifi: ath12k: unregister per pdev debugfs
>       wifi: ath12k: handle symlink cleanup for per pdev debugfs dentry
> 
> Ajith C (1):
>       wifi: ath12k: fix firmware crash due to invalid peer nss
> 
> Baochen Qiang (11):
>       wifi: ath12k: fix ACPI warning when resume
>       wifi: ath11k: fix RCU documentation in ath11k_mac_op_ipv6_changed()
>       wifi: ath11k: fix wrong handling of CCMP256 and GCMP ciphers
>       wifi: ath12k: add ATH12K_DBG_WOW log level
>       wifi: ath12k: implement WoW enable and wakeup commands
>       wifi: ath12k: add basic WoW functionalities
>       wifi: ath12k: add WoW net-detect functionality
>       wifi: ath12k: implement hardware data filter
>       wifi: ath12k: support ARP and NS offload
>       wifi: ath12k: support GTK rekey offload
>       wifi: ath12k: handle keepalive during WoWLAN suspend and resume
> 
> Bartosz Golaszewski (2):
>       dt-bindings: net: wireless: qcom,ath11k: describe the ath11k on QCA6390
>       dt-bindings: net: wireless: describe the ath12k PCI module
> 
> Dinesh Karthikeyan (6):
>       wifi: ath12k: Add support to enable debugfs_htt_stats
>       wifi: ath12k: Add htt_stats_dump file ops support
>       wifi: ath12k: Add support to parse requested stats_type
>       wifi: ath12k: Support Transmit Scheduler stats
>       wifi: ath12k: Support pdev error stats
>       wifi: ath12k: Support TQM stats
> 
> Harshitha Prem (1):
>       wifi: ath12k: Remove unused ath12k_base from ath12k_hw
> 
> Karthikeyan Periyasamy (3):
>       wifi: ath12k: avoid unnecessary MSDU drop in the Rx error process
>       wifi: ath12k: fix mbssid max interface advertisement
>       wifi: ath12k: fix peer metadata parsing
> 
> Lingbo Kong (3):
>       wifi: ath11k: fix ack signal strength calculation
>       wifi: ath11k: modify the calculation of the average signal strength in station mode
>       wifi: ath12k: Fix pdev id sent to firmware for single phy devices
> 
> Pradeep Kumar Chitrapu (1):
>       wifi: ath12k: fix legacy peer association due to missing HT or 6 GHz capabilities
> 
> Rameshkumar Sundaram (2):
>       wifi: ath12k: modify remain on channel for single wiphy
>       wifi: ath12k: fix driver initialization for WoW unsupported devices
> 
> Ramya Gnanasekar (1):
>       wifi: ath12k: Dump additional Tx PDEV HTT stats
> 
> Wolfram Sang (1):
>       wifi: ath11k: use 'time_left' variable with wait_event_timeout()
> 
>  .../bindings/net/wireless/qcom,ath11k-pci.yaml     |   46 +
>  .../bindings/net/wireless/qcom,ath12k.yaml         |   99 ++
>  drivers/net/wireless/ath/ath11k/dp_rx.c            |    3 +-
>  drivers/net/wireless/ath/ath11k/dp_rx.h            |    3 +
>  drivers/net/wireless/ath/ath11k/dp_tx.c            |   16 +-
>  drivers/net/wireless/ath/ath11k/dp_tx.h            |    4 +-
>  drivers/net/wireless/ath/ath11k/hal_tx.h           |    4 +-
>  drivers/net/wireless/ath/ath11k/mac.c              |   29 +-
>  drivers/net/wireless/ath/ath11k/qmi.c              |   20 +-
>  drivers/net/wireless/ath/ath12k/Makefile           |    3 +-
>  drivers/net/wireless/ath/ath12k/acpi.c             |    2 +
>  drivers/net/wireless/ath/ath12k/core.c             |   71 +-
>  drivers/net/wireless/ath/ath12k/core.h             |   34 +-
>  drivers/net/wireless/ath/ath12k/debug.h            |    3 +-
>  drivers/net/wireless/ath/ath12k/debugfs.c          |   19 +-
>  drivers/net/wireless/ath/ath12k/debugfs.h          |    6 +-
>  .../net/wireless/ath/ath12k/debugfs_htt_stats.c    | 1540 ++++++++++++++++++++
>  .../net/wireless/ath/ath12k/debugfs_htt_stats.h    |  567 +++++++
>  drivers/net/wireless/ath/ath12k/dp.h               |    1 +
>  drivers/net/wireless/ath/ath12k/dp_rx.c            |   54 +-
>  drivers/net/wireless/ath/ath12k/dp_rx.h            |    4 +
>  drivers/net/wireless/ath/ath12k/dp_tx.c            |    4 +-
>  drivers/net/wireless/ath/ath12k/hal_desc.h         |   26 +-
>  drivers/net/wireless/ath/ath12k/htc.c              |    6 +
>  drivers/net/wireless/ath/ath12k/hw.h               |    2 -
>  drivers/net/wireless/ath/ath12k/mac.c              |  302 +++-
>  drivers/net/wireless/ath/ath12k/mac.h              |    5 +
>  drivers/net/wireless/ath/ath12k/wmi.c              |  728 ++++++++-
>  drivers/net/wireless/ath/ath12k/wmi.h              |  586 +++++++-
>  drivers/net/wireless/ath/ath12k/wow.c              | 1026 +++++++++++++
>  drivers/net/wireless/ath/ath12k/wow.h              |   62 +
>  31 files changed, 5156 insertions(+), 119 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
>  create mode 100644 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
>  create mode 100644 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
>  create mode 100644 drivers/net/wireless/ath/ath12k/wow.c
>  create mode 100644 drivers/net/wireless/ath/ath12k/wow.h

Pulled, thanks.

c1cacb01f355 Merge tag 'ath-next-20240702' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/812acd8a-fc26-4611-8a7a-c3a1d6197d00@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


