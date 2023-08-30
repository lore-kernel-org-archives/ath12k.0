Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6927BC6FA8F
	for <ath12k@archiver.kernel.org>; Wed, 30 Aug 2023 02:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y/85neQUrTS5fxUreI7OWZ0r4rW/vMZsARKDfe5SCXA=; b=EPLRc45OAKMft+
	sWU6+vGpzrEglIAzijcdOrwvEjj+SGhxq/DkycWtOgRH1++bGYQdE55VFANKV4CjeGw+74R2d4KL6
	i7v+FJ/aTgd1BJUqHTBY3WniR9Z0Djzu/HQOVry7cKJ2AE1ZES9uOpcWeR4x0IZLbI1+kj733gVCO
	9k5z3b25uBglsIqiyNJPDNcoApQHNDDZV6Y+cbaZCQGsArsOaENKX5e7ZfHtTXNVG//U9gJDSYR3Q
	m0X8pn4t86lqTTn5bsfo+DXtIPnp0YHiW8XIfp3mmUF06MGlcgmFWy3v5rP52jMgdcPvVnPO43A4u
	bf9S3C5hT1sblvDwFldg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbAcL-00Cblx-2u
	for ath12k@archiver.kernel.org;
	Wed, 30 Aug 2023 02:07:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbAcI-00Cble-14
	for ath12k@lists.infradead.org;
	Wed, 30 Aug 2023 02:07:35 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37U1FNus001077;
	Wed, 30 Aug 2023 02:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=w/lNLWPJCUWjpYCP0FZyhe1O7ownFSGSc9kI8Y77gcY=;
 b=YCefNfYJgXSmTcEP4+EO0FVtMUAh4URzYkuCaTofZvBBVtYYrufsLTzAz4PnQTGWa11U
 0Po1xS6GokojUDQsR0g6tjScibjZXAKIO/1V+K/ftBwBzUWYAiJCUE8Dw0uy7AD2ASnP
 H7TJxrz+/5s/mmxe9yLfc9TKKbDRKKBzVxpvRBaPbkLs/dnfdG4SK1rSqX6Oq6WGVq0j
 8G8o8GP1+NcHCIY02EUPGloepkPasNdw2McCkfJKjq72eDx3bQr/iLkAHTaU9982iS5q
 rPGvgdk4uArVAYMvHUBDL6enSjjRranZciDyS+hiKb+PPxG233sbM89vt94KWeDtSEhG LQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ss3fr3b3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 02:07:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37U27TWY026705
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 02:07:29 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 29 Aug 2023 19:07:28 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH] wifi: ath12k: fix possible out-of-bound write in ath12k_wmi_ext_hal_reg_caps()
Date: Wed, 30 Aug 2023 10:07:16 +0800
Message-ID: <20230830020716.5420-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uw39XZoZEKKKMJJ5Gn6QYZ1O2LpAeg32
X-Proofpoint-ORIG-GUID: uw39XZoZEKKKMJJ5Gn6QYZ1O2LpAeg32
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 adultscore=0 spamscore=0 phishscore=0 bulkscore=0 mlxlogscore=655
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308300017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_190734_415421_CB43497A 
X-CRM114-Status: GOOD (  13.76  )
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

reg_cap.phy_id is extracted from WMI event and could be an unexpected value
in case some errors happen. As a result out-of-bound write may occur to
soc->hal_reg_cap. Fix it by validating reg_cap.phy_id before using it.

This is found during code review.

Compile tested only.

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index ef0f3cf35cfd..a8a7fa9f71cf 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -3876,6 +3876,10 @@ static int ath12k_wmi_ext_hal_reg_caps(struct ath12k_base *soc,
 			ath12k_warn(soc, "failed to extract reg cap %d\n", i);
 			return ret;
 		}
+		if (reg_cap.phy_id >= MAX_RADIOS) {
+			ath12k_warn(soc, "unexpected phy id %u\n", reg_cap.phy_id);
+			return -EINVAL;
+		}
 		soc->hal_reg_cap[reg_cap.phy_id] = reg_cap;
 	}
 	return 0;

base-commit: a62b0aeb556839fb6abb9835874443b08fe95598
-- 
2.25.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
