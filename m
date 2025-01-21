Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E48C0218B
	for <ath12k@archiver.kernel.org>; Tue, 21 Jan 2025 17:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFyn+vIA68bXfr8/8e+p43567yde9skhLsXNicoGWx8=; b=bj9n4tbSCMvP1KOKbEevOUJEi4
	WRxz2krjvnIZwh6prm3U/t/fnW4v/ZctYHM0x4JdPoOya7gJ+w9yxQjojiRH0Pf8BD0d7obN5TNqr
	XVMtbOgLjdIDBVzOF4OTxvAQVKz86fFcnDRvQy0PahOLjwB/TdYcz1jaT9P2WJTpdJ4/BBdLZq97x
	m+tQmn/p1PKbZ5GmP1431zzMMHFR3XvxxDkxTZsjs9TD3RgTzA8LgJ/d+CnV2BYpoHAN7a6tDTxcy
	QbcOuOWxnSMoaF4YewJWnagpz0yML9w3iUWrRYZeQpy/rWxBAkJQzV/YbqP+YwL/j0ZY21pAIdw7V
	l3iEtjtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taI2a-00000008TSw-3Vjm
	for ath12k@archiver.kernel.org;
	Tue, 21 Jan 2025 17:27:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taI1C-00000008TGI-2YY3
	for ath12k@lists.infradead.org;
	Tue, 21 Jan 2025 17:26:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50LFDXPw031984
	for <ath12k@lists.infradead.org>; Tue, 21 Jan 2025 17:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xFyn+vIA68bXfr8/8e+p43567yde9skhLsXNicoGWx8=; b=SkhktG12cJ51tEwz
	f+Wr+gHSZQYIFvBDFIVdam4qEjwYJFoBwkUCp4xrYtGdshP7DN4eX1fLKE3E97GC
	Oj7xzsSacXMGTNuqSrGId4FvZXIbB3Fb/JjhnaaShOr2JeLXuwqpMEfn77fZcLNi
	GAUFN9jpPG6L0Sun4E0rGO/GaL/8io3jf43sufCBAP4wnjtT1LT6MVaf11w+bJ36
	cJcDKXeQYh1qsFV+dtumQTcvx5AAZEf+2jaXv10s9DurbKqhm3Cyksol6zdnXj2T
	of3u5wb7+aK1uSvKvdmMjbBk0Mnkvmswm9zcEpXJd7pWujVlbS06h9Faik83n7VO
	yZsqXw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ae1p8bas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 21 Jan 2025 17:26:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2165433e229so118210045ad.1
        for <ath12k@lists.infradead.org>; Tue, 21 Jan 2025 09:26:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737480383; x=1738085183;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xFyn+vIA68bXfr8/8e+p43567yde9skhLsXNicoGWx8=;
        b=SbrnIpclqDxKAOqTpPvaI9k9QgLtYVIarAzm17lNQR5aLsA28XsuubrDRQBPS/RU8N
         +XM+jzxbow6XnuCvWWzOD6j+8yMJmMK71m7zydKGY2XoeD+9z4ZPYgbJhupLM0pZOlC/
         s5tGCS4XWdkW+I8ggKBehFgfRzGpl5tiJLf+mVwjMJxnfF0gCcwsuM7X6D3JlJNlK0T4
         rRzvZ3n2+pt23G619kRHWO84XDox7+bRJcI1XM3Bcg/s3fCabJKjFY7DMowwBoOxa4u1
         LUmPDeonbGEF3fi87XhppoWNhzWrBkJK408SEsvZSlpPVke6FutiaOL1nTWGTAoRMfRd
         8oZA==
X-Forwarded-Encrypted: i=1; AJvYcCXj8KiPvuoy5t50phdU8poJbTZIdAcoI8Zym1/p7LRRUlZd3RtZPs7mYBrFEL2IqCHwRb5X6UY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzxoA7ehJ3rYpaXirkQ2L6/5navOyJDRvkpeqjfcoPn4LuJWIey
	KVK+We3I+jOGM+oaGnLM/sygntY+mvNq6e3QtMQA+9EB15MU7QYDDSOYWJztmg4mTDD0FrKt74F
	rXiVSTj04wTz3hCwctrciz95Heg+R8mN8JNP43aUDXMpIWlELElM+R0I4Zl4a
X-Gm-Gg: ASbGncuNm9Wq0PoqmvcrmOlD6FgNpQr6h2uok328y4W/BPWF0tL0EoH4lj+mWQ7VVOt
	n6E3dF+YFmHFxc6LFrK1ZOFF15mAlxzHdb1E8P8KOwbGGiG7zJ/o9V/CmJch2Mp85HKRDPuKqXg
	jmAZ6I8Sw1k68AsSj5PHB22Uut2ETF6YdrRqVf3NcnaFyl06OwfdpgHEbci6fJLPvxH2poku2Y1
	yA4FbCBzYg84RUmeWd6FmbTenJ3KrE5Lf7vFZsGPlSwMEGx1nc1CKUsdjG3TkoHYG9U8EtErquU
	zEs+joHjDax86WNQMwfrk2g+d0pb0ZfV36mUV+3eOyejBNDXfQ==
