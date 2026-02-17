Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD26E8384C
	for <ath12k@archiver.kernel.org>; Tue, 17 Feb 2026 05:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1oiS0K6nZgsMNyi/tucpbE6mPDIZKU73jtHwpjcfSc=; b=EpmWLQopUg1vft46tMB9ANGCaV
	hNuDIlKfJ2bKxuQrg0uJ5YBlLhSaVp71k0Xak5KEO5JpFT3UEwPM4Xm/5weaKsAdCP/CwKa19W6Dd
	KzMd4tItqci/U8LcQOgmCW05VZxy4n048VqrTS/NCVzHo7q/49EsGUDgm2s3zNNl9j84hyATyFVk/
	1rm/ZoP3vi7ILApslu2riFu0w0iBd9GkAlYcsWhXLsR6zqHmT37UnC338nCDYC/dOBuyIzhDl1Xz3
	RYthuS1tbc2SmFItcG3IRGINIvT9JNekJlHS0X+nvrJl+oTwgc7Y34nnUcz8Ig2ywsaNBKpVQMnGo
	KbuLr/Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsDxm-00000007fEz-2Kpi;
	Tue, 17 Feb 2026 05:49:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsDxj-00000007fE0-1Wb8
	for ath12k@lists.infradead.org;
	Tue, 17 Feb 2026 05:49:32 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GNUeQN2417581
	for <ath12k@lists.infradead.org>; Tue, 17 Feb 2026 05:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v1oiS0K6nZgsMNyi/tucpbE6mPDIZKU73jtHwpjcfSc=; b=jMx3le7yC9XKcwIV
	tZvA1jrksVBWSRXz/poGYO3d/xMN6xx4cCy1vT6gG0ZkLL3wIbzU3t9pT4BFPALH
	acEM2f0VQUniyLtPieLfH1edbYupzDejp7EVeaoaMbcTnr6N5QPEF3NqzvVwS2cd
	LqjBqlZL+1iPxps24YZU+ejxz1m+Mr+NmA0kx60WrVM8/iBr961CC//2VEssvrpG
	+1wj1AcFKtBNVIVNVhB1pXL6pmCabcyVhqXriO/dm+D9VOPcPdYgERwznTFEF59D
	wyY19/XBn3kA1qAIz983QVJ48HvDL78k7Ab32L5hqcQ4GpAz0rdSOqUAPbAAW6Me
	uxc+jQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6tm981j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 17 Feb 2026 05:49:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aaf0dbd073so46857695ad.3
        for <ath12k@lists.infradead.org>; Mon, 16 Feb 2026 21:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771307369; x=1771912169; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1oiS0K6nZgsMNyi/tucpbE6mPDIZKU73jtHwpjcfSc=;
        b=jl3f4lsNskMNjZmqAxNtSDOfdiSA/tB5flrHuat06U5aXCPGSRJDAnJPWjrtpEPSvK
         yQhJ7tKp83NSNS3X8bxJN6UQsINrC4yUbxpwWBzuHo1NnZxoDwEubgHxzxkbXoAksbCB
         E7qCYBRzBGtlO7OZRGsOgPXaoCE153J5NKxh2fV6BVaW/DMIQQ++oKTktHHFEjEZbcHQ
         j3RF0PnQZ3EFCAGUut9iaeVjHWj2N0NGrNt+JudlWQBfvzm+waqlB1qUhZ9/6AKsW7EO
         JbnhH5QPiRr+GasldNZNMBhCMzJSM9kmZJ0EP6C6GEa5j3OVXQXF6uhfluaqSsi99HPP
         OYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771307369; x=1771912169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v1oiS0K6nZgsMNyi/tucpbE6mPDIZKU73jtHwpjcfSc=;
        b=d5KggBN+rbfiFIqmfj7IeYU29ZWgRabFqPHxXy2lgJxc8Mvh/EZa2TD7/Y+fVFi0Hx
         v8Ye8BhB9y5LSYJBc39ESAen++d3COzI6EHRWtbHZ5jQJAcoZI4NGJ1JoaQgkBQXkA1N
         fEXGuZErI3JDTWGmP8cqCy1rIX6Wew6vhit4i4Kp9bM7pWAtJR/oOTIsHyJlyPSP4sDR
         ulTS5DROYMwPrwWnmO4hbRtWyHcxEaoQNzIMvws2eFg7RggdbZSgdNouv72y7ymKNlWM
         GURogZ2fnKsVexXZTJHVm5ya+lJjURpA3ecM1XYe95o6at92yIJKxb9qxN3F8qDhggoZ
         u0ug==
