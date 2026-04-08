Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0297EDB7D0
	for <ath12k@archiver.kernel.org>; Wed,  8 Apr 2026 01:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o5QbSAw7nIknHBwFapVmOK/Fh4hNDuSq1LL4DtnwsO8=; b=KB+/cI7ytz4pmoZ53iQ4Y82YSL
	qx0/F/SX1XFYxL3EuFBhdGJYSgZsLepGUuWw2LSuWwwpRitTABbLzw0VTCzczpCWCn+V53D67OztG
	HtamzLgfYi2p5VMYY7ioftTtM68VLKSN2Na3D2T5az5DVYbHgnvMefG1YUtW3DuYJS+UawXHuuRcn
	lLDEk93Vu1B2FOMO7dt+CLR0S5otus14a+R5YepcFU6Uh+kb4+bjLMqAD+oGuqm7/4UcaOCaM29N+
	eChs5V37Jet3K+RdHy1GZ5Oc2nlCpPy3URmnCVFuHgZSWmanppfcg1oTSjCo11p+uiwX1VPwiU1Ky
	ysGLXVQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAI53-000000086dz-29DP;
	Wed, 08 Apr 2026 01:51:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAI51-000000086cT-0AlW
	for ath12k@lists.infradead.org;
	Wed, 08 Apr 2026 01:51:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637J7AJ6263869
	for <ath12k@lists.infradead.org>; Wed, 8 Apr 2026 01:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=o5QbSAw7nIknHBwFapVmOK
	/Fh4hNDuSq1LL4DtnwsO8=; b=nuykG9vC6NuaBHj/cDAqarRqsDeR8cd1+o5LuN
	EPWjf8t/iL2VGWAWaVw+0gJKeRVFgvE3KExRF87sa3WYZPfp4s0MHjwcUZIK1/0m
	v30kjBMOegQoL7SvdB+Nh/ec4+iy9O/3joL3GfQgE7yGTSrDIiQMiCI09DxTaFMK
	XEJ+1blKTyD/AY4RAGb4Jr55hkN49Tirk/G1imCqH/7xrr/Q4xJAhlC4MqU2YEzW
	rinlz8ULcrReDR++BSgxRAgnmUKoE9hIuZnWhbOX2+05DaJfkQViUdj1ZSXqHVAz
	Oi+VMi4dnW1SqLXaLw+kMPWV7GRqOUtawI0zFQvgI5CjXODg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7t211cc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 08 Apr 2026 01:51:42 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c72849f648so26249537eec.0
        for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 18:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775613102; x=1776217902; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5QbSAw7nIknHBwFapVmOK/Fh4hNDuSq1LL4DtnwsO8=;
        b=PwuncTlpPAcb3IyfOrlOKxfAQrAYyEatZBZ04YzbFU6RXKepPoEmiiNnrE5Mwcq6fs
         YP1nVH8+ymyhrlKbMP6geRZv0cdmB135G9Dw5qTezPbpJn4nMgE1SBGbmkBVu2H+1V27
         NoN53TSJX37ZojUDhQTCrCUgoQj1iLlVn51PsZ5fpnW0/nFl0XLiM58N1kSJSgtfhfgV
         X0/tnHfz3/hACzUnQJe6uGDYTL7VMvlfaK/cSDQbMA03PXptzg9CuOI3u2w41MG+eGpM
         QxejGWO9By8fp6YJgdua5mCNf0wc44qUCX78bcYdnykjklu9ZTjwQH6cPbmyhlFwVLJ6
         4YVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775613102; x=1776217902;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o5QbSAw7nIknHBwFapVmOK/Fh4hNDuSq1LL4DtnwsO8=;
        b=Z6lK+7z/6Fm1bq9Mh2O2b36g5yutsziYQGa/pKVjzDcwmyASg6vAxpbn5Y625k50la
         lymPM2JTPrC50UaWYgUXv7jQlnU9cXmm42ajJshgIttdhpIQXhb8Dk1VYTsEAL45UtZk
         7a1x56cQnRQFPVBuZXA8TEZ9pv/AAhMQQf3s/5b4MXnITUGwB/vXiSlBYQOfGuwwV6ul
         UdnTSfuQ64Qki0v7hpN3UfW60ROSR5uzx52+wIVf5POEmE4rWd1QaI0GZ8S3fW6V6HfQ
         gN3u5N8EAo6Gafj4xCFObl5Ej6NMD/mgYJWwCPiYwzS2Vm/xX4fxhlENmYq7WC5mw2JJ
         lqoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoAwoZ26kvS90FeWw+AiHXi5krGUedeQutNMacA8MOund6hu9ipBOPen5TPMHIj7u3KZxpq2k=@lists.infradead.org
