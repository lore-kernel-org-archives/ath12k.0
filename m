Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA09C54E66
	for <ath12k@archiver.kernel.org>; Thu, 14 Mar 2024 02:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AF+YixauiBvNx6Jv7nypnceLeuDXIqSHpxLS02SFiXE=; b=LwAWp9K6PxXHbZM2lI2MjduZwf
	ph/WKtUT5sBlmTQCc+j6k06IXkqB8xcOFLoMNxdFP7f5q3q/fGa1n7mlkmmiajN3Ior2jNEyoPpoQ
	qrZxk/VGNl/nraMYNmULnUAJMN4phQfNhsUdzqKXQpcnoqi/NnfEDT04OHwp9GYZhgtoBTW0FbNuo
	M7fCGNGGLmd/TIWYY0ydHIlPm9+/Z/cHUlaPLM1uhj0kIHGfqyi+XOHI0+UIgnGBZomM5fCLOkBoN
	1EYO6IvR+GI6YfiK3bmgbIqM55bGiBZ43/RcarfU5rYpxVK+4rs+uZCfKIJ3etUQVDyTx993jSx1F
	S+3BPvxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkagI-0000000CfII-391e
	for ath12k@archiver.kernel.org;
	Thu, 14 Mar 2024 02:18:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkagE-0000000CfGW-3v2c
	for ath12k@lists.infradead.org;
	Thu, 14 Mar 2024 02:18:52 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42DNUCf2007946;
	Thu, 14 Mar 2024 02:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=AF+Yixa
	uiBvNx6Jv7nypnceLeuDXIqSHpxLS02SFiXE=; b=jOY5WsXq5MeLyBROSNgZ1qz
	2k76ZuqK335X/frx1Yau3cS+g6MDPjMTwFA1KNUBqNIn8y+lgwmVFvGz6XIdZsDH
	qNGa1B9SutEQu8LGjhw1KUV93QbMQcgZVdxaD8Qhi+8isWbEL1ftX4Lj0aG6gwAq
	zu6puYLhdvlKjhkYoPk2lRPKel4vPRW+Zo7Bk7uah6aQ3yacALcGFu++QK8OmgX7
	sshicTK+zMdTcBKEc6mhf5YZAPfQnnSPbRNzIz4ZIv5ZqwuWBeWrAT4meIDzvqQn
	MD3yq3V2KWmL65Y7VjBlQsiP+AzG+mLXtYpbpOQSG/EDPOu4GKcEN9AQWIVOSgQ=
	=
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wuc5f9qy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 02:18:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42E2ImB8028585
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 02:18:48 GMT
Received: from Mayan.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 13 Mar 2024 19:18:47 -0700
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH] wifi: ath12k: remove duplicate definitions in wmi.h
Date: Thu, 14 Mar 2024 10:18:30 +0800
Message-ID: <20240314021830.305021-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tJwJ1WpBwyOlKFkqc02K9fFhnRIKU72T
X-Proofpoint-ORIG-GUID: tJwJ1WpBwyOlKFkqc02K9fFhnRIKU72T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_11,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=874 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403140013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_191851_439811_306AA280 
X-CRM114-Status: UNSURE (   8.85  )
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

There are some duplicate definitions in wmi.h, remove them.

No functional changes, compile tested only.

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 103462feb935..eb9a4d5aa44c 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -164,10 +164,6 @@ struct wmi_tlv {
 #define WLAN_SCAN_MAX_HINT_BSSID         10
 #define MAX_RNR_BSS                    5
 
-#define WLAN_SCAN_MAX_HINT_S_SSID        10
-#define WLAN_SCAN_MAX_HINT_BSSID         10
-#define MAX_RNR_BSS                    5
-
 #define WMI_APPEND_TO_EXISTING_CHAN_LIST_FLAG 1
 
 #define WMI_BA_MODE_BUFFER_SIZE_256  3
@@ -4776,8 +4772,6 @@ struct wmi_probe_tmpl_cmd {
 	__le32 buf_len;
 } __packed;
 
-#define WMI_MAX_MEM_REQS 32
-
 #define MAX_RADIOS 3
 
 #define WMI_SERVICE_READY_TIMEOUT_HZ (5 * HZ)

base-commit: ffd4e60352172cc167ff74e8bfd8a331a5830013
-- 
2.34.1


