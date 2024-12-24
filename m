Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76771E77188
	for <ath12k@archiver.kernel.org>; Tue, 24 Dec 2024 10:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/cHdqEJKeY2HpW3xK+rto7NbzwszTcC5doO9ISYbtG4=; b=QkmPcP6zG7iaqcZ6ZO/6xSj3A3
	w3a1JtfSpwPYMIiW+SeLDXsqLR7QVeRvu/uYWwOfOGLOaNnNw/3sg1zBE7+Jilh+EWu79ScEVFWkH
	OGflFQO4nK5K2Cz4hcegOvv3MZ+sTwS8wG00dRbNTCz4jbtdNx0JTIcXmuYnFaMx8tFrruSvTQIlZ
	5JwBGZIgHLgF+ki7OdEdI24KwABZEdA3UDPcRYOH3PkrhggV0X/+VHuIyTVlEvaVrnblbJHs/twtf
	RbuxzGKG7XTDZcnQOdxEV3prHyVlwfkE9YH5CarR5W9MRECLzF9v+3pVFOrn5m/tDBju91NlH+J23
	jI749rTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ21i-0000000Bjfh-10eO
	for ath12k@archiver.kernel.org;
	Tue, 24 Dec 2024 10:20:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ21f-0000000Bjex-13cB
	for ath12k@lists.infradead.org;
	Tue, 24 Dec 2024 10:20:32 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BO5WYC3008076;
	Tue, 24 Dec 2024 10:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/cHdqEJKeY2HpW3xK+rto7
	NbzwszTcC5doO9ISYbtG4=; b=pyLbzCrWeHcgQb/C0zQTKRBTLs8JkNmxlLEMkz
	Ei5sZZ9GHp0cq/veDzlPZWUSRN6yDySGybPt7V3eFAv4QuiTMZcoa4z+Kb2lFFSr
	OoT8w7tPwogP9vFEiWne+BDs/U1ykhwEp+B9EDDrotSPrkAaaLTM4ZOCoRJTNuaJ
	UDvp4r51Ko00uMfQagcTXfOf/hhyIREhV1nNLnEyJPGJF4M+qfebC4MU6PA6Vu05
	PY8ApSi/omhnFij4pqhkxBSrMETxxYa3vQR84Au2N3/oVwJPrOBSyEQuhOdjbw2O
	6/up1pYNoiprVTBmCAkWMVmXfUz/Mh75CUBL2FGB7lwmEMeA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qpwb9mr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 10:20:30 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BOAKTOE022387
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 10:20:29 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Dec 2024 02:20:27 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH v2 0/6] wifi: ath12k: Support Sounding, Latency, Trigger, FSE stats
Date: Tue, 24 Dec 2024 15:50:07 +0530
Message-ID: <20241224102013.1530055-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zy3TKqu7CjE_--GGUUV-bcrxgVxwySOS
X-Proofpoint-ORIG-GUID: zy3TKqu7CjE_--GGUUV-bcrxgVxwySOS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=809 adultscore=0
 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412240087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_022031_422232_93818754 
X-CRM114-Status: UNSURE (   6.40  )
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

Add support to request HTT stats type 22, 25, 26, 27 and 28 from
firmware. These stats give sounding stats, latency stats, trigger stats
for uplink OFDMA and MUMIMO and FSE stats, respectively.

Depends-on:
[PATCH 0/2] wifi: ath12k: Support Rate and OFDMA Stats
Link: https://lore.kernel.org/all/20241128110949.3672364-1-quic_rdevanat@quicinc.com/

[PATCH v4 0/2] wifi: ath12k: Support AST and Puncture Stats
Link: https://lore.kernel.org/all/20241217055408.1293764-1-quic_rdevanat@quicinc.com/

v2:
 - Added line breaks where necessary, as pointed out by Kalle.
 - Modified the use of pointer arithmetic print_array_to_buf_s8().
 - Modified commit logs, as suggested by Kalle. 

Dinesh Karthikeyan (5):
  wifi: ath12k: Support Sounding Stats
  wifi: ath12k: Support Latency Stats
  wifi: ath12k: Support Uplink OFDMA Trigger Stats
  wifi: ath12k: Support Uplink MUMIMO Trigger Stats
  wifi: ath12k: Support Received FSE Stats

Roopni Devanathan (1):
  wifi: ath12k: Add API to print s8 arrays in HTT stats

 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 736 ++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 267 ++++++-
 2 files changed, 970 insertions(+), 33 deletions(-)


base-commit: 09fa3b6974a1245ddd0751747609431494ba5b4f
prerequisite-patch-id: c30df5e4af6f5773ed942d8f78de88c05ce2b18b
prerequisite-patch-id: f2181eee4bce2e3487db9bd81ed962f477759e7e
-- 
2.25.1


