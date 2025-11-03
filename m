Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98901CCFA06
	for <ath12k@archiver.kernel.org>; Mon,  3 Nov 2025 15:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O4woRQI0jpUKcLl/l0yKE3wmuW3/I5wz2p+nBq08PBE=; b=mORCO4NP3K8NDQC44mNy7ZF2Gm
	5Lhh+UZ95R1MKWLwQWCNGkmnSYK975Eb1G/poq5EVOCW2MV0FrMHqqsjogTaI+5qSjutBjYt8Rqt1
	XkchXUVEXl/t8Wnbnn4l+ZpVf/LKuKAde4yt2/Zexxl02JYwFeEluJl/dshubjjsaiUMowuA6AKFj
	dC/wLic474oJJGK38Achp5p42iwrfoBMQhXkdbaMrwzUYo0iGWpfcJESL6QVsFXfR8bHmXOM5QRg9
	kjcyEl3hQORUKZEOVylJhUYrjBMsY6M2mqZtwUNp5R9nTvTQcQL2E4npHWlNT4/Vt40TKC5df8JYl
	LTK8wlew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwPf-0000000A8XY-0IM7;
	Mon, 03 Nov 2025 15:24:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwPb-0000000A8W2-29Vl
	for ath12k@lists.infradead.org;
	Mon, 03 Nov 2025 15:24:05 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3ARv6H2890512
	for <ath12k@lists.infradead.org>; Mon, 3 Nov 2025 15:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O4woRQI0jpUKcLl/l0yKE3
	wmuW3/I5wz2p+nBq08PBE=; b=VFBx+cYXc8mTm/lZT6D4kFPFX55ZbrmDryGiBK
	2HCSU1WxAaKJqOalF6fwVYSzExQvLq+L9ZxOTWquqSWSppFdgDgD/y57JTu14MDH
	LBkmUg2JwSZJcUlY8gU47Eh85aaqoRNi2BRmvJm+8zqxYEYjPGIefJS8VgAbQv1g
	SnmGKe+F+4vekBPw5PR8qDXlfK7I8lwGY3B95FSqakXa+HdFzPTkjKwPtXu2M98u
	l2yacHrEZ+/NyMzu/hiJfY7zlBQNkm3S76IRiA944pOnyusNAX6UUwU234hFjSAH
	fIJHM8ESnFuuGBk+W/AoyBYQ5v0upqW34DYWMXHZqugLav8w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6tnrgr47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Nov 2025 15:24:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-294fb13f80cso33962395ad.2
        for <ath12k@lists.infradead.org>; Mon, 03 Nov 2025 07:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762183441; x=1762788241; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4woRQI0jpUKcLl/l0yKE3wmuW3/I5wz2p+nBq08PBE=;
        b=YM1ZhEPqdv9QkQ9isMb2CZxsfq8VbwBZvSN63TkDCnv+tOXuECTAdzdM/YI8qX04Ws
         AvmcRuKBGdHmXuazh9t6qtd/5Y1aQ+s7CZYu0JiGEjhd1ViayaF0VdztZSWK42s4lNBh
         GEAe5GrEgoMW3nYiQ49rhnaWCUFU3DJzTsFigoRK5CZAwkXqk9PTio8bZviWB5K4UlL0
         hxtE4vrLnB6Gc8DkssCjvtPZSaX6FmKtN+w82zaD8FTWuVkvmz42N7FpdrmArodBzMPK
         Ent87h3uUnjve4XaV1rURBiK+KUDvMIExYwlctXJuR4q0VXf+kOJ9cGUUd9+/1qpbKl+
         AQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762183441; x=1762788241;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O4woRQI0jpUKcLl/l0yKE3wmuW3/I5wz2p+nBq08PBE=;
        b=KDf8SKW0wIVwWPfMpURkTh0MctFDfPD309rNNdcsUk0BjOZTfz2dCo88D23Dn97Vuw
         9lQjonSibVtLBRg57IQw2lpVq/PeYNfiVTzkKwCgNsISAPecRRsJCRSjiHNIzIdqd3CZ
         07sJkOob2qPMdkEQSTp08rNa1ooR9RsKqC79geqtFk/3fH7m7F5cve1tKaj9giBYsA6Z
         c6hPp0cFZbv+TvJ6pPGaAnYiTLFZjJtB5tM1JIxsOlcsYbcpmwxZMjNgKLmZcOzDgsn/
         dE0eO8UYVKmNWflSw253L/7PbWjUN9czPlZKT1ty2pAzOjfBfDpS3RF71/db2+PhOKhX
         n/sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtAaFnqRjGdXKgGkl72oNRmX+YXnVqopO+qXjRtk61CUeUwMfBjVogF1TwdX2uW2GcgrR1qms=@lists.infradead.org
