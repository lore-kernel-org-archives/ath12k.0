Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36685C55167
	for <ath12k@archiver.kernel.org>; Fri, 31 Jul 2026 17:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+UYXtQeeCRS2jLc24ad5pjLwNM3de+m/SGkFAVHwpU=; b=gDYBOaKGLeXxgmjawhqglGMZmJ
	gBzNLXa5hjmiTMXSw1ykc11Ygq4flgoimCavbnN6avKepoo/lCG+a6dOI4bF7FViv+iY1tCmwKmx3
	mvF5BdkME9TSk5he/KCWwOkAsxpEb5OgR4OrFMRMQNmjMwk8ACCyfdYXrURnwDSWJ8GtMUIdBfwVr
	4lgb8FxVnGkBxoqX5P+wBf7iRv4U0YnSGqu5C/SBzeYbBALftnkMUYLtJszN9JHLuCbB05W3T+O6f
	uwRdGi9CTybzstDo6QtcyJKVwvqd2d+GrfsUaAbD24Kxcxes4RK+0kWJtAQr7o9X8Z6R3vVkH4kSL
	s2cbQhPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpr1L-0000000DGDe-3F7K;
	Fri, 31 Jul 2026 17:27:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpr1I-0000000DGDG-0OTW
	for ath12k@lists.infradead.org;
	Fri, 31 Jul 2026 17:27:42 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFOdnI507897
	for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 17:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e+UYXtQeeCRS2jLc24ad5pjLwNM3de+m/SGkFAVHwpU=; b=mbNMMUF0l+wAPdbl
	e4IKUGRwE/fgSmROFnxeF/rdQTjFzRSJ/uWsgx6eIiRZC+s9TEiY2loDFBPhY+bt
	uXAYjGwH/vVHpe4OpQK/tJJz3fUCOVm4bejHCLnDa+N3wKvqLSinvJ183esUSNe8
	XZPWbJSnD1u4HjK9znfvfp3SHzNH5VFHbczPsnGfiIBwejdowBNUrU5hN/1qwV2G
	9giM5na3yMzqBxaKQ3bHWv+hFVbM2RW/mz15TfiPhzryyjy1lvhZrnm6dEQ+7pOD
	GqHXDoG6/KLdSGJw5kpQsQHOxw4beTkd5W6tm+kqL2C+TkF4er2Y5K+Yvb10lYnF
	ktsy0Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru131m0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 17:27:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfbf3e4a63so32578875ad.0
        for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 10:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785518858; x=1786123658; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e+UYXtQeeCRS2jLc24ad5pjLwNM3de+m/SGkFAVHwpU=;
        b=VWNIjhydLvtvvl5wkhvYMILg6AiwZ2xWKfzePNsADzFps9860t6bdFwdBxdL+PczMG
         oLFX0lUZAAQdJYSXNTg3tRr2KirgZ/BZF/aV9C7k607uqeFaM41pYLdlmTTXh6f/dWDg
         zP7t78Xm67OXgavKmaWs1D3eL+/9MgMMkB4Ir6NkFS77HPBz8TSYDK5RTrZZxVuwUrLR
         FBT/Lk+s6/OlTEkuVJOdtnLj0sQHrV38Xb/CDJzXK1gN5GCrt3AWMXIES8CjJvvTalRD
         GxUG55J86XGK51m/IWUIv27gKtHhyaFiRHKMpScv1IjrIZUUlikefCM/nVtYMG6OQtSS
         upzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785518858; x=1786123658;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e+UYXtQeeCRS2jLc24ad5pjLwNM3de+m/SGkFAVHwpU=;
        b=AFAMLv8ae42nA3xL8cjUjuE71GSJOZ/dpvrIvNobZVo6SmZwsWkoOhlyUtxaN7P7cI
         nX7i8XZPLIjmQWNZzEdU/cMsReA9vmbr4hB0A94/O2Hk2Aufv/XubcL28ptLFlfX0Ca1
         EKb81qiCzfGDd4tTmdehaAsmceVE4EYEJbQiW77O1WrDpzjAKXeU+7dFBVJ6cPKZpGYL
         BkfVTYJwHv5nget/g3CdjP35tyFFfECYFiOJsrJCf+e4SQrYBLAvp+b18vP6CmJ+ieVg
         hSZQU/ST5ADt+aI8S3cMsbQQuauNo5Uoc6KKLAJOunBW55dILKemztRzFPRbhwGTk7sI
         CLcA==
X-Gm-Message-State: AOJu0Yz5hGF6HfkmFLRZ7FzVxhozn5eItlr/sNVpOCCFO2pKcE8ki/6h
	KLz9RU9b7heiv7zRWh3BjWb5LdktUKh7vyDGjAGZIc8Zl+j/Vh7AIyJYriwGG27qoBcEPd0UWz+
	Ujt/WBGab1xc8i4dOsj78qdKoy9DzyszOk4o2/q4/RK9HhfswoAjxguUSq8dG9hD2