X-Gm-Message-State: AOJu0YzrVsvMg4N1qp122Lyw9IklgL+tVInrUUAo8EET6FhtWou1t3mv
	MZ9ysQsOM75xrc0s29xax5pEwBL6xKxxN4HZcPJ963KYa1voQ8/0nDEtjwtvuD76GflCizSdfFm
	aurS3TQQBuy3F4kR7493E64TYNQX9RfdYHE12/iQOQ7rq/zi6U7XT09N3QDYb/o+P
X-Gm-Gg: AeBDiesK5T5gy2rEawsqHAPytlYiHKBqXRZT+wJ+gYIBwOga9fNkne3PdYPCeaG3RHa
	IPJfk0izwP8ZtQyJWrHbeEtNLyBAYi7jSiJDJmUK7QBWazlPaV3oEJm3OOfGj0TMg247gBLNfjn
	0hTeYMnkZR13MkIs0zYkiytYUTIa+mA/w3ialZaLmxUQWO+UXI5PQmM6WWrfTnjAWF8P+buNuK0
	SRtQNDne+k513OcPuMUdQJUUDid6ortOhj0+u0DdofpA58s3etwKdsomkCeVgYvn8CogsHxROgZ
	ucJIpm2z1DpZDaPf5QPct6HtQUkD8DIcT3kCJEhtx3qPN48T8/x+VKUjkpN4vfd/3WJRwko8e4U
	plhwMO6lCWE2Ey4CRMgQXu16JzI3b92UmhbUcNdkmPL5qtjKB3EVLV0Gr6w==
X-Received: by 2002:a05:7301:1688:b0:2c6:cdb3:bd5e with SMTP id 5a478bee46e88-2cbfc365473mr10151492eec.28.1775613101797;
        Tue, 07 Apr 2026 18:51:41 -0700 (PDT)
X-Received: by 2002:a05:7301:1688:b0:2c6:cdb3:bd5e with SMTP id 5a478bee46e88-2cbfc365473mr10151474eec.28.1775613101281;
        Tue, 07 Apr 2026 18:51:41 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d2cb4a7cdbsm2749615eec.19.2026.04.07.18.51.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 18:51:40 -0700 (PDT)
Message-ID: <5af2dde5-a1d2-4c72-bbed-f0a2ef4b9788@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 18:51:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20260407
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=De0nbPtW c=1 sm=1 tr=0 ts=69d5b4ae cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=6cTdqrwTxAmorz-Q3qcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDAxNSBTYWx0ZWRfX7BpJpp+1A9v3
 Y1pKO96X1tVpG1Yk4Gonwo3Z5S0GVgKnqLk1u8SzKfyrOd4T1lm4XVv5XpRiUoVAnWi6HH7CSH2
 C5bT6U6BL22zXcSxOY1PscE2LYGHnZEGMt9gsputqy+a7QBtOZoIgbdc5IZYOGzceZqQ9sc8L32
 3ezreF6u1hq4xnX5xDUvKDDP71YhYmWYvPByWgnqcDTZgAzicg4RGnOotCUc5iSycEbOdYOKzPq
 o84KtirkaVU/CLPhKoo1Ds41Z2Olbm2jTjXw6Y9nOU0/eBBpnThRShBA/siDdNNWeHcTE23t504
 0RdSrNs9BCMPti3Hl0JUH0tGEJ0AecKA1aais8wqhH+uAkZS6w4FgeH+cBzfqYasuL8Q7THDOwQ
 qZirOAM5X9/166NIdtKD50RXDuPQ0F069nyYXbJI9RDc67QbEZaqQu9kjhWT3vj92HYz/ZEDaW2
 oy8m2JW3DAVHDu2hNPQ==
