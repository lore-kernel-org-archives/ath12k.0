Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA046CCD1AB
	for <ath12k@archiver.kernel.org>; Wed, 22 Oct 2025 03:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6thBAmnnjed2vzk21aNxPfUfDu3hf6KvEZV+JLpHOZM=; b=WfVH8IvKRO4cVzJqvizIo/BUS5
	s6//m28hveCFtu00gMicusCojJSCqnLhRB/sFTv+9oqP8kIeFclL5IVNoqCGyehSiLsr8ChI+PcjN
	rf4911dVmpOSiL6rSX/KkjLJIiXe0p5isgAqBkUGhUq1PAPWag7oH/uHkvx6ioIHrDP2rZfk83rFz
	uct/wjekVg/O4wrwgOobIFSIC4mPkT5VYxhbyXz0MJokPwMSl4jeosl26PGIXJWmLA8/OSM4BpwN9
	1eEmq6dEDAdbTh9fPhrEaM5UWKPrTZmkUOky813rCnMS/p6jjNL9tw2E3m2YVVFeGducZ6xeDZX66
	E3GQHTmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBPt8-00000001NK2-1zNN;
	Wed, 22 Oct 2025 03:51:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBPt5-00000001NJZ-3QO8
	for ath12k@lists.infradead.org;
	Wed, 22 Oct 2025 03:51:49 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M1hVx8020418
	for <ath12k@lists.infradead.org>; Wed, 22 Oct 2025 03:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6thBAmnnjed2vzk21aNxPfUfDu3hf6KvEZV+JLpHOZM=; b=DVFKczZ++8XRKTBw
	OmDJhbCRMxc1u4qfqSo+Cg+u4+L4nvG371VH0P0rG/KgdBicTQHIWserLvWW1ilI
	GWInlNywlOxpDH1zEh4OKNrueSgKWkAG4MS6HEdIuJynH/sUAENhB5bVEA1kf+yF
	2qokwxIVV4HCRuv5dfvlsRXf4orpYY9KETGPhZfv9mTbZC1MZ1NqNrYxLsylMaRI
	NopvFJRoGszPEdyWGXu7q4ArawL5d9s9jV0N7j9lB69K4Xf8+KKTdc0ZDiCGUKwk
	wvZcsKQPz/mIwnttwcQwP8jNgixDuPox0y3SzicCgPm+MUYDXOVzCneRer5yOX+u
	Fq7/Xg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v34433vk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 22 Oct 2025 03:51:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2930e2e8e7fso729905ad.2
        for <ath12k@lists.infradead.org>; Tue, 21 Oct 2025 20:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761105106; x=1761709906;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6thBAmnnjed2vzk21aNxPfUfDu3hf6KvEZV+JLpHOZM=;
        b=Nj0cuoxrXzw8tgMAn8FXXHnUHcjdCCEdRHyXEs9qmCVMmn2F8UCngqqQ92k5zIUz72
         sOkJGcgcfuOgJPPXBtPMOzbEY70+U1ZRLU7PWv+VW2OTLMaf39ZSVljDlZoHtFHpWIen
         qrsnB90vfxEP+xg4bkhazEurDVOIyalwgswB2qDijxUdsdGB5JCPA5E6iKta3UT2DQE9
         Hbso5WD4Woc2ilC1HO3ywiRMETzSqqiZacqtmHJ2MGy63UavtkpRtRP1zuYFXK1Z+e20
         45Hu4ggxigQHpqXdKLKIKllnZ80FxbYzobNymeWOlm3ERj/UDVT+IjDOoUzaz8tYZIsr
         tBWg==
X-Gm-Message-State: AOJu0YzipqtNNIAIChAkgEb6TKB5mt4pOlheK/7uY/yj/dXNBiTDytk4
	D1K0uxkzIFkUc1GG7JoIy6/9egNWtQ5yeiowx3JH98ejp4qmuB42K1hz3Wv8HvNIPJgWs5eWCuJ
	go6U4qU1I4WVnpi+ga5xZJKNuTktCy3Qy/A97CuWqA5zjDJj5j9R/Dpz8N0XoSkkH
