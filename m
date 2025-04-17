Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86624C369B2
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 04:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KP2qdl9EEZIc7isxL8BESvagtCuONIO4FtHV7HmtSQ4=; b=3S3HrrOTa2u37fV8sBwGqYUKCp
	Jfdyn4wLuhgohYoPrubr9as0fx5W1oBxaqaNMUqrqcyAQNUpgXpuzDUHdO79m7Fm1zVC9O9tQsSKb
	YpQ09avde9H6VsOSiOeV7HA7SUHn1vfclZN7uBUyOLJ64uxOKe5fKH3XJUFmiDlpv9OOCogcWQLGc
	iclxgriCiZeBE/E3SXjdBZvD2KGyW7t1TFngs8C1TBCxcZDqLQbDb4dUDDCAwG2Tgk3Jg70HdqeTq
	XEnaK4hK6e/bi03ONpilwpfqxcWSmE1zphPEQ1ggkvgpCNCV3+LSNvRZSXSFI2dXPgd1ovUeGX0xz
	a1SLCNXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5HJg-0000000BiiF-0ldw;
	Thu, 17 Apr 2025 04:57:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5HJd-0000000Bih7-2XFz
	for ath12k@lists.infradead.org;
	Thu, 17 Apr 2025 04:57:34 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GMAoQT020755;
	Thu, 17 Apr 2025 04:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KP2qdl9EEZIc7isxL8BESvagtCuONIO4FtHV7HmtSQ4=; b=e1IZjLHjENMmj3py
	6WMVAzHTB7gQQ73RqhkZUryRG8ai5J4lQS6P7WdMH8KhpU/2djrWlt9dyBp1dtpc
	svfUWYdEm3BOOuH3g99pa6xSL2j3Wj4PuHrNUKqMwjwFKJubEd72E54BTgW72dAp
	u8fZkfskt1GYoQcgHCGyjRNGkHaM0pTztOiz2g/hM3sAuta/9Gz3uFlEW9jPfGa+
	FjCDinIqcaLgiVUam9Te0c8nzwqAn2GVM63Jc0lt1fTs29DVzN/jyehjwX9aZ54e
	WsQ7Eher6QVgUKE008TmWLROV2jGuFSj7eGh0RBx4acT7FLChO5uXElz890tSXpj
	224h6Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpwfrh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 04:57:31 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53H4vV9o029891
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 04:57:31 GMT
Received: from hu-sarishar-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Apr 2025 21:57:29 -0700
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sarika Sharma
	<quic_sarishar@quicinc.com>
Subject: [PATCH ath-next v5 1/6] wifi: ath12k: enable wiphy flag for MLO station statistics support
Date: Thu, 17 Apr 2025 10:27:04 +0530
Message-ID: <20250417045709.770219-2-quic_sarishar@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417045709.770219-1-quic_sarishar@quicinc.com>
References: <20250417045709.770219-1-quic_sarishar@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: M93O-jU91VywRlPXh1_KDsfgKlbEHqIH
X-Proofpoint-GUID: M93O-jU91VywRlPXh1_KDsfgKlbEHqIH
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=68008a3b cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=aaRn59fMbiCMzwTV-5YA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=979 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_215733_643867_70F1514F 
X-CRM114-Status: GOOD (  10.25  )
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

Set the WIPHY_FLAG_SUPPORTS_MLO_STA_PER_LINK_STATS flag during
hw_register() call to inform upper layer that the driver supports
the per-link station statistics.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index f09abe81cc77..10d4a2166915 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -11461,6 +11461,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	 */
 	wiphy->flags |= WIPHY_FLAG_DISABLE_WEXT;
 
+	wiphy->flags |= WIPHY_FLAG_SUPPORTS_MLO_STA_PER_LINK_STATS;
+
 	/* Copy over MLO related capabilities received from
 	 * WMI_SERVICE_READY_EXT2_EVENT if single_chip_mlo_supp is set.
 	 */
-- 
2.34.1


