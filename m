Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17813C54F2E
	for <ath12k@archiver.kernel.org>; Thu, 22 May 2025 08:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13udXdGvp/sWyqVQcCI0INzXmz+6L+Bqht8dD/AR41I=; b=BCk7kaYL1DRhX6eXcsb53Kms+v
	uzOVoMYSu+5O8tVFDbD7f4oJV6NwnKWBTh/N+PipvLmkS6xPvEa4/eEbEFlW5e0t5N+5DTNWAke5L
	j0NSFDmBQqMGv20XGzVJ5TKSsfkVq2YXoJVvaFkfHyNjWCszT6gvzxOh8j5o/IyfCddeF5g2qwM+J
	ByVzY2FUCEqcny+TuGYZX+WqpL8eqwacZypsRzdu1vgjYCmPdLXZR/aJt2ArxTvvPAuFADGcCS9u2
	cYBlhan8OlDXlZUVlVz2VEVrZXzG449Q+3hUcJxtJk8OApGhVNgbgCc1uSPQxdMAFAUFAiN0oL36W
	BK5KQ/kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1m6-00000000Ofd-2m0Z;
	Thu, 22 May 2025 08:59:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1hU-00000000NPb-15S4
	for ath12k@lists.infradead.org;
	Thu, 22 May 2025 08:54:53 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M849xl010335;
	Thu, 22 May 2025 08:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	13udXdGvp/sWyqVQcCI0INzXmz+6L+Bqht8dD/AR41I=; b=hHVjG572n2YRzSac
	jV8nalOtXInd2l9RIWko1fymgVM5bxXjz/YyxT2R656ysZF+ONEj3QXcwtiENpb7
	AfnXD1RLSPORsks2CeVPjuLLxMZEWpWQjojrAEnR2eXW8qlXMP1dJtHhmvmVUMzs
	oi2yhNvhJFJYlWHe51jWnFaZxgyQ0wqPrhBk0kGVOH/8tnf3QciC/BmfmtG7JFlu
	ue7QjaUar4P1mw3+JcivcUpwN5JFy9aSV0wzQjSk90E6yYLlxvuXhiFHLkD8YvIv
	nmmQ/o3wh7OpvHMeIBBRq83wcmvaGSf3GHt5Gtw50A5lGTBT3kKb98fn05dBBJW3
	tEWgTg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9wqcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 08:54:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54M8skmk020058
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 08:54:46 GMT
Received: from [127.0.1.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 22 May
 2025 01:54:45 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
Date: Thu, 22 May 2025 16:54:11 +0800
Subject: [PATCH ath-next 2/6] wifi: ath12k: parse and save
 sbs_lower_band_end_freq from WMI_SERVICE_READY_EXT2_EVENTID event
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250522-ath12k-sbs-dbs-v1-2-54a29e7a3a88@quicinc.com>
References: <20250522-ath12k-sbs-dbs-v1-0-54a29e7a3a88@quicinc.com>
In-Reply-To: <20250522-ath12k-sbs-dbs-v1-0-54a29e7a3a88@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682ee657 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=M8GWZWT4-IjaPc7Le1UA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: tq8IhhxfNBQWYc1IDf3WZyfpNgaymb27
X-Proofpoint-GUID: tq8IhhxfNBQWYc1IDf3WZyfpNgaymb27
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA4OSBTYWx0ZWRfXzweI9pq1SZM+
 cKsePtcssvkjFafPixatFKVq/CELl2jHA3kUFZnTPnBvkbso2dEMmQVSU61t9Xzq6CYl8oORlgt
 fS0ZpveQ3ekRidtfzVu1D9CsAlgxC60+qLA4AdunRp4IPly/DE7HxAx+v2SgXUKikRIEKIf08OX
 vlVtLyOWv0he4AOD6iQFyxUxTfQKqA/1PvjW9xrIuU7RGgsaCP+gQ8Z30q599Z8gS1FlGBqWJjk
 M8hK1fZlUnzPhsC1/Y9YPfQlGrti7QT1SdQhr9vpPA/+v1/wIZd3N0V+kJSvfA9aJs9yzvhvZWN
 IMEA6Iq+1vhg5mrEgm88RXQHPcc6pJ/2PLIchiixlj4b5rybSnLwLIe/kyBm7LF1IbnbdQCAplI
 HrlitHEYiCuZjiS8ErSlqUDrSBzui9eSUzwXcnCx/yfxpjQhaJQ91smfQRYywyHvy3zUzQW8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_04,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_015452_420924_7E813165 
X-CRM114-Status: GOOD (  11.57  )
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

Firmware sends the boundary between lower and higher bands in
ath12k_wmi_dbs_or_sbs_cap_params structure embedded in
WMI_SERVICE_READY_EXT2_EVENTID event. The boundary is needed when
updating frequency range in the following patch. So parse and save
it for later use. Note ath12k_wmi_dbs_or_sbs_cap_params is placed
after some other structures, so placeholders for them are added
as well.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 23 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h |  6 ++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 056bee8023a085dbc7c9be8177105b66e29eaeed..44c03d6657843a5c9324d7787aa069de295456bb 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -91,6 +91,11 @@ struct ath12k_wmi_svc_rdy_ext2_parse {
 	bool dma_ring_cap_done;
 	bool spectral_bin_scaling_done;
 	bool mac_phy_caps_ext_done;
+	bool hal_reg_caps_ext2_done;
+	bool scan_radio_caps_ext2_done;
+	bool twt_caps_done;
+	bool htt_msdu_idx_to_qtype_map_done;
+	bool dbs_or_sbs_cap_ext_done;
 };
 
 struct ath12k_wmi_rdy_parse {
@@ -4991,6 +4996,7 @@ static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
 					 u16 tag, u16 len,
 					 const void *ptr, void *data)
 {
+	const struct ath12k_wmi_dbs_or_sbs_cap_params *dbs_or_sbs_caps;
 	struct ath12k_wmi_pdev *wmi_handle = &ab->wmi_ab.wmi[0];
 	struct ath12k_wmi_svc_rdy_ext2_parse *parse = data;
 	int ret;
@@ -5032,6 +5038,23 @@ static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
 			}
 
 			parse->mac_phy_caps_ext_done = true;
+		} else if (!parse->hal_reg_caps_ext2_done) {
+			parse->hal_reg_caps_ext2_done = true;
+		} else if (!parse->scan_radio_caps_ext2_done) {
+			parse->scan_radio_caps_ext2_done = true;
+		} else if (!parse->twt_caps_done) {
+			parse->twt_caps_done = true;
+		} else if (!parse->htt_msdu_idx_to_qtype_map_done) {
+			parse->htt_msdu_idx_to_qtype_map_done = true;
+		} else if (!parse->dbs_or_sbs_cap_ext_done) {
+			dbs_or_sbs_caps = ptr;
+			ab->wmi_ab.sbs_lower_band_end_freq =
+				__le32_to_cpu(dbs_or_sbs_caps->sbs_lower_band_end_freq);
+
+			ath12k_dbg(ab, ATH12K_DBG_WMI, "sbs_lower_band_end_freq %u\n",
+				   ab->wmi_ab.sbs_lower_band_end_freq);
+
+			parse->dbs_or_sbs_cap_ext_done = true;
 		}
 		break;
 	default:
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 96c31b7820ec14ec8df2fa0d060da6d257d7a083..e69d53054f6d863e5d02358175ccc0a23012a829 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2747,6 +2747,11 @@ struct wmi_service_ready_ext2_event {
 	__le32 default_num_msduq_supported_per_tid;
 } __packed;
 
+struct ath12k_wmi_dbs_or_sbs_cap_params {
+	__le32 hw_mode_id;
+	__le32 sbs_lower_band_end_freq;
+} __packed;
+
 struct ath12k_wmi_caps_ext_params {
 	__le32 hw_mode_id;
 	__le32 pdev_and_hw_link_ids;
@@ -5097,6 +5102,7 @@ struct ath12k_wmi_base {
 	struct ath12k_wmi_target_cap_arg *targ_cap;
 
 	struct ath12k_svc_ext_info svc_ext_info;
+	u32 sbs_lower_band_end_freq;
 };
 
 struct wmi_pdev_set_bios_interface_cmd {

-- 
2.25.1


