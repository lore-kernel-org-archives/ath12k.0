Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA13606A333
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 06:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xmE3z47T;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K+/sJfdq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W8oa7v2n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mkOhL9GpadxVeBKAKpXR0Dex6fDsvsaYvLqLFsa0ym0=; b=xmE3z47TPJBouy
	3gTD8mwJIDAUr1XL+EhlD79RESrS3OsboV7D2WDtHlJ2ka+lrnRG3JWXcCI05rlCCtRDAmEO0L0Xi
	VViH9hpaagdRfr44tzPxSQ81vPwiSooMYr87Vvh4wcBYSN00pD6bF9H3JAW/wZPlh0K192REucPRZ
	eZsDwwxeMXO7EntRDEwBTmArD6W5++FtIqoPPDRcOw9Td2XN23tGTutZtKQ6je/Yu5QpirjGy6GkG
	xkqdwcP5yA6qWq/lWX2+qd1AxfQUs3tyXI99SbgNfzqHYM30yBNh3zxoZu6a46SG7j8Z87dVNisrR
	Hs7fABId3DOTZdGusVKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ17-00000007rIp-22fd;
	Wed, 18 Nov 2026 06:19:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ13-00000007rEB-1V8T
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 06:19:36 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UrVY2383072
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 06:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mkOhL9GpadxVeBKAKpXR0Dex6fDsvsaYvLqLFsa0ym0=; b=K+/sJfdqyFaWtnD4
	0c//b7eQANG1Ti25h3UjGpYBuKp2ZcBBfR9LEwK7Y8/LLPgxd+NuP3gX6iuUpyr2
	wnDMLYDmCjTkqOaJ/HhFnp9cw65Hx5Fe/TyhE7YNLCuHGXoaYpmQ0h0zS81D4VOr
	0hNqLWbsbuvR3ciiGpenXsx3RmNL51YYLvKYF56uOEhAUoSNajdJMbPgJpjCSpjh
	h3gzRhp6evXhcw92YtOpXVWbwkTO8CZJhyKMdhPftWuri8ojMcNFn1QGC5w8+tiv
	zd0jY9iFIaxipq1zdTTrCtqEqg47SfwEL0m9//TEQGLap41RuK3C0Erd+DUVvSRY
	Oz/jzg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvasj9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 06:19:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so589226a91.3
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 22:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982772; x=1795587572; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mkOhL9GpadxVeBKAKpXR0Dex6fDsvsaYvLqLFsa0ym0=;
        b=W8oa7v2nBKWtZggLhbyxNILGAQoUR38wPNdKJegLuRuWnhFgm9Xk8BhE40zp/YG/z/
         S5+OYuD6OVaTl8Pk87QwzozOPFeZpGANtK/zcvaBDvQ+TkGWh60tq5O/XUgqAbkkcWvL
         zFtsTC/oOTc3eu3kviD+r2M+NAczldyfNmDzvY7xK3nOlegFTS6OdrEh5jPtB5O0+yPD
         h0ymyNhTURWXVrK5ycIXO9hAKFspBo0WPYWFomxVrpUZLk3MwAHQGQYNA6mTJvWO2sh0
         kGp+Nf+YF7NnfegEJzq4xaUMNpatmD6/lyeYGn60/ambwTosw6vJFgsE0l29qoidf1nY
         xNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982772; x=1795587572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mkOhL9GpadxVeBKAKpXR0Dex6fDsvsaYvLqLFsa0ym0=;
        b=ZuT7MF0bU9e5zbdrrKzqJXmLCyzHyuCOR8ltsUBg80l004Y0IEwJfPzrrf+KtYLbmi
         fen1NX09JgvAs4HJg2omWbZ8WkF5Ousapvm7Azrn13JFhvjiFQMlA5wv2R2lNUhE6i2b
         cX+m8drJORfBBiHweIe7ctCHDJ0ncgihv7fPEZ6HkkuXWI4OhFzuHhYtNg5PBKdOxT34
         uPejzkkof1z1psIk4NtXexDYTuV98TwY358CQcvleXqMzQ0HUFa1DjCD96jNPVC3AlZD
         7WwD4Dd8vWuXd2YGePd6UKNiYguHJIWUZ3V+A4eEZBYBDRr6fe9y6vI52QK4qzq94gbZ
         7kIw==
X-Forwarded-Encrypted: i=1; AL+hErGlTR0nDfBt13h0AUr6u6XHspPmRoB4HV/eZ+QdQbzQ+WOhzBGWkSZuwkA0kemIxkbADIJlfqA=@lists.infradead.org
X-Gm-Message-State: APuU4Z9omPuI7cruTn9CzEw1r5AIeyO/AJWUe/ACp0CjST/2eWC8TzT3
	td07Fw6swu5vTCPkxJvP4yNgFlH/3WaC103iXnA61vC3jGlJ2RTwTfOAtyEeFR+cU4jmu8jAFBk
	CRaDxL7qM5BJbd1fSULpxTo1t7qKDOSzWuwmN93xle8L29eOjt8vtpeJwTZO5V3eq
