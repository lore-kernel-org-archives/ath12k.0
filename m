Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFAEFF8855
	for <ath12k@archiver.kernel.org>; Tue,  5 May 2026 15:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1rLBcVog39kWLCR+ZxmwRRD77wBGRu+MM0wrGw6qajs=; b=a1EAljKtxhNv/ALXvm4SBxKphw
	4TY+sgkKaciP3XLdMfM/6M2oqRHru0pcZw+lRL84r6tgshoFcanRR1EVuRiiSCWGJxZ9ZlbtMnrkc
	VUgzEkRk+mh9ebp6PDNFSZ7H/Q/9z1PgnuW/26ZC8//pRKjrEGHGDNQ05Wiku25iXkt7QMWHF8Cvg
	Ya8uem2m3BKzwS4y46aiuj/52TDNb6ReauwjF9S2oTex/RlDojIJNqcB+0XinFmyfhCCmX5nbOhgn
	Wra6YdnCNoDFoAFthUVLOq8nIRAc/bjxxfvUJA5M+ch8Ywi1eNMlhzQE8o2IGkV0SlriT/Aw7yjbD
	AZnN/ydg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHqq-0000000Gg5X-0jN2;
	Tue, 05 May 2026 15:38:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHqn-0000000Gg4l-2eZv
	for ath12k@lists.infradead.org;
	Tue, 05 May 2026 15:38:22 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645Do2K23475717
	for <ath12k@lists.infradead.org>; Tue, 5 May 2026 15:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1rLBcVog39kWLCR+ZxmwRRD77wBGRu+MM0wrGw6qajs=; b=pRpd7f55OeqWMiHA
	robXspV00wdcYzB8AwEydLhJsoGZkVEYmduV4+VI/wI9Gbw7df59nOPLfuHiiWzU
	D/JZr85rfKISovSqTYsZsu8gPtac3qYKD2Ml9RT9/d4lm+V/ktEdLNIF0Dr+p0vZ
	T/7jBKIh9kuLglikAwqU3v8VyhyuSjWV5KCFbp1IJ7D6lIFACP/oXRrAqgEI0Edn
	9HItk/BX6IUFm2pg8y0Z9gMR/SsMqaVB9jFdFmDWuMzggl929UUdbxjuiXeqlQNb
	62YNQzLLSgmYK10p1LrJUieNc7ckorPZsbwc2km0ZCXQpDkNMuZ0fhhHuBjlc64q
	7pcw4g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyhsgrerg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 05 May 2026 15:38:21 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ee5b73c5f2so10535413eec.0
        for <ath12k@lists.infradead.org>; Tue, 05 May 2026 08:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777995500; x=1778600300; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1rLBcVog39kWLCR+ZxmwRRD77wBGRu+MM0wrGw6qajs=;
        b=kS7oTy+rose5PNQZdRnzf3HZHscj7HoyxPz6BOWPoi01Elw9xpyWHoBV/HMYBoZeKd
         RX/BQcubW6KYCd9Yp8p+7znFm1HqCxssYzSOvMDqQyWfGnE5qu92S/eTTtODHoHijip7
         W3tMAQ+yockIEZqYAFIsUOvRf3Z6yOBaYR8BZpryxTSMGkPcKAOZ/PKwLBH1uca7nAXI
         HtDgws1+iJ5LOIC7H658Wmxq7IVL5jqEwPNhSNXaAlmmN4aodP+XjeEH7uzNuX1mxZoA
         DvvCUv7pdepEU1WILUCLzkZb37aD3coI07YR7RpV15kFwoQOhl6wK3nZUJ5ZJw+3nexF
         uGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777995500; x=1778600300;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1rLBcVog39kWLCR+ZxmwRRD77wBGRu+MM0wrGw6qajs=;
        b=Vjgaucb7oJDG6anwY3m199hjoY2tVyHjbWTixqsiBxejkHvvVx6pvKUXbAtAkNUaQr
         8lmEegEjoPXv+5akr5/2DM/qhC95xtBknY3DYi7w+9LhnyNqxl2llZtUApn2lNfPGvRW
         dK/F5as6Ow2G0jEMsT2f5Gzqk3iG6PMqU9LlTVup1UFSinubmbisy4sBVlA8nQyidI09
         zEx6P3a19vWJ6mz+poYW1AlXtvuNpxuLLdgF2EXlWTCGJjgkPgiKa0gzZ3EkbBBWXywU
         HJrG76k/PTnICr90qppTGgZbiOftfB7d23zIYE7wDWIiX71vmPH6KRhOOgi4QDgDtwM3
         3IxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+swNLkisxeSbcSXj2vu+SBblxcbIt+d+/euDRrdndDsQ12RHJVdwG9tWS+UtgmN9euraFeFfw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzdEOHVUWHA7wMkpBQcJgLs9GJQEQxPz5k4XWPw6PrHTi6lCt1D
	FUhFUqfSSWgagGNQVMLaIQAGKBicjiQuDUwZvexQ63aYYjmlxpkmfnIwDby7dJFNIV/rxX+jdjH
	00Bkq7gXpwXl13HC7+WXDGA+v7SLa45s0GRQ8QWn8gyzsmo0lI7AyYse9zGc+uOO/
