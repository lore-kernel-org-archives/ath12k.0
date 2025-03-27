Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D8AC36011
	for <ath12k@archiver.kernel.org>; Thu, 27 Mar 2025 05:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Rwu+KoLXssv9dY+W0d9GBiCyxWoroY++DvnAbRIVX8=; b=poxg4VpsSbaVL8k8xOJ7PSIaCV
	FTtaIokgAhfhY3pEOyiaQADhQuAqo0G0M82iTWzOacTLLd8awSEseeiZfl9XCecHiaf2dum90VKnx
	tD7CV0hsFhyXhqMf10UjnfqAvrsxwwSKQrz9XM3gx2vH5pksH4GEh/0DXK+fN5xJT1pxEhAYPv2LQ
	EM5C56Gi1hbqQ5xB84Na/AKFRraNEvjlmiHA0FIwWJw+f26a88ET0dRqvATGyTlrbHwMwTXjmGTcR
	Ye2roJfKHA8YL0VkCl+7tdkITCoxApRZjh3lktDmCsf1VmEtHYzccmiG1BchY/nCo555W2/3dFc2+
	LTvfIXdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txfZZ-0000000AClD-2Wua
	for ath12k@archiver.kernel.org;
	Thu, 27 Mar 2025 05:14:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txfZX-0000000ACjq-26zt
	for ath12k@bombadil.infradead.org;
	Thu, 27 Mar 2025 05:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7Rwu+KoLXssv9dY+W0d9GBiCyxWoroY++DvnAbRIVX8=; b=NJ6kOwBqiv8IACvkmqNj5x3AHo
	yWGKuJcYYLE4PvNQeIkbmq6tkN1ApcX2kDQ4wb6Z5soVtFo8nPSlVc3ImR8Nu+LgYkHAVNn63mPtz
	WZxeAD0Pac6mk3o4wf3mBpEXzIvDBfR/zJVFJYB85rcW80Jjuy05Cpl7mtSNRFX4/vzacOAR91wNI
	Ki4B6nuIfF5V7U5NQoRfe+sA5mJ3cylRmbxaH/pWnkAYP7IvKrrocJ2B8tSbGursnSrrEAuUNIKFT
	cChbRIJY9JDtEFwO666syjnLPINmCgRsGB5dizXBzVYexb2pcwdPLfgUNS4lt9etJcLhPT0rp0Mob
	E4RWRWvA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txfZT-00000005uxI-1JDq
	for ath12k@lists.infradead.org;
	Thu, 27 Mar 2025 05:14:30 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R56SWc029695;
	Thu, 27 Mar 2025 05:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Rwu+KoLXssv9dY+W0d9GBiCyxWoroY++DvnAbRIVX8=; b=lVxGobz2WBDL4ITh
	U/2HaB73dNNhXSGAIkxAJm+j7KldB6vXfUDO8MK0M6DP2Cjs0OsXHDfqTgIaEwco
	TtH4q0gn/KcFe1gkQjJMmytxzHZlvtvCnRFlQKVN4XaewYQ/un2WyJGfS3gHy9mt
	HNpFYjJAbePxhukxDNCBNL8zJUh5VWZjtOfp/4FpsRL4bEG1cpQAHDEgA1zWCKSe
	IP18rZilrfknihAE7plKm7P78PyrzWCjEERk0UyNfqXjg7iPCCxiPlqm8n47y+Zb
	x+8R6C/kGHmkIFTW3tphH7n/QMAIXqiDAb2OYFZn70SWjMAZz6/Oadr7qeOJviQA
	WUV+bA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ktene5ws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 05:14:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52R5EKh0024338
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 05:14:20 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Mar 2025 22:13:56 -0700
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <johannes@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Rameshkumar Sundaram
	<quic_ramess@quicinc.com>
Subject: [PATCH wireless-next v5 3/4] wifi: ieee80211: Add helpers to fetch EMLSR delay and timeout values
Date: Thu, 27 Mar 2025 10:43:19 +0530
Message-ID: <20250327051320.3253783-4-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250327051320.3253783-1-quic_ramess@quicinc.com>
References: <20250327051320.3253783-1-quic_ramess@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=TuvmhCXh c=1 sm=1 tr=0 ts=67e4dead cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=6a0EW4FuJA1U0GZqRFsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _XpSmx1cJFs-Is23op0fhjppvnGIxfvp
X-Proofpoint-ORIG-GUID: _XpSmx1cJFs-Is23op0fhjppvnGIxfvp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_051427_670861_1EBB395B 
X-CRM114-Status: GOOD (  11.20  )
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

