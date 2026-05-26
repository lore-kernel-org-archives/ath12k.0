Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF64CD5BB1
	for <ath12k@archiver.kernel.org>; Tue, 26 May 2026 16:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c0i5VAlmRLgG+rEOSURd6Mt9CnnTszTK9KxsVzAEs4I=; b=fNZPMkPYfe4hbCoUXjrhSzkhOG
	nnB2eiaGR57qO54f/448537RPOLc6+i6twPAb4OmIDlFi+IgkxngqyCnwfeSFuomn5LknrSYHejqF
	y6pjo1trUEg7/KHmaREIDGV8h313IQt4g3tRLwOBGntJ3NFzti5YGeQ44wuKBGlKxSmrHijQTWVox
	ifiPU0t36aN1f69UaQ6/zZpO8bbVOG4gPETaLbW3izolrKXruA+L5A4LwiXRkJ3MnRfAxJr8M2ms9
	pgy1n22Ff21i6hQtwbZFtZwP5pX54ahlPybdotOXbFJNy5oZ4lO6tGwo5R3eNXKQ9TObunYKFFr7o
	yFiSOynA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuad-00000002VLO-2Op8;
	Tue, 26 May 2026 16:25:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuaa-00000002VJw-20os
	for ath12k@lists.infradead.org;
	Tue, 26 May 2026 16:25:10 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsCwR2554550
	for <ath12k@lists.infradead.org>; Tue, 26 May 2026 16:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=c0i5VAlmRLgG+rEOSURd6M
	t9CnnTszTK9KxsVzAEs4I=; b=KuUbKLhnTZoKNWh+Kr7qo6zUp/C7vBmqaCcDmh
	0olPi26dIgkEz+OXys6OiZvQ800fjClvoDvj54GSogqhL84g15v7yK9N2CJZj7bD
	Us63pjPNnYW+f8/jS+r7xUYTxU1mGZXQeyStPHHM8aD8eFuwop3suyj6o6bbETYP
	ZB3alEZmm4GN+9FWZd4vgvNG4aCqKRReNtZ0bW0fD1Hv5lRnQGDr6P6FdkqG4hDA
	iE+nbe+kKylKPSarOMSA+se67XlrdMnfKEitiie9zejZZfClfWbWofLnUS8sd08u
	z+YYzt0rDVfk7yGCbqbUgPlUp3qfV26blrrt/kRlN/5J4PPw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3tw9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 26 May 2026 16:25:07 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-135405e4035so910157c88.1
        for <ath12k@lists.infradead.org>; Tue, 26 May 2026 09:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779812706; x=1780417506; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0i5VAlmRLgG+rEOSURd6Mt9CnnTszTK9KxsVzAEs4I=;
        b=LKgwK93Wjner4SoAtXIuXFoOTSx9LW9LtfSfIMu0rDj5pDgTmBQ/UPIBowjB6Oo4Sn
         xBeIpicVzoGN3K2XCPvk2hB+xz+eYl6a8NVj94nahN8GP0a3uW9xEFn8tXueZDuHCvku
         fWhOjcGd+J7s462yNAoeZzsw9HN920vfsZPhhr56Oah7P1Ey184cEWtaNYOC2ATQQmla
         K3BZTcGAvaVI90LpIrfWoolY046Snbay/2CGkbUBmoXSkKmmxmOeS6IjCRsV1KFGP8fx
         f7OvOYNFEm4T+HOE4KR7hzeMATuObzqnhkwuALolv4Wn+k1NuB/dOmLRkmKetbXrmX0f
         eMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779812706; x=1780417506;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c0i5VAlmRLgG+rEOSURd6Mt9CnnTszTK9KxsVzAEs4I=;
        b=N3xXBhgz128Lg8D3tpjG4DbcnZHP0M4lMF3ZJg80Vj3BiFJOlvFziUAMAZI028MLb4
         UXV31ltqgRf7hRjrPigLDMPEH26OSLLnGHj35TI+4vleruncd3uD5k5IWMavXg8nn5RT
         aauoBlIbeIGzGq6wLY7ITSNLw+fBjJN9QoOTky0T2VcpzbTb2HK8ScDSZKoR0gA1qIZN
         I+NFnyRJKZgKlv4LSIVrSLcr5GfF4IqWKq4qnrbrpT30Om7EsEknuqh6OCWNwkW/HnZc
         A0GmEHsf+d2HH/z1t9bLZr9AUa55GNnF5zElktW6vEcG04cIyuvnBtJX3D6XwwaBqrKQ
         dQgA==
