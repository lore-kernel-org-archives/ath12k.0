Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5315EC369B2
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 04:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3EKP6uAXQ9ad1MBBIQlu3ccbBQuP26LuQ6x9C0Rj48=; b=VUaw26QnV/tS/tn8LMcMIve9fZ
	2omnnG8EcIRkKKqW19H/UhEQF66VgWDE9btvWzDo1a/4or8Lnep9DmoEhEC/Q1plFL1Bnh7PRwn6S
	YcKLvZ/6CbSmtLI8p6Zaj07fKpvPkCatMMOYNjOhAoEIom9lYMy1ElgttSzuGMlkzMiObWMN10P4r
	+B/Vf8po3AxKEax0v2TfV9Bolx3gZhO09y/x/qRyIGt9gGRh7bWUryBZvoieUvVOAz+UF2fcI19Eq
	dzPN7wfqH768qBoi6rv4krYgjcz1d2AIMRcLlzOIi5KJe7R95kOHd+oE9nmTx4Gld31jkHkuKQeWj
	JB5E+ooQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5HC2-0000000Bi0j-0JBP;
	Thu, 17 Apr 2025 04:49:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5HBz-0000000Bi0M-46pa
	for ath12k@lists.infradead.org;
	Thu, 17 Apr 2025 04:49:41 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GL5kEr030729
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 04:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/3EKP6uAXQ9ad1MBBIQlu3ccbBQuP26LuQ6x9C0Rj48=; b=XhUsGYpjHQdAJFrU
	axDHr9VLgvYMyFmWbh746IEWGcYx/3Zc/T3j1QzhnNluaqo34dvKU8ZAyiPkoVc0
	dRH4+i/fzZ0I0kJdsT9WpdFlFc//VlcTGgseRbCFTdZxOZN2oVeqxCNHICumj796
	dgrKPZufnwkTH3VKUEt3upydKYkHbNjltZvmuADKqnw2jDUqnN5COufM2EFnSyVL
	bKM2EPAxrWO/EnPuXYnbi3P5msGDr+7HGuzE02fr3VFGNYPVM/1UZXRkXzYdtjO+
	g2wALuJv6r6wbM2vZUOMq3BCzZ7XMHPGVojV33QPMVP2iIdhaV6SGHXUV1+fKfA6
	QQb40g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk5j59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 04:49:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-736cd36189bso447254b3a.2
        for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 21:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744865378; x=1745470178;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/3EKP6uAXQ9ad1MBBIQlu3ccbBQuP26LuQ6x9C0Rj48=;
        b=cgCiimhp2lz/FeDtCX/UtR7LHIqx/heAhryEJFLX4FLeLNizJR6GZDdaRR2sFbpK/Z
         DquEQcYZ8Rw+wnOX4Mes8QBLI3uToa5I2dUw+I/rAgUgIPwPlRENe9YCd3HIyxAS+jVR
         96VSPb/KSujiEoSfXfMPylG1z47lGU9Li8ZkiZTK+EcA7xk//f2x6yaH923vUlh0srro
         xljvH8BrfKhGxdDB5q4WTBOneuMrZOjqjVDQN7gxMASke+seMijk9E7PAf5ckLIf7kF8
         fOnSgXMzvPBNVj/4Vhzpl869oyK0HLfyAylcO9UwXLegWi+ZIUeCYZ/O3w7PYVrB1FSK
         58cA==
X-Forwarded-Encrypted: i=1; AJvYcCX5PDhEFswM+QLRjXGSGZcyQbNXYpKSe8+w8ss0BV4JpFFtHHp//jVQQRsaLRg6o1LIoqf4rZs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxgdWHYDIR4O3k1mOZfqoVfHV0b3TtTQxge1P9wWeUYy40QB31g
	0Kknfapa1jBAPtHulSRoRyd7s4qakjKf2j5Y7VZDPMhaaWLWzO3luiyHSPEx6Tqsl/JZCqURLTK
	k6PGjPQ97uQpq9VvKi9hX/4CBT6ksqOQtBIArKg+EYLZhQurSk20tcWsd49IG
X-Gm-Gg: ASbGncsDyCQnA7j0L4q0Y6zlc89ldFLMs6iRX2HAU0yxXO5aQzn3j672PIoTerLGCUg
	ZjcWTKXTVCeFvrk2VHZYOilE0/IXveiMsSsjKR0LLJOjY7c98rHPHIBPlZqnZy15ufPuV41/ReF
	ovHEcgxhwiFLcjA1Fb3Ov8nSs+/sLeITTBpE92m1ztmZ83g62DbBCjaHid1Fdr/kI5PznJWgM2G
	iFPkEakAiapyx8OmI9B59LJwcCCxfgFoeVIFaygd9N/GnGdfxDspbSEfLwg7lB57l+be2dMr90/
	u3H+JY974Jhs2IGM9Ahzd7O9BJ/cLCrkimIHVDEt6lSgxl4lVNLc0A==
