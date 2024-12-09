Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D018E77180
	for <ath12k@archiver.kernel.org>; Mon,  9 Dec 2024 16:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cqe63yc5xMHZNxkyy44oKSu0NiQwLPXvmI/sCAdZVs4=; b=OM/3i0A3QpG9lYtSjuYfOWTl1C
	Eggz6xWgi156a/AQt3cIv5uJdZMIo5W+WLKxu5ukGHURf6IhpVyP/cWwWqAY4f9mv32RalXxE/5r1
	X4mnTiHxKqO8/06jN/qGZxEJKmBrb9cb9CcN/FvXGNvttYEZDjjhZN0v6T/tNc0dAt/FDaToqu9zn
	FZTIGd2i35+5TfdUHUMVQ/vmchrDbCTD6tFZcZ0WiaDbfsjADGEKarB9o5FfSuDqsgEMObV6l8xDj
	0ShAxk7MElptt+M9LdbTiFBMTh2bFJmyQKjsFcF52iU6hQvtj0cUAA+8qP3Y29hDacRCeSRLI/dZM
	7+XF2+7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKh6V-00000008dMX-0Zi5
	for ath12k@archiver.kernel.org;
	Mon, 09 Dec 2024 16:59:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKh6R-00000008dL0-3Fkw
	for ath12k@lists.infradead.org;
	Mon, 09 Dec 2024 16:59:25 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9FL17L019597
	for <ath12k@lists.infradead.org>; Mon, 9 Dec 2024 16:59:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Cqe63yc5xMHZNxkyy44oKS
	u0NiQwLPXvmI/sCAdZVs4=; b=KnZDB9DmYlvUmWzXYdoGodEbX4bfnwZsP2SFG2
	jTYaAGOrO5PoChf0XgDWuIqyJPvyottdzc0Cyjl+CgDMTcl1J8vC/qO22wATaFqV
	RN2P8jir0x7vTLe/G3Z4QJBPIVODhTC4k29Dse/U1i2eeY76BFRJkix2v5hUC5je
	GC0nqQQ18FGrO3uMDvSLftSowubRI9OFHR1YoMWIny318hmxELAY1+EHzHubxqT6
	z9c6hxOe5nfan/00P6UHbbeg+UR7ZRHYKkXgvpX+5+pgkffFT8mXXkFJQcNPCvoe
	tWKSpvqgpU0vV89UbS3v2jTkVRk/I+kVHCiX74/7gQ4lkqXw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43e3418ajq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 09 Dec 2024 16:59:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ef9864e006so2518665a91.2
        for <ath12k@lists.infradead.org>; Mon, 09 Dec 2024 08:59:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733763562; x=1734368362;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cqe63yc5xMHZNxkyy44oKSu0NiQwLPXvmI/sCAdZVs4=;
        b=OX8j778KHJ17fHwPP2JOY8WQi5rm3/zM5PP9fvKai0lzqpvd7L1RHrX+FKrh6ZiDMc
         N5816qQLUPsBGp5lH+AhM04uf+BF46o2MlMQCyFf8O8+b/zYr9+PVuY87qX1/zWFB7gA
         27Ri45WMFJSfN9P9BqDbYVnav7HIRqulqnafmsv0cBslVwEe8PiDBKD+SKQUUA0ztNNL
         LgdNVEFAbo7HzsYRPNCj0ggR1lNbA2+jUyCB5ynToArRSpXk72ayIFhYVZLLZn2CgDHj
         TqWqbP2GeT2EGJEcOHUm0uTUu7EaKk267pKCN8YtaMxBO2Y3KypB089Yp0nAt21EHOjQ
         ImHA==
X-Forwarded-Encrypted: i=1; AJvYcCWpc3oMgTQTWaePdsIInbSzKlXcQZcf/VL/9ZniAWfrfH130bWd0QZr8x/4pCGn9KL3Vhg1KTM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwDdf1Epq6WhSd+EUpK1wDDiBWNcpIy9E5U+MXo5bPkisoymlrI
	JHSPQ2UdLnm4Z4xoC2lEJfjozd5YMC6awyQZeZV0UEUIGy74eODUS9bBvIXK0aUAcOU1Oj5ThMg
	kk7iCJJNJG80TlEhu5b7KglP9LJxkRPpOrm0sacaH1YGINEqQI9Z5Z7ya6Rj5
