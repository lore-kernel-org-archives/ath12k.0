Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6D2C3ABDD
	for <ath12k@archiver.kernel.org>; Fri, 16 May 2025 19:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5G7ksd0wXjHCiCnsoecac/SagfBtut8BWKbVXx39nk4=; b=wCTlnzP7wzUIdvCL4EarMCtONF
	DKUcFcv45IDBkBPuxPRzQ4lcNCIwV5Y/aApvhKWH5NiPtl5ii1BYLdMAmwQTWI17SGg3Fa8UlMLC8
	7gOKD07JPHGqFVb6Te9jgbbsFS+QTe9hbJnaLiRAdIuzahWPBRiuuAtKJLRu3OvzoLydRKRlXUGL0
	j44P38vjX+USzTgjGlrnyF1Rhc7LJJrHQV99oCsthe8XZqPEmaTNDxopkFimVRmzxAjvCCJvi3MMx
	Z6H7VVKXPvppelmh/K9NsoxWdzNkyV0ljQyXIphHB4yj6n66kB0KsK9o4e/p3Thbmt5AZz80BJ7sS
	CGHEPVng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG0v5-00000004Tqw-2V5g;
	Fri, 16 May 2025 19:40:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG0v1-00000004Tnt-3TBy
	for ath12k@lists.infradead.org;
	Fri, 16 May 2025 19:40:33 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GGsSRE030457
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 19:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5G7ksd0wXjHCiCnsoecac/SagfBtut8BWKbVXx39nk4=; b=LpsgOArL4Lh2Kiok
	Pznd+NmIR5t0OhXFEhtzsRUOFmjpHtiPDE3whGT7OW4CwxUebgIqmnvDnSYtzfMY
	GbB8+jl0Chffpd81txe+KbFv1FG3bg/r1F0sxOgWJlK1ABCZ8fIU/bbtgEVAiGD4
	qh7YCqNJEVsufgpDJKUXzFi40agAo69W6ItEIjt1PYeOzn4o7PlsecHJyeT7I5md
	tWXhSlCLSOPDX+yhC02jZVhIL6BnvEWH7B2Zn0PTEbQayHgWEfX61/VM0dZ/muDe
	NsAfFfeLDAFFFBUQNXXqjXJkS0mB4JgHc8OhYhrpGr+jOEUmzlOG3sWKzdpOecfO
	3ya4dA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46p997gbr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 19:40:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22e7e097ef7so20954315ad.2
        for <ath12k@lists.infradead.org>; Fri, 16 May 2025 12:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747424430; x=1748029230;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5G7ksd0wXjHCiCnsoecac/SagfBtut8BWKbVXx39nk4=;
        b=js30YA+qtKLuRKw356R6LR6t535R+ansge8s0gCQI/R72ajQkyFHldUKHsCHMYEQ2F
         hnkaptHixF5szl7O7F2qkF2YhfSDjNSwK8e4/XRCpz34eTNdnpM382hl8kB08xEhMbE1
         O3Ho51dxqq6xbAO+KZpurv7BUo46WeuNQQ8NZulFCey3J0IodoGDBAkuNfVyPXVzdUTT
         5x2AI5RDXoMv91c7VqbVhEoqSdZZlJid4xJvMbrMOjfM1fldl/VwnDxo7DjAwMkbKFvu
         eUhAY+L+gF30pJPQFekVEyOWDKOVTwSFAi8xhZqRpXsVCVBbeEOcNPwXGzvfNhLOXTI6
         djOg==
X-Forwarded-Encrypted: i=1; AJvYcCV6q3iA99zM/RPPaBVj+fczOWvumcnpBnJx8UZAY7VcOW1ADczYCqRdtoyI5dtZezY9+m6ohF4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/gcXscfMWNAl90DHcCfELZgSpDTuMmw8Larol4mEiWgkAV23L
	3xV9o5MnseTwh3gPq7nlXc6j4jQztpk86jcQ0+FWJKEmPvgAP6xwYmh6BdkbGX0fpIhcoahh5bw
	TZ+G5WrC0LBPELkjU6A6x8dDzScsQThgNfKJjPg+e2Jl0/mAO/dw0qiyeiJqrO+Kv4eotsYTU
X-Gm-Gg: ASbGnctgX5yzaU7FjrtCc3TBUc9Q+LA/qLjageZTzlOFziWdS6KNwcT1YQS9F+cNW8P
	NbKdyuU1FbloXep+zZo0DxJdmhnG5ECJAfNCM7E+PEPZvzdO20zIpBkoxEA+Vx+SKuDf1Udt2OF
	1ncP6j04K1PP6cYbzR2Gue9S+EO/wip1IfZrw1rS4H8N41ahfD67HM0Usx7TPSDoaCDCZYAJxod
	u4Ch/OcThbmOcVQq2l2RBDWvraSh1foqQw3X2DFOhw1UY3XNpEb/jE6XttivcHLzc7/M9iroDG2
	RPgXWLnjJpffkURvN4DbP+7C3m5hAu8APAIPM2TWjOmQE1FP
X-Received: by 2002:a17:902:f54a:b0:231:b7a6:df1a with SMTP id d9443c01a7336-231de3ba25fmr45392875ad.50.1747424430249;
        Fri, 16 May 2025 12:40:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqVFV7Kgb6vfQ/FeDrtMUl3/8u4tdcjBCZnmJAEL8s50lZlgCge7RMn6WiFDEbR5w5NzOCcQ==
