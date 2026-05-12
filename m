Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21B7CD37BE
	for <ath12k@archiver.kernel.org>; Tue, 12 May 2026 02:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CA7nGr21+KK5XIbbIwykumIJPEvosonoVez2sxFOQ4Q=; b=C/HDyLZqYVOfxQJ5aR/zt2NJZW
	dIp5AgaE99txy0kC20WTXtNruT2gZDlT5DldMj5aKwuRVItXvxZloJoOY5ed0IXacRobEuA9KsHyr
	IEbKBaNKvbsrrSWaSH34j+/JVRNiNmi3p9VpBuzfeL1rbv+JwXkHQbKjaMazIazTvxvMCNzs9sNTh
	R8+jqqwFgSway5kztWMp1sjKUiXZwQgYgn6U9XxxI4nh+rgPB5+hJOwzRRhge3raQSbwm6DuHTZDc
	LR78lkZRWgVD14lYmUdjiIsBWO5qv4ksKTb9uZWd84gPGjAVbBe283iTxtXJefOGRmmnwFsbxkrdQ
	M3PzQ2qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMcag-0000000FEqf-0yxT;
	Tue, 12 May 2026 02:11:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMcae-0000000FEq2-1Geg
	for ath12k@lists.infradead.org;
	Tue, 12 May 2026 02:11:21 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6Tgr2202229
	for <ath12k@lists.infradead.org>; Tue, 12 May 2026 02:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CA7nGr21+KK5XIbbIwykumIJPEvosonoVez
	2sxFOQ4Q=; b=V7yG1IlnyHUE1IAEIjbNBjk5XuWRO2SiWny1+ncLdSX7gOTn1c0
	7GoQORyC9x+/m0lc+AKL6yL6QJX4w/MOruzmqKKj+1Q/zlfT21pwBHA3aLzLXIMs
	9a5c8bFOP+MJY9IZjYXGmduYqtseZ5JtHafrLaIFi+xj8Flu/nl+CXCjPdZ2RLWV
	XP5kRRDRBCED6Z/1ojDRlsHqd7JmK36irGIQDISdl9mS5x+ltHvnpRDeIPmVil2C
	8B0wCz7pvZnsNGyBvDym3urZdXr/3RPoLfpuU19ncHXUU3qpQH7u38ZPEm4AB4Dc
	pNp2IF9tQ+w4CLBfTZVS9KWkGLB+0c9CYyA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nuyh0jc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 12 May 2026 02:11:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2baedd2fd43so30069245ad.1
        for <ath12k@lists.infradead.org>; Mon, 11 May 2026 19:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778551878; x=1779156678; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CA7nGr21+KK5XIbbIwykumIJPEvosonoVez2sxFOQ4Q=;
        b=ChpERCa1nzUye7o0cf+szSkYz9ycIN/nzHIrLkk1rhXatWYl2XbmOIPOiieCeL9pqE
         YJUyMKFhXbyGgUzdujk2cdPtGqpirYPRgRawciJxE5W97flGR+dfNZZgPAxVaswpQMK7
         pRf1dqK2rd2A9XXpbPREuVldsswoC1xqYsvd9bN3VyRse17SGU8tVEi2jc884jaOk9D4
         mOJEOZK34258TxcLxdh5wk/qKFUDoegLOgJe4LlhiJynODIM3wJnFWJlN6hP2JvPV4iU
         J+CWQ70MZ90tPZSTPo+LMyU9f8gvPvunW53CQ/iw+9vsiCXkyy3mO9Dp7KDaXyrjzDdx
         MSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778551878; x=1779156678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CA7nGr21+KK5XIbbIwykumIJPEvosonoVez2sxFOQ4Q=;
        b=dfT9VkyQI0YLiFTWeLo2VX+N/2jdPDcl0DtFjD4IqSrOMGlQiY+dXhD4DJFR6dDKw5
         /kD4XmkmBa/FD02CkCUsozSTV7z3csq3pEEs2QgtN0t5Xsm/JWSuHxeNiaX5UH5U6Voz
         E1BRS00nQ+B0nA1PDPp4xEoROhNurDTcdNsiYVc4wpjEGh+WMHwbp1W0GTV4hzuT26Hl
         bkud2cgn6La8SwzVcd/06FV0dG8MROs3n5u07eoRFDNEcDrwiDoIY2BwqkfsiRNtlPzC
         h7e4HpC5E4bPpwDaJ+w2t1zB675b6zJAAz8twGMrpVEg1SHjMMeMNTNssBjpDpuTeSM8
         Faqg==
X-Gm-Message-State: AOJu0YzAPrXDBsQfWIGewvl9qukUT9ELqzLe9cu1ufb/JnP1M4f0PhWg
	KIX5sLHOyfp8AolVIYYXsYvCQZbymwznaXGvocmqRnfJVInaYxE0aA84aR8L5lF5aO7EChIflJX
	gx5kOjmspqWWxaIrhRrzqihor9kCXvRXP/NzkluArP/LLtOmgSyWeWlOKrIPJcJ9I
