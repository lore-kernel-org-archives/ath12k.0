Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BCCE77179
	for <ath12k@archiver.kernel.org>; Fri,  6 Dec 2024 05:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xmKv+KVjtN41how3o9Z4O2jLLcC8DsYGeQotW8UsKlA=; b=c651neKDZ9lyVlKft05aLOjFak
	PndGs7VgruJ6PAqnfJH+gWQpeRfzI9qqxhrmnMqExjlIFilxGoMUKvrBq1X6u6PbSdW9b3iSekVUB
	A2/gThuuj2OGDKKlKvuZpWiVynYsyYIz14zrwz7VqzPrv5SCEbMraDYub/vnn98DTy+OL7iOD0G6U
	ddkJ4Dqrv+Pb3aZzc8j/m06vdW2NXpzGsqdMvkbe11dQh0S+A01VkJE+/7GIxKRuooI/DF5IEwhQz
	kQVJF9Hs+uTOtwRAJYT6UOx0vK1t7jH+3wgw41c6CGoGrF0I408x7Zx2tzDtMPQR26UfEmz15bmpc
	ryAzyFhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJRAQ-00000000duL-2zBc
	for ath12k@archiver.kernel.org;
	Fri, 06 Dec 2024 05:46:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJRAN-00000000dtx-3lcD
	for ath12k@lists.infradead.org;
	Fri, 06 Dec 2024 05:46:17 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5JhfAL018610;
	Fri, 6 Dec 2024 05:46:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xmKv+KVjtN41how3o9Z4O2
	jLLcC8DsYGeQotW8UsKlA=; b=ZJR2rcG8zpSzdyV1hjskkMnxZpUE7Iaw6j4Gr4
	aww7SOFvhR3FLCbRV3c4MKq8ZlL5s2m20QuSnGEgfK40F5IPoF7qQIlYP6qfVC1x
	kNXJBLCGTcNkV7LCeMaaeagtChVmMWS5yt7+wN480i4mhfxbS8pPl8i7abAMDAf1
	gfsCiutmtEPVX5OLmmQOiHgIqZd4AM5wJZsLcqqJGx6s6yX0lDo6IexX7g8MCHHY
	tp40++ENzLXjJD1Sd9kAWwV/y8DLGQLjiyJUOA5WUvBvg5k6MSBoL+uGwZY8de1K
	iD5IdeufXbTNdXySk9tvk6AjOsbq2WWmqll3+siEqv23XltA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bjk8s6ng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 05:46:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B65kDon011319
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 05:46:13 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 21:46:11 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH] wifi: ath12k: fix leaking michael_mic for non-primary links
Date: Fri, 6 Dec 2024 13:45:52 +0800
Message-ID: <20241206054552.177424-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: n1tdAVRIYq37U9RahsF6ANv8oHynxMv2
X-Proofpoint-GUID: n1tdAVRIYq37U9RahsF6ANv8oHynxMv2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412060040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_214616_182348_AB24930A 
X-CRM114-Status: GOOD (  10.45  )
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

In ath12k_dp_rx_peer_frag_setup(), commit ea4192553850 ("wifi: ath12k: add primary
link for data path operations") checks whether a link is the primary link, and
returns directly if it isn't. In ML scenario where we have non-primary links created,
this results in leaking the michael_mic info since it is allocated by default but
could never be freed for a non-primary link.

Note that we can not move the might-sleep allocation after primary link check since
there we are in atomic context (due to spin lock). So keep the default allocation,
and then free it before return to fix this issue.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Fixes: ea4192553850 ("wifi: ath12k: add primary link for data path operations")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index b24d1de4aabb..f8e79eff2089 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -2830,6 +2830,7 @@ int ath12k_dp_rx_peer_frag_setup(struct ath12k *ar, const u8 *peer_mac, int vdev
 
 	if (!peer->primary_link) {
 		spin_unlock_bh(&ab->base_lock);
+		crypto_free_shash(tfm);
 		return 0;
 	}
 

base-commit: 3b2ab397d31f926523f2781d7f0a14a387415bf4
-- 
2.25.1


