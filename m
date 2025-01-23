Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7533EC02182
	for <ath12k@archiver.kernel.org>; Thu, 23 Jan 2025 19:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhwQZhuNxct8agZBJ+sWQ+qndGIZosftMXna/I0oIwQ=; b=bjDpaGGhUI2gYZIXV8tt5jDTOA
	o5cdxR4uLqtvN/g2bT0VQUbkgno8kp85taJh+bDArY8wu9o5FQO2iGvWgZA4fOS5O5YHwgG4m+B2m
	fc16V+OxSX02n0Uk04nLqFHra2URo6PyiZnKNhnN2NL59cMilMeNxE2aOnfIiuXG2WYtgaO4RfrUr
	X4/XB+rhmnkada8gMX4hkVwhZH9fbVX2QamBvWs2Ed3ABJstteF7MqPrkkRX5hWSIzBjCXemeDbqs
	nZSVTqj2SL/9POnp9IGRz2EBNZOiT7WH0/xm+TaMn51pfVV6GD/hcVNZZx3tQ2kjk512YNxd6hGU1
	xwfjWaoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb2w1-0000000D8W7-12cw
	for ath12k@archiver.kernel.org;
	Thu, 23 Jan 2025 19:32:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb2vz-0000000D8Vg-2OA7
	for ath12k@lists.infradead.org;
	Thu, 23 Jan 2025 19:32:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NF3X0q012069
	for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 19:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dhwQZhuNxct8agZBJ+sWQ+qndGIZosftMXna/I0oIwQ=; b=IWPsbmAxHfjnYSsu
	a1IC5L4RANl8kaGRmVNbC3ecFFHqk7iQ+SK+e4+2HLbsHomwY1ydKLMTyX4MFVvu
	16Mg+n35tj37XgkzLpLh98IOXZ3unz34GJsOXhFNMV2LaPbGL5VrYXAiFX1hF0Mm
	Z1IH/1Lv+aCjqVWXIaoxhcqhjgR3DEJ0CDbVU2g0y+YwrMYyarUq73LjZ54Mq0tI
	VeEIkH5TXCBIA9SxzukxGsrOOGggx5iIIumGYjTGYlgTdXALxuuxUfCnVfL9opbK
	qCxmj8emExP1rd8gbkZpzIPerLIiV8lJ1/zkFU+pYz7BR4JzGR8wBfBE0qngyuJF
	w6FeAg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44br308mm2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 19:32:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2163c2f32fdso40524705ad.2
        for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 11:32:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737660730; x=1738265530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dhwQZhuNxct8agZBJ+sWQ+qndGIZosftMXna/I0oIwQ=;
        b=kEkdPTOJl9Fr2AA+SgcRAH0s1m9hVpNO/e1ia3pHEqyjX7JdVQCcc2BW5fbTrj/lYp
         nXU34rR2end2VIXolOyhrBeqvp5HMlx57D5JZWS6LUg9mC6p+E5K/FIzDg5uMd53Ok9v
         dvU/IjeFn1WSV6pAp7XKkDm7d+AEWA5pRoa/S089GefrtZat7kdmssd1frCgdvpYvj1c
         Vx+66N2XE+d+TiAiYrLC5wuSIly9FlVKqviD2wnfeX+a5sb9lBp3lsha07DJgoFC90La
         osKx1omQomHvDUPEJDhG2dU1U/Zjun664OXJ+Zref+iP1dq8lFnWSQjbcmzWf3JgY0/B
         sE/g==
X-Forwarded-Encrypted: i=1; AJvYcCUs+JPdc3thhfUaFzeIL+M8xUV/7VelpbhwM0QJXrvxWm1ZcUS4pacUBZlUgSfLnXOX+HZFOqM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzOX4ViHXo9BOcDtEshArwRKCoizXcEGOiycDxhzPGWrxJl2T14
	PB3646bBRL6DMtHpvJEcXBG4zHvHSgpwv/zw4VCgb+D6+glDTc/1oTLjO/HahvClIGTp5nGUmw9
	YrHUqhkzXlOKDiziUVEMiomXOzOByHZ5dUN4GegEttp40qy8WR3pT8e0OM9UN
