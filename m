Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCC8C02180
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 19:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NLTcoE+VMXCCGxqPcej9L/vrCBnQDEflE4ZGobqOCPk=; b=SFU8kZ5/TJiIWY64oDXEfqty55
	gQMRNBXN2Dia6cHeRKJCNTffozB142Gh1kjrl7fUbefiTQ7x0RiVq0Qqd0FBNF+7mR765V43hc440
	NbbYZSXZxhTjNPBpqs2XmekZ3zKWM+PnYHMkXxbdaIACq7neDcs8IyAy1yDL8Vdj6HEfBK93liWEd
	4tZJFsH4EO3y6qnPHAZgXQBHZul7QB1cu3iQrSnUnSzrpK9POkKvLbXGFDeRSk6CGg/C1+oeGf+Sq
	QS59PvNh1fCG3Wji2y8jRY9iadpeNc38R/9dBzJXmnUFELyfU+h2dHYayMS2/7eXzb7PqiO6eIZ4m
	Np9vzXcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPlT-00000006JlG-1eLg
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 19:06:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPlQ-00000006Jkj-1tdB
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 19:06:17 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DEHjLS010612
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 19:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NLTcoE+VMXCCGxqPcej9L/vrCBnQDEflE4ZGobqOCPk=; b=bCOZDHhRZQGEaByk
	qes3l+6TUZWtrYvmBxrYPDVT+Bh6SBl05WvwaCXxu3Yt2vwOAyyT/IOKLQpddryk
	Sb8ubU97evsx+/48fVvXeEOaagkBv4xgIVEpLMs70pe2IuyP9QRrtGXxWpWgmfsT
	t4zh6R9ZF3Uovhj7HhOhWqAl6EhSIMF5m53a4R28hqRNybRvur+aDEfd5paM15kh
	j96IEN4t53iN5UiWimn6AliiWXwGEIoGq4YYtvAc4PbjMuJC3DY51qco+BmjG7lX
	PPq8w9u20Ng20bqYBwPYWJ6ZdM9YJjo695nZKCwDyQe+iKYM5njUbODSWg8PfCKs
	1ibcQQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4454fe0pv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 19:06:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-21648ddd461so90373855ad.0
        for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 11:06:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736795174; x=1737399974;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NLTcoE+VMXCCGxqPcej9L/vrCBnQDEflE4ZGobqOCPk=;
        b=gysQTS91H9EUqknMuzF+aySUMAW4KVK4AKhDaivoyHtYHTbpZRsJuGrANWzzR1hoi8
         zBaxGaJbqcLuA3hB5ISyx4EpLTMMKT+416ImcjTj5Cox1dh689ihrftXZJA8flhDbr3w
         jBZCRqPs1OmNTlkyUpWFTA2xukxU3F69uTZ2GfC1wVOOlPM8vByaCnIgL8xaiblLZeD/
         iYfOgZ8qC8gBF/4nTBVXhZwC/bbWwtFgHY/N8RqtvZRDvlgCUFpcIjBhzRxnTTBMBVVd
         +fA0bLc9w9p97R+qg58LSG+tKekj+eNylwoMRxN0meM/9SJkr1EEt4D5FeKgvRbYK8YG
         /0dA==
X-Forwarded-Encrypted: i=1; AJvYcCX6mCz+MJC2vaIGwSfmaPaRsmjnlvCnKb22q3D6/QPpI4auftU0vRoGZQY4vMbDDzwzDFqXyVc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzYs3xPk/r2YPDdlnIhvZreJ7HzPXpnfWl66Ze3/Nl1dGcNu8lq
	qJFWZiFk/ZUjPmFiUa/5y3A/kEGcUT/xvGSTX798mmLl2TNHeIjY6OyopTd8KYmO7FjQ1qRwTkk
	sxt3IJIQX01lY7q/Kft3pxYuK1iSzge7ajWjZ26GNTqvQp2dzZDV0c5q7fFfl
X-Gm-Gg: ASbGnctjhJvnV0wyTldo7afFajzu5Nx7Bww3q9Nx2a2O67LmXOa79O6b2PmNik5sbTS
	3UVnjqxMm0megBq5HXGn90JbuBXIATLDEQd1lZHyftALyFdzjgUXeQBkFrdt6h8KxZy7latGi3C
	s29A9W1Uhw7Y2D9Xpm56qSTdAANMDJTRbJuzNRKG09/7GUW7wGwFEHm6lU9NOgJ1LFbI6fuEuwg
	3bwO1ZlmmzqsS1U5eBThfoGupT2eCJC78Hap/eoPpyn2YTbWcjwJjxpLKtfB2KGh/lI/rD+Qkf9
	f9RcwaiIteZ1bDh+KkYw4FUk63R+hVSRG4ppbttfuDE1Hv85RQ==
X-Received: by 2002:a17:902:da8d:b0:215:6816:6345 with SMTP id d9443c01a7336-21a83f52430mr342206645ad.16.1736795174375;
        Mon, 13 Jan 2025 11:06:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeMax9I6qKpzBQRg5CFiWdhyJkcJ6xzUNwIWCsJGltsh1GaKBMXyzu3MAx1PZ9GVZ97CZBqg==
X-Received: by 2002:a17:902:da8d:b0:215:6816:6345 with SMTP id d9443c01a7336-21a83f52430mr342206095ad.16.1736795173831;
        Mon, 13 Jan 2025 11:06:13 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f234977sm56568955ad.204.2025.01.13.11.06.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 11:06:13 -0800 (PST)
Message-ID: <305d7cde-adb6-430c-bf6a-e0034771ad9a@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 11:06:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] wifi: ath12k: prevent race condition in
 ath12k_core_hw_group_destroy()
To: Aditya Kumar Singh <quic_adisi@quicinc.com>,
        Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Harshitha Prem <quic_hprem@quicinc.com>
Cc: Kalle Valo <quic_kvalo@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250109-fix_reboot_issues_with_hw_grouping-v1-0-fb39ec03451e@quicinc.com>
 <20250109-fix_reboot_issues_with_hw_grouping-v1-1-fb39ec03451e@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250109-fix_reboot_issues_with_hw_grouping-v1-1-fb39ec03451e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2XVCDEAkz7rDO9YvUBn0Qjm6JSdO0Ndn
X-Proofpoint-GUID: 2XVCDEAkz7rDO9YvUBn0Qjm6JSdO0Ndn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=963 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_110616_504872_BF97AF06 
X-CRM114-Status: UNSURE (   7.97  )
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

On 1/8/2025 8:25 PM, Aditya Kumar Singh wrote:
> Currently, ath12k_core_hw_group_destroy() accesses its members without any
> locking mechanism. This could lead to potential issues if these members are
> modified by another thread concurrently.
> 
> Hence to mitigate this, use the available mutex lock.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 6f245ea0ec6c ("wifi: ath12k: introduce device group abstraction")
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


