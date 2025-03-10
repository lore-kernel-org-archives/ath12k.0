Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34ECC282DE
	for <ath12k@archiver.kernel.org>; Mon, 10 Mar 2025 20:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5oUX7Uf0XBJGHkWsmznzvbRQqVZNW6xVAGMulJmOaps=; b=Xh3bgK7ij6rXH1m1OKNFVTlerZ
	XX5JYaey4WyEYJpCSnH23AHyCJiUVQZHch3W20utxtpzWbDMhY3T1ntlv4JWpR2s/gNVmUZo8KfkP
	E2gdVP3BC2VpOAmgorNIxIQhsFPMRr9+ibgT61Pt2zQiwPdoJ7PBNGTr8D2QbL1uFEQ0JclMa1xSO
	0aP6GetD5ulAiTjtHMCrRI8/pcWBwHYxVY2Sf/zC01RKqx/WqSz0hneD89N/hAvmnbu+5h3RVgi0n
	BdYsFFC11GLPZA5zsrST4Xw8j2UBj6J4XavjG2APcnpEqpPG1HPL9SFgUaqWKoNCPc9kyxK0rX/XU
	3J+9Gr/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trjV7-00000003pMy-2nYl
	for ath12k@archiver.kernel.org;
	Mon, 10 Mar 2025 20:13:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trjKl-00000003nk6-0bCY
	for ath12k@lists.infradead.org;
	Mon, 10 Mar 2025 20:02:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A9Lfin006483
	for <ath12k@lists.infradead.org>; Mon, 10 Mar 2025 20:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5oUX7Uf0XBJGHkWsmznzvbRQqVZNW6xVAGM
	ulJmOaps=; b=dSENz7Un/Ph8cWTiN7COayg0Yxh8eVcWO7uAB7S613LDemZeyS2
	KsQdniwJ3bnBRPC4naTmtxv/0o7lP3BhelWYo27HSbAZGcnnP7+5Werr0OPBxrGm
	hHaQPbFPJb/VniJ8j0IswNZ6o6doOfP2uPMYVN231ZkVsWeB5YJL58GzgrdsFbo6
	OCclPTP9GiU/H0/Inn/3s+OlailqkOH2ziESGvN9Ht/OAmSNV4DrfwA3vuKgG5R+
	NWVOb/Ty/P4x0eKJI+YDxb9D+E8Irj/lFTldBGNH+JxPLsinNGgWdVwv4v+gOy1V
	xakt9pUGLfhh69LLE3mq1phEZlXQX+6wblw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ewpp13n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Mar 2025 20:02:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-224192ff68bso70686925ad.1
        for <ath12k@lists.infradead.org>; Mon, 10 Mar 2025 13:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741636961; x=1742241761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5oUX7Uf0XBJGHkWsmznzvbRQqVZNW6xVAGMulJmOaps=;
        b=FXuX3GweSV5IiEZHRFnuxPMSRM3Zy3Vu1JanB1DXaIbsG546xgzQH5EmtcCbYQ1AZd
         U9DFEzkf8dWyOU6jOzI6iB/VcESUE0n+HFDhvI3q1E0+3QCF20pse4gvw2PjTUpg0Rkl
         KfkWKUiqAWl77mB0q1eOFV5Rlmo4YNhn5iaYRfM6gttAfqTK69YRFJt0Z1ZVzoz4ncac
         pvrhu8CcOGxgA+dPCLqE/iRktzvugg2t4YYj6iCwq/22U8Akg7DberdHYKnHGwJKRsJB
         kbdyh8LnTp+qhNvD7hanyLxGGIFGACKPslPoCfnh5wFdn7kjs54BqCcKldq3AZAyw+9P
         QIfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeSYfrhzrlNdbv6T8IrIf+IeOCcp8uwRPGf0/VZuD322TeGPtHPtN+YzSOs79h85KXRKZMWe4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzT+OUmx0Nlsd7F6w8dMMANDE1oa3fVytf329x5puHkLs3enhuN
	YfFVFU404qUT9Rbe0wVK51WbAucvL1jjQnIqDZ/UG6DsGI8aDy5Y3fqXxV20NZCA1Qow9Yh+LoW
	J5m80Npc385jgKay8DUG171oo59nPlUGgOv8UAFKSTDOC51c+Gw/xp1pMoF0t