X-Gm-Gg: AZFdTZd1hH1RTjfp/j+FD1y6ZxcSR6dTWn4EtF+UX7Q3K/dvTbPEcy94jSnpBAYBRoX
	JdV+FRa+qREeuCJTFBNVntOa0hY07damlxAo008lZ7xDaSiXov5gRHGYxSrk/42gy3AHx5fqFaP
	vITtqL5RpZmlBbaqymz10BlBCWU7r84R6uzruOEvJ/oa4H67Vf/E1LChZSoob1o+SLZYiBvg9ES
	mkXCw5yaOzSBFG/gaT3Agxm0qrAvDHavYXVfLSVdq7RPyYMv0k09Ns4CrVkyd2fY85qc4ujA6ny
	ouUewLzcoVfmabns24lIGU/Iegrjy+4rq4IEMIK6HzGZJhOV9vq3Ajd1XiTJ/SBe2c1AO99Od43
	uG5vvPcLT/UjolZ5dmBTiZ1BqZpkTN3Ma0zwywkp1L5Fay6Plt/17nGqiaB8pxyfVip25fwxXbe
	ilEjeMvOkHdlkylSRt2FqRQ+Ss/NJHHEkVMqNO2YSwRn+cltpq3G+xDH4RrZ2T8B8pjwXCEbXtH
	PA=
X-Received: by 2002:a17:90b:4d82:b0:3b3:b71e:b2ee with SMTP id 98e67ed59e1d1-3b3d07c613cmr1683265a91.35.1794982771880;
        Tue, 17 Nov 2026 22:19:31 -0800 (PST)
X-Received: by 2002:a17:90b:4d82:b0:3b3:b71e:b2ee with SMTP id 98e67ed59e1d1-3b3d07c613cmr1683223a91.35.1794982771263;
        Tue, 17 Nov 2026 22:19:31 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:19:30 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:07 +0530
Subject: [PATCH ath-next v2 04/15] wifi: ath12k: add QMI support for
 extended firmware binary download
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-4-d81a3046290e@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd4374 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=3JWo-c6HkdcVygKZMrcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: HvL_yj26227d1J03JvIfR1_mCvyBbBVi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXxF6cl1Y6kTKG
 y/qaQn1euOZ4gj/AzEO3ZD7TMs0bG+sg7H+3/0+eB5xgOq8rPL1WlI2BqAzcOj9Qyx1TNb4RFQX
 IVOq9kgBOmWRGTtlVlN8MQ8Yf2g70HPO7h+Y891WcmPRqckMoT7VKtwzPOJu59BMD4CpX2sBedW
 d2cQBW9EvI2zdyoTPC0CxEEUhUpAPMzgitrzODgGWHKoIX8OPkjmXLxvQz7bTIIXAlK1B/FLhq0
 T9cK5VJSsAOxfxv02lA7VKT/uNC/tMcG2Na9E75puGxhYcihkFl/ZeSnIXl/k+VeBD+ArA6tpJX
 dwa/Sl3erydnfQ3os90f328yoKFRLC/Phb+aE0kCObeEOeewB9HFFsHEPfYKvlTNm9YgR2eOHMq
 Q/DWZj0NOU0a8Jl+i3qex9WdhJ36JhUzAx17kTBlo9VQN8zHpcVRNNlNV9fk4goycF6l4hVfY2F
 zLM5S88r9aJaUnFU6SQ==
X-Proofpoint-ORIG-GUID: HvL_yj26227d1J03JvIfR1_mCvyBbBVi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX4BV2YO7q8rCm
 duCnLlRb3aq5Ziy+8wyu9OWnL065mrGTIZiWXX2B4FOEtV95UsFqYiJVaYUKeTs2jX8Sdgv/Atk
 e//l+04XLcQ55c5QlOyMep7APDw2mVU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_221933_453718_3E948564 
X-CRM114-Status: GOOD (  21.75  )
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

ath12k uses separate per-image QMI messages to download firmware
binaries (M3, AUX uC). QCN9575 advertises support for
QMI_WLANFW_EXT_FW_BIN_DOWNLOAD_REQ_V01 (0x0065), which carries multiple
firmware blobs in a single combined request. The existing download path
does not handle this mode and cannot bring up QCN9575.

QCN9575 introduces a new microcode image, mcss_ucode.bin, which is
required by its new hardware architecture. The host is only
responsible for downloading the image; initialization is handled by
the firmware.

