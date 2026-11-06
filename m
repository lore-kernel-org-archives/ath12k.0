Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E389C606D823
	for <ath12k@archiver.kernel.org>; Fri,  6 Nov 2026 04:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F6ibK2/t;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d3rJ3wnI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LGJiYWDq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZS+ZPBExf8N6EoGjEt9fsjVijaVhiR7NVbU8PoRpNXA=; b=F6ibK2/t4fQC8E
	wauGzv7iAb3SM2ETQr+LiW68sFr71cN1+AK+ty1xRWDb8rOHmyE98zIXmDDxKUV/iIUvWsUgsiXDr
	2B6i3V1y/L/pqtBE05RzG4BeLGA9c3UDeSJfE2fMPf3f8suBcXWhkZUVVaUOUBU2KyFSyWFLeQG4Q
	uHIdT5RwcKjiNbwbcLl+BUAZqB09BI7/WQSTCwr/A1sSnzRbHargv9+T7idUI0YXrdXTym+0BhBaR
	LyGuZ5VQWv1o8VnoRDOyKyq0Ux/S0cA7ubJ4qh0/P9quCdWmHLzAyH38Cpda/Fa11WqE+EJCmQX67
	83TNvsat3oRrwsHZMr4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPC26-0000000BEnV-2oZr;
	Fri, 06 Nov 2026 04:58:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPC24-0000000BEmC-1IRg
	for ath12k@lists.infradead.org;
	Fri, 06 Nov 2026 04:58:33 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6403s61727726
	for <ath12k@lists.infradead.org>; Fri, 6 Nov 2026 04:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZS+ZPBExf8N6EoGjEt9fsjVijaVhiR7NVbU8PoRpNXA=; b=d3rJ3wnIp4OYfRG2
	cEBP6HwzASjm7dggTDaU3TGUHSMc8uqAw2lDLhT77A65Spvo/Lt9rXIkuok8N2/0
	NBWAR882nFpYBqAdXm4YBBLe8cXiNXOARZcecyhFIdfkHMPQcUz+9u27bNn1Ict3
	TqFGN+6Xm9Vrsp1o548fE+vDAviPF8BAfomN29OvwSZfo7TjY3HN2aoUKNEj4wlG
	wIp6kMASNmfEOiO5unKheS7GDsSV71yIAruIMcj5wkFFl6LeWQUHgBG+oXe7TIoB
	6nAYA7pB/c0ZWnez8Y/Rn0FgGOi/BB8dt1QOAIxrthGuirizLyT6xn1EA129Eurm
	UDt1BA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa8y7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 06 Nov 2026 04:58:31 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36de26cb4b3so319663eec.1
        for <ath12k@lists.infradead.org>; Thu, 05 Nov 2026 20:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793941110; x=1794545910; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZS+ZPBExf8N6EoGjEt9fsjVijaVhiR7NVbU8PoRpNXA=;
        b=LGJiYWDqgc7+nm6BnvNtf4s53Q3/MxAXvYGYdmkPPuGTXbKLj0qGnemJDo0EgSn+7a
         +4k4rTALG1A9K6XgzjmmohaHIoFlNiPb4d4UDY3Tk3KmIG14uoVRCuaGTah9lvArmZ87
         JHdwDfWV7fQKClPKI6ZH4UbE7YhjwB7sTSO4ISBxnfRqpCkjsin4r9xJhmPEtkRl2Xnc
         1GxwVO5kSSAxulFa/FhLngIsiGuE8P9QoBc7zr7eE0dMfy5lw0bAsKUFWcKCYchZxkiQ
         EQWV9fkxfI7W6k8LpzqvZgYq5QE06tBxq6DaqK66i2cZ1KMh+yfDV680GBvGSM+qnkR4
         z8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793941110; x=1794545910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZS+ZPBExf8N6EoGjEt9fsjVijaVhiR7NVbU8PoRpNXA=;
        b=Wk7OM8QGPVqR1u4ljHLVM6pQOu2HX6ZYn7qYzmoFv9XTK6FnF36+Sxd7otfamSF6w1
         b9CaWDxd2ryUpf1vyJPjEOFz1Zxf/ftTGeegzTE3PmuE+534vwR8BVotmGi9TH88c+vP
         F7uiA5ufZSsmf2wlszd9AUZx6WbSt5T4ryyMuLS9C3615MR+Mvk+UbmCPknbgouPHay/
         KKzDFJY2tvEuRWVIvf2kjlFqHXYg/4S2/gba417VLeQYozeoTSbQoZGH8Hffi02fnT3m
         dX2gWUBDCP+A+cyXSv8Jb8yYzfAv/d/VktTiwDvjizALzNKgHCX8qw18YZK8P23S/k4D
         z6oA==