X-Forwarded-Encrypted: i=1; AJvYcCUPOlQRYCHpv2k7Ru7LLaXXN1DfPfGL4st5saxHJcEW1sga+z2QkAxpo3HkIbVXRXqxwkphTBA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwwUUB3Y/SnvPKGASEbyIloY3paJYC1X15A1YLfglsug2PfROtP
	hhL4kieHibgTK/z/9+u6aQuLMvvChRpVlNVE70Jj0ru1EWAxMOUmRBJiNkHq8huFDMKBKo2AxPd
	R+maKy4CaQkOUxOF+RzV0OWk4V5cksP6EmJfAelkkKr6crZLcSdWv6qAa6xlzN6D63hy35xTf
X-Gm-Gg: AZuq6aJUqzyvq34UmKeqFdq6ydH5SJ4U/n5/+HCw+WdnHf8sPDUtYIrkGFULnF5VrYW
	FDyLeiZeyt/+ZxKaaJYFy8y1eFrcI10ANRkPDFALK7qOfL6TlBYz4HZaBxm83or1uaNt8yCBvkZ
	EQVTJebJbk4QsUCh/RHu+vMzGh0mn4qNH58fqVM4Ncxl73aVezWXbnrWxABPA/1JECAh7w2gSZ6
	KhQzCP/Bb2KmIHAjuMeWg6TwaYFRNmbMxa6Ki3GXDxLDHfst43tCyrK/d7WHaFIg242VZW1gQlI
	VSi7Wbeyjj2hS9oUQ7IifeMGH6vh1Ic2+CYib2tDMhJ+megLuOqlSm/SZskaaHBmCFGJ3iKkiKw
	BhKx+r+f4cRdkp5I6sny42sGr2j3Hn9kG+r8eIcRlUTsTYWuyQ/EBuMdNIimDIEaw4Q==
X-Received: by 2002:a17:902:e945:b0:2ab:3cba:4307 with SMTP id d9443c01a7336-2ab50569fbbmr123264475ad.22.1771307368796;
        Mon, 16 Feb 2026 21:49:28 -0800 (PST)
X-Received: by 2002:a17:902:e945:b0:2ab:3cba:4307 with SMTP id d9443c01a7336-2ab50569fbbmr123264085ad.22.1771307368233;
        Mon, 16 Feb 2026 21:49:28 -0800 (PST)
Received: from hu-kathirve-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5bbcsm89808175ad.56.2026.02.16.21.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 21:49:27 -0800 (PST)
From: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
Subject: [PATCH wireless-next v4 1/2] wifi: UHR: define DPS/DBE/P-EDCA elements and fix size parsing
Date: Tue, 17 Feb 2026 11:17:30 +0530
Message-Id: <20260217054731.3667600-2-karthikeyan.kathirvel@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260217054731.3667600-1-karthikeyan.kathirvel@oss.qualcomm.com>
References: <20260217054731.3667600-1-karthikeyan.kathirvel@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oMUq4D1J5QoOYp_KndCg94kpQKEjTho4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA0NiBTYWx0ZWRfX2IrlQ728/gHD
 zjkyFQh3JYIahUCuL2ACIS510TPDb04wl93WYm8iXOEeYTgwv4Fj/nxtgOSJ4N7sA38zAg3tUpj
 iitYV4iCOnCwqHoODqddiE+t3rOZ7b5DJkmqP4q/2Ro3KJ+8AT+IG21Cg81OSMMC7mo1nmkCPl1
 JEzdOHT5JagTbYY0M55RURIVWOD/Vgn3ahzE3OXL8YgFOmqeykIAJd2SLUL0rajL7K0YVlDWN8R
 jBGDoP6sh6k3kgtNMqjaG2N9YqFDglPl0HRK3f4Zx1q2GVQW5wDZtic2xZvdFUVFC5C2hFgwUVU
 lMgr1hEHXRGmT80K0pK15uDbjewcU02StLQ+Rb9AZrKGUcaPF/5TbxPZYPn3AR3RENUMgonRFHt
 IBC6vW5pBzv9a9gX5cPboYjYjb/QaW+/7rIDx6qtxIp5mK1wnVqXog5zV0liCDUZYSTF4pU6/rT
 hMemNKNQmOSMnrgXlNw==
