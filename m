Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB03E77188
	for <ath12k@archiver.kernel.org>; Fri, 10 Jan 2025 19:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yo06f47uK65b4AxrDNsmCYM281VxDEwL3Bi6Z4rW9Fs=; b=UmbVsGC7ToXhgra4ISVKKPraLT
	Lm6QHPdHWIC+W+Bl+Dx5c0Rd0Os+ctNqn62dF0aK9PyBFngvX2vTHK+2Ou532W+vgmXuUlfV9fBmi
	AiXbgjImAzgkVAlRU8klYsjPC1I34lypj4LCP5tcASi5P64GBBAhbpBXMcsFdF4XSgzSiGUYMb/wM
	untXaM5wtpEz7N4X2EVzoK17HEUvEfRcSiqhn25wG4hHGKD4OutQvW4gf/+ZZUHjiIdhXWeiy4fjg
	ASxKvkV5Xqzu3gMkZ7Rxa1cxCcRbNRTAWAY45B1bJzkGRMbsw36UZZiaub2a2bwBeVuehMZ4M0Hwz
	UuPBVG4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWL4T-0000000Gp7U-3kxU
	for ath12k@archiver.kernel.org;
	Fri, 10 Jan 2025 19:53:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWL4S-0000000Gp6m-05ym
	for ath12k@lists.infradead.org;
	Fri, 10 Jan 2025 19:53:29 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A98vOd006741
	for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 19:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yo06f47uK65b4AxrDNsmCYM281VxDEwL3Bi6Z4rW9Fs=; b=EDkuSbbCBYUbaoh4
	WGYw7brJK4uhBj7v8AEujR/KIFawly8ttfO7Tpe9Sfw+n8muzIQrLdmHYC+6oDSB
	P5HUrMVaS+H4HjvuzF2pcYr9WVxzIN0lb62R8FEtF6XyjFrFmjjzKZ0PxwDyQMD7
	g6/sb0n+ChR6k9xu04ZPoi9oaRTH4k9ZTL2mhf67YA6X6W5GKG/MAksm6rkC8XjZ
	WM5EMRb3xyWJCrW3UDEskgiWnY8IuC+mSuRX7CxQL4jzjdarXFdnK95NJtuyYlt4
	xOjTQCjU+7T+codQ83wVnqC4MEjhP1/y3vK7KHzaCXkqEloGnKw3wjGjK/4gvwvo
	jZVDPw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4430nksnks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 19:53:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-216750b679eso31386845ad.1
        for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 11:53:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736538805; x=1737143605;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yo06f47uK65b4AxrDNsmCYM281VxDEwL3Bi6Z4rW9Fs=;
        b=GbTOHj5NBirQ9o/p+stoANNUqY/TbP3GaSh76cnDOU/TYS8qgvbXlEGWn2FQywm9Uk
         vOYjP7mxuRq8kbw73jpEYiMdfHkRVlrczaZyKo8Nr6efd/uWfAZDZW3bvo/Y7SpK9Tbq
         MYaH0HA3hqaRZQzr4hUgXBnVgt+OrDdeqiQO3Ow3a1HePf/Ve/l+RJyA/kqrhiY1VzIq
         4g+iZy0e2CWHNvidAH3Fn8zV9GgYTnae/m/raEuFP5IKFB9cmlmHeiJMjdyKBa3zo6Np
         7BuY2A4VXYrqN/kUPNDSWmr4bT9R2BFM/9ufJLX5nAA3ZT9z/0lthJoS4fAeyPkWIpxK
         VxLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/alaFeV6WB4PtnU88KXznMQJVfQeoidHWx9GPZVl4H4PlIZFAW2hJQ8iXUbNM16oM3rT3KRU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8rZJCI2NqCKFfeB8mOgEi9LWQeG5YFXt8Vk5Q9E5mKjCbPpIR
	7HoUlHQ6Jjj5laVNgz4WqxolCX7gjdeHGScLNoDvWWpuwx6ZfuHsHKZXZ93ELfx0Q2w2BY+Ux/k
	JGr8WUVC8ImHzdncciSgPhj1iqXdXmaxgLJBoXgjLZk8S9sp8d2ihuCIpQcp+