Parse ext_fw_bin_download_support and ext_fw_bin_download_bitmap from
the target capability response and validate the bitmap in
ath12k_qmi_request_target_cap(). The bitmap tells the host which
images (M3, AUX uC, MCSS uC) the firmware expects the host to provide
in the combined extended download request; each set bit is one
qmi_wlanfw_ext_fw_bin_type_enum_v01 value.

QMI_WLANFW_EXT_FW_BIN_TYPE_HOST_SUPPORTED_MASK limits that validation
to the three types the host can actually load (M3, AUX uC, MCSS uC)
rather than the full qmi_wlanfw_ext_fw_bin_type_enum_v01 range,
because firmware defines four BDF sub-types and a QDSS config type
that this driver does not implement a loader for. Without this,
a bitmap that requires one of those unimplemented types would pass
the earlier range check and only be caught per-bit, inside the load
loop, where it would abort the download the same way a mandatory
M3/AUX uC/MCSS uC load failure now does, instead of being rejected up
front with a clear "unsupported type" error.

Add ath12k_qmi_ext_fw_bin_load() to source each bit's image the same
way the existing M3 and AUX uC loaders do: from the corresponding IE
embedded in firmware-N.bin, or a standalone binary (m3.bin,
aux_ucode.bin, or mcss_ucode.bin) if that IE is absent. M3, AUX uC, and
MCSS uC are all mandatory for QCN9575 firmware boot, so a load failure
for any of them aborts ath12k_qmi_wlanfw_ext_fw_bin_mem_info_send()
and fails BDF load.

A device only ever uses one of the two download modes, so m3_mem and
aux_uc_mem are placed in a union with ext_fw_bin_mem[] rather than as
separate fields, saving the space of whichever set is unused. Since
ext_fw_bin_download_support never changes once set, add
ath12k_qmi_free_fw_bin_mem() to free only the union member that device's
own download path populated, rather than unconditionally freeing all
three and risking an aliased buffer being interpreted and freed twice.
Call it from both ath12k_qmi_deinit_service() and
ath12k_qmi_free_resource().