X-Gm-Gg: Acq92OFfcU23Pu5cBcxCgAQz24Z7tJyXDpJGFsPAx3ZTi5Anr15nn6iFw5xY0YDdHYz
	61ewrfWcbNiQILBMwdqgXWqtog7LjSIDh0AcY8V+yMJcjH8fiTOnZxa1ButiZZwZB5GNMCJh9hk
	LGnud5LUmIn/iCd9V7bcYOTI41npcmS5u/AfIY5GsZmtt+CXC1ffFUHQ33RutjHJu44tBHbPa0Y
	SQOH2E3kdDi0C2weIu9BgFZoAj1VW50QP9JojaqChjluoItFW+9dGUCPMqDFKAoteyAlU/dYHLR
	XiAjLbTM5OnV0qxQOSb5ZczwPHGnfEutEzBkDk2Nub4m6fAn+v42kElXQF1G8+RhuIJyC4w1g67
	XY8TGu42mxqOWfTEqE4B/Gcd8VfBvy8C0Z0+djWv03W11fUz5m/A1DcF6/6C3uEmJbtqO5pdaKX
	5M6iLF
X-Received: by 2002:a17:902:f78d:b0:2ba:ba5c:2524 with SMTP id d9443c01a7336-2baba5c26d4mr203478735ad.11.1778551878297;
        Mon, 11 May 2026 19:11:18 -0700 (PDT)
X-Received: by 2002:a17:902:f78d:b0:2ba:ba5c:2524 with SMTP id d9443c01a7336-2baba5c26d4mr203478355ad.11.1778551877748;
        Mon, 11 May 2026 19:11:17 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d26973sm121564825ad.12.2026.05.11.19.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 19:11:17 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-current] wifi: ath12k: fix memory leak in ath12k_wifi7_dp_rx_h_verify_tkip_mic()
Date: Tue, 12 May 2026 10:11:08 +0800
Message-Id: <20260512021108.2031651-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAxOSBTYWx0ZWRfX6cYLNFzM/Vk9
 +mhkI3RwFWrdY1LCjw/q60PaDNBkbQdNH8eMn0eGvPEsODNekWS+RsknBuq+Uui00JVO7uzcV0f
 xNjWnaSJtELIj/dMFourFTU4iSJPV/i7aHjb38uDIL1L3P9d6iKJ+J6v2f93O6gtSFeACdksJnC
 uIim4XHp5eu1ecSYOqYKy5+Cfyw4bRABGuwKk2m5hSqt6rbo1v6tx8jJKvrIN5M4vy6SjiyV+MZ
 y7ylhVMXPFMXmF8FVrN4XuevxvNb/FjYCyDub0rDZaoPQ36St0j9nv1I82Delm9jR7OKQyIHpJX
 Enb4IbbQx9OdT+PJLb0cdaXWABtfu54PIEbWuy3zu0vhAynT1nNkTrgdNnvOKrAOe2W+yEXoQyl
 D5nlHUoFJFjPVHtaBPBweCE7FfsscZ1seDHPPhSUcTnsjlkZlsWiTBYIHEjl9Ued5lGL9eiDAds
 hAXP7v4tFwIH5dgHD2Q==
X-Proofpoint-GUID: -6QGFI2AGg6gAbxZ_mNuRpMTqonT_Ds8
X-Proofpoint-ORIG-GUID: -6QGFI2AGg6gAbxZ_mNuRpMTqonT_Ds8
X-Authority-Analysis: v=2.4 cv=Y5XIdBeN c=1 sm=1 tr=0 ts=6a028c46 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=c7r0Upnc4xhSCq5Kx9sA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_191120_351765_9C7A90AE 
X-CRM114-Status: GOOD (  14.14  )
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

In ath12k_wifi7_dp_rx_h_verify_tkip_mic(), the call to
ath12k_dp_rx_check_nwifi_hdr_len_valid() may return false when the
NWIFI header length is invalid, causing the function to abort early with
-EINVAL.

When this happens, the error propagates to
ath12k_wifi7_dp_rx_h_defrag(), which clears first_frag by setting it
to NULL. As a result, the corresponding MSDU is no longer referenced
by the defragmentation path and is never freed.

This leads to a memory leak for the affected MSDU on this error path.
Proper cleanup is required to ensure the MSDU is released when header
validation fails during TKIP MIC verification.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Fixes: 9a0dddfb30f1 ("wifi: ath12k: Fix invalid data access in ath12k_dp_rx_h_undecap_nwifi")
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 945680b3ebdf..a5e290edaa89 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -1028,8 +1028,10 @@ static int ath12k_wifi7_dp_rx_h_verify_tkip_mic(struct ath12k_pdev_dp *dp_pdev,
 	skb_pull(msdu, hal_rx_desc_sz);
 
 	if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(dp, msdu,
-							     rx_info)))
+							     rx_info))) {
+		dev_kfree_skb_any(msdu);
 		return -EINVAL;
+	}
 
 	ath12k_dp_rx_h_ppdu(dp_pdev, rx_info);
 	ath12k_dp_rx_h_undecap(dp_pdev, msdu, HAL_ENCRYPT_TYPE_TKIP_MIC, true,
-- 
2.34.1


