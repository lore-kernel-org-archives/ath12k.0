Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EE9C0218D
	for <ath12k@archiver.kernel.org>; Thu, 30 Jan 2025 01:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZmfgbDyRs8egvyZJaS061p9zREsNe9WuLNjZIbWswE=; b=pDEeOuU4+3jzcOUl4H9J7NJicL
	zm9Scz5/Vdhbd/JQ9D9a5k8tHa1jGIwLWNN/yLyfSGlAUxVI1EK8f7/u5zy/oKWTkG380ABzET9Pb
	Md0YHAOONOvgSTUbz8RIlrwAMNHOi4mOFrNMxGSOqqP6qspvFxV/2fwrTn4S4QkeJTwt825ukvERL
	QE4/RcM945npPCsE3ubIeiE3jqnRarljO8K2wjKBqLjtsHgUcB6IRNsn7OKZ+fmDZcZ0SDif7Q0PC
	8NIW+lhQG6TXenUQis51e13kewviTLPD8Qo8+3jFoQOixmac9RYrOFYHCw++M9EZ6e09s5wqGulGw
	tzKDJPNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdJOr-000000082jk-2j4o
	for ath12k@archiver.kernel.org;
	Thu, 30 Jan 2025 01:31:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdJOp-000000082jL-10wH
	for ath12k@lists.infradead.org;
	Thu, 30 Jan 2025 01:31:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TMkpB2012401
	for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 01:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eZmfgbDyRs8egvyZJaS061p9zREsNe9WuLNjZIbWswE=; b=klnQtvdmU59xccvr
	SrUkUC1rdjdcYqXfWwFmUMFpYOjDRlokxoON2e23GH4JuZ4rMhSAZh6RgANt/zRc
	f6PP+K+VKQl3G8d8N1pbTm1QJ2dYjly624PFauI8taXWo7ewJCB4P4oGtw2Dynsk
	stj5eVGPdMM8nqBbEp2VaH2GWD18IDVWc84c7ut/dVtgg1PRAjjTxllWOZWYTv+C
	VborwRDlCNlzBk5Wq6m5qE/8nOOHEOup4bnvwclyRUB5d09EcE7w9H+pfYKYvEEp
	pEVDTPd2Hhb0dwXm3jnc3egddChBSEuLPUgV/TcDI2AJmBJnEs/zijil05MeHUtE
	sHvXxw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44fwe2881f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 01:31:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2163dc0f5dbso6463165ad.2
        for <ath12k@lists.infradead.org>; Wed, 29 Jan 2025 17:31:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738200677; x=1738805477;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eZmfgbDyRs8egvyZJaS061p9zREsNe9WuLNjZIbWswE=;
        b=jCXcO4ayMrb7lCjqLFRgiT8rEFgePNB+gliTAaxLIR3fM39zRMIpshGgnrvZmzPao9
         k1e7mQibnNdb2GAP9632dFMYw5E71mqDbhZPw6X/FollY49ydVKEjO3uWapd6JWbRwYy
         ldoa5iVVpOvrSeB0kXl6A7UPYsLsYonefNCgXO6nQ+uEvgSMAvFfaaVLB7gjd8z6Ulx/
         T3C/5Tx9XIhapFOwNUuxNX63YuOOx3gCbT7FUIJuJZ7AlrlVSm5VzXnF3r82LeWEHg1H
         BOhAj7kZjzjy1ap6X+e4Y40lA8rUZKBSIlHzWIfg3BptQAiZa4a9dq7XZOUGidHGpyIu
         Cyrw==
X-Forwarded-Encrypted: i=1; AJvYcCUVdPCopsJT5HbdPQyu9l5MKV0qFZj9wwQDNo832II9dhC8besoGUyPLnL1LGDA3kHcjQOvppY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwpdE+kg3gK/dswj5pTYO1uqqfXn353hvwNv2zD6Rw86kxhzQoO
	/NJdt72DPbKOPaS/bCxthDbca1S2aYRKhCG7D/Cz52V36BT6XxdN/conRA9vQgJqejtD3Y5zi+2
	tfGlmASB6yB0eR2cX7Gq4FtRWu4HLBVnrKb17g/OMQmWYvFFLtdVDovYDToUZ4brBMFzE
