Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D76C83F1B
	for <ath12k@archiver.kernel.org>; Fri, 11 Jul 2025 17:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C+XjgGLjtznAuIEJDzg76KN65IBzwTNlS/qHyQ/AlO4=; b=EvZYDJgNlffub5GpbFcDPle8xy
	FOnQgNxxVoOmPxmsfFDfiU/6Beebb10Jb23K8Wn56JZM7nmdnBqhagrvUeHVK06z1pHUcByuElAzW
	lHbSKZDPdmGUuUts0MycGI0WV9zdvL3hf3v84yPp1tkJ9haqc3g8vCe7EoWtTc50QwNFgO0H+1nmF
	8W+gStRRTJW4K/WuJOhiCtVlV4OOjWE1JTttbw97Z2iMVbREfzQY5Ef+QYGr3iUSQ4KB2ZvnSTN1M
	quWo2CORVPXx8hADmtLqp/0pw2pQuYOJRjjnx4/fM7N90C0rhlqXQbaWjZtM+g8Umdr39DmnqefKO
	q64iM4Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaHHb-0000000FN00-06FC;
	Fri, 11 Jul 2025 17:11:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGhh-0000000FIjK-2UMb
	for ath12k@lists.infradead.org;
	Fri, 11 Jul 2025 16:34:31 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BB1GKN005656
	for <ath12k@lists.infradead.org>; Fri, 11 Jul 2025 16:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C+XjgGLjtznAuIEJDzg76KN65IBzwTNlS/qHyQ/AlO4=; b=EedEff1zYv4QKour
	pSEpl/hZBatMlvJgCgWStqiQWNhCs+7V/FeKEffo1zAD0pHSk5gGl0KUnoqbn7IY
	0Fq8yzgL3ULZxESGSMy4mH7RJ3V+bEEjuvB1Z62RG6R94HF4zTcPzZtWUYiNVdxq
	YWNR62F4YsZRRg3NIIWxnlQ+P4C6K+5RcYoY5KwX+4t8jiYBxeU6BqkaCKwOO8Jc
	AiNUxAbpGTagogY6KSMjov47igN8pG5Ccb+gmcmPJpGxri232Cn39kyfPcCBIhQn
	VQH8y+Q5yzY5Nm9f2BmexLCtog8en9K1dkq5zxh9CmDpzklGxL7yDK5KTKcpsn82
	g/Vtdg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47u1c58w8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Jul 2025 16:34:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23494a515e3so19406145ad.2
        for <ath12k@lists.infradead.org>; Fri, 11 Jul 2025 09:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752251666; x=1752856466;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+XjgGLjtznAuIEJDzg76KN65IBzwTNlS/qHyQ/AlO4=;
        b=hmDMtOKQUfpa22KyaROO/MX76mKk/wL/AlSQJPiKcISQ1mT0vVxWCGhpb/qFPUPWDJ
         +Z5uTUQoD0fOcAHWo1wmY7hE0oymXMIoYtPvhr84ptVCVEp9UjWG2LXjPyt+J7d8g6NV
         1GOqvfNbCt38dbJ8ub/fFnttNckuBX7avEzGbVQlBt2g2U18baaH+i205Qpnx7ujDZtm
         AIyoFosAZYy9Dinx8No3gd0m4FRPvdx/YnRevjpBhtdSvXUJ6eSm4JCy/uT2WurK7YXh
         loiR0/6XhEFG22FjSdjRQbO6jSmi5VTRiin5QYsOjd8xtLbtcbTXaoNsXVJMZck9zjEx
         Q2Tg==
X-Gm-Message-State: AOJu0Yy4R/FYMtpLkHS49YOdFAyFlTvXZ3DtqlLNoPzu279wAkqITlpZ
	MldtphxoUw+OyADsz8CAjCCOWRVY1tTzo/f53Ip85p4SLlKDrbsq+JQBf9Q8nmU7MTJNzKldmHL
	tOVyPzcF2mDx3d2i+cAEm1Vag5KSCpWmYehhF7neVT+5UROhAR8+4JEzVkURRJHjtLotZNVOs
