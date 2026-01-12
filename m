Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8CBD25032
	for <ath12k@archiver.kernel.org>; Mon, 12 Jan 2026 07:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=monwikUG1hDRn94CK5aNYv0OLnIwDFS3CHYmhGLSnsA=; b=kPpfTPLKCXQ+eMEY55vvu5kwTF
	mcqF193As1Bdy/F8mv2Hj5EriAks/xu6zJCuvGhOVMPvJ4nrCm82WdWWPy7zCijXPtuzve17uM/33
	yVvzdjLCaHWXPOgfyOhmSgMG28YPQDaXvojwONVxulrJZyb16jVLiCVTU77gZ+QpmSiskkHzqjrRz
	DjB4KlYU5NUv0rxnvwmVm2pP4DDlWVJja8FhkJlyMvrc8+YYfxliLEtIadIJEnzg0mfzZ1C+jRk7x
	PWWJq7Cj4yziF7JE+iknQytT99CJn/SmhcTtTqShXCTWelqzZGOzJbaCS5OIk1yHMGzo6Isz5MixY
	dlDLfAaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCUY-00000004ts3-0zMa;
	Mon, 12 Jan 2026 07:37:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCUV-00000004tow-3yYL
	for ath12k@bombadil.infradead.org;
	Mon, 12 Jan 2026 07:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=monwikUG1hDRn94CK5aNYv0OLnIwDFS3CHYmhGLSnsA=; b=WT52QpaVjSDpBwXVwHFht5RfVX
	iAAZsIHpP630O35W1feUIfWSggnQgR61+bV/k28fYvLRnzyLgHABHeFcYlmOVP5JJSiNUH1Bco8B2
	1HjDHPTF1u8kg3AmE+4YtrpufObAd/TeY12qTKrj2+X82M9CEg+k0M7FpA46kWUidrsHSnIWl6BSp
	0LPq04JEpam4kxZvxa7nwnovHXd0cPKlpQMqxIR4VtdoCBscIazsWWPfNOX8HXuMRUQCnyzkEQgYX
	Fz36aahKYkiCitZ8k9W4uJISAsvQYWzC9bVDsxvsMaMOUtX4Ai04G7gSDml50pDF5LE7QVfYDlZ2i
	k6eMmzwA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCUR-00000000B04-1YhY
	for ath12k@lists.infradead.org;
	Mon, 12 Jan 2026 07:37:29 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C3LX281078207
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	monwikUG1hDRn94CK5aNYv0OLnIwDFS3CHYmhGLSnsA=; b=AwhnIF6h9++xzFEd
	ZhEqboKjj9Y/r+rVI7ytPOdNCAXySit6Tz0gjffcuGNy5lPLOpg8+3jgZxJv3Sjd
	RogNm/YjYdFiLM2Jw05qa6abq8WGi86E6NqHbV3GFXAx2r1mvzDUzHZyPWcBzD03
	s9QEI07j4W9r3D54jdeaUukVcjp61GPpihx6WPunxvqq02L+bVXDvPpsZNRAZV9A
	Mq+/A+SoxkdhFavh7XKnoHLKHgJf5RKk/vInvIQ9K8uFO0sJSJgY5l/Pbn9WvUnI
	jqmTkfA2138ey2k5bVsYR07kA43g0Llzp7HlPTxZ/D/l/FcFmccwaK3qEy2nT5/3
	DB9Hxg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkjvxumkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:23 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c552d1f9eafso4397809a12.0
        for <ath12k@lists.infradead.org>; Sun, 11 Jan 2026 23:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768203443; x=1768808243; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=monwikUG1hDRn94CK5aNYv0OLnIwDFS3CHYmhGLSnsA=;
        b=e8hqTjnGdPY1Nf7lkcUtEkGx2ledTO5puUH2w1Nx6BTJvqksTx7XOvYiMY+dGtnUlH
         q21PX2d5q67o7HibD07i5X4LpzpFg5ikq1bHXswztObjzykYQcRCan/LOQGt1FY0pMRa
         K2MZqep1b1kLJWOnAbcu0DreAWrvEmbAGhxgKHDbGoIETuo4LC97TRCvSLAXkPRNTOzV
         u4/5RwD0u4QqrbHRHYpvHEUE+I82FCiLm0T02HKjzrmt9kg4Dhgh/oD9Sor541DprT++
         CJkLg9vuAEQaUPBBrGZupZi225D2B62yJ5nLkihCEdoYP0cIRXrtK+KJnfDm1AhUWvEf
         XfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203443; x=1768808243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=monwikUG1hDRn94CK5aNYv0OLnIwDFS3CHYmhGLSnsA=;
        b=OjexDyrJKMI6SgunPFfOJHY4w5U1AnqdFH6j9KDhjiueS3lLyML5RKskirdn97XXmj
         gzVHl9f837bFppwr5/t38/2Msv/Bwj9IlptEA6MXvvaqSgmF/VrgGQn+aW4UBI/YX9y5
         Zdc0XN7G3pLtf/6i6CW5aB1kdT2J8IKkvnKfaMJcHCBb7krLWeaEB70Oq3j3bQuQ4cX2
         3NI5+ynfSBu4t02EoYO0hqnVzu7Gryv678FlRmFe7g5SPbJF9mDIjKin/ZD7WLuTv3qy
         iLKe06TFpiW8hq0YSjfzQDlbaT1e0B6CEE2y2mJlerV8WjFGNjvV1va3PQiCIS4I1InO
         QA+g==
