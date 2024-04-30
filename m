Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA694C4345F
	for <ath12k@archiver.kernel.org>; Tue, 30 Apr 2024 09:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lOp5wChRyEtLCvnARP7XxMChFopRXcN5Zvk5HfZkxcI=; b=2Nip3/AL4ARJsfnWhQ2zpyLun8
	eYXoL163HCEBTF/uGfHxhfMkarg8gSi1mD2QcSG3VzgOXuqfRMKx3VlD+EVVTXhXN3d2GaKcZhKf1
	htpAGLfvt3CAJrTFRkomLpf84hcxHYwKzE0tG7Hxm7vIOJm2/14v9uhEV/c2MljZLDm0NXWetkhRH
	M551sPUGUhsmQpTdnc+m9cENeVcdw/ijOmQ+wwirMNaiSwHx00NQgXAAZOxuEXN6b7OjDhB/wC1Nk
	2Kgk3uMc12JDe179Juz6L/32nbL6OHberKicxo7TmgsTo/kaD4da1+HeFjA798VJW8GvSkRz+0TMT
	O+ZLxPAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1jZY-00000005mOX-1saD
	for ath12k@archiver.kernel.org;
	Tue, 30 Apr 2024 09:14:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1jZV-00000005mNa-3ICl
	for ath12k@lists.infradead.org;
	Tue, 30 Apr 2024 09:14:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43U7BPtN012461;
	Tue, 30 Apr 2024 09:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=lOp5wCh
	RyEtLCvnARP7XxMChFopRXcN5Zvk5HfZkxcI=; b=OS3Pj8goLg9OGtLICqQP8Ha
	z66Kkz9y9TD3XZbQEGxv+D/S/01Rl5/HIkdnCYkiswKjFbXshImYai97RMxe78Ud
	7+iZGCi09L0g/oR3OLWCrXoZHPw55DkD6V4w91Nso9010xpgBrjE88RA4x4EaDdx
	wuD4oLEcrdGQO3ucPvjs8DaTbOp8ylVXhq7tvknSvk7w+T4aVEK33c54E27Plhga
	NF9nwOccM3A+A1vN/PBEUbNCX3zbFCtiXnU47i2arDg3BgOluOD21fQRoivpGvyB
	lbtbvDokwEXutrDKq5n/vfaFTTh4U26CpeCSXzE4pHjyNCiGjFa3ZfuCBzPT+bQ=
	=
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtrep0tx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 09:14:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43U9EQcl026630
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 09:14:26 GMT
Received: from hu-tamizhr-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 30 Apr 2024 02:14:24 -0700
From: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Tamizh Chelvam Raja
	<quic_tamizhr@quicinc.com>
Subject: [PATCHv4 0/3] wifi: ath12k: Remove unsupported and unused ring configurations
Date: Tue, 30 Apr 2024 14:44:11 +0530
Message-ID: <20240430091414.2486196-1-quic_tamizhr@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sYENBs-aPv_f0_Bm3g2c0sQwk0jQuHWI
X-Proofpoint-ORIG-GUID: sYENBs-aPv_f0_Bm3g2c0sQwk0jQuHWI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_04,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=812 mlxscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_021445_948159_AF096929 
X-CRM114-Status: UNSURE (   7.92  )
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

Currently in driver doing memory allocation for tx_monitor,
tcl_cmd_ring and tcl_status ring. Here driver support for
tx_monitor mode is not there and memory for tcl_cmd and tcl_status
rings are allocated by firmware and it uses that memory instead of
host allocated. So avoid these unused ring setup configuration.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Tamizh Chelvam Raja (3):
  wifi: ath12k: fix calling correct function for rx monitor mode
  wifi: ath12k: Remove unsupported tx monitor handling
  wifi: ath12k: Remove unused tcl_*_ring configuration

v4:
  * Fixed ath12k-check warnings

v3:
  * Addressed Karthikeyan's review comment of modifying
    ath12k_dp_tx_htt_rx_monitor_mode_ring_config in correct place.

v2:
 * Rebased on top of ToT

 drivers/net/wireless/ath/ath12k/dp.c     | 16 -------
 drivers/net/wireless/ath/ath12k/dp.h     |  2 -
 drivers/net/wireless/ath/ath12k/dp_mon.c | 40 +---------------
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 59 +-----------------------
 drivers/net/wireless/ath/ath12k/dp_tx.c  | 44 +-----------------
 drivers/net/wireless/ath/ath12k/dp_tx.h  |  3 +-
 6 files changed, 4 insertions(+), 160 deletions(-)


base-commit: 861928281f22a08e3d258ebcfe7159d729ec07d4
-- 
2.34.1


