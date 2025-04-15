Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8FBC369BA
	for <ath12k@archiver.kernel.org>; Tue, 15 Apr 2025 19:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mwVlsTSvEzFjs5QjXxa/ElYdsw1CyTATtQLr5FKwOjg=; b=Rl9NJzleIZuiJzuT8JCJwMzHb/
	VXqLAapEAzX8rw2FYITVp5cpx9QaCR+O+6WesRjAhDslxmA4zGOStEEgFtXXTK1oZUE0YphseNtue
	M+OItUpezZiXlv9nIFQgc486hJf7DHQgVVJrosF/4V5J6vgozexQLOsktLW7RHX3NRuxazxts6lbF
	dHQ+fjmbtpOG6KewFrxgNR/BtAhzBnVyhMt/T4lDzDajFwvTW9ctuPh1HdVRz48kJOA0EQTBzH48D
	80y8h1BptbgmVbZw+NshWymSL7IIM8HwqFLVWplrWF9rJAghBGhpVzGI4e+jHMEKMipCqEKv4B6CG
	48YZMCYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4mRq-00000006yAs-3dmN;
	Tue, 15 Apr 2025 19:59:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4mQg-00000006y37-44KX
	for ath12k@lists.infradead.org;
	Tue, 15 Apr 2025 19:59:05 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FJV3ST019617
	for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 19:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mwVlsTSvEzFjs5QjXxa/ElYdsw1CyTATtQL
	r5FKwOjg=; b=b6v1sZAHhT1qe9dJ/WhCYFjzNg9ofQJ+EThSqcpepnTmALwPI2+
	rCk8wjOEGxg3a8Ak8oNDJ+GWkDMqlHqE+7fcXLvpp5tUyDCLqUgzFiH9F1srMFBE
	YLUgqSJRlBOXaoDL2aOzMw3tDLo8TLwTtmHRrNIZqDPcFueTfH6o3QPOc9W9G7YC
	bBmiOCSahlG3ld0+uT27bFJ10dzJ3Uq1AAsfMpvCWQVMfTLEsBINIK6/0I5C05rx
	NPoQD4tYwA4Umv3i4NQzYb8qiMpVlmI1e7ez2KcxHPkjg29HJBJP76Z+nYL1K5XW
	5vp4Z15dadwMTlsgqd1LmbsPj7fIP4bXx6Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfd17em-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 19:58:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2242ade807fso90253595ad.2
        for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 12:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744747125; x=1745351925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mwVlsTSvEzFjs5QjXxa/ElYdsw1CyTATtQLr5FKwOjg=;
        b=qEQBQIMZd+xyrHnHLUdTUEYn8qvhIEh5Y6vCfgRw6fsetGmLG+Wn2aVMjqaAGD8OcS
         wp/obz17XsQe93rmT2+IKZs+RrV9+YfHZB49BSHuG60Ywwe2qU5vVo2IvqXVMDrWo14u
         ST7bR1PhrErU53hxpaGOcVWEPL/4yWzEb+6dJLZzwCt/VSDhddFE1XUC4mT4IHt7ZK6b
         iMxv+gMh9m4ZiQkqsNkEtB+AVoQNI/bZ7ltz1hIWCipj2MuZbrKFYi4lvi0o4pOypRX+
         ARND8I7W8sg0wkqVkBfDD91xmcnBUlDZxLYmK3BCkcrqfCwZNXy97Lb6TbSzAoLjHtM2
         D/Yw==
X-Gm-Message-State: AOJu0Yy8hxJ1ubRF0uHnz6da40F2KOjkX2jdE+jd5X3XIoUE93cfyTmj
	2iseivSJ4mY+uPbbeB+a9TY2ficir13blCytFaJHhs9NUtFmERnEkKWw9Qh4o709tbEDh1kavIH
	QOAP+3eKFbMogkqMSuPoLVri+CITLoTNwMNejRRmOSL3Q6ntajw47Jr6d2yafMgAuJcl7
X-Gm-Gg: ASbGncvBYoLVFcSWuYze1tnN2S5+V2RA2uC112rksvWbmeyDNBSIFmtNr/XpRlHtTIA
	uBR2Nm4iwnMxwDImAdWByyezy/51AcPlGS74NxD9Lq1p6brL+mxZgouiWSyxXfVI+9EFISXmrlA
	rdaqZpD9DriTegwm46ULhOWjTLNzUe50Sp8TxkZV20aRFQoKRRTtpLocSNbOdJjxgaT01Af3Nws
	DMrjSP1YF2tz1EgPh5wolni+wzPexxB2K7fv79VOk20SN47pFzmGsbts9OVkk7P/3FA2FKB2O0q
	yZpm/z6HRF9cEjiqnGgE4xsiJsE0pFH0l+RQTWr9EwmjRJ0rc9bFU5O2A8vcnIGY0NJIr33xhLC
	ERQAuhqm0VdVYpbDZ0fAq9XkzXnpDc5x+RHyGxqOk
X-Received: by 2002:a17:903:2a8f:b0:21d:dfae:300c with SMTP id d9443c01a7336-22c318a9320mr6713235ad.3.1744747124773;
        Tue, 15 Apr 2025 12:58:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGVwNmLKffAoWRaj/s7d9ar5DCXyaNmUkGN8fD4QrSVC/+5n2gqUOTY2ZCcy6Q8KayUHYUUw==
X-Received: by 2002:a17:903:2a8f:b0:21d:dfae:300c with SMTP id d9443c01a7336-22c318a9320mr6713035ad.3.1744747124418;
        Tue, 15 Apr 2025 12:58:44 -0700 (PDT)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8ea61sm121626265ad.103.2025.04.15.12.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 12:58:44 -0700 (PDT)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/2] wifi: ath12k: set proper key flags and MIC space for CCMP256 and GCMP ciphers 
Date: Wed, 16 Apr 2025 01:28:10 +0530
Message-Id: <20250415195812.2633923-1-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67feba75 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=Hc_DSzY3qiiTP8U-yMkA:9 a=zZCYzV9kfG8A:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: ahiS0lv6DhfpWtcHGIuk2hQmUZmmWkTY
X-Proofpoint-ORIG-GUID: ahiS0lv6DhfpWtcHGIuk2hQmUZmmWkTY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_07,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_125847_036414_655B152E 
X-CRM114-Status: GOOD (  10.24  )
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

Currently for CCMP256, GCMP128 and GCMP256 ciphers, Management key flags
are not set properly and MIC space is not added based on the cipher used.

This results in unexpected drop of protected management frames in case
either of above 3 ciphers is used.
Fix this by setting IEEE80211_KEY_FLAG_GENERATE_IV_MGMT flag for above
ciphers and by reserving proper MIC length for those ciphers.

*v2:
 - Rebased on ToT

Rameshkumar Sundaram (2):
  wifi: ath12k: fix wrong handling of CCMP256 and GCMP ciphers
  wifi: ath12k: avoid multiple skb_cb fetch in ath12k_mac_mgmt_tx_wmi()

 drivers/net/wireless/ath/ath12k/dp_rx.c |  3 +--
 drivers/net/wireless/ath/ath12k/dp_rx.h |  3 +++
 drivers/net/wireless/ath/ath12k/mac.c   | 22 +++++++++++++---------
 3 files changed, 17 insertions(+), 11 deletions(-)


base-commit: d0bcc5eaaa611aacbffe6b2cc2fb64bfc3bdfcbc
-- 
2.34.1


