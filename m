Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79696C77B7F
	for <ath12k@archiver.kernel.org>; Tue, 24 Jun 2025 17:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IhE41DpoTR4z03SkvEPcC33iwojowxS+ZkTlZkD1bgA=; b=e8Do6C8AnHLM4fk7n5y58LwbIb
	nWjw+q0QTDO9PzXm0aFglYWt6dmsUjNpEUl1Y9sTbSh62FExS0yOZ5+gv5dbOHiRmHA7kI4/cBjSw
	+lLRkwQqCPZe5LIJKeQ4SYVb5cVvDdGCgfkDdfzL9hAEeomzcsdeLCOfgfN/UrFsiQ4UwCy5gOQ3C
	Tq5W80JeHGzquWMS/jKzDr+diLCBj6WxN1Cacr32p63s1ikWyjBATjmIoka9yLDwco4f0WcnULPwQ
	doAS9PSNEk/koCKmbA8xpsORsvFT/TSHSTKU/x+kQybaLTE/OsjDEosuaIuhXZbjfs9ERWwu0FBSE
	dRgpJC8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU78y-00000006LvC-0uxp;
	Tue, 24 Jun 2025 17:09:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4st-00000005xQj-3yTE
	for ath12k@lists.infradead.org;
	Tue, 24 Jun 2025 14:44:29 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O8Tt8S014579
	for <ath12k@lists.infradead.org>; Tue, 24 Jun 2025 14:44:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IhE41DpoTR4z03SkvEPcC3
	3iwojowxS+ZkTlZkD1bgA=; b=kBpJugnzA7Spx9xxiVMn5elexslgWXE4zM95TW
	OT0upiLndcNLZf1l/lJyiyef7upVtBBvHAf3lGvJnx53/9Bs/NFrs53O6JhQcKel
	aWygqUMpg8A/wyZTDrgmkeUB8JcfZBFAfACYfAPXRVzhjve8B24w7vGqnMI0+/ej
	YkMKrfsMR9FiNbUJniCWjDOnLM+c6tAHAH9599TazCbwyKg0jexgs8eznlEDm31i
	WdfWLnr1zh3vk4Vyra/B2PEGwuvweqga3YGzBvbXxuVjB2v78PkgzhX4acXRIF8H
	5RVTeg15+IhBUmF3Vs6jhhySoxLxNY6jxAqNkxy/hzUo688w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpvq6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Jun 2025 14:44:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23689228a7fso8172725ad.1
        for <ath12k@lists.infradead.org>; Tue, 24 Jun 2025 07:44:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750776264; x=1751381064;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IhE41DpoTR4z03SkvEPcC33iwojowxS+ZkTlZkD1bgA=;
        b=Wwfyf5+2vsjwpZUvdUmGveqJGbPkFuotTWEKKH1sZAeqoqONOivxY/AZoDlbTVvp9b
         baAptZ4P6LH2KVbJMbnO5lLs1CxPKAdjs/TRxFiEoXkUbZslghK7AtIImgYHwskjdttI
         8vQ3V3RuALAKKHktv5IMic2gD8yWxyL87nRL0PAWDxvOQrXWA+kzFrHr9m0kDt5Fzdi4
         uArU+v1/7DKYKDFJWZghcyi9onDJwk/xcGCg2IVrn/vJiBz0eqehVWkKHjazt6HWQ0V1
         wjJBDstLT0LZCPy1h+jfHUvj0gPYlus4NGMLuHCfYpEKk/s9Yal5NwUzgVVlw3LnbW6R
         rnRg==
X-Forwarded-Encrypted: i=1; AJvYcCW0FUDeONezD/j8n+tFWDEglUX2xc4pbVltLQDztEb8F931uaSNCVYWgJ3baQ9jOztBi6fKuyU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwLfl2Y/0mSg2Ydu83VLd86wr0W+vTYU18ILUwy+gE42dl2BEN7
	pK8P49oMPJkWNYAj18CplOWS6auLMT91yuVoOB69ZW4Lsiqg0G80mkCgWDZmSOTTDQA93Eee4l9
	yXufKjEbulqH8/DUX9FI4QAftquoMFznY39+d2Y/MpxxHahkbzVzNTPbYIDYTsucKq6yzwu5T