X-Gm-Gg: ASbGncusrzlA1IYIPLAfEb66jVk4Py8lg7acRvR5gN/wsk3KlevkhVgy0h9IXmJWuCv
	7gE6jHMpg5GK5bxEBiAWrh8Dt3Sd2cVE4CZZyLZP94YBiB6VyBcffC9NZOKDY/4fDCyxTMR+Tc4
	2h6aJQ968hflI6KFG0KSmgrRQffh/7Ku3ihAFuea4oM5O07/cH0opUjcT75Z1+tp/eQTR879ESC
	gvB0ordRXXucheQlhgGmO/UMPFWJTpmA9tNd4D2Ae6fMexhgbR4cQxYTXXSFMLobNnZdJgLBZR2
	2UtNdqS6M3txAgFj+Kvw0c2p0mnRr62iMBcfPJHGcihj3FctDeISfCesFWCIlIB178Jjsw3K+Fk
	Ymni2Z+ChSbvC8wkYnfzB0DxLDoEae//NCPLW5WSq/RqnnLLK/g==
X-Received: by 2002:a17:903:b90:b0:276:d3e:6844 with SMTP id d9443c01a7336-290ca1218cbmr208678015ad.33.1761105106499;
        Tue, 21 Oct 2025 20:51:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEh4seaOU3W1mfIG9lcURG5JRf7c9LzjOewpWD1MWdJ8Yyv2IjYcmg9Y/6PxAvNwjps7MHorw==
X-Received: by 2002:a17:903:b90:b0:276:d3e:6844 with SMTP id d9443c01a7336-290ca1218cbmr208677785ad.33.1761105106060;
        Tue, 21 Oct 2025 20:51:46 -0700 (PDT)
Received: from [192.168.225.142] ([157.48.122.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246fd5d76sm125506975ad.39.2025.10.21.20.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 20:51:45 -0700 (PDT)
Message-ID: <6cad33a6-6f01-966d-a0b9-60818be0b56a@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 09:21:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 ath-next] wifi: ath12k: add support for BSS color
 change
Content-Language: en-US
To: Wei Zhang <wei.zhang@oss.qualcomm.com>, jeff.johnson@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20251017060100.1751692-1-wei.zhang@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20251017060100.1751692-1-wei.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EZL6k71iNoCyRLBD-u_rlxER_aefd4NH
X-Proofpoint-ORIG-GUID: EZL6k71iNoCyRLBD-u_rlxER_aefd4NH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX6Rp5wvbzzsoi
 yZ8qHMF4rvFWoIf3WRinMg5tOtGX4QADUQ6pl7Pj3atve5YE7RPOlpJ+alAcCd+UmpwTHaEIlqa
 hZz14N/jiYCanj4acOBthUsCPKqx3wL+CXw8eBdMo1zV2MKIn0EXZOEGIwmPw74KAkPT/Snqc8s
 8KtFjGW73y3q6G1LZGwJ4tx2PLPo/xwMx45n7ONC/jxBuItljNZSaJtVB5XUE58+s2vdBaXVCaD
 z13geEIsdGnQSZxoWHLKIN2640AQCD/mrYa+bLzH7sbS1yn/7qIVX/kpqYJxfOXiixme6uroB6r
 jmAgKstw4CpGYUQvEMxq7bAVi9TpWSy64u1clDXEFhTdF+KYFnkrKp8en7zTdDrLah2T2Bf6EAX
 AbKSgDLHoZRJz1B+r48E0/5Y6d5ZkQ==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f854d3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=MVWiM3nRykcdLg9H6cDE8w==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=wj1T3HU5gSB1aoFxu4UA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_205147_895276_31B5840B 
X-CRM114-Status: GOOD (  15.66  )
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



On 10/17/2025 11:31 AM, Wei Zhang wrote:
> Add support for handling BSS color collision events reported by firmware.
> 
> There are two scenarios where a BSS color collision may be detected:
> 1. The AP's MAC detects the collision directly, and firmware reports a
>     BSS color collision event to the host.
> 2. A STA associated with the AP detects the collision. The notification
>     frame from the peer is routed directly to the AP firmware, which handles
>     it and sends the BSS color collision event to the host.
> 
> Add logic to parse and handle such events, and pass the data
> up to mac80211.
> 
> Unlike CSA, firmware does not provide an offload mechanism for BSS color
> change. Instead, the color change process is triggered via beacon offload
> TX completion events sent by firmware.
> 
> BSS color feature is enabled depending on service flag advertised by
> firmware, based on which color change functionality is invoked.
> 
> This change builds upon the following ath11k patch.
> commit 886433a98425 ("ath11k: add support for BSS color change")
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00011-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> 
> Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

