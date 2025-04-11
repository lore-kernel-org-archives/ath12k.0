Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F715C36010
	for <ath12k@archiver.kernel.org>; Fri, 11 Apr 2025 07:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTxAYR76YQwGa7rd/2XeqHZ0oIwh4VwoTWtUFb5rfp0=; b=We0zZbQqdwd5o62Yeh/uJdUyYU
	k0qYn5d3D3UFjSs8cZODVJPC9gGjJ6C0wJFjIPRutX1u90y09iy8NrQbm184VYxkEnE+dDP7nPyMk
	92sECs/Y5Yr9MvYMAsvNlFL89fGPuAEO3ODru89yZFhED5YFgLpGF/A1NcjpvsDZQOPih327DWI23
	9Bnr5vPAOIDoakIYak4WrGiHDOYFizqZ7Y7hmgB1bzHhRnCHAJAO8QwssiA4NM6edFYAe3boia6fr
	00XDmkH24PuDJy9sEFaZQnfJPR06QKh6tHjQn/HfGSF2kMDVA70BLYw7mSlE+J9sKnVZj/88mzTuP
	uryK16IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38qD-0000000CrxP-3OTM
	for ath12k@archiver.kernel.org;
	Fri, 11 Apr 2025 07:30:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38HS-0000000CnGO-1op3
	for ath12k@bombadil.infradead.org;
	Fri, 11 Apr 2025 06:54:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jTxAYR76YQwGa7rd/2XeqHZ0oIwh4VwoTWtUFb5rfp0=; b=WZoH9KRe8XhRclJ6Lk6sfha5Zy
	FuVcHTjwB/GKbzay+wTxm1/PC03FPHctg2uOanHZQuSkIPODlhpsEKgrh45nqt1r77x00E5oN7NMb
	QMpOisQmU36QkT8b70CoK+Jy6aKClbHNxKcKndQ1Y1tGdExIJrI0TrXOY5qHYzGmXxnF04vRW7qv4
	c5ki3o6awsjyrijFCmMu2/+ZEed0UsK5yj5jc7U6bwumdr12LI253g2XbSp+1IcSt3zimE2xCUMsz
	GYCT0kfNjQMg8NpRFj7yL78li59ppq3W6r2rHIW3k3fgxIAsw2ZZ1onMbKdCUvkIYFs1VhGzffn7J
	azxxOQEQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u38HO-00000008xNE-3tcJ
	for ath12k@lists.infradead.org;
	Fri, 11 Apr 2025 06:54:25 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5Ksj8013871
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 06:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jTxAYR76YQwGa7rd/2XeqHZ0oIwh4VwoTWtUFb5rfp0=; b=cS2JzPUKKfqx9Apr
	kM11DEx6n8CAvNvrOPQTD/Vvv6idp/8bvm9GGB3II+Q9iEZLu9wCY50Jh0mFfdve
	5jsUb+KYZa496OOL1fDIGpjetm/hM/5NZkMmGJHxMUWXzYG3ZhfssfkmyE4uBStd
	t58aebxAz9bIRGAEiB+vCnakcHIEx4rVA5vKHT+R0TT+DrLECbovHa6N0VL0HCd9
	bFXkwFRMs4eWShWJWeltpJ+Y2bwBD9QnxYGGrFjJEPFJ2FZBMnTN8WosvCH/hAx0
	gNVVdthqEGFh3y6WynLcR8/80sJV4C0hyc2IOA4ZTOWIYsfFu9joRw2ZFlouQMqM
	W31HvA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbehh2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 06:54:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-306b51e30ffso1503853a91.1
        for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 23:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744354456; x=1744959256;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jTxAYR76YQwGa7rd/2XeqHZ0oIwh4VwoTWtUFb5rfp0=;
        b=tvO//9kf0O1vFBr3H3C+Fi8ax8kmXDftW6I/Q9yOV9H/EMnPIFUe60HsErYOX+oYbA
         cntM/7d60PuggFhWsQGQ182YSUV6EQtSlpjJ4bPaynHk2vNg+6+Jz0wOFWGkkigm+ZD/
         HfC7TuIp0q7zJx5H9C9INvapqgLcbpT3mAijiNSO6e0PKtNBFrtt92dASyYkuHqczT/m
         6zFQaQ6pPQhQDdJeIqiQCD23PK+K1V+mb7RCDfnb1OlJSlu5Fcw63E/wX+Fnjhu8yJDz
         vP/+lAj/z/kxxciEO6hNwmJBgMLjlb4849eAhH1IEgbYk/NJ8FMRKyzZEzZFU2YX1paV
         MQBw==
