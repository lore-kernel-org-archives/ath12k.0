Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2173EC5AD49
	for <ath12k@archiver.kernel.org>; Fri,  6 Jun 2025 22:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLU9qoqaIrPsB96aIxIERU7iL0ZQJHlgdTGXyRV+TLs=; b=2hFipX4nowKEYdF1merhF0W9g/
	gFX7Ec3Kgs0TGUMhYNrk7nWJaqtvE+Mp8IaBb33X3l0F9/Ut2IKSaLzRVfq++uK5TfrU3pRSsFw17
	7HS6eKfjgpNvvVSfpNtK2QAGHQ/ujv2fhqku42GcptR62qFyVHXIPpJ8grrZTily4nkL7MfGwAsa0
	42nPTESRZobLGI6+8v5Fs0hI+AzRTCSoz2viOPsO6VdweYbNkk6caBfMWWozdru6QZDV+60jw/Kur
	SAEj8GqdecOFtIozBlaFyYVgSHsTGPjGiV1ZtFb4zIQXPOJHfbotcv1jpCxQZUdXM8ruaI9exKcg2
	/ttUY7rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNfos-000000015BT-38u1;
	Fri, 06 Jun 2025 22:45:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNfoq-000000015Ar-0IUF
	for ath12k@lists.infradead.org;
	Fri, 06 Jun 2025 22:45:49 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556F9DYB001931
	for <ath12k@lists.infradead.org>; Fri, 6 Jun 2025 22:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLU9qoqaIrPsB96aIxIERU7iL0ZQJHlgdTGXyRV+TLs=; b=mdm7UtowMs1VWUY7
	pAFFJO4f9AqeNFQTpqSH1j6FFcCZKUTAdoRHA3MLC8p4bm5wMfxwL381SJ5sJe+z
	YCaRkczJl0ezIcGu2ShfYa3WbdZEvJH4/Yc8WHSyfDnbaCH6zPRneljU37WQkG0R
	fftt0HjFCiqC2Hi2m9Z/n3LitYKwy/dcdhxmytXlw8ultddjJnV+kN+sYTk0qOAy
	NFXTbr1UaRvmlnxyyNRiLYMIEFbWPmGTwkeOexGAajHbXfYj+AuAWt6wu/mNPP/T
	Sba2sk0FY1T72z9y6Csw5bIrDXMKs7pDPS95SLUf+xtMEOhB+DPDhuly+i4EP6b2
	J69ZSA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4737me5cby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 06 Jun 2025 22:45:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-231d13ac4d4so36416315ad.3
        for <ath12k@lists.infradead.org>; Fri, 06 Jun 2025 15:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749249946; x=1749854746;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yLU9qoqaIrPsB96aIxIERU7iL0ZQJHlgdTGXyRV+TLs=;
        b=EOouMymS6i0Pk/IwdL0K1JK8w9cDVon/K+PHiYwZ7wjHouHwdR0yYrE8mJXehN1H+C
         qcFg0QB/Ozex5eQQTwyHqjUHKFTaLSaVSA18qJGSSb2YZC6s6AMqcMJSemnmjm0Lxyv/
         R7fXn8rrrrKAwl3jtbuk6zJuFjSixI6XVROpJd2ZhOS1WhaNY7ARFR5YkErsDJJzAvd2
         mA1LJz1IBZfjyyqhQQrbGtqPsEWMGMc5IrwB+HJRqz+vzCul4nSgYgKpE8EQx9doti9L
         pYWRq8IyCsggoVcam57wGeLEJ6RdzMFqWZIFCFX+riEnpNaagqVtXrsYt+nWWu1cbfqY
         l6RA==
X-Forwarded-Encrypted: i=1; AJvYcCWcJYLUPGdJSuv89keo5VCHhLxWn4yN8CTmmzQR6+UKmbVOhGPQ2qIHBAVKx+2NEIQwILBhnQM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzliaXa2sYG9iVP82+60ZCpp9OMHlsxtlikiKxwY42ljNu1GP2j
	Y3WgxCCBQPbj5LXbUh6b3oLOIfeDCe0Yaxt6/SdDqdh1+9/J8KVjfacaKjypWe6BvttdZdCiYGT
	5TOxXYwz4+L+H5ulY0tB9KmuDrvThPAfqoCkLwVLy9ulz/NnCkaYdVM46gnfkLIW5
X-Gm-Gg: ASbGncsONQS0wl/FNpww0XR+PXfPbamZlMyCkVQ9W/21XGzM2BIwcY/IDY0T8Ngu1C9
	NT2njzCC9apAJhv6pu6tU1tlL+QI15TD4/1EAFPYpR9L/4B/EH4qaFlMn2F8p6IPkMYY5c+eNfj
	AyzWfqBlS7lec1Ed1FPnWJA+4JHZQEtKFYaBzabXwH/gZmRkw9j5MM/T1LOE67jQfkXVfeteV7e
	/ODQNG4LZSshZTGramTSPR5M6t/yxs2i1j/ZqkCLZw763WA/p6+L5+guhbeSjGJGbR2ftednNpt
	SoClnylofEH3a7c4sNpty8S6bOvNvf1KHcpE0G8sGWZ34IRxF59d4pnfPPYW6SkbmijgZTMGmhd
	l5bfD
