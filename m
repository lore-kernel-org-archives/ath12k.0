Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA65C87FCB
	for <ath12k@archiver.kernel.org>; Mon,  4 Aug 2025 03:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jWjl2/LsT3uqPipUgEyDmGkvO/8Fme3N41mIfB3Febc=; b=2xMVaITy+8+k//
	NTLOXSBWA8F6f5QH2J/U3w3VBJsw7eJUVUjdeEeURHnPxBDvZgJkgBNLSMm8icUodqe+b+b3qmUDi
	aJq9oGG4m84yTNyHBBlfTD5bk0A7r/vAQ1SLYGHTqYNLYm3+uHzc9bV51HpmFV5gCuFkSE7mC/2Xj
	TrzBHiL7+/ByoJGO8kMcQVEjyfoaO9p3LH4KnBEph+6xMq+lsjNzYsz+/qDHW3ckFhG//iEvo8YYh
	TF5fcIP/M0EOpArY8TP4VAFISXiREu8CArGnJwC+XOi0yxqV8IlsoTZLsKocVsLqGEn9zMylXEHNE
	r1CAGcQDWwRNjymUbItA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uilU3-00000009WlX-0gXl;
	Mon, 04 Aug 2025 03:03:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uilU0-00000009WlB-2hH7
	for ath12k@lists.infradead.org;
	Mon, 04 Aug 2025 03:03:29 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573NDOO5021762
	for <ath12k@lists.infradead.org>; Mon, 4 Aug 2025 03:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jWjl2/LsT3uqPipUgEyDmG
	kvO/8Fme3N41mIfB3Febc=; b=N9SJJ5ETd4G6rz5uzn091+6lFKx7ezo/L5flPw
	cu9gX9/Rv3wmCZJp7dLAh2LFreL3Zg3l1IjIjZFUYuLY+TjgnrAipyn77LpeqJ0m
	dREznokarCkF+MCd/M31r8XblQmKBjXG8mqONk+m6gP/TcY3sGLZvTIlS8oJr50s
	8KT7NbOy41bxp80oMhO3d/OV52qPmYOzKsZqG8kaH/wqfNb+qeRrctm3Qlw18EbV
	Be2rVJy5pHvM3P1Cczkr0xmxcfpBUiq9nqT5dFjY4qqYDSWiEnJVjglP6Pq6DD6L
	HbW4lc1LQWi+KsFDd/jXC9X9VmX+0sD/+b5pKLKxFOGdItCA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489byc3746-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 04 Aug 2025 03:03:27 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b115fb801bcso5480842a12.3
        for <ath12k@lists.infradead.org>; Sun, 03 Aug 2025 20:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754276606; x=1754881406;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jWjl2/LsT3uqPipUgEyDmGkvO/8Fme3N41mIfB3Febc=;
        b=BOaxv0ruNKQ/BQrJg+OnxmscBgB7He7ps8MyB0tLOowSDepcyMBs6dnP51wWrTtdQK
         xNqPBwsz1EtrlD7Cu+p7nlqrnrGsOFXaq3dDwSfAa2fqTiGZ/9MHuQTgzOEqLyx4yLAm
         Gu4Be2c+ZxizgF33HfGY9vtlBuF3KdbfsPDM1DtiP3dZaSzNYcLrvy0q8AIQ9LrzyANI
         OwHQqMvO1ywrI3GIvgHdDfG2erY7D6XWHUEOFla7wyk/5wUQdF90iUF/G9cmAoUHTRSz
         tZI4ghdG6By0f9nMXSFM8jdnr1WRPHbisd1gG2PrvYymNOqHOBaV7OqKK6Dra6emy/8S
         Vfgw==
X-Forwarded-Encrypted: i=1; AJvYcCUzEkj30HVmilnN5XdNVNDMgqY8q6UBbwGTBBRqyncLsa9IOSgUbXWQrA6UZbwwkym99Fw5yHM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzKcMcZLLtIIrDHH+g1TkvU1MMDuO1IefnfJdhQPMeEcS0tUR3O
	tlt445efsz5M+vfKbMVb0yHOkEZSi9hvdKLsDoYaJu3c/XjGVkrKsQZXPAWVI1h5QkomK8rAKgI
	n8Qb4AfWPhB7yS/cP4BnSaWQ7AHXdB5qv1NQgURep6HCc2s7eW4ERESgbarzP5Tdl
