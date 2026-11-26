Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8091606A32D
	for <ath12k@archiver.kernel.org>; Thu, 26 Nov 2026 02:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lcYsHYLD;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=augfP6Zw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K6TSYyzN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0R6kz49hV3AZznu/COs3CzoBAvj0flKjT5W/5U4wY7U=; b=lcYsHYLD4HrUxl
	EMiOea2advY+DmnhNxVXEvGe6K/zsXaBHdd69qhBMO0moHFOlVTue1OPow//PGWGwPCcGSyrbyRXl
	ggT7a+Yh0OKikWFYhmAB/cZaw+c8HzHlU5MEaZEhav/nMKQgaJ2l69heiAC3G7T6UYZVqn5sggZD3
	BM3qOjiJ9Shluk1BkSKQSIzISv1K5oh0SQ/jAsyYhu8xDl7zSK48uwUokt7/MCo2bwy567c3LMOJj
	Q3eo5C705YbsNU4ufBCgZdSOEE+RDlUpIHR/uXvBZiUAwb3rIGYx3hN/8tYBuLWZAp+boe84ilj/N
	ULIMR8+IEZfFhbblJ1Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWOtm-0000000Br5J-2SUh;
	Thu, 26 Nov 2026 02:07:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWOtf-0000000Br1b-1X9i
	for ath12k@lists.infradead.org;
	Thu, 26 Nov 2026 02:07:40 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJAqTN1357621
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 02:07:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0R6kz49hV3A
	Zznu/COs3CzoBAvj0flKjT5W/5U4wY7U=; b=augfP6Zw91OUSzboB9QrvNdpqm0
	m3I6YkxtsxmTZvi1qf/QzK+sevb250QZbdndMDGUm82CSvKGp8QAf+ZKQHp3ylJR
	3dK/5qL1kh5sPosvak2mBAsorAmlBm6dKwqyk6cb9pbn1QH+PqdAp7wPBsnJ5BS7
	71eGRs/2VxDo20HAoqat4acL+22lZONWv2V3LYJTS63E8dgnZeelW8ubg9pBkQRh
	vjPCxklr+n085F1PZFS4TFGq1d/uhB9RzILC0rBD9EDqrTcfREFnVVkyvnEAPGDz
	WugNz6cPbH/9RPNznHkxoNeIhNyBqyOBd9dn36OW5MP4kDIwRR8P/MhP7Ag==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5yaxtsh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 02:07:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b3fa6c8d4bso6506576a91.0
        for <ath12k@lists.infradead.org>; Wed, 25 Nov 2026 18:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795658858; x=1796263658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0R6kz49hV3AZznu/COs3CzoBAvj0flKjT5W/5U4wY7U=;
        b=K6TSYyzN96W5hkpRUIxjS1J9yokoWKGIHgQU/LSZ6j2YIW0wbdheqA0Gi1dGcTx1L/
         iGtquZgSbGgBYpkbhhFuwmsr7PVFhFmZIbVHRB5MIjbiZDUxAzDMq6LbdoMFfbX5o3bl
         uhKLgn4rk3eXQhvBBE0Hmj101U61Ixm05u6zFXATEyoejYQ3jIT1RDrI85ypdSVMC8c7
         5MZfDex33wGzTHWWKVleO7gAZLTp5e8ZlzCUlvU3pExqrpRrZMZCRscgpDetZ361niX3
         Wv9C5ryYhdST8pmgmvYkF8mx2ASHMvhKUYDwb9dNf7+cne15OJzZH/718seDg/8cfaMM
         Vhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795658858; x=1796263658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0R6kz49hV3AZznu/COs3CzoBAvj0flKjT5W/5U4wY7U=;
        b=1NEcXEAbexdf+xYrZv6RdkiGYTAB6KgWwfGJhRxjoO+rqeYzYSGDMyDhyqlrZjAoc3
         6FHls1474NKn/gQDDKCGSQ0LNATyuInGA93NpnFTjXxtAJAdeaytvXirQ2OmE0JP7Jaq
         iKbjslgKIn/G/nDTMmL6X3VC9LeaTzB1xUZ8356AcPCuNiWOyPM0V0APD1EnfOmDBhE+
         ZIMiB6lhPYq6yQbc0RKnUCm9a2cFJxDaM2qulUvlhMT0KCwic/3l4WZKsTKHMWVRqnr1
         rs07rCb2+ayK9cxq3ux6RO1GmVoM9boujY8tIJ/wsGNyRrhBPeugfESNyskvHnegjJJl
         4hdA==
