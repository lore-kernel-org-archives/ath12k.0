Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB82C48260
	for <ath12k@archiver.kernel.org>; Fri, 26 Jan 2024 11:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vn+C+Onp+Vp3vaJFvhJI+hpO/0RizG7ZQpbprZofnic=; b=abpu64ZVNZ0kGM05mRWSqQjU/7
	i2mHK9UUvxR/XKzjr4c0UxRFUH3QwxdZzDuq3rmhGOYxGzONOHQhJ49Lou/LBWsw8l6fcb6W3NzVi
	Ile8sxxWfO3IujK4wtBcQ63xhhM9Yixn5hXPT9sa+JKuQzP9iR7jzESRgs7habFZ2Bqu4Idc+a5em
	mf5gVurA4QDaLlTJB/sjUfbsDmQ2GgIVJnqvO+UdVUZPux1sd6fqCl4gx8Dazofw+2+48kUH9BRCN
	XE4Xt2km8wbBKQwGqeaXz8Y612vSVrjNyuHS2iDuzfF7Vq+Oan/JhQ3VKeuNp0kkuc7S21BRz4Mam
	elAz/Zbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTKlb-000000042hA-1UkO
	for ath12k@archiver.kernel.org;
	Fri, 26 Jan 2024 11:53:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTKlX-000000042ec-0uxN
	for ath12k@lists.infradead.org;
	Fri, 26 Jan 2024 11:53:01 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40Q57w8o001050;
	Fri, 26 Jan 2024 11:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=Vn+C+Onp+Vp3vaJFvhJI+hpO/0RizG7ZQpbprZofnic=; b=iG
	w/unPqbCVXhJvUo7wmGhmoFYhKZDvLKbOyDlwSxjVWvNPiiNZQBbd9kaB2n6S3Iz
	1VMM6kOxFPrArKXqSDra0qiPNjkUbw1JhRWMXyFNHZOPAQtBfqdYlDkkVq1u50gE
	ovRK0AJ3NEb6CbJE4ablt4m/jbF6cDkjyU7ncpOddPs7EFdkFCq8YbIqGygCKFtV
	HnIeTRWXhB3KGZukyb9nHMtvDq5CpfOCa7mc1rhzaElbMYzmP2H/tjtmfVkc9XO3
	POJM6uWvkU7v7k4vjBdoN2rQjJOIoepPTK+Typs9ug8OaAcpdLiywXwWopGYHRQi
	/iMPILThgeAvLuPY0+2g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vv4cas14h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 11:52:58 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QBqwuD003977
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 11:52:58 GMT
Received: from yk-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 26 Jan 2024 03:52:56 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v4 06/11] wifi: ath12k: allow specific mgmt frame tx while vdev is not up
Date: Fri, 26 Jan 2024 19:52:26 +0800
Message-ID: <20240126115231.356658-7-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240126115231.356658-1-quic_kangyang@quicinc.com>
References: <20240126115231.356658-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: H4k32f3IPVCEA5xqG088Q8R7-44FNtVp
X-Proofpoint-GUID: H4k32f3IPVCEA5xqG088Q8R7-44FNtVp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401260087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_035259_281206_A6EE0077 
X-CRM114-Status: GOOD (  11.87  )
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

In current code, the management frames must be sent after vdev is started.
But for P2P device, vdev won't start until P2P negotiation is done. So
this logic doesn't make sense for P2P device.

Also use ar->conf_mutex to synchronize vdev delete and mgmt, TX.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---

v4: no change.
v3: no change.
v2: add Tested-on tag of QCN9274.

---
 drivers/net/wireless/ath/ath12k/mac.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 366bb5e5934b..4ad23bc9381c 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5069,8 +5069,8 @@ static void ath12k_mgmt_over_wmi_tx_work(struct work_struct *work)
 		}
 
 		arvif = ath12k_vif_to_arvif(skb_cb->vif);
-		if (ar->allocated_vdev_map & (1LL << arvif->vdev_id) &&
-		    arvif->is_started) {
+		mutex_lock(&ar->conf_mutex);
+		if (ar->allocated_vdev_map & (1LL << arvif->vdev_id)) {
 			ret = ath12k_mac_mgmt_tx_wmi(ar, arvif, skb);
 			if (ret) {
 				ath12k_warn(ar->ab, "failed to tx mgmt frame, vdev_id %d :%d\n",
@@ -5084,6 +5084,7 @@ static void ath12k_mgmt_over_wmi_tx_work(struct work_struct *work)
 				    arvif->is_started);
 			ath12k_mgmt_over_wmi_tx_drop(ar, skb);
 		}
+		mutex_unlock(&ar->conf_mutex);
 	}
 }
 
-- 
2.34.1


