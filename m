Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FAFCCA476
	for <ath12k@archiver.kernel.org>; Tue,  7 Oct 2025 13:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ntyqc3cfFdL0+zciHAWHrYx64d7Wo2ITIj39j+9BU1A=; b=1nGH96XsO0P8L/drhVRDfYBIFF
	rrn4F09emc3H89jC6kQ/bHgqJiad3gN6suYnpaKL2larrWOSfNI0h9zQh/wOl2rwGYdaY3721uMrH
	hFDNzptqxyRHs6F2mzKoortZY0wnMr/oxKWjb8IqKE37r7Zm7B9H5ePdROO206hZoLr7nkfcmmPfH
	Fg/zR7WHmQA3fXYp6Ri/cBr2R3rgguuzUmJjHCJ/ZlCeS23vii3g17ZiX2L65XQ5zXMhpBdUAoASm
	WVYsYIFtO4uIRNXp7U5iC16/AOVxrQWin4ruem7dce+zIgjOKoILT9ViUw1uhH7FMxDqV7jVXXiNl
	hLvUiiYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v67me-000000024Np-1gmg;
	Tue, 07 Oct 2025 13:31:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v67mb-000000024N6-08c0
	for ath12k@lists.infradead.org;
	Tue, 07 Oct 2025 13:31:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597A5gdb006173
	for <ath12k@lists.infradead.org>; Tue, 7 Oct 2025 13:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ntyqc3cfFdL0+zciHAWHrYx64d7Wo2ITIj39j+9BU1A=; b=PPEtf7ktZZv8VKC8
	YUTgicsLYTLA2ABfArxbCHtU8DjF6Z8EVy67FMhsaPrnwx6/e6RzJuJGPZKErGTq
	il9+f1DYjS2MonG37PHQ/oUTaKNp0qlaOaI0ob0SxD5M+cwWaa633zm9iuVz8kV6
	FszkhPjGwpE8lWKrIWXiTNX6L6NiYGqBQKG85cw6gPc9ZTnFS88SxvLEWaCnSwpf
	RlolBHO9EwstyEbuPZJiHqpU1AcPaWjX00ebr49abgq+10NWLShqDH6eBsSmKJlk
	vZjXlhqHdORBw8PPslniIJWb0uYrValFqNKeU5DvdAgBzhaOFw2Ff+v9u10ZfjAp
	ieq69Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk6ycq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 07 Oct 2025 13:31:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33428befc3aso6777605a91.2
        for <ath12k@lists.infradead.org>; Tue, 07 Oct 2025 06:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759843870; x=1760448670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ntyqc3cfFdL0+zciHAWHrYx64d7Wo2ITIj39j+9BU1A=;
        b=JJvdA+5DCf7MJTnPQZ3if3HAj+DKfgnjFmk8j7E12lT9wtCiEYA8Pq7dm17ELN196i
         Tw8b/H/5nM2Uaej63liD6xIKYN4Li7/EoyDqx53srb3YCbNlBKRgwf3Nkk8ur3D28fEV
         u8/lyz214zx/GZDcPGlf+tBrNscINgPpLSlICNgv4rCouyKkCPljSNsbdz94+X6iE49Q
         1k6Z1jHD+1lmIV1ImLKA4nYsoytt8eDneWujGWmsdTuVdL/eeIg03z1dFuildRKAyBvD
         pgGO6lLYx+rlQeIV3YY39DLa/MIZ0zWJRad8j1iG6+H/WKENYKxIFjWooUIEztaRQyY4
         340Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUvKn9jA5kMlruDYiUsBbp+bkPlt0//z2J+x9irTU/4gaLmnAdyngtKSMc0WHza3evkqa20Kc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwiGNoFCQrfUMaoLdoPiw4lTFK4SS2H1oxkl78d5ld9DbTGkXhV
	2G4pNPRKVq5J54KDIeCVE9gvoY8ESuAFerq0EmL3B3V+0kBTJ8SBsA5BSZDSW4NsXxeqrHPqG7s
	hI2ADYtDZuHiryzxH1JKbmgs3u2lhyoFJ2Dr4FGbDyfx7WDu5Tb9bkkmOJOYHvuDhPLOFyZt2
X-Gm-Gg: ASbGncu56gdmyBYWB0bN2N/w8h9/r8JaQIeWDmKTdA7DlaTUKRR3SuLUaLfgBg6V4hl
	6rCyFAyfv12Kzu/utF7FfrLSFY016ebWiBxEflq6M0YjM1UKX4q7Nmjur6hDC3eDmAF8+tWOJi6
	d9cgsMMd1MxEwxtAIvNPDpbD6UybDmhZmnbn5BaU2vKa4o2LxAhLqiZQDSc8sxmqhWR76udczxg
	ZAfXnb9fmUOTs8VK9bGXzh31DuO5wNzfdDrN2z243J5g8FlzFB7qh8D2fR+24UfgLEXjxiHojwQ
	0apob5iyqWK0OQvPyfDU1r7hgHUAF3Wim1EqDIySFBlrujRLWdLCmgBZzR1S31LS0ZPwIlXy08d
	qkM69tWH9