X-Gm-Message-State: APuU4Z+x3twRHX+0IFVIluBVqdq07eWUHuxxtNbkgGL3SD2f0HTFmmK9
	rQUF4E42vC/Oh9AupwYoiDZOedSAV/BoefKKY5UnE3elTHWUwvFspzW6VVAhJlkbDwWAJMLgW8d
	Bt0NwmxGgJEPWfe1Zt9FLKwAomGwRhDeoTxSHc/ABamY8iQGR3cUMYW2hhfxtHndo
X-Gm-Gg: AZFdTZdbPoLvDXLwzGropoUP2O8Jcvmes52L6bmtcTwJA/xgT1aLkk/behjfixsLlT6
	FopfSXE/PxuvDsXItbvhmZBfkfFn7ZUqnT6tf9xIOGFH0B3BCruIAyzPQW9iAjJcmkx57bmutyE
	NqsEOPD2b4kMN7VElHXiOiwU72ucfYtn9cp4Fv6HglsJdQ+Z97U/IWLTj4kazNoHtLWPPNJ5X7q
	kX1/2Usg522gLlyPgc2DjKqgYBK6BIYHyOA3jPBYZqDoINX8Xcpz+l7CzsZwPMkgg1101Vtvpaz
	jfB4uhleSrKQqdpSlGMqfU0z4vo5SWpnQV0VvI/qHImbyivK3kFEdFdqHI2PEhfj+0+YSqg2HGS
	W1YzIGOLyeJNIKudL6ApPTBVoXJXkKbJEWRcmO+IfdSiWGJttlVI1PzATDAIo+c6uBu/sHjBu2/
	9rlPqQr217y7rmijd9lQcl8QR5JKd9qFi2dVpy
X-Received: by 2002:a17:90b:57c6:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b41c9617ffmr13705213a91.37.1795658857886;
        Wed, 25 Nov 2026 18:07:37 -0800 (PST)
X-Received: by 2002:a17:90b:57c6:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b41c9617ffmr13705190a91.37.1795658857147;
        Wed, 25 Nov 2026 18:07:37 -0800 (PST)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm29626356a91.3.2026.11.25.18.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:07:36 -0800 (PST)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: jjohnson@kernel.org, baochen.qiang@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 2/6] wifi: ath12k: derive MLD max simultaneous links by hw policy
Date: Thu, 26 Nov 2026 10:07:23 +0800
Message-Id: <20261126020727.3273337-3-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
References: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Z288PlGo5LLLByc8PeyFjnbuY9lWrTTC
X-Proofpoint-ORIG-GUID: Z288PlGo5LLLByc8PeyFjnbuY9lWrTTC
X-Authority-Analysis: v=2.4 cv=ULpIjyfy c=1 sm=1 tr=0 ts=6b07946a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=HJkC1t53WzKw9mxX8OcA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX3UX2dguFOkIH
 C8mX1HL4g2u8q5ZAj8Xt5bcZiYIH4av88pBiIEEr78fiUGU8LPVba7GyBEjouGhgjdBaJ5ywIlY
 pTw4fzlOnavdtG88oXQwIjUvcrpH69Yx1fyKj7KPFOiMwPsRUDgt34/FTUQKTPt5COyfTYoatdn
 89ycWEGekS9FqprkSuZERJiVv1sb3Dghu0PbhXvmCZVeS/p4Tt3D7b6M6VpptY9oG6VvHH+0eJY
 I9YznkbMXMbW4LBU9HpQ+g5KNIKOXJXTNWf+IRwNMmNHYH+D4eISgvgzQiK4t0Oeeea2J4Wy8BP
 MEyvn4Bvdqv7HgdQqsXb3Pc3q2LRMca6p69UkDC1j32kT6ZmZbOfPxku2KGIOlxIAuZKoVUZBxO
 z8pJUKnmNUXIztiCDfdePU83XzVa96wye91l1RTEVTeq/JB1qdSm0aSN0EQ5qyJ9sy5Clt9jCsy
 rYwvUyRiP9vZ6SR3rjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX+r0dAnRfl4Me
 zn9UMpVA+g65l5Peu2owhY4dK5KYv6n7CwRMWVChTfFVYiYvww8XWTVSKR81G3nS3IrCuS+fkK2
 JNgcoI2Ge1DpzPKobV2zf3+//lxP8X8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_180739_412905_21526526 