X-Received: by 2002:a17:902:e5c6:b0:234:8f5d:e3bd with SMTP id d9443c01a7336-23601dc0342mr67817375ad.39.1749249945832;
        Fri, 06 Jun 2025 15:45:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+MKMoSG07ymmGCV1qvRXT8UZkTJQiJqZa3jE3Iv3VNxkmQDQuLf/vtXu05HBa6PWT2Ae2fw==
X-Received: by 2002:a17:902:e5c6:b0:234:8f5d:e3bd with SMTP id d9443c01a7336-23601dc0342mr67817235ad.39.1749249945501;
        Fri, 06 Jun 2025 15:45:45 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2360309262asm17358025ad.61.2025.06.06.15.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 15:45:45 -0700 (PDT)
Message-ID: <3ef0f7d2-7219-4caa-abf4-f18ac8ec8545@oss.qualcomm.com>
Date: Fri, 6 Jun 2025 15:45:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath12k: Add WMI control path stats infra
To: Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Rajat Soni <rajat.soni@oss.qualcomm.com>
References: <20250120184447.658660-1-ramya.gnanasekar@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250120184447.658660-1-ramya.gnanasekar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: We4DZwIg_EFTUtKnaSZm7zoFVgAu2M3l
X-Authority-Analysis: v=2.4 cv=GPQIEvNK c=1 sm=1 tr=0 ts=68436f9b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=3mt_E4_60Pvx-E9vTmYA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: We4DZwIg_EFTUtKnaSZm7zoFVgAu2M3l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE5MCBTYWx0ZWRfX7B00fQoqT4ZF
 w5i5q12pu5BsLaTG5/bUBbPfbC+tlHPrvdpgRp00GIa7ykwRW7MbdQsfrCEc5/flAPokyzuoCi5
 jMdKzT19l4Ieyo/8wlr6Q3k2G9HPc2SKGJJvXs/0E2mH7a1RYXwRGIbr30cn2alGA2Wu5UBUwwe
 4avkSzdYJ85gPyw5P5VYOSBv/hJqjFX1XJ0LbSr0HQlwNUPySG4m+QJwoOZfEJIrNxWbbxrJ7dh
 dbvZg8LNsyxF1P7W0b6m9LyBWOwuebAWTlHrTKherS9ss8Nf0kMgguINAE7LkA3Y8XuveLc0+Dw
 sWgvwBoICgADjA0Dgyj1XrIw/E0wO3SQyAiCbtUinHKHU3MU7KKcn5gJfxuK8jbuBKLcIdWZuRx
 f4Ci/eamZv+JAZ8y0iEuDCG+NOHAn6MTnFIN047/dXJHjgnoOjtTFFoAhthGFwlJmcnDiYBc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_09,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_154548_241950_4708CF0D 
X-CRM114-Status: GOOD (  11.79  )
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

On 1/20/2025 10:44 AM, Ramya Gnanasekar wrote:
> From: Rajat Soni <rajat.soni@oss.qualcomm.com>
> 
> Currently, firmware stats is requested by host through HTT interface.
> 
> Since HTT interface is already overloaded for data path stats,
> leveraging control path to request other stats through WMI interface.
> 
> Add debugfs to request the stats and dump the stats forwarded by firmware.
> 
> ath12k
> `-- pci-0000:06:00.0
>     |-- mac0
>         `-- wmi_ctrl_stats
> 
> This patch also adds support to request PDEV Tx stats, parse and dump
> the data sent from firmware.
> 
> Usage:
> echo <stats id> <action> > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/wmi_ctrl_stats
> 
> Sample:
> echo 1 1 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/wmi_ctrl_stats
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/wmi_ctrl_stats
> WMI_CTRL_PATH_PDEV_TX_STATS:
> fw_tx_mgmt_subtype =  0:0, 1:2, 2:0, 3:0, 4:0, 5:37, 6:0, 7:0, 8:908, 9:0, 10:0, 11:18, 12:2, 13:3, 14:0, 15:0,
> fw_rx_mgmt_subtype =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0,
> scan_fail_dfs_violation_time_ms = 0
> nol_chk_fail_last_chan_freq = 0
> nol_chk_fail_time_stamp_ms = 0
> tot_peer_create_cnt = 7
> tot_peer_del_cnt = 7
> tot_peer_del_resp_cnt = 7
> vdev_pause_fail_rt_to_sched_algo_fifo_full_cnt = 0
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Rajat Soni <rajat.soni@oss.qualcomm.com>
> Co-developed-by: Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>
> Signed-off-by: Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>

There was no feedback on the v3 review comments.
--
pw-bot: cr

