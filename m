Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667BA606A32D
	for <ath12k@archiver.kernel.org>; Fri,  6 Nov 2026 04:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ToPmFHJ/;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MIALHroj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i70/yL/G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PwuKHcELMyLPFxVIV5lVQjxMlleCNVcLIZcMUwaPOrQ=; b=ToPmFHJ/8ioLGa
	OF+qRlfgsIYIPj5GHdTuKkL9lHt/A1+glcdwUW+sNG73vKhpRvQknsy9NzsKDjITNw93+FFTA+CnQ
	EwAVt3wRie01T2laU2IHViETuusyYeG78sBqWm6h1e18QNRNfUCHmAw5BRJQjIK3o87wRLGWYMKDb
	EhZmN2hqn7GHt6orda/e9QDr7/gXHBSA1uT7Dlli1QwEmuNTFAhSX7t9vVEuqJIUXHTtRQ/7JmLn8
	IHCvitSGNcLEs6EnK0gIJ271SQ9s/u/bD3HE1RaIy7wloKqWexj96mxqoh5oDQUTJKMJvu/Hvt4BZ
	+RQ0vJUJpv/feKH5gfWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPC23-0000000BElq-2QwO;
	Fri, 06 Nov 2026 04:58:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPC21-0000000BEkV-0aJJ
	for ath12k@lists.infradead.org;
	Fri, 06 Nov 2026 04:58:30 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6406Qb2817533
	for <ath12k@lists.infradead.org>; Fri, 6 Nov 2026 04:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PwuKHcELMyLPFxVIV5lVQjxMlleCNVcLIZcMUwaPOrQ=; b=MIALHroj1yfpVm2p
	HLE4hw9VpKzgRzXleimNdjgiWSV+JAVH0WZQhO6DfLn/z275/dvHZ+v8/SlQ70kG
	H81uTJnb00sYF2jMPd4UIYY0duBH5McYvoARzJZPczVKsqnQw1PH2Ke9OQDjuQrx
	Hn1SczV2hboQLnB9bk3qbALsb4CtDEFMg0DUT40vqFaVejCvE8Tz8/Mr++19/7zB
	/X9S2omUaitRcWgW96Ecf/WNKfTKBV1Nr5kUR4bCAu7wS8alEpOrffrXrNL/0ToQ
	gRnDP+Supuk1KJ4m9taSTUB+hteFXvYtmi6dbKeEOC6dCTpDA50CW4AqnOLsj+Jn
	heMqlA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa0xca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 06 Nov 2026 04:58:27 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36cec75d8caso374763eec.0
        for <ath12k@lists.infradead.org>; Thu, 05 Nov 2026 20:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793941107; x=1794545907; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PwuKHcELMyLPFxVIV5lVQjxMlleCNVcLIZcMUwaPOrQ=;
        b=i70/yL/GDnw0gPeAAy8sxufhSKy/ep4Sa1MhKevgFGMHS3Xh4ldUy9gjyPIpsruamf
         4fOwYC+QHXXEVuNeVUtJ8INSDpquEnqxMzbV1/m1yk9d7Zodl4wvGwtdk55iTRwcZJql
         zC0wlmnZ/75tAmKi7Xxj+gs3E+7n6rlIPbWw4ahSpGstgwPqsoz4vB+U3JGHuPXJPQ12
         tnzDvh+bFcPwAKbKed3a3+6jUWdakqla8c1IjxKnQcnUF9HCUNo0picwzm0CrfXmzTEv
         dre/vV09T0obUweeVID+P9ks3Kv/q+6lA26sxpv9zmZJhbiks78N6fwPkOa5Zgh3B7zk
         MmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793941107; x=1794545907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PwuKHcELMyLPFxVIV5lVQjxMlleCNVcLIZcMUwaPOrQ=;
        b=l/Zki8NWwXD0O116nq5xXqZgJwFo84x0uGCC4rGoiGAibXDNYEEssxTF3OTgLrPZmZ
         zI5AF1dpqKHAVt0AXlJfLOpmxldUgned02px3fBSFgLGYOb4vsKcafJiFVtqwIBzP9dA
         GD6l6TOvIRJFp6pF2U0AYILFiuQmxfGbKPr2IJOMsSgx/lLOrhkEM6bwKs8Pydu8KoaX
         iLixQNkIK/GBzcPzhnTs6xf8fYASqQVyHqytF8fGAF7LhVLWtr278GIW6wnnv39L5u3z
         9Hb4sPhCme7nzhrYNCJvC5n6YZEwo3mm4mZConLfIa9/q1HMVZZHH1kbIoyjaKe26fK7
         wkiA==
