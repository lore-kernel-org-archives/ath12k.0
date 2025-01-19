Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A3CC02183
	for <ath12k@archiver.kernel.org>; Sun, 19 Jan 2025 08:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BGG4t+s4iK3paJ/XMRx/VzsDzDX0FJzny0wJLFxw5C0=; b=BZe+T/L9PcSdnNVhkyVI4MLQTL
	k67vzlVHjhOm2Nj/JaIPD6I5lcM1z40MTR1M9OI79wkiM+mKp6JsNU7A3rVChKd+qzx6EduFD4aUG
	gY6Uve0BxsqNuHjsv440c4LPXx+GCt4xSMvM2fdw4f96Mmtv/SSUgn0NzPchTQZLhYBdH1wqoMiMm
	3/AEk+93klAfTssCwfJ/1UHJhBz2Rzv2iZeudE3/KrSyLCbbNYQtwPkX3IAFfLFC6RtuqtNFTbFFQ
	LCtjkCEWmYXr613bVCz5D7RtYuPU3oHldy2C6dXqb7VoJCHVI56I+AdZydklR3bVgKNgpvumXx1PW
	BcUNr7Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZQoI-00000003bZH-3qlv
	for ath12k@archiver.kernel.org;
	Sun, 19 Jan 2025 08:37:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZQoF-00000003bXN-40wN
	for ath12k@lists.infradead.org;
	Sun, 19 Jan 2025 08:37:33 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50J6x5Yd025692;
	Sun, 19 Jan 2025 08:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BGG4t+s4iK3paJ/XMRx/VzsDzDX0FJzny0wJLFxw5C0=; b=QrrWw8RjShvrTX4y
	Aj1dNtg+KfqscuPzKto47ZYuDBeZWwbtSXbrpJoYgFeVQ/1Is9oBajmJd3QkDaZE
	sIER/rIBkVlLJJsbJBp3+6SRsnRrHE/MZWWrsCKecBia/J+aqvG3XFfzuZ4RIWxx
	NBqaBE+qEBM2bTGjPOc2vhGvUW4f+rOy1dzm6dqyy99a3POjfsjwRYiCIjrv+3CW
	kILY1zfGwsoEkU4mgW3eSaygLRIvVB3ENMPGPmWlYmPTL6vUMtaezSBqwyeb5rme
	68fXpVlb+S03edCFMd2X8HFjxdx0+1f2CQyc1/wpCU7s9asXWGika+POSdSUYud1
	fDQZbg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44852d1q28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 08:37:31 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50J8bVBh023820
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 08:37:31 GMT
Received: from hu-aarasahu-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 19 Jan 2025 00:37:29 -0800
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aaradhana Sahu
	<quic_aarasahu@quicinc.com>
Subject: [PATCH v10 4/4] wifi: ath12k: Disable MLO in Factory Test Mode
Date: Sun, 19 Jan 2025 14:06:57 +0530
Message-ID: <20250119083657.1937557-5-quic_aarasahu@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250119083657.1937557-1-quic_aarasahu@quicinc.com>
References: <20250119083657.1937557-1-quic_aarasahu@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7Ars4gg9u7ukm_IzQyXkdu94P2ETFSV9
X-Proofpoint-GUID: 7Ars4gg9u7ukm_IzQyXkdu94P2ETFSV9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-18_10,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 mlxscore=0 phishscore=0 mlxlogscore=696
 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501190071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_003731_998232_A905CFF1 
X-CRM114-Status: GOOD (  11.56  )
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

Factory test mode(FTM) is supported only in non-MLO(multi-link operation)
mode. Therefore, disable MLO when driver boots in FTM mode.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 20c8a7bed3db..2dd0666959cd 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1614,6 +1614,9 @@ static struct ath12k_hw_group *ath12k_core_hw_group_assign(struct ath12k_base *a
 
 	lockdep_assert_held(&ath12k_hw_group_mutex);
 
+	if (ath12k_ftm_mode)
+		goto invalid_group;
+
 	/* The grouping of multiple devices will be done based on device tree file.
 	 * The platforms that do not have any valid group information would have
 	 * each device to be part of its own invalid group.
@@ -1801,6 +1804,9 @@ void ath12k_core_hw_group_set_mlo_capable(struct ath12k_hw_group *ag)
 	struct ath12k_base *ab;
 	int i;
 
+	if (ath12k_ftm_mode)
+		return;
+
 	lockdep_assert_held(&ag->mutex);
 
 	/* If more than one devices are grouped, then inter MLO
-- 
2.34.1


