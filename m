Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50188C5B572
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 05:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AlMDsZo027hPD5J6UrX20XHsPiN+M3YMWIVFfgN9J8s=; b=oyS3hb50EuVhgPgRYJCna+FnAF
	BRZnaZPy2Y3x2TzRYDgjblexkD8N1QcX8hcgqTss9RtDSdoqdQdozFMkgewi89fzQwJ/U+33E9QAZ
	1mIuyXMFXqTWUFO6WhFCSVdZqo+uiDA3aQPIcQR3VZev4VmXbNsEo3FoHzoZypP+ZRLOeTypaZu7Y
	ktLgn/h3MJPdRcWGP2iEJUMO+ZwJP6P9MXjuF9UX5RLAPsV+UrvLpkRz5YE5WtLFP79bMxsXzXZ0T
	u/ms2hQgM6n+Hr1KHTcQVBuRKC5iOYe+6FIUGz0NlRfYju5kxNxVuKlhLJT+aGXXjXauRewnUCBhh
	3VaULuTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwYv9-00000009121-2NAb;
	Wed, 19 Aug 2026 05:33:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwYv5-0000000911K-4AP7
	for ath12k@lists.infradead.org;
	Wed, 19 Aug 2026 05:33:01 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J5HvlU2554943
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 05:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AlMDsZo027h
	PD5J6UrX20XHsPiN+M3YMWIVFfgN9J8s=; b=W8gBrbN3k4rNQ2Wufe9wsrZj2au
	wntoORNi+bk1DQqRJN0ydwvFDICrDnjJdIH8Qgr+qtPxd105YFcQlk0D6NB2+uaI
	l9Zzu2h6uxG4sg/lb7pithjxIGXz1P2r4LA6wd89HRoSPrPXEo9/WFvHq/us196n
	26a97qi6uBPDjm2vwCW/Kch8sZXMY+ZdbdA7x3obPvr1la63ulqp1A+ztmIlJbvf
	jgp+78kLRXI3lpSrJZW+S3WMeH7lcpgSTzENASnuRJ8KZLJyXQgkpihpPF6JMejO
	eK69uJDgepAdPxO0qmJFFBBTLTh019cYUU1WJ8b7QXjFQ5vrz5IdCnbmv4A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm1g7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 05:32:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so1501670a91.2
        for <ath12k@lists.infradead.org>; Tue, 18 Aug 2026 22:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787117578; x=1787722378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AlMDsZo027hPD5J6UrX20XHsPiN+M3YMWIVFfgN9J8s=;
        b=PaL+70b745MOFvTVr2wPjcYTDRUQpC9EY0yXOLKV2crQ0hGEOi4E21IIjwRzXKpq+4
         o/CtFOYrXOEyFhUHGwGXJfcuxT9VfzzDrFJVinM/cddqLDnIB+Jpvg4JZ2XnDxhsc/qB
         lL46oV+n9nNqvYMlfuZgk/KAbBTbGBJWnZzqSVVjGQEQnfFPpYeninCs2/SxzApIQ9R+
         0UqxD3ug9JtFq/8UPjGlS2jYpU0WkXtB2rICWIOG7G6jWFcY6g1gwAK4Ec8kzyE2DgSG
         ualiGpwsXhCfnTwSXUaBm/B/5WuACq1rPTPkdAqoWrlQRODc5fdo1sF029UpxlkmbPgS
         pCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117578; x=1787722378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AlMDsZo027hPD5J6UrX20XHsPiN+M3YMWIVFfgN9J8s=;
        b=Es6zhME5ka1h78NvM61vyKDKmDIwelVUEOa254ZR3IyrMf30n69eTCnVgxDYoJD+Lw
         wz5zcont87HCdxd7fGx2tMotrptbzKn4ZfQQrCoNmrFIKGuCgvlLhtojzF9aEJ3VCTYp
         QzrRuAR+q5N3B4OYBm9gGnn/U4AodRxdaSAnKpe/EyEe4AYH4zAmJxpvu4evmmEMas+k
         unYEH44r8TAPke96XUXamBpq1198NTDyWDJHkyfPRDEsekBOliG02qJ+8Gf5L+lKbKnN
         bmTBM7LCWLIHo3rJ07HFVS8+0VXrDuVIcpq5rHU7eu7YlJZ2Ln2Ltit7uYdJA/eD3PAP
         ADqw==
X-Gm-Message-State: AOJu0YxaG8PYoRP1GEZy1DC83h3Lxrw+Lx8+RUDYneE50F8dvtfBZIWu
	nHY7MWtFdiG0rMOpSMZDG7nwcz+THblD0MdF7YjlvZjCMrlfEPwJrNV/MInNlVqX4n3ylAGv66y
	aoec6UoZJoPuZ1owT9Fvw4zzE/zY0rBgz2q5S/sHeNsOwA+Q3PTeH0SgIoAeT4PTod2liGTsO
X-Gm-Gg: AR+sD10lanMR9VKVysqGgD/1DPRRVjiG1K7XL8iF0+/cYQlMPFKXK+duSHkHBZA6LDt
	GzvFvL3NC2PBGYE5sq9EEp8i1Y8BN0187Zjg/p+cwlV897+MlajYrK4KCp7vDkvg92WWxX/KNYh
	6HzOHkSMKlZEblZq7N4JoiB3koS3eCAJHCLRg6hWVp3qjCyuejGj1YuUsy6/SrUf2AFMmO0dyIk
	lCwomNWBsFGICFwnUlH+fKzW0jxkHv9n1kBZkrMaMzxzzi+4y1MJXdCjW1cM1YDjjWewvzERtEJ
	bNsUOk/7rrzc1/Z9iDd7mHasGbzUFB94U37DS1Si123RbKbZyfhKsKkwE0OpDbakQoMVf7+1HRq
	ESf9pMjK0z/pOhwsEgWNN0+u6ZPuf92WweU+wjuN1dJCgNH4ZN81e
