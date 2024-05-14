Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950FEC04FFE
	for <ath12k@archiver.kernel.org>; Tue, 14 May 2024 06:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JD08dljXpGdNnYSrWwShIFk5TxQguWFPrERl/lM4j9A=; b=qZHX7KLEIQuPFB0w2L4zMuOa9n
	t/EHx9odxHw1ts0kAcBxZN6gco94qitj4AIRhbRP01DQiCnEg6IPK21Z5c/AeM8OqpkMXX7soIB1T
	jkgNxxuVeZL/07VTkVS1K/L1xMWn3JuWjZY+CjFlV7KDLG60g8E7PDEFwca2ArfHkCU+GjXqnep3T
	+O46JGFh2KsOZ2qPAgd0rx/v80B/Js+gFI5/eGZPnR2CEg9yABk12BbEKsiUEuJFfowNIaJSJWT9m
	53AaAuvCSQ+y3nWky/MHIH77iG+diGSdTp4ohFkKCYhsX0R3PkClxUO4OxPTBrih6Hd+O7SRdMHJh
	9mSPSWsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6lkL-0000000F7pG-0wgf
	for ath12k@archiver.kernel.org;
	Tue, 14 May 2024 06:34:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6lkH-0000000F7oD-3I7A
	for ath12k@lists.infradead.org;
	Tue, 14 May 2024 06:34:43 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DJ9wuL005298;
	Tue, 14 May 2024 06:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=JD08dljXpGdNnYSrWwShIFk5TxQguWFPrERl/lM4j9A=; b=cr
	yRYZMX+SyD0NOeGBcUSa/glF5jLZFKh5DdJnwn+MPpnAcxvLwznEANxdeRyLH9S8
	3gA2s4/OCpOePLUKIshrnAF2xDqzCPlJq3/e1O+VxI2WRzm/TiId5dnrTdHDH59R
	zamjccWf21uJilXyvaOYiaKQ1l/7LcuuIdYPXN1q6L/NMJtDQleiMyYq7a5CkyjE
	qgKZdQM7hd7bNO63V6RVNsnCanyNbywP1oNurk8+ql9ZrB5/1XhAjvvreMOrYeue
	hbT1RMLaaGcdEIFutEXxGQZsTVMujAf1ngTbE+1HYGbVd/3O4aYKOVbvZxNXzD/S
	yp6rYE6456IDM8bTRceQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y21uhdamd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 06:34:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44E6Yd2Y013651
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 06:34:39 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 May 2024 23:34:37 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v2 2/2] wifi: ath12k: use correct MAX_RADIOS
Date: Tue, 14 May 2024 12:04:12 +0530
Message-ID: <20240514063412.3483723-3-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240514063412.3483723-1-quic_periyasa@quicinc.com>
References: <20240514063412.3483723-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: J09dl7X07-yF5lioKL81uTqNL6GZQlzS
X-Proofpoint-GUID: J09dl7X07-yF5lioKL81uTqNL6GZQlzS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_02,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 spamscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405140044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_233441_874327_6B37AD9B 
X-CRM114-Status: GOOD (  12.02  )
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

The current value of the MAX_RADIOS definition is 3. This is incorrect
because no device supports more than 2 radios.

An incorrect MAX_RADIOS value can lead to:
 - unnecessary memory allocation for pdev related entities.
 - invalid pdev id validation.
 - Misconceptions for code readers.

Therefore, modify the MAX_RADIOS definition as 2.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 496866673aea..27bec3800bff 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -4770,7 +4770,7 @@ struct wmi_probe_tmpl_cmd {
 	__le32 buf_len;
 } __packed;
 
-#define MAX_RADIOS 3
+#define MAX_RADIOS 2
 
 #define WMI_SERVICE_READY_TIMEOUT_HZ (5 * HZ)
 #define WMI_SEND_TIMEOUT_HZ (3 * HZ)
-- 
2.34.1