X-Proofpoint-ORIG-GUID: q0up0AQ8NFPVuFCx1hz-3rB59ovW9X8L
X-Proofpoint-GUID: q0up0AQ8NFPVuFCx1hz-3rB59ovW9X8L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_01,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_185143_108017_34A30989 
X-CRM114-Status: UNSURE (   9.90  )
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

The following changes since commit aa5e9884a2d63aa20fc3396d369382c1ecd16109:

  Merge tag 'rtw-next-2026-04-02' of https://github.com/pkshih/rtw into wireless-next (2026-04-07 16:20:55 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260407

for you to fetch changes up to 8fb66931fe31094aa2e1b2a5c015050b8b4cb2ec:

  wifi: ath12k: Enable IPQ5424 WiFi device support (2026-04-07 17:28:22 -0700)

----------------------------------------------------------------
ath.git patches for v7.1 (PR #3)

Add ath12k support for IPQ5424.

And of course there is the usual set of cleanups and bug fixes touching
the ath10k and ath12k drivers.

----------------------------------------------------------------
Avula Sri Charan (1):
      wifi: ath12k: Skip adding inactive partner vdev info

Baochen Qiang (1):
      wifi: ath10k: fix station lookup failure during disconnect

Harish Rachakonda (1):
      wifi: ath12k: Support channel change stats

Raj Kumar Bhagat (2):
      dt-bindings: net: wireless: add ath12k wifi device IPQ5424
      wifi: ath12k: add ath12k_hw_version_map entry for IPQ5424

Roopni Devanathan (2):
      wifi: ath12k: Rename hw_link_id to radio_idx in ath12k_ah_to_ar()
      wifi: ath12k: Create symlink for each radio in a wiphy

Saravanakumar Duraisamy (3):
      wifi: ath12k: Add ath12k_hw_params for IPQ5424
      wifi: ath12k: add ath12k_hw_regs for IPQ5424
      wifi: ath12k: Add CE remap hardware parameters for IPQ5424

Sowmiya Sree Elavalagan (1):
      wifi: ath12k: Enable IPQ5424 WiFi device support

 .../bindings/net/wireless/qcom,ipq5332-wifi.yaml   |  1 +
 drivers/net/wireless/ath/ath10k/wmi-tlv.c          | 26 +++---
 drivers/net/wireless/ath/ath12k/ahb.c              | 36 ++++----
 drivers/net/wireless/ath/ath12k/ahb.h              |  1 +
 drivers/net/wireless/ath/ath12k/ce.h               | 13 ++-
 drivers/net/wireless/ath/ath12k/core.c             |  4 +-
 drivers/net/wireless/ath/ath12k/core.h             | 13 +--
 drivers/net/wireless/ath/ath12k/debugfs.c          | 29 +++++--
 .../net/wireless/ath/ath12k/debugfs_htt_stats.c    | 72 ++++++++++++++++
 .../net/wireless/ath/ath12k/debugfs_htt_stats.h    | 26 ++++++
 drivers/net/wireless/ath/ath12k/mac.c              |  4 +-
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |  8 ++
 drivers/net/wireless/ath/ath12k/wifi7/hal.c        |  7 ++
 drivers/net/wireless/ath/ath12k/wifi7/hal.h        |  3 +
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    | 88 ++++++++++++++++++++
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 97 +++++++++++++++++++++-
 17 files changed, 383 insertions(+), 46 deletions(-)

