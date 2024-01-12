Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5827BC4707C
	for <ath12k@archiver.kernel.org>; Fri, 12 Jan 2024 09:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hUN7dui/7gftfnHdJmO4yUp6F03k3vaeMRYyTVDvBAo=; b=FeodV35XqZgrCyUqvMV6nMKHOj
	HKGLtoMToMGxe40MTimBd8w05M2UEzgwQ4Y6xABw/a4ONBy2f1+eUslYjzTDbis7Hr77b87sQJTDs
	/MjIvmbaavCMRZ4HvLgj4nqnUIlgdKxFw3v0lpTiU3EMSOyEeOG0cXWPBUSaB4W3MC+vwf1tgQ/j/
	ZsWb+02Ps84iPl4UCA5DKBndLmJOvFdvs10t16EWChNSZoUkbZ3XXGeYbGwDMDC4UjYY8OVPVBotW
	uu9MxK6J9hOPM44GbnOCWkPzEiIo6igGH53Klj5A2kA2uIqIrE/kxjZLqNcbI/WF0ndaw8QP/klwV
	WGW4Q7bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rODqI-002Ka9-03
	for ath12k@archiver.kernel.org;
	Fri, 12 Jan 2024 09:28:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rODqE-002KXB-0m
	for ath12k@lists.infradead.org;
	Fri, 12 Jan 2024 09:28:43 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40C4gSKf011641;
	Fri, 12 Jan 2024 09:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=hUN7dui
	/7gftfnHdJmO4yUp6F03k3vaeMRYyTVDvBAo=; b=jD48Zzz7iHJpwh4NhCcQN9r
	ki0RqxpLtaS6is2S0Zhp09Mv2yuKUtjAtbpgae5hfXfbIc+0gDCNVHOwtJb44tDt
	wfvMRtmTebX29Pf0HitAuTUNyjOnv75GNpCOrdFVkZFBvjuWn2ZkdhIL0sevRLzr
	yvgT8O5vHgnVJPLBx2gjx7oW3gBsllpMhHopLDZB7+NUJsKaoaQG9kXtQJhvNlzD
	79lXQmXU2L8VEf8/Zy77EvHMOTo/XTFjMeVTnD2FoqCqgHLIpSi2qGWZppoy5MHG
	kETjW+qRIazLs2I7B87FOAhQIj8b1MmhImKi4Px76XYrqCfSUSyrtIkqNs+dPFA=
	=
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vjxm60sqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 09:28:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40C9SdRn021296
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 09:28:39 GMT
Received: from yk-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 12 Jan 2024 01:28:37 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v2 00/10] wifi: ath12k: P2P support for WCN7850
Date: Fri, 12 Jan 2024 17:28:14 +0800
Message-ID: <20240112092824.7664-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1aBKouzTxKl_tcOf3XgJg6ksmmdokOeG
X-Proofpoint-GUID: 1aBKouzTxKl_tcOf3XgJg6ksmmdokOeG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=790 clxscore=1015
 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401120072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_012842_413124_6D0CA04E 
X-CRM114-Status: UNSURE (   9.95  )
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

Add P2P support for WCN7850.

Kang Yang (10):
  wifi: ath12k: change interface combination for P2P mode
  wifi: ath12k: add P2P IE in beacon template
  wifi: ath12k: implement handling of P2P NoA event
  wifi: ath12k: implement remain on channel for P2P mode
  wifi: ath12k: change WLAN_SCAN_PARAMS_MAX_IE_LEN from 256 to 512
  wifi: ath12k: allow specific mgmt frame tx while vdev is not up
  wifi: ath12k: fix broken structure wmi_vdev_create_cmd
  wifi: ath12k: move peer delete after vdev stop of station for WCN7850
  wifi: ath12k: designating channel frequency for ROC scan
  wifi: ath12k: advertise P2P dev support for WCN7850

v2:
    1. add Tested-on tag of QCN9274.
    2. update copyright in patch #1, #2, #4 and #10.

 drivers/net/wireless/ath/ath12k/Makefile |   3 +-
 drivers/net/wireless/ath/ath12k/core.c   |   3 +-
 drivers/net/wireless/ath/ath12k/hw.c     |   7 +-
 drivers/net/wireless/ath/ath12k/mac.c    | 360 +++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/p2p.c    | 142 +++++++++
 drivers/net/wireless/ath/ath12k/p2p.h    |  23 ++
 drivers/net/wireless/ath/ath12k/wmi.c    | 118 +++++++-
 drivers/net/wireless/ath/ath12k/wmi.h    |  50 +++-
 8 files changed, 638 insertions(+), 68 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/p2p.c
 create mode 100644 drivers/net/wireless/ath/ath12k/p2p.h


base-commit: dc1702f7b1340dd741bca1005ab52a2c92cc6c84
-- 
2.34.1


