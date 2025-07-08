Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0ECC83F09
	for <ath12k@archiver.kernel.org>; Tue,  8 Jul 2025 03:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yVmdwoyRmqDc17tvesd0pZRhto/8N/zF0tcxD1+SpSA=; b=Iu7V+P/mZ4XDetYG4Dmf7BLILv
	IUxZQUEHaKw4vKgPAaAnK7kgZaq7SpIZz38RmfvB6k1FIxOCltA014sSJGJA3ox15+PzE+kGb2YX1
	YRJY8igSZT3GFoo9U5jxKMqKLiuyAlIS5Q1YStkiTdgZy+1Wfy9cVM0n5xxRjSTaXV4kgkh6utA5W
	6EsgHhUjM3jyVpv5G/TZNErgLzfeOqFkUh/wIQEZugnqytw5TR8L7NS8IMQpqy5gJ3LkE/tnv4TjS
	fawe9jC0p4BUQ+0ha6oNVR7E+rMYhBPG59zBoxY3FT+ZE1f6epHyJbWNBtvDAvybmgC7jJr6O6B2K
	ajdEcY2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYzTm-00000004DIy-2Ucz;
	Tue, 08 Jul 2025 03:58:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYzTj-00000004DIN-4Abb
	for ath12k@lists.infradead.org;
	Tue, 08 Jul 2025 03:58:49 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567L4RYT019277
	for <ath12k@lists.infradead.org>; Tue, 8 Jul 2025 03:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yVmdwoyRmqDc17tvesd0pZRhto/8N/zF0tcxD1+SpSA=; b=RhITuDGxVaX2nn3X
	I3OQEFd2qRV3Kz5NsAafp+ON6RCsUZKC4B2/PEnO/FrGl0an5Ym41eu1adpgG07X
	Wl+bq49fI/gfgZ+YQuHMFYbbDMrV/8I2pUVIEgYvBgb/gv4ewG8VusvkqiNVnk2N
	oj9qT7nKfu0peyx/Plqz32GFtLrZYN1k0/y2GjefjVfIbh83ouCrxJRtHIY67yIf
	3kc3rSjoBdD4Ya1dygCCSzaHHM/V7XySI7Ir8YzB8WZkRA1xdHmwzSr9gbl7MtQ/
	8ktNx9ptWCZXYRwfJi4js8DvJpTXmxLPS1itVWAKOu/iDPhCq//859dNnBIhcy5x
	FtVnLg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7qj0hj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Jul 2025 03:58:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235196dfc50so36899575ad.1
        for <ath12k@lists.infradead.org>; Mon, 07 Jul 2025 20:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751947126; x=1752551926;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yVmdwoyRmqDc17tvesd0pZRhto/8N/zF0tcxD1+SpSA=;
        b=H7D+4+GXFYwPpP4onqNejvVyQSfResLXZriykM+2YqB1kGhklgCs093pRcyGUK56rb
         Qk/v37el3DyBEB58rQBvNoYCYqeo3W4gV8tIcVHYUTlXLD7+63bVKQRPs6NanB44cUod
         dSYqjA5d3gULymUS+U3H6fcSZWOqYDo8H8UYK8h7maadiiffcvhEsRSod7JMPUSJdFsk
         w565GQGrYUpnOs7DCXVxFKUgEbePdCjnF8zAfhua9SBe12948F1l9TOUc+uXZO/bnjIu
         LtuE/I3w/QYOMDuXY6hyQLlCe6Ss/582bRR3eZKBZIxaVVid+oz8b62h4oqBcwEGvAlK
         pYWg==
X-Forwarded-Encrypted: i=1; AJvYcCU+Vlmc0pwlATyB8rjulmZYpE9TgJI5l7a5/qkHdsR7KfaSwE9gkVeWgxsTtcH09K8Ur7XiKbM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwCCtg+RufaVocSzHzjIDgsY2KIV8da/GF6bQHvbr8ufvxgsXAK
	TPCi+tuupyuxBqVQX44HwrZOgnUq7f4TE0EL3Oc90cBOZ6r0f5YTmMW6aodUMSsEPTN1CNbWCSr
	LoIp6Bm2YUSfDWkzQrjtKGWd+j8gV7dfHZbcoFRgpx2XIGBkFoFQZhF0hSFeXr2Sy
