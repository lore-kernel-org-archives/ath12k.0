Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933CACD128D
	for <ath12k@archiver.kernel.org>; Fri, 29 Mar 2024 23:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btMEj1aDrdTcd3Zv9FcYOvSp4BckjwM0F4bigfeZiFI=; b=rfYcwJCf6G+JMpmVj7O1EYz6DZ
	Vop0N/tGa9roNtgXxIRlkkf4sR7IgPj7FoOSfWNgD29fZg0AHFZYFpN7WDebQZw9hgsc2ahq9cxQl
	SH6+GV2TxQEt7jkQq89/WRwo67fi/+k2NW/agdZv3W6zC2T8yLcKrhUybis6qDZVdVCB2ZGL6OM21
	yuib2yiZu6p92n0FAnjFwoza9WMX9dmmpR3m+Q2LFRtF/2ZbdqiBVMtFgeNtkunAc4sw2jnu2SvQO
	+Dlz+L7+PQxmNBpBWKpB3FrgKLbmhAqPPsBSezkjs6B4sOkUznE5D8dR03habMUHb9D2WmbXK6hp5
	e2mdiM+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqLgZ-00000002J3O-0z7y
	for ath12k@archiver.kernel.org;
	Fri, 29 Mar 2024 23:30:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqLgV-00000002J1r-1yoL;
	Fri, 29 Mar 2024 23:30:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42TLxODS019270;
	Fri, 29 Mar 2024 23:30:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=btMEj1aDrdTcd3Zv9FcYOvSp4BckjwM0F4bigfeZiFI
	=; b=j+mW4tSnzVHkAi1Uz4sNohN0wtKGNQ4a5xKduE11uw5rcseapnVrts4bi7K
	F9xZOjPr8+dioSOT8uV3I7ZefkuHwT2hWQKvYWVUDYMmAL+IIxTThaN9MgoYc9JT
	HrA3zaQ+a/rOEi+3o1rUlH2LQiAYv9xg0d8uGeYEWd3q75HfeSedVTL6nRkQGorj
	6Cy9eoMFD5sFV5gdIaSGKe6t0qr9s/viTqdY2OV7450e6tuKQyDB4MtHWcLYlu3I
	vGqMjXdYvX7cg3qpShxYLOhUq7ie18Bb1zSa5cxHfHn/PePPv99DmYl7lgYtSiF8
	3ttnUndd050GYqh1FmmXMMhlr+Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x5uccstm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 23:30:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42TNUpNQ010878
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 23:30:51 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 29 Mar
 2024 16:30:50 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Fri, 29 Mar 2024 16:30:51 -0700
Subject: [PATCH 2/2] wifi: ath12k: fix hal_rx_buf_return_buf_manager
 documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240329-hal_rx_buf_return_buf_manager-v1-2-e62ec9dc2af9@quicinc.com>
References: <20240329-hal_rx_buf_return_buf_manager-v1-0-e62ec9dc2af9@quicinc.com>
In-Reply-To: <20240329-hal_rx_buf_return_buf_manager-v1-0-e62ec9dc2af9@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ath12k@lists.infradead.org>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1TRfxswzYYGmIIvFz4OQbnVPNd35DZRQ
X-Proofpoint-ORIG-GUID: 1TRfxswzYYGmIIvFz4OQbnVPNd35DZRQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_13,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=681 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2403210001 definitions=main-2403290209
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_163055_573585_8226AB82 
X-CRM114-Status: GOOD (  11.03  )
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

kernel-doc flagged the following issue, so fix it:

drivers/net/wireless/ath/ath12k/hal.h:771: warning: missing initial short description on line:
 * enum hal_rx_buf_return_buf_manager

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 107927d64bbb..dbb9205bfa10 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -767,7 +767,7 @@ struct hal_srng_config {
 };
 
 /**
- * enum hal_rx_buf_return_buf_manager
+ * enum hal_rx_buf_return_buf_manager - manager for returned rx buffers
  *
  * @HAL_RX_BUF_RBM_WBM_IDLE_BUF_LIST: Buffer returned to WBM idle buffer list
  * @HAL_RX_BUF_RBM_WBM_CHIP0_IDLE_DESC_LIST: Descriptor returned to WBM idle

-- 
2.42.0


