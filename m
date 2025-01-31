Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513E1C0218F
	for <ath12k@archiver.kernel.org>; Fri, 31 Jan 2025 19:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rWPq2Jy5dpq1rPEuULWQ5kKIrsTzJW/zkhiKWPv7fzM=; b=3nz5Op1cIPu9QxaKO9IHwBW4Qh
	p29Jj7gQv/yP4zK+pWUdJuv2xC7IWCsemdmtm8poTZNy8PTH3v9NKzMc3KNP25dj2BoklnRGkyqy9
	7oNC14fKnU0TSziw3zK4LgUr3MGYe5eddic8xncw9ti4a0jNPKX2ZhPaC3HMJZAhsB/5eKpSZfCy5
	KKz8ry3tyxQuTDRZclkzXuJizA5+t/uP8eORCyaib4NUEAmBbaKoadMUAz8CFExZuRsN7D/xqzSUM
	T6XTbi1JTQH+tQZdN96fJzxIMEHWrxx0Q4WBKU5DdvLcAhOX8OBMXjqRYOEOuIu1J8JeM44f+uro6
	g8cFnETA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdwpg-0000000BInr-0HdK
	for ath12k@archiver.kernel.org;
	Fri, 31 Jan 2025 19:37:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdwpe-0000000BInD-1Qur
	for ath12k@lists.infradead.org;
	Fri, 31 Jan 2025 19:37:39 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VDLSnG016922
	for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 19:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rWPq2Jy5dpq1rPEuULWQ5kKIrsTzJW/zkhi
	KWPv7fzM=; b=LViBRENSzlfqIeGneT4cQxFPBK0gZDwDSCU5EgYFdH1jHeErTxD
	nCl+UjAjpXacXxhEP5f47hK6o6tO9L9vGJsnwhPMV/KKssHCIJLtJs4jv+V4OAUj
	h55Dqugphl4/D3avONScHvwwXSBx+olQ7dKfS0+FybUKrp757yz29yXK4ryzataT
	O9mMKrtMyZ6nSNz5pMKwrwfb3pVuqeE4Fhp6c2ArlW1dBPoWgxP+KZu8jQgQ4eZ0
	M+/yW4h/lpgzG2J6cX2hlw1rKJ3gD+wgmFCCIOYU4tom4vSQMtH06F7b2KstC0cw
	2M9wozfZ/rimZ/mHNrkHMtfpSXq74xdEcAg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gyau8u8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 19:37:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ef7fbd99a6so4527031a91.1
        for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 11:37:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738352255; x=1738957055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWPq2Jy5dpq1rPEuULWQ5kKIrsTzJW/zkhiKWPv7fzM=;
        b=C7abi96ZSjMBgPFKYtOglv0Sg4o6FQ6t3fh2eN1ITxw/YllXGOZxIfnu1D1bCSTTEN
         waon8UWGTACmX7N0gZfag1M3YXydVLbxSYtrxRPvNLog9hgn95/I+UA/rl5Y5by6bUy/
         aCOr8jKvHtj/BDlxWMNZljsKmgvSgn/tGkYLpCrHlgYCJgJgtvNM51nC0Gsq2B7EX1Jl
         B/e8t5BAexYhA2yxMktfBtLkirWfFtERjmliJgsl2Av3dztHEbD2H9AkCvyZzI+XghTl
         k0Ufk+tIv0EmjR/dsNqsjP3NjxxPB+DJ6u/jMUxtvys5jpd8dziyjVFwIbPX87ycMSpa
         Vbpw==
X-Gm-Message-State: AOJu0YxgMNKhLN3Up0antqpCVT44qpDotjSXaitfwtwE8WHDaa5Gunxi
	XxacT/6AjZaJUizeIuErahlnwvR9EgZYFCbjwO6w3RrFtEB9lExDAK7AAQ7Ozn1AILJrV2JQVdc
	x1YDyi9itB59dzDrh1VKkUqKlsDAN4TtEtaMeqeYQ18eto6OM59M4zJJX6hsb9YEtW0Up
