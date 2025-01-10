Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD16FC02181
	for <ath12k@archiver.kernel.org>; Fri, 10 Jan 2025 06:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lE5oaWll4pj2HAGi3zO2G5bEfiFcMQKvWXbTx1w67I=; b=zdQm1AQBCFm8ksP8yy115+2Hla
	BPdHTJ8fSBSQ8CFSAXFMNI3VQfuMtPKGuG/IM6HN8KL44dsNCmEbq3LOPaoa//h3bNrS8pPteNmES
	p+MRvr276BeYTEHi1ttznVPTD4N1x6sZvg9Z7ECUG84Lk514loqztKUKLZ7X7MZGAn3Xqy154/RnV
	L8qq8fSXvKqxsUdBCCCk0rTaTFbpfWqHUbV/yhw8y1HNh9jN+dhBnpgAFWCIOgjiCoLSJjzMBorfU
	ZcnApBJqBPl+UK+/BRsecAX4Xu5tL5knb6MtYb9+iWB6CMikdQSmKY0aAKWSJncfdRPTsxSgmfO/5
	DP6n0SDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW8hT-0000000EHab-2OKH
	for ath12k@archiver.kernel.org;
	Fri, 10 Jan 2025 06:40:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW8GL-0000000ED8q-3Wb3
	for ath12k@lists.infradead.org;
	Fri, 10 Jan 2025 06:12:55 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A2ZakW027939;
	Fri, 10 Jan 2025 06:12:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4lE5oaWll4pj2HAGi3zO2G5bEfiFcMQKvWXbTx1w67I=; b=SEYb/ojvbXm+SKJy
	m9ObxXma6i1ct6N2vw6B4Ha4aahRWJlso6wpSZb+eirAP25bgO/QOJdF+DyuW7nd
	jAlAlhG4Lc+JQfeflOHx8LK/JBdYBxLtvoGFBH42uhSyMt2+s78p732oOl185U1F
	9xwrlWniFubd+gnqqBBvzVRXoplSBBjzOTFgVBjpXuGd1W4zVf+hpvZhxwTH4gR4
	SLuYZB9xnWFiBLyAZA6yqfdv3VMnc4BIW0TaiZ886akql9uYxCSHOoRDgq6WHZUe
	/mvNGek3Db2U3xVnZ7UjECjMKWMsDDcXCzaWmeYNm/HOnvIvYiuvHJe0aGKmIHyi
	jLti5w==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442twbgdfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 06:12:53 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50A6Cqvv007569
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 06:12:52 GMT
Received: from hu-aarasahu-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 9 Jan 2025 22:12:51 -0800
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aaradhana Sahu
	<quic_aarasahu@quicinc.com>
Subject: [PATCH v7 5/5] wifi: ath12k: Disable MLO in Factory Test Mode
Date: Fri, 10 Jan 2025 11:42:24 +0530
Message-ID: <20250110061224.1839547-6-quic_aarasahu@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110061224.1839547-1-quic_aarasahu@quicinc.com>
References: <20250110061224.1839547-1-quic_aarasahu@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aH1UgzrN4cbTUKGL0jI3GxB9YK9WoeJg
X-Proofpoint-ORIG-GUID: aH1UgzrN4cbTUKGL0jI3GxB9YK9WoeJg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=659
 clxscore=1015 mlxscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_221253_889707_C4B5795E 
X-CRM114-Status: GOOD (  11.74  )
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
index d0cf82ca6dae..d80a73bc2f49 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1610,6 +1610,9 @@ static struct ath12k_hw_group *ath12k_core_hw_group_assign(struct ath12k_base *a
 
 	lockdep_assert_held(&ath12k_hw_group_mutex);
 
+	if (ath12k_ftm_mode)
+		goto invalid_group;
+
 	/* The grouping of multiple devices will be done based on device tree file.
 	 * The platforms that do not have any valid group information would have
 	 * each device to be part of its own invalid group.
@@ -1799,6 +1802,9 @@ void ath12k_core_hw_group_set_mlo_capable(struct ath12k_hw_group *ag)
 
 	lockdep_assert_held(&ag->mutex);
 
+	if (ath12k_ftm_mode)
+		return;
+
 	/* If more than one devices are grouped, then inter MLO
 	 * functionality can work still independent of whether internally
 	 * each device supports single_chip_mlo or not.
-- 
2.34.1


