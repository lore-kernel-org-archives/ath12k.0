Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0238D68BC9
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 02:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NwrnbmbFkzlCKk2+xSj24BctUGgqYF7I+RkbqstW9fs=; b=OGMkVqBbYH0bDgV1w8tpyEAGrK
	knGB4OWzWzpBHPwqiZBxbAESrAziLddTN562mFcCUmw6Z1rZ3Fy3npv3hUomi76rb8sLHBzKVn/k+
	gMFIDKLubZz5ffBnEpi5tpRia1nNbhptjfw8BM4cnWsVFhKCDDKCZpFpp9/r1fQDbeZJ5QSYjFTnJ
	MdVC6YgbotA2sboYEdXZ/6OXjIkew+iwr8vzRMHawYfCDWFJjLYHrb0mWXz0cMzmrH3/R8zQP3onx
	Q/8fSpvRNNDWWQA0Adcl26tAASjNqn/Kcr7rTS9Z3fCrsbnKY8FLTyeafco2DwrcGgm9DY4MhMkwb
	9PRkFvOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3Jz-00000007gwY-27y0;
	Thu, 18 Dec 2025 02:00:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3Jy-00000007gw4-10DT
	for ath12k@bombadil.infradead.org;
	Thu, 18 Dec 2025 02:00:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=NwrnbmbFkzlCKk2+xSj24BctUGgqYF7I+RkbqstW9fs=; b=S+iB5CYWxN7UNRGFUa2vbt+FXN
	Qz16BdY06o5UeDwsYI+fNvzDcvF0V43GnDRQH+AtVcGDnHyjbcKO9+HvcR1OHVp5M2KFMYvC89XLA
	wnlMo1ZiQU1BS46XvVMl1BBaFguQG/6aYi2IoyjrhzmrpV2VfH0oDG7JqcWiCRjm9ICvhb++kO66U
	klrRSJVy6ijzrQazcLCaVZ5dG7fhIL2bila0Y9JnoUsO1l023XZi4ORZ3dz9xuH4LT8RRz86nVMiY
	YhsjHe3R6xdkWAjqv3Y/hA3VSXQ6tCv9QGGA9pJafEVUe5OkPdVtT1eb4+YDu9dj9O+8ZA4iHUfAD
	EUsL9b5A==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW2Nd-00000007srd-1QUC
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 01:05:14 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1Yjsc3717126
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NwrnbmbFkzlCKk2+xSj24BctUGgqYF7I+RkbqstW9fs=; b=iqPPGtOQq+4sCXxx
	aFeHAhJJb1GMp7PFlpumXTK8iTy0gV32MgwXIVk10qk5v9tSX3JS55be1Lg9ecD1
	nQWaRtk39jaIr/aXLGCnSzhbLnKoC4UoiQCujRCo4XLW5nXhWTfPHAmJwIqUJ3+J
	0XKRi4HbWB80zcaWP2AGOneSAxxeAR56OxjIlMnre4SYEE6nxCDtc+PsO0lxpWuT
	g2t1j/yyEJFfsxXuJB7cwGvty/xQlrVXq2iTo9slxR2jRs7TeDFiegLZlgiTTPLm
	EoZI0zxewb5gMBEZeOgikQn+pNs8/dkzyUSFAQiGbn33VEMUxaXPlFSr8hzv9Z67
	Lmywlw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40n79aus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a13be531b2so2884525ad.2
        for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 17:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766022936; x=1766627736; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NwrnbmbFkzlCKk2+xSj24BctUGgqYF7I+RkbqstW9fs=;
        b=j1dPfmiT73ttjV0dJRvzDjxYwlNApR8JYRzC2YyWzKoybgaEW7WwI5IAYMhvJ+GURG
         tzoyDKALSJWbx6+CKojWV6HbMxu3wV0H96Nz1a1Y8KiybeaWEj3MBhfsXrSFo5hxRsDi
         +7D15GDuxtNmOno8oOzaq2a4+ydcaUjHDJcVaSb5Hibwvzsr4zEo7koa/qT0bhGXDAgY
         yJ99v7d5GePZV6XghGmTADcZS5ERxtesHTqiEARiKFgrTzPUXG5vN//qknoUDjS1L4Zr
         jhlFCGVtZmy1RVqcNTUafCHdgwitKE19pJ8LiBSD/o7d1xLC2v2/BS+kXHCOFzlyYTSX
         vhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766022936; x=1766627736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NwrnbmbFkzlCKk2+xSj24BctUGgqYF7I+RkbqstW9fs=;
        b=FT/ZdnsPZd8TZZwx2T1BsGQhjmIJEGj4z9WuD+t+2gJ+T6m4CVIswvbsNgUNTTZsDD
         2uonz/9u+NmHP/SUhN7o54vkL+lx4chnC8JMf9T5ilbBHCQjx69AxiE8gdSg8ZFlYY/r
         YeDQZRgePuj5ftAzyxQX71T7Xl/fhJLGxYw0+PCsyqF35Qgwut8ohs9tS24ZaGS69hut
         VxOIRtajf/V/1cEWAOXXtTOrq05HjkxTnNynEbEEvDX9RdRi4ZOMIHmlAVeO/+PSli9H
         YtJCPjHWQlQsJJZXEvKwCWdVYzRnBM+Js4TajJWU6QekReXwIOHKp8+vpKgvCxOZsB9v
         n2OA==
