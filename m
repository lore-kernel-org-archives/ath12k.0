Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE3AC761A6
	for <ath12k@archiver.kernel.org>; Tue,  4 Apr 2023 03:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kHYWGgKomepnB90FuolGJFtJySypBt4GCqpEXFDvqws=; b=01e3IDSLdiRZgH
	Ll7Qu2zmS3i/Ebz+Ik9p/sg1+mNIqMygfmRs9iisdcCzV70sccA5qZwYw5EHUb+CZac/MwSw/eqt4
	tDLQ6ab9+cL6R6I5V4Fdyh6t4SZDKAHJ/Ll+2qjEHWuqenSkLLYCezp0vRtZRFQJJp+VEpSm7immF
	/6DBt2EmDT4R0Tm/tuJRbVO7Rko99iPSKLD7cGnKu5cpkFOYpaWUXfffln0/7un4PHNq5OAak3d/w
	w3vYuCSlAkHfLNOxI+sTbTJ3w3UwLmf7+Z42cR7Q4KZIe58MRTrfd3H/gDQhN89lQ37+oUcEsSTDk
	ngcxT/XO/+bythOj3QVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjXEW-00HVWQ-2Q
	for ath12k@archiver.kernel.org;
	Tue, 04 Apr 2023 03:21:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjXET-00HVVa-29
	for ath12k@lists.infradead.org;
	Tue, 04 Apr 2023 03:21:18 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3340Z4SE003797;
	Tue, 4 Apr 2023 03:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=Sd5mX7XeoUv7hZO+VDdvi6cAe4xVsd6e8G/Lh2wv9fg=;
 b=au9Ji1VJA4mSJfVJt1eS33sMzOK5K5hpBBfpQGPBlPGbVlpNPJSU9wn6o3Kx+dNd3HCw
 Ne/GLw/qjSGBYCrCJ6h8xAc5lJDAltJYqSl4he3o0EydmZf1FJXcmXiQWEsUaPFBiTX4
 7wRDyDsfq70bVwfRRqFYf8t8lehuWjpo9XfJMErqd9gWCW6z/etFi+MXG1yrb0mNcMuA
 ergWGMBxp8gNyLFAWU8ArB+Ryjafx/Sr73K6J2H1qcHcVdoWGXgf0xCGqIJek8hQCX19
 RxVyQ+O22FdnZngHspzpF8LamL6e5GKzC7ZbDkr76UWTASjDT8gtnGGgUeaJJ/XOm5TK +A== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pqtdnaj3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Apr 2023 03:21:16 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3343LF8D012487
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Apr 2023 03:21:15 GMT
Received: from cjhuang2-gv.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 3 Apr 2023 20:21:14 -0700
From: Carl Huang <quic_cjhuang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_cjhuang@quicinc.com>
Subject: [PATCH 2/2] wifi: ath12k: set PERST pin no pull request for WCN7850
Date: Tue, 4 Apr 2023 11:20:57 +0800
Message-ID: <20230404032057.3236122-3-quic_cjhuang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230404032057.3236122-1-quic_cjhuang@quicinc.com>
References: <20230404032057.3236122-1-quic_cjhuang@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VMfu4O8H-LTIXAN3INycBZnsq-SSHL6t
X-Proofpoint-GUID: VMfu4O8H-LTIXAN3INycBZnsq-SSHL6t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_19,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxscore=0 mlxlogscore=968 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304040029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_202117_821536_A27EF189 
X-CRM114-Status: GOOD (  16.96  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

The PCIe PERST pin is currently pulled down on WCN7850 and it causes
some power leakage.

Fix it by notifying firmware not to pull down PCIe PERST pin in QMI
message for WCN7850.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hw.c  | 3 ++-
 drivers/net/wireless/ath/ath12k/qmi.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index cc47cbf93f6b..5991cc91cd00 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -962,7 +962,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 
 		.hal_ops = &hal_wcn7850_ops,
 
-		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
+		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01) |
+					   BIT(CNSS_PCIE_PERST_NO_PULL_V01),
 	},
 	{
 		.name = "qcn9274 hw2.0",
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index ad87f19903db..df76149c49f5 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -189,6 +189,7 @@ struct wlfw_host_mlo_chip_info_s_v01 {
 enum ath12k_qmi_cnss_feature {
 	CNSS_FEATURE_MIN_ENUM_VAL_V01 = INT_MIN,
 	CNSS_QDSS_CFG_MISS_V01 = 3,
+	CNSS_PCIE_PERST_NO_PULL_V01 = 4,
 	CNSS_MAX_FEATURE_V01 = 64,
 	CNSS_FEATURE_MAX_ENUM_VAL_V01 = INT_MAX,
 };
-- 
2.25.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
