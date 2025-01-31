Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41444C02190
	for <ath12k@archiver.kernel.org>; Fri, 31 Jan 2025 05:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8D7O0wDLWwIoiTAJ43L7yF1fTstKav2NoIU106kB9ds=; b=00CkURuqZ/kzd8HOPPb6vOtuqV
	vzyLoadOMcC8SULpoivBdPY9aFXn0QYZNVv9lXwNNJnGsnuxmumvcFycsQNxls7x31aWe2gEAilC+
	zCCQiAzddpTZ615C60YgTP4ONeQbvvjnq70f3wNR0Zx4CNjrLjFS7aHNr+Ipn6gUn8/5TvXxYmY8T
	kONg2aLuKoMheOLbSnJwkBnYKdPKQecuPxe5HMU8dm1Myy9K8hMaBXDYrdp+SlNaPSHUK6YVKUqxc
	tEuLGUiyj2JY6xx0C8PQsIc2Qn+T8/ER8DX276reExmqSdEVKCz2qkIIXHuGvOV1hid6ccb2x5C7Q
	63UlYqOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdjFf-0000000A0oi-01hs
	for ath12k@archiver.kernel.org;
	Fri, 31 Jan 2025 05:07:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdjFc-0000000A0oQ-2rW6
	for ath12k@lists.infradead.org;
	Fri, 31 Jan 2025 05:07:33 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UJ1cZj013607
	for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 05:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8D7O0wDLWwIoiTAJ43L7yF1fTstKav2NoIU106kB9ds=; b=B86AWmcWCvlMm0ZY
	gaFjo9PtPuuJZ+My6orYLgc57MejuwmyEiuakbtXaq26SmNYxszqMwUm6UXbrtyn
	gaoXzFwcpVNEs+MRzqJRYbGxZhHv8MPhwD+/LCB7kfi9IZeG0ObyBxij666so+5d
	46D9U7JXKaF98zOe3fnbh3/FmkJGp12Mqk3W3lMNdreoCpHFJ2naPfBzgMeJO8nB
	PJx2OMntt+ILWF/5d1CYd/Bu1Dfm/T1gVFvnLGRU0/oj/97Or6oR8Yv9g3NQXGjS
	gWc7wx8QGznpBXNrdz8PdsR/AqshG62zttb/mfCaeAM/4RT7AIEMz8lCO6MKWeqZ
	MjRspw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gf7m0xvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 05:07:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2efa0eb9cfeso3246257a91.0
        for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 21:07:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738300051; x=1738904851;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8D7O0wDLWwIoiTAJ43L7yF1fTstKav2NoIU106kB9ds=;
        b=ag5596UQueYKJTmQYFnTDEfSMAWijRMICn4wsjxCHqmIVNPPgSNys7AdDnFKxN7lXR
         N6vUXIicEFjjUubUAXY5EkHZCbAAaLZ8m+PD/42Ql1jgIksY2QHeEwkQdMpNIPcDZty5
         zgH6I8pXzYjzfE+08oAlgMPyDflWYt3cLJVJ6GnzPYM9oP8nyma3oqvWaGARrASSTsgz
         Iuh8OzISUvEHCYIMK3+PbkjrSwRDaejYP6a6hTc6g9+cckzMMaJfzL13v6sCzuiyuJyF
         kZPWK9dEWbl3/finttiYy6BW1aGOnzVwkztPbz2WwsZ3yZsbFY4FjTnmp3gH7twcnNnj
         owiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiEz4rAqBtAmOf6wLoT4GQic45EaUHOuNy0vwS2EFmMxPJvQuAGvpasGgXyx3MoWkzBmQ4A+0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzpD4q0Wp7BG0lq7OgM+5Q3hFeJC2X48RVMfBNOKUvBIZj3XpYi
	m2VHTRhnw0ZlC9hDTMAFt8zm8nomH7cJ8kFM66/0k4Whj0odEk9gJbpzm0k8LkM6mJDHx9RzIuS
	7kPpLCCHB6d3AAIMbfg7G1PcACYsJ0fHIe3XwyzsthGGYiCh8gN6uRr4jYwnV
