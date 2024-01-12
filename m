Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B5BC4707B
	for <ath12k@archiver.kernel.org>; Fri, 12 Jan 2024 02:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vkv3f22WwdNMyawAcYNs3uiq3mQ8TRJ/XsgPC/7uhn0=; b=qpNmxHmHesLdbfLRPc1rxkXcBa
	mlFkdT/tUq+e6HhyKKip4OxmgLFB/pnKagqN8uJbwu6v+lY1Bd7Z8Wu1NHQL/fITnO2WLgdSg8Skh
	UnWcvOoHqoXswrnUA4uWMKKwJzgqMxEEy6rZ28MkNoVItAvi4avSG85uzxFXUm3T0ei8dF4Ok7g//
	2g2PWtHSgnrBObtCGTsWt+LMoyA8TbCKxvmrezgHXQApGuRK+YyPdr5C1dXlBGGwSiBKBrHAGgSKJ
	aS64xCYc0B3UQNZ7nGnxCXjz2SpBn0Dwh5Aa16yLDp57xOL/m7HoIuthSMRmEHgRxeMaK6MLyiG+Z
	oOrb0OeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rO7VE-001i0Z-1j
	for ath12k@archiver.kernel.org;
	Fri, 12 Jan 2024 02:42:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rO7VA-001hzU-12
	for ath12k@lists.infradead.org;
	Fri, 12 Jan 2024 02:42:34 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40C1F4rD003584;
	Fri, 12 Jan 2024 02:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=Vkv3f22
	WwdNMyawAcYNs3uiq3mQ8TRJ/XsgPC/7uhn0=; b=OdXQpRpoQ1hpMnjlWY0RkVK
	Qy3fyXT+fcoqM4DZUsy7B5Hx1omgTxZgsaEwAYtwElRAIll1jFyD8kdfOa2qxpnY
	ur3L7EUmLNOscAzPEfAwiGrwoxrbDPn7G3Geg+VfuP4oGHD8Cumqd4mA02MY+P86
	ZWpBrTAXdrJHHuaZt4jxc3bN7DaHMNP/zKuXxhLs7UQPqdPkAZfs8i3v+bwifWT9
	gWSoJGWJX+WwcexPmvPbIOr049FKjk+pRiXD7s7WIQjthTmZ2i9aBIE1/xPIqq1W
	BGTZ+MSgWZ2ebRzH/JldxmAhDDqAHY/72nWSwLI4Oc+YdO8Pp4NHpn7DF17OQnA=
	=
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vjgtjhmeh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 02:42:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40C2gU95025150
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 02:42:30 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 11 Jan 2024 18:42:28 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v2 0/2] wifi: ath12k: Introduce hw abstraction
Date: Fri, 12 Jan 2024 08:12:12 +0530
Message-ID: <20240112024214.3481840-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gHJ20lrYE7-HIVMKfvHKoLdV_IrmmY5U
X-Proofpoint-ORIG-GUID: gHJ20lrYE7-HIVMKfvHKoLdV_IrmmY5U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=290 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401120018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_184232_383108_20EB7C72 
X-CRM114-Status: UNSURE (   8.56  )
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

To support multi link operation (MLO), need to move from the multi wiphy
model to a single wiphy model. However, the single wiphy model allows
multiple link/radio to be exposed by the same mac80211 hw. So introduce
a new container (ath12k_hw) structure. This approach improves scalability
for future multi link operation support.

v2:
 - Rebased on pending branch as per jeff comments

Note: Raised on top of pending branch

Karthikeyan Periyasamy (2):
  wifi: ath12k: Refactor the mac80211 hw access from link/radio
  wifi: ath12k: Introduce the container for mac80211 hw

 drivers/net/wireless/ath/ath12k/core.c   | 108 +++--
 drivers/net/wireless/ath/ath12k/core.h   |  47 ++-
 drivers/net/wireless/ath/ath12k/dp_mon.c |   4 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c  |   6 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c  |   6 +-
 drivers/net/wireless/ath/ath12k/mac.c    | 480 +++++++++++++++++------
 drivers/net/wireless/ath/ath12k/mac.h    |  14 +-
 drivers/net/wireless/ath/ath12k/reg.c    |   9 +-
 drivers/net/wireless/ath/ath12k/wmi.c    |  17 +-
 9 files changed, 510 insertions(+), 181 deletions(-)


base-commit: a34e613ed3e02337577b26e308067fb6c4700586
-- 
2.34.1