X-Received: by 2002:a05:6a00:851:b0:736:34a2:8a18 with SMTP id d2e1a72fcca58-73c267fb35bmr7123606b3a.24.1744865378464;
        Wed, 16 Apr 2025 21:49:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMC9zn4r4+rmAcpaTVyf+mUWEy2vO6ypTp2fj9ynJIxEOdODtpj3XMuwCjby3H7vbRzs637g==
X-Received: by 2002:a05:6a00:851:b0:736:34a2:8a18 with SMTP id d2e1a72fcca58-73c267fb35bmr7123580b3a.24.1744865378019;
        Wed, 16 Apr 2025 21:49:38 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230e578sm11728852b3a.144.2025.04.16.21.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 21:49:37 -0700 (PDT)
Message-ID: <043ce38b-f472-7e39-bbdf-d676f5622936@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 10:19:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Prevent sending WMI commands to
 firmware during firmware crash
Content-Language: en-US
To: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250416020414.2161545-1-maharaja.kennadyrajan@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250416020414.2161545-1-maharaja.kennadyrajan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=68008863 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=diN9YrPEvmRJHg0F7aYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: K7QVN4Ci-flwyFvh9QLzE0uk4o6WPJ9C
X-Proofpoint-ORIG-GUID: K7QVN4Ci-flwyFvh9QLzE0uk4o6WPJ9C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=923 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_214940_027888_4BF37506 
X-CRM114-Status: GOOD (  10.06  )
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



On 4/16/2025 7:34 AM, Maharaja Kennadyrajan wrote:
> Currently, we encounter the following kernel call trace when a firmware
> crash occurs. This happens because the host sends WMI commands to the
> firmware while it is in recovery, causing the commands to fail and
> resulting in the kernel call trace.
> 
> Set the ATH12K_FLAG_CRASH_FLUSH and ATH12K_FLAG_RECOVERY flags when the
> host driver receives the firmware crash notification from MHI. This
> prevents sending WMI commands to the firmware during recovery.
> 
> Call Trace:
>   <TASK>
>   dump_stack_lvl+0x75/0xc0
>   register_lock_class+0x6be/0x7a0
>   ? __lock_acquire+0x644/0x19a0
>   __lock_acquire+0x95/0x19a0
>   lock_acquire+0x265/0x310
>   ? ath12k_ce_send+0xa2/0x210 [ath12k]
>   ? find_held_lock+0x34/0xa0
>   ? ath12k_ce_send+0x56/0x210 [ath12k]
>   _raw_spin_lock_bh+0x33/0x70
>   ? ath12k_ce_send+0xa2/0x210 [ath12k]
>   ath12k_ce_send+0xa2/0x210 [ath12k]
>   ath12k_htc_send+0x178/0x390 [ath12k]
>   ath12k_wmi_cmd_send_nowait+0x76/0xa0 [ath12k]
>   ath12k_wmi_cmd_send+0x62/0x190 [ath12k]
>   ath12k_wmi_pdev_bss_chan_info_request+0x62/0xc0 [ath1
>   ath12k_mac_op_get_survey+0x2be/0x310 [ath12k]
>   ieee80211_dump_survey+0x99/0x240 [mac80211]
>   nl80211_dump_survey+0xe7/0x470 [cfg80211]
>   ? kmalloc_reserve+0x59/0xf0
>   genl_dumpit+0x24/0x70
>   netlink_dump+0x177/0x360
>   __netlink_dump_start+0x206/0x280
>   genl_family_rcv_msg_dumpit.isra.22+0x8a/0xe0
>   ? genl_family_rcv_msg_attrs_parse.isra.23+0xe0/0xe0
>   ? genl_op_lock.part.12+0x10/0x10
>   ? genl_dumpit+0x70/0x70
>   genl_rcv_msg+0x1d0/0x290
>   ? nl80211_del_station+0x330/0x330 [cfg80211]
>   ? genl_get_cmd_both+0x50/0x50
>   netlink_rcv_skb+0x4f/0x100
>   genl_rcv+0x1f/0x30
>   netlink_unicast+0x1b6/0x260
>   netlink_sendmsg+0x31a/0x450
>   __sock_sendmsg+0xa8/0xb0
>   ____sys_sendmsg+0x1e4/0x260
>   ___sys_sendmsg+0x89/0xe0
>   ? local_clock_noinstr+0xb/0xc0
>   ? rcu_is_watching+0xd/0x40
>   ? kfree+0x1de/0x370
>   ? __sys_sendmsg+0x7a/0xc0
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Fixes: a9b46dd2e483 ("wifi: ath12k: Add firmware coredump collection support")
> Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