X-Gm-Gg: ASbGncsbvHPkbg2zL8DfmprI3/UJsIDF5TgKZuE69s1/B0HZIIbkdXqGqsbGJQ+4SLS
	LafSZ9SGMwiKZ+0XgPnGVKM7iGg2JmDMz2MKfCf8N2ur1nMS9lvU+6hCjNu/v96/Od1rnh+ofQ3
	RMNLT0Exa/80ignufwg7Q6VmOJxsuQLFLiHYKlZsPS7ZZIlbH+k8H9WoNLLD3N+NiErduwSFO8M
	fqOaviazYnWC08noDg5ssewR99+SEHdfd7igA9uY2tZvo20KbGN3IYPashO/Ivgheh9pKZNQI/A
	owYFiRIV96jPFQ//vfDozx+mt/QQ5xGkOEnwgPRJDIDiOCu3OLwc/lx5dOqdnSh9Z4S6R/vbmw=
	=
X-Received: by 2002:a17:903:1cb:b0:21c:2f41:f4cd with SMTP id d9443c01a7336-21dd7dea7b3mr90736885ad.43.1738200676747;
        Wed, 29 Jan 2025 17:31:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6AhMUA9yAsx/IDznDSEsVzexyxfxifa8JcyIZuIWrA8FHp+kVcds4sP7+xkMNrjoFHWgzmQ==
X-Received: by 2002:a17:903:1cb:b0:21c:2f41:f4cd with SMTP id d9443c01a7336-21dd7dea7b3mr90736535ad.43.1738200676352;
        Wed, 29 Jan 2025 17:31:16 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f5cd9sm2547775ad.58.2025.01.29.17.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 17:31:16 -0800 (PST)
Message-ID: <904c2c6e-c21b-4718-b60e-c29c60d80aa2@oss.qualcomm.com>
Date: Wed, 29 Jan 2025 17:31:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] wifi: ath12k: Add Support to Parse TPC Event from
 Firmware
To: Roopni Devanathan <quic_rdevanat@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
References: <20250128111059.1690113-1-quic_rdevanat@quicinc.com>
 <20250128111059.1690113-2-quic_rdevanat@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250128111059.1690113-2-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8-tO1sS4Jo3jZmGP_s0Xa7y1eSoj8zWJ
X-Proofpoint-GUID: 8-tO1sS4Jo3jZmGP_s0Xa7y1eSoj8zWJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_01,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501300009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_173119_402272_40242824 
X-CRM114-Status: GOOD (  14.64  )
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

On 1/28/2025 3:10 AM, Roopni Devanathan wrote:
...
> +struct wmi_max_reg_power_allowed_params {

this seems to be misnamed. per the wmi naming convention _params are structs
passed from firmware. you cannot pass a pointer to an array from firmware to
host, you can only pass the array contents. hence seems this is a host-only
struct and should be named _arg

> +	struct wmi_max_reg_power_fixed_params tpc_reg_pwr;
> +	s16 *reg_pwr_array;
> +};
> +
> +struct wmi_tpc_rates_array_fixed_params {
> +	__le32 rate_array_type;
> +	__le32 rate_array_len;
> +} __packed;
> +
> +struct wmi_tpc_rates_array_params {

again seems this should be _arg

> +	struct wmi_tpc_rates_array_fixed_params tpc_rates_array;
> +	s16 *rate_array;
> +};
> +
> +struct wmi_tpc_ctl_pwr_fixed_params {
> +	__le32 ctl_array_type;
> +	__le32 ctl_array_len;
> +	__le32 end_of_ctl_pwr;
> +	__le32 ctl_pwr_count;
> +	__le32 d1;
> +	__le32 d2;
> +	__le32 d3;
> +	__le32 d4;
> +} __packed;
> +
> +struct wmi_tpc_ctl_pwr_table_params {

again seems this should be _arg

> +	struct wmi_tpc_ctl_pwr_fixed_params tpc_ctl_pwr;
> +	s8 *ctl_pwr_table;
> +};
> +
> +struct wmi_tpc_stats_info {

same here

> +	u32 pdev_id;
> +	u32 event_count;
> +	u32 end_of_event;
> +	u32 tlvs_rcvd;
> +	struct wmi_max_reg_power_allowed_params max_reg_allowed_power;
> +	struct wmi_tpc_rates_array_params rates_array1;
> +	struct wmi_tpc_rates_array_params rates_array2;
> +	struct wmi_tpc_config_params tpc_config;
> +	struct wmi_tpc_ctl_pwr_table_params ctl_array;
> +};

reminder from the top of the file:
/* Naming conventions for structures:
 *
 * _cmd means that this is a firmware command sent from host to firmware.
 *
 * _event means that this is a firmware event sent from firmware to host
 *
 * _params is a structure which is embedded either into _cmd or _event (or
 * both), it is not sent individually.
 *
 * _arg is used inside the host, the firmware does not see that at all.
 */