X-Forwarded-Encrypted: i=1; AL+hErEhlsCfFPfmCR4Y0eQeTlqrngwEDNelmvkn+cyyn+WezXCNqBPqbXDS56VCas3tYMZBkCo17sc=@lists.infradead.org
X-Gm-Message-State: APuU4Z+txMBTRRCJ5rPfjf+haVSFudePQEEAexrfHXObSvVpwXBoIBSj
	KQhFW87wLk3rwvLdSUAamuC86bC3XCchrX5cpOyRRPzMX19b0EWUqYje4RURBuTabzFSg7B16np
	FwxsZX7IzrQHeqhvOC5ojyLDrO7MmFjm0dAjYaP3/OZwTAg9xaZmo75bm9fBIDZVPkbmJT839
X-Gm-Gg: AYBFou1ZMgGagrfhnOyRQilJpugyszV/1gJ3dYIs8nVjxdnQ5nATDPelX/rrua58s0u
	6v6/kM2LUsdXDs3bkYa2i9zfYHACb7l5DkMkMINTJGzQ6UYPGFytIn8Djax7b+csgNnFCdKFiUb
	WgPjaVNdXU9Pe4/V7gPAhv/5TFH4QzvV5E9cs5MqWIVxemSOzu1GACBYc883VaNrJgd+krC5NiT
	rx0Y+BnKD5SZGzTZqHCao2uEc52EVjYDPwZGmh/sop1QYuT9+qTjVnBM2Jek7Wj+HNaG+w5IOGi
	34yH1hldWtvlAvvsQ3yNDOFIbUlQlMMc1J9N0/ksKmFF1j3kV12d2AqmxK9s7EMYONn7u93ZE0T
	fTYE9ERYfGA2UHmQDxkjDQulTf8HpPA9JCGUu7iMgc9nH49ZrEEEcYyVokkxVtui/JC0HJJKLb2
	2i6WbhiYHdXSpus0p2jwhxuJJZEC+UGdHbH1ZGlEsG3mVjqABmsSuqA5nU0qCS2ZNTYK+x25fUw
	8Yu
X-Received: by 2002:a05:693c:8008:b0:369:d486:457f with SMTP id 5a478bee46e88-36f73e72d61mr1900164eec.2.1793941110237;
        Thu, 05 Nov 2026 20:58:30 -0800 (PST)
X-Received: by 2002:a05:693c:8008:b0:369:d486:457f with SMTP id 5a478bee46e88-36f73e72d61mr1900135eec.2.1793941109700;
        Thu, 05 Nov 2026 20:58:29 -0800 (PST)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm3021327eec.6.2026.11.05.20.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:58:29 -0800 (PST)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 10:27:43 +0530
Subject: [PATCH ath-next 2/2] wifi: ath12k: Extend BA buffer size to 1024
 for EHT capable links
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-eht-ba-window-v1-2-622f2272e582@oss.qualcomm.com>
References: <20261106-eht-ba-window-v1-0-622f2272e582@oss.qualcomm.com>
In-Reply-To: <20261106-eht-ba-window-v1-0-622f2272e582@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Paulson Raja L <lraja@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793941100; l=2431;
 i=rameshkumar.sundaram@oss.qualcomm.com; s=20250120;
 h=from:subject:message-id; bh=4swqYOm/vWgu5fj29xpSAZ2upc9FVcz3hlehWFqxrj8=;
 b=vTZPB0TRQ5gcBj/f2Cc4sgQMqu9JEOzJF64Te5bBVKPJwjJOugIWd7RPUAIOrqpjtUEpQL599
 Ic34wB/Fvl8DUaGlZiCbHlVC7V5fmll/XWf2XbewIDZnfH8uwhcmkqg
X-Developer-Key: i=rameshkumar.sundaram@oss.qualcomm.com; a=ed25519;
 pk=CbWiiM4JikGBEWI7HtrEEE/Hwkk7TTcob0SwaFdAwKo=