Define the extended firmware binary request/response QMI message
structures and element-info tables needed to carry per-binary DMA
address and size. When extended download support is advertised, use the
new combined request path in ath12k_qmi_event_load_bdf(); otherwise keep
the legacy M3 and AUX uC download messages. Release extended firmware
DMA buffers during QMI deinit.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h |   2 +
 drivers/net/wireless/ath/ath12k/fw.c   |   8 +
 drivers/net/wireless/ath/ath12k/fw.h   |   1 +
 drivers/net/wireless/ath/ath12k/hw.h   |   1 +
 drivers/net/wireless/ath/ath12k/qmi.c  | 360 +++++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/qmi.h  |  60 +++++-
 6 files changed, 418 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 3a92a4b03359..a8e8a55aa718 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1116,6 +1116,8 @@ struct ath12k_base {
 		size_t m3_len;
 		const u8 *aux_uc_data;
 		size_t aux_uc_len;
+		const u8 *mcss_uc_data;
+		size_t mcss_uc_len;
 
 		DECLARE_BITMAP(fw_features, ATH12K_FW_FEATURE_COUNT);
 		bool fw_features_valid;
diff --git a/drivers/net/wireless/ath/ath12k/fw.c b/drivers/net/wireless/ath/ath12k/fw.c
index 22074653cbb8..0e413ae7062e 100644
--- a/drivers/net/wireless/ath/ath12k/fw.c
+++ b/drivers/net/wireless/ath/ath12k/fw.c
@@ -129,6 +129,14 @@ static int ath12k_fw_request_firmware_api_n(struct ath12k_base *ab,
 			ab->fw.aux_uc_data = data;
 			ab->fw.aux_uc_len = ie_len;
 			break;
+		case ATH12K_FW_IE_MCSS_UC_IMAGE:
+			ath12k_dbg(ab, ATH12K_DBG_BOOT,
+				   "found mcss_uc image ie (%zd B)\n",
+				   ie_len);
+
+			ab->fw.mcss_uc_data = data;
+			ab->fw.mcss_uc_len = ie_len;
+			break;
 		case ATH12K_FW_IE_AMSS_DUALMAC_IMAGE:
 			ath12k_dbg(ab, ATH12K_DBG_BOOT,
 				   "found dualmac fw image ie (%zd B)\n",
diff --git a/drivers/net/wireless/ath/ath12k/fw.h b/drivers/net/wireless/ath/ath12k/fw.h
index e146d24dfea4..f9edc7d336be 100644
--- a/drivers/net/wireless/ath/ath12k/fw.h
+++ b/drivers/net/wireless/ath/ath12k/fw.h
@@ -16,6 +16,7 @@ enum ath12k_fw_ie_type {
 	ATH12K_FW_IE_M3_IMAGE = 3,
 	ATH12K_FW_IE_AMSS_DUALMAC_IMAGE = 4,
 	ATH12K_FW_IE_AUX_UC_IMAGE = 5,
+	ATH12K_FW_IE_MCSS_UC_IMAGE = 6,
 };
 
 enum ath12k_fw_features {
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 138e556ac679..6fd87482425a 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -93,6 +93,7 @@
 #define ATH12K_AMSS_FILE		"amss.bin"
 #define ATH12K_M3_FILE			"m3.bin"
 #define ATH12K_AUX_UC_FILE		"aux_ucode.bin"
+#define ATH12K_MCSS_UC_FILE		"mcss_ucode.bin"
 #define ATH12K_REGDB_FILE_NAME		"regdb.bin"
 
 #define ATH12K_PCIE_MAX_PAYLOAD_SIZE	128
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 69512b82aa3b..3b60d624b0aa 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -639,6 +639,42 @@ static const struct qmi_elem_info qmi_wlanfw_phy_cap_resp_msg_v01_ei[] = {
 		.offset		= offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
 					   dynamic_ddr_support),
 	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x15,
+		.offset		= offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
+					   aux_uc_support_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x15,
+		.offset		= offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
+					   aux_uc_support),
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x16,
+		.offset		= offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
+					   mcss_uc_support_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x16,
+		.offset		= offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
+					   mcss_uc_support),
+	},
 	{
 		.data_type	= QMI_EOTI,
 		.array_type	= NO_ARRAY,
@@ -1459,6 +1495,42 @@ static const struct qmi_elem_info qmi_wlanfw_cap_resp_msg_v01_ei[] = {
 		.offset		= offsetof(struct qmi_wlanfw_cap_resp_msg_v01, dev_mem),
 		.ei_array	= qmi_wlanfw_dev_mem_info_s_v01_ei,
 	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x2B,
+		.offset		= offsetof(struct qmi_wlanfw_cap_resp_msg_v01,
+					   ext_fw_bin_download_support_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x2B,
+		.offset		= offsetof(struct qmi_wlanfw_cap_resp_msg_v01,
+					   ext_fw_bin_download_support),
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x2C,
+		.offset		= offsetof(struct qmi_wlanfw_cap_resp_msg_v01,
+					   ext_fw_bin_download_bitmap_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_4_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x2C,
+		.offset		= offsetof(struct qmi_wlanfw_cap_resp_msg_v01,
+					   ext_fw_bin_download_bitmap),
+	},
 	{
 		.data_type	= QMI_EOTI,
 		.array_type	= NO_ARRAY,
@@ -1704,6 +1776,104 @@ static const struct qmi_elem_info qmi_wlanfw_aux_uc_info_resp_msg_v01_ei[] = {
 	},
 };
 
+static const struct qmi_elem_info qmi_wlanfw_ext_fw_bin_mem_info_s_v01_ei[] = {
+	{
+		.data_type	= QMI_SIGNED_4_BYTE_ENUM,
+		.elem_len	= 1,
+		.elem_size	= sizeof(enum qmi_wlanfw_ext_fw_bin_type_enum_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct qmi_wlanfw_ext_fw_bin_mem_info_s_v01,
+					   type),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_8_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u64),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct qmi_wlanfw_ext_fw_bin_mem_info_s_v01,
+					   addr),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_4_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct qmi_wlanfw_ext_fw_bin_mem_info_s_v01,
+					   size),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_4_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct qmi_wlanfw_ext_fw_bin_mem_info_s_v01,
+					   reserved1),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_4_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct qmi_wlanfw_ext_fw_bin_mem_info_s_v01,
+					   reserved2),
+	},
+	{
+		.data_type	= QMI_EOTI,
+		.array_type	= NO_ARRAY,
+		.tlv_type	= QMI_COMMON_TLV_TYPE,
+	},
+};
+
+static const struct qmi_elem_info qmi_wlanfw_ext_fw_bin_download_req_msg_v01_ei[] = {
+	{
+		.data_type	= QMI_DATA_LEN,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x01,
+		.offset		= offsetof(struct qmi_wlanfw_ext_fw_bin_download_req_msg_v01,
+					   ext_bin_mem_info_len),
+	},
+	{
+		.data_type	= QMI_STRUCT,
+		.elem_len	= QMI_WLANFW_MAX_NUM_EXT_FW_BIN_DOWNLOAD_V01,
+		.elem_size	= sizeof(struct qmi_wlanfw_ext_fw_bin_mem_info_s_v01),
+		.array_type	= VAR_LEN_ARRAY,
+		.tlv_type	= 0x01,
+		.offset		= offsetof(struct qmi_wlanfw_ext_fw_bin_download_req_msg_v01,
+					   ext_bin_mem_info),
+		.ei_array	= qmi_wlanfw_ext_fw_bin_mem_info_s_v01_ei,
+	},
+	{
+		.data_type	= QMI_EOTI,
+		.array_type	= NO_ARRAY,
+		.tlv_type	= QMI_COMMON_TLV_TYPE,
+	},
+};
+
+static const struct qmi_elem_info qmi_wlanfw_ext_fw_bin_download_resp_msg_v01_ei[] = {
+	{
+		.data_type	= QMI_STRUCT,
+		.elem_len	= 1,
+		.elem_size	= sizeof(struct qmi_response_type_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x02,
+		.offset		= offsetof(struct qmi_wlanfw_ext_fw_bin_download_resp_msg_v01,
+					   resp),
+		.ei_array	= qmi_response_type_v01_ei,
+	},
+	{
+		.data_type	= QMI_EOTI,
+		.array_type	= NO_ARRAY,
+		.tlv_type	= QMI_COMMON_TLV_TYPE,
+	},
+};
+
 static const struct qmi_elem_info qmi_wlanfw_ce_tgt_pipe_cfg_s_v01_ei[] = {
 	{
 		.data_type	= QMI_UNSIGNED_4_BYTE,
@@ -2430,8 +2600,12 @@ static void ath12k_qmi_phy_cap_send(struct ath12k_base *ab)
 		   "phy capability resp valid %u single_chip_mlo_support %u valid %u num_phy %u valid %u board_id %u dynamic_ddr_valid %u dynamic_ddr_support %u\n",
 		   resp.single_chip_mlo_support_valid, resp.single_chip_mlo_support,
 		   resp.num_phy_valid, resp.num_phy,
-		   resp.board_id_valid, resp.board_id, resp.dynamic_ddr_support_valid,
-		   resp.dynamic_ddr_support);
+		   resp.board_id_valid, resp.board_id,
+		   resp.dynamic_ddr_support_valid, resp.dynamic_ddr_support);
+	ath12k_dbg(ab, ATH12K_DBG_QMI,
+		   "phy capability aux support valid %u aux_uc_support %u mcss support valid %u mcss_uc_support %u\n",
+		   resp.aux_uc_support_valid, resp.aux_uc_support,
+		   resp.mcss_uc_support_valid, resp.mcss_uc_support);
 
 	return;
 
@@ -3115,6 +3289,27 @@ int ath12k_qmi_request_target_cap(struct ath12k_base *ab)
 		}
 	}
 