Add helpers to get EMLSR transition delay, padding delay and transition
timeout values from EML capabilities field of Multi-link Element.

Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
---
 include/linux/ieee80211.h | 74 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/include/linux/ieee80211.h b/include/linux/ieee80211.h
index 508d466de1cc..0720a9dc1dc8 100644
--- a/include/linux/ieee80211.h
+++ b/include/linux/ieee80211.h
@@ -5615,6 +5615,80 @@ static inline bool ieee80211_tid_to_link_map_size_ok(const u8 *data, size_t len)
 	return len >= fixed + elem_len;
 }
 
+/**
+ * ieee80211_emlsr_pad_delay_in_us - Fetch the EMLSR Padding delay
+ *	in microseconds
+ * @eml_cap: EML capabilities field value from common info field of
+ *	the Multi-link element
+ * Return: the EMLSR Padding delay (in microseconds) encoded in the
+ *	EML Capabilities field
+ */
+
+static inline u32 ieee80211_emlsr_pad_delay_in_us(u16 eml_cap)
+{
+	/* IEEE Std 802.11be-2024 Table 9-417i—Encoding of the EMLSR
+	 * Padding Delay subfield.
+	 */
+	u32 pad_delay = u16_get_bits(eml_cap,
+				     IEEE80211_EML_CAP_EMLSR_PADDING_DELAY);
+
+	if (!pad_delay ||
+	    pad_delay > IEEE80211_EML_CAP_EMLSR_PADDING_DELAY_256US)
+		return 0;
+
+	return 32 * (1 << (pad_delay - 1));
+}
+
+/**
+ * ieee80211_emlsr_trans_delay_in_us - Fetch the EMLSR Transition
+ *	delay in microseconds
+ * @eml_cap: EML capabilities field value from common info field of
+ *	the Multi-link element
+ * Return: the EMLSR Transition delay (in microseconds) encoded in the
+ *	EML Capabilities field
+ */
+
+static inline u32 ieee80211_emlsr_trans_delay_in_us(u16 eml_cap)
+{
+	/* IEEE Std 802.11be-2024 Table 9-417j—Encoding of the EMLSR
+	 * Transition Delay subfield.
+	 */
+	u32 trans_delay =
+		u16_get_bits(eml_cap,
+			     IEEE80211_EML_CAP_EMLSR_TRANSITION_DELAY);
+
+	/* invalid values also just use 0 */
+	if (!trans_delay ||
+	    trans_delay > IEEE80211_EML_CAP_EMLSR_TRANSITION_DELAY_256US)
+		return 0;
+
+	return 16 * (1 << (trans_delay - 1));
+}
+
+/**
+ * ieee80211_eml_trans_timeout_in_us - Fetch the EMLSR Transition
+ *	timeout value in microseconds
+ * @eml_cap: EML capabilities field value from common info field of
+ *	the Multi-link element
+ * Return: the EMLSR Transition timeout (in microseconds) encoded in
+ *	the EML Capabilities field
+ */
+
+static inline u32 ieee80211_eml_trans_timeout_in_us(u16 eml_cap)
+{
+	/* IEEE Std 802.11be-2024 Table 9-417m—Encoding of the
+	 * Transition Timeout subfield.
+	 */
+	u8 timeout = u16_get_bits(eml_cap,
+				  IEEE80211_EML_CAP_TRANSITION_TIMEOUT);
+
+	/* invalid values also just use 0 */
+	if (!timeout || timeout > IEEE80211_EML_CAP_TRANSITION_TIMEOUT_128TU)
+		return 0;
+
+	return 128 * (1 << (timeout - 1));
+}
+
 #define for_each_mle_subelement(_elem, _data, _len)			\
 	if (ieee80211_mle_size_ok(_data, _len))				\
 		for_each_element(_elem,					\
-- 
2.34.1