X-Received: by 2002:a17:90b:1d0a:b0:32e:1188:147f with SMTP id 98e67ed59e1d1-339c276e95emr21898798a91.19.1759843869417;
        Tue, 07 Oct 2025 06:31:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWkR3NMZmKO8TBoV/tq1VuPyh74ytxa3HIkPi4GrzXtS7xG0vWtr49AExNmovoi+H2e/nfYg==
X-Received: by 2002:a17:90b:1d0a:b0:32e:1188:147f with SMTP id 98e67ed59e1d1-339c276e95emr21898752a91.19.1759843868848;
        Tue, 07 Oct 2025 06:31:08 -0700 (PDT)
Received: from [192.168.1.6] ([115.96.2.203])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339f09bdf1fsm1224456a91.2.2025.10.07.06.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 06:31:08 -0700 (PDT)
Message-ID: <8e8b06f0-e654-44da-91a9-9731cb92516e@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 19:01:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix NSS value update in
 ext_rx_stats
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250725084426.3989966-1-thiraviyam.mariyappan@oss.qualcomm.com>
 <4e204f93-b964-40fb-8eb5-f723f309a2c1@oss.qualcomm.com>
Content-Language: en-US
From: Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>
In-Reply-To: <4e204f93-b964-40fb-8eb5-f723f309a2c1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfXwRluKEFcnqPu
 364fPvrwytMXRLmkrv5vL4x9s/wBQXZ0BiI3S1usW8Frv9P8bV1JNciJP8mwxOLeIO3YuvKjX5p
 hk2cd/PW17Qg/FLV+QNF2SkNT5tT5b+O5xvtiPzR2VcX3TTN7GUMOFczzQisIKmkM0MJJzmPgUY
 TEcTE7bMYRXR5je6QEVy47LztIn3+O3cupqOJ7z8VXD/jIYrsLzB23sL7daVgTeKAr5+HRNg2Nm
 5eTUK3s99csluQVGr6nFufph4nYbfdyKwo+XUf7qGYxCQIW0JiyGNlBA/4aSg+ErnPrWI2eAUu8
 6lQdu1ZWaFNi419v3aUCK9wa3vvCNdVHxcdyneJsTIwfYhLNtCXfnykzyf1zWLQUKaWaQKi8PUp
 jCMg3mtyta8FCs2u0ipbquGZyV+Q4w==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e5161f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=P8EKGVp7AHIUQAkkfTWdsA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=myYG0hIH-BHpDLZ92UcA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: y7CNQ4gzD2HWo4_GzRbLWCw7txxmQH5w
X-Proofpoint-ORIG-GUID: y7CNQ4gzD2HWo4_GzRbLWCw7txxmQH5w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_063113_192468_EAE02EDF 
X-CRM114-Status: GOOD (  17.22  )
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



On 9/20/2025 9:25 PM, Jeff Johnson wrote:
> On 7/25/2025 1:44 AM, Thiraviyam Mariyappan wrote:
>> Currently, in ext_rx_stats, the NSS value is taken directly from
>> the firmware, which results in incorrect mapping:
>>         4x4, 3x3, 2x2, 1x1 SS are incorrectly updated as 3x3, 2x2,
>> 1x1, 0x0 SS respectively.
>>
>> Fix the issue by incrementing the NSS value by 1 while updating
>> the PPDU info to ensure accurate spatial stream statistics.
>>
>> Remove the redundant +1 increment in the radiotap header when monitor
>> mode is enabled to prevent double counting.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>
>> ---
>>  drivers/net/wireless/ath/ath12k/dp_mon.c | 13 +++++++------
>>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> This patch no longer cleanly applies to ath/main:
> Applying: wifi: ath12k: Fix NSS value update in ext_rx_stats
> Using index info to reconstruct a base tree...
> M       drivers/net/wireless/ath/ath12k/dp_mon.c
> Falling back to patching base and 3-way merge...
> Auto-merging drivers/net/wireless/ath/ath12k/dp_mon.c
> CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/dp_mon.c
> 
> Please rebase. And when you do so, please follow current legal guidance and
> replace the existing QUIC copyright with the new QTI one.

WIll rebase and update the copyright in the next version.
> 
> /jeff

Thanks,
Thiraviyam M