X-Forwarded-Encrypted: i=1; AJvYcCVUXcD7Rv6rOcJs3fP5Vy9YuwTrfY/altdJ6xaspH1cKqvXnzYvKcntRemdH2jePGgA0MJU1Wc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBcD+CTx2UNxsDsmjTuOu1zWZAi3uH5GRaVf5U/R81BBM+foHk
	HiHHPI6gKA5kgZxZ893xI6j7NmXHjj9TtfUXGK8T/xb0RvRrNKoCPI5wsgvgUgouQkzePtHpvJn
	LjPU5nfvpf0c1W0142O8J+HQftwAA8zmbf/LVGiZJdnHQ+7S4co1v98i+9AVaP/l8edNXlXXIBt
	Q=
X-Gm-Gg: AY/fxX5yXgJsOzQIIzDQVpDDVqehEJl56OfKTpX3eADM/MZIU6Ze9G80dB/zLAy7Xjj
	0ReQoCrbnB7PJIBPQNFjBIVOHvb3Oma4Qi27dGPhQpY9kzha+YOkox2Lf0t+wu9UF9x/7YIh/Mr
	3Ya0MFX7nOxXq0O5Ir5tp2X6Gw9SGqjcZIaT2xtw4S4w47gHT7fGd3P+H1s/y9qOuMuNqUdf8mb
	RjgZ9aV+M/xrYjP0NNUApSgohSQGTptcDmGlzL6bSRKU/q6kSGc8xMh5RMiEl9SThjDvFftYtOp
	XHeWwamhi7bhJIR5lMm0djZqBFZeu9AIsS5orrzNyTjAdwTVeF3xtD7ILKYn9P6xPFDqK0x/bZn
	jJB5PA96FEXI1Xp7eDajgYiDcva8CY9mCX2kcI7cZIwCHCyfh/CFQippRzC3cfAA=
X-Received: by 2002:a05:6a20:3d95:b0:344:f9e5:e9a9 with SMTP id adf61e73a8af0-3898f8fdc5emr15097174637.18.1768203442524;
        Sun, 11 Jan 2026 23:37:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkFO1Tn+UDkYM32rwPDmpEaxzO9FIoM8IvFuKP8S6K4XWbq5Q+4Q6b31LZwUSRkuqClUAgmw==
X-Received: by 2002:a05:6a20:3d95:b0:344:f9e5:e9a9 with SMTP id adf61e73a8af0-3898f8fdc5emr15097154637.18.1768203442089;
        Sun, 11 Jan 2026 23:37:22 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28faa9sm16548684a12.2.2026.01.11.23.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 23:37:21 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 15:36:36 +0800
Subject: [PATCH ath-next v2 16/18] wifi: ath12k: send peer meta data
 version to firmware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-ath12k-support-qcc2072-v2-16-fc8ce1e43969@oss.qualcomm.com>