X-Gm-Gg: ASbGncv88BB/wHdSYAq/D72CtVDena5muBfWqgltOXg9WFNx29yrZrn63cJ44yuHQTq
	8x5klMxazODSdXarrvrMZ8OkP44NQa5G4OHosnaVWzbVU2em02igJ7eNO7fmObtGBFlALkOcos1
	eJCIM+BkZRUVI75egjdOzPGrWJ65V/j4Qfs9iDvreqoDc2zH5WC93CdqZ7lprSAJaKh4Mmvv9y0
	YzLI1qaz+vhHj3dI6GwJ3yH4LlYK2ZlCxfBOpwwpSaVNgN1QQkXvxZJIIXuUIAFlis6Vw9zpyKc
	Jp31E77y0k5jEqpPOQxC48oy76Qnk8Pjfr62fhg=
X-Received: by 2002:a17:90b:2812:b0:2ee:5a82:433a with SMTP id 98e67ed59e1d1-2f84642e62bmr9074937a91.17.1738300050908;
        Thu, 30 Jan 2025 21:07:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEA1FYtzRkkLSS/Ovc1AAVNkvhN3G9XQbbiP2WUWRjecNejoovDCQXr5+0UlhLcsqz1kQ31lQ==
X-Received: by 2002:a17:90b:2812:b0:2ee:5a82:433a with SMTP id 98e67ed59e1d1-2f84642e62bmr9074909a91.17.1738300050453;
        Thu, 30 Jan 2025 21:07:30 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de33007dbsm22377365ad.184.2025.01.30.21.07.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 21:07:30 -0800 (PST)
Message-ID: <51e3c2e0-4497-4037-9c13-d3782d04232c@oss.qualcomm.com>
Date: Fri, 31 Jan 2025 10:37:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] wifi: ath12k: Dump additional PDEV receive rate
 HTT stats
To: Lingbo Kong <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250113071758.19589-1-quic_lingbok@quicinc.com>
 <20250113071758.19589-4-quic_lingbok@quicinc.com>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250113071758.19589-4-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uI10DS8jljijHOTXaFxN-Fb2j-aVmqO7
X-Proofpoint-GUID: uI10DS8jljijHOTXaFxN-Fb2j-aVmqO7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_01,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 mlxlogscore=811 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501310034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_210732_739162_85CD297F 
X-CRM114-Status: UNSURE (   7.78  )
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

On 1/13/25 12:47, Lingbo Kong wrote:
> Support to dump additional PDEV receive rate stats through HTT debugfs
> stats type 30.
> 
> Sample output:
> ------------------
> echo 30 > /sys/kernel/debug/ath12k/pci-0000\:03\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:03\:00.0/mac0/htt_stats
> HTT_RX_PDEV_RATE_EXT_STATS_TLV:
> rssi_mgmt_in_dbm = -48
> rx_stbc_ext =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> ul_ofdma_rx_mcs_ext =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> rx_11ax_su_txbf_mcs_ext =  0:0, 1:0, 2:0, 3:0, 4:0, 5:9, 6:72, 7:41, 8:1, 9:0, 10:0, 11:0, 12:0, 13:0
> rx_11ax_mu_txbf_mcs_ext =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> rx_11ax_dl_ofdma_mcs_ext =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> rx_bw_ext =  0:1395, 1:0, 2:0, 3:0, 4:0
> rx_su_punctured_mode =  0:0, 1:0, 2:0, 3:0, 4:0
> rx_mcs_ext =  0:0, 1:0, 2:0, 3:0, 4:0, 5:14, 6:149, 7:44, 8:1, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0
> rx_gi_ext[0] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:14, 6:149, 7:44, 8:1, 9:0, 10:0, 11:0, 12:0, 13:0
> rx_gi_ext[1] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> rx_gi_ext[2] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> rx_gi_ext[3] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> ul_ofdma_rx_gi_ext[0] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> ul_ofdma_rx_gi_ext[1] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> ul_ofdma_rx_gi_ext[2] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> ul_ofdma_rx_gi_ext[3] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Lingbo Kong<quic_lingbok@quicinc.com>
> ---

Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

-- 
Aditya


