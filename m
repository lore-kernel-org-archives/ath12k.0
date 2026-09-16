Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD07DC982C4
	for <ath12k@archiver.kernel.org>; Wed, 16 Sep 2026 14:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tK73FQp1Mf4ROUthjYwNJvg6RzgXr9daOQTchTpQz0Y=; b=i5VDa9AtFXgHMNQVCU+AXYiyWR
	KwbatxIgAdyuO3D/HGDxv5b+d+l97s1LWTN3QL/B290gHF77ypl34UHKGZ765MEZVITpaofJBwVmN
	B7Ya5mSaO3jSpJavqsE+BP+3K8a0MbKl5mK88n6iFiDyVTw3aAy37PfrulIc+Tsygc+c+FrG6HpUE
	QMOIYRNubBYwT7L7eve6SgPZZceYNzeR+y5vzvWxReCMEth7OzMitwP6LJJpcWzhWQitALGzvN8FY
	uQequV8X2siTdIs41OUtf4UsejxfBlgxs3ZqtAJmHbNHOM0NThCEJbm2MIzoftDfUxy7heflPtOmX
	od8XGh5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qjF-00000009QzG-1EUy;
	Wed, 16 Sep 2026 14:35:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qjB-00000009QxL-2niW
	for ath12k@lists.infradead.org;
	Wed, 16 Sep 2026 14:35:15 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEYi5n2449034
	for <ath12k@lists.infradead.org>; Wed, 16 Sep 2026 14:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tK73FQp1Mf4ROUthjYwNJv
	g6RzgXr9daOQTchTpQz0Y=; b=L0nQhZkF76DbWVUbzThVh8vB7xUgbcm0FtGT/a
	rxlY1dSRPIUll5FY2PqxadXEkiCERctY65OxkZZUdACWNKpv/4GGVilCFPGiz+C/
	RwfqYUrYQ7wIeYMm7UnM3l72YIVjb/aeUOA2ZM91wqDfkMvykSkgqpyozJNhC7gz
	EnSHDx0P8Hhw+Ejv8nYrwTKqhkwgzTxC0nHGJY9FBwj61OOb6QHlKVD8JeGd6DSK
	nX/SRhPO9HpWZ/jpz7aqgb14tKWaREcF6kNUq0gaQg7hqxdkJYVXIhkz0UibmTm+
	vaKqVcizSf5bgONd1Zu6gYWYy5lhKC7DJli31FefwN9dUQSA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquwb0a3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 16 Sep 2026 14:35:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dd53f2b27cso51612885ad.0
        for <ath12k@lists.infradead.org>; Wed, 16 Sep 2026 07:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789569313; x=1790174113; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tK73FQp1Mf4ROUthjYwNJvg6RzgXr9daOQTchTpQz0Y=;
        b=FJzkUTLlxUs3qZFr+cNIYC4HtA1gylbWBALt+3z7FtQ/sMCN/EYo7+FvswIof13aBK
         3IIpyQvWaNAjpaahTZtnrh6WXvSdM0thO64iEDMiq9O39aX8Cb396rHbx5nRCjbxs6a/
         CX2nVpKweLiqrvXoserXrknzlaZ2MvMT/L+lIF/9Va0Mh3byaC1zLKCa0JzuJQHBxsLy
         eLuBuva42BeR+1iBj8Jzx/BUv1rgaCB3Hoq4iSiubamrn83AxqyMjmq55WKB9TfR9ckC
         XmP9XCU4pV8b4x+lgdnKnayldWilNcBdLZqS8LWGdDuXhw1zk98WEjUCUTLQkPoqrgTp
         SgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789569313; x=1790174113;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tK73FQp1Mf4ROUthjYwNJvg6RzgXr9daOQTchTpQz0Y=;
        b=JMPU5zGk2+bZw3FoIkIBS1ndnLolsyAL7VHX7B3FUB3+mOomyeHC+aHR3/E6sRUMIM
         KGdxM6YwLUFd2kYGjps7FN0kAi/xIv/IzsQa9APljWb+/x5yvttU+9PhPNSH47q5gqt4
         kOPpmNmDLZXmQBbdUW5FXO6QJC/CB7Uoo2bHzKeVwBQTDsFgxF+fUi3wNN4nPeVX9e4a
         DXZ+hzCSlE5uAeMytn86D8M/3IGl6SL5i6KiJfdZLKLLWBeyiN+8p9llTuf5Nh6EDecm
         kfzCDmxVFG8NtJPGcEiYHLW87OQ7o12A8b5T5VtNEN9O90ybJBxNmxmgUtFtO0kqrXEn
         qJRA==
