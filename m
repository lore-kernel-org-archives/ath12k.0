Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A90C83F10
	for <ath12k@archiver.kernel.org>; Tue,  8 Jul 2025 19:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4E2HopDvCEYMxYy5QUIC1pqbdnEaZ0r2Pd3FywJkK7I=; b=ZGGiyp1JNh+rKaAlWPq+ymj9lh
	/vuL/K5LohAZ9fzwOYnI4FVUlzNLFRGnSmjzmip8t3R/ZHP+s/Uvr/0SPkMBlVYj/7PoS4OwNH99m
	2CewEQ0br/48aM+Ml2emS0mcosztYRMXoEddwYxyo5p1pCuZDefNvlw03QM0HXIB7WzvSzSgCt2Dn
	0cZRf8OLKhCeA4L6CpNsqD9jMIaKieTeI92bV002S8fYcPgW/cWjmqEqSkh0Wlk2g7dAhRp1pmt7E
	h3vKLA4joR9fIQrH6DcYfc28vwlrfirXnqiz4/4I8aEE2m7jLcLrTaZDrdllIsrfYMDYVuRbpODyk
	bzdgr90A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEAk-00000006Nma-3JU7;
	Tue, 08 Jul 2025 19:40:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCmg-00000006DGG-3JsY
	for ath12k@lists.infradead.org;
	Tue, 08 Jul 2025 18:11:16 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAalX029498
	for <ath12k@lists.infradead.org>; Tue, 8 Jul 2025 18:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4E2HopDvCEYMxYy5QUIC1pqbdnEaZ0r2Pd3
	FywJkK7I=; b=SSuyCbWHXZ4UzoWm27+9MLLt/DUv6Z00J8OqjyzlPPmM2JU8O88
	Hl85yQ5zAwJ99K2D7x30QTEyGbJdDWosC94xwyBvJjd8RR/9cihYFT6H3Cpffgx2
	YI7cvVTFZJ5hADmQzTLwMAcAfy60Yo8kh+D+ABty4yt0VRzVMGB0UrZDeF77Mh0d
	p1DEeg86bjNWCPS113Lw6IEsmSDXH/0B7gG+R4Yp3fV19xg1mOGnsgsmDtZqOFhi
	1Dnapzr/Sxr2fTYFwvZMYEvl+bSCS6PiudbEQjF4ulL4UvgYwy1GAooSxPrvZxyi
	kS03+79m1+0Wd/e8lqKOFCPOr5RSkBdoXLQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv4y1e5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Jul 2025 18:11:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b321087b1cdso5190721a12.2
        for <ath12k@lists.infradead.org>; Tue, 08 Jul 2025 11:11:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751998271; x=1752603071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4E2HopDvCEYMxYy5QUIC1pqbdnEaZ0r2Pd3FywJkK7I=;
        b=ny//NOe6N+DqGGu9vl/hYui5QKTbQCNfQA6xKBJv0E5paaFfzrD8y1qm8bscjX60Gj
         bDBZC09SjsKCpR4r+xaJ7zwPjrlgMaIuckYYIa8rh3N+SXwlb60aR7y1CD4o1jTd189S
         JbwxwfQaPtVA+f26qQgWNEjf60m2VDwYnQh8m7M7TxtXGApW+18kcGOeoDsYua+84ah0
         7cThobCT9WUojzbVIuP6bIqmZUHkMIeHWhrcSnr2UpTXKsqAbi2XoE0aTNfZbUZxXVmy
         b7Cf4nD74Et2yHPaFvk3P6VEUkqw4pQ6+6ccDt5+9pGpHoqerxVxzzjRRHKNA0Q3r2BZ
         qqRQ==
X-Gm-Message-State: AOJu0YzCPU0S7MomLieCgUflG7setLs4azEkzi+uDwfzoTXyVU1DI9Kd
	oj/NAVFjdJQUvv26wqELwsOM245BFr9rRgrSUQu7SZghziKpPmKYPsU4W8KPDY6eZkXilJL0nKS
	3GmFzB2ZN4H2RyeaUHiGFJ9c3xdg5MJqspgT3UeMbXgH6kmJU3+0NUwZSF5JtBPpcZcYeUefK
X-Gm-Gg: ASbGnctjQjGYuXkHoT/KJ4ziN8jPa0sHt7KJgYpZJccBD1UzVog+QUxV7jd8/nfg8yw
	DSrOlrzGJvMDAm/OwFiuvsQeR8/0ba3SOfuVv5AQzgW6fKn0LJs8fjwcLLH9biQ6L4dk3E7ZSMw
	kuh1vXrunWm9LdRt07+6iGrsBRj1MHoI8Tux09iEoABTddHjFT+LOQYS1CGWpMk4GoerCRXYZm2
	1l1HKDhJKmS8PvZznYXxpCEg3pRTEwZPYSmPyAcyGeXDGu89H7PcyrgOthg2gkgUOY+mgXM6bFA
	ryrENQHEbtoOuQZOwl4UOwtHOtpLN6bjBK4Jfk7beX3Zkjv9jUL/4ksVP5Dp/MhANRak4Q0TR3f
	DQpF+f90nHwuNFpGzI2kkf/sZxDGNjEwqEEclnaPMhV14Zg==