X-Forwarded-Encrypted: i=1; AJvYcCV9jsssnehvHkJGisOEReQYS4jcaySeT0UFyjOEutb51kbr4JY4gmUOAOMqmJ1oxHy7tIksMAU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwTTWGAvhsSaFvekCZzSTCy76uxT7HGa5S+gVlshnqbf1k+y8a/
	lTbUEj9ANHwj4YiRqUv74unBmygQaDhNn82MLr4uEbQtj+UvHInYIaOLYA4ld2QfrqP2DiYjY2R
	3yF61YQmXVqdJmAFEVSoWvqgfFGHbVF+uu9VpPkMPt1nUnFO/BMXyTsGjebl0EoTZ3Ojwne2Nfr
	s=
X-Gm-Gg: AY/fxX4a3RZNG1ZvY8ug/Bn95C1Jtc3pQ7THffvapAsb6iV0qaLw4S6DTCRp3IvbmM4
	WJjwiVj0O7MJNbxb3ybASZcM6GEmujQxQzP+fv/oBDzFidM+O8mKjGTKyt7oLR6lNzaT2jXxnoG
	/r/tFVbucrsHv+qRPG0+fT3852qO4QF4lObRNlytK2/Ag6We6Seb6I68dabijOGBY4s0xd8Hj/p
	JAKCYOJhlVprtcvWXo0Ex7sEndx3b7flo9D17oD5ynuBVLd8ZgRzN30lr5vClejEH8lOiivjTUj
	Kp4M0vHvQqIb3oAdeNdqcaLvdBJ4Dy0Qio52sOFcNvX5TgTzmyQEpqItwEsGLaIX294sL+awGCG
	qIEpeG9QlxUIiwWndBUsxoo0Txx/YkIcd0Xjj9zX3+d+xVgoAGL7TN7soruqa2v8=
X-Received: by 2002:a17:902:ce11:b0:2a0:c5b6:67de with SMTP id d9443c01a7336-2a0c5b66910mr153902915ad.52.1766022936493;
        Wed, 17 Dec 2025 17:55:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZfB6asy+mZsK98bGd3uS8a/hwJZbG5t4GAwPAXMiLItCxW5RZ6jXEeSDgzGvGUrjN4rUaRw==
X-Received: by 2002:a17:902:ce11:b0:2a0:c5b6:67de with SMTP id d9443c01a7336-2a0c5b66910mr153902715ad.52.1766022936046;
        Wed, 17 Dec 2025 17:55:36 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d087c812sm6548175ad.15.2025.12.17.17.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 17:55:35 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 09:54:30 +0800
Subject: [PATCH ath-next 16/19] wifi: ath12k: limit number of channels per
 WMI command
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-ath12k-support-qcc2072-v1-16-87928cf8e547@oss.qualcomm.com>
References: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
In-Reply-To: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: fRMbAibd2gsqLRWAKv2GkoLI2FhkbprN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAxMyBTYWx0ZWRfXybvey8UYt5bF
 eq6bLeniwTPI/LPSVvSunVS8DiGCHm9+5Qful48veFnrYjHxK2GJr2Awz4rtrli7ATbt/pclV6Q
 Y60tgfd8TeeGroZi5rKaGLYFWpDFcyvtvZC/jBM4cEthxc5gLxn3/OQC+QubLAOnJIuNXQYmXvW
 SEGZYkZC3Pb35RuwZef90qTT1V3UGbBKy6U0OLVhwTcD6AFStKRmRXGdQxEiSULG8z6mn3fLp4b
 H5BVxSEeotWJQAorJUi2eMhSrcJK0bFoKWrYao62LJflgipa1nNB/iE4d6ykOX17mxBvCyMGPQ6
 6x8Bs5+YV5twf50iDSRJcz8h37fY37CozKHLOgpGo/XLRrRyGTiTrB4+aZcGSkWvtn7BeDWjM/B
 9ASNKTIpKPLinFzOufknV+OsmmOaZQ==
X-Authority-Analysis: v=2.4 cv=TZebdBQh c=1 sm=1 tr=0 ts=69435f19 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3KhbVLdr_5p6mxRQPsQA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: fRMbAibd2gsqLRWAKv2GkoLI2FhkbprN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_010249_856165_B2331D04 
X-CRM114-Status: GOOD (  14.26  )
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

Currently the number of channels can be sent in a single WMI command is
calculated based on the maximum message length of the target, this results
in WMI exchange hang for QCC2072 as its firmware can not support those
many channels in a single command.

Add a limit to avoid this issue.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0-01560-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 3 ++-
 drivers/net/wireless/ath/ath12k/wmi.h | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index ef7690f829ca..ed2374c4aac0 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -2806,7 +2806,8 @@ int ath12k_wmi_send_scan_chan_list_cmd(struct ath12k *ar,
 		max_chan_limit = (wmi->wmi_ab->max_msg_len[ar->pdev_idx] - len) /
 			sizeof(*chan_info);
 
-		num_send_chans = min(arg->nallchans, max_chan_limit);
+		num_send_chans = min3(arg->nallchans, max_chan_limit,
+				      ATH12K_WMI_MAX_NUM_CHAN_PER_CMD);
 
 		arg->nallchans -= num_send_chans;
 		len += sizeof(*chan_info) * num_send_chans;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 65f0d7ed4178..daee2787cdfd 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -6322,6 +6322,9 @@ struct ath12k_wmi_rssi_dbm_conv_info_arg {
 	s8 min_nf_dbm;
 };
 
+/* each WMI cmd can hold 58 channel entries at most */
+#define ATH12K_WMI_MAX_NUM_CHAN_PER_CMD	58
+
 int ath12k_wmi_cmd_send(struct ath12k_wmi_pdev *wmi, struct sk_buff *skb,
 			u32 cmd_id);
 struct sk_buff *ath12k_wmi_alloc_skb(struct ath12k_wmi_base *wmi_sc, u32 len);

-- 
2.25.1