+	if (resp.ext_fw_bin_download_support_valid &&
+	    resp.ext_fw_bin_download_bitmap_valid) {
+		ab->qmi.ext_fw_bin_download_bitmap =
+			resp.ext_fw_bin_download_bitmap;
+		ath12k_dbg(ab, ATH12K_DBG_QMI, "qmi extended firmware bin download bitmap 0x%x\n",
+			   resp.ext_fw_bin_download_bitmap);
+
+		if (ab->qmi.ext_fw_bin_download_bitmap &
+		    ~QMI_WLANFW_EXT_FW_BIN_TYPE_HOST_SUPPORTED_MASK) {
+			ath12k_warn(ab, "Invalid ext_fw_bin_download_bitmap 0x%x, host-unsupported bits set\n",
+				    ab->qmi.ext_fw_bin_download_bitmap);
+			ret = -EINVAL;
+			goto out;
+		}
+		ab->qmi.ext_fw_bin_download_support = !!resp.ext_fw_bin_download_support;
+		ath12k_dbg(ab, ATH12K_DBG_QMI, "qmi extended firmware bin download supported\n");
+	} else {
+		ab->qmi.ext_fw_bin_download_support = false;
+		ab->qmi.ext_fw_bin_download_bitmap = 0;
+	}
+
 	if (resp.eeprom_caldata_read_timeout_valid) {
 		ab->qmi.target.eeprom_caldata = resp.eeprom_caldata_read_timeout;
 		ath12k_dbg(ab, ATH12K_DBG_QMI, "qmi cal data supported from eeprom\n");
@@ -3425,6 +3620,129 @@ static int ath12k_qmi_m3_load(struct ath12k_base *ab)
 				      ATH12K_M3_FILE);
 }
 