X-Forwarded-Encrypted: i=1; AKwUvBzDnSDuzeHhia7VdcxU8+ARGQ02ma7v4dgdjHlOtoubYn9sOwoCr+dMimMAhPVKkbe6BJ/+22g=@lists.infradead.org
X-Gm-Message-State: AFuF++mFKKK6h5TvBvJQ49TFnHrKN0N7cY5rzHDGLJrISRbNjUB3z9Js
	WxM1Kk/OcFlKzDzwACzWZOD0IXCAQa74DfqkHoOR2nY6ojUkTciTL3CHDMQ1ByG2cDXnO5ySAXv
	+187A2AiHlQ0YQFCr/9tvPzwqPy9LGAJzhkF+BjKq44lvaVD4hTIsRPFz9bGR1kfr
X-Gm-Gg: AYBFou32vo/8cIe8G3v0U0owDgqZwlVRp3BHwcRBiprdyhOfwn1APO9l+SWq4K2V8SJ
	WDV4XH31/li+s4GLjCwyVcgP8oio8vgmqYUijxFCVU7IjQUI/fO+m4uoWgKWoKYGdXzge3gEMxo
	LjhKal/zXVs+Wu2SrN+RlP8uIqjSKhz2HJfo1C374ljfN1A9weZqOMqYRvhcw99pa0mI4YofdSC
	phPgwozP+tVXh1m7RTMRpr5K4D4/O6QIF3qG3V1NcK5hvU2MwVeuA3nSaDASyJu/kLnSStYVI2Q
	qWC8dja5fpSyKESLDf8Ec0NTGssN7iFph7LxzJVDJ3uV5k7x0QaVIBE4IvmWvwnnw187eSxMnb1
	TlR4JVj9qYN08BNq+2I8/Qn2RMOrtiPHYgtwp
X-Received: by 2002:a17:903:1990:b0:2dd:3ddf:b876 with SMTP id d9443c01a7336-2dd8cc8bc70mr59216715ad.0.1789569312195;
        Wed, 16 Sep 2026 07:35:12 -0700 (PDT)
X-Received: by 2002:a17:903:1990:b0:2dd:3ddf:b876 with SMTP id d9443c01a7336-2dd8cc8bc70mr59216005ad.0.1789569311628;
        Wed, 16 Sep 2026 07:35:11 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89eb7496sm13023775ad.38.2026.09.16.07.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 07:35:11 -0700 (PDT)
Message-ID: <ee7037be-6cc1-4bca-b732-42130483f469@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 07:35:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20260916
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H4JOUOYi c=1 sm=1 tr=0 ts=6aaaa921 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7zb2UhBhSU3A8DwyPNsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Turz8cXctFro2oV2SC9xHqi3ARwIDiRL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE5NyBTYWx0ZWRfXyMEkx0nX+eSp
 nIcgDGOmoFWmeHFybBoOHX5V4UBJzY06ROsEJoTQrRkwsWnUKMSDRv7m97uYrJf/qrVG5t3DLIN
 nHUmJqGypczdDxRhpdm9d/QppZZApyQ5ScWkmiH+3XlJL+kChm2tWk7UwY4NbzuYshlOCnnOmAk
 uZGNidnjltCsOHZD7uh3toQbcYK7rJi0Lz7TuNgH9il0VqMbXqwqhEWhLOphZpN69La6yJHLXWp
 KVOhPk/12FRREsK7auZmB7J2dM6GJwRpJvU2jr0a4yYxsWk4mRFFv1cZIBxJKLefQCwBlTTny1j
 GJEZoIhmuGeRckMXMTptP903xh+OPYxRQQ5PbdD8wBViMmSZuhAG3L4ht/zvuyOtvYkCc78nvLk
 OZWmTAsLTIUpAfo8avIfhjqbh7Q9Je1VvyealSrzF2jhzS2INhSdCV+w9VWPOM+xAIO6UDqqVG7
 P01GHGwnfYe1UZ5WU4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE5NyBTYWx0ZWRfX3fhnE7O1Rhj4
 g1cJbX99to8MahusEgErOMs2TLV72oRF2x0AejgeXTXpe4xBwMK2FHz90cw/HPba9IzLQ2ps7s7
 RCYwGJrhWH9wbjISkTHHtgisiek0KtU=
X-Proofpoint-ORIG-GUID: Turz8cXctFro2oV2SC9xHqi3ARwIDiRL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_073514_127752_B57D71E1 
X-CRM114-Status: GOOD (  13.79  )
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

The following changes since commit 1b78070aaef63512688aebfbc82365ef9d6660f1:

  Merge tag 'net-7.3-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2026-08-27 13:53:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260916

for you to fetch changes up to c3bace8584ca707e34ba837f65c2e9d566af4c2c:

  wifi: ath12k: add support to load shared firmware on multiPD (2026-09-10 14:29:09 -0700)