X-Gm-Gg: ASbGncvFLl93VSETQIpavFnOkytl1yM+c7ywiRZWHz4xP5Ev4QtzhvZVbbZ+nOYNpyl
	aZiw0p1/G8t1ghvi5fpGQ6ik3kzV2mZ+Tqy/CR7phdhLGIOdpG9IxRNderTjbVlzV0tPtSc4zsw
	/Ept+Lnc0weTyj1+18lEfcDfziYnchdCt46st6WzhK8pjovniBIrvIoXs6F8slRel/JmvHtzMHT
	WKybv72/FYbdBU7D95jQO8azJntcJyCDKqTBqzk25Fewk/RnaP4h6cXbIkRJfPe3GmiEhWENyc4
	P0WZcB4bRKsLELdLfqA12rh9VP6J0efLxE8QXcFegSG1CiUrXhmrIfUMsuyRtMZ3aXNPY0asNmk
	H
X-Received: by 2002:a17:903:2f4c:b0:234:914b:3841 with SMTP id d9443c01a7336-23df093c81amr46007445ad.39.1752251666526;
        Fri, 11 Jul 2025 09:34:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFw2ZXlbPb/Wju5bIdxO/0mRpv+Egm80WbCzIegT6wJBUILlrd70XbCDTSCcFG2/i/JASC4rw==
X-Received: by 2002:a17:903:2f4c:b0:234:914b:3841 with SMTP id d9443c01a7336-23df093c81amr46006915ad.39.1752251666002;
        Fri, 11 Jul 2025 09:34:26 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4333b2esm48526975ad.156.2025.07.11.09.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 09:34:25 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Cc: linux-wireless@vger.kernel.org,
        Sivashankari Madhavan <quic_sivamadh@quicinc.com>
In-Reply-To: <20250709133554.622463-1-quic_ssreeela@quicinc.com>
References: <20250709133554.622463-1-quic_ssreeela@quicinc.com>
Subject: Re: [PATCH ath-next v3] wifi: ath12k: support average ack rssi in
 station dump
Message-Id: <175225166504.4015349.7644408748902551706.b4-ty@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 09:34:25 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 7WwPz2f3m-bohli3iBFtp8lzXaeceZql
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDEyMCBTYWx0ZWRfX9FZ+S1oUszZb
 mJSRo1U3Z4CkuLlvmoOUaJj42RO9w+kwear2BoeawnIHBL6VOamuXpU+okWg01o9vmz+qNpCvSS
 O3q9qpX6mXF2BEicPU01IVSewwDATNA3wNt/khJheND7Tsw4OHNl6Hboza5FVAo0XbMB/xSe+l6
 zebGQFIzJo/AAJ0jagCtYeIaL9UIPPpR8LOQRBKLZfqVfuQfnHuX+J+RxOPJ+y5BtL+H3wJLIY4
 o0ZzbrI2HIGJpJ3AhoW4SNqHuvtRrmMngOu8xR5Y7AkHN95llvuKQ1oltQgcJAweL02q7YDFsT1
 fZwgx8ea8cTEVJ1h43TKRoLxp7RI2UiI/RzKhPE3ynjcWpIUXFcE+UElvcFWH7G7tgGxt4Ow8dF
 d2CJlqggh9xoRiq4TQxwmF0KG2h5zC0aAkzXKUbdM9+O+Dk2oQvYi7dIFWppd3ZRX/orJfzE
X-Proofpoint-GUID: 7WwPz2f3m-bohli3iBFtp8lzXaeceZql
X-Authority-Analysis: v=2.4 cv=N9MpF39B c=1 sm=1 tr=0 ts=68713d13 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=qfKbl12Lvci_ajeHDSQA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 mlxlogscore=796 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_093429_760943_6EB52511 
X-CRM114-Status: UNSURE (   8.61  )
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


On Wed, 09 Jul 2025 19:05:54 +0530, Sowmiya Sree Elavalagan wrote:
> Currently, the ACK RSSI value is not shown in station dump. Enable WMI
> resource flag for ACK RSSI in WMI INIT command to add ACK RSSI value in
> management TX completion event from WMI. Update ACK RSSI value obtained
> in management and data frame completion path to ieee80211_tx_info. Also
> advertise NL80211_EXT_FEATURE_ACK_SIGNAL_SUPPORT flag during hardware
> register to mac80211 layer so that ACK RSSI is added to station dump
> message.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: support average ack rssi in station dump
      commit: 979c5ce4a37680063d87fe13d662ed68e06e77c3

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


