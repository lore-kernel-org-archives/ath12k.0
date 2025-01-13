Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23AFC02183
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 19:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8GDh/3Mropk8svO83IQMbA/eQXru3jFiYV22yyRJ8u4=; b=2C1SJpl6l5vkspbouv66Xpc0YN
	tVhp3GdE5AU1z+jMkM9L5GVxh3mnVYpsbXCOmjBbVl7tATZwxm6dhlPUNtxE4XjpppP46KFL5GTgt
	gSHSuxw4ee0y0iXOL4EY+VKipNhQDyXV3S8PSbZNvCYiyIp+9C91IhnjvUd5QtBdEfLSfumog0H4L
	27M6W9iQVxQgrPz2g13erJZn69WYb5mbB1ul6+MR1lH3Zpq6qylztg1ZLUvcsQaBav2SeKyhNpEVO
	dVvg3+4tg7j3VsUxJwCjuzwjq4J+2vxz4khHAe/eOheiLGF4iGF5YFcZWI26hP2PCP6NJ8SIkAQYt
	A4djajpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQ2z-00000006Mqx-2f4W
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 19:24:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQ1P-00000006MWK-2Nd5
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 19:22:48 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DE6NtR031364
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 19:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8GDh/3Mropk8svO83IQMbA/eQXru3jFiYV22yyRJ8u4=; b=iZu07CugBvnR2gr5
	FKLiASmW/OmMklmxyjRx7WiUnsA4Dm05NSQ150m8sKKWkT2roG9os5K6cxwRC0Qp
	nZ2+nUUejjwzC6JzmzfrUUjLYEbNcR+xAXCJap3tb/MjfIlpA3OC+t4zmxo34sC+
	w/dYW7KnkRWNDeKNXhtBgwIBEj+ILqua6I8ZQgN0TTiUETWUvlskupIZoXbNZ4k+
	xDeEsdLO4ixfjx3zj+DZvcBpmBTPX+bNU6EvF6xnAczwLpyMIcwl7/gBS7BUE4tS
	M29NTSx/qrOlJ2hmX7vdciQ6jMePpMapjZamd5lbJi3GRMRZzFswn6u4uQYhc2I+
	AydICQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44549w8s8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 19:22:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ef6ef86607so9561126a91.0
        for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 11:22:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736796165; x=1737400965;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8GDh/3Mropk8svO83IQMbA/eQXru3jFiYV22yyRJ8u4=;
        b=Itmn0y/dIeUzjzQjMrBK/eUv8uDDfqU5gBnqhwPcA+vxSgVjgb5aUxYP/Hah4Ur9cI
         +ig4cI7rrSFa6C1lckGm6nk1VGxH1T7xRpQAOlmDla3nNZtFGuwbnq/evSaMcykNSVg6
         scuKdG63aRFLqnRhWv8pFkv1dDp3s45JSix/zuDzwmkbCaC8cUKCYNkEXIgrskEPkIEg
         pBuyybPsis5UbtXI2+r5SxfO116L8ym4chplzxOKrOVh0ECQTD+voOZnGqKtGaC0EFcK
         gIzAjfrObxm8v9sOLTwrbtBSJD8Iit0lrPavWC0GjdDmVl9vGoMM63qdzAr/2pfCJ+fh
         Bpmg==
X-Forwarded-Encrypted: i=1; AJvYcCXEY+zYbF1Jr4h7bplb5Yj/xeczy/I8UQwPDBU8Ymih/GFMiZeUPW62EWK8rvqW979+kuyXBbo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxlPoeU+PKdKg936K2Rv1W1M2lHaGhtBHsYP/v0NsFQ7tvZd28n
	+V+XC/YE4JbpZd8EMFo0jTbuPG3mRbbbW8uECaHkb+rNmO9XCVyoAwOdzZn+FLodqJW1ro1N4E3
	yo4wYOO8ESzRFCGqXnos+a8kaL7k6Gs/EYE2+tPDgjlP2D3d9hYwQWjZudZOJ
X-Gm-Gg: ASbGnctjrjME8prmDqKbobTeQIxma8kW8+0uwtjebbn8zzwC2k+DbbMjdoJ9C7bUO+N
	Oc0i4MD+pmpeYk/fkvgDM4KSDf1qH4a+ENXwdfQMBr4LycszVYfwlL+Lh+cdrLVo6Q+Z/g3uaaB
	Uxm+ESOcF+li9himd4UKczNjqOoFVhUlzqcrnuqPMvUTFEO4jw5qgo/ucexK3VXjC1UlgGVmfFb
	a3oseCHf82kVkl5Fc8Jjhktpe/daSsHvQFFWn6bkGr9GWwz9ObAr9kCRidVh6jjoiLn7qe25rCX
	vphTWBh1WlUq4O/oEbqTu5g7KlZcABJAYY/gBmBYbcir7NI4Dg==
X-Received: by 2002:a05:6a00:4651:b0:728:15fd:dabb with SMTP id d2e1a72fcca58-72d324df33amr27007538b3a.8.1736796164823;
        Mon, 13 Jan 2025 11:22:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhtJVs73Q1pdcrf83MYihvTQtpKHnSW5FChfr4I6BTVHklM0H6RMBeISqIIO0FY+xsXriGFw==
X-Received: by 2002:a05:6a00:4651:b0:728:15fd:dabb with SMTP id d2e1a72fcca58-72d324df33amr27007366b3a.8.1736796162997;
        Mon, 13 Jan 2025 11:22:42 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40681b25sm6415544b3a.149.2025.01.13.11.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 11:22:42 -0800 (PST)
Message-ID: <f3e8a292-9d2a-40df-a595-bc0917def320@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 11:22:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] wifi: ath12k: fix
 ath12k_core_pre_reconfigure_recovery() with grouping
To: Aditya Kumar Singh <quic_adisi@quicinc.com>,
        Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Harshitha Prem <quic_hprem@quicinc.com>
Cc: Kalle Valo <quic_kvalo@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250109-fix_reboot_issues_with_hw_grouping-v1-0-fb39ec03451e@quicinc.com>
 <20250109-fix_reboot_issues_with_hw_grouping-v1-6-fb39ec03451e@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250109-fix_reboot_issues_with_hw_grouping-v1-6-fb39ec03451e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: u8xpFSU1-BWKDqrE9uK_-nYMfAD9ZI77
X-Proofpoint-GUID: u8xpFSU1-BWKDqrE9uK_-nYMfAD9ZI77
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_112247_743824_514BB10A 
X-CRM114-Status: GOOD (  13.15  )
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

On 1/8/2025 8:25 PM, Aditya Kumar Singh wrote:
> Currently, ath12k_core_pre_reconfigure_recovery() reconfigures all radios
> within the same group. During grouping and driver going for a recovery,
> this function is called as many times as there are devices in the group.
> Consequently, it performs the same reconfiguration multiple times, which
> is unnecessary.
> 
> To prevent this, add a check to continue if the action has already been
> taken.
> 
> To simplify the management of various flags, the reason for hardware queues
> being stopped is used as a check instead of introducing a new flag.
> 
> While at it, also add missing wiphy locks. Wiphy lock is required since
> ath12k_mac_drain_tx() which is called by
> ath12k_core_pre_reconfigure_recovery() needs this lock to be held by the
> caller.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


