Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C457FC71149
	for <ath12k@archiver.kernel.org>; Thu, 12 Jun 2025 02:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eiLd07SJCxjZopKuS4ArzooclGq9tE02D1+OJO7qByQ=; b=UhsbYCUWG5UVcc+Zm5WdNC6vfu
	+1Wb6lZXC8e6jhpaLtbSTubD/alvqOghMCsOckgo49BfY+sMnANB7q2O4grdhmkxozGR92JboMzVO
	x66Se/OSwVjr3BCk3JOoKNO9WN/4Vs5PWlBDI08JFpHOVYvr2+xg2dKo7kvADhrkgnmyk5sxr0+ik
	RmXSitp9A/LxMSDH0uHC4vHLaSVQbSpX/bLexzGPtDbYfkQD6XEZP3qdUEYhax25z0I8+F2guQvQE
	jxWnkYpVtwQ/7VMr7bc5b/BeqiREFwEu16TAlpR0mHDwkb2pNB2NKehVSXhkXpyt2MYF7dMcP6ST6
	+RpFFLkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPY0S-0000000C168-2AaN;
	Thu, 12 Jun 2025 02:49:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPWne-0000000BslZ-0YG6
	for ath12k@lists.infradead.org;
	Thu, 12 Jun 2025 01:32:15 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BK880f002374;
	Thu, 12 Jun 2025 01:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eiLd07SJCxjZopKuS4ArzooclGq9tE02D1+OJO7qByQ=; b=oqxfdpYR3R5DvdBs
	dL7suAVTiDyUSpESYQvdH4UOe2CvIpfGeA12cbR5v0crR6wv9S+ew0L0f5Uq4yfV
	+/vliMNyYc8gU2qfSUYw5r2fQWrfrW6YMvBGd8wFhxnZ7EuYumNGsBNUyWpYWl5q
	dcXs8IshDOMKqeZ1ckqzyNNNiXu6tyZoAdUHLgH7uDJomtTfMwUTgkEqmPXQuSTZ
	m+aNs5sYSzU6ow4oLuvek0M/niZaH2b7JSYteicAObF5pDdTYhHHu+zvCZkHpPYL
	aw0WtxenpE6NgcATrm3aPD5GXVwUgtt2SVa67+NH2M6XzgdxvdgJPsPze/u2GrLx
	GI8GYg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxy3cr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 01:32:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55C1WA77014395
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 01:32:10 GMT
Received: from [127.0.1.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Jun
 2025 18:32:08 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
Date: Thu, 12 Jun 2025 09:31:52 +0800
Subject: [PATCH ath-current 4/4] wifi: ath12k: don't wait when there is no
 vdev started
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250612-ath12k-fw-fixes-v1-4-12f594f3b857@quicinc.com>
References: <20250612-ath12k-fw-fixes-v1-0-12f594f3b857@quicinc.com>
In-Reply-To: <20250612-ath12k-fw-fixes-v1-0-12f594f3b857@quicinc.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Ramya Gnanasekar
	<ramya.gnanasekar@oss.qualcomm.com>,
        Aditya Kumar Singh
	<aditya.kumar.singh@oss.qualcomm.com>
CC: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: G3xTwWwCMzPHJg20oIZc-V-RCnUtMHky
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=684a2e1b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zPWCEbQWmxFCawYx:21 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=COk6AnOGAAAA:8 a=LKi86vrQLEXAMEGEImwA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: G3xTwWwCMzPHJg20oIZc-V-RCnUtMHky
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDAxMCBTYWx0ZWRfX2zCZL5Opj+Zg
 PSAimMoy6ITBV+BnO1IzcNo3KGgWzaPkk0mB7hob5ALdCUC/sRGypoRWFLeRvh6+3XKetXJRHdG
 5MGiI5Mh5d2gf9tEf5Tv5GzFnhiQSoCrwEN4W3InItpZLBK6GAK7TRT6fN0/LEVnp2hB1szSgVJ
 cVOy/vWtG+A1nVRiVpmWqyr1ffrZ0P3nW+5662EpQKh8HTlt2LurOi1Am0VtD2PNNaENi1bpQCa
 TX/3eSps1ANsib0NGB1qRScmkDIVDHi3h3lkV3MgfUBqi24D4YRjpIYfdWK9MR55A8kscde+SNX
 uqElAGqMHr0QUD0TpfiC7ZxqPqbMcNvwe9MZKJHQ5bXvLOEaoVloX6uh7IW6tiC9WpDISiVO/Om
 B7zRs2uDholfwpFAqeXsNwLpN4ZnblsMzgfayyedj/VmGaL3PkBfITB4yHr276MmWtjUHbqi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_01,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_183214_291025_7563BA26 
X-CRM114-Status: GOOD (  12.28  )
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

For WMI_REQUEST_VDEV_STAT request, firmware might split response into
multiple events dut to buffer limit, hence currently in
ath12k_wmi_fw_stats_process() host waits until all events received. In
case there is no vdev started, this results in that below condition
would never get satisfied

	((++ar->fw_stats.num_vdev_recvd) == total_vdevs_started)

consequently the requestor would be blocked until time out.

The same applies to WMI_REQUEST_BCN_STAT request as well due to:

	((++ar->fw_stats.num_bcn_recvd) == ar->num_started_vdevs)

Change to check the number of started vdev first: if it is zero, finish
directly; if not, follow the old way.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1

Fixes: e367c924768b ("wifi: ath12k: Request vdev stats from firmware")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index dc6a2ad63663d988e495b115a1fc24a6408df600..bd04dd98f5f47a4a7d773d3b707a7e53b8f9b29e 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -7631,7 +7631,7 @@ static void ath12k_wmi_fw_stats_process(struct ath12k *ar,
 {
 	struct ath12k_base *ab = ar->ab;
 	struct ath12k_pdev *pdev;
-	bool is_end;
+	bool is_end = true;
 	size_t total_vdevs_started = 0;
 	int i;
 
@@ -7651,7 +7651,9 @@ static void ath12k_wmi_fw_stats_process(struct ath12k *ar,
 		}
 		rcu_read_unlock();
 
-		is_end = ((++ar->fw_stats.num_vdev_recvd) == total_vdevs_started);
+		if (total_vdevs_started)
+			is_end = ((++ar->fw_stats.num_vdev_recvd) ==
+				  total_vdevs_started);
 
 		list_splice_tail_init(&stats->vdevs,
 				      &ar->fw_stats.vdevs);
@@ -7670,7 +7672,9 @@ static void ath12k_wmi_fw_stats_process(struct ath12k *ar,
 		/* Mark end until we reached the count of all started VDEVs
 		 * within the PDEV
 		 */
-		is_end = ((++ar->fw_stats.num_bcn_recvd) == ar->num_started_vdevs);
+		if (ar->num_started_vdevs)
+			is_end = ((++ar->fw_stats.num_bcn_recvd) ==
+				  ar->num_started_vdevs);
 
 		list_splice_tail_init(&stats->bcn,
 				      &ar->fw_stats.bcn);

-- 
2.34.1