X-Gm-Gg: ASbGncvebssF+QbFzcjhb0lTqs+tQrbmVbw3PzzbMNLR0oic/AAqFUbTUh01aNmm2Ku
	lu6+IPW7NeZ6EiwDfQoYsrPGMXBBngB8SMRVCy7BhH1xmWGk17rV60BE4GpfM9iDrsf7CzRaA3m
	kDKmEJ9EPB4+A88+SyfVFEoApxmtcECBXzH6opPymYgq9V7qVUxUYUaIYL5lCLTz09XT5YY9X51
	7V1ZFw17Ov8mP+kvT6BRP/iD4wBUjRagBhHSQcA02LLQlsGwiRGpKm5TfY3/wD6vC8oeag8uk0D
	CieNFEt0/BYl3slwhb8rk8sN0iKk7FGaOg+t7yurSw3LvEj+4w==
X-Received: by 2002:a05:6a21:2c15:b0:1e0:9cc2:84b1 with SMTP id adf61e73a8af0-1e88d09e13emr21983923637.30.1736538805247;
        Fri, 10 Jan 2025 11:53:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4zl5ZHJdET7l5Nz8ik1Pq4xvCbXdDljAN9Z9p9CwO+x1HduUPS22+SzOnS6i0jSopvaj3yw==
X-Received: by 2002:a05:6a21:2c15:b0:1e0:9cc2:84b1 with SMTP id adf61e73a8af0-1e88d09e13emr21983892637.30.1736538804834;
        Fri, 10 Jan 2025 11:53:24 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4067e591sm1878079b3a.126.2025.01.10.11.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 11:53:24 -0800 (PST)
Message-ID: <7378d01b-c4ac-4e67-a601-5030d3963e00@oss.qualcomm.com>
Date: Fri, 10 Jan 2025 11:53:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] wifi: ath12k: Dump additional PDEV receive rate
 HTT stats
To: Lingbo Kong <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20241206133355.1990-1-quic_lingbok@quicinc.com>
 <20241206133355.1990-4-quic_lingbok@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20241206133355.1990-4-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: N46BA_PAztS9Ifo3cvzCF0KvIeIf6ABU
X-Proofpoint-ORIG-GUID: N46BA_PAztS9Ifo3cvzCF0KvIeIf6ABU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_115328_205485_7212D82C 
X-CRM114-Status: GOOD (  11.81  )
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

On 12/6/2024 5:33 AM, Lingbo Kong wrote:
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
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

...

> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
> index 65e95d1e04e5..57376307959f 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
> @@ -137,6 +137,7 @@ enum ath12k_dbg_htt_ext_stats_type {
>  	ATH12K_DBG_HTT_EXT_STATS_PDEV_TX_MU		= 17,
>  	ATH12K_DBG_HTT_EXT_STATS_PDEV_CCA_STATS		= 19,
>  	ATH12K_DBG_HTT_EXT_STATS_PDEV_OBSS_PD_STATS	= 23,
> +	ATH12K_DBG_HTT_EXT_STATS_PDEV_RX_RATE_EXT   = 30,
>  	ATH12K_DBG_HTT_EXT_STATS_DLPAGER_STATS		= 36,
>  	ATH12K_DBG_HTT_EXT_PHY_COUNTERS_AND_PHY_STATS	= 37,
>  	ATH12K_DBG_HTT_EXT_VDEVS_TXRX_STATS		= 38,
> @@ -201,6 +202,7 @@ enum ath12k_dbg_htt_tlv_tag {
>  	HTT_STATS_HW_WAR_TAG				= 89,
>  	HTT_STATS_SCHED_TXQ_SUPERCYCLE_TRIGGER_TAG	= 100,
>  	HTT_STATS_PDEV_CTRL_PATH_TX_STATS_TAG		= 102,
> +	HTT_STATS_RX_PDEV_RATE_EXT_STATS_TAG        = 103,
>  	HTT_STATS_TX_SELFGEN_AC_SCHED_STATUS_STATS_TAG	= 111,
>  	HTT_STATS_TX_SELFGEN_AX_SCHED_STATUS_STATS_TAG	= 112,
>  	HTT_STATS_DLPAGER_STATS_TAG			= 120,

both of those should used tab(s) to align the = to match the existing code