+static void ath12k_qmi_ext_fw_bin_free_all(struct ath12k_base *ab)
+{
+	int type;
+
+	for (type = 0; type < QMI_WLANFW_EXT_FW_MAX_BIN_TYPE; type++)
+		ath12k_qmi_free_mem_region(ab, &ab->qmi.ext_fw_bin_mem[type]);
+}
+
+static int ath12k_qmi_ext_fw_bin_load(struct ath12k_base *ab,
+				      enum qmi_wlanfw_ext_fw_bin_type_enum_v01 type)
+{
+	const u8 *embedded_data;
+	size_t embedded_len;
+	const char *filename;
+
+	switch (type) {
+	case QMI_WLANFW_EXT_FW_BIN_TYPE_M3_V01:
+		embedded_data = ab->fw.m3_data;
+		embedded_len = ab->fw.m3_len;
+		filename = ATH12K_M3_FILE;
+		break;
+	case QMI_WLANFW_EXT_FW_BIN_TYPE_AUX_UC_V01:
+		embedded_data = ab->fw.aux_uc_data;
+		embedded_len = ab->fw.aux_uc_len;
+		filename = ATH12K_AUX_UC_FILE;
+		break;
+	case QMI_WLANFW_EXT_FW_BIN_TYPE_MCSS_UC_V01:
+		embedded_data = ab->fw.mcss_uc_data;
+		embedded_len = ab->fw.mcss_uc_len;
+		filename = ATH12K_MCSS_UC_FILE;
+		break;
+	default:
+		ath12k_err(ab, "firmware bin type %d not supported\n", type);
+		return -EINVAL;
+	}
+
+	return ath12k_qmi_fw_mem_load(ab, &ab->qmi.ext_fw_bin_mem[type],
+				      embedded_data, embedded_len, filename);
+}
+
+/* clang stack usage explodes if this is inlined */
+static noinline_for_stack
+int ath12k_qmi_wlanfw_ext_fw_bin_mem_info_send(struct ath12k_base *ab)
+{
+	struct qmi_wlanfw_ext_fw_bin_download_resp_msg_v01 resp = {};
+	struct qmi_wlanfw_ext_fw_bin_download_req_msg_v01 *req;
+	struct ath12k_fw_mem_region *ext_fw_bin_mem;
+	int num_ext_fw_bin = 0;
+	struct qmi_txn txn;
+	int type = 0;
+	int ret = 0;
+
+	req = kzalloc_obj(*req);
+	if (!req)
+		return -ENOMEM;
+
+	for (type = 0; type < QMI_WLANFW_EXT_FW_MAX_BIN_TYPE; type++) {
+		if (!(ab->qmi.ext_fw_bin_download_bitmap & BIT(type)))
+			continue;
+
+		if (num_ext_fw_bin >= QMI_WLANFW_MAX_NUM_EXT_FW_BIN_DOWNLOAD_V01) {
+			ath12k_warn(ab, "Too many firmware binaries to download, skipping types from %d\n",
+				    type);
+			break;
+		}
+
+		ret = ath12k_qmi_ext_fw_bin_load(ab, type);
+		if (ret) {
+			ath12k_err(ab, "failed to load extended firmware bin type %d ret %d\n",
+				   type, ret);
+			goto out;
+		}
+
+		ext_fw_bin_mem = &ab->qmi.ext_fw_bin_mem[type];
+		req->ext_bin_mem_info[num_ext_fw_bin].addr = ext_fw_bin_mem->paddr;
+		req->ext_bin_mem_info[num_ext_fw_bin].size = ext_fw_bin_mem->size;
+		req->ext_bin_mem_info[num_ext_fw_bin].type = type;
+		num_ext_fw_bin++;
+	}
+
+	if (!num_ext_fw_bin) {
+		ath12k_err(ab, "No extended firmware bins found for ext_fw_bin_download_bitmap 0x%x\n",
+			   ab->qmi.ext_fw_bin_download_bitmap);
+		ret = -EINVAL;
+		goto out;
+	}
+	req->ext_bin_mem_info_len = num_ext_fw_bin;
+
+	ret = qmi_txn_init(&ab->qmi.handle, &txn,
+			   qmi_wlanfw_ext_fw_bin_download_resp_msg_v01_ei, &resp);
+	if (ret < 0)
+		goto out;
+
+	ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
+			       QMI_WLANFW_EXT_FW_BIN_DOWNLOAD_REQ_V01,
+			       QMI_WLANFW_EXT_FW_BIN_DOWNLOAD_REQ_MSG_V01_MAX_MSG_LEN,
+			       qmi_wlanfw_ext_fw_bin_download_req_msg_v01_ei, req);
+	if (ret < 0) {
+		qmi_txn_cancel(&txn);
+		ath12k_warn(ab, "qmi failed to download extended firmware bin request, err = %d\n",
+			    ret);
+		goto out;
+	}
+
+	ret = qmi_txn_wait(&txn, msecs_to_jiffies(ATH12K_QMI_WLANFW_TIMEOUT_MS));
+	if (ret < 0) {
+		ath12k_warn(ab, "qmi wait failed to download extended firmware bin %d\n",
+			    ret);
+		goto out;
+	}
+
+	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
+		ath12k_warn(ab, "qmi extended firmware bin info request failed, result: %d, err: %d\n",
+			    resp.resp.result, resp.resp.error);
+		ret = -EINVAL;
+		goto out;
+	}
+
+out:
+	kfree(req);
+	return ret;
+}
+
 /* clang stack usage explodes if this is inlined */
 static noinline_for_stack
 int ath12k_qmi_wlanfw_m3_info_send(struct ath12k_base *ab)