X-Received: by 2002:a17:902:bd8c:b0:23d:d9ae:3b56 with SMTP id d9443c01a7336-23dd9ae3e36mr4197335ad.22.1751998270928;
        Tue, 08 Jul 2025 11:11:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfA8fzKZIxQyfqiIAD77GQgV9UQtugyfL1NTOEmOSJVmtZteuzPXo7mRxPjcsYH+MBmbjx7Q==
X-Received: by 2002:a17:902:bd8c:b0:23d:d9ae:3b56 with SMTP id d9443c01a7336-23dd9ae3e36mr4196225ad.22.1751998269559;
        Tue, 08 Jul 2025 11:11:09 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8455d0a9sm115980425ad.95.2025.07.08.11.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 11:11:09 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 0/4] wifi: ath12k: Add low-memory profile support for QCN9274
Date: Tue,  8 Jul 2025 23:40:58 +0530
Message-Id: <20250708181102.4111054-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE1MiBTYWx0ZWRfX7df9XXOksYUz
 2jTdJdZ56q6OSurp0YoeSy0wBt6TpfCTo7xHWp0WuRu7RrARAN2PQyawOLDkjnJ6EGJJkbPi5+M
 JnCrFLzN3xiZizDT0Hbkut1J/knTyQDTHVOYqwA4sD/ABF5yI4AaYcQ3yuP/5aoahqKLmq9oVkn
 t5e/RH20QSCTlxp6ZqlseBjtRoaGMu3kRNKqY1PLLkBKJ19wm5yzcXI7OUNFBzvYpKKVaSnJt7x
 vFif95e6lrmnB5/hUUEf80cVl4IuM4Yo9QDHrpNf78LO9agtx7vppZLw3d97ym86SonfU+2/kGL
 nTJXlxD+7N+2z+UCMliRsDTdPnpfi/20DlpRcWjSse8KNWKvPOk/4RUlDAJGiKzjEV6uGaLtzj5
 hQWS/dVCrkkUaQ9oBo3TsHgFikrrIPcs+yexPf0F0tMriRyzEiN28QN19XlDqLSVafsQZvkp
X-Proofpoint-ORIG-GUID: HnSJMEnG4jEC1z8BkP1s6ZLbxEWC9Gb1
X-Authority-Analysis: v=2.4 cv=DNCP4zNb c=1 sm=1 tr=0 ts=686d5f40 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=JZ-guBkKCIPA0SeDaMsA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: HnSJMEnG4jEC1z8BkP1s6ZLbxEWC9Gb1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_05,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxlogscore=779 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_111114_948442_579B930E 
X-CRM114-Status: GOOD (  12.25  )
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

The ath12k driver currently assumes availability of ample DDR memory
and configures internal buffers and descriptors accordingly.

Introduce support for a low-memory profile to optimize memory usage in
constrained environments. This mode is useful in scenarios where
memory constraints are a concern.

To add support for low-memory profile make below changes:
- Introduce module load time memory profile selection based on
  meminfo.
- Add logic to configures internal buffers and descriptors according
  to memory profile.

Aaradhana Sahu (4):
  wifi: ath12k: Add a table of parameters entries impacting memory
    consumption
  wifi: ath12k: Remove redundant TID calculation for QCN9274
  wifi: ath12k: Refactor macros to use memory profile-based values
  wifi: ath12k: Enable memory profile selection for QCN9274

 drivers/net/wireless/ath/ath12k/ahb.c   |   1 +
 drivers/net/wireless/ath/ath12k/core.c  |  76 ++++++++++----
 drivers/net/wireless/ath/ath12k/core.h  |  20 +++-
 drivers/net/wireless/ath/ath12k/dp.c    | 129 +++++++++++++++---------
 drivers/net/wireless/ath/ath12k/dp.h    |  37 ++++---
 drivers/net/wireless/ath/ath12k/dp_rx.c |   4 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c |  13 ++-
 drivers/net/wireless/ath/ath12k/hw.h    |  30 ++----
 drivers/net/wireless/ath/ath12k/mac.c   |  11 +-
 drivers/net/wireless/ath/ath12k/pci.c   |   2 +
 drivers/net/wireless/ath/ath12k/qmi.c   |   2 +-
 drivers/net/wireless/ath/ath12k/qmi.h   |   6 +-
 drivers/net/wireless/ath/ath12k/wmi.c   |   3 +-
 13 files changed, 211 insertions(+), 123 deletions(-)


base-commit: 45bbd91fc41b7cb6319e45e6fd732c5c8a0c44e3
-- 
2.34.1