----------------------------------------------------------------
ath.git patches for v7.4 (PR #1)

Add mailmap entries for some Qualcomm Wi-Fi developers now using
@oss.qualcomm.com credentials.

For ath12, add support for the qcom,calibration-variant Device Tree
property and add more infrastructure for the IPQ5332 platform.

Other than that, just an assortment of cleanups and minor bug fixes across
the "ath" family of drivers that aren't urgent enough to go through the
"current" process.

----------------------------------------------------------------
Aaradhana Sahu (4):
      mailmap: add entries for Aaradhana Sahu
      wifi: ath12k: Free allocated CE IRQs on request_irq() failure
      wifi: ath12k: Free allocated external IRQs on request_irq() failure
      wifi: ath12k: add support to load shared firmware on multiPD

Abdun Nihaal (1):
      wifi: ath11k: Fix possible memory leak in ath11k_dp_srng_setup()

Andrew LaMarche (2):
      wifi: ath12k: support calibration-variant from device tree
      dt-bindings: wireless: ath12k: drop qcom,ath12k-calibration-variant

Baochen Qiang (8):
      wifi: ath12k: signal regd update completion when reg event is dropped
      wifi: ath12k: use per-radio ab in ath12k_mac_hw_register()
      wifi: ath12k: protect new_alpha2 access with base_lock
      wifi: ath12k: skip setting country code during registration when unchanged
      mailmap: add entries for Baochen Qiang
      wifi: ath12k: use kernel types instead of userspace stdint types
      wifi: ath12k: fix stale skb pointers after aligned TX payload shift
      wifi: ath12k: fix truncated TX buffer DMA address in MSDU ext descriptor

Jeff Johnson (2):
      wifi: ath12k: remove skb->data check in ath12k_wmi_process_tpc_stats()
      wifi: ath9k: use rcu_dereference_bh() for sta->rates in ath_merge_ratetbl()

Julius Bairaktaris (2):
      wifi: ath11k: implement CE interrupt enable/disable for AHB
      wifi: ath11k: disable interrupts during firmware crash recovery

Kamil Bienkiewicz (1):
      wifi: ath12k: advertise AP_VLAN interface mode for IPQ5332

Kang Yang (1):
      wifi: ath12k: preserve PPDU state across monitor status buffers

Linkai Gong (1):
      wifi: ath12k: clear dangling channel pointers on error paths

Manish Dharanenthiran (1):
      mailmap: add entries for Manish Dharanenthiran

Miaoqing Pan (3):
      wifi: ath11k: fix sporadic WLAN initialization failures
      wifi: ath11k: fix NULL dereference in ahb remove when QMI init incomplete
      wifi: ath11k: unregister PM notifier on QMI init failure path

Mikhail Lobanov (1):
      wifi: ath11k: modify null check logic in ath11k_ce_rx_post_pipe()

Nicolas Escande (1):
      wifi: ath11k: fix locking problem in ath11k_dp_rx_tid_del_func()

Rameshkumar Sundaram (2):
      mailmap: add entries for Rameshkumar Sundaram
      wifi: ath12k: fix DMA unwind for ext MSDU descriptor retry

Sriram R (1):
      mailmap: add entries for Sriram R

Vasanthakumar Thiagarajan (1):
      mailmap: update email address for Vasanthakumar Thiagarajan

 .mailmap                                           |  13 +-
 .../bindings/net/wireless/qcom,ath12k-wsi.yaml     |   7 -
 drivers/net/wireless/ath/ath11k/Kconfig            |   3 +
 drivers/net/wireless/ath/ath11k/ahb.c              |  16 +-
 drivers/net/wireless/ath/ath11k/ce.c               |   2 +-
 drivers/net/wireless/ath/ath11k/core.c             |  10 ++
 drivers/net/wireless/ath/ath11k/dp.c               |   2 +
 drivers/net/wireless/ath/ath11k/dp_rx.c            |  19 ++-
 drivers/net/wireless/ath/ath12k/ahb.c              | 166 ++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/ahb.h              |   9 ++
 drivers/net/wireless/ath/ath12k/ce.c               |   2 +-
 drivers/net/wireless/ath/ath12k/core.c             |  23 +++
 drivers/net/wireless/ath/ath12k/dp.c               |   2 +-
 drivers/net/wireless/ath/ath12k/mac.c              |  45 +++++-
 drivers/net/wireless/ath/ath12k/pci.c              |  55 ++++---
 drivers/net/wireless/ath/ath12k/qmi.c              |   4 +
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |   3 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c     |  23 +--
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c      |  17 ++-
 drivers/net/wireless/ath/ath12k/wifi7/hal_tx.c     |   2 +-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         |   3 +-
 drivers/net/wireless/ath/ath12k/wmi.c              |  16 +-
 drivers/net/wireless/ath/ath9k/xmit.c              |   2 +-
 23 files changed, 346 insertions(+), 98 deletions(-)

