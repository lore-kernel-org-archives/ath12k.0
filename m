Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC77C0219C
	for <ath12k@archiver.kernel.org>; Fri,  7 Feb 2025 05:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1W5rgEA3urFg4KhoIly+1ZaxNtqF9+q43mMl1GEmPA=; b=sTmx4cqyqjruSuj1UipP/K5fI9
	U5n1+uafYyv+ZozjH/SXodUapXAhg2t+IcMjuoJ+OP/G5Gzf5dqT10318RO63w8fVoWrME2QXZpKL
	wcCwNbumi8mtxsd0rxOt9oH/iUpjhPpO42GvC4JqyXfnrxYYEO3JFEPqNCUFNN1bOtNtiYx2waxMy
	7P8Ve0nW9f9vPtmI1c9qgmWZh8+WkG5YXqgySDLVHlYdEgP2wYMJfj2YJUXCPgl05s78Hx9NBAqmP
	dQMGDO6Y7zsEOdm9nVbUE27vXIaYGrStTE9m6piITdVybw8k3hHn+lShm8QyrBAPnvzIqt2HI9FT7
	4VBPe0JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgGWy-00000008L4c-0XLg
	for ath12k@archiver.kernel.org;
	Fri, 07 Feb 2025 05:03:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgGWu-00000008L2x-3GcG
	for ath12k@lists.infradead.org;
	Fri, 07 Feb 2025 05:03:53 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5174KljH008006;
	Fri, 7 Feb 2025 05:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w1W5rgEA3urFg4KhoIly+1ZaxNtqF9+q43mMl1GEmPA=; b=p19bcUYINRnCNNlB
	+7oS9y3HmzKZOPXd2TEN/nSMiXCxf7/J5o4gswMX0Tp4gEuXTi+dFJhNCT8sLPV3
	Oq5YinXItvzHl9FFMWwerSJ4IEb3j4wxXwnrBC2sdZLGmJYgDMdExgt4+kpsDXwx
	BRfovXm7/8rnAtxKLOkO/i7neJhFoBOtgvu3FKFWTPLtSISFnr91KyzCEq3LmshY
	SR1zFiKLsGmxtLHNekcZhWOpLFbWgKUE2/7gYjSYYEgY/sWzJvUogJOHIHmsMjXU
	X3UJgRNP1eK6zFY6LSIAkWMZg6qtJWp1alV27Y9/Lw5KqAfOswz9XYEb6/Y7zO43
	KwWcag==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nb2m82vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 05:03:51 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51753ogK009563
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 05:03:50 GMT
Received: from hu-aarasahu-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Feb 2025 21:03:49 -0800
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aaradhana Sahu
	<quic_aarasahu@quicinc.com>
Subject: [PATCH 2/3] wifi: ath12k: Remove dependency on single_chip_mlo_support for mlo_capable flag
Date: Fri, 7 Feb 2025 10:33:26 +0530
Message-ID: <20250207050327.360987-3-quic_aarasahu@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207050327.360987-1-quic_aarasahu@quicinc.com>
References: <20250207050327.360987-1-quic_aarasahu@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6A9HJHTUZhhrk3KlWqAhW_JNc7HCmyrc
X-Proofpoint-ORIG-GUID: 6A9HJHTUZhhrk3KlWqAhW_JNc7HCmyrc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_02,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=936
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502070038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_210352_930509_D93E7BB5 
X-CRM114-Status: GOOD (  13.40  )
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

The mlo_capable flag in structure ath12k_hw_group indicate that a device
is capable of operating in multi-link mode. Currently this is enabled
based on single_chip_mlo_support advertised by the firmware within
ath12k_qmi_phy_cap_send().

Since the firmware advertises multi-link operation (MLO) support through
the ATH12K_FW_FEATURE_MLO feature in firmware-2.bin, there is no need to
rely on the QMI phy capability (single_chip_mlo_support). Therefore remove
the dependency on single_chip_mlo_support to set mlo_capable flag.

Below is the impact on single split-phy PCI device with and without this
patch:

Note: This patch does not change the existing behavior of the single
split-phy PCI device.

1. Driver without this patch + firmware with single_chip_mlo_support
    as false: MLO is not enabled.
2. Driver without this patch + firmware with single_chip_mlo_support
    as true: MLO works fine.
3. Driver with this patch + firmware with single_chip_mlo_support as
    false: MLO is not enabled.
4. Driver with this patch + firmware with single_chip_mlo_support as
    true: MLO works fine.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index ef537c6bf0da..fcbe234758e1 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2265,10 +2265,6 @@ static void ath12k_qmi_phy_cap_send(struct ath12k_base *ab)
 		goto out;
 	}
 
-	if (resp.single_chip_mlo_support_valid &&
-	    resp.single_chip_mlo_support)
-		ab->single_chip_mlo_supp = true;
-
 	if (!resp.num_phy_valid) {
 		ret = -ENODATA;
 		goto out;
@@ -2277,10 +2273,9 @@ static void ath12k_qmi_phy_cap_send(struct ath12k_base *ab)
 	ab->qmi.num_radios = resp.num_phy;
 
 	ath12k_dbg(ab, ATH12K_DBG_QMI,
-		   "phy capability resp valid %d num_phy %d valid %d board_id %d valid %d single_chip_mlo_support %d\n",
+		   "phy capability resp valid %d num_phy %d valid %d board_id %d\n",
 		   resp.num_phy_valid, resp.num_phy,
-		   resp.board_id_valid, resp.board_id,
-		   resp.single_chip_mlo_support_valid, resp.single_chip_mlo_support);
+		   resp.board_id_valid, resp.board_id);
 
 	return;
 
-- 
2.34.1


