Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302A4CFA74C
	for <ath12k@archiver.kernel.org>; Fri,  4 Oct 2024 08:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mApHoNudVFaAphI8voke7EEkvC5/0ZzYJu85IhqZRV8=; b=QoeRoViXAaF4JrLswTjD0jKG6Y
	vhRo/r9Fw3Gv0q7JhIb8c44GHzp8esnQ62ymPOraCRLI/36wX8yA+IdvVjxPEyTf8ZeEkIlVpiNPA
	UR2Z27GXnOD+nzcrcu1i74/1s7z2fe5Pjb39zqJr46vjc+819IDM/W5/tsANsfTfFpcv0HOFgvwwJ
	K0S42kLgiPqdI51CnRBooxclV5yGtfFY47KSfM7AySeMRcsS2+yKydnPq6/hPbu4JXyfL2T3m+HUa
	qsS1c6bra2FvSwNfEswR5QUT9m3IGbJBkb0fO3kCrJ5Hj+YiMj1t+iYHcGGIyUJcEmJEYWH7JsL62
	tnSVkyTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swe9x-0000000BVhj-3M26
	for ath12k@archiver.kernel.org;
	Fri, 04 Oct 2024 08:59:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swe9u-0000000BVgd-2wCh
	for ath12k@lists.infradead.org;
	Fri, 04 Oct 2024 08:59:36 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 493I02sM025933;
	Fri, 4 Oct 2024 08:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mApHoNudVFaAphI8voke7E
	EkvC5/0ZzYJu85IhqZRV8=; b=lfPIP5wFa+E0YMKMxHlewsrwOKFBPai6jlgOZb
	plltCEl6oUXVg/TGRmy2X+/eLdWg8wug3YEphwefEl3iLKvtrFgCDhLK1aFjfquF
	HIFS5SEPM9RrmjLF8PoOsidUdECM9j+qd2YIHwVK1/G0ukR2nsxY0u+xoWswunw5
	m7VaAq2Z7iqTXkvlx8Do8T7wMTkK0+OYEylygDTpcyNxsbhXkBeBnztpsQz1Db1L
	1b8mSEhs60czYqFoeOvxYOkEk4eXJcrSoX6Dtc2HB53vw3U5bEtYx/l0fioNmScW
	AmR9jYtfCU+lQ0nZGB8+Y3HRbek9mnZNiVMMbruEK7Mr+8cA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205khjb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 08:59:34 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4948xXDB017262
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 08:59:33 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 4 Oct 2024 01:59:31 -0700
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH v2] wifi: ath12k: Modify print_array_to_buf() to support arrays with 1-based semantics
Date: Fri, 4 Oct 2024 14:29:15 +0530
Message-ID: <20241004085915.1788951-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7GJ8PisdgOLiNW3QZQoERCwgtpOQ4C8N
X-Proofpoint-GUID: 7GJ8PisdgOLiNW3QZQoERCwgtpOQ4C8N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=957
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410040065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_015934_769214_050B7CF8 
X-CRM114-Status: GOOD (  12.08  )
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

The API print_array_to_buf() currently supports printing
arrays with 0 indexing. In some cases, a few arrays need
to be printed with 1-based indexing, i.e., array should be
printed, starting with 1.

Add a new version of print_array_to_buf(), named
print_array_to_buf_index(), which implements the functionality
of print_array_to_index(), but with an extra variable, pointing
to the index starting with which the array should be printed.
Modify print_array_to_buf() to call
print_array_to_buf_index() with 0 as the starting index.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
---
 .../net/wireless/ath/ath12k/debugfs_htt_stats.c    | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index f1b7e74aefe4..ec7add76ec85 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -12,8 +12,8 @@
 #include "dp_rx.h"
 
 static u32
-print_array_to_buf(u8 *buf, u32 offset, const char *header,
-		   const __le32 *array, u32 array_len, const char *footer)
+print_array_to_buf_index(u8 *buf, u32 offset, const char *header, u32 stats_index,
+			 const __le32 *array, u32 array_len, const char *footer)
 {
 	int index = 0;
 	u8 i;
@@ -26,7 +26,7 @@ print_array_to_buf(u8 *buf, u32 offset, const char *header,
 	for (i = 0; i < array_len; i++) {
 		index += scnprintf(buf + offset + index,
 				   (ATH12K_HTT_STATS_BUF_SIZE - offset) - index,
-				   " %u:%u,", i, le32_to_cpu(array[i]));
+				   " %u:%u,", stats_index++, le32_to_cpu(array[i]));
 	}
 	/* To overwrite the last trailing comma */
 	index--;
@@ -40,6 +40,14 @@ print_array_to_buf(u8 *buf, u32 offset, const char *header,
 	return index;
 }
 
+static u32
+print_array_to_buf(u8 *buf, u32 offset, const char *header,
+		   const __le32 *array, u32 array_len, const char *footer)
+{
+	return print_array_to_buf_index(buf, offset, header, 0, array, array_len,
+					footer);
+}
+
 static void
 htt_print_tx_pdev_stats_cmn_tlv(const void *tag_buf, u16 tag_len,
 				struct debug_htt_stats_req *stats_req)

base-commit: 8ed36fe71fd60c851540839b105fd1fddc870c61
-- 
2.25.1