X-Forwarded-Encrypted: i=1; AL+hErE+zQL9z+ukbvx9Frj7qUtCpfIGkx46ISNXgIBE8NXqLH5nNM3JnFhQp3da0uHpWSN48y34Zhk=@lists.infradead.org
X-Gm-Message-State: APuU4Z/e9i3QnML2TnKiB3NfYSuOvoyEDosksCCHs44VlL9sFwr7Ua94
	TwlAL3Ofh8O0xgKcTrimOQheqyaCMhoA4BgZO3VszXKrTgx/vE7reomNqDoDgSdwrvZj3MyL+W2
	v/P+usfuqh/vO63n2hL484nNngtN3A/Y8Nyc2f07uPR5cHg96/7yIWqfOD+UQhPMX
X-Gm-Gg: AYBFou1maUmXtSWqu29Xh1DSwO1NIl3KCF3emx0ZuuhEe/TBMBMsPpanh5avEgtQPaD
	E+Q9/AHmMzvb1IuRJbjtFCLeHAaHoWDUZlWpcbD7TvhpGMDA30NpX7S7o+Cs7+s6HciuKKlT3M1
	VpOFYL32t/3EhuGFiXjdxrxtENJDBkmGpXJvwk1y1h4/AWBaZtRxAK0PFNa07Risa9FDQ4LhZi0
	4OxtBZwiRUS57sSqzB9FctwvVi3+SrFR8x9SiEKmRXtYksNUAUM1pGSCEBM9Qgw/Ac33euLWRJz
	EfSQFVMOg4NxMZ48avZB6CwLw6G2B8v6YRknxxsg+k/mk464ESszGcdSxhLtlWRs5q6uq94wUbT
	QQhUcdyhsKsy+qP6/1NJkgCV07wYaizWvxc+cV1tHJBLV8YoTxgk7RU/dePcyLp2nxkq/tr10j/
	kdkIGUkGsmiovLdqhw56xLHfrwIW+Noj8auMcYRSQB9v5onYLRv6n5DS3KJIH95hCwcvPrthMER
	ezB
X-Received: by 2002:a05:7300:b08a:b0:361:2a55:b94e with SMTP id 5a478bee46e88-36de695a231mr6085927eec.15.1793941106925;
        Thu, 05 Nov 2026 20:58:26 -0800 (PST)
X-Received: by 2002:a05:7300:b08a:b0:361:2a55:b94e with SMTP id 5a478bee46e88-36de695a231mr6085899eec.15.1793941106330;
        Thu, 05 Nov 2026 20:58:26 -0800 (PST)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm3021327eec.6.2026.11.05.20.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:58:26 -0800 (PST)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 10:27:42 +0530
Subject: [PATCH ath-next 1/2] wifi: ath12k: Fix HE BA mode configuration
 for AP mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-eht-ba-window-v1-1-622f2272e582@oss.qualcomm.com>
References: <20261106-eht-ba-window-v1-0-622f2272e582@oss.qualcomm.com>
In-Reply-To: <20261106-eht-ba-window-v1-0-622f2272e582@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793941100; l=2602;
 i=rameshkumar.sundaram@oss.qualcomm.com; s=20250120;
 h=from:subject:message-id; bh=mzoN3FdmoGcO25gjrPXpkBIbUBZJgWlfeD0OPgwSV6E=;
 b=B0OhH5oOIE9//pxYTDq/iUODgDS/RgAERSa4Lx8c9ck6ET9j+co5xKI2HqlsgbqhXvE4T3gdC
 qxcuzozRKVnCb3UuzV4ZrDeXC2LAvDznU6MImrNyVFGVnCY3cWYlGOR
X-Developer-Key: i=rameshkumar.sundaram@oss.qualcomm.com; a=ed25519;
 pk=CbWiiM4JikGBEWI7HtrEEE/Hwkk7TTcob0SwaFdAwKo=
