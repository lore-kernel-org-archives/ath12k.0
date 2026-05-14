Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39830CD4851
	for <ath12k@archiver.kernel.org>; Thu, 14 May 2026 05:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5XMCJRSZDY0XJc+QOdRMaoXWGMiebQeGgCNmc9Dhbs=; b=DQtEUS495ENgiBsBWuKwPRdOdJ
	v1Ucl6d+s2/shNEGKXiiwqa/WjNu3AAWb3cA+R0J8ImLywKx+mYPIu5ThUbknC8EtbZTM9a1Lw8L1
	pqSgOBK7AQsU7Rp0fHaBv8qKsFArqYnA3zNMv39oNR/psF3YRiyNkywOSjhB7GUhFyew+OR1qpNUb
	NnCTCA6E9vtTOTetP0Xy+3jfNfAp83+37E3BK4biM1JcQn8xPW+8WBFnKRf3BsQ4Zs0yCl/67y+xY
	qc1+Ou/GTfYaPJU8v7yaIiP+zh9VEoXRCmKdgt6HVukDT24NMI42mUNRNWen6RJ04SbuitrEyozhp
	O5AQ+fBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNOO3-00000004bT1-3K2Q;
	Thu, 14 May 2026 05:13:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNOO1-00000004bSf-1nfR
	for ath12k@lists.infradead.org;
	Thu, 14 May 2026 05:13:30 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E3c3YT3430137
	for <ath12k@lists.infradead.org>; Thu, 14 May 2026 05:13:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/5XMCJRSZDY0XJc+QOdRMaoXWGMiebQeGgCNmc9Dhbs=; b=YVTUu3HB0OTW8g6S
	R9JolPsDru3tA2U0h83Ia7AiNOV20/+g7nHPh8dtQ64n/gt9wr44JLeIe+Ttrodx
	1ZMGUHQzywewPAW1GQ1l4bM9ATYLhgiUQ6gpeH/7JXBwLIwQSDpWdbigaZEqhAtR
	PMl8XvAlReEfSe4hgiJ9wwhYSG1WleqysuXTTSAqPpMtP750KWrxGPtbjcq4FUB4
	5a+Wrwk8rLTIEEmuT0b6ibbziYLc6d/DQR3WhcmOOUAbs6bO47rd1TTsnLDFN2LK
	0dK3UDAlDMtgDeFSYLOmrhofF9RP0UdOMOwepIREPFNpfHGszISEUPJNUgOkV4jE
	3STyjw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmckr10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 14 May 2026 05:13:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-368b0dc7731so1826955a91.3
        for <ath12k@lists.infradead.org>; Wed, 13 May 2026 22:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778735607; x=1779340407; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/5XMCJRSZDY0XJc+QOdRMaoXWGMiebQeGgCNmc9Dhbs=;
        b=AIXbFRLUbOTR9M/7/YUFTGtlaMeyHM62aJSqGxrz7u9kr/o+zArYjCqk7OLPVUHg4l
         VrDKRJ9Ol7pN4La6vXH4xfX+5Ddq7f30m1RGcZFPYUBnXK3JWFqyMSbw6nJ+nkNRVltU
         H/ZfBbJep9YqObY6pWfokdk2GchD92v9KFXQQyg4chcfm5hacAgrzu6cNuSTcIW30oAf
         T23FNpS8werzOttDNF/ktnYOCopqIn5FE1y+0M1CSBiOsPRAhbYZ2I/e1iCphEkzwxBN
         7v1IYwP/VoRL651lHFd8jKEyH6FrAqXNk4vszmCicjkD/VV4dgFuoNfK9uc0D3GnINnv
         sZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778735607; x=1779340407;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/5XMCJRSZDY0XJc+QOdRMaoXWGMiebQeGgCNmc9Dhbs=;
        b=AboE7nmHdX5D4aOksPvcXB7lUxYG+1yFqj0kqAE8OOz/Kn5/Q7lYN0gl85b8bGgF2e
         NBef48TxXrMqEibm7utkhikW0dwEf43p5TLt/sJDILlM1NQ6zt8rM6OQm4rrq69E19SK
         XMUFBH7g0PEgJnqVkRe5hFZCz+y6WgyBQjxRqDuzfgI13uCkcspe3emqWO1wGLpQks74
         DCUw5Tz+4ThT1J9eDdGJZjt1n0v9Sx3bQjGB2CEYs9lCqjZnWKpcBFFYNlbPrj414mNQ
         +QVJat5PwkrQ8QPqMUwYVRY384XuZVoRJ0Ttk/KuHCe0oxgc6fUx5AoUsSoavjZuBfyL
         87Rw==
X-Forwarded-Encrypted: i=1; AFNElJ8YvdiYwRg96u7XQXoTrqLjrXub8zSPdjyzlSZhcdM7WyrIDaqlVyRmrYqgLGC1XzDuzzDZSR8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd10jOk66xcd2GjTKFrSAGM8l2WHmHhfcS+mzx+oqEv9UE5nQM
	6hUGOLvZ9N/U8U1KP09jDHHD2L44qMcu1LrFRu9NcLPU+0zVB4tqoUbMrlakZXe0TR9QFTTOcyg
	jFbLYkj+q5r1rG8N0+ZFYIu+9ItWEMx7X6Nhv3+hO7fWP+gBs5cx3awE4mVdHP3w+
