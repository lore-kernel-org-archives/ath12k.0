Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504B9C25B10
	for <ath12k@archiver.kernel.org>; Sat, 11 May 2024 01:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VDFn2CTwYPhigcYBfpqAw5WTtT7muA0SFFCOYK3kUhY=; b=u1rSOJi5yz4dK5y1SKKPcDBWnn
	++9CuPBZZhmO+wHhjmgRbK26uNoK+C+DfoS4tcCPZ+0B31wrFs/I7SES4UocquBJoaDzFQqd9TXa0
	+Q+csuaPO+y4G6oK3DENoplgDVYh+5KOd/cDwcS3/ciom9f/dXewTwp+UeZ0d2OY7JEKkD3rPevF7
	3a5w1OJHrUxgisbCybrfQsBlbnWz6RqgFQLaJ6s+khdFozzqCESqtQPaaWjH50T4Tt3L113QwLEpF
	7ZyM81gLd2xAIwGiu8fEqryrs59uV9pqzuZ4jLfQZQ9e2xbrkrrd8+LnH7lYb/S1XckyHpCKBIVnX
	LVS0DsvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5bfi-0000000713C-00MY
	for ath12k@archiver.kernel.org;
	Sat, 11 May 2024 01:37:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5bfc-00000007127-3vLc
	for ath12k@lists.infradead.org;
	Sat, 11 May 2024 01:37:06 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44AE15dx009431;
	Sat, 11 May 2024 01:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=VDFn2CTwYPhigcYBfpqAw5WTtT7muA0SFFCOYK3kUhY=; b=m6
	omZQYdS8LRQ5hbTnWPWUcqg3sGXXXZn3IcVWkhVKiXC1QEWZEZs+tE0buw7A5OYG
	YALqYC4QJetvjHNMwnqLKHc1Uq6F/WibsjEP9uX40+/ouxasL1JUWMCBMSSZ1Xjm
	BQIBy/sq91E9EgbcFzpyK/RAl2VFqbjdyuOffPAnZHNHv06QVX1b2mjacWUoIF8x
	YbD9YVWT+xMgfBLyjewdhhbTA3bIFG4ZqYfJAnWBrGJ+wC6nCHzAioizqNPPzSi3
	ZMUda6yzA7Be0LeJJEyjgy3oBCMANPKn0cCQGKiNYhRzMcEP2ceXf3Xi1cIYLLZA
	zspzl8oBs32W7xI9x19A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w2asps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 May 2024 01:37:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44B1b3qT010687
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 May 2024 01:37:03 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 10 May 2024 18:37:01 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 2/2] wifi: ath12k: use correct MAX_RADIOS
Date: Sat, 11 May 2024 07:06:44 +0530
Message-ID: <20240511013644.3103905-3-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240511013644.3103905-1-quic_periyasa@quicinc.com>
References: <20240511013644.3103905-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SYq-ErkQtdXcLO2E9nwLTHXbU7Jgk52i
X-Proofpoint-ORIG-GUID: SYq-ErkQtdXcLO2E9nwLTHXbU7Jgk52i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_18,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 suspectscore=0 spamscore=0 clxscore=1015 mlxlogscore=920
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405110010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_183705_005284_3335A563 
X-CRM114-Status: GOOD (  11.46  )
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

The current value of the MAX_RADIOS define is 3. However, this value is
incorrect as the maximum number of radios supported by all devices does
not exceed 2. Therefore, the MAX_RADIOS define should be modified to 2.

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