X-Forwarded-Encrypted: i=1; AFNElJ/J/iaq67Y0MEyz/NXTXLTyG6N217c82PGssC2Y7EAEOD+EjpPjjS1fBrdhMDU2b94dkVUuVGs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt1azfnc6iaRgRL6Ghn6qWVPRf1PhYLEtdGuXV8d6QctpdfRIl
	Hd5RJ0Yg+80pZvgkEaYNTckgzYP5ou002MQWMLVYNOaBWSzsImIiwSPfKcMbEXxuo0Oq6CZZ474
	sQbm3X2GQ20fHLq52uXhrqkorbS2cw5/7tglVfdRJ6piAkhf2FG42cJSizV06LZum
X-Gm-Gg: Acq92OGRSTZJqi4T1ZlBGawtpPgA6Qui9oB1MWpqHngYSoN/1Dw/TA2ul6UAvzEeCLr
	jlpHqyRHd+cgXv8Xr+82vU3QgJCV0XErdVzooE4RK5qp7CHHOfaDlblZYXkbX4ruYYvGCXWxMU2
	u7GS9BI0d5cHZWqPxEd6boLPddnsQ3O3lPw5LQ438jRRnMpYrLyb1gVBMzvNkBY4VY6Nu+W98cr
	DhXPHwDmji1TjHbYCqxKDO/RfBZ6KoJD41WoVXJlhVky82yx9MA478GhDrRrmW1sATWTbgeKqVd
	Hn5KrNO1veHqIA5ORZDRJp9TRxPbBf6GCtD3ivMj3ZiiSdDDcmmHSFMyyd9G6zc1vRFDWMw15Gn
	AsU+x/JU7r+7i/Gr0XdFWuDKmXQdXfilZLJsK21IKVLTtB+hznQDHz0mtAQ==
X-Received: by 2002:a05:7022:6ba3:b0:11a:3734:3db3 with SMTP id a92af1059eb24-1365fc6d6a9mr7904473c88.32.1779812706430;
        Tue, 26 May 2026 09:25:06 -0700 (PDT)
X-Received: by 2002:a05:7022:6ba3:b0:11a:3734:3db3 with SMTP id a92af1059eb24-1365fc6d6a9mr7904454c88.32.1779812705815;
        Tue, 26 May 2026 09:25:05 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13669c6a2adsm8721944c88.0.2026.05.26.09.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 09:25:05 -0700 (PDT)
Message-ID: <4fe17cef-7cc6-41fc-960a-385366861c52@oss.qualcomm.com>
Date: Tue, 26 May 2026 09:25:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20260526
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0MSBTYWx0ZWRfX0zq9zPkIoRuh
 cPTLfYHV+iSsbwcAB5tunVaZDyZnyoBQR4qO2TiHfn6PlL3DDf6WqqXLu3ClbrGrygb/72Zf2Ly
 JWCJNnEEl1E9why+Sp8o623j9EYpz/JoTyRmrE+G+ZucyKFrWpBHM6iMRPi5leXiUARfuGmg5eO
 +NsKFPqb4cGFyrSncZB8xGsOOtrk2v3bk9E1vjAWdSWwRZTZ0oAIkB0nFMq96eaNl2F/u7PLfKZ
 KjqSoF9a0BeKVclhMg4KOhcvxd65R5/Uke+zo7YJf6toCvd3Lw+fMABjfYRn27zvR1FGoqvfMmR
 iJjGrtsHmZh41ujOj3yh3ULyP4w2J7NB/gh9dpOnXIhLHYP9uSsKXEaU4rulItd6in5W0Jt6Lv7
 Q4Yct94e2wBvtYzSBGzbv4CjXpOOANneiCZRWCB69rg+2vpn3T89Jj9avchn5scQW9gep6TMP5A
 13y0er7UIPbvUMlejuw==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a15c963 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=W5QCRmDefjtvIb0_0ZIA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: Qn9VJkSUAKE3ZQWeRFTp5FZHYsgDCEW3
X-Proofpoint-GUID: Qn9VJkSUAKE3ZQWeRFTp5FZHYsgDCEW3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_092508_661079_F646AD89 
X-CRM114-Status: GOOD (  11.73  )
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