X-Gm-Gg: Acq92OEiddXQKegzvXnXSIpLfDI+tV6KYoLz255DGkr/GJb1cfQLPwyksVPOaD2xWSk
	pdGmCfpZQle/ZyeiG70AZm4DPvDZWCWIJk3lSpCXI/0Su5v0yRG9SitIuf//NzYj2B81s2v75Fs
	UQOLXrx6rGp7dRoKB0eT2Np7wFQdECBR7UUEMgCIRcDCFKLQFL1Yk9UaCgvDORX/+63ng0zuSc2
	NailJBM0iDZI/exUXGQikB4cTXbpnzR3N9xuKv1dZjHJk2OlZUjt+sOuIoBhT0/JcOWXDgIhgKZ
	l1PpG9pjZYD2HpPyRfiUwiibATpiXND+e0FVAzA01DCgpbmKc5PMiGyGNectmmQ7gKQ3ORHAJ00
	LYoqYhg654w8gkiZ3as8ubL72kwMd4mNO0uMNXU/8kvAiQ9qPh4CstH4t2/bDyw==
X-Received: by 2002:a17:90b:3c8e:b0:367:e244:4c40 with SMTP id 98e67ed59e1d1-368f7a19606mr6334597a91.26.1778735607034;
        Wed, 13 May 2026 22:13:27 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8e:b0:367:e244:4c40 with SMTP id 98e67ed59e1d1-368f7a19606mr6334573a91.26.1778735606406;
        Wed, 13 May 2026 22:13:26 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368eea199fbsm5025698a91.17.2026.05.13.22.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 22:13:26 -0700 (PDT)
Message-ID: <781c9c44-bd2e-4d12-b29b-daff0f86aea0@oss.qualcomm.com>
Date: Thu, 14 May 2026 10:43:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: fix EHT TX MCS limitation due
 to wrong 20 MHz-only parsing
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260514-ath12k-fix-20mhz-only-mcs-map-v1-1-a38d4a9b21a2@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260514-ath12k-fix-20mhz-only-mcs-map-v1-1-a38d4a9b21a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: owagaCqABNGkufSWHCFmQiSO1zJrujSy
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a0559f8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Iu_Yf0RYHa-hsXmiW2AA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA0OSBTYWx0ZWRfX8Qr11kVgClpn
 6/cqStuJ5cGNd8eq3bkWt0GAphmHyMPyGDhs211FQ2sQiLRHL3sAebYdpWYGwcgTF9q7DnU7zq0
 6J/OR0rNyGawJllfWGebKjmw9ohW96TeyC5lPebKbENwWWRjs2WaZCJZW7AqSfjFf9Bohtaexdh
 FijIoyyIZsg6/bmny8I8aMTHOKUvvvRZNo1OjI1VV6jWXH7u/MQ0D3WkkVNlM39eLgUvK5hztH1
 M3ES4bATWoUaG35D6zOyPzIYwJgUfjNi2cvwIITYxTEl+TU+Q7ekxMEttj5BdMcrH/O918BGybs
 1F/GA/bXRUtoyASoLMiTqpnXdZX+I/RNLxGBdrjK/kxSe1C7xjBZLJZDKSqIGkwGt6MHbSxSnW0
 IhkPFaIagu5F95l3l70E2Vy+rPMXL5MW+Fa1F0aUekZoKTo22Y4l4tvRjfmvgHF4LD/MLzetCnp
 bwq+IdKHJbRWXkMHsoA==
X-Proofpoint-ORIG-GUID: owagaCqABNGkufSWHCFmQiSO1zJrujSy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_221329_595140_C93FC7DB 
X-CRM114-Status: GOOD (  16.59  )
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

On 5/14/2026 9:02 AM, Baochen Qiang wrote:
> When connecting to an AP configured for EHT 20 MHz with a full EHT
> MCS/NSS map (supporting MCS 0-13)
> 
> Supported EHT-MCS and NSS Set
>      EHT-MCS Map (BW <= 80MHz): 0x444444
>          .... .... .... .... .... 0100 = Rx Max Nss That Supports EHT-MCS 0-9: 4
>          .... .... .... .... 0100 .... = Tx Max Nss That Supports EHT-MCS 0-9: 4
>          .... .... .... 0100 .... .... = Rx Max Nss That Supports EHT-MCS 10-11: 4
>          .... .... 0100 .... .... .... = Tx Max Nss That Supports EHT-MCS 10-11: 4
>          .... 0100 .... .... .... .... = Rx Max Nss That Supports EHT-MCS 12-13: 4
>          0100 .... .... .... .... .... = Tx Max Nss That Supports EHT-MCS 12-13: 4
> 
> TX throughput is observed to be significantly lower than expected.
> Investigation shows that TX rates are limited to EHT MCS 11, even though
> the AP advertises support for EHT MCS 12/13.
> 
> The root cause is an incorrect parsing of the Supported EHT-MCS and NSS
> Set element in ath12k_peer_assoc_h_eht().
> 
> IEEE Std 802.11be-2024 Figure 9-1074as describes the format for 20
> MHz-Only Non-AP STAs.
> 
> IEEE Std 802.11be-2024 Figure 9-1074at describes the format for all
> other AP and non-AP STAs.
> 
> Currently the first format is parsed when the peer advertises no wider
> HE channel width support, without considering whether it is an AP or a
> non-AP STA. This is incorrect: the peer AP's capabilities must be parsed
> using Figure 9-1074at even when it operates on 20 MHz only. Parsing it
> as Figure 9-1074as causes rx_tx_mcs13_max_nss to be interpreted as zero,
> which is then passed to firmware, leading firmware to assume the peer
> does not support MCS 13 and to limit TX rates at MCS 11.
> 
> Fix this by parsing the Figure 9-1074as format only when the peer is a
> 20 MHz-Only non-AP STA, i.e. when the local interface operates as AP or
> mesh point.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Fixes: 6c95151e2e77 ("wifi: ath12k: Add EHT MCS/NSS rates to Peer Assoc")
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

