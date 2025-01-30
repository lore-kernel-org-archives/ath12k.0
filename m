Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729DDC0218F
	for <ath12k@archiver.kernel.org>; Thu, 30 Jan 2025 15:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MzgOHo4QYuDJoNHCjDaUQbI1mKIJTtDENiPvY5AnCw4=; b=Gwrj56VX2AJtGOdq6SNu3GS3Ci
	toTS96D56kpDT7Ak9d0R1c5J1DOF3PIwQZYRyPPe1RnXYomX/h8SNAzb57NLzXE4+kqMppdqOOrRi
	Kh4kRETEyc8AiXmfEXpIAxpLe4r1DFmya7MSQ31kBx4MCHXI4oHo9mbMSqdWJJdKUk4u88+8oWxy/
	k74MzMX84YgtUpgfJt9ui7LKd2/llDVc45FQnUjeoC6bemTmhTU2COndUqkQL4a63oAdg8HneqbMG
	Rx9Br8Nbgc6tODQKoGuJ8clEuQHUGxo9Abs7fhofzIL+9z5QMOL1SZ5+qUG0mLvo17PlEybqcfSiW
	4YnVE2EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdW7K-000000092Pm-0NhC
	for ath12k@archiver.kernel.org;
	Thu, 30 Jan 2025 15:06:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdW7H-000000092Od-1tpn
	for ath12k@lists.infradead.org;
	Thu, 30 Jan 2025 15:06:04 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50U9IDZr012871
	for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 15:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MzgOHo4QYuDJoNHCjDaUQbI1mKIJTtDENiPvY5AnCw4=; b=GLG3dHKwZciIhzDX
	6JRpjvpLXljjyFU1FxigvCV+wfrBdLjY3LlAz8iVFSQ3BdU1R0gxPRnuGWgo1Sxk
	1dd4RHB8nS+FUCg/bQtYSSIF8xT0NHdlb1aVemfyv9BuOuI7GIYNDLqNiZFYuNfp
	VPYBJaScJuxLxXwebUfDp+htt6BTaUV7zXerXI8+MYiKOAWbWasFyPJ/QNWdzLWZ
	3UNWmhQJkfFmf/kK3LZiWI3C68KPB76bKx1Ogu0WZNDf2UPm66Z15NmXmtCYNGyh
	sDAcCABxRq2c6sMR28B7Y/nYFkBS+T3gdfZfcWVx7wnwCDptrBClDIN4PAVN/OQu
	Xu5iWQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44g6ntgskf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 15:06:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-216266cc0acso35135235ad.0
        for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 07:06:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738249561; x=1738854361;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MzgOHo4QYuDJoNHCjDaUQbI1mKIJTtDENiPvY5AnCw4=;
        b=lO56J9M8TkEFnGaf1i0k+PnhxnwNOtJQlPKJQObYfw0uwhkK7wGknGFBGLchNGzZDz
         J+esvuEjWEcNAszqRVKomn4ZCDcwDFEE2KodtLgxMRljOXvIjuj2Pi5mqkQJlI8F0/oN
         J5IB+OlghQMlgTOJinbOrK6E7OtTLBGi7T50ZQBW3fhS6aVct1zy11CyCIGdM5OD+scv
         pQPaZ8leuhwE2Rj9WQeOXu/PXxVkv+zIhBcOjcdhguPMOBVLOw4uikwsfwuFnt00u5eH
         j8R/NDMYrzqDMJeXXZKL5loyGUBu7DGz1pywqFuXOHVjmyRkhJTQ+cWgyS2xuf2XUP5w
         cQtQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2q6bocvCDu//Cxtof5d+ZlrUV6kSGuuFdPaJvAhCcyXAWN/V3Wxq4mcgwpkWQqRRvz6IHr10=@lists.infradead.org