X-Received: by 2002:a17:903:2a88:b0:215:9894:5679 with SMTP id d9443c01a7336-21c34ccef5fmr268666635ad.0.1737480383409;
        Tue, 21 Jan 2025 09:26:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHebtlpbe2fjGTEr6g5IQsgumqvYjR2tRkHVlpjK0XAFtKdFaHaz7u47zr4G4o0OeZNi4LZCw==
X-Received: by 2002:a17:903:2a88:b0:215:9894:5679 with SMTP id d9443c01a7336-21c34ccef5fmr268666395ad.0.1737480382986;
        Tue, 21 Jan 2025 09:26:22 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcc3232a4sm9137633a12.30.2025.01.21.09.26.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 09:26:22 -0800 (PST)
Message-ID: <0ab6d084-9fb7-4e8f-b0b7-71812a1492d6@oss.qualcomm.com>
Date: Tue, 21 Jan 2025 09:26:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/4] wifi: ath12k: Factory test mode support
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>, ath12k@lists.infradead.org,
        "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Cc: linux-wireless@vger.kernel.org
References: <20250119083657.1937557-1-quic_aarasahu@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250119083657.1937557-1-quic_aarasahu@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: w1MqF-PJa5Qde_h1ZzSDaUXfp1z-iqpj
X-Proofpoint-ORIG-GUID: w1MqF-PJa5Qde_h1ZzSDaUXfp1z-iqpj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_07,2025-01-21_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 mlxscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_092626_763615_26FB1850 
X-CRM114-Status: GOOD (  16.14  )
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

+ath11k list since it is also modified (but no functional change)

On 1/19/2025 12:36 AM, Aaradhana Sahu wrote:
> Device is booted in factory test mode for calibration.
> The commands are sent from userspace application, which
> is sent to firmware using wmi commands. Firmware sends
> the response to driver as wmi events and driver sends
> these events to the application via netlink message.
> 
> Also added changes related to correct pdev id access for
> fw test cmd.
> 
> Aaradhana Sahu (4):
>   wifi: ath: create common testmode_i.h file for ath drivers
>   wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
>   wifi: ath12k: add factory test mode support
>   wifi: ath12k: Disable MLO in Factory Test Mode
> 
> ---
> v10:
>   -Combined patch[4/5] with patch[3/5]
> v9:
>   -Rebased on master-pending
> v8:
>   -Included change for assigning seg_hdr.pdev_id.
>   -Moved if block to start of ath12k_core_hw_group_set_mlo_capable()
> v7:
>   -Updated copyright
>   -Moved ath12k_ftm_check in ath12k_core_hw_group_set_mlo_capable()
> v6:
>   -Rebased on ToT
>   -Updated copyright
>   -Added patch[5/5]
> v5:
>   -Updated copyright
>   -Fixed line length within 90 char
> v4:
>   -Rebased on latest ToT
> v3:
>   -Rebased on latest ToT
>   -Updated Tested-on Tag
>   -Removed second parameter of ath12k_core_start()
>   -Updated copyright
> v2:
>   -Rebased on latest ath ToT
> ---
> 
>  drivers/net/wireless/ath/ath11k/testmode.c    |  80 ++--
>  drivers/net/wireless/ath/ath12k/Makefile      |   1 +
>  drivers/net/wireless/ath/ath12k/core.c        |  28 +-
>  drivers/net/wireless/ath/ath12k/core.h        |  11 +
>  drivers/net/wireless/ath/ath12k/debug.h       |   3 +-
>  drivers/net/wireless/ath/ath12k/dp.c          |   5 +-
>  drivers/net/wireless/ath/ath12k/mac.c         |  15 +-
>  drivers/net/wireless/ath/ath12k/pci.c         |   3 +-
>  drivers/net/wireless/ath/ath12k/testmode.c    | 395 ++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/testmode.h    |  40 ++
>  drivers/net/wireless/ath/ath12k/wmi.c         |  41 +-
>  drivers/net/wireless/ath/ath12k/wmi.h         |  23 +-
>  drivers/net/wireless/ath/ath12k/wow.c         |   3 +-
>  .../wireless/ath/{ath11k => }/testmode_i.h    |  54 +--
>  14 files changed, 620 insertions(+), 82 deletions(-)
>  create mode 100644 drivers/net/wireless/ath/ath12k/testmode.c
>  create mode 100644 drivers/net/wireless/ath/ath12k/testmode.h
>  rename drivers/net/wireless/ath/{ath11k => }/testmode_i.h (50%)
> 
> 
> base-commit: 0f5fcb566e7e6c1154540280d334fc71f7cbeb63


