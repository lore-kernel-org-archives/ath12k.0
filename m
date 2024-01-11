Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3649C47077
	for <ath12k@archiver.kernel.org>; Thu, 11 Jan 2024 18:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RGPZeqDQNRac1/rQmrmIEHG5grim6/lqZ/AxEhfEY9g=; b=MhcMmkjCz9BDLNdkl5fJFxUy+z
	tu/t+VoBwtrjv5DHzEIQZLZfSjaDn/HtQBeD3iBdFwuas3QM0bsv1/RVRNX+l4mOjE+/UhLagimJg
	cpi2DdV2aG452jUobg/8b7wazAVNyRyusnbQdfnTyyiw/c8kKAWq21fgdqFMmZM8VvOlBrIIyjesg
	azLEapNDZ+LrWIH9M+HdfwK6644PdOVB7XzyfFOOsTN+LIVgxbioskBQAvty4T2HAQYensIaibC6k
	FegL/u6ZsVlpNxw+xqts/F3Jf/5G/KejeXSZK8+Up2X3SWcnmha2fA1z6z7H2op2MGjjDIm/mM44j
	7FKRpW2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNzR8-000mx3-1T
	for ath12k@archiver.kernel.org;
	Thu, 11 Jan 2024 18:05:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNzR4-000mvr-1v
	for ath12k@lists.infradead.org;
	Thu, 11 Jan 2024 18:05:48 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40BArZaq003403;
	Thu, 11 Jan 2024 18:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=RGPZeqDQNRac1/rQmrmIEHG5grim6/lqZ/AxEhfEY9g
	=; b=dq+eu/voj8FX1q3iehmvJ3+qNmRX73OMuCpWvOQTZc8oIiBQGJretZzEKLx
	6TU3zEC2NnhH0Xr6UckqR4mvZOezyp5x+99hy4xaNmPVQlOlSpTlKROhbOIO+zqc
	Y3EUzii0oLLFYAbFLvStSqagJYUKfcBWBhnD92gnxJ18NkL4XYjrIIJ2VJ0T7JyI
	dITP93Xko6gfiLlq5F/2by8Aq3X4RbJCYbUeaYArJQJmOR9rRyYk4AtoMGFlim1S
	7JNwPrkoI2SitXJ3Mjigav0NFM62UCiw2ozFUPh/8twl587KJJrc91je592qwP1I
	jj4d8IRIRNt19L5GVVe6adUqDCQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vj6c8j64k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 18:05:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40BI5gNr004005
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 18:05:42 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 11 Jan
 2024 10:05:42 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Thu, 11 Jan 2024 10:05:31 -0800
Subject: [PATCH v2 2/3] wifi: ath12k: Add missing qmi_txn_cancel() calls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240111-qmi-cleanup-v2-2-53343af953d5@quicinc.com>
References: <20240111-qmi-cleanup-v2-0-53343af953d5@quicinc.com>
In-Reply-To: <20240111-qmi-cleanup-v2-0-53343af953d5@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.12.3
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vopB0sYRD5CN4obQqOla83QOllI_SmHG
X-Proofpoint-GUID: vopB0sYRD5CN4obQqOla83QOllI_SmHG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 adultscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401110142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_100546_710915_B16EA47D 
X-CRM114-Status: GOOD (  10.94  )
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

Per the QMI documentation "A client calling qmi_txn_init() must call
either qmi_txn_wait() or qmi_txn_cancel() to free up the allocated
resources."

Unfortunately, in most of the ath12k messaging functions, when
qmi_send_request() fails, the function returns without performing the
necessary cleanup. So update those functions to call qmi_txn_cancel()
when qmi_send_request() fails.

No functional changes, compile tested only.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 180e86c2a10c..1f2df2e3fbce 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -1977,6 +1977,7 @@ static int ath12k_qmi_host_cap_send(struct ath12k_base *ab)
 			       QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN,
 			       qmi_wlanfw_host_cap_req_msg_v01_ei, &req);
 	if (ret < 0) {
+		qmi_txn_cancel(&txn);
 		ath12k_warn(ab, "Failed to send host capability request,err = %d\n", ret);
 		goto out;
 	}
@@ -2040,6 +2041,7 @@ static int ath12k_qmi_fw_ind_register_send(struct ath12k_base *ab)
 			       QMI_WLANFW_IND_REGISTER_REQ_MSG_V01_MAX_LEN,
 			       qmi_wlanfw_ind_register_req_msg_v01_ei, req);
 	if (ret < 0) {
+		qmi_txn_cancel(&txn);
 		ath12k_warn(ab, "Failed to send indication register request, err = %d\n",
 			    ret);
 		goto out;
@@ -2114,6 +2116,7 @@ static int ath12k_qmi_respond_fw_mem_request(struct ath12k_base *ab)
 			       QMI_WLANFW_RESPOND_MEM_REQ_MSG_V01_MAX_LEN,
 			       qmi_wlanfw_respond_mem_req_msg_v01_ei, req);
 	if (ret < 0) {
+		qmi_txn_cancel(&txn);
 		ath12k_warn(ab, "qmi failed to respond memory request, err = %d\n",
 			    ret);
 		goto out;
@@ -2229,6 +2232,7 @@ static int ath12k_qmi_request_target_cap(struct ath12k_base *ab)
 			       QMI_WLANFW_CAP_REQ_MSG_V01_MAX_LEN,
 			       qmi_wlanfw_cap_req_msg_v01_ei, &req);
 	if (ret < 0) {
+		qmi_txn_cancel(&txn);
 		ath12k_warn(ab, "qmi failed to send target cap request, err = %d\n",
 			    ret);
 		goto out;
@@ -2572,6 +2576,7 @@ static int ath12k_qmi_wlanfw_m3_info_send(struct ath12k_base *ab)
 			       QMI_WLANFW_M3_INFO_REQ_MSG_V01_MAX_MSG_LEN,
 			       qmi_wlanfw_m3_info_req_msg_v01_ei, &req);
 	if (ret < 0) {
+		qmi_txn_cancel(&txn);
 		ath12k_warn(ab, "qmi failed to send M3 information request, err = %d\n",
 			    ret);
 		goto out;
@@ -2618,6 +2623,7 @@ static int ath12k_qmi_wlanfw_mode_send(struct ath12k_base *ab,
 			       QMI_WLANFW_WLAN_MODE_REQ_MSG_V01_MAX_LEN,
 			       qmi_wlanfw_wlan_mode_req_msg_v01_ei, &req);
 	if (ret < 0) {
+		qmi_txn_cancel(&txn);
 		ath12k_warn(ab, "qmi failed to send mode request, mode: %d, err = %d\n",
 			    mode, ret);
 		goto out;
@@ -2709,6 +2715,7 @@ static int ath12k_qmi_wlanfw_wlan_cfg_send(struct ath12k_base *ab)
 			       QMI_WLANFW_WLAN_CFG_REQ_MSG_V01_MAX_LEN,
 			       qmi_wlanfw_wlan_cfg_req_msg_v01_ei, req);
 	if (ret < 0) {
+		qmi_txn_cancel(&txn);
 		ath12k_warn(ab, "qmi failed to send wlan config request, err = %d\n",
 			    ret);
 		goto out;

-- 
2.42.0