X-Gm-Message-State: AOJu0YwB3NsyzUFCD4iiB9S/NEn/M95KmoivwYDdCZxE+ZmEdQZTyaz2
	l6mjEH3E8e6Z/PZG+QDPdJQuhmti+lcjvwOp1w8ufyRA2U2O/KLu5bFCuNEA/iyqBiaSnkiBq+1
	6iWMsWcObDWAgBoySVENVhBxfDMmGM83mTSemUo49PcTX82TUNFEF4318MauX
X-Gm-Gg: ASbGncurBKNHfmXwUip3+r7k+wnq+c72lxu76GiNh+B8dB99sJw2eAdHgX7k/sYQkGM
	+WPqXMsj/LGS29v7mob5hbD+7kAmcyMtVw4afSELyHCi6bXXDRqpX+vEcdEBei+DFh0IArltzUD
	VkzuZArzh7AuCI71zH2BqTR7vuRuPquDLkBcOVZL4oC2I8ENg7m/8YOn2MqCENIZie1appMJSyG
	IU5Vfg31MujvJhkFyYnmPMYZbKDuFnhgTz1zTl+Z0RUg/dDkA1dgvRXN3WjCSOuZPVwv8Z9+kCA
	l5ghq1HCdiVSF6/u2I41esnRnW4qqGTn/fGvAxQ142pDw+ucFLX6cLXtTEBT/OwzIiLIv80rAA=
	=
X-Received: by 2002:a05:6a00:388:b0:725:d64c:f122 with SMTP id d2e1a72fcca58-72fe2ccbc83mr5582699b3a.2.1738249560648;
        Thu, 30 Jan 2025 07:06:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZJOtFuOthZ1xpjDBt60v7h4CpA3Phg2tECzGuyjHVsd95FEciWhbGWItjAKyhqnv5DillyQ==
X-Received: by 2002:a05:6a00:388:b0:725:d64c:f122 with SMTP id d2e1a72fcca58-72fe2ccbc83mr5582663b3a.2.1738249560184;
        Thu, 30 Jan 2025 07:06:00 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe653a9f3sm1541750b3a.75.2025.01.30.07.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 07:05:59 -0800 (PST)
Message-ID: <b155f782-feea-4b99-8edd-e499e313294e@oss.qualcomm.com>
Date: Thu, 30 Jan 2025 07:05:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] wifi: ath12k: Avoid napi_sync before napi_enable
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Avula Sri Charan <quic_asrichar@quicinc.com>
References: <20250124090058.3194299-1-quic_tamizhr@quicinc.com>
 <dd37c366-21f5-470b-9d4c-24ae2808c4bd@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <dd37c366-21f5-470b-9d4c-24ae2808c4bd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KDDACQ2Ag7FT5mxdOp-yasewNY4DW-m5
X-Proofpoint-GUID: KDDACQ2Ag7FT5mxdOp-yasewNY4DW-m5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_06,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501300114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_070603_645509_E4993DD2 
X-CRM114-Status: GOOD (  11.14  )
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

On 1/24/2025 8:55 PM, Aditya Kumar Singh wrote:
> On 1/24/25 14:30, Tamizh Chelvam Raja wrote:
>> From: Avula Sri Charan <quic_asrichar@quicinc.com>
>>
>> In case of MHI error a reset work will be queued
>> which will try napi_disable after napi_synchronize.
> 
> nit: always better to refer function name with () at end. I guess Jeff 
> can fix in pending?

I fixed this, as well as did some other grammar & formatting fixes.

Please check:
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=a644c8784220b7d5dd0a10a45c5e6779605778a5

> 
>>
>> As the napi will be only enabled after qmi_firmware_ready
>> event trying napi_synchronize before napi_enable will
>> result in indefinite sleep in case of a firmware crash
>> in QMI init sequence.
>>
>> To avoid this introduce napi_enabled flag to check
>> if napi is enabled or not before calling napi_synchronize.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Avula Sri Charan <quic_asrichar@quicinc.com>
>> Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
>> ---
> 
> Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
> 


