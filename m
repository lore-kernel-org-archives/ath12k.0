Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE35C02182
	for <ath12k@archiver.kernel.org>; Thu, 23 Jan 2025 19:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+HU6Upczjepad3IS1y8A7tsL3itPbaZJ/4EX4oO7RY=; b=LUsLZXgvIu5jF6ntf0gwEgUK9j
	5/7zHKS6pGpYYBkjBPkoDiYGP4ADHO6Cf/XVZteAzl8ToHFz4se/iqw3UEaYNr5cjdi7C/PGUVG4n
	FAij9aordTeLZeQ+6eVny2i+xn5f22jFdYTAeG/4WSXBNFeKG79woU1ZanH7jENC7FsWIg9M0b6P4
	93AFU485zjA4E4LJbfly+JcrVrZkpAH1zSbVpDuCpQc4TMiWcVIczJsB3FHAu3cPP18qiCXDBwyzB
	e5wcF1sveSGk5qwQj+QrhdX2riKOuejG4NZxKYnYbWzBlS9k/ZXC6qfJ2mOzfXk5TxaE5FNSV4fYG
	qiu4yADw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb2vi-0000000D8Sy-1jE2
	for ath12k@archiver.kernel.org;
	Thu, 23 Jan 2025 19:31:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb2vg-0000000D8SU-0Csr
	for ath12k@lists.infradead.org;
	Thu, 23 Jan 2025 19:31:53 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NA8U4i013056
	for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 19:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R+HU6Upczjepad3IS1y8A7tsL3itPbaZJ/4EX4oO7RY=; b=M7rvJR3Bkpmdp5eD
	xJTm13LeIQ4gCuAc5Hl1wVJEbIsjCpGQgr6qPqi0Wu7RE1/Coc3LrQUrWHLMpz7t
	CmVeldEKjPdvczOTSu7cU5a1GaLgSo2Y9B1yaLfww08JqXVpSLWIYWejzo45HxNo
	l0ouHqHgnkExeh5kRZkO73+t3icyHhMFf+ZNVCMMg/NvwpBDfhQSsAuwjQ3NO3TU
	n2pmUlC73TcHYUza5w4RK9pNKmcD1rVkqXw6YgDeHHDQIy1dGzR9JxPwBz6NZUc4
	5M3UjW/0ZMAExW8zgWNMaMSJmjZReppGv0+eQcsPd5QKAkQiIqrfns3v8jV87Nvl
	xKZd/A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bkr8hb2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 19:31:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ee46799961so3806177a91.2
        for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 11:31:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737660710; x=1738265510;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R+HU6Upczjepad3IS1y8A7tsL3itPbaZJ/4EX4oO7RY=;
        b=Wrpl4V5A1CuvWsWDkfWv3aUamSDPsUZknlzzF9ud3H4lEzc2syNWymlLBHlcYZqMiy
         63IhAjc+xHWoVgsi4cj/GLa7kTOVLTo4CCuNc/FF14FojilA4RMNHZ+GCgZr3mDDdUyx
         89722s/AD3CRY+VBxVHl5r6OMyTc9TQLlIeXjiAPTs5VAlNRxCgGMF0FnL+5bFqBEGpw
         iCpP2h2n7MvvIYGXbQwfUV09QjR/PuULfb5j9P1KiMxLp/GzJ1nTP7wvbTuUYQ4JlDWJ
         BBmMxCZC3mkeP/gDCnr1L7Pi2aMi34Sy2L2ufMjLfTyiIUQWdwpHm6CH+u5n/jqpM1nr
         XnrA==
X-Forwarded-Encrypted: i=1; AJvYcCUy9QEFRA4qwuD9fJ2CfznFmUBkmeBZ6QYKKnbvBejDqdpeqqU2S/cpGM+oJ9pHgOvyZzwh+ZI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUYU++vVHJPbgFgSnpKhjlMtxmjdUPvFRf5XqtNqQYCdkHRNux
	OAQzjj/whocnG5JaZe0GCDPfO32ghHbF/fmgn2tSrAbbcAGgXzFF+WI0mTgL9B5IIkuERaOSj2P
	0F7ncAjS2QYS0cTRM7OZeOcm0ZIne8ZOz4j2lVgGCkEafAFcvO/Jz2hAM8+wR
X-Gm-Gg: ASbGncthbboieFw0akR1FwSG/fyYOkZ1m13nGrfXoMrjec56h92O3R2H98kN3rF7t8C
	EPR+9NEB613CZ+PVM8nMyPCOwOjtqWISGiDOVIKch1et94qKbW5xFNCNmBsfYYsCMIc2ZHO0A27
	nBiHw75pitI09ra1G/wAR92tPgita+QWrGAC+Bzo+LHAA/3gyIErL/rbxrNcXNQI5GQCxraAh5l
	CkL2U6F51/6Je5Y4C7o8zvYRvTAYJMnRiGtBdAe+/pXzOl7jY8sZQSNlNxnHQxdwKA3DBP9VkPo
	C8IWW8FUIysS3NSGK2is7aOAid5R/3zy9U3c4fQvdknR3GM01NTm1WOffufqJoY=
X-Received: by 2002:a17:90b:5206:b0:2ee:9d49:3aef with SMTP id 98e67ed59e1d1-2f782d4f173mr34538188a91.23.1737660710192;
        Thu, 23 Jan 2025 11:31:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXe/tgphMQH/tq3UOXXJ75lpr4kCoASmqw3v2WyjNGtlZ41FhOSs87q32O7WXoH3nRkH1A5w==
X-Received: by 2002:a17:90b:5206:b0:2ee:9d49:3aef with SMTP id 98e67ed59e1d1-2f782d4f173mr34538126a91.23.1737660709476;
        Thu, 23 Jan 2025 11:31:49 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa6a735sm93465a91.27.2025.01.23.11.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 11:31:49 -0800 (PST)
Message-ID: <e00af7e5-e906-45f0-a79e-a34078e23efd@oss.qualcomm.com>
Date: Thu, 23 Jan 2025 11:31:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/3] wifi: ath12k: report station mode transmit rate
To: Lingbo Kong <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250115063537.35797-1-quic_lingbok@quicinc.com>
 <20250115063537.35797-2-quic_lingbok@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250115063537.35797-2-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oGTHKai6r-BF_PkqDI6JL88r0DjOkrBW
X-Proofpoint-GUID: oGTHKai6r-BF_PkqDI6JL88r0DjOkrBW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_08,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_113152_101371_53B32E42 
X-CRM114-Status: UNSURE (   9.26  )
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

On 1/14/2025 10:35 PM, Lingbo Kong wrote:
> Currently, the transmit rate of "iw dev xxx station dump" command
> always show an invalid value.
> 
> To address this issue, ath12k parse the info of transmit complete
> report from firmware and indicate the transmit rate to mac80211.
> 
> This patch affects the station mode of WCN7850 and QCN9274.
> 
> After that, "iw dev xxx station dump" show the correct transmit rate.
> Such as:
> 
> Station 00:03:7f:12:03:03 (on wlo1)
>         inactive time:  872 ms
>         rx bytes:       219111
>         rx packets:     1133
>         tx bytes:       53767
>         tx packets:     462
>         tx retries:     51
>         tx failed:      0
>         beacon loss:    0
>         beacon rx:      403
>         rx drop misc:   74
>         signal:         -95 dBm
>         beacon signal avg:      -18 dBm
>         tx bitrate:     1441.1 MBit/s 80MHz EHT-MCS 13 EHT-NSS 2 EHT-GI 0
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219715