X-Gm-Gg: ASbGncuiF3puGzYKPREXjBxGolbAuEXYjvjHaI11P/GG667bA7aPm7AzLL4CFRM0PD7
	BgoSmFmG84ra3+fw011yNx9US5Du+zvhROPG/BecW4xIrE7q2amQtVLPkLDxB+nrERysF+ahdae
	+ceo0zNiOb4c1coKPsvh8PvDKZohGel85y/pJFv9G281xXm1bErsujo304FBZ+mDuD5y2z1zyig
	HzyPg3e3Lc5A6IajuMyK6X0FocoOTvpkJHvAcbAZfcs0TKpkW8TIT7oanG1RAfJibiaXRobM8Wv
	EOgbTj1ZngFv90xh9SLsFsRkZ1UM6G9E41IG3Q5i1V1GLPGVBY08ho2wSV83edgl02ClIAzkVxj
	k0Db7IosMkjx9uJzvhbBBCOIGIvxRLHx2zQ==
X-Received: by 2002:a17:90a:dfc5:b0:2ee:9d65:65a7 with SMTP id 98e67ed59e1d1-2f83ac86a84mr18019419a91.29.1738352255572;
        Fri, 31 Jan 2025 11:37:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmPr6BfdjnFSbOf+DrFBr5qlvQ41u8Gh9NUr3+eZhVMFlHNR+G1jN8bwYsF6UhTEBs/k42cg==
X-Received: by 2002:a17:90a:dfc5:b0:2ee:9d65:65a7 with SMTP id 98e67ed59e1d1-2f83ac86a84mr18019395a91.29.1738352255184;
        Fri, 31 Jan 2025 11:37:35 -0800 (PST)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f848acac43sm4019271a91.40.2025.01.31.11.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 11:37:34 -0800 (PST)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH v2 0/2] wifi: ath12k: add support for get_txpower mac ops
Date: Sat,  1 Feb 2025 01:07:24 +0530
Message-Id: <20250131193726.3568086-1-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xOrh9n2aqzvcNk1dsFU4ucDP-ceR0YL4
X-Proofpoint-ORIG-GUID: xOrh9n2aqzvcNk1dsFU4ucDP-ceR0YL4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_07,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501310148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_113738_493596_54C5A265 
X-CRM114-Status: GOOD (  12.31  )
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

Currently, driver does not support get_txpower mac ops because of which
cfg80211 returns vif->bss_conf.txpower to user space. bss_conf.txpower
gets its value from ieee80211_channel->max_reg_power. However, the final
txpower is dependent on few other parameters apart from max regulatory
supported power. It is the firmware which knows about all these parameters
and considers the minimum for each packet transmission.

Firmware reports the final TX power in firmware pdev stats which falls
under fw_stats. But currently, fw_stats is under debugfs.

Add support for get_txpower mac ops to get the TX power from firmware
leveraging fw_stats and return it accordingly.

Also, move fw_stats out of debugfs so that get_txpower mac ops can
function properly even when debugfs is disabled.

v2:
 - In PACTH 1/2
   * added sanity check for stats pointer in
   ath12k_wmi_tlv_fw_stats_data_parse()
   * Moved ath12k_debugfs_fw_stats_reset to core.c
   * Removed ath12k_debugfs_fw_stats_request() and reused
     ath12k_mac_get_fw_stats() of mac.h as both are serving
     same purpose
 - In PATCH 2/2
   * Modified ATH12K_PDEV_TX_POWER_INVALID to hold u32 max
   * Saved power in dbm units in ar->chan_tx_pwr

Aditya Kumar Singh (2):
  wifi: ath12k: move firmware stats out of debugfs
  wifi: ath12k: add get_txpower mac ops

 drivers/net/wireless/ath/ath12k/core.c    |  53 ++++++
 drivers/net/wireless/ath/ath12k/core.h    |   5 +
 drivers/net/wireless/ath/ath12k/debugfs.c | 112 +------------
 drivers/net/wireless/ath/ath12k/debugfs.h |   5 -
 drivers/net/wireless/ath/ath12k/mac.c     | 188 +++++++++++++++++-----
 drivers/net/wireless/ath/ath12k/mac.h     |   4 +
 drivers/net/wireless/ath/ath12k/wmi.c     |  99 +++++++++---
 7 files changed, 294 insertions(+), 172 deletions(-)


base-commit: a10b8b584b8bcb7559f068ce247fc27d0c4850ca
-- 
2.34.1


