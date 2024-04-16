Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A56CC4345F
	for <ath12k@archiver.kernel.org>; Tue, 16 Apr 2024 08:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DZTdgCW1UKXQk4uiSGZ3i/K/Qero0bkVNwDoyB5Qjts=; b=hZupooBECQlhWSjb3IIraXlMKx
	38MrbX1s6At1rLKh795YbdxrM+D72kVxl9S5Rp+Gor7HQeeYyP+Nzfrdte9gP6FJxoaexfNonaS11
	xgFP4DrZ5TA2gorex0g9ZiJ0DtNRzjSrFcCvqIcC65MldSZWui6vcg15tTM7i6nfmHJC3GQzWo5Kd
	84fN4mhoACPD6RhksEismnHYq2DJnJavuCXVJebchE+OlZCOdu+vrl2ZMmtKn54zWY9A0KEyP32cg
	LRFjeR9LmDSS9qf4GXH1ZgmHpLwFA/L5TTY9a4YwfTji+l8Yo/BdXnfOxA60lnEJwUFGaB4QkLeCJ
	kJva542A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdmc-0000000BMn6-0CW8
	for ath12k@archiver.kernel.org;
	Tue, 16 Apr 2024 08:03:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdmU-0000000BMje-0T3O
	for ath12k@lists.infradead.org;
	Tue, 16 Apr 2024 08:03:12 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43G7BceI014290;
	Tue, 16 Apr 2024 08:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=DZTdgCW
	1UKXQk4uiSGZ3i/K/Qero0bkVNwDoyB5Qjts=; b=M4RACqsLkBZqWmv5SR0Evow
	v+K8LAp7DWZfMQnOLq7PpmV2I3B6k5bIodqNmX57FMoA39FEysYZV6ENXtn1qOtt
	Zi6b8m0UXyATh9no9LpGX6YHS1JUqE3WAjgNHxCcTQnYVLNc7vIfAhWTic1E/Uw9
	HMEHX4w063+l/wgG/QrPCcCxPzCx40GSzco18yeHHGcstIqVtH3pBJTOl37kLwZn
	OZQth/vEoLCiieEX300znsnR2PKgvzCepp1EemhCSqmrBhmSkISO8l6IqmxIRKv+
	kj9W5NblXvgBTA1eFwHur55z6EsGyay7t1uVPjl9ivklBBeXlJrxPDbjUgBjSkA=
	=
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xhmqcg861-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 08:03:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43G82xDj019301
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 08:02:59 GMT
Received: from hu-kathirve-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 16 Apr 2024 01:02:57 -0700
From: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Kathirvel
	<quic_kathirve@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH v2] wifi: ath12k: fix out-of-bound access of qmi_invoke_handler()
Date: Tue, 16 Apr 2024 13:32:34 +0530
Message-ID: <20240416080234.2882725-1-quic_kathirve@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: C-3x-stD6uvGqDh41IoB7jAXGy1i1GiE
X-Proofpoint-ORIG-GUID: C-3x-stD6uvGqDh41IoB7jAXGy1i1GiE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_04,2024-04-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 mlxscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404160048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_010306_350383_A8B85678 
X-CRM114-Status: GOOD (  11.13  )
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

Currently, there is no terminator entry for ath12k_qmi_msg_handlers hence
facing below KASAN warning,

 ==================================================================
 BUG: KASAN: global-out-of-bounds in qmi_invoke_handler+0xa4/0x148
 Read of size 8 at addr ffffffd00a6428d8 by task kworker/u8:2/1273

 CPU: 0 PID: 1273 Comm: kworker/u8:2 Not tainted 5.4.213 #0
 Workqueue: qmi_msg_handler qmi_data_ready_work
 Call trace:
  dump_backtrace+0x0/0x20c
  show_stack+0x14/0x1c
  dump_stack+0xe0/0x138
  print_address_description.isra.5+0x30/0x330
  __kasan_report+0x16c/0x1bc
  kasan_report+0xc/0x14
  __asan_load8+0xa8/0xb0
  qmi_invoke_handler+0xa4/0x148
  qmi_handle_message+0x18c/0x1bc
  qmi_data_ready_work+0x4ec/0x528
  process_one_work+0x2c0/0x440
  worker_thread+0x324/0x4b8
  kthread+0x210/0x228
  ret_from_fork+0x10/0x18

 The address belongs to the variable:
  ath12k_mac_mon_status_filter_default+0x4bd8/0xfffffffffffe2300 [ath12k]
 [...]
 ==================================================================

Add a dummy terminator entry at the end to assist the qmi_invoke_handler()
in traversing up to the terminator entry without accessing an
out-of-boundary index.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
---
v2:
	Added Tested-on tag and wifi prefix
---
 drivers/net/wireless/ath/ath12k/qmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index db8ba5fec2ae..b837639e54f8 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -3180,6 +3180,9 @@ static const struct qmi_msg_handler ath12k_qmi_msg_handlers[] = {
 		.decoded_size = sizeof(struct qmi_wlanfw_fw_ready_ind_msg_v01),
 		.fn = ath12k_qmi_msg_fw_ready_cb,
 	},
+
+	/* end of list */
+	{},
 };
 
 static int ath12k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,

base-commit: 363e7193eaf258fe7f04e8db560bd8a282a12cd9
-- 
2.34.1


