Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E43D0E6FC
	for <ath12k@archiver.kernel.org>; Tue, 22 Oct 2024 11:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hPO3xKSoekFunDZjeYcBial9uhKJQ5IA7vgGbwupwMs=; b=foTUBN5gO3eS+JV3SeuvYeo+da
	tohA4CGJ9DP+ITCiMw1oR7YsBYgEK124iGeBm6SNVC5T0ukhpltRMO5cyy+t3zgXSLo/bMIYVX7Z2
	N6t/UF542hy5n82JQwPfZoJSXrE4hHZRiW+h23owXR3jqFgIagJK8AlbpW3giq2HYd+6NbO9gaYXu
	62IzRckUi4wc3gSyBBBqrlX6mquahKxVyz0rZqKxl1Y2azNwBe0SzCSSi/SDXNxIN/fItrhW4PSn3
	dSBUvMHPRXHm5BQ7tX3ebtXOc9A9RtalZFvi2Gnuk4Ub8WLpNptkPwmLI6MQ1g35vjVEHNRRC36/7
	TOAiJviQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3CmQ-0000000AeSU-1ARA
	for ath12k@archiver.kernel.org;
	Tue, 22 Oct 2024 11:10:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Cky-0000000AeEP-3Ppo
	for ath12k@lists.infradead.org;
	Tue, 22 Oct 2024 11:08:58 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49M9QxS5023350;
	Tue, 22 Oct 2024 11:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hPO3xKSoekFunDZjeYcBia
	l9uhKJQ5IA7vgGbwupwMs=; b=IqQrw4YV+Q6TYr/7STfyPkoW2kz5Rsw8QGPIpZ
	e0HAyW2+YJkX2LOOdIlHimVKKyMdPFml2L/cOnKc+rywjtMFl/exugaeLFlX5AAT
	AcGONdvFEodWVMfPPrZBL6OdwlJmLuKD5Ax74teW21U7CYFBGa8lhAm7TmiRxNFG
	sVqMEUv56WELchHl0kZiGSD8WidykhVBOZPwuyztuu/5TaaEMhWFDp2GIdAbaOD9
	0MYOnwwZlbuha0Bz+h/wW4gfU1hkRHKwzuXXbd08hXd8bUhe1B9fV7UEXMEp9UXC
	p43hlJCwv41ZV5MZLl+rFvimHi17DjcCTftpvoUMoc6dAWZg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6vv018y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 11:08:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49MB8q6t010547
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 11:08:52 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Oct 2024 04:08:51 -0700
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v6 0/8] wifi: ath12k: some fixes and clean up for monitor mode
Date: Tue, 22 Oct 2024 19:08:23 +0800
Message-ID: <20241022110831.974-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qu_31RpAgjggxNQVSo-twGEtFNGfLyHp
X-Proofpoint-GUID: qu_31RpAgjggxNQVSo-twGEtFNGfLyHp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxlogscore=962 bulkscore=0 spamscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_040857_036424_2DE4F5A2 
X-CRM114-Status: UNSURE (   9.01  )
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

This patch set does some fixes and clean up for monitor mode.

v6:
    1. mention the change is also needed by QCN9274 in patch 2-5.
    2. mention the change is cleanup for patch 6.
v5:
    1. rebase on tag: ath/ath12k-mlo.
    2. remove patches which have conflicts with MLO branch.
v4: rebase on tag: ath/main(ath-202410161539).
v3: rebase on tag: ath/main(ath-202410111606).
v2: rebase on tag: ath-202410072115.

Kang Yang (8):
  wifi: ath12k: remove unused variable monitor_present
  wifi: ath12k: fix struct hal_rx_ppdu_end_user_stats
  wifi: ath12k: fix struct hal_rx_ppdu_start
  wifi: ath12k: fix struct hal_rx_phyrx_rssi_legacy_info
  wifi: ath12k: fix struct hal_rx_mpdu_start
  wifi: ath12k: delete NSS and TX power setting for monitor vdev
  wifi: ath12k: use tail MSDU to get MSDU information
  wifi: ath12k: fix A-MSDU indication in monitor mode

 drivers/net/wireless/ath/ath12k/core.h        |   9 +-
 .../wireless/ath/ath12k/debugfs_htt_stats.c   |   8 --
 drivers/net/wireless/ath/ath12k/dp_mon.c      | 108 ++++++++++--------
 drivers/net/wireless/ath/ath12k/hal_rx.h      |  53 +++++----
 drivers/net/wireless/ath/ath12k/mac.c         |  14 ---
 5 files changed, 97 insertions(+), 95 deletions(-)


base-commit: d9a3c1c3649e000fe709b6fdbf94b1069a5d6778
-- 
2.34.1