X-Proofpoint-ORIG-GUID: oMUq4D1J5QoOYp_KndCg94kpQKEjTho4
X-Authority-Analysis: v=2.4 cv=IOoPywvG c=1 sm=1 tr=0 ts=6994016a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=T6LKjO_XPi3R605RZVYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_08,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_214931_533156_643400DA 
X-CRM114-Status: GOOD (  26.44  )
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

Add UHR Operation and Capability definitions and parsing helpers:

- Define ieee80211_uhr_dps_info, ieee80211_uhr_dbe_info,
  ieee80211_uhr_p_edca_info with masks.
- Update ieee80211_uhr_oper_size_ok() to account for optional
  DPS/DBE/P-EDCA blocks.
- Move NPCA pointer position after DPS Operation Parameter if it is
  present in ieee80211_uhr_oper_size_ok().
- Move NPCA pointer position after DPS info if it is present in
  ieee80211_uhr_npca_info().

Signed-off-by: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
---
 include/linux/ieee80211-uhr.h | 252 +++++++++++++++++++++++++++++++++-
 1 file changed, 246 insertions(+), 6 deletions(-)

diff --git a/include/linux/ieee80211-uhr.h b/include/linux/ieee80211-uhr.h
index 132acced7d79..e9f365ffcdac 100644
--- a/include/linux/ieee80211-uhr.h
+++ b/include/linux/ieee80211-uhr.h
@@ -29,11 +29,196 @@ struct ieee80211_uhr_operation {
 #define IEEE80211_UHR_NPCA_PARAMS_MOPLEN		0x00400000
 #define IEEE80211_UHR_NPCA_PARAMS_DIS_SUBCH_BMAP_PRES	0x00800000
 
+/**
+ * struct ieee80211_uhr_npca_info - npca operation information
+ *
+ * This structure is the "NPCA Operation Parameters field format" of "UHR
+ * Operation Element" fields as described in P802.11bn_D1.3
+ * subclause 9.4.2.353. See Figure 9-aa4.
+ *
+ * Refer to IEEE80211_UHR_NPCA*
+ * @params:
+ *	NPCA Primary Channel - NPCA primary channel
+ *	NPCA_Min Duration Threshold - Minimum duration of inter-BSS activity
+ *	NPCA Switching Delay -
+ *		Time needed by an NPCA AP to switch from the
+ *		BSS primary channel to the NPCA primary channel
+ *		in the unit of 4 µs.
+ *	NPCA Switching Back Delay -
+ *		Time to switch from the NPCA primary channel
+ *		to the BSS primary channel in the unit of 4 µs.
+ *	NPCA Initial QSRC -
+ *		Initialize the EDCAF QSRC[AC] variables
+ *		when an NPCA STA in the BSS
+ *		switches to NPCA operation.
+ *	NPCA MOPLEN -
+ *		Indicates which conditions can be used to
+ *		initiate an NPCA operation,
+ *		1 -> both PHYLEN NPCA operation and MOPLEN
+ *		NPCA operation are
+ *		permitted in the BSS
+ *		0 -> only PHYLEN NPCA operation is allowed in the BSS.
+ *	NPCA Disabled Subchannel Bitmap Present -
+ *		Indicates whether the NPCA Disabled Subchannel
+ *		Bitmap field is present. A 1 in this field indicates that
+ *		the NPCA Disabled Subchannel Bitmap field is present
+ * @dis_subch_bmap:
+ *		A bit in the bitmap that lies within the BSS bandwidth is set
+ *		to 1 to indicate that the corresponding 20 MHz subchannel is
+ *		punctured and is set to 0 to indicate that the corresponding
+ *		20 MHz subchannel is not punctured. A bit in the bitmap that
+ *		falls outside of the BSS bandwidth is reserved. This field is
+ *		present when the value of the NPCA Disabled Subchannel Bitmap
+ *		Field Present field is equal to 1, and not present, otherwise
+ */
 struct ieee80211_uhr_npca_info {
 	__le32 params;
 	__le16 dis_subch_bmap[];
 } __packed;
 
+#define IEEE80211_UHR_DPS_PADDING_DELAY			0x0000003F
+#define IEEE80211_UHR_DPS_TRANSITION_DELAY		0x00003F00
+#define IEEE80211_UHR_DPS_ICF_REQUIRED			0x00010000
+#define IEEE80211_UHR_DPS_PARAMETERIZED_FLAG		0x00020000
+#define IEEE80211_UHR_DPS_LC_MODE_BW			0x001C0000
+#define IEEE80211_UHR_DPS_LC_MODE_NSS			0x01E00000
+#define IEEE80211_UHR_DPS_LC_MODE_MCS			0x1E000000
+#define IEEE80211_UHR_DPS_MOBILE_AP_DPS_STATIC_HCM	0x20000000
+
+/**
+ * struct ieee80211_uhr_dps_info - DPS operation information
+ *
+ * This structure is the "DPS Operation Parameter field" of "UHR
+ * Operation Element" fields as described in P802.11bn_D1.3
+ * subclause 9.4.1.87. See Figure 9-207u.
+ *
+ * Refer to IEEE80211_UHR_DPS*
+ * @dps_params:
+ *	DPS Padding Delay -
+ *		Indicates the minimum MAC padding
+ *		duration that is required by a DPS STA
+ *		in an ICF to cause the STA to transition
+ *		from the lower capability mode to the
+ *		higher capability mode. The DPS Padding
+ *		Delay field is in units of 4 µs.
+ *	DPS Transition Delay -
+ *		Indicates the amount of time required by a
+ *		DPS STA to transition from the higher
+ *		capability mode to the lower capability
+ *		mode. The DPS Transition Delay field is in
+ *		units of 4 µs.
+ *	ICF Required -
+ *		Indicates when the DPS assisting STA needs
+ *		to transmit an ICF frame to the peer DPS STA
+ *		before performing the frame exchanges with
+ *		the peer DPS STA in a TXOP.
+ *			1 -> indicates that the transmission of the
+ *			ICF frame to the peer DPS STA prior to
+ *			any frame exchange is needed.
+ *			0 -> ICF transmission before the frame
+ *			exchanges with the peer DPS STA is only
+ *			needed if the frame exchange is performed
+ *			in the HC mode.
+ *	Parameterized Flag -
+ *		0 -> indicate that only 20 MHz, 1 SS,
+ *		non-HT PPDU format with the data
+ *		rate of 6, 12, and 24 Mb/s as the
+ *		default mode are supported by the
+ *		DPS STA in the LC mode
+ *		1 -> indicate that a bandwidth up to the
+ *		bandwidth indicated in the LC Mode
+ *		Bandwidth field, a number of spatial
+ *		streams up to the NSS indicated in
+ *		the LC Mode Nss field, and an MCS up
+ *		to the MCS indicated in the LC Mode
+ *		MCS fields are supported by the DPS
+ *		STA in the LC mode as the
+ *		parameterized mode.
+ *	LC Mode Bandwidth -
+ *		Indicates the maximum bandwidth supported
+ *		by the STA in the LC mode.
+ *	LC Mode NSS -
+ *		Indicates the maximum number of the spatial
+ *		streams supported by the STA in the LC mode.
+ *	LC Mode MCS -
+ *		Indicates the highest MCS supported by the STA
+ *		in the LC mode.
+ *	Mobile AP DPS Static HCM -
+ *		1 -> indicate that it will remain in the DPS high
+ *		capability mode until the next TBTT on that
+ *		link.
+ *		0 -> otherwise.
+ */
+struct ieee80211_uhr_dps_info {
+	__le32 dps_params;
+} __packed;
+
+#define IEEE80211_UHR_DBE_OPER_BANDWIDTH			0x07
+#define IEEE80211_UHR_DBE_OPER_DIS_SUBCHANNEL_BITMAP_PRES	0x08
+
+/**
+ * struct ieee80211_uhr_dbe_info - DBE operation information
+ *
+ * This structure is the "DBE Operation Parameters field" of
+ * "UHR Operation Element" fields as described in P802.11bn_D1.3
+ * subclause 9.4.2.353. See Figure 9-aa6.
+ *
+ * Refer to IEEE80211_UHR_DBE_OPER*
+ * @dbe_params:
+ *	B0-B2 - DBE Bandwidth field is set to indicate
+ *	expanded bandwidth for DBE mode
+ *	Value 0 is reserved.
+ *	Set to 1 to indicate 40 MHz DBE bandwidth.
+ *	Set to 2 to indicate 80 MHz DBE bandwidth.
+ *	Set to 3 to indicate 160 MHz DBE bandwidth.
+ *	Set to 4 to indicate 320-1 MHz DBE bandwidth.
+ *	Set to 5 to indicate 320-2 MHz DBE bandwidth.
+ *	Values 6 to 7 are reserved.
+ *	B3 - DBE Disabled Subchannel Bitmap Present.
+ * @dis_subch_bmap: DBE Disabled Subchannel Bitmap field is set to indicate
+ *	disabled 20 MHz subchannels within the DBE Bandwidth.
+ */
+struct ieee80211_uhr_dbe_info {
+	u8 dbe_params;
+	__le16 dis_subch_bmap[];
+} __packed;
+
+#define IEEE80211_UHR_P_EDCA_ECWMIN		0x0F
+#define IEEE80211_UHR_P_EDCA_ECWMAX		0xF0
+#define IEEE80211_UHR_P_EDCA_AIFSN		0x000F
+#define IEEE80211_UHR_P_EDCA_CW_DS		0x0030
+#define IEEE80211_UHR_P_EDCA_PSRC_THRESHOLD	0x01C0
+#define IEEE80211_UHR_P_EDCA_QSRC_THRESHOLD	0x0600
+
+/**
+ * struct ieee80211_uhr_p_edca_info - P-EDCA operation information
+ *
+ * This structure is the "P-EDCA Operation Parameters field" of
+ * "UHR Operation Element" fields as described in P802.11bn_D1.3
+ * subclause 9.4.2.353. See Figure 9-aa5.
+ *
+ * Refer to IEEE80211_UHR_P_EDCA*
+ * @p_edca_ec: The P-EDCA ECWmin, P-EDCA and ECWmax
+ *	fields indicate the CWmin and CWmax
+ *	value that are used by a P-EDCA STA during P-EDCA contention.
+ * @p_edca_params: The AIFSN field indicate the AIFSN value that are
+ *	used by a P-EDCA STA during P-EDCA contention.
+ *	The CW DS field indicate the value used
+ *	for the randomization of the transmission slot of the DS-CTS
+ *	frame. The value 3 is reserved. The value 0 indicate that
+ *	randomization not enabled.
+ *	The P-EDCA PSRC threshold field indicates the maximum number
+ *	of allowed consecutive DS-CTS transmissions. The value 0 and
+ *	values greater than 4 are reserved
+ *	The P-EDCA QSRC threshold field indicates the value of the
+ *	QSRC[AC_VO] counter to be allowed to start P-EDCA contention.
+ *	The value 0 is reserved.
+ */
+struct ieee80211_uhr_p_edca_info {
+	u8 p_edca_ec;
+	__le16 p_edca_params;
+} __packed;
+
 static inline bool ieee80211_uhr_oper_size_ok(const u8 *data, u8 len,
 					      bool beacon)
 {
@@ -47,19 +232,52 @@ static inline bool ieee80211_uhr_oper_size_ok(const u8 *data, u8 len,
 	if (beacon)
 		return true;
 
-	/* FIXME: DPS, DBE, P-EDCA (consider order, also relative to NPCA) */
+	/* DPS Operation Parameters (fixed 4 bytes) */
+	if (oper->params & cpu_to_le16(IEEE80211_UHR_OPER_PARAMS_DPS_ENA)) {
+		needed += sizeof(struct ieee80211_uhr_dps_info);
+		if (len < needed)
+			return false;
+	}
 
+	/* NPCA Operation Parameters (fixed 4 bytes + optional 2 bytes) */
 	if (oper->params & cpu_to_le16(IEEE80211_UHR_OPER_PARAMS_NPCA_ENA)) {
 		const struct ieee80211_uhr_npca_info *npca =
-			(const void *)oper->variable;
+			(const void *)(data + needed);
 
 		needed += sizeof(*npca);
-
 		if (len < needed)
 			return false;
 
-		if (npca->params & cpu_to_le32(IEEE80211_UHR_NPCA_PARAMS_DIS_SUBCH_BMAP_PRES))
+		if (npca->params &
+		    cpu_to_le32(IEEE80211_UHR_NPCA_PARAMS_DIS_SUBCH_BMAP_PRES)) {
 			needed += sizeof(npca->dis_subch_bmap[0]);
+			if (len < needed)
+				return false;
+		}
+	}
+
+	/* P-EDCA Operation Parameters (fixed 3 bytes) */
+	if (oper->params & cpu_to_le16(IEEE80211_UHR_OPER_PARAMS_PEDCA_ENA)) {
+		needed += sizeof(struct ieee80211_uhr_p_edca_info);
+		if (len < needed)
+			return false;
+	}
+
+	/* DBE Operation Parameters (fixed 1 byte + optional 2 bytes) */
+	if (oper->params & cpu_to_le16(IEEE80211_UHR_OPER_PARAMS_DBE_ENA)) {
+		const struct ieee80211_uhr_dbe_info *dbe =
+			(const void *)(data + needed);
+
+		needed += sizeof(*dbe);
+		if (len < needed)
+			return false;
+
+		if (dbe->dbe_params &
+		    IEEE80211_UHR_DBE_OPER_DIS_SUBCHANNEL_BITMAP_PRES) {
+			needed += sizeof(dbe->dis_subch_bmap[0]);
+			if (len < needed)
+				return false;
+		}
 	}
 
 	return len >= needed;
@@ -72,12 +290,15 @@ static inline bool ieee80211_uhr_oper_size_ok(const u8 *data, u8 len,
 static inline const struct ieee80211_uhr_npca_info *
 ieee80211_uhr_npca_info(const struct ieee80211_uhr_operation *oper)
 {
+	const u8 *pos = oper->variable;
+
 	if (!(oper->params & cpu_to_le16(IEEE80211_UHR_OPER_PARAMS_NPCA_ENA)))
 		return NULL;
 
-	/* FIXME: DPS */
+	if (oper->params & cpu_to_le16(IEEE80211_UHR_OPER_PARAMS_DPS_ENA))
+		pos += sizeof(struct ieee80211_uhr_dps_info);
 
-	return (const void *)oper->variable;
+	return (const void *)pos;
 }
 
 static inline const __le16 *
@@ -131,6 +352,25 @@ ieee80211_uhr_npca_dis_subch_bitmap(const struct ieee80211_uhr_operation *oper)
 #define IEEE80211_UHR_MAC_CAP_DBE_EHT_MCS_MAP_160_PRES	0x08
 #define IEEE80211_UHR_MAC_CAP_DBE_EHT_MCS_MAP_320_PRES	0x10
 
+/**
+ * enum ieee80211_dbe_bandwidth - DBE Bandwidth
+ *
+ * As per spec P802.11bn_D1.3 "Table 9-bb5—Encoding of the DBE Maximum
+ * Supported Bandwidth field"
+ *
+ * @IEEE80211_DBE_BANDWIDTH_40MHZ: Indicate 40 MHz DBE bandwidth
+ * @IEEE80211_DBE_BANDWIDTH_80MHZ: Indicate 80 MHz DBE bandwidth
+ * @IEEE80211_DBE_BANDWIDTH_160MHZ: Indicate 160 MHz DBE bandwidth
+ * @IEEE80211_DBE_BANDWIDTH_320MHZ: Indicate 320 MHz DBE bandwidth
+ *
+ */
+enum ieee80211_dbe_bandwidth {
+	IEEE80211_DBE_BANDWIDTH_40MHZ = 1,
+	IEEE80211_DBE_BANDWIDTH_80MHZ = 2,
+	IEEE80211_DBE_BANDWIDTH_160MHZ = 3,
+	IEEE80211_DBE_BANDWIDTH_320MHZ = 4,
+};
+
 struct ieee80211_uhr_cap_mac {
 	u8 mac_cap[5];
 } __packed;
-- 
2.34.1