X-Gm-Gg: ASbGncsicCccK+dhmqB3ZosAu2RFCXMOxBGb8O1fnj/oJHjMLO/I+n8KF/odQpwXeHl
	2sHglHUbFc0vQ6PVwPk0FOmtIfYZJK8td8gmuf0cAqG+sLdjTIGNfp5Ld1H0om9lGsGJMNfWM6n
	G89H/wQCohJPKI2piI2VJMcfGbprkU70tMQ6dp0M6p2UdTU0P+T8yqzt3qyc8ZxlfAemUSaeEe7
	mS7ST/vQIMNUq1xOVJ69F+bcycjoPvgk4XTG9XAbiiGQFQ1qTcgxyV89tYKEjxyqYLDl2l8UeKC
	ANaadON6rgkWIh70VzsTfL6btX8LBufRcPhFxjIBcO5iquVzaJu1TRn8+4LovZhbVifwE4PJ/Xb
	wQmwxqfwdpfvMAwmhDg==
X-Received: by 2002:a05:6a20:12ce:b0:232:7628:9968 with SMTP id adf61e73a8af0-23df8f77df9mr10374381637.1.1754276606530;
        Sun, 03 Aug 2025 20:03:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExvnKIZdOLteWnTOv2UyQtya6X6UggYZ9wc54uFCIA0Mg9TiA8q3Xq6Gvkrj+kUO2e9aNNtg==
X-Received: by 2002:a05:6a20:12ce:b0:232:7628:9968 with SMTP id adf61e73a8af0-23df8f77df9mr10374347637.1.1754276606144;
        Sun, 03 Aug 2025 20:03:26 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3207ebc0e79sm10489000a91.10.2025.08.03.20.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 20:03:25 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: fix 2 instances of Smatch
 warnings
Date: Mon, 04 Aug 2025 11:03:09 +0800
Message-Id: <20250804-ath12k-fix-smatch-warning-on-6g-vlp-v1-0-56f1e54152ab@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO4ikGgC/52NQQ6CMBREr2K69hN+CS248h7GxacWaIQWW6wYw
 t1tWLvRzSSTmby3sqC90YGdDivzOppgnE0FjwemerKdBnNLnfGcl7lEATT3yO/QmgXCSLPq4UX
 eGtuBsyA6iMMEVEvVVKItCAVLpMnr9N8tF5YAYPUys2taehNm59+7PuK+/2SKCDlUotSoWk25a
 M4uhOzxpEG5ccxS7JrI/0DzhEZZy0YiEqfiC3rbtg/rqKPQQgEAAA==
X-Change-ID: 20250716-ath12k-fix-smatch-warning-on-6g-vlp-a97cb86f3a16
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: ADxYkPHaVOQ2vo94_EqNVJh3PhOHd91H
X-Authority-Analysis: v=2.4 cv=Y6D4sgeN c=1 sm=1 tr=0 ts=689022ff cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=2XfRbQ7RPn6m6gspCJgA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: ADxYkPHaVOQ2vo94_EqNVJh3PhOHd91H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDAxNCBTYWx0ZWRfXxa0yGrpr21xk
 Bo8ntNXRFvi3ZXJdl9/j04K1CLoWxwjDd7ro6AgIBOc8jJTnNQz3sm73qFf7QamtGdq+DR39PbY
 c1e4wrpZmIHnOCvfduhNjkv9uaYDMMnvvW+ZQHQ7Phwbi/c24lCaW1wY0PV0MthPIi6Y6/H6MzP
 Chcob51eUf0f6jCuT+WCy/1TZ6WUyagfUhKRl2Qhw9soILWxnREogdbUqB5HqiJ6VNSV9283p7o
 xq53T2VdTjdcFyJ3qIlsrT3MDdpoRiNVvVzPr2N/LkSLQmp7ZmQiJILq+51KYar3jF7sILjpFEc
 04RSgSHEJb+lRZqStsAhwTaBPHEr7VANbSSTtXNy8ORInnUbnQ5vngSjW8VfeOec5OlwPtZxYIU
 hrcngLD3R28jDFA4EdICakq+rhr3kH+eNsYpz+O0AizBuImrVHRh/PlfOzxgTqFcJBCaazuM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_01,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=728 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_200328_702016_58F4CD92 
X-CRM114-Status: UNSURE (   7.85  )
X-CRM114-Notice: Please train this message.
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

Fix below two Smatch warnings:

1#
drivers/net/wireless/ath/ath12k/mac.c:10069
ath12k_mac_fill_reg_tpc_info() error: uninitialized symbol 'eirp_power'.

2#
drivers/net/wireless/ath/ath12k/mac.c:9812
ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'local_non_psd->power' 5 <= 15
drivers/net/wireless/ath/ath12k/mac.c:9812
ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'reg_non_psd->power' 5 <= 15

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
Baochen Qiang (2):
      wifi: ath12k: initialize eirp_power before use
      wifi: ath12k: fix overflow warning on num_pwr_levels

 drivers/net/wireless/ath/ath12k/mac.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)
---
base-commit: 4cedae6335644a5858e1bc2c367aedc10482b654
change-id: 20250716-ath12k-fix-smatch-warning-on-6g-vlp-a97cb86f3a16

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


