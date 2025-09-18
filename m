Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53A6CAC597
	for <ath12k@archiver.kernel.org>; Thu, 18 Sep 2025 07:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ue+pVaOAYmIBOaB8cArSGaKhQNAputzlAr9Z6ULW9DM=; b=18XkUdcQR+Mvjyl58hECDOn4cg
	ve6TO4FWLZc1LjfX7nsmPqQyocmeWXSw7gQCK0OzuY4nljKEYm3Di1JzhIpCHlfnw3d3WH8WRoSRa
	u4oJvbi2b8EQw39FLRc+CUFkKf81Bn3VK01Ef6fE7n3J+envPM/t5LePJbDnfN+mD6P97URaljIeK
	IgqspQ7QIL8YidE849YHI1/zd04+wQqFE4iTITQDrkaZU0pvzsRRBQNcSW51XLP0a0aD6bASpaoBD
	q6HcmrqbdqdP0zmQVUSaeKyO3t8jbEqFtWmv0cmtJEnjDtm6jOFNYDMj1f5Sjj18xvMOYK1a3vrMd
	RaKBaF1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz90s-0000000GXOg-2YKY;
	Thu, 18 Sep 2025 07:25:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz90q-0000000GXOC-05IM
	for ath12k@lists.infradead.org;
	Thu, 18 Sep 2025 07:25:05 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I7JqpV028314
	for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 07:25:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ue+pVaOAYmIBOaB8cArSGaKhQNAputzlAr9Z6ULW9DM=; b=FHjaeckpIOa/vF1P
	ZiClZ09QlfV0arE/nH8dx0BF2IdS7sJWMTuOXqcIFUDT5Zkn492mTXqgIkl1saos
	dYj3iOeJBnGxbudjBSy/ckECGJ/TgHukswN8sB18+vWlNuCedE0XIA9gvt4RjLcv
	20NhFf6EQ/8/jD1chjs36r/dGntekHH1CUEvG0tvUZdyJ8JbzvloQYPCbquf4ZwZ
	jDTCC4LRT05PVexxt3WCr71KKt1jBI5Ct+0ZOC+IL8CmKzVHo+ZYqKgEdTxqPxKj
	8iKUuWLhE3XIKfP6N++dO0DEKiuXekBmMljNYn7P7q490Xj1AD8bV0vd3UanRy4s
	r6AeEQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497v1jbapf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 07:25:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b4d48818a04so477170a12.1
        for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 00:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758180301; x=1758785101;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ue+pVaOAYmIBOaB8cArSGaKhQNAputzlAr9Z6ULW9DM=;
        b=a37CiIOVQ0oAQItuyhdWrKyex4YXzjrEcAXR4hx67c3zYWsXG5X5WfdU4/anBbBscq
         Y1wV7Db+kCYLMJKN23bVihXKEbERbHeo1ljOkjn+T73TLqXfJxS72oYdCWd8vFbn/A8A
         GEfps6MWLo+m/qsweiw2E7Qv4BHsdMyMYg8kkGSt7QaD/pIs7VPgw+FqY9m4wZlUw5jp
         WvnUV5tUOptuUMq3hYLka1f9dEdygw8aOciSQ0HiwUCS+Nsg1vBLNAqwcGiVuwC3wnv5
         vOOCVMV6e/Pg6sPg6ghxqZjBRMZIEQ5uVGl6kYuE9vOkAjPkMlvUxhvF1XjHEchhIFyk
         6MYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd3dy6NoYJDsA/HCGvr3VAAENgP219rdoVSs92BnAhKMWpABSQdh4G7FBX8QQKAKp7am8tc60=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv1CrPbe/FBl/hxn1qshAU29VMJKbb896lSHBVFSjqjpJa+J4F
	Z3PfhgsyF3udYXOuLKRCz1OKRJcJSAxMbmpHXGUhUFhLq+IWyzjchXEsmcILMZNu0pYiF0uPF0s
	8f0gwznedaChAE2FNXwniSD3bOsdK9LnTRfjMV9aLhgdTRFY9hpU9IWQNWxVhn+GP