X-Gm-Gg: AR+sD13TVyjSHR/D9y4665lGfLtB8Kg8IKaSQdka0EIgojgFmdi7x5BcKcWSpIbK3W1
	0NlcBTRPzihrh0GIAj0bn2XxFcCyk48VvXoNS6kl5qOUAIkE92shz3GcFB/8N+DYyB3T/UAO+MD
	P/meElI9Nwp4apcMW9EmE5W2bdfUXlGK+9g+hIO79MMW6vEfFjgi4SUHXZXwq9OUOGdQsXOUf56
	9kALwcdBaqZRmOks9XcVMtZoK4jbivNcJN7RHdDvPw6H5WRPSj3SD7Xaqv1/LRK4VjzUxBcegkS
	csqzzC/AaYxvTLWRmoG9fm7y+7T/usU5uI0tWEMlYnRxzQ9ALNptwo8/XKAAfPej0ZKVbMJ4R0M
	kw8Y0VVXzdGuT/7xFosuTyvLEzCWxQR6CL7iXhn0z3EYvRfCUthdDNuNf+JW1
X-Received: by 2002:a17:902:e843:b0:2c9:e961:d256 with SMTP id d9443c01a7336-2d0523b7dddmr7626905ad.27.1785518858135;
        Fri, 31 Jul 2026 10:27:38 -0700 (PDT)
X-Received: by 2002:a17:902:e843:b0:2c9:e961:d256 with SMTP id d9443c01a7336-2d0523b7dddmr7626635ad.27.1785518857592;
        Fri, 31 Jul 2026 10:27:37 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b0ea002sm8396045ad.49.2026.07.31.10.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 10:27:37 -0700 (PDT)
Message-ID: <440d1bf6-4b6e-4c87-b80d-4e6dc1a65639@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:27:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] ath12k: NULL deref in ath12k_mac_op_hw_scan() when a scan
 is requested during firmware recovery (IPQ5332 + QCN9274)
To: Kamil Bienkiewicz <perceivalpercy@gmail.com>,
        linux-wireless@vger.kernel.org, Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org
References: <20260731094141.2410630-1-perceivalpercy@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260731094141.2410630-1-perceivalpercy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEzNCBTYWx0ZWRfX1rRNpqSDkYtI
 G6g6vzDT+4nwSI1rIHQhpX3mEaENBK2LOz7osg4GKzMXxvLz+hULz81lyDYtryDF2Q1kEBb4V1O
 Q6SykSL6kzn76r9LYkVSs60gfygW8y0=
X-Proofpoint-GUID: onnN9MPg9KaexjJ1gmM3jsyhXGVRvjPS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEzNCBTYWx0ZWRfXwiLys5Elv0X3
 YAc3WSU/bHm+2/uKoEraWpdN0nGcO0JZAQ1Tl92xM9q0e5SnReqqFGySLWFb19BSndQ1JdnYn6U
 gXT+T1Nz/8pqbhzoYZt42DXXIL12KYhvvMmKtLg7tboo+rCgMUPknyA3YKV6j53IMn9+uIgq2a3
 NPJ1+OoaKEcJPkwPTfLvPpZ/V3pWKsc9WMMI80nHo+ihiP9X99ayWpT77sof+3VRJd4QG8CUEkj
 KTn2DjxObBwk1og3KGhiHsMonYJ4tWokRqtBf0S+4m/lcE+opH0PpKa+W0rGLcn3JYk8Ceyumt0
 33OUlr5fCy/t5NBxoRcZIg2B18hCJoz3ig47jSsAGvbICt3ttUlHbUog7p7/f6IAag43bgT5ajD
 EB34vG8unoepj8ZvhH5ZxwKs5aA3OGk1U+hEcd4m+gjBHYyJVlqLkguiqPd/1Oy5BxcRX95yNHP
 o909c9G/U7Abbz7fCIQ==
X-Proofpoint-ORIG-GUID: onnN9MPg9KaexjJ1gmM3jsyhXGVRvjPS
X-Authority-Analysis: v=2.4 cv=CYI4Irrl c=1 sm=1 tr=0 ts=6a6cdb0b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=sTRtGAPE7L7RgN1B:21 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=TK4Lw8CIhuz7GhaftzcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_102740_532224_304568F0 
X-CRM114-Status: GOOD (  10.64  )
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

On 7/31/2026 2:41 AM, Kamil Bienkiewicz wrote:
> Hi,
> 
> A scan request that arrives while the device is recovering from a firmware
> crash oopses the kernel in ath12k_mac_op_hw_scan(). Because the oops reboots
> the AP and the same firmware crash tends to recur on the next boot, this
> presents as a boot loop rather than a one-off crash.
> 
> Hardware:  GL.iNet GL-BE9300 (Flint 3) - IPQ5332 (ath12k_wifi7 AHB, 2.4 GHz)
>            + QCN9274 (ath12k_wifi7_pci, 5/6 GHz)
> Kernel:    6.18.39, OpenWrt build, ath12k as out-of-tree module (Tainted: O)

Unless you reproduce this with the upstream kernel you should be reporting
this to the OpenWrt team, not here.

If you reproduce with the upstream kernel, see:
https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k/bugreport.html

/jeff


