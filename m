Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CD9C369A2
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 13:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ttofQOL+WMMFfjJMOx2TVh7aF1mo2VIiAL6x/kLeGKg=; b=zx9vntFtX6PFDvCT8d1JTvl5fF
	6s1WvDK8A4QSxu343P/fJcKzr+elrgIsj2KH9X3EG/j4ndObTzP2hkEhkj1bN6zKpW0+//INo3r1Z
	LhOcdFmHsrAiRBFAWAhSSvpDJ4cuZNwLo5X/vN4+RCdzwBFDmqIb/RZGUlfna4RvrPgy5U12BlqrA
	yEVJK5pDLWYF2QWvPY4Pry70+kWQ/I9FmiJCDFTjlHVWWrHTwzPnaq2T8WxdkDA2TMXv6mdMKsulV
	hYQC240HOki5aXgOKKuws881aa2klwVSjYdCC8ckvW6n+K+XB4OV77EGImPy+liVWu+xOw6c59FDO
	G3QzuoTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2959-00000004Dp8-00YN
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 13:33:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28aT-000000043zc-29nu
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 13:01:58 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538ApV35015100;
	Tue, 8 Apr 2025 13:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ttofQOL+WMMFfjJMOx2TVh7aF1mo2VIiAL6x/kLeGKg=; b=NlFCx+704zdl+tCd
	KVwjuC194480VFjAvWRRE9Z8kJaBZ++RYTQqIl+8sFJzxVSAr1szAT5PeEzKC6Ou
	vcldip/WzgbpY1lJUre8Rfll3Gqu73tGmnY7yu264BQca7+aTqfkQUcqNiN6jmG8
	SDRED7YR6WkMzQgsD/Xnqm5sLjNa/qEmkW0PDyPXIy/xAJp3sFOql6rTUDArMDlW
	PD2TE2SWhGZMUH68yhhJ8vFhGBeNBQ5ps8vXX+Ri7F1VdHe8VmwTpZPYzQcpcWGQ
	CO6Vns8e87r4+XkE5yf7n+7QkGWFcVLXRlYoOi0VcoM7G7EA4AaHuCm0ynwD9CPP
	QzDI6A==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbufu0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 13:01:56 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 538D1ujg011024
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 13:01:56 GMT
Received: from hu-sarishar-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 8 Apr 2025 06:01:54 -0700
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sarika Sharma
	<quic_sarishar@quicinc.com>
Subject: [PATCH ath-next 1/2] wifi: ath12k: using msdu end descriptor to check for rx multicast packets
Date: Tue, 8 Apr 2025 18:31:31 +0530
Message-ID: <20250408130132.2919329-2-quic_sarishar@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408130132.2919329-1-quic_sarishar@quicinc.com>
References: <20250408130132.2919329-1-quic_sarishar@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XuwSweyJsX4T2xzZmjc9vACk8m7Anr2b
X-Proofpoint-ORIG-GUID: XuwSweyJsX4T2xzZmjc9vACk8m7Anr2b
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f51e45 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=nNR53KzduslkgKGKa6YA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_05,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=672 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504080092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_060157_553940_2EBE874F 
X-CRM114-Status: GOOD (  11.33  )
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

Currently, the RX multicast broadcast packet check is performed using
bit 15 from the info6 field of the MPDU start descriptor. This check
can also be done using bit 9 from the info5 field of the MSDU end
descriptor. However, in some scenarios multicast bit is not set when
fetched from MPDU start descriptor.
Therefore, checking the RX multicast broadcast packet from the MSDU
end descriptor is more reliable as it is per MSDU.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hal.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
index d00869a33fea..d961392bb981 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -449,8 +449,8 @@ static u8 *ath12k_hw_qcn9274_rx_desc_mpdu_start_addr2(struct hal_rx_desc *desc)
 
 static bool ath12k_hw_qcn9274_rx_desc_is_da_mcbc(struct hal_rx_desc *desc)
 {
-	return __le32_to_cpu(desc->u.qcn9274.mpdu_start.info6) &
-	       RX_MPDU_START_INFO6_MCAST_BCAST;
+	return __le16_to_cpu(desc->u.qcn9274.msdu_end.info5) &
+	       RX_MSDU_END_INFO5_DA_IS_MCBC;
 }
 
 static void ath12k_hw_qcn9274_rx_desc_get_dot11_hdr(struct hal_rx_desc *desc,
@@ -902,8 +902,8 @@ static u8 *ath12k_hw_qcn9274_compact_rx_desc_mpdu_start_addr2(struct hal_rx_desc
 
 static bool ath12k_hw_qcn9274_compact_rx_desc_is_da_mcbc(struct hal_rx_desc *desc)
 {
-	return __le32_to_cpu(desc->u.qcn9274_compact.mpdu_start.info6) &
-	       RX_MPDU_START_INFO6_MCAST_BCAST;
+	return __le32_to_cpu(desc->u.qcn9274_compact.msdu_end.info5) &
+	       RX_MSDU_END_INFO5_DA_IS_MCBC;
 }
 
 static void ath12k_hw_qcn9274_compact_rx_desc_get_dot11_hdr(struct hal_rx_desc *desc,
-- 
2.34.1