X-Gm-Gg: ASbGncuy7S+p1yLBKoCm1zkO7PA6cgxCd40RHzV8+PriB5cqz4uH4dXhy4CTxpIx4GN
	9MjuuJxh+suVKIkCiqPkAu/0YA5cTX3d/9nj22FwQjQSBY3I49gg2Bi6l+5RLIinazGIGDPXe93
	b4XSGS1M0uKR2PH3/Vu2p9qbV3pePvwFo7JjpgRosfVuQHkZ7HoN5JL5MZkNC+Y2t+GQEn6B/jD
	0Lge9wD3KX5+5WzU3TBGPZgW23iUFJyLRfW/TehF5XFV8cKwFDsCKqmsF3yBX26NhuZnMrUo9E8
	Y1oABIBerG4TNT2sbhHu2x6IW25SxFHmn8sVKXqUtN19/SocI206ZPjcrWuFFdI=
X-Received: by 2002:a17:902:f544:b0:215:e98c:c5bc with SMTP id d9443c01a7336-21c3563a33cmr473933405ad.48.1737660730235;
        Thu, 23 Jan 2025 11:32:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoqbRrk67Rnq31E/8jBfP52B+N3zukLWB98wiiiTJUez6ALjkoGuUcBpBcpYhe695wix7+2w==
X-Received: by 2002:a17:902:f544:b0:215:e98c:c5bc with SMTP id d9443c01a7336-21c3563a33cmr473933005ad.48.1737660729826;
        Thu, 23 Jan 2025 11:32:09 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3ea3027sm2736995ad.56.2025.01.23.11.32.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 11:32:09 -0800 (PST)
Message-ID: <91c2b0c2-0b6f-4bac-a49b-743ae8f70d1f@oss.qualcomm.com>
Date: Thu, 23 Jan 2025 11:32:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/3] wifi: ath12k: report station mode receive rate
 for IEEE 802.11be
To: Lingbo Kong <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250115063537.35797-1-quic_lingbok@quicinc.com>
 <20250115063537.35797-3-quic_lingbok@quicinc.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20250115063537.35797-3-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7kPjpBlopO56PsRSuN-5rVzbMaOmxTkI
X-Proofpoint-GUID: 7kPjpBlopO56PsRSuN-5rVzbMaOmxTkI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_08,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 spamscore=0 impostorscore=0 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_113211_614906_B63E3F9E 
X-CRM114-Status: UNSURE (   9.88  )
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
> Currently, the receive rate of EHT of "iw dev xxx station dump" command
> always show an invalid value.
> 
> This is because ath12k does not pass information about the rx_status of EHT
> to mac80211. So, mac80211 not calculate the receive rate.
> 
> To address this issue, add logic for handling rx_status of EHT to the
> ath12k_dp_rx_h_rate() function.
> 
> After that, "iw dev xxx station dump" show the correct receive rate.
> Such as:
> 
> Station 00:03:7f:12:03:03 (on wlo1)
>         inactive time:  48 ms
>         rx bytes:       59226
>         rx packets:     320
>         tx bytes:       26556
>         tx packets:     191
>         tx retries:     99
>         tx failed:      0
>         beacon loss:    0
>         beacon rx:      79
>         rx drop misc:   68
>         signal:         -95 dBm
>         beacon signal avg:      -20 dBm
>         tx bitrate:     688.2 MBit/s 40MHz EHT-MCS 13 EHT-NSS 2 EHT-GI 0
>         tx duration:    0 us
>         rx bitrate:     619.5 MBit/s 40MHz EHT-MCS 8 EHT-NSS 3 EHT-GI 0
> 
> This patch affects the station mode of WCN7850 and QCN9274.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219715


