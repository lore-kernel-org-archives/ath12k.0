Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762C4C369A9
	for <ath12k@archiver.kernel.org>; Fri, 11 Apr 2025 07:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PUn1gHbKS749ntRb6VKuKFrfUDbD7bZV4DHLH4o54Bw=; b=niLkZonClaU/luKlHuSmKhJ9Pu
	Y78xsTWN9YqYGAQZHG/IjhjVGeLodl5nn583cbRztOpWAU0aq2GFGj9zkGTOHW+369hPUU1SBfCTC
	WCXmRXbbp5JVcbuHJsV9K2AALbj3SVjOXGGBUwEMO3sIqzhsKMkQ0v/vnQkpzReMgBEJTBoIpfp6U
	otvnOYNx2OUyEdApgJgBpR68sGBZlEw8Lo6fKWr86uCVtrxfqk9AHer0KNteFNgSt7AdMCRmvqQAM
	b/IbBqqso3o8b+pAOaZKzvSPq+aXhdSbrJOO+l5M1flD+7H0zO4CaSObUh9+n2MP0wPzaMNAJfFGR
	s/N5VsHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38qF-0000000CryW-0l80
	for ath12k@archiver.kernel.org;
	Fri, 11 Apr 2025 07:30:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38Jx-0000000CniX-3vtL
	for ath12k@lists.infradead.org;
	Fri, 11 Apr 2025 06:57:03 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B66bOC032539
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 06:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PUn1gHbKS749ntRb6VKuKFrfUDbD7bZV4DHLH4o54Bw=; b=TTwPkxWl1hUx6xyU
	0mfwGZe+7GT4fjmrG480lXGL/x7qgdhOFLRuiDMMz2xODQIa4NxfEnquy8nhLYmB
	ufz6BV7XwjqihrciKbiPwbfGUbdwHgOannDNdoBGSZ8WDMpeUqhsNLM2HOFSwuaC
	dvGw6EIUTnrNephCqxrS700gA5CnIOW0AWI6N+RXLFG0F1iEnmKAu8YHH3NkwQu+
	2GBvsQC1NphHfysrGigoEALfEmn2vFyuAEQucRq+iKuvY+4x6L2jDz8pG6VeEf4b
	UPR/CCaWZ0fCFWkRE5D3EJuto5LQpTXwNQIqsjImR/iDvNOCD+Qpdt3uksWnIy9x
	dsO+2A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfks9n2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 06:57:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22650077995so23458765ad.3
        for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 23:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744354619; x=1744959419;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PUn1gHbKS749ntRb6VKuKFrfUDbD7bZV4DHLH4o54Bw=;
        b=c1T56XCX25e3t+cqEwa9ExxDi2fBi09Gig1MiiVxeGY4Vf6NV/ihQNmTJwRffhf4HW
         +3UHybjOjuyghDD1VpIHJCtvASZqSiSJxG36f3AxBE51sD+bYKPwAivWgVo7MqJmsA9W
         qNjYQxTIlf8FIwRbOxAWmnTPy3DWJNbxgg0LMzvDrbupjtUaDS8xTf7B5JT96je9iUOy
         6lHZ6QE5hLNeGSQ4AADXgM5frxQXQnfG/81WRuOIZVVqgB0dVIfQxP/TUEgio0o0J9jD
         hNrDJ2cue5+WA8/CebAhOIzHkqCuxcNOxlgIVe2X3kx0LTLaMFqjNsGzNfqVO05KCKWC
         aO1g==
X-Forwarded-Encrypted: i=1; AJvYcCVdDXIskIqDWGzFIIn9T8aUPVluEqahKyxTk8JaYIzOeDJBDVi1QWh9Qj24x6OCqSqo2qIbNR4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxlLZTE71URL6xvfL6ePJobS/qInIrknC14kxmySxQ7TlkX+Q6B
	nJMCX4QU+Bbmd8lWJoE8Ml1a1pz4AQ0zDSG5P8PajtazsIFmv1kRgLZDmD4vcxpRPf7RtFjkGC9
	1Gc8rNOS+LMmczS5gBsKfAaga5/ERn4vfVlLsjzhvHif+YEQQv5dy5eJbL+6p
X-Gm-Gg: ASbGncsen7jkTfDDw6N7fxsgiCqYcPBWx0S6fx4xKicqhVI4G7emQ92drZZsZuyTRoh
	tMPfZFTt6WFrpUlhmmxZytqbPXZ7Up7A76lImm7EYeEpjy4Mjdsr/KC1yX2itrwlg37tvUJQRwF
	gqBqfZV06nQnW/NM9aeb48MmUeYFRx2seewhBjv5i0aDEGT0z/zdcIG1gDobsOoQ8U2sI1XKXRe
	USmwcBgZMkRzcoh+B5ctS1rnrzdgL7lAawow3KWo2ZVT59LHc58v/evNuIhxjOjKeswiVcrdA9X
	HYC9WblsEawSPYtRgPGZy1qSCKnvI2LMH1xWED2VIGNavRhy8/tuDw==
X-Received: by 2002:a17:902:c411:b0:220:cd9a:a167 with SMTP id d9443c01a7336-22bea49524fmr27303285ad.4.1744354619567;
        Thu, 10 Apr 2025 23:56:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQtyHgf4Pn+YDHWjQLP+B73OysFo7DYvxuO+8nIBcuP82X83Pqy5/aS8jTapIsaxjx2w961g==
X-Received: by 2002:a17:902:c411:b0:220:cd9a:a167 with SMTP id d9443c01a7336-22bea49524fmr27303125ad.4.1744354619248;
        Thu, 10 Apr 2025 23:56:59 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b65a56sm42019605ad.2.2025.04.10.23.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 23:56:58 -0700 (PDT)
Message-ID: <3694d45a-a1b8-af97-6db9-3d5b6274e8ba@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 12:26:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v3 4/4] wifi: ath12k: Use skb->len for
 dma_unmap_single() length parameter
Content-Language: en-US
To: P Praneesh <praneesh.p@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250411060154.1388159-1-praneesh.p@oss.qualcomm.com>
 <20250411060154.1388159-5-praneesh.p@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250411060154.1388159-5-praneesh.p@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZihyzIjyisq6kBiYMZ3VL5VR1G7SnJ9B
X-Proofpoint-ORIG-GUID: ZihyzIjyisq6kBiYMZ3VL5VR1G7SnJ9B
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f8bd3d cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=su9HG1vMjMrjkUACNh0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=803 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_235702_103527_FD00C01E 
X-CRM114-Status: UNSURE (   7.96  )
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



On 4/11/2025 11:31 AM, P Praneesh wrote:
> During dma_unmap_single() for extended skb, the driver currently uses
> sizeof() of the corresponding structure. When the allocation size changes,
> one of the parameters of dma_unmap_single() needs to be updated everywhere.
> Improve code readability by using skb->len instead of sizeof() the structure.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