X-Received: by 2002:a17:90b:2d8d:b0:392:e5b1:d833 with SMTP id 98e67ed59e1d1-39581252d0fmr4072216a91.13.1787117578026;
        Tue, 18 Aug 2026 22:32:58 -0700 (PDT)
X-Received: by 2002:a17:90b:2d8d:b0:392:e5b1:d833 with SMTP id 98e67ed59e1d1-39581252d0fmr4072138a91.13.1787117577514;
        Tue, 18 Aug 2026 22:32:57 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f4c9918sm404261a91.0.2026.08.18.22.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:32:57 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v4 1/8] wifi: ath12k: fix out-of-bounds access on TX stats arrays
Date: Wed, 19 Aug 2026 11:02:40 +0530
Message-Id: <20260819053247.1420393-2-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819053247.1420393-1-pardeep.kaur@oss.qualcomm.com>
References: <20260819053247.1420393-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dYvJaEwQvTMUvn8oKQ8UV5pR7anQI3Tt
X-Authority-Analysis: v=2.4 cv=bth8wkai c=1 sm=1 tr=0 ts=6a85400a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=l51fLghi-aCFcmm4dtIA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: dYvJaEwQvTMUvn8oKQ8UV5pR7anQI3Tt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDAzOSBTYWx0ZWRfX5qFgmyrjYVq2
 DopY6abGXmo+CgW4DOk2pHEji7ld+/QlRHDnJOihRrgDzW9mC+3JVm/Z4HooPZDAC4VpCCRSiOQ
 TjAX5HH+OG4gKhVpfrJ34/NzwdUFPsWrgwV1v8KB3wGO027pXfh8ipvyt8sJA46IFciHdotjs6q
 vrgcbwLQW5eu/Jdb0pEvBERPADELAgD6e0x2B9+BEBFA9hDAdkY9htb75A3MwSgLNiFWdnpk/yc
 trC7OZiIV4HHc0ywqPQEE0Yu9Zg/IYbLbmgq3MDh7cPhjm8NV3fmcsqYxLxXtqf8JZcxjws2JS6
 ExR40127gLTxzfbUb1Dxw3Y4DI5XN57ioWuc9EjzS/ThbPafxR7YTmO93FkzA2etNsnw3AA6oVB
 UOeiz2j7jQGbnAo0t75Y+lpUR/Z+HvC0xo54wr5BUlLsDfp2UlTm+BsHxjOTtqbJ6lp0s/QHTwE
 R4B38/q5BgWv0SBkfVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDAzOSBTYWx0ZWRfX5Cf2VR0l9Fns
 82ZT9uNs1t9zpKubWldAOSEAG8ekNbH4/tmOZqSLjEUvpx8MA7mCeSGWGH588Bg8ia+8Vn27Tc6
 GG7LgJ9rr04AphasbCAhHhsFGCxnDtw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_223300_045406_E3E5D29F 
X-CRM114-Status: GOOD (  13.50  )
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

From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>

The fw_tx_status[], tx_wbm_rel_source[], and tqm_rel_reason[] arrays
are indexed directly by values read from hardware without bounds checks.
Values at or beyond MAX_FW_TX_STATUS, HAL_WBM_REL_SRC_MODULE_MAX, or
MAX_TQM_RELEASE_REASON respectively would write past the end of the
arrays causing memory corruption.

Add likely() bounds checks before incrementing each counter. For
tx_wbm_rel_source[] and tqm_rel_reason[], add WARN_ON_ONCE() on the
out-of-bounds else branch. For fw_tx_status[], no WARN_ON_ONCE is added
since the switch statement that follows already calls ath12k_warn() in
its default: branch for unknown values, avoiding a double-warn.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Fixes: c5c62287e690 ("wifi: ath12k: Add device dp stats support")
Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
index 587d58eeccfa..3d635cac8f8c 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
@@ -582,7 +582,8 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_dp *dp, void *desc,
 
 	wbm_status = le32_get_bits(status_desc->info0,
 				   HTT_TX_WBM_COMP_INFO0_STATUS);
-	dp->device_stats.fw_tx_status[wbm_status]++;
+	if (likely(wbm_status < MAX_FW_TX_STATUS))
+		dp->device_stats.fw_tx_status[wbm_status]++;
 
 	switch (wbm_status) {
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_OK:
@@ -984,11 +985,17 @@ void ath12k_wifi7_dp_tx_completion_handler(struct ath12k_dp *dp, int ring_id)
 		/* Find the HAL_WBM_RELEASE_INFO0_REL_SRC_MODULE value */
 		buf_rel_source = le32_get_bits(tx_status->info0,
 					       HAL_WBM_RELEASE_INFO0_REL_SRC_MODULE);
-		dp->device_stats.tx_wbm_rel_source[buf_rel_source]++;
+		if (likely(buf_rel_source < HAL_WBM_REL_SRC_MODULE_MAX))
+			dp->device_stats.tx_wbm_rel_source[buf_rel_source]++;
+		else
+			WARN_ON_ONCE(1);
 
 		rel_status = le32_get_bits(tx_status->info0,
 					   HAL_WBM_COMPL_TX_INFO0_TQM_RELEASE_REASON);
-		dp->device_stats.tqm_rel_reason[rel_status]++;
+		if (likely(rel_status < MAX_TQM_RELEASE_REASON))
+			dp->device_stats.tqm_rel_reason[rel_status]++;
+		else
+			WARN_ON_ONCE(1);
 
 		/* Release descriptor as soon as extracting necessary info
 		 * to reduce contention
base-commit: e07447e65447
--
2.34.1