The following changes since commit 7baf5857e15d722776898510a10546d6b2f18645:

  wifi: brcmsmac: phy_lcn: Remove dead code in wlc_lcnphy_radio_2064_channel_tune_4313() (2026-04-28 10:43:27 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260526

for you to fetch changes up to d5c336161088c588f85da64f48ba6deead194afd:

  wifi: ath12k: fix error unwind on arch_init() failure in PCI probe (2026-05-26 08:54:27 -0700)

----------------------------------------------------------------
ath.git patches for v7.2 (PR #2)

For ath12k:
- Add thermal throttling and cooling device support
- Add support for handling incumbent signal interference in 6 GHz
- Add support for channel 177 in the 5 GHz band

In addition, a large number of cleanup and minor bug fixing across
all supported drivers.

----------------------------------------------------------------
Aishwarya R (2):
      wifi: ath12k: Add support for handling incumbent signal interference in 6 GHz
      wifi: ath12k: Add debugfs support to simulate incumbent signal interference

Arnd Bergmann (1):
      wifi: ath10k: drop gpio_led reference

Daniel Lezcano (2):
      wifi: ath: Use the unified QMI service ID instead of defining it locally
      wifi: ath: Fix the license marking

Jose Ignacio Tornos Martinez (1):
      wifi: ath11k: fix warning when unbinding

Kexin Sun (1):
      wifi: ath10k: update outdated comment for renamed ieee80211_tx_status()

Krzysztof Kozlowski (1):
      wifi: ath: Unify user-visible "Qualcomm" name

Maharaja Kennadyrajan (5):
      wifi: ath12k: handle thermal throttle stats WMI event
      wifi: ath12k: configure firmware thermal throttling via WMI
      wifi: ath12k: refactor per-radio thermal hwmon setup and cleanup
      wifi: ath12k: reorder group start/stop for safe thermal sysfs cleanup
      wifi: ath12k: add thermal cooling device support

Nicolas Escande (1):
      wifi: ath12k: unify error handling in some ath12k_wmi_xxx() functions

Ripan Deuri (1):
      wifi: ath12k: fix error unwind on arch_init() failure in PCI probe

Rosen Penev (4):
      wifi: ath9k: use non devm for nvmem_cell_get
      wifi: ath9k: owl: move name into owl_nvmem_probe
      wifi: ath9k: use kmemdup and kcalloc
      wifi: ath12k: use kzalloc_flex

Tamizh Chelvam Raja (1):
      wifi: ath12k: Handle DP_RX_DECAP_TYPE_8023 type in Rx path

Tristan Madani (1):
      wifi: ath9k: fix OOB access from firmware tx status queue ID

Wei Zhang (1):
      wifi: ath11k: cancel SSR work items during PCI shutdown

Yingying Tang (1):
      wifi: ath12k: add channel 177 to the 5 GHz channel list

pengdonglin (1):
      wifi: ath9k: Remove redundant rcu_read_lock/unlock() in spin_lock

 drivers/net/wireless/ath/ath10k/core.h             |   1 -
 drivers/net/wireless/ath/ath10k/htt_tx.c           |   2 +-
 drivers/net/wireless/ath/ath10k/leds.c             |   8 +-
 drivers/net/wireless/ath/ath10k/qmi.c              |   4 +-
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h     |   1 -
 drivers/net/wireless/ath/ath11k/Kconfig            |   2 +-
 drivers/net/wireless/ath/ath11k/dp.c               |   1 +
 drivers/net/wireless/ath/ath11k/mhi.c              |   4 +-
 drivers/net/wireless/ath/ath11k/pci.c              |   8 +
 drivers/net/wireless/ath/ath11k/qmi.c              |   3 +-
 drivers/net/wireless/ath/ath11k/qmi.h              |   1 -
 drivers/net/wireless/ath/ath12k/Kconfig            |   6 +-
 drivers/net/wireless/ath/ath12k/core.c             |  50 +-
 drivers/net/wireless/ath/ath12k/core.h             |  12 +-
 drivers/net/wireless/ath/ath12k/debugfs.c          |  46 ++
 drivers/net/wireless/ath/ath12k/dp_rx.c            |  68 ++-
 drivers/net/wireless/ath/ath12k/mac.c              | 110 +++-
 drivers/net/wireless/ath/ath12k/pci.c              |   2 +-
 drivers/net/wireless/ath/ath12k/qmi.c              |   2 +-
 drivers/net/wireless/ath/ath12k/qmi.h              |   1 -
 drivers/net/wireless/ath/ath12k/thermal.c          | 252 +++++++--
 drivers/net/wireless/ath/ath12k/thermal.h          |  35 ++
 drivers/net/wireless/ath/ath12k/wmi.c              | 565 ++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h              | 125 ++++-
 drivers/net/wireless/ath/ath9k/ar9002_hw.c         |   6 +-
 .../net/wireless/ath/ath9k/ath9k_pci_owl_loader.c  |  31 +-
 drivers/net/wireless/ath/ath9k/common-init.c       |   8 +-
 drivers/net/wireless/ath/ath9k/init.c              |  11 +-
 drivers/net/wireless/ath/ath9k/recv.c              |   4 +-
 drivers/net/wireless/ath/ath9k/xmit.c              |   7 +-
 30 files changed, 1180 insertions(+), 196 deletions(-)

