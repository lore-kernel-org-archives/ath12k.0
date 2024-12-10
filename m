Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EA9E7717F
	for <ath12k@archiver.kernel.org>; Tue, 10 Dec 2024 05:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LPzWFx5Zfx4cXehpMKgB5Cml8AHa1x0prdlTRmHHhKk=; b=X4g77CgwkvXpozOlIb5Pa0+Q1k
	8vTJC1rnCVrq+NAJRDEXyy0mUJdNh3kGbhQhJYFxS7pdBwuUxifDQtLBmxDh0LHo2vJqGhS+Z3owr
	sF6NUYHb2W37f4fEuE9raR+rij4PhT0VlzS69c2IcLTqJkZuKfbjQ0Td+q6qo+h+4ZPxMTg8hn9du
	zIDQuPAoWxzTbQAgLHr3SJfm0yERIG3D4z/OqeGDQGz6Ob0UnL65DoKm4JyESN2XF57wcIm/2M/FQ
	UsflWF9YvMnoCzfn5YDDOb+O+DV6q8lEJFrZfPzH5Bucz/r5OYk+KfRF1fFD0yOsLFKf4UdonLqsz
	ooPipxhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKsm5-0000000AHSm-0uFJ
	for ath12k@archiver.kernel.org;
	Tue, 10 Dec 2024 05:27:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKsm3-0000000AHSK-0Pfk
	for ath12k@lists.infradead.org;
	Tue, 10 Dec 2024 05:27:08 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9HLRpp032550;
	Tue, 10 Dec 2024 05:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LPzWFx5Zfx4cXehpMKgB5C
	ml8AHa1x0prdlTRmHHhKk=; b=kX+DkHSnq7ek71gouMfKpdy7R/YnIzEWvDkUqq
	sYuEDZx+M1OXDkuyiMPcJD7j5nt8wSe9oHDphEFgSHln839UqVLRel1m4tbAfZV0
	snbkWTj0K3sw7ucwOzyBS+ZNSOSuwEkeVu8fF+co8pxr7yWthNeISP/y6GpCK4i6
	SJAWYOq7dYhEFFW+4HKbOkv14kLk+O9+cio94iS8FYIOsmtQRrlKARVHTuXIApYh
	tt71nLoe1IuS/aiH9p3DWRP9qb6CnZYA15x8PgedJgzNWnZvboA4838cRYCftuCo
	bllT8fw6EaqSD8iH7Kuc4yNOHTEjQeu8JdNncqNwevAxdnkA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdxxf64p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 05:27:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA5R0p5011493
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 05:27:00 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 21:26:58 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Date: Tue, 10 Dec 2024 10:56:33 +0530
Subject: [PATCH] wifi: ath12k: fix read pointer after free in
 ath12k_mac_assign_vif_to_vdev()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241210-read_after_free-v1-1-969f69c7d66c@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAAnRV2cC/x3MQQqAIBBG4avErBN0aBFdJUJMf2s2FWNEEN09a
 fkt3nuoQAWFhuYhxSVF9q3CtQ3FNWwLjKRqYsudY2eNIiQf8gn1WQHTgTnOKTqknmp1KLLc/3G
 c3vcDbyOEnmEAAAA=
X-Change-ID: 20241210-read_after_free-4e22cbdc1ed8
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        Sriram R
	<quic_srirrama@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>,
        <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        "Aditya Kumar
 Singh" <quic_adisi@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pUu9L7tdE2Ix9IdZlBJmlwnU0Sbc3jcv
X-Proofpoint-GUID: pUu9L7tdE2Ix9IdZlBJmlwnU0Sbc3jcv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=669 priorityscore=1501 clxscore=1011
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_212707_263407_6BCF396E 
X-CRM114-Status: GOOD (  10.99  )
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

In ath12k_mac_assign_vif_to_vdev(), if arvif is created on a different
radio, it gets deleted from that radio through a call to
ath12k_mac_unassign_link_vif(). This action frees the arvif pointer.
Subsequently, there is a check involving arvif, which will result in a
read-after-free scenario.

Fix this by moving this check after arvif is again assigned via call to
ath12k_mac_assign_link_vif().

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Closes: https://scan5.scan.coverity.com/#/project-view/63541/10063?selectedIssue=1636423
Fixes: b5068bc9180d ("wifi: ath12k: Cache vdev configs before vdev create")
Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index c4eab4c1c10e0a05248fb58858dac9a00ef2e799..47a80d28d1d7f83ae7f61ecb89c6cd7d1d779494 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -8064,9 +8064,6 @@ static struct ath12k *ath12k_mac_assign_vif_to_vdev(struct ieee80211_hw *hw,
 
 	ab = ar->ab;
 
-	if (arvif->is_created)
-		goto flush;
-
 	/* Assign arvif again here since previous radio switch block
 	 * would've unassigned and cleared it.
 	 */
@@ -8077,6 +8074,9 @@ static struct ath12k *ath12k_mac_assign_vif_to_vdev(struct ieee80211_hw *hw,
 		goto unlock;
 	}
 
+	if (arvif->is_created)
+		goto flush;
+
 	if (ar->num_created_vdevs > (TARGET_NUM_VDEVS - 1)) {
 		ath12k_warn(ab, "failed to create vdev, reached max vdev limit %d\n",
 			    TARGET_NUM_VDEVS);

---
base-commit: 27909c77d085d32db141cbb32b2cc9fbef874197
change-id: 20241210-read_after_free-4e22cbdc1ed8