@@ -3990,13 +4308,23 @@ int ath12k_qmi_event_load_bdf(struct ath12k_qmi *qmi)
 			ath12k_warn(ab, "qmi failed to load calibrated data :%d\n", ret);
 	}
 
-	ret = ath12k_qmi_wlanfw_m3_info_send(ab);
-	if (ret < 0) {
-		ath12k_warn(ab, "qmi failed to send m3 info req:%d\n", ret);
-		return ret;
-	}
+	if (ab->qmi.ext_fw_bin_download_support) {
+		ret = ath12k_qmi_wlanfw_ext_fw_bin_mem_info_send(ab);
+		if (ret < 0) {
+			ath12k_warn(ab, "qmi failed to send firmware bin info req:%d\n",
+				    ret);
+			return ret;
+		}
+	} else {
+		ret = ath12k_qmi_wlanfw_m3_info_send(ab);
+		if (ret < 0) {
+			ath12k_warn(ab, "qmi failed to send m3 info req:%d\n", ret);
+			return ret;
+		}
+
+		if (!hw_params->fw.download_aux_ucode)
+			return ret;
 
-	if (hw_params->fw.download_aux_ucode) {
 		ret = ath12k_qmi_wlanfw_aux_uc_info_send(ab);
 		if (ret < 0) {
 			ath12k_warn(ab, "qmi failed to send aux_uc info req: %d\n", ret);
@@ -4269,6 +4597,16 @@ int ath12k_qmi_init_service(struct ath12k_base *ab)
 	return ret;
 }
 
+static void ath12k_qmi_free_fw_bin_mem(struct ath12k_base *ab)
+{
+	if (ab->qmi.ext_fw_bin_download_support) {
+		ath12k_qmi_ext_fw_bin_free_all(ab);
+	} else {
+		ath12k_qmi_aux_uc_free(ab);
+		ath12k_qmi_m3_free(ab);
+	}
+}
+
 void ath12k_qmi_deinit_service(struct ath12k_base *ab)
 {
 	if (!ab->qmi.ab)
@@ -4277,8 +4615,7 @@ void ath12k_qmi_deinit_service(struct ath12k_base *ab)
 	qmi_handle_release(&ab->qmi.handle);
 	cancel_work_sync(&ab->qmi.event_work);
 	destroy_workqueue(ab->qmi.event_wq);
-	ath12k_qmi_aux_uc_free(ab);
-	ath12k_qmi_m3_free(ab);
+	ath12k_qmi_free_fw_bin_mem(ab);
 	ath12k_qmi_free_target_mem_chunk(ab);
 	ab->qmi.ab = NULL;
 }
@@ -4286,6 +4623,5 @@ void ath12k_qmi_deinit_service(struct ath12k_base *ab)
 void ath12k_qmi_free_resource(struct ath12k_base *ab)
 {
 	ath12k_qmi_free_target_mem_chunk(ab);
-	ath12k_qmi_aux_uc_free(ab);
-	ath12k_qmi_m3_free(ab);
+	ath12k_qmi_free_fw_bin_mem(ab);
 }
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 7879f439a5ff..fc68ff649352 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -69,6 +69,20 @@ enum ath12k_qmi_event_type {
 	ATH12K_QMI_EVENT_MAX,
 };
 
+#define QMI_WLANFW_MAX_NUM_EXT_FW_BIN_DOWNLOAD_V01 32
+enum qmi_wlanfw_ext_fw_bin_type_enum_v01 {
+	QMI_WLANFW_EXT_FW_BIN_TYPE_START,
+	QMI_WLANFW_EXT_FW_BIN_TYPE_BDF_REGDB_V01 = QMI_WLANFW_EXT_FW_BIN_TYPE_START,
+	QMI_WLANFW_EXT_FW_BIN_TYPE_BDF_GOLDEN_V01 = 1,
+	QMI_WLANFW_EXT_FW_BIN_TYPE_BDF_RXGAIN_V01 = 2,
+	QMI_WLANFW_EXT_FW_BIN_TYPE_BDF_CALDATA_V01 = 3,
+	QMI_WLANFW_EXT_FW_BIN_TYPE_M3_V01 = 4,
+	QMI_WLANFW_EXT_FW_BIN_TYPE_AUX_UC_V01 = 5,
+	QMI_WLANFW_EXT_FW_BIN_TYPE_MCSS_UC_V01 = 6,
+	QMI_WLANFW_EXT_FW_BIN_TYPE_QDSS_CFG_V01 = 7,
+	QMI_WLANFW_EXT_FW_MAX_BIN_TYPE,
+};
+
 struct ath12k_qmi_driver_event {
 	struct list_head list;
 	enum ath12k_qmi_event_type type;
@@ -153,11 +167,19 @@ struct ath12k_qmi {
 
 	u8 num_radios;
 	struct target_info target;
-	struct ath12k_fw_mem_region m3_mem;
-	struct ath12k_fw_mem_region aux_uc_mem;
+	union {
+		struct {
+			struct ath12k_fw_mem_region m3_mem;
+			struct ath12k_fw_mem_region aux_uc_mem;
+		};
+		struct ath12k_fw_mem_region
+			ext_fw_bin_mem[QMI_WLANFW_EXT_FW_MAX_BIN_TYPE];
+	};
 	unsigned int service_ins_id;
 	struct dev_mem_info dev_mem[ATH12K_QMI_WLFW_MAX_DEV_MEM_NUM_V01];
 	u8 dynamic_ddr_support;
+	u8 ext_fw_bin_download_support;
+	u32 ext_fw_bin_download_bitmap;
 };
 
 #define QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN		265
@@ -282,6 +304,10 @@ struct qmi_wlanfw_phy_cap_resp_msg_v01 {
 	u8 single_chip_mlo_support;
 	u8 dynamic_ddr_support_valid;
 	u8 dynamic_ddr_support;
+	u8 aux_uc_support_valid;
+	u8 aux_uc_support;
+	u8 mcss_uc_support_valid;
+	u8 mcss_uc_support;
 };
 
 #define QMI_WLANFW_IND_REGISTER_REQ_MSG_V01_MAX_LEN		54
@@ -486,6 +512,10 @@ struct qmi_wlanfw_cap_resp_msg_v01 {
 	enum qmi_wlanfw_rd_card_chain_cap_v01 rd_card_chain_cap;
 	u8 dev_mem_info_valid;
 	struct qmi_wlanfw_dev_mem_info_s_v01 dev_mem[ATH12K_QMI_WLFW_MAX_DEV_MEM_NUM_V01];
+	u8 ext_fw_bin_download_support_valid;
+	u8 ext_fw_bin_download_support;
+	u8 ext_fw_bin_download_bitmap_valid;
+	u32 ext_fw_bin_download_bitmap;
 };
 
 struct qmi_wlanfw_cap_req_msg_v01 {
@@ -641,6 +671,32 @@ static inline bool ath12k_qmi_get_event_block(struct ath12k_qmi *qmi)
 	return qmi->block_event;
 }
 
+#define QMI_WLANFW_EXT_FW_BIN_TYPE_HOST_SUPPORTED_MASK \
+	(BIT(QMI_WLANFW_EXT_FW_BIN_TYPE_M3_V01) | \
+	 BIT(QMI_WLANFW_EXT_FW_BIN_TYPE_AUX_UC_V01) | \
+	 BIT(QMI_WLANFW_EXT_FW_BIN_TYPE_MCSS_UC_V01))
+
+#define QMI_WLANFW_EXT_FW_BIN_DOWNLOAD_REQ_MSG_V01_MAX_MSG_LEN 772
+#define QMI_WLANFW_EXT_FW_BIN_DOWNLOAD_REQ_V01 0x0065
+
+struct qmi_wlanfw_ext_fw_bin_mem_info_s_v01 {
+	enum qmi_wlanfw_ext_fw_bin_type_enum_v01 type;
+	u64 addr;
+	u32 size;
+	u32 reserved1;
+	u32 reserved2;
+};
+
+struct qmi_wlanfw_ext_fw_bin_download_req_msg_v01 {
+	u32 ext_bin_mem_info_len;
+	struct qmi_wlanfw_ext_fw_bin_mem_info_s_v01
+		ext_bin_mem_info[QMI_WLANFW_MAX_NUM_EXT_FW_BIN_DOWNLOAD_V01];
+};
+
+struct qmi_wlanfw_ext_fw_bin_download_resp_msg_v01 {
+	struct qmi_response_type_v01 resp;
+};
+
 int ath12k_qmi_firmware_start(struct ath12k_base *ab,
 			      enum ath12k_qmi_firmware_mode mode);
 void ath12k_qmi_firmware_stop(struct ath12k_base *ab);

-- 
2.34.1