X-Gm-Gg: ASbGncsL4yWiog+jN8xnaxfnL4FDJM6BnRTA72deBqCaegVYsKaMvMO88YxGLwF/9fF
	gtOKhBjvg/OGWd6Zi4PLWwpHDYO1W6ewhK2wiagZZxTUo6wKyHWxqyHcPAdknIhEpWg7/oh28jf
	oq5aFF7UGzfYewP7XyT8CfTpDdnaMNFME9+Sc3VQ1NS8V2MpNjbuTmxMF3yve3UgJZkJfPdVbkR
	qdAhmvGPQJ4XShorWfrDkbO27jaef9TcCLSMgzsmvUoUXzGjtS0KBgTpXhH4IFrvtLHgUSuyNW7
	AQdrOfkLB2TsNFeu2kINKwQQQl6Cn2dNPsT712WpdbHKQHXmIA9HcGNLRqbSNKuR
X-Received: by 2002:a17:902:e88c:b0:237:e753:1808 with SMTP id d9443c01a7336-23dd1b43dc5mr16754295ad.20.1751947126575;
        Mon, 07 Jul 2025 20:58:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEso3ju5zhTdAEFrj8mTebhXy+yfUOAHYYTDpHBwzag4yfTDCfvyRpYY+6PtKpu5KUVV20vmg==
X-Received: by 2002:a17:902:e88c:b0:237:e753:1808 with SMTP id d9443c01a7336-23dd1b43dc5mr16754025ad.20.1751947126139;
        Mon, 07 Jul 2025 20:58:46 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c21edfe37sm824324a91.47.2025.07.07.20.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 20:58:45 -0700 (PDT)
Message-ID: <074969cf-676a-34eb-c2e3-219cab3658d4@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 09:28:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: pack HTT pdev rate stats structs
Content-Language: en-US
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Lingbo Kong <quic_lingbok@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250702-debugfs_htt_packed-v1-1-07bd18b31e79@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250702-debugfs_htt_packed-v1-1-07bd18b31e79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDAyOSBTYWx0ZWRfX8Ow33B5+dPkW
 /M5dO24ic8Exfp56iqwDbS/NdNgmtjq1Gll4aNe1vpFmaZEEbhl9mEK3rOnCy4wrOB+nGuO9p9B
 DJihx0C37RTfo/CTQild0jKgMD0T4W2PsV3+fWrQujLFWmuqM1BC9kVONsuE2I9+vAXNMqsrUNc
 ImCrpeo/ztntBbNsCRsfr4Cpu/JlUX4OeIwUU6Z1ZtXZI12amogZvIB7eGjCgVX61/asUNWgDtn
 tPclgtFfYYGBMB5rBSxoWaADL2UFOyycab4JxOfKacQsHSQywapKvfkedD8XUwVtapXQfTp1nhX
 iz2/IGyiQ/ygxL8uxudRT335xVcTGFRRhzEp+q/quEYIVKr+2yXABLHBb3fP5hHxX8XELUgjmcF
 DaZrG+lH7nQQ8aym477W7jQzPJ8vhSk34c2hivk3Cz3RynDDUXE8ZmSuoIizqhUgHm7zXf68
X-Proofpoint-GUID: moqHTPWwfrRt6qAP2BoTdGsOUdLRj5-U
X-Proofpoint-ORIG-GUID: moqHTPWwfrRt6qAP2BoTdGsOUdLRj5-U
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686c9777 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=D7ADwRd3ifBYD-KlsV0A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=896 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_205848_060222_564C6A77 
X-CRM114-Status: UNSURE (   9.28  )
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



On 7/3/2025 2:59 AM, Jeff Johnson wrote:
> In order to ensure the HTT DebugFS structs shared with firmware have
> matching alignment, the structs should be packed. Most of the structs
> are correctly packed, however the following are not:
> 
> ath12k_htt_tx_pdev_rate_stats_tlv
> ath12k_htt_rx_pdev_rate_stats_tlv
> ath12k_htt_rx_pdev_rate_ext_stats_tlv
> 
> So pack those structs.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: ba42b22aa336 ("wifi: ath12k: Dump PDEV transmit rate HTT stats")
> Fixes: a24cd7583003 ("wifi: ath12k: Dump PDEV receive rate HTT stats")
> Fixes: 7a3e8eec8d18 ("wifi: ath12k: Dump additional PDEV receive rate HTT stats")
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

