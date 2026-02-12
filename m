Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AC6EE36B9
	for <ath12k@archiver.kernel.org>; Thu, 12 Feb 2026 18:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1oiS0K6nZgsMNyi/tucpbE6mPDIZKU73jtHwpjcfSc=; b=TQpxRluENxi8Xq14c722nAp2QC
	ZS8HxjV1A94oWPcEdAEGpU9pWsfFZom42KDO7bH4XZH0Nfxa5GEFeE7hnL9Ra5VHvpXxOyYCYWWc5
	LNKpS/1c8vP6jEMa1dbupujxE/opPhjyQTvnICm2UPGenzgx5SIxSd69Sq6bNHq4pALVv//ibzyL+
	YbBA9mhwfTwDGa3SbW1qlzGqXSa5jLLsgfpJ2ZUlNQbloAGP2llLKXmbN1ZQm4aEGamWYz+LBePZs
	u6jBQgnorpcbFZux5AVm2Y1maSmFE9Pgspg+/yVT+14fO6nS4bJ3zH6Ww9e9Qq9tJLRDdWMiBMcmf
	oFIzQgFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqb0x-00000002UR6-3Dar;
	Thu, 12 Feb 2026 18:02:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqb0u-00000002UPT-2hnK
	for ath12k@lists.infradead.org;
	Thu, 12 Feb 2026 18:02:06 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CHM6fN2093464
	for <ath12k@lists.infradead.org>; Thu, 12 Feb 2026 18:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v1oiS0K6nZgsMNyi/tucpbE6mPDIZKU73jtHwpjcfSc=; b=m+xjRCyjcHyt2zdW
	xoBdZuAnIZy4bQwEl4KrsoNaeEdvCOsWsDFd49ZQ0DuJzovHwenjKjy6/ro5uuz1
	MrWMPqgJAQyphm2AaAbGsv2sWuGvAqTjnbqFzdoAV2B3zl3//VkdF2WaIi8chi/Y
	wU5/wFjY6Gr3Dxsz8q5f7AN3oGZ9fn4wCOsLqwbQPJ9qK4c2z3+9vRNC0N+8xXAl
	gZp2CCo2t9d6iB5gQtZn911joQZe1S7Tm2lG0/ICKeD21IGsutKlE0Umt3xl15DY
	34x6R6jQyC5Na5PxcnAymLQV6JllyOQx9Uyn0O/LnvERrr8wLZFXAog+bQzl39i9
	yoXyWg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9k6y06de-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 12 Feb 2026 18:02:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354bee18a62so111807a91.0
        for <ath12k@lists.infradead.org>; Thu, 12 Feb 2026 10:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770919322; x=1771524122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1oiS0K6nZgsMNyi/tucpbE6mPDIZKU73jtHwpjcfSc=;
        b=jQ4S92ZcXw6yuDjm7kifQa2sLeTw3Ep95cT3hI8aHuTw3OjXGsekKVaVSUO0kic8Gd
         pxpUL2IV57qUhkbMHKFNDN3suZBPYD4tEwdVsD/y4Ki+xNq3od3Pe63MLaZGchZIAfbM
         gN2WHLgMDSfft2me1qcseDEW4mAmusM6KoTqn5drzZwx3tKnBgSKotxTJ6OIkdkLH2rD
         FbQ6oUiyXlrNgTlmR+DKRFrlZYeErMtHZMRHBTy4vPpiKMiEj1JaMe4ZaHqkszwXo1BS
         iy/QS4U1jwSUNjXLtTxjGq5ovNChaJkhP/Upl9XsTQiu550dEjOnio5oCkvYqyTPIq9l
         FxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770919322; x=1771524122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v1oiS0K6nZgsMNyi/tucpbE6mPDIZKU73jtHwpjcfSc=;
        b=Ww5OK/X+Djjo/M8Gm2yM2RL4SEpdh3q9rq+YAu8+kPXlxH1i7pi82CUJzsIhstpAcQ
         eeXS7Kswzwtiijxllkfzt3okXWIzt46dynh0lrPb3Are6qr5e1fLJV/FXbgs9fOJ3WJu
         VcpXwNWB8H2kXQzJE6npUSUpccxQ4OneJjn/UD5WnzqZXclkPRNYzpMKwYEnhCJK9KS2
         vt9aQMIT9yi3ziPOf/5/ugJ8cHAo2HJ1mVTrXHV3pTCWn05AgIgHn7LVFvE7wMb13Irh
         Wi5yEFoI/Kpbe46nGqT4eRYEUWSer5O6cXFB1rZu+zoiVFSPfWkcmvPRE+Nww09iwpbE
         2jnw==
