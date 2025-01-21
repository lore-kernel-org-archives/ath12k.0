Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4C5C02182
	for <ath12k@archiver.kernel.org>; Tue, 21 Jan 2025 10:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3DgU8rF22M1g4LnoBk3ORbGdCxYcVwn/z2DjkQM3bQE=; b=QJEeiP6HbU5cZTL3wYoiWwRCSr
	gO76SyISduzbA1BJGiv202wWIDhQoyllw/xtNJcNz2xV66uO3UzFo/ZytnRxi+u9Zut8COcDmcqK5
	tYvQN6WlyyByIVf/1Aph47rfFo88UjVyPlcg+9oxQhIqnDiPuNOZq/HFXdWAHV6TZVDqG6cvuy9Fi
	Qv9ZRD+S41ziyYXNxcmbQ+4rdA69mmlPUXCezurtYpuM0IcTMhxe4Sdx/+vnSE5jNu4jw8QRAZQXG
	pAqcYIKPOMdq5nDBvg/2yYSFq+6gHwMrskwEMRdx69e4OfNmTh/Ks2ETdUO9wU42g5cKNar25+v8E
	/qFMo0ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taBx8-00000007gEM-2LbP
	for ath12k@archiver.kernel.org;
	Tue, 21 Jan 2025 10:57:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taBml-00000007dnu-3Oa0
	for ath12k@lists.infradead.org;
	Tue, 21 Jan 2025 10:47:09 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L9HfNC006613;
	Tue, 21 Jan 2025 10:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3DgU8rF22M1g4LnoBk3ORb
	GdCxYcVwn/z2DjkQM3bQE=; b=L2+P/HSh1XlpfUih6n0GIMgvDXAr90fyvoxqjb
	NKIReSFHY7PMl3yScjOnVLXrhUqVjqy+hCiV37uK3LCY2QmAL6Dg1l+bBUgBC7vc
	v2bFpRAgDQuGwyHrGse68PLOhshN2xSwyE+qVRNU6xnW4tUVO2+HPjL1ZKzDd3TU
	pBaa95sLUCqI7MHx2d9HAhNlDFl0IZSZ+5d2IEY++ledvNfaj2DxMm0Vsgnaolw0
	QcCzNZkrABFCCnFNtsDKipdYxu8lwqNO+MCqlPjiPE1W+Iq7aFaKn0bT9RjQwj9/
	VK5UMBc5MFnnBpb1AIoTk71ixruwohkKRHIhBBzWKmchhxbQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44a8tugb5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 10:47:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50LAl5Ij014183
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 10:47:05 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 21 Jan 2025 02:47:03 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v9 0/4] wifi: ath12k: add 11d scan offload support and handle country code for WCN7850
Date: Tue, 21 Jan 2025 18:45:39 +0800
Message-ID: <20250121104543.2053-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yT-YI8di6l67YVCio2vIIW0fjRe1dtv6
X-Proofpoint-ORIG-GUID: yT-YI8di6l67YVCio2vIIW0fjRe1dtv6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_05,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 spamscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=926 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_024707_971729_F6F88211 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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

This patch-set mainly does four things:
1. Add handler to send WMI_SET_CURRENT_COUNTRY_CMDID to firmware.
2. Implement 11d scan offload, and report country code to firmware by
WMI command WMI_SET_CURRENT_COUNTRY_CMDID.
3. Use WMI_SET_CURRENT_COUNTRY_CMDID to set country code for WCN7850.
4. Store country code, and update it to firmware after device recovery.

With this patch-set, WCN7850 can do 11d offload scan and update country
code to firmware successfully.

Note: This patch-set is an old patch-set in public review written by
Wen Gong. Just resend it for him.
Link: https://patchwork.kernel.org/project/linux-wireless/cover/20230914090746.23560-1-quic_wgong@quicinc.com/

v9: update copy right in patch #1, #2, #3.
v8: rebase on tag: ath/main(ath-202501172342).
v7:
    1. rebase on tag: ath/main(ath-202412191756).
    2. rewrite commit message for patch#2.
v6: rebase on tag: ath/main(ath-202410161539).
v5: rebase on tag: ath/main(ath-202410111606).
v4: rebase on tag: ath-202410072115.
v3:
    1. use wiphy::mtx lock instead of adding a new lock(patch#2).
    2. rename struct according to wmi naming convention(patch#1, #2).
    3. update copyright in reg.h
    4. modifiy patch#3, #4 due to struct name change.
v2: change per Jeff.
    1. change alpha2 length from 3 to 2.
    2. change wmi_11d_new_cc_ev to wmi_11d_new_cc_event.

Wen Gong (4):
  wifi: ath12k: add configure country code for WCN7850
  wifi: ath12k: add 11d scan offload support
  wifi: ath12k: use correct WMI command to set country code for WCN7850
  wifi: ath12k: store and send country code to firmware after recovery

 drivers/net/wireless/ath/ath12k/core.c |  34 ++++-
 drivers/net/wireless/ath/ath12k/core.h |  17 +++
 drivers/net/wireless/ath/ath12k/hw.c   |   8 +-
 drivers/net/wireless/ath/ath12k/hw.h   |   3 +-
 drivers/net/wireless/ath/ath12k/mac.c  | 167 ++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/mac.h  |   9 +-
 drivers/net/wireless/ath/ath12k/reg.c  |  72 ++++++++---
 drivers/net/wireless/ath/ath12k/reg.h  |   4 +-
 drivers/net/wireless/ath/ath12k/wmi.c  | 160 ++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h  |  40 +++++-
 10 files changed, 486 insertions(+), 28 deletions(-)


base-commit: e7ef944b3e2c31b608800925e784f67596375770
-- 
2.34.1