References: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
In-Reply-To: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Wrsm8Nfv c=1 sm=1 tr=0 ts=6964a4b3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=irMkNu71nIbfwbNoXCgA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: r7znqrxFpoe-F3h2gzCfIRDc5L4GS-Is
X-Proofpoint-ORIG-GUID: r7znqrxFpoe-F3h2gzCfIRDc5L4GS-Is
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1OCBTYWx0ZWRfX8vOJABRKm78W
 4wCq1EOvtTObCR5pqQNwRTVr9Pejl3elDiHZ/hppPqLDhQ+hcgdoYoMesDxWnY8GVBxeVA9IZWY
 5Mb8FGWl0urwEJEnaADlTgq36VdWESO0jHnRx0yYNdxNZnehjf46UDK/UTIKshJ6bUxkrrkiPfY
 1KsV0w0fyVUOmlTrbbo5HtIwwzCVpgozrqkvPaClZjR/AacbGuTb9El/j0EvZmduuyIyfOpl0r3
 sZ43L2GRNKtCY3C0Gv7E6Yl7LaQ1FaylQtcr5qT2xt6a+2Ilcm8ERU58FSaVRy0B8aHXMGw7irL
 5QCA5epbXJxbG03+t6Td0cnzgHe+lNnfOC3ImE6GBCbPUNuJNpCDBwPfm7zkvSOSRMHT5Yj+pin
 tAmoGKaPvyb1oK9esycQwor0z6GUyE9BblLOSpFnKnyqd8Bx79dD5KusY/ZOHr5tSMBTUHPiTfQ
 IAu0FWJKSLAofwhrlRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_073727_885730_159D89AB 
X-CRM114-Status: GOOD (  12.77  )
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

Peer meta data version is currently not delivered to firmware, resulting
in QCC2072 data path issues.

Parse it from service ready ext2 event and send to firmware in WMI init
command.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0-01560-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/wmi.c | 5 +++++
 drivers/net/wireless/ath/ath12k/wmi.c       | 4 ++++
 drivers/net/wireless/ath/ath12k/wmi.h       | 4 ++++
 3 files changed, 13 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/wmi.c b/drivers/net/wireless/ath/ath12k/wifi7/wmi.c
index c575b44a33f3..ed538d20d324 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/wmi.c
@@ -102,4 +102,9 @@ void ath12k_wifi7_wmi_init_wcn7850(struct ath12k_base *ab,
 	config->num_multicast_filter_entries = 0x20;
 	config->num_wow_filters = 0x16;
 	config->num_keep_alive_pattern = 0;
+
+	if (test_bit(WMI_TLV_SERVICE_PEER_METADATA_V1A_V1B_SUPPORT, ab->wmi_ab.svc_map))
+		config->peer_metadata_ver = ATH12K_PEER_METADATA_V1A;
+	else
+		config->peer_metadata_ver = ab->wmi_ab.dp_peer_meta_data_ver;
 }
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 0e1e6853ab85..cce3d699112d 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -5477,6 +5477,10 @@ static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
 				    ret);
 			return ret;
 		}
+
+		ab->wmi_ab.dp_peer_meta_data_ver =
+			u32_get_bits(parse->arg.target_cap_flags,
+				     WMI_TARGET_CAP_FLAGS_RX_PEER_METADATA_VERSION);
 		break;
 
 	case WMI_TAG_ARRAY_STRUCT:
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index daee2787cdfd..fdc203fdba0a 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2783,6 +2783,8 @@ enum wmi_channel_width {
 #define WMI_EHT_MCS_NSS_10_11  GENMASK(11, 8)
 #define WMI_EHT_MCS_NSS_12_13  GENMASK(15, 12)
 
+#define WMI_TARGET_CAP_FLAGS_RX_PEER_METADATA_VERSION	GENMASK(1, 0)
+
 struct wmi_service_ready_ext2_event {
 	__le32 reg_db_version;
 	__le32 hw_min_max_tx_power_2ghz;
@@ -5230,6 +5232,8 @@ struct ath12k_wmi_base {
 	struct ath12k_svc_ext_info svc_ext_info;
 	u32 sbs_lower_band_end_freq;
 	struct ath12k_hw_mode_info hw_mode_info;
+
+	u8 dp_peer_meta_data_ver;
 };
 
 struct wmi_pdev_set_bios_interface_cmd {

-- 
2.25.1


