Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E469BC54E65
	for <ath12k@archiver.kernel.org>; Thu, 22 May 2025 08:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OckLQkscblUa0jO7cYvJ9nhknYHqymLVkX0FHZVQmHA=; b=tmWR9P4L59ajA1
	5sROpv2kyWN6XK9kc7gXlnuyo0q6bmwSJqUu3fsjrT+JyCU/dhnhVQMzZlhMSDM6URBDr4aREh2l2
	t3cnFhk5RQe1CEL3fL1qmVxZ1RoDnHBqd+lVpfbRoqRmx+OOzStzrMzyFRich2WFnzicpxEk7iiqO
	e6CqyBb3wpOyvzv3b3e3VjFOufkSclrAxTFHzOuAeeBThnZGZ1dNZeQAnkDyKEvsl1EBZENFGf6yp
	//7fhSO2ddAcM8aaoE8Xd/l/02SP0sfCuebqOBJEf+OJ2Gi7VdqwoSbkD/YZkLQj/1bC8yZcV+QHE
	drVl/gZG4rhOlelnPUGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1m5-00000000OeT-2nRr;
	Thu, 22 May 2025 08:59:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1hP-00000000NN8-2VFj
	for ath12k@lists.infradead.org;
	Thu, 22 May 2025 08:54:48 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7dVU5011357;
	Thu, 22 May 2025 08:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OckLQkscblUa0jO7cYvJ9n
	hknYHqymLVkX0FHZVQmHA=; b=ZoXyZgteMl4IgnoaMRP8steKa5R5TYnaT1ZrRG
	xnR0r58f5Bb77/DO5T8AZ4nPHXN0mOg85UeqNdPQd73Mnn6sxeDrzBiiMpL2/Fah
	UYAqnyqmXRzOOs7mZAKqKIhUSIuHpq9eHTLz/6QQxVra2iQC79U7sBHUCKZ5+JDx
	hClw7a2/WdXaxNhulAu6JUCooxXwLTQ0vBt/H7i33xgc8Jfcl7Wp380ESb4agJvK
	OmKRm5WQYJiKS642xBCyNShBIaFh8AE8ViYkAg+AuKoW6S3M1Ee7ugT3jmgtVDkf
	aZ8etwEHI6jdK+pInoQsd/aIp/24boS1DNaNPZviY3b2lEZA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb5mmc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 08:54:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54M8sgfI019591
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 08:54:42 GMT
Received: from [127.0.1.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 22 May
 2025 01:54:21 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
Subject: [PATCH ath-next 0/6] wifi: ath12k: handle link select and
 inactivate
Date: Thu, 22 May 2025 16:54:09 +0800
Message-ID: <20250522-ath12k-sbs-dbs-v1-0-54a29e7a3a88@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADLmLmgC/x2MSwqAMAwFryJZG6jV+ruKuFAbNQhVGhFBvLvBx
 SwG5r0HhCKTQJs8EOli4T2oZGkC0zqEhZC9OlhjnXHW4HCumd1QRkGv1I1p8qosaypm0NERaeb
 7P+xAWwx0n9C/7wcvgoaVagAAAA==
X-Change-ID: 20250520-ath12k-sbs-dbs-890937668e4f
To: Jeff Johnson <jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DtFE29Z5zle4Oi0mqdMcG6Gui04oP6VP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA4OCBTYWx0ZWRfX/nTP61xi+vJP
 KYeiV9rSPbq693pNdZv3AQCv2BpEheN+Atala5sD+mAECWRBLFEGsAx7YRBo7BXc/+L4JX/6LSE
 MsKS38t3VG4N6K1TvCqSKqkHj2nCRVvGf7jWE6VMWtOY8Kh8Jx+K+YTAddJOZCYe+3ERebbG7PK
 tsHBKHNWc/kGgjhKSD5LfMuTWHFqDgt+xTpSFow9/L0INX2f+SF2+kw+Olu8+OrWs45/M80iRFe
 +JNrletjvsY2Snp/pVn6tIz5cOYDd3C7kLQ+oZQnk1WuappgCeXdlVGCaOO1CEGK5+fw47bMNZc
 4oc3lpYDt48uu4lhppW8p/chZMdonDKJqgAEJt1iA0jpQpfo3p92iGUtct/gniM3YZX6M18te5f
 qgcJ979tj3o7e61ePv9elCV1wwv5atXLthB8QMEcvMCALuMPP5WaV6Gq9HNChAG8wzkb2j8w
X-Proofpoint-GUID: DtFE29Z5zle4Oi0mqdMcG6Gui04oP6VP
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682ee653 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=l_BK76kwmV097mJrsh0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_04,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=923 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_015447_757155_B42A29A9 
X-CRM114-Status: GOOD (  10.81  )
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

Currently host activate all useful links:

	ieee80211_set_active_links(vif, ieee80211_vif_usable_links(vif))

this leads to 2 issues:

1#: If 2 links are created/activated on the same device, and both channels
used by them fall on the same hardware MAC, throughput would be lower
compared with even one link due to MAC switching between them.

2#: If there are more than 2 useful links, WCN7850 firmware crashes when
host tries to bringup the 3rd link, because firmware supports at most 2
links for a ML connection.

To address the first issue, host needs to send
WMI_MLO_LINK_SET_ACTIVE_CMDID command to firmware such that firmware can
deactivate one of the links. This is done in patches 4 and 5.

To address the second issue, host needs to make decision to select 2
links out of the useful links to activate. This is done in patch 6.

The link select and inactivate are both based on the knowledge of hardware
modes, which are advertised by firmware in WMI_SERVICE_READY_EXT_EVENTID
and WMI_SERVICE_READY_EXT2_EVENTID events. Such preparation work is done
in the first three patches.

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
Baochen Qiang (6):
      wifi: ath12k: parse and save hardware mode info from WMI_SERVICE_READY_EXT_EVENTID event for later use
      wifi: ath12k: parse and save sbs_lower_band_end_freq from WMI_SERVICE_READY_EXT2_EVENTID event
      wifi: ath12k: update freq range for each hardware mode
      wifi: ath12k: support WMI_MLO_LINK_SET_ACTIVE_CMDID command
      wifi: ath12k: update link active in case two links fall on the same MAC
      wifi: ath12k: don't activate more links than firmware supports

 drivers/net/wireless/ath/ath12k/core.h |   6 +
 drivers/net/wireless/ath/ath12k/mac.c  | 364 +++++++++++++++-
 drivers/net/wireless/ath/ath12k/mac.h  |   2 +
 drivers/net/wireless/ath/ath12k/wmi.c  | 759 ++++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h  | 180 +++++++-
 5 files changed, 1305 insertions(+), 6 deletions(-)
---
base-commit: db5a2f8ef8d4be926d29ed62182d003110c1a6ca
change-id: 20250520-ath12k-sbs-dbs-890937668e4f

Best regards,
-- 
Baochen Qiang <quic_bqiang@quicinc.com>