X-Gm-Gg: ASbGncv9chnW428+DytBtNWTAxtERCLJ+UxKox9mWyL+908LltgGPGb8N0+vgYXmDfQ
	MJTHe3ScsT/VuhADB+PlBZohosYMok1cTgp6pIaPEc+DGp9U2GGhOU2qqXr5WQ65VTdgKhRSdvE
	6TcVh9WZjuc2LnmoqgLttn9vqx7jZQnRwjUVl2nUSyguNK8NBhu6LUmY7GUuoo8uf4VfGEMSPoJ
	NbE/KIwDswfidETD756HrfP4z8wYcC51j3bvpaR25kocGiErhs4xr6rofScLEbZ24OaVcgXWcQl
	exbtZnm3uOzGB47YEi5cm39o6UQZUJX7VZAcUeRNzA7F9+OSJiAWZ+59A8I=
X-Received: by 2002:a17:902:db12:b0:236:6f43:7051 with SMTP id d9443c01a7336-237d97a0078mr249634015ad.23.1750776264493;
        Tue, 24 Jun 2025 07:44:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtpvWaNXtgEovlpWkppj0lj2kPpVgXDcGxLVefBJ0YMbF5YswDncyNNJZgRock4Lo1EOpRRw==
X-Received: by 2002:a17:902:db12:b0:236:6f43:7051 with SMTP id d9443c01a7336-237d97a0078mr249633385ad.23.1750776263866;
        Tue, 24 Jun 2025 07:44:23 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8672498sm111316915ad.166.2025.06.24.07.44.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 07:44:23 -0700 (PDT)
Message-ID: <214e0531-ddaa-47cd-88d0-f73057253e44@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 07:44:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20250624
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685ab9c9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=43BLvgXLegQtNCW6A6UA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEyMyBTYWx0ZWRfX5GJsikGewDVw
 A2tqLwfK4Rl8jkIxHDnu+A2eUZmCkK2kDPOZyg8Q0eV5whYB0zpLE3DmpTT/EomisEiQ1CM9gps
 Dn6LVG0TtHTZ1RJKb6m2k2Rfk9dHh40odNBmCn1azh8m3EIp1frbtAcm5n/vb8JNbqAhIFhg56N
 k+aw/HLVBalpcR0xTj2ZnxnVJuHb06JUn74GdEnvaA/bSpupBwLx4LCS2BJhRs1F/ybnjVjlEoP
 C3+/0Qbm9CwouJyjWeWTsdBgWjevr5sQhdDuE4OprsMtak8saYyU68Lssn0alvv05E+rntQio+7
 KR8aEd373VePkpQGVBT+WakNiwNwW3lTSO/LuSQ3SA4BHGSGAuh6MZFllgZ1yUrf+J26xJfWlwq
 naSioCIFXKal6JNcDHCZ1w8gK5hfFSEiWcp8tc3RyA5qB19dTlV5IqaEP+8vifSqaahfJh0R
X-Proofpoint-ORIG-GUID: 15eN0yjoGUXkCdPIXZc07kVCvJXQZd-a
X-Proofpoint-GUID: 15eN0yjoGUXkCdPIXZc07kVCvJXQZd-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_074428_125377_EB8E088A 
X-CRM114-Status: GOOD (  11.64  )
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