X-Forwarded-Encrypted: i=1; AJvYcCU2d1QfK7htM92LIg5+KQ8/S2aiOFWtu6uVyCrqwvxb3NHSvfVhyE5F67Syeq72sdgkzrOJXi4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyqxqbWiAKiBfXXtc4I6NpFJU2/fc0notPoKKy5DDNdxUg0YqQE
	doxF/LCIZL5db5NiCYUH+bvPlj2Qa7+Dos1Feokbs2Vmz15GtvVIYahgzoFWddpsAo1pmsrjn9a
	XFwZIK2uNY7bKuWwg6o4lXkS2lveBd887JzBcEonZ8EO6YoZJ5KCBVDHacDvUn33ZasGl
X-Gm-Gg: ASbGnctVd7jcbXzgqJjDMa26DTIjYe3jA7PEdiWjGWf54OGFXEfVKqfZom39hxihvt3
	gWhfNehdthy0oWT1NITvEdyF3LYu7urrgDSOfrp989RtCqNIPAwr4f94QaeW6pOqSpH9SnklmWN
	vhhyHgqj5Yv7GjqQr5UbJH1kAbN2QJ9IPNSUU3zthk6cRXF6iD8/FkpbaW+CRnZa74SMs5yaS/v
	vP7wuEMjHrYVR3SbQPRvshmO5L6pkKfuYSiDxLZBPM24D/Ig283QiDEFh3uEokB5h2CdHSSy68I
	0Oa4UvU8zXsXf9E2EEP21K+eo1QV28zJH2Yu6dobefLf6Unr0TuUwA==
X-Received: by 2002:a17:90a:c105:b0:2f8:b2c:5ef3 with SMTP id 98e67ed59e1d1-30823670d04mr3285206a91.14.1744354455628;
        Thu, 10 Apr 2025 23:54:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeC58txkECQ9p8jz6zEL4PoGbXJS1At8JwDvfBzKEVAaeTIAQUE9nQTOZcb33MGqjOJuz8nA==
X-Received: by 2002:a17:90a:c105:b0:2f8:b2c:5ef3 with SMTP id 98e67ed59e1d1-30823670d04mr3285181a91.14.1744354455265;
        Thu, 10 Apr 2025 23:54:15 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df401ac8sm4710786a91.45.2025.04.10.23.54.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 23:54:14 -0700 (PDT)
Message-ID: <b93212d9-7dbe-d093-6f59-52f55e703f88@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 12:24:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v3 1/4] wifi: ath12k: Handle error cases during
 extended skb allocation
Content-Language: en-US
To: P Praneesh <praneesh.p@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250411060154.1388159-1-praneesh.p@oss.qualcomm.com>
 <20250411060154.1388159-2-praneesh.p@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250411060154.1388159-2-praneesh.p@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cvQiwJ2Lx-Dd2heY6ZBP9vP90u4aqpUI
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f8bc98 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=z795QP5gvOIlqM3UEbwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: cvQiwJ2Lx-Dd2heY6ZBP9vP90u4aqpUI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_075423_539198_EDA86243 
X-CRM114-Status: GOOD (  10.06  )
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
> Currently, in the case of extended skb allocation, the buffer is freed
> before the DMA unmap operation. This premature deletion can result in
> skb->data corruption, as the memory region could be re-allocated for other
> purposes. Fix this issue by reordering the failure cases by calling
> dma_unmap_single() first, then followed by the corresponding kfree_skb().
> This helps avoid data corruption in case of failures in dp_tx().
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