X-Proofpoint-GUID: 1icawIE-aORnhpC4gyt1cIm1w7nVO9PS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAxOSBTYWx0ZWRfX8aBiSO5D4F77
 pfOhZtOZiAFSuhPKwtwzJTy/qx501aWYqz5EkwsEjccH63hzp4LflIAyXI5nIvRub01sKzHF9cE
 OKw0lpEsMisI0eERCq+aCn/0pbZZ1h0=
X-Authority-Analysis: v=2.4 cv=e7WT2qp/ c=1 sm=1 tr=0 ts=6aed5e73 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Egx7SfdSpjdNf9FE4GoA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAxOSBTYWx0ZWRfXyrkE1miEOH9V
 AEYZrdROuPodXqbg1fc5WCz1NpbwJ9kR2cEsKaB+S+JBtPp3HfTDx1Spj1nOzdNFbKdcsF7mrQn
 9jGYlB0Jg3g2bMjmB5gkXzWuixiNiSFvJI80892BSvWIa4yJKw5oa6l6avnTIFgBEDeBQzaKV8M
 //fTaRzpshqg9D8HLUq+AlfihnFRV9prXRDLVBEHnu2RiOniKH+VLbgdyD/7RiTkRymhcjW8QEk
 pGSacjBE2E5uejTPejpY7wHBY1vht/nH9xtUN95gjOj82bfPsbP2CrB8Jz2ig9tqe+tLW2/K0Rc
 YF9/U1FvMXXpFT2u2pwwP4BMvdd1bdn9iw1i47KNQRT9qSjgGxM2g7Z40RMgfoQS4ZBllOR38Z0
 x5RRcM3YDICiOlaVnxmaAyK+GafpOb9jXok0T+Tt1vlq6ztKxCYIk70m+V2ggrORlbITy2PzUh2
 L4OJRyTXeskigPEONvA==
X-Proofpoint-ORIG-GUID: 1icawIE-aORnhpC4gyt1cIm1w7nVO9PS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_205829_302043_676F968F 
X-CRM114-Status: GOOD (  14.84  )
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

WMI_VDEV_PARAM_BA_MODE is currently configured inside the he_oper.params
check. However, mac80211 does not populate he_oper.params for AP mode,
causing the BA mode configuration to be skipped for HE AP operation.

Move the BA mode configuration outside the he_oper.params check so that
it is applied whenever HE support is enabled.
Without this change, firmware defaults to a BA buffer size of 64
(legacy mode) for HE associations.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4f16c78b52a8..711acb32a6ca 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4888,8 +4888,7 @@ static void ath12k_mac_bss_info_changed(struct ath12k *ar,
 		}
 		ath12k_control_beaconing(arvif, info);
 
-		if (arvif->is_up && info->he_support &&
-		    info->he_oper.params) {
+		if (arvif->is_up && info->he_support) {
 			/* TODO: Extend to support 1024 BA Bitmap size */
 			ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
 							    WMI_VDEV_PARAM_BA_MODE,
@@ -4899,17 +4898,21 @@ static void ath12k_mac_bss_info_changed(struct ath12k *ar,
 					    "failed to set BA BUFFER SIZE 256 for vdev: %d\n",
 					    arvif->vdev_id);
 
-			param_id = WMI_VDEV_PARAM_HEOPS_0_31;
-			param_value = info->he_oper.params;
-			ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
-							    param_id, param_value);
-			ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
-				   "he oper param: %x set for VDEV: %d\n",
-				   param_value, arvif->vdev_id);
+			if (info->he_oper.params) {
+				param_id = WMI_VDEV_PARAM_HEOPS_0_31;
+				param_value = info->he_oper.params;
 
-			if (ret)
-				ath12k_warn(ar->ab, "Failed to set he oper params %x for VDEV %d: %i\n",
-					    param_value, arvif->vdev_id, ret);
+				ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
+								    param_id,
+								    param_value);
+				ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
+					   "he oper param: %x set for VDEV: %d\n",
+					   param_value, arvif->vdev_id);
+
+				if (ret)
+					ath12k_warn(ar->ab, "Failed to set he oper params %x for VDEV %d: %i\n",
+						    param_value, arvif->vdev_id, ret);
+			}
 		}
 	}
 

-- 
2.34.1