X-Forwarded-Encrypted: i=1; AJvYcCV9LlrgyTbeJc7WdZM/oe+wwECM79CgU+ZRWqb8qC2dtY5RyyIJ4ktqsdwCSdYqyAj8J7Zp+VA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxToIIaopjS0E0M9v5WWJrzgcaJJOxytJ3nmO87Gb8hV3KV9s+t
	sB7ob8miK6CtsYM0d3B1j/fSPubvXXzEYfW8PahzkGsz1oKmW41MkCaQ2j70apmEV5OM0bnO5r2
	5Q9SvNpoHhNi9vMoHA71X6GZfBT4OYz3RBLij/OzhJpyWUA6YPUZsNj/iG1HQA066j8UUD488
X-Gm-Gg: AZuq6aLDuDaiA5fSZIt9d8qxw8mkjZPgCVTkfEYumpGOwI97PVgmrANYdJo+qpAFWtB
	LPTQZXwGDrGdDZZlGFjYXj1ROgIKT2HrJtRckG0yCAh3V5UKqX6o+Em7Zek5MngnsLvzPiMBrPa
	OFLKh0q2k+RU7zCB8iYz2WPly61s6x4shc4gg7NkeAnCZBoeb5fgo2nZ0x2yLYbQr19kLrHLbSH
	aGTb5MOg4iVIKUeAPa+rq6ldwp3pTJa3mvDu6i9iYbtFWkPtwVEy8AX8Z0iEtGBbISmpOuOObi5
	P2mdIQ6BdOlfCI9jNScOLR7I64HaFojcxi+NG6CLL7kjs2KZN9W9BriO35k8erVObNJrSv33/GJ
	uUstKIUKUKLASvsbe9DmSvb28zfz7WeqbkBL4LCkCIElJftB3pW6NHJRn9Kus0+e1Pw==
X-Received: by 2002:a17:90b:2e8d:b0:340:d1a1:af8e with SMTP id 98e67ed59e1d1-3568f533e8emr3745696a91.37.1770919321692;
        Thu, 12 Feb 2026 10:02:01 -0800 (PST)
X-Received: by 2002:a17:90b:2e8d:b0:340:d1a1:af8e with SMTP id 98e67ed59e1d1-3568f533e8emr3745646a91.37.1770919320914;
        Thu, 12 Feb 2026 10:02:00 -0800 (PST)
Received: from hu-kathirve-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662fac3c1sm9714130a91.17.2026.02.12.10.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 10:02:00 -0800 (PST)
From: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
Subject: [PATCH wireless-next v3 1/2] wifi: UHR: define DPS/DBE/P-EDCA elements and fix size parsing
Date: Thu, 12 Feb 2026 23:31:27 +0530
Message-Id: <20260212180128.257565-2-karthikeyan.kathirvel@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260212180128.257565-1-karthikeyan.kathirvel@oss.qualcomm.com>
References: <20260212180128.257565-1-karthikeyan.kathirvel@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NsTcssdJ c=1 sm=1 tr=0 ts=698e159b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=T6LKjO_XPi3R605RZVYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEzOSBTYWx0ZWRfX8ETgzhr5FMMP
 eX5w/BHwbnu8dMVwG/jUD83YwbimnAA6ATFCdK383IWEQ0Z4qJWBn61OEilc+YFAhqMP7jHhzfk
 O6y9iLi8fOCq0NrHcJ5xUL8Y0ZrcER7vTJSVguEPIWBY0b+SxAXpSsdA0zR4ugqw2Spxhh+VWLI
 DV74fu5+HVhXEcenHsJ7t8F3D9Oz41gEPnFamWrij8wE/abLvZ8pUB0tftf0631V3j84quSt3pb
 0eL9kg211IaboXm8zbLD3CinQKxNtsC0UWGYxjqfOTtKa2sG8+Y1fgyXzaj3VSpjddDNvTw81l6
 qFvV7B+8XeMt74dPQk8lEI49mt95WNSeLAECRw5WTtJNGlip/r147AzlLjWtxvgeowqiPeHKRXp
 q5VpPSRerZiAcVHmu9nTWOYE16ucQdtZoWSdzhRMwSnjo+sQ/AQg8aNTMP1ZpF/cwb/e8ML37UV
 iwOOl59oywGU3ZjMMxw==
X-Proofpoint-GUID: CSccI0HwM3SBluIxK5eHnqvP8WsQ0YHf
X-Proofpoint-ORIG-GUID: CSccI0HwM3SBluIxK5eHnqvP8WsQ0YHf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_100204_809989_F6642B4F 
X-CRM114-Status: GOOD (  25.57  )
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