X-Gm-Gg: ASbGncssRciAq0iP1c6EFkyAMz+jpEpLKHRQ2W0ZB2MOKS4mzrsVCGmnrKldU/ESz4x
	uBq9NFGa4OrcZrYL8gT6VDP4DzZat/5wjiCnIu/KV7p7cNFCp+5pnEJJf2bXZgOuB11UK9BgBfz
	M53RH98iBnh+AsXuo5eVUhGIJigQ8qcY4/IAP6hzFRVG1UNUh2J2TnqVi+5QCqkoxsB9nr6yD5U
	UHlMXf0sAr+bxnl4IhsPisSsU3ab+PPTIutv446eVPP6K3jzxTtGetAUjXbAU5qHwMsHDSEbl1V
	fIgfRjt27N8=
X-Received: by 2002:a17:90b:4a:b0:2ee:f80c:6892 with SMTP id 98e67ed59e1d1-2efcf136579mr1784492a91.3.1733763561645;
        Mon, 09 Dec 2024 08:59:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZTS9C4BJCt9kyZwlO+HpR3HB57Lvf55z4w/IcHcKXNKbG36kHwnh/zlS856HJiwhcX+J1gQ==
X-Received: by 2002:a17:90b:4a:b0:2ee:f80c:6892 with SMTP id 98e67ed59e1d1-2efcf136579mr1784451a91.3.1733763561217;
        Mon, 09 Dec 2024 08:59:21 -0800 (PST)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef2701def5sm10113787a91.31.2024.12.09.08.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 08:59:20 -0800 (PST)
Message-ID: <1bcdaf98-6078-4f79-a989-2e5db9400585@oss.qualcomm.com>
Date: Mon, 9 Dec 2024 08:59:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org, kvalo@kernel.org
Subject: pull-request: ath-next-20241209
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JghvYKMYFuKfuRA6nZMqh8rZmh98UEK-
X-Proofpoint-ORIG-GUID: JghvYKMYFuKfuRA6nZMqh8rZmh98UEK-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_085923_826097_86E1F0D8 
X-CRM114-Status: GOOD (  14.05  )
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