The following changes since commit 757259db79fc6054780e07bb284f768b01cf8fa9:

  ssb: use new GPIO line value setter callbacks (2025-06-20 10:55:19 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20250624

for you to fetch changes up to 05062834350f0bf7ad1abcebc2807220e90220eb:

  wifi: ath12k: Pass ab pointer directly to ath12k_dp_tx_get_encap_type() (2025-06-23 07:28:34 -0700)

----------------------------------------------------------------
ath.git patches for v6.17

All ath drivers:
Add "#include <linux/export.h>" to all files that use EXPORT_SYMBOL()
to fix a newly introduced 'make W=1' check. Note that check has
subsequently been changed to only test when W=2, but keep the fixes to
suppress the warning for 'make W=2'.

ath12k:
Properly handle scan requests on multi-radio wiphy devices.
Perform the usual set of bug fixes and cleanups.

----------------------------------------------------------------
Aditya Kumar Singh (1):
      wifi: ath12k: handle regulatory hints during mac registration

Baochen Qiang (2):
      wifi: ath12k: avoid bit operation on key flags
      wifi: ath12k: install pairwise key first

Jeff Johnson (5):
      wifi: ath: Add missing include of export.h
      wifi: ath9k: Add missing include of export.h
      wifi: ath10k: Add missing include of export.h
      wifi: ath11k: Add missing include of export.h
      wifi: ath12k: Add missing include of export.h

Kang Yang (1):
      wifi: ath12k: update channel list in worker when wait flag is set

Karthik M (1):
      wifi: ath12k: disable pdev for non supported country

Karthikeyan Kathirvel (1):
      wifi: ath12k: Decrement TID on RX peer frag setup error handling

P Praneesh (2):
      wifi: ath12k: remove monitor handling from ath12k_dp_rx_deliver_msdu()
      wifi: ath12k: Fix double budget decrement while reaping monitor ring

Raj Kumar Bhagat (1):
      wifi: ath12k: Enable REO queue lookup table feature on QCN9274 hw2.0

Rameshkumar Sundaram (4):
      wifi: ath12k: Avoid accessing uninitialized arvif->ar during beacon miss
      wifi: ath12k: Prepare ahvif scan link for parallel scan
      wifi: ath12k: Split scan request for split band device
      wifi: ath12k: combine channel list for split-phy devices in single-wiphy

Tamizh Chelvam Raja (1):
      wifi: ath12k: Pass ab pointer directly to ath12k_dp_tx_get_encap_type()

 drivers/net/wireless/ath/ath10k/bmi.c            |   2 +
 drivers/net/wireless/ath/ath10k/ce.c             |   2 +
 drivers/net/wireless/ath/ath10k/core.c           |   2 +
 drivers/net/wireless/ath/ath10k/coredump.c       |   2 +
 drivers/net/wireless/ath/ath10k/debug.c          |   2 +
 drivers/net/wireless/ath/ath10k/htc.c            |   3 +
 drivers/net/wireless/ath/ath10k/htt_rx.c         |   3 +
 drivers/net/wireless/ath/ath10k/htt_tx.c         |   2 +
 drivers/net/wireless/ath/ath10k/mac.c            |   1 +
 drivers/net/wireless/ath/ath10k/trace.c          |   2 +
 drivers/net/wireless/ath/ath11k/ce.c             |   2 +
 drivers/net/wireless/ath/ath11k/core.c           |   2 +
 drivers/net/wireless/ath/ath11k/coredump.c       |   2 +
 drivers/net/wireless/ath/ath11k/debug.c          |   2 +
 drivers/net/wireless/ath/ath11k/debugfs.c        |   2 +
 drivers/net/wireless/ath/ath11k/dp.c             |   2 +
 drivers/net/wireless/ath/ath11k/fw.c             |   2 +
 drivers/net/wireless/ath/ath11k/hal.c            |   2 +
 drivers/net/wireless/ath/ath11k/pcic.c           |   2 +
 drivers/net/wireless/ath/ath11k/qmi.c            |   2 +
 drivers/net/wireless/ath/ath11k/trace.c          |   2 +
 drivers/net/wireless/ath/ath12k/core.c           |   7 +
 drivers/net/wireless/ath/ath12k/core.h           |  13 +-
 drivers/net/wireless/ath/ath12k/dp.c             |   1 +
 drivers/net/wireless/ath/ath12k/dp_mon.c         |   1 -
 drivers/net/wireless/ath/ath12k/dp_rx.c          |  18 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c          |   5 +-
 drivers/net/wireless/ath/ath12k/hw.c             |   2 +-
 drivers/net/wireless/ath/ath12k/mac.c            | 425 +++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/mac.h            |   7 +-
 drivers/net/wireless/ath/ath12k/p2p.c            |   3 +-
 drivers/net/wireless/ath/ath12k/reg.c            | 117 +++++--
 drivers/net/wireless/ath/ath12k/reg.h            |   3 +
 drivers/net/wireless/ath/ath12k/wmi.c            |  26 +-
 drivers/net/wireless/ath/ath12k/wmi.h            |   2 +
 drivers/net/wireless/ath/ath9k/common-beacon.c   |   1 +
 drivers/net/wireless/ath/ath9k/common-debug.c    |   1 +
 drivers/net/wireless/ath/ath9k/common-init.c     |   1 +
 drivers/net/wireless/ath/ath9k/common-spectral.c |   1 +
 drivers/net/wireless/ath/ath9k/common.c          |   1 +
 drivers/net/wireless/ath/ath9k/dynack.c          |   1 +
 drivers/net/wireless/ath/ath9k/hw.c              |   1 +
 drivers/net/wireless/ath/main.c                  |   1 +
 43 files changed, 557 insertions(+), 124 deletions(-)

