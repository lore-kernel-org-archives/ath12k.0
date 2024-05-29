Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8BBC25B75
	for <ath12k@archiver.kernel.org>; Wed, 29 May 2024 04:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iN3HAAv6f7vBHYns3kVLpDsY7GbzgoD9/Rl7ps1uS+Q=; b=titeU2+KuYxyvK1U/7QdDEeABD
	ZY5rD7YEhcLLpU1fGK2dyDj169ns/ETu/19e1deUCLbyUbn4IyXEL1bqSbkF1acJ8G6ZqXV7XwJUa
	Q26Hqfr6kbc7kTPv5IRUUUtugbQb5QzFvUpF3oo85yan+wlVo50xi6RFq5nnCB3VQL35bGLLEtRD2
	Q8LbqTafu56R1ijep7zrG1fk+x5GQIPMFZ9yty8GGEyNATxR4yJF/4LGX2EWcw328KCj+Njx2N7OH
	RTgz8HWT7ioUQkBlOqQr2hW7RRGmlZ9XtYG+MvO3Mr0ZoZ9zdGgt37QQwMpXUrOfBsPReH/KWUGxH
	ikfMH6JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCAy5-00000002mnL-0oOI
	for ath12k@archiver.kernel.org;
	Wed, 29 May 2024 04:31:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCAy0-00000002mlz-23np
	for ath12k@lists.infradead.org;
	Wed, 29 May 2024 04:31:15 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T0VGw0015671;
	Wed, 29 May 2024 04:31:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iN3HAAv6f7vBHYns3kVLpDsY7GbzgoD9/Rl7ps1uS+Q=; b=ALn8jDp60i7Az823
	f4KfKVkXBwBMAoZN+A0ZuJ1gudU2+df6FWVrCvtT+l6KXHyI3xOvHUhV8z0w0vgm
	VwKQ4164LkcbnbeFphYN/7k/O35jP9Sng/SPSPyhpQWyMqWqlBBuv9nnvCpx+Iiz
	X9Yf7dKYNV6GkVs5AhWh1Umi48so9NFrF/SB/WwHnzOaoPTDlWa5BTBPlwXD5bsS
	qXIsQAC52meHnphJA3ncoaxBktXgJvrBRxzUjJ6sedTs8rcSRJ/heEwSWGxzJhpO
	ZsSvmyjSXeDJfBHo/h0z/Yk+XGuTj85wNkWgdoa4dqMQT1vaKM+oy+IgoNLcktya
	QefBng==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yb9yj81ta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 04:31:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44T4V8lU030539
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 04:31:08 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 May 2024 21:31:06 -0700
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aditya Kumar Singh
	<quic_adisi@quicinc.com>
Subject: [PATCH 1/3] wifi: ath12k: fix per pdev debugfs registration
Date: Wed, 29 May 2024 10:00:41 +0530
Message-ID: <20240529043043.2488031-2-quic_adisi@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529043043.2488031-1-quic_adisi@quicinc.com>
References: <20240529043043.2488031-1-quic_adisi@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: r0M6-jbi88Lct5DEgkLPJO84FcKuOGy9
X-Proofpoint-ORIG-GUID: r0M6-jbi88Lct5DEgkLPJO84FcKuOGy9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_213112_668606_E5B1C095 
X-CRM114-Status: GOOD (  12.15  )
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

Function ath12k_debugfs_register() is called once inside the function
ath12k_mac_hw_register(). However, with single wiphy model, there could
be multiple pdevs registered under single hardware. Hence, need to register
debugfs for each one of them.

Move the caller inside the loop which iterates over all underlying pdevs.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Fixes: f8bde02a26b9 ("wifi: ath12k: initial debugfs support")
Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 784964ae03ec..beec42d4ec24 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -9077,9 +9077,9 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 			ath12k_err(ar->ab, "ath12k regd update failed: %d\n", ret);
 			goto err_unregister_hw;
 		}
-	}
 
-	ath12k_debugfs_register(ar);
+		ath12k_debugfs_register(ar);
+	}
 
 	return 0;
 
-- 
2.34.1