X-Gm-Gg: AeBDieszrH044iDz0/evOCESumT+1wxvrNIKl3ehQUrgHWDc27B/nBR80uXOlNFi6PZ
	5tcsTgrLcxsbNgmsGy9igGqfj0oIF5dYM4DBYhkThVUCL1+tfDzVhgWtD3rghjJ1nfF4CSzbCu/
	Xv+N/swlkeK9dIAV5XwdseaNjdSTCO9sJw1Ato2ZCzaoA6aWkvodIKXarazjJ+p25xGit4djC2Q
	sN+tJFg/THRqqwDlJsGGrPfEp9PLVYGvCxdDY/qARJVwt9DCtJ0H5+DonXdyr/Tvq+Da7L67nfs
	oaLrdBy/HcLGKAzylCmiR4e9nR6tuHxvLUTFEf9xB0EhDtKZYVixt3pXeAk3oreR3BBm5WaWgVy
	6oLO4W48GkA6FMjmptAq3rK0V9+9+qEAxKHY63W6kmt2CLcFCgxBM7+rMniL+Ls6eyiTuTLAzFG
	WG8wIoEgFgZsyKwwbP
X-Received: by 2002:a05:7300:324c:b0:2e5:8ec2:82c9 with SMTP id 5a478bee46e88-2f409ab8996mr1901183eec.26.1777995500347;
        Tue, 05 May 2026 08:38:20 -0700 (PDT)
X-Received: by 2002:a05:7300:324c:b0:2e5:8ec2:82c9 with SMTP id 5a478bee46e88-2f409ab8996mr1901151eec.26.1777995499652;
        Tue, 05 May 2026 08:38:19 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38e71cedsm24932550eec.9.2026.05.05.08.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 08:38:19 -0700 (PDT)
Message-ID: <74ea0491-38c6-4d7b-8250-b18dd744c130@oss.qualcomm.com>
Date: Tue, 5 May 2026 08:38:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: fix incorrect HT/VHT/HE/EHT MCS
 reporting in monitor mode
To: kwan1996 <laicheehou9@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260505040920.57521-1-laicheehou9@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260505040920.57521-1-laicheehou9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eaj4ljopazm0IQVNMLNAk4NlLrJXe-zf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE1MCBTYWx0ZWRfX1WBYszmLD3Av
 qMv//dMVLXPX8VgJ2YPk+BjhW/I8l1ZSZmr4SMwmXQ1RifunR9H96+Z3o8/2/9iA0hZ0HS6BpO1
 GpOJRNcjIjjh7UrfcCd+lh0MeNmSbiTAL3yxxUItrvNiNcpbOABdh0+FjBi7bB3Qsxxse++sLLH
 UAaQKpuqYDrbll5wyzsLTHFle9uibcj1GcqdxvCxLswJF/qwGjdJWl2sJula2XOiI6peoXhBYXw
 reBukz2VkTO3Oah9U+dtDaJu+d7S+sTTeYA038DnKkLLl7QxFtVWxVyhWDrb5p7jo44I0juvBLi
 tlYi6Ae1vqvIgQGfse5uTRl5+i5D5a7nYL11h2eGFYj7xX/iwRMJxoPv+CrKd8gn4FPk4Q8inML
 Yerrd/dpt1m61xiP3QthEedqokQvUdzAvClp/IFi+Rxs3C17soxl6QCfIHEnLdt6Ru+RarSSdYt
 M6fOZhw7Fw1xhyZmkBA==
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=69fa0eed cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=yOxJTiXU-Wkyv2yLSC4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: eaj4ljopazm0IQVNMLNAk4NlLrJXe-zf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_083821_679009_83BFE321 
X-CRM114-Status: GOOD (  10.36  )
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

On 5/4/2026 9:09 PM, kwan1996 wrote:
> In monitor mode, the driver incorrectly assigns the legacy rate
> to the rate_idx field of the radiotap header for HT/VHT/HE/EHT
> frames, ignoring the actual MCS value parsed from the hardware.
> 
> This causes packet analyzers (like Wireshark) to display incorrect
> MCS values (e.g., legacy base rates instead of the true MCS).
> 
> Fix this by assigning ppdu_info->mcs instead of ppdu_info->rate
> for HT/VHT/HE/EHT frame types in ath12k_dp_mon_fill_rx_rate()
> and ath12k_dp_mon_update_radiotap().
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220864
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ
> 
> Signed-off-by: kwan1996 <laicheehou9@gmail.com>

Is this your "known identity" as required by:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#developer-s-certificate-of-origin-1-1

/jeff

