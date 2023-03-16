Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FC3C6FD19
	for <ath12k@archiver.kernel.org>; Thu, 16 Mar 2023 04:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pgbdxck1WUsPA6+wyvFw0bv3n3n2j+fPYoKWoTdQquY=; b=Ior5/nxfb88+Oy
	sLtXp77T1PQC7wnCWw+PB1mNkPCsg2am+5xCOXSZedHLv8HdWJNmbka5IArLDMciVbpk5pkaCz2Jc
	6OkAaxtS7RsaiMx7hRJ4Ke5QsygUP1/UxCQ20UsCykshPbhWfAwKuwlTLBsbi2vNWYwHCwcpVUiJ8
	0Lc0tWj8lmkzRBNjzSszBBq1M4ph1k5XJmfgrA6caZwQcPhfpePS8ymFHSFlfOg/WW39pxlaD1W9Q
	cDP0WfoNZ7kKpW29FQzpy6px6KsTR2m5W1ChEKryBxnx8QM/zbi7Tv32cx352b4jbuVXPgo3A6Z0t
	iCIjdkexn+J2O2UEFIhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pceyA-00FARr-0I
	for ath12k@archiver.kernel.org;
	Thu, 16 Mar 2023 04:12:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcey6-00FARQ-2Q
	for ath12k@lists.infradead.org;
	Thu, 16 Mar 2023 04:12:00 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32G243aK026548;
	Thu, 16 Mar 2023 04:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=WUJqB4wblkKMmtLI4SCICjgalhUJvzmuMeH314QVpjk=;
 b=R7x8u7o3duCbIRm+VLNMf4YXc+/UBcujwMnaW0NU76GmW8DvMCR+bQBIcAh6oNhcbppA
 zKcp3ogfnuwrsTvUewttwVpX8JoSKoEzBgf9iF38jmVF3vilRK+mlz7kfASCudZNN9R8
 mmeAVj9/RSbkFPgNK8JTqh9wR4KNIGJhfduJtJEED1s9S5Kmp/ZRQ4QA9rkDG9gvQ9fR
 +ld/J+5+6GdpiJq+3RR8mQfUCvVVdabn6RWNhpmqarjckkygaORtRz6uYoGsTBoFrW65
 vbScsLBIPSfL8ioQFpDasTHwMH0BQmpnn27e4g9WcEhqW5/J+RlZ5S0Cd5jtzmrk0drQ fw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pbpxjrn3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Mar 2023 04:11:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32G4Bv3T000462
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Mar 2023 04:11:57 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 15 Mar 2023 21:11:55 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH] wifi: ath12k: Identify DFS channel when sending scan channel list command
Date: Thu, 16 Mar 2023 12:11:44 +0800
Message-ID: <20230316041144.7770-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fZb-VRYzW3DOSFJs02Ulc-mpHv0gYnLC
X-Proofpoint-ORIG-GUID: fZb-VRYzW3DOSFJs02Ulc-mpHv0gYnLC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_02,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 mlxscore=0 bulkscore=0 clxscore=1011
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303150002 definitions=main-2303160035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_211158_816843_16D7A0A3 
X-CRM114-Status: GOOD (  13.42  )
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

WMI_CHAN_INFO_DFS flag should be set when configuring a DFS channel
included in scan channel list. Without it, firmware will not send a
probe request frame which is needed in connection to an AP configured
with hidden SSID/network_id. So fix this to allow probe request frames
to be sent in cases where a beacon frame has been seen on the channel
first.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 3e6991120e53..af910296c41e 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -2438,6 +2438,9 @@ int ath12k_wmi_send_scan_chan_list_cmd(struct ath12k *ar,
 			if (channel_arg->psc_channel)
 				chan_info->info |= cpu_to_le32(WMI_CHAN_INFO_PSC);
 
+			if (channel_arg->dfs_set)
+				chan_info->info |= cpu_to_le32(WMI_CHAN_INFO_DFS);
+
 			chan_info->info |= le32_encode_bits(channel_arg->phy_mode,
 							    WMI_CHAN_INFO_MODE);
 			*reg1 |= le32_encode_bits(channel_arg->minpower,

base-commit: 3df3715e556027e94246b2cb30986563362a65f4
-- 
2.25.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