X-Gm-Gg: ASbGncukZy4IqKcXbXJeOMiZaLGPkQlw+5xwXhqMtfWBkyNjOfCFDW241u0QuRkgUKt
	KMbOSUT4a02iHGPY3USGgnB6l5KR5hBO4Xjw6hmi3b+xeiB9t6S2egG1Sw19DoaeghGojjL1qAz
	KhSyN+/kyfcrmtpEsNd3MgOoqzxOGdqPPQZPoamB1iOUHms6EVJQ7pfNGamKM8AuRG0/a4RfIwr
	rYpIP3YSRg4+u6gR1DJa2ov4HdLtdBTcgYkRytfLa+R1PDDGiRho7mQCe9sBEiLE/3iVcbWe+7p
	LIZ25jHf3Yp/sl9ofh3WS+rq5im+mtYVAroEJlPEiQ/loXLgh4poNE13jT0wNHAeFah0efqHn50
	bP4YSLw==
X-Received: by 2002:a05:6a21:3393:b0:249:c440:9b39 with SMTP id adf61e73a8af0-27ab06e41d8mr7636351637.54.1758180301592;
        Thu, 18 Sep 2025 00:25:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9sa0L3R0ncN3Jc2SZiMG6nwOJATnPz6XVx4l276ZxLWmOpVYIHpMBxMwzAetN8OkABmjWug==
X-Received: by 2002:a05:6a21:3393:b0:249:c440:9b39 with SMTP id adf61e73a8af0-27ab06e41d8mr7636321637.54.1758180301201;
        Thu, 18 Sep 2025 00:25:01 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff38eaf1sm1479952a12.24.2025.09.18.00.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 00:25:00 -0700 (PDT)
Message-ID: <8bf63e27-57e9-fe60-698a-9207b5136c04@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 12:54:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next V4] wifi: ath12k: report station mode per-chain
 signal strength
Content-Language: en-US
To: Lingbo Kong <lingbo.kong@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250812030044.688-1-quic_lingbok@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250812030044.688-1-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oXuzMPFXqmQV0_jiRncpSP6-Mc6VflZW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDExMCBTYWx0ZWRfX8+6esuTuw0S+
 pAtkFCrrsJ9/jsSP7lgJ90ABvgXztz8nRiWIrY1MerFAzoLyV8e91zKAShtu25RTQPTfAfBLurl
 mace2yoenjOd1VKV3jj7o3cF6nAOVcwNTdQA8ZqY6Js1jb00Cag9axSy8TqfGMVSZW7eYdZ8UQ6
 R9unkvJq6R87z4/3QBBQU/mf1bGHAEBWRvI3kUHIrBHVjfNu4uPNSKxyirwXFbpUGK0H74S2i+F
 nZT5RNHRPTlj4HrkVIlRUnKW2/pPYV8YrPdu1v0lPCmwcYLoVUhygNC355pab3nO70x8CdlCiPL
 I4GctdMTLwMrCGtp7+97Z1FoiAjsFnrp+xFNCos3YQ+dnSJGhH8wsGpAmnMrptw0nMJ6sZ+QEvS
 BHmqWXyj
X-Authority-Analysis: v=2.4 cv=AeqxH2XG c=1 sm=1 tr=0 ts=68cbb3ce cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pN-lpjZd9i1dOjWOSwIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: oXuzMPFXqmQV0_jiRncpSP6-Mc6VflZW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_002504_199003_E46C37CF 
X-CRM114-Status: GOOD (  11.03  )
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



On 8/12/2025 8:30 AM, Lingbo Kong wrote:
> From: Lingbo Kong <lingbo.kong@oss.qualcomm.com>
> 
> Currently, command “iw wlan0 station dump” does not show per-chain signal
> strength.
> 
> This is because ath12k does not handle the num_per_chain_rssi and
> rssi_avg_beacon reported by firmware to ath12k.
> 
> To address this, update ath12k to send WMI_REQUEST_STATS_CMDID with the
> flag WMI_REQUEST_RSSI_PER_CHAIN_STAT to the firmware. Then, add logic to
> handle num_per_chain_rssi and rssi_avg_beacon in the
> ath12k_wmi_tlv_fw_stats_parse(), and assign the resulting per-chain signal
> strength to the chain_signal of struct station_info.
> 
> After that, "iw dev xxx station dump" shows the correct per-chain signal
> strength.
> Such as:
> 
> Station AA:BB:CC:DD:EE:FF (on wlan0)
>          inactive time:  212 ms
>          rx bytes:       10398
>          rx packets:     64
>          tx bytes:       4362
>          tx packets:     33
>          tx retries:     49
>          tx failed:      0
>          beacon loss:    0
>          beacon rx:      14
>          rx drop misc:   16
>          signal:         -45 [-51, -46] dBm
>          beacon signal avg:      -44 dBm
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219751
> Signed-off-by: Lingbo Kong <lingbo.kong@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