X-Received: by 2002:a17:902:f54a:b0:231:b7a6:df1a with SMTP id d9443c01a7336-231de3ba25fmr45392675ad.50.1747424429850;
        Fri, 16 May 2025 12:40:29 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97798sm17955255ad.147.2025.05.16.12.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 12:40:29 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250418-ath12k-6g-lp-vlp-v1-0-c869c86cad60@quicinc.com>
References: <20250418-ath12k-6g-lp-vlp-v1-0-c869c86cad60@quicinc.com>
Subject: Re: [PATCH ath-next 00/15] wifi: ath12k: add support for 6 GHz
 station for various modes : LPI, SP and VLP
Message-Id: <174742442913.3316767.4054734425093603053.b4-ty@oss.qualcomm.com>
Date: Fri, 16 May 2025 12:40:29 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=U7uSDfru c=1 sm=1 tr=0 ts=682794af cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=kn8lAQMWUTpYvoNR6e0A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE5MyBTYWx0ZWRfX+NvgalEyWWWi
 iMmPFBOs7EeVj9ZXQs3ylht0SWwQ9PLcD3uAj/QktTACQeMwfNR+9LtZlmI1GzKF6E1Fo+ulzmv
 DxJhKnIFEOiCTr88l8HccNo3MO9TZQu/z0tDVNs5YukgqParIXk3VgaJtSvCvr4p4Vsm7MyLrAw
 ulZtJCQqSAvr7ZKGuQytFoubp8ed7b8qur367Z9s79Ipxx8mGIf+PVaVp7GJ2IwoezTzQSpPGes
 9Wb314Y8mInzf4iIlYYvQCISTNzaSmpmwsvS5hiXPD4TIWCGmTW7q3lnItOZ2YYcK5y2pZXvo+y
 e11bvsinnmy0ByQUeFH/syqWEFesh0ieQxMp0lv46TaLlhS9zQhB0uo5yQDvwgfy+7X+uYp0GSd
 aWACJxGZ0A0qORCm3Kl6ScHhVDkJOCiMzWuZV2wmxIOt2nexoy/i8KXDTHPblf+PHFAaBhQb
X-Proofpoint-GUID: mlGEv7LDVxadjBe_wki1fPNdEHPDZNrq
X-Proofpoint-ORIG-GUID: mlGEv7LDVxadjBe_wki1fPNdEHPDZNrq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_124031_873374_9841EA99 
X-CRM114-Status: GOOD (  11.23  )
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


On Fri, 18 Apr 2025 10:55:33 +0800, Baochen Qiang wrote:
> Currently for 6 GHz reg rules from WMI_REG_CHAN_LIST_CC_EXT_EVENTID event,
> host chooses low power indoor type rule regardless of interface type or AP's
> power type, which is not correct. This series change to choose proper rule
> based on interface type and AP's power type.
> 
> When connecting to a 6 GHz AP, currently host sends power settings to firmware
> over WMI_PDEV_PARAM_TXPOWER_LIMIT2G/WMI_PDEV_PARAM_TXPOWER_LIMIT5G commands.
> Actually there is a new command WMI_VDEV_SET_TPC_POWER_CMDID with which host
> can send more detailed parameter than with those two. So add support for this
> interface.
> 
> [...]

Applied, thanks!

[01/15] wifi: ath12k: fix a possible dead lock caused by ab->base_lock
        commit: ef115c265a21e3c11deee7f73bd1061775a7bf20
[02/15] wifi: ath12k: refactor ath12k_reg_chan_list_event()
        commit: 9e8e55c5832d4f905d7ca306f976669d523e9ff2
[03/15] wifi: ath12k: refactor ath12k_reg_build_regd()
        commit: c96bce15c568fdb8edd29b35aeb0f20c2524108c
[04/15] wifi: ath12k: add support to select 6 GHz regulatory type
        commit: fafa6ff0823b79bfe4d1950e7bd51bb1c6dd49cf
[05/15] wifi: ath12k: move reg info handling outside
        commit: 75639b743515537b6ee56bb89c857aaf8726713a
[06/15] wifi: ath12k: store reg info for later use
        commit: eaa027a1d83f87c83f0b4138ca2427875a21b446
[07/15] wifi: ath12k: determine interface mode in _op_add_interface()
        commit: ee2fc1f7347e8393b94d35a0d2b9d24920c9b24f
[08/15] wifi: ath12k: update regulatory rules when interface added
        commit: 4c546023d71a2b175ae7dd17b42efcd5a832a1ca
[09/15] wifi: ath12k: update regulatory rules when connection established
        commit: 7ed3e88664e328bb7cda5e71568b83426b3f3289
[10/15] wifi: ath12k: save power spectral density(PSD) of regulatory rule
        commit: d6b11d0ddadb9e7addd0f582f31ae8e6c256ba9d
[11/15] wifi: ath12k: add parse of transmit power envelope element
        commit: cccbb9d0dd6ab9e3353066217e9ab5b44bd761d3
[12/15] wifi: ath12k: save max transmit power in vdev start response event from firmware
        commit: b0501a0ee772222e3a7fa5c94eb7c6b16fe20610
[13/15] wifi: ath12k: fill parameters for vdev set TPC power WMI command
        commit: aeda163bb0c7b9fc58bdd6ae90c0eef4f4050b7b
[14/15] wifi: ath12k: add handler for WMI_VDEV_SET_TPC_POWER_CMDID
        commit: 9a9e8ea7f6d31351039343e9e3b1927c61a2ccc3
[15/15] wifi: ath12k: use WMI_VDEV_SET_TPC_POWER_CMDID when EXT_TPC_REG_SUPPORT for 6 GHz
        commit: 29cb3d26d01c275ea652010cc62f324793e34a31

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


