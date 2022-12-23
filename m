Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BFAC4332F
	for <ath12k@archiver.kernel.org>; Fri, 23 Dec 2022 05:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N6YYs9hBeS5xIx4cpz52nLKOpC+TEAqJu6koaVtcXmE=; b=DFArskpCxQc5Rb
	Z6JZnPq8DQbjpyIpitGlg4XWXuREXIIT42n5R+6Xr47g/vx6D7m+J4b+L1p4txUu/1w6tGLpr6qir
	i5vhN75s6J+A5/Z+pB9MPLt6int9EehRKwaEAYYnPr62eOSU2j7xVigoKFSg2UnT+NaLByZcK0TgO
	MLHnHcoCvER4UaA0Eavt0vaPwfokUsgQ83JmW4nh3g0NWKuKxwiqHGosg20j+Lfny9GrHjEeGVwZi
	7JZmE7JvPF+96+CyIxyJnT7R6biXXuDrh0V4xrZ8g6Tu8tn3slktB/FjXIF9+5wCKI7l6ANBMl+47
	BkCO7FYyT9RHi+KRTMBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8aHP-003jfS-J3
	for ath12k@archiver.kernel.org; Fri, 23 Dec 2022 05:07:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8aHM-003jbr-Ln
	for ath12k@lists.infradead.org; Fri, 23 Dec 2022 05:07:34 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BN4JdPo005663;
	Fri, 23 Dec 2022 05:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=2lrYTj5clhh/B8Isy7PGKXBMGFPT+yUVSbxPjX25+FQ=;
 b=jUibFdl3T01dGoi9hSzsyFORkOyQSjHo64noy9ubJtFj3Xbs+HsDP+u7JbhqbrL+uKpC
 tW+HO5VJbUuQ3b4eJAmvwXZ8yimNXgIB2GQR+h+gRKNgVqbfPDjejaz41oJUuZOsX8qo
 8oq0uaWL/l5wQ6gTQfMTUbAh5Yzwbbw/cf2MQieSnvG8fpsENksJ8bRto4a4VXExdrts
 HIokGSgTb+X9DleZJ57f36OA73dRRxBQAIBPNfZu1Hra03wb2s5sldtXWt//IZE8dpDm
 KHQ1d6LSFz0A3+R/lA7wE5AcOWL9E7/fisxOEtZ4bqC6seasDyWYXxpc4GqLsVVGm1VB dg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mm2brvbra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Dec 2022 05:07:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BN57T9e027151
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Dec 2022 05:07:29 GMT
Received: from dinek-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 22 Dec 2022 21:07:27 -0800
From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>
Subject: [PATCH 1/3] wifi: ath12k: Fix incorrect qmi_file_type enum values
Date: Fri, 23 Dec 2022 10:36:44 +0530
Message-ID: <20221223050646.27785-2-quic_dinek@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221223050646.27785-1-quic_dinek@quicinc.com>
References: <20221223050646.27785-1-quic_dinek@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9Nee3n-bs7UoXbhRDezxsYVLu8i54RAz
X-Proofpoint-GUID: 9Nee3n-bs7UoXbhRDezxsYVLu8i54RAz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-23_02,2022-12-22_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=850 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212230044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_210732_911728_F2769C76 
X-CRM114-Status: GOOD (  14.05  )
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

Enum value for caldata in QMI_WLANFW_BDF_DOWNLOAD_REQ_V01 is set as 1
which is reserved for BDF_TYPE_ELF. The expected qmi_file_type value
for caldata is 2.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/qmi.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index adbdaf727051..37af9674b89e 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -44,10 +44,10 @@
 struct ath12k_base;
 
 enum ath12k_qmi_file_type {
-	ATH12K_QMI_FILE_TYPE_BDF_GOLDEN,
-	ATH12K_QMI_FILE_TYPE_CALDATA,
-	ATH12K_QMI_FILE_TYPE_EEPROM,
-	ATH12K_QMI_MAX_FILE_TYPE,
+	ATH12K_QMI_FILE_TYPE_BDF_GOLDEN	= 0,
+	ATH12K_QMI_FILE_TYPE_CALDATA	= 2,
+	ATH12K_QMI_FILE_TYPE_EEPROM	= 3,
+	ATH12K_QMI_MAX_FILE_TYPE	= 4,
 };
 
 enum ath12k_qmi_bdf_type {
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