X-CRM114-Status: GOOD (  22.35  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On infrastructure-focused chipsets, firmware may report a maximum
simultaneous-link count that does not reflect the available radio
combination. When the counts differ, converting the firmware value to
N-1 still advertises an incorrect Max Number Of Simultaneous Links in
the wiphy MLD capabilities exposed to userspace and in MLO association
requests. Userspace and peers therefore see a simultaneous-link limit
that does not describe the configured hardware.

Add mlo_max_simul_links_by_num_radios in struct ath12k_hw_params and
use it to select between firmware-field conversion and radio-count-based
derivation of the encoded max simultaneous links value.

mlo_max_simul_links_by_num_radios is enabled for
QCN9274/QCN6432/IPQ5332/IPQ5424 and disabled for WCN7850/QCC2072.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hw.h       |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c |  7 +++
 drivers/net/wireless/ath/ath12k/wmi.c      | 67 ++++++++++++++++++----
 3 files changed, 63 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 138e556ac679..7cd357f9429b 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -218,6 +218,7 @@ struct ath12k_hw_params {
 	u32 otp_board_id_register;
 
 	bool supports_sta_ps;
+	bool mlo_max_simul_links_by_num_radios;
 
 	const guid_t *acpi_guid;
 	bool supports_dynamic_smps_6ghz;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 48a2f6da16ef..eef99b664748 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -472,6 +472,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.otp_board_id_register = QCN9274_QFPROM_RAW_RFA_PDET_ROW13_LSB,
 
 		.supports_sta_ps = false,
+		.mlo_max_simul_links_by_num_radios = true,
 
 		.acpi_guid = NULL,
 		.supports_dynamic_smps_6ghz = true,
@@ -571,6 +572,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.otp_board_id_register = 0,
 
 		.supports_sta_ps = true,
+		.mlo_max_simul_links_by_num_radios = false,
 
 		.acpi_guid = &wcn7850_uuid,
 		.supports_dynamic_smps_6ghz = false,
@@ -666,6 +668,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.otp_board_id_register = QCN9274_QFPROM_RAW_RFA_PDET_ROW13_LSB,
 
 		.supports_sta_ps = false,
+		.mlo_max_simul_links_by_num_radios = true,
 
 		.acpi_guid = NULL,
 		.supports_dynamic_smps_6ghz = true,
@@ -759,6 +762,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.otp_board_id_register = 0,
 
 		.supports_sta_ps = false,
+		.mlo_max_simul_links_by_num_radios = true,
 
 		.acpi_guid = NULL,
 		.supports_dynamic_smps_6ghz = false,
@@ -855,6 +859,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.otp_board_id_register = 0,
 
 		.supports_sta_ps = true,
+		.mlo_max_simul_links_by_num_radios = false,
 
 		.acpi_guid = &wcn7850_uuid,
 		.supports_dynamic_smps_6ghz = false,
@@ -949,6 +954,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.otp_board_id_register = 0,
 
 		.supports_sta_ps = false,
+		.mlo_max_simul_links_by_num_radios = true,
 
 		.acpi_guid = NULL,
 		.supports_dynamic_smps_6ghz = false,
@@ -1039,6 +1045,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.otp_board_id_register = 0,
 
 		.supports_sta_ps = false,
+		.mlo_max_simul_links_by_num_radios = true,
 
 		.acpi_guid = NULL,
 		.supports_dynamic_smps_6ghz = false,
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index d1af43ede2ae..5cf104536dbf 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -5293,22 +5293,69 @@ static void ath12k_wmi_eht_caps_parse(struct ath12k_pdev *pdev, u32 band,
 	cap_band->eht_cap_info_internal = le32_to_cpu(cap_info_internal);
 }
 
-static u32 ath12k_wmi_get_spec_encoded_mld_cap(struct ath12k_base *ab, u32 mld_cap)
+static u8 ath12k_wmi_get_max_simul_links_by_num_radios(struct ath12k_base *ab)
 {
 	struct ath12k_hw_group *ag = ath12k_ab_to_ag(ab);
-	u8 max_simul_links;
+	u8 max_simul_links = 0;
+	int i;
 
 	/*
-	 * Firmware reports Max Number Of Simultaneous Links as raw N while
-	 * IEEE 802.11be MLD Capabilities and Operations encodes it as N-1.
+	 * On infrastructure-focused chipsets, firmware may report max
+	 * simultaneous links independent of active radio combination.
+	 * Derive the encoded value from the number of available radios.
 	 */
-	max_simul_links = u32_get_bits(mld_cap, IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
+	if (ag->mlo_capable) {
+		for (i = 0; i < ag->num_devices; i++) {
+			struct ath12k_base *partner_ab = ath12k_ag_to_ab(ag, i);
+
+			if (!partner_ab)
+				continue;
+
+			max_simul_links += partner_ab->qmi.num_radios;
+		}
+	} else {
+		max_simul_links = ab->num_radios;
+	}
+
+	if (!max_simul_links)
+		return 0;
+
+	return min_t(u8, max_simul_links - 1,
+		     FIELD_MAX(IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS));
+}
+
+static u8 ath12k_wmi_get_max_simul_links_from_fw(struct ath12k_base *ab, u32 mld_cap)
+{
+	struct ath12k_hw_group *ag = ath12k_ab_to_ag(ab);
+	u8 max_simul_links;
+
+	max_simul_links = u32_get_bits(mld_cap,
+				       IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
 	if (max_simul_links)
-		max_simul_links--;
-	else if (ag && ag->mlo_capable)
+		return max_simul_links - 1;
+
+	if (ag->mlo_capable)
 		ath12k_warn(ab,
 			    "firmware reported invalid max simul links value 0 in mld_cap 0x%x\n",
 			    mld_cap);
+	return 0;
+}
+
+static u32
+ath12k_wmi_get_spec_encoded_mld_cap(struct ath12k_base *ab,
+				    const struct ath12k_wmi_caps_ext_params *caps)
+{
+	u32 mld_cap = le32_to_cpu(caps->mld_capability);
+	u8 max_simul_links;
+
+	/*
+	 * Firmware reports Max Number Of Simultaneous Links as raw N while
+	 * IEEE 802.11be MLD Capabilities and Operations encodes it as N-1.
+	 */
+	if (ab->hw_params->mlo_max_simul_links_by_num_radios)
+		max_simul_links = ath12k_wmi_get_max_simul_links_by_num_radios(ab);
+	else
+		max_simul_links = ath12k_wmi_get_max_simul_links_from_fw(ab, mld_cap);
 
 	return u32_replace_bits(mld_cap, max_simul_links,
 				IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
@@ -5319,7 +5366,6 @@ ath12k_wmi_tlv_mac_phy_caps_ext_parse(struct ath12k_base *ab,
 				      const struct ath12k_wmi_caps_ext_params *caps,
 				      struct ath12k_pdev *pdev)
 {
-	u32 mld_cap;
 	u32 bands;
 	int i;
 
@@ -5365,11 +5411,8 @@ ath12k_wmi_tlv_mac_phy_caps_ext_parse(struct ath12k_base *ab,
 					  caps->eht_cap_info_internal);
 	}
 
-	mld_cap = le32_to_cpu(caps->mld_capability);
-	mld_cap = ath12k_wmi_get_spec_encoded_mld_cap(ab, mld_cap);
-
 	pdev->cap.eml_cap = le32_to_cpu(caps->eml_capability);
-	pdev->cap.mld_cap = mld_cap;
+	pdev->cap.mld_cap = ath12k_wmi_get_spec_encoded_mld_cap(ab, caps);
 
 	return 0;
 }
-- 
2.25.1