X-Gm-Gg: ASbGnctw99x2bOIVYsabeGUF64sZTwPgVWgKFtZAzeeiD6B7IgLiXEF2lNlTyFdITE6
	mUm316B9y3LOrTA6BKkBzRbwMuSVmFTkqc+JKsSDP+0tLH2Wi0ZQP4SoyQaoIaeMmLSaTVbW0X8
	Jkwl+TQHsza7LbcYKSV0qoYbUfo08iIMVYverI3mnWK4LAcEfHU9rO9pjup94n63ay7HTwkU5Eq
	EkFdLvP3276jwWgJw+yFIfiTxlW9t97Aj9sfoBhmgjRWnLfTzLpOpCY/huI0shJ7aGJw9/smkIl
	bRdlB9DIz9sVrSMqqefa220mKwnw3QHLTujfYspucTjOxkY8H3hftCO/epbKKg6dsN9SMcM=
X-Received: by 2002:aa7:830c:0:b0:736:5486:781d with SMTP id d2e1a72fcca58-736eb87c1f4mr1113764b3a.19.1741636960907;
        Mon, 10 Mar 2025 13:02:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHccAPmFHmrmLUpz0x0Yfyl2POultnDTom8ngSQxyThbFZtUXEn6Y2yz7Q9egfA1gSiBqweeA==
X-Received: by 2002:aa7:830c:0:b0:736:5486:781d with SMTP id d2e1a72fcca58-736eb87c1f4mr1113742b3a.19.1741636960491;
        Mon, 10 Mar 2025 13:02:40 -0700 (PDT)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736cbe3fb3fsm3730419b3a.83.2025.03.10.13.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 13:02:40 -0700 (PDT)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
To: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org
Cc: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v4 0/3] wifi: MBSSID support in MLO
Date: Mon, 10 Mar 2025 13:02:34 -0700
Message-Id: <20250310200237.652950-1-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IuFfqc40r_YDgdNrkDOK3PGkWKDz8rXE
X-Proofpoint-ORIG-GUID: IuFfqc40r_YDgdNrkDOK3PGkWKDz8rXE
X-Authority-Analysis: v=2.4 cv=C5sTyRP+ c=1 sm=1 tr=0 ts=67cf4561 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=Vs1iUdzkB0EA:10 a=AlxVFHAfxkVxK-neCP4A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_07,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=371 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_130243_202659_35F5ECBA 
X-CRM114-Status: GOOD (  11.47  )
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

During non-transmitted (nontx) profile configuration, interface
index of the transmitted (tx) profile is used to retrieve the
wireless device (wdev) associated with it. With MLO, this 'wdev'
may be part of an MLD with more than one link, hence only
interface index is not sufficient anymore to retrieve the correct
tx profile. Add a new attribute to configure link id of tx profile.

Similarly, storing 'vif' of tx profile inside 'vif' for nontx
profiles is not sufficient for MLO, instead store tx link data
inside each nontx link data structure.

v4:
(1) Pre-requisite driver patches are merged in wireless-next
    hence this series should apply cleanly now.
(2) Refactored possible driver changes into a separate patch.
(3) Found a change missed in HWSIM causing compilation errors,
    replaced mbssid_tx_bss by tx_bss_conf and confirmed
    successful compilation.
(4) Replaced vif->bss_conf->ema_ap by link_conf->ema_ap.

Aloka Dixit (1):
  wifi: ath12k: pass link_conf for tx_arvif retrieval

Rameshkumar Sundaram (2):
  wifi: nl80211: add link id of transmitted profile for MLO MBSSID
  wifi: mac80211: restructure tx profile retrieval for MLO MBSSID

 drivers/net/wireless/ath/ath11k/mac.c         | 10 ++-
 drivers/net/wireless/ath/ath12k/mac.c         | 35 ++++++---
 drivers/net/wireless/virtual/mac80211_hwsim.c |  7 +-
 include/net/cfg80211.h                        |  2 +
 include/net/mac80211.h                        |  7 +-
 include/uapi/linux/nl80211.h                  |  6 ++
 net/mac80211/cfg.c                            | 64 ++++++++++------
 net/mac80211/ieee80211_i.h                    |  2 +
 net/mac80211/iface.c                          | 73 +++++++++++++------
 net/wireless/nl80211.c                        | 14 ++++
 10 files changed, 158 insertions(+), 62 deletions(-)


base-commit: fc56639937ce95a73c9876e39f8d18d1a8dd6a95
-- 
2.34.1


