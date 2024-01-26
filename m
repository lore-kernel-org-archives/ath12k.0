Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006A0C47DDF
	for <ath12k@archiver.kernel.org>; Fri, 26 Jan 2024 11:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XP5ZWHPHg9Xh+ftA9D3NIYvUkYeFrVyKUMLvSKQ8auM=; b=kwbmFL05pCypKRMrAGAt1rrwJX
	Qxr6JG9AalMCuLu0CuthVddUupz+pusLXMIrw9Q/wiYKxZ7IpdiwhvVAgbpd49R02pJPdrZqBV6hj
	1vX7fb4QQ97+41UV9ao4HuEvsUwkjoJ8S6FdTG+2UUuA3SKblXEcJVPeqK7aRtw8CF2l2KPayDeF0
	45O3i/Q5LaVtk94c/fnAJyNrTjZ/rCfTSRQg083HwW0e/Hy3dbEvRlciMsWG//u8TSGgDc7aavqLT
	s3NVGDFHo5iNF32s+boviQawJ4Uj4BxpZVmVNjVD+nvtRkYjCj3M1i4L57WMDgn1c5IL9DRqcrY6K
	3TeFpPkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTKla-000000042gP-2QD4
	for ath12k@archiver.kernel.org;
	Fri, 26 Jan 2024 11:53:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTKlV-000000042d3-0eOl
	for ath12k@lists.infradead.org;
	Fri, 26 Jan 2024 11:52:59 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40QBDDjw004163;
	Fri, 26 Jan 2024 11:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=XP5ZWHP
	Hg9Xh+ftA9D3NIYvUkYeFrVyKUMLvSKQ8auM=; b=Q5aUj80jlXLHY5qw4ngaij5
	yTY1oYvZbJaWZ/MUK52ClHivEvIJ4yZPYQTqULckDURUQrlnpvD6dXOccd8wLvkh
	Pz2qKvOnIP5GcYL/Z3BlYGybR7jp1569NPrYOSx7uzYaKArsTDbuzox6WV43sAHV
	1Tg9unS7I57Cx3DwIJVfB6q62Q2EoAPkELRwapjt0ufbuxx+GCvQvYuwC76kM6PO
	oY2PDKEKloczySM6n35i7OSXga5J9cVWXnqlrf6dhd++P/8vcpUgkVWobrprjoJI
	Rb9W6XuO4NdPqU41Iwn7R255NJN7huvps0tmFMtzG4ntXk0w5aXeHMQy4s1i3hQ=
	=
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vv1yps8tg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 11:52:50 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QBqngU008162
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 11:52:50 GMT
Received: from yk-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 26 Jan 2024 03:52:48 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v4 00/11] wifi: ath12k: P2P support for WCN7850
Date: Fri, 26 Jan 2024 19:52:20 +0800
Message-ID: <20240126115231.356658-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Oqxx8_608M8EWCMNKRTqx_yx4n6GtKu8
X-Proofpoint-GUID: Oqxx8_608M8EWCMNKRTqx_yx4n6GtKu8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=949 mlxscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401260087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_035257_399530_34FD14AF 
X-CRM114-Status: GOOD (  10.52  )
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

Kang Yang (11):
  wifi: ath12k: change interface combination for P2P mode
  wifi: ath12k: add P2P IE in beacon template
  wifi: ath12k: implement handling of P2P NoA event
  wifi: ath12k: implement remain on channel for P2P mode
  wifi: ath12k: change WLAN_SCAN_PARAMS_MAX_IE_LEN from 256 to 512
  wifi: ath12k: allow specific mgmt frame tx while vdev is not up
  wifi: ath12k: fix broken structure wmi_vdev_create_cmd
  wifi: ath12k: move peer delete after vdev stop of station for WCN7850
  wifi: ath12k: designating channel frequency for ROC scan
  wifi: ath12k: fix incorrect logic of calculating vdev_stats_id
  wifi: ath12k: advertise P2P dev support for WCN7850

v4: add a new patch #10 to fix warning(Kalle).
v3: rebase on new ath-tag, use ath12k_ah_to_ar() get ar(Karthikeyan).
v2:
    1. add Tested-on tag of QCN9274.
    2. update copyright in patch #1, #2, #4 and #10.


 drivers/net/wireless/ath/ath12k/Makefile |   3 +-
 drivers/net/wireless/ath/ath12k/core.c   |   1 +
 drivers/net/wireless/ath/ath12k/hw.c     |   7 +-
 drivers/net/wireless/ath/ath12k/mac.c    | 368 +++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/p2p.c    | 142 +++++++++
 drivers/net/wireless/ath/ath12k/p2p.h    |  23 ++
 drivers/net/wireless/ath/ath12k/wmi.c    | 116 ++++++-
 drivers/net/wireless/ath/ath12k/wmi.h    |  50 ++-
 8 files changed, 644 insertions(+), 66 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/p2p.c
 create mode 100644 drivers/net/wireless/ath/ath12k/p2p.h


base-commit: 17f4b952f067b1f87d14e6df4c8c216fe7a245d1
-- 
2.34.1