The following changes since commit 2b94751626a6d49bbe42a19cc1503bd391016bd5:

  wifi: cw1200: Fix potential NULL dereference (2024-10-31 16:20:02 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20241209

for you to fetch changes up to da8656797ae10b524a7a0c3d5eeb6237fa3ddd70:

  wifi: ath12k: introduce mlo_capable flag for device group (2024-12-05 14:34:10 -0800)

----------------------------------------------------------------
ath.git patches for v6.14

This development cycle featured multiple patchsets to ath12k to
support the new 802.11be MLO feature, although the feature is still
incomplete. Also in ath12k, there were other feature patches.  In
ath11k, support was added for QCA6698AQ. And there was the usual set
of bug fixes and cleanups across most drivers, notable being the
addition of "noinline_for_stack" to some functions to avoid "stack
frame size" warnings when compiling with clang.

----------------------------------------------------------------
Aditya Kumar Singh (2):
      wifi: ath12k: ath12k_bss_assoc(): MLO support
      wifi: ath12k: rename mlo_capable_flags to single_chip_mlo_supp

Balaji Pothunoori (2):
      wifi: ath11k: Suspend hardware before firmware mode off for WCN6750
      wifi: ath11k: Fix unexpected return buffer manager error for WCN6750/WCN6855

Barnabás Czémán (1):
      wifi: wcn36xx: fix channel survey memory allocation size

Dinesh Karthikeyan (4):
      wifi: ath12k: Support Downlink Pager Stats
      wifi: ath12k: Support phy counter and TPC stats
      wifi: ath12k: Support SoC Common Stats
      wifi: ath12k: Support Transmit PER Rate Stats

Dmitry Antipov (5):
      wifi: ath9k: miscellaneous spelling fixes
      wifi: ath11k: cleanup struct ath11k_vif
      wifi: ath11k: cleanup struct ath11k_reg_tpc_power_info
      wifi: ath11k: cleanup struct ath11k_mon_data
      wifi: ath11k: miscellaneous spelling fixes

Jeff Johnson (4):
      wifi: ath12k: mark QMI driver event helpers as noinline
      wifi: ath11k: mark some QMI driver event helpers as noinline
      wifi: ath11k: mark ath11k_dp_rx_mon_mpdu_pop() as noinline
      wifi: ath11k: mark ath11k_wow_convert_8023_to_80211() as noinline

Kalle Valo (5):
      wifi: ath12k: ath12k_mac_vdev_create(): use goto for error handling
      wifi: ath12k: introduce ath12k_hw_warn()
      wifi: ath12k: convert struct ath12k::wmi_mgmt_tx_work to struct wiphy_work
      wifi: ath12k: ath12k_mac_op_set_key(): fix uninitialized symbol 'ret'
      wifi: ath12k: ath12k_mac_op_sta_rc_update(): use mac80211 provided link id

Karol Przybylski (1):
      wifi: ath12k: Fix for out-of bound access error

Karthikeyan Periyasamy (10):
      wifi: ath12k: Refactor core startup
      wifi: ath12k: add ath12k_ab_to_ah() and ath12k_ab_set_ah()
      wifi: ath12k: add ath12k_get_num_hw()
      wifi: ath12k: introduce QMI firmware ready flag
      wifi: ath12k: move ATH12K_FLAG_REGISTERED handling to ath12k_mac_register()
      wifi: ath12k: introduce device group abstraction
      wifi: ath12k: refactor core start based on hardware group
      wifi: ath12k: move struct ath12k_hw from per device to group
      wifi: ath12k: send QMI host capability after device group is ready
      wifi: ath12k: introduce mlo_capable flag for device group

Miaoqing Pan (1):
      wifi: ath11k: add support for QCA6698AQ

P Praneesh (1):
      wifi: ath12k: Fix endianness issue in struct hal_tlv_64_hdr

Rameshkumar Sundaram (4):
      wifi: ath12k: add reo queue lookup table for ML peers
      wifi: ath12k: modify chanctx iterators for MLO
      wifi: ath12k: ath12k_mac_station_add(): fix potential rx_stats leak
      wifi: ath12k: defer vdev creation for MLO

Roopni Devanathan (1):
      wifi: ath12k: Fix inappropriate use of print_array_to_buf_index()

Sidhanta Sahu (1):
      wifi: ath12k: Support MBSSID Control Frame Stats

Sriram R (16):
      wifi: ath12k: MLO vdev bringup changes
      wifi: ath12k: Refactor sta state machine
      wifi: ath12k: Add helpers for multi link peer creation and deletion
      wifi: ath12k: add multi-link flag in peer create command
      wifi: ath12k: add helper to find multi-link station
      wifi: ath12k: Add MLO peer assoc command support
      wifi: ath12k: Add MLO station state change handling
      wifi: ath12k: support change_sta_links() mac80211 op
      wifi: ath12k: add primary link for data path operations
      wifi: ath12k: use arsta instead of sta
      wifi: ath12k: Use mac80211 vif's link_conf instead of bss_conf
      wifi: ath12k: Use mac80211 sta's link_sta instead of deflink
      wifi: ath12k: ath12k_mac_op_tx(): MLO support
      wifi: ath12k: ath12k_mac_op_flush(): MLO support
      wifi: ath12k: ath12k_mac_op_ampdu_action(): MLO support
      wifi: ath12k: do not return invalid link id for scan link

Toke Høiland-Jørgensen (1):
      wifi: ath9k: Add RX inactivity detection and reset chip when it occurs

 drivers/net/wireless/ath/ath11k/core.c             |  132 ++
 drivers/net/wireless/ath/ath11k/core.h             |    4 +-
 drivers/net/wireless/ath/ath11k/dp.h               |    1 -
 drivers/net/wireless/ath/ath11k/dp_rx.c            |   14 +-
 drivers/net/wireless/ath/ath11k/hal.h              |    6 +-
 drivers/net/wireless/ath/ath11k/hal_rx.c           |    3 +-
 drivers/net/wireless/ath/ath11k/hw.h               |    1 +
 drivers/net/wireless/ath/ath11k/mac.c              |    6 +-
 drivers/net/wireless/ath/ath11k/mhi.c              |    1 +
 drivers/net/wireless/ath/ath11k/pci.c              |    3 +
 drivers/net/wireless/ath/ath11k/pcic.c             |   13 +-
 drivers/net/wireless/ath/ath11k/qmi.c              |    8 +-
 drivers/net/wireless/ath/ath11k/wow.c              |    6 +-
 drivers/net/wireless/ath/ath12k/core.c             |  482 ++++-
 drivers/net/wireless/ath/ath12k/core.h             |  134 +-
 drivers/net/wireless/ath/ath12k/debug.c            |    6 +-
 drivers/net/wireless/ath/ath12k/debug.h            |    5 +-
 .../net/wireless/ath/ath12k/debugfs_htt_stats.c    |  681 ++++++-
 .../net/wireless/ath/ath12k/debugfs_htt_stats.h    |  218 ++-
 drivers/net/wireless/ath/ath12k/dp.c               |   70 +-
 drivers/net/wireless/ath/ath12k/dp.h               |    3 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c            |   96 +-
 drivers/net/wireless/ath/ath12k/dp_rx.h            |    6 +-
 drivers/net/wireless/ath/ath12k/hal_desc.h         |    2 +-
 drivers/net/wireless/ath/ath12k/hal_rx.c           |   12 +-
 drivers/net/wireless/ath/ath12k/mac.c              | 2003 +++++++++++++++-----
 drivers/net/wireless/ath/ath12k/mac.h              |   16 +-
 drivers/net/wireless/ath/ath12k/pci.c              |   10 +
 drivers/net/wireless/ath/ath12k/peer.c             |  223 ++-
 drivers/net/wireless/ath/ath12k/peer.h             |   23 +-
 drivers/net/wireless/ath/ath12k/qmi.c              |  167 +-
 drivers/net/wireless/ath/ath12k/qmi.h              |   20 +
 drivers/net/wireless/ath/ath12k/wmi.c              |  207 +-
 drivers/net/wireless/ath/ath12k/wmi.h              |  115 ++
 drivers/net/wireless/ath/ath9k/antenna.c           |    2 +-
 drivers/net/wireless/ath/ath9k/ar9002_hw.c         |    2 +-
 drivers/net/wireless/ath/ath9k/ar9003_hw.c         |    2 +-
 drivers/net/wireless/ath/ath9k/ar9003_mci.c        |    4 +-
 drivers/net/wireless/ath/ath9k/ar9003_phy.h        |    2 +-
 drivers/net/wireless/ath/ath9k/ath9k.h             |    2 +
 drivers/net/wireless/ath/ath9k/channel.c           |    2 +-
 drivers/net/wireless/ath/ath9k/common-spectral.c   |    2 +-
 drivers/net/wireless/ath/ath9k/debug.c             |    1 +
 drivers/net/wireless/ath/ath9k/debug.h             |    1 +
 drivers/net/wireless/ath/ath9k/dfs.c               |    2 +-
 drivers/net/wireless/ath/ath9k/hif_usb.c           |    2 +-
 drivers/net/wireless/ath/ath9k/hw.c                |    4 +-
 drivers/net/wireless/ath/ath9k/hw.h                |    2 +-
 drivers/net/wireless/ath/ath9k/link.c              |   33 +-
 drivers/net/wireless/ath/ath9k/mac.h               |    2 +-
 drivers/net/wireless/ath/ath9k/main.c              |    3 +-
 drivers/net/wireless/ath/ath9k/wow.c               |    6 +-
 drivers/net/wireless/ath/ath9k/xmit.c              |    2 +-
 drivers/net/wireless/ath/wcn36xx/main.c            |    5 +-
 54 files changed, 4042 insertions(+), 736 deletions(-)