X-Proofpoint-GUID: rn2dC0VGQDCjHsGILAD8VG1PqRgKmz6h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAxOSBTYWx0ZWRfX/Vm9gNHDQrV6
 tOcuSUK52dBaQNMuRu4mVwx+NDvJgr4I3GDim2CMIhycm7NItCDik0XdDiGgtaAKfDGf8AHffsw
 PVZFsy7Ay/0f7Q3/uTKD2GGtkhZop0o3ZkIAnHPK1I2u3fSBjJZGioUMQI2sPLJEnD/O9S52jG+
 Gfjp2tldARVOK7kFF1d/8ZjKOM+Q+6DeobHRhcnVaMiLz4WyVfYK2gV+Uo80Q9D/WAFKCNgaXR9
 VR2Yp6DByJQ0HObQC3omLPPOUJ5wzZMZdmO8O1v62FRHTfJR8C7wpejfiQrdpHoyjQU/UNjutWg
 U3MijMPzvfgz1FKCXzIjgCRyPN2A7ejpYzsrX8I1e9m9tTdmotJ/8DqEMLuqY6jNDzhpwvKv8jG
 AbhJ0MdfJKJrxJAakOi62BPZZ8FBPmmQwVGv6YEZ6znuTV05X0rtryRdyYuh8pypa5XMrHRyyGc
 id5rUokW9slrqHQHr3g==
X-Proofpoint-ORIG-GUID: rn2dC0VGQDCjHsGILAD8VG1PqRgKmz6h
X-Authority-Analysis: v=2.4 cv=X7rHu2Te c=1 sm=1 tr=0 ts=6aed5e77 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jeHpWAP0zc3Nfv8w7osA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAxOSBTYWx0ZWRfX1XZ14oJPoNJO
 4JNpMiWuICPjGmrSzDNijCN+kSy8Z2thrUG3tcAx6q1vryHLTaIEgMwSoxgWqOBJnYPCewUPNpO
 AIitpUI9qJdZe7NypO4gG+EnJ7WEWkA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_205832_481616_94D8D16E 
X-CRM114-Status: GOOD (  14.96  )
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

From: Paulson Raja L <lraja@qti.qualcomm.com>

IEEE 802.11be (EHT) extends the maximum BA buffer size from 256 MPDUs
(HE) to 1024 MPDUs. EHT-capable links are currently limited to the
HE maximum of 256.

Add WMI_BA_MODE_BUFFER_SIZE_1024 and select the buffer size based on
the negotiated mode: 1024 for EHT-capable links, 256 for HE-only.
Also include the return code when reporting BA mode configuration
failure to aid debugging.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Paulson Raja L <lraja@qti.qualcomm.com>
Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 14 +++++++++-----
 drivers/net/wireless/ath/ath12k/wmi.h |  1 +
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 711acb32a6ca..0ad019fd4918 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4889,14 +4889,18 @@ static void ath12k_mac_bss_info_changed(struct ath12k *ar,
 		ath12k_control_beaconing(arvif, info);
 
 		if (arvif->is_up && info->he_support) {
-			/* TODO: Extend to support 1024 BA Bitmap size */
+			param_id = WMI_VDEV_PARAM_BA_MODE;
+			param_value = info->eht_support ?
+				      WMI_BA_MODE_BUFFER_SIZE_1024 :
+				      WMI_BA_MODE_BUFFER_SIZE_256;
+
 			ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
-							    WMI_VDEV_PARAM_BA_MODE,
-							    WMI_BA_MODE_BUFFER_SIZE_256);
+							    param_id, param_value);
 			if (ret)
 				ath12k_warn(ar->ab,
-					    "failed to set BA BUFFER SIZE 256 for vdev: %d\n",
-					    arvif->vdev_id);
+					    "failed to set BA BUFFER SIZE %u for vdev %d: %d\n",
+					    info->eht_support ? 1024 : 256,
+					    arvif->vdev_id, ret);
 
 			if (info->he_oper.params) {
 				param_id = WMI_VDEV_PARAM_HEOPS_0_31;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 5d0afbf0bd0c..78f1ceaaf5ff 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -171,6 +171,7 @@ struct wmi_tlv {
 #define WMI_APPEND_TO_EXISTING_CHAN_LIST_FLAG 1
 
 #define WMI_BA_MODE_BUFFER_SIZE_256  3
+#define WMI_BA_MODE_BUFFER_SIZE_1024 6
 
 /* HW mode config type replicated from FW header
  * @WMI_HOST_HW_MODE_SINGLE: Only one PHY is active.

-- 
2.34.1


