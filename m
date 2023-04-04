Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFBBC7618D
	for <ath12k@archiver.kernel.org>; Tue,  4 Apr 2023 07:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aik8MeSL2yl+dfI7NNenGvBy8oQIEGLDdPlgJMYvLBE=; b=TDgGTywGHEPiSN
	eadAUEFWJiR059FsxA6Q2DTNKlTGoPlMggEr9Xw0NXmD/BxLqxJIHUpn97FVBDzC9yvffkR1+frGC
	f7nOl5zd3WW/VldDuYplDcU2Y3BpzQZNiv+L8n4G9XnuGidloJEZVQg/L10zcpLAcgDEaIqYBkkIx
	torAUc+2nQpPGXZQ8UFtpkLWKBBdvF2YG298KPuiPJ8OksemW1zkor2fKXftbW/niWfxVbvQ1olPe
	8tmShK/4Ccu48XJq6ALmwRrXgVD/UqlfJebaa+rU6PBxxa+TB9Pj1PJsExm/+alzJHFPqs7CrnCJj
	32MYnuSrWpOZcuoN74Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjaho-000FwK-1R
	for ath12k@archiver.kernel.org;
	Tue, 04 Apr 2023 07:03:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjahl-000FvS-1O
	for ath12k@lists.infradead.org;
	Tue, 04 Apr 2023 07:03:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3343f5KD003701;
	Tue, 4 Apr 2023 07:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=CBBZh09oTGHfVb8tpDv1GwxJVAWNiumsiH5/PfbSkME=;
 b=hTnJTe6tCOpUZLHolujecp4UyIItX3WJCVwS+nnM+K409e7WLk2qaSbJxfvePbdEFYJ1
 A45vzSt9mtgVKDzSxADVVX+2GVc3wq94yJ5f6RtzVx6/dvHU7MV+ZsMM1nmWlltkGYZY
 sTsDU8vDE67CagJoR6s9SODPfNTOeheibLfeQc5YwT+ANzOf5YCDvziHCKIugY6xvJeJ
 TN0adUEo1ASOGYYS6sIBicqebsGVT43Qqyiq9DXWAWazK/O28DkVHdmAOcGnhhgCEyHM
 cBnwaHAr62x3qlzEchdLWRrVe/3CpQ8xOdC0/AWUXFzyfjal3KwKDELvnE0FCrJ3jvK9 jw== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pqus5as0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Apr 2023 07:03:41 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33473eve029274
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Apr 2023 07:03:40 GMT
Received: from cjhuang2-gv.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 4 Apr 2023 00:03:32 -0700
From: Carl Huang <quic_cjhuang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_cjhuang@quicinc.com>
Subject: [PATCH] wifi: ath12k: send WMI_PEER_REORDER_QUEUE_SETUP_CMDID when ADDBA session starts
Date: Tue, 4 Apr 2023 15:01:58 +0800
Message-ID: <20230404070158.3368530-1-quic_cjhuang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ypQx7rDNufousbgwl2RU1vPbxRC1PC-c
X-Proofpoint-GUID: ypQx7rDNufousbgwl2RU1vPbxRC1PC-c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_19,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=963
 adultscore=0 impostorscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304040064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_000345_610804_D4011526 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Low receive throughput is seen on WCN7850 because ADDBA related
parameters are not updated to firmware when receive ADDBA session starts.

Fix it by sending WMI_PEER_REORDER_QUEUE_SETUP_CMDID again to firmware
to update the ADDBA related parameters for chips which have false
reoq_lut_support in hw_params. For chips which have true reoq_lut_support
in hw_params don't need this command to send to firmware.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index e78478a5b978..256e4cbfae54 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -977,6 +977,9 @@ int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_
 			ath12k_warn(ab, "failed to update reo for rx tid %d\n", tid);
 			return ret;
 		}
+		if (!ab->hw_params->reoq_lut_support)
+			ret = ath12k_wmi_peer_rx_reorder_queue_setup(ar, vdev_id, peer_mac,
+								     paddr, tid, 1, ba_win_sz);
 
 		return ret;
 	}

base-commit: bea046575a2e6d7d1cf63cc7ab032647a3585de5
-- 
2.25.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