X-Gm-Message-State: AOJu0YywepZp9MyyRRrl0jO6IzRp/rTEac1p52l8sBrsSQUCYAZ8dyI2
	n/taNQuWiXYhSMsvPAjmNl4J9lr2Q3gw2UK0PRD63tNA7Qn7mmPzPnn0mt9dz9km7pD5CjU7BzT
	1MfocD/sIhEq4W8BkBHydhik9F00nBdYUK2lSI7tCPSC6NFgpTBilYKlLx6J0FLldw0qEsC6H
X-Gm-Gg: ASbGncvBSa+LVkhtJXANYJQ7F5mFwycdev3kkNGM+ass1GjaIftZLjUb0Ux3brMVdwZ
	/sTFJGGYGfZRdyQ40MBsVfoUzslKa/NAygbw8d/xvQ6GMBNI5YV98NHsb6y1hD17kha2Cp5dCUU
	EHs3hxqSis7vlhFDrXP4ISQgLMvAiRlOvvwYoi5ll772kg6DdrOlX/MbtJ1rZ0MHqkBRgs3TWqS
	PzZBPrwGp+9Z9QIhOzYfqZNBqi57dD+lnmN77dZRYXtRyUAcaw02HsVjp0Nkc0fVtebQZ2HQB25
	BbVQU1Ech6CTnKAGdxyaJCiQ4qLjtzf5sibBS8r7jrk51vuZ6UiBIdWqlxu8HH50uAunGyjO+hQ
	GbWz/kyg1Tu7EWqipor+JnGKgBCvTQLDkg48=
X-Received: by 2002:a17:903:1ce:b0:27e:ec72:f6d with SMTP id d9443c01a7336-2951a36e6f8mr196389205ad.11.1762183441196;
        Mon, 03 Nov 2025 07:24:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE81KX5Dw/Ser8slGU94o0wfgS7d8oR2J9GcPMTjt9tMgbij5CwCOQwqqb6pSnep8GEANLVTA==
X-Received: by 2002:a17:903:1ce:b0:27e:ec72:f6d with SMTP id d9443c01a7336-2951a36e6f8mr196388845ad.11.1762183440630;
        Mon, 03 Nov 2025 07:24:00 -0800 (PST)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29530aac357sm117914315ad.86.2025.11.03.07.23.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 07:24:00 -0800 (PST)
Message-ID: <30db167b-0ebb-40f3-8beb-e3966a4922f0@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 07:23:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20251103
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEzOSBTYWx0ZWRfX5ejn+Wq3uMQn
 yXeMR/HUFob23XN1kxQTy9kB8nzpND4hwsG5i6rzl4+gn3j4WMUSWMOwYMQdmhSvInlddtsZSzR
 6ojWyNg/duPmgGdU9FQ6EWwoGW/OY2D1vWrix/31O6+mDZdgDl+gKSDuDliZ213Y3LOm+ajPDj1
 xBvTpGBcNgPCKuzvDkHrAZl7ng2Erry8LysUnwWORrYNZqE9Q6t5KKxjf5/FmhZ8q5+DHLlhswp
 tK5Y1zRBuz1dZRW8DvISgtQEBjWIiAKHIa1emA7hGizfLuDD8bcLGB7FQd2txmv60yfu0UDdez2
 KDe75ddII/rKgi9G+at/o29sxZrEoStoxAq+kgNJaAxwnF0qV5vpuDOcE9ZXyVFkuTwaotpn+yh
 iqOPycUJgt6BIPRMA5H/2a0xD0wZ3A==
X-Proofpoint-GUID: u2xfTNYuephRhJ2v9WikewH3P3RM8nsN
X-Proofpoint-ORIG-GUID: u2xfTNYuephRhJ2v9WikewH3P3RM8nsN
X-Authority-Analysis: v=2.4 cv=BrSQAIX5 c=1 sm=1 tr=0 ts=6908c912 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=NlKQ8RDDprgilyjO-nkA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_02,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_072403_666700_3803FC7B 
X-CRM114-Status: GOOD (  14.11  )
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

The following changes since commit 94aced6ed9e2630bae0b5631e384a5302c4b6783:

  Merge tag 'wireless-next-2025-09-25' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next (2025-09-26 14:27:28 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20251103

for you to fetch changes up to 059ca8fd692b67a77fb89e9d4e8f57cf08e32b08:

  wifi: ath10k: use = {} to initialize bmi_target_info instead of memset (2025-10-30 14:55:08 -0700)

----------------------------------------------------------------
ath.git patches for v6.19

Highlights for some specific drivers include:

ath10k:
Add support for Factory Test TLV commands

ath11k:
Add support for Tx Power insertion

ath12k:
Add support for BSS color change

And of course there is the usual set of cleanups and bug fixes across
the entire family of "ath" drivers.

We do expect to have one more pull request before the v6.19 merge
window to pull in the refactored ath12k driver from the ath12k-ng
branch.

---

Note to maintainers:

There is a trivial conflict between two patches:

From ath-current => wireless => net
9222582ec524 ("Revert "wifi: ath12k: Fix missing station power save configuration"")

From ath-next => wireless-next => net-next
6917e268c433 ("wifi: ath12k: Defer vdev bring-up until CSA finalize to avoid stale beacon")

The resolution is to take both hunks, ordering them in reverse xmas tree style.

----------------------------------------------------------------
Abdun Nihaal (1):
      wifi: ath12k: fix potential memory leak in ath12k_wow_arp_ns_offload()

Aditya Kumar Singh (5):
      wifi: ath12k: Defer vdev bring-up until CSA finalize to avoid stale beacon
      wifi: ath11k: relocate some Tx power related functions in mac.c
      wifi: ath11k: wrap ath11k_mac_op_get_txpower() with lock-aware internal helper
      wifi: ath11k: add support for Tx Power insertion in RRM action frame
      wifi: ath11k: advertise NL80211_FEATURE_TX_POWER_INSERTION

Baochen Qiang (7):
      wifi: ath11k: restore register window after global reset
      wifi: ath12k: fix VHT MCS assignment
      wifi: ath11k: fix VHT MCS assignment
      wifi: ath11k: fix peer HE MCS assignment
      wifi: ath12k: restore register window after global reset
      wifi: ath12k: fix reusing m3 memory
      wifi: ath12k: fix error handling in creating hardware group

Dr. David Alan Gilbert (1):
      wifi: wcn36xx: Remove unused wcn36xx_smd_update_scan_params

Jeff Johnson (3):
      wifi: ath11k: Remove struct wmi_bcn_send_from_host_cmd
      wifi: ath12k: Remove struct wmi_bcn_send_from_host_cmd
      wifi: ath11k: Correctly use "ab" macro parameter

Kang Yang (1):
      wifi: ath10k: move recovery check logic into a new work

Loic Poulain (1):
      wifi: ath10k: Support for FTM TLV test commands

Muna Sinada (6):
      wifi: ath12k: generalize GI and LTF fixed rate functions
      wifi: ath12k: add EHT rate handling to existing set rate functions
      wifi: ath12k: Add EHT MCS/NSS rates to Peer Assoc
      wifi: ath12k: Add EHT fixed GI/LTF
      wifi: ath12k: add EHT rates to ath12k_mac_op_set_bitrate_mask()
      wifi: ath12k: Set EHT fixed rates for associated STAs

Pradeep Kumar Chitrapu (1):
      wifi: ath12k: fix TX and RX MCS rate configurations in HE mode

Rameshkumar Sundaram (2):
      wifi: ath12k: enforce vdev limit in ath12k_mac_vdev_create()
      wifi: ath12k: unassign arvif on scan vdev create failure

Sarika Sharma (3):
      wifi: ath12k: Fix MSDU buffer types handling in RX error path
      wifi: ath12k: track dropped MSDU buffer type packets in REO exception ring
      wifi: ath12k: Assert base_lock is held before allocating REO update element

Takashi Iwai (1):
      wifi: ath12k: Add MODULE_FIRMWARE() entries

Thiraviyam Mariyappan (1):
      wifi: ath12k: Fix NSS value update in ext_rx_stats

Wei Zhang (1):
      wifi: ath12k: add support for BSS color change

Zhongqiu Han (2):
      wifi: ath10k: use = {} to initialize pm_qos_request instead of memset
      wifi: ath10k: use = {} to initialize bmi_target_info instead of memset

 drivers/net/wireless/ath/ath10k/core.c       |  28 +-
 drivers/net/wireless/ath/ath10k/core.h       |   6 +-
 drivers/net/wireless/ath/ath10k/mac.c        |   2 +-
 drivers/net/wireless/ath/ath10k/testmode.c   | 253 +++++++--
 drivers/net/wireless/ath/ath10k/testmode_i.h |  15 +
 drivers/net/wireless/ath/ath10k/wmi.h        |  19 +-
 drivers/net/wireless/ath/ath11k/hal.h        |  38 +-
 drivers/net/wireless/ath/ath11k/mac.c        | 455 +++++++++++-----
 drivers/net/wireless/ath/ath11k/pci.c        |  20 +-
 drivers/net/wireless/ath/ath11k/pci.h        |  18 +-
 drivers/net/wireless/ath/ath11k/wmi.c        |  20 +-
 drivers/net/wireless/ath/ath11k/wmi.h        |  18 +-
 drivers/net/wireless/ath/ath12k/core.c       |  22 +-
 drivers/net/wireless/ath/ath12k/core.h       |   3 +
 drivers/net/wireless/ath/ath12k/debugfs.c    |   5 +-
 drivers/net/wireless/ath/ath12k/dp_mon.c     |  19 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c      |  74 ++-
 drivers/net/wireless/ath/ath12k/hal_rx.c     |  10 +-
 drivers/net/wireless/ath/ath12k/mac.c        | 755 ++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath12k/mac.h        |  14 +-
 drivers/net/wireless/ath/ath12k/pci.c        |  24 +-
 drivers/net/wireless/ath/ath12k/qmi.c        |  11 +-
 drivers/net/wireless/ath/ath12k/qmi.h        |   5 +-
 drivers/net/wireless/ath/ath12k/wmi.c        |  86 ++-
 drivers/net/wireless/ath/ath12k/wmi.h        |  55 +-
 drivers/net/wireless/ath/ath12k/wow.c        |   1 +
 drivers/net/wireless/ath/wcn36xx/hal.h       |  74 ---
 drivers/net/wireless/ath/wcn36xx/smd.c       |  60 ---
 drivers/net/wireless/ath/wcn36xx/smd.h       |   1 -
 29 files changed, 1554 insertions(+), 557 deletions(-)

