Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE82C531F9
	for <ath12k@archiver.kernel.org>; Mon, 27 Jul 2026 03:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+z5V9MsYQEKUqO8SvZh2XP3MD4HqMBatOdE/2JdRgJ4=; b=WuL/SJPNc5ebvGntzmJhvfj3mE
	XMb1DASuxqXbZojuc13Yn3v8GDRlkdHcDmS6dfVDxk38IW8z/39x9W85+PU3R+C4q9W79JzqBTuST
	ReXgvTDlYSyPGagMxhE27inTfyKmYWUolZYPm0NKvhxXT9pUa40BQn5w2DsR261PQZqMa7xBj5n6E
	MJCZzz500y+P+8LqNq5LcexfTnIiHgnCgCHR/kzl+ZJhQVLMr6y1rIruqeG0+rHFqEgNVsdea5zPd
	EsR45rO9YJnN9uKS2BqJwFruqva0hSNNkeDX3c7JaTbdAATarbkUyXfsEkOVsqeo78VO7c+Nop/tn
	9TIaLOPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woC9c-00000001slD-0PGe;
	Mon, 27 Jul 2026 03:37:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woC9Z-00000001skq-00rd
	for ath12k@lists.infradead.org;
	Mon, 27 Jul 2026 03:37:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1focr2466619
	for <ath12k@lists.infradead.org>; Mon, 27 Jul 2026 03:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+z5V9MsYQEKUqO8SvZh2XP3MD4HqMBatOdE/2JdRgJ4=; b=PHw+12pin5aoPWba
	JNuhkL74FJT+9HGrZcnmgBm/0rG20umYILcys8Z2LLOryLo+8E7xVAqcqgEyCPdR
	V3VE4sABjWlfHV9aFaYnbJtaxQuU0Jh8+9s6Xzo1DAHWROSvXk3uxpHUwXsTXbqw
	rEOfLBzBju5aMKHBUgvWg45RHk4JxEA8nwYRbDRLcpG4rsKTXmNaCKsqUPkazbES
	MGek4PgJ0kTrXvHRKrPmG/ISiFEGAXhnUGX+cDNO7AKgHzI4UyiT1kqqy9lqIsF8
	/w/Pu0oVF9GduuuA8tdG8gFjV0VrdvYhstFExZcLLzsLQ2xez3xGWgZwErBFzp2o
	6Yjt9g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm574hne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 Jul 2026 03:37:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so1688234a12.0
        for <ath12k@lists.infradead.org>; Sun, 26 Jul 2026 20:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785123438; x=1785728238; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+z5V9MsYQEKUqO8SvZh2XP3MD4HqMBatOdE/2JdRgJ4=;
        b=ZlXgZxvih2+/Uno09XSUgumYDUg58xlAIM2q9orSKqRCLZXIg+Gn+TWlDQfySo3Nro
         O6S800LTYnaOxLqVWR5X0HSwMZfiJIS6A8lFQH5XSiQ+6iczdjn/2Q1XhILhH7JmpHEN
         4ofTk1KobMI/UxmU1Zhe2+ShfoGiHaVSahBAhmAXbD+3GlWttKp/ZR3cPdKcl5Yn9CtQ
         Qnm9AVSUfQSXwjhiSPUNEC77rCzfcDUuEMJWPBkNRxlhF/qzJTww/LWbceoQV4jIg7ZR
         bIKpr2c9Am5CA8YIpuvUOlKNvKCcmHBmTGp0QwQwkxT9wBZprrmr8FqL25vls1X4Fs05
         6fyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785123438; x=1785728238;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+z5V9MsYQEKUqO8SvZh2XP3MD4HqMBatOdE/2JdRgJ4=;
        b=rX4KcfzegSRZRgwOfjAMbXJHwTE/srYoxyPLl9YyIO1dL4ZVb4izghoUUAuHkWJ4Sg
         5GAn8lACjnB6vJmsgfXeySVFdCzOPA1OmLp60aY2CsuKcVdIF/9hzLQKQcMLEsWp35UK
         dhGQJ6awJJqw5jF1dVVKucXGVp/DhWN17yaKHYDfOlMmN8VeF22htbn9PWDYWLMzGW1y
         6vjiDWQYdpVOKSgjSGNdaYOBEVNoOGn8Rp3pKZxPsDq4Ym57LVifK1vnBKUTbkQXPXLT
         +7dhuaD1apRe/TZcmUqRnAmXGdCphM1q7nLsyYtAKbJ8+yB0FoVbYGqptpJsGvvhLfsw
         pM3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp7FylOjXujhJQ5N2bOvxXtqp+7DO3VpzxcHiW3jwb57RCLhxkujF5cKkjeq/8ZNgcy3jMUVkM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxab8z90USh7Uq9a0wABQRr5R5Qvsg0DvloqHGZTo+sbk8G1wIC
	UsMIysbG70jpCmGi/9vE99glXARTz8ibR1R2JgWUtyiZpeANDkz7mZOZayvStIZomS3Am4bLzBe
	z2dFNhJaEi6d0b82w/koXHqPOiydUpUjpRqozDbvXikUZRBuOdDDXCNJ52cxIZEWzMwflxLYW
X-Gm-Gg: AR+sD11EsC2IeqgQ8yKK8vGUvaQQHduq19vXlC9dH/v9geQ0xIbjr012HXPQzCmQF96
	NTybcy8AJm9M60jGV8THQDacPtHLFVzitfpNW2SR6CJzQlGn3ngoIjZOIkWdFizoL08v9CGnjBF
	8SBeCPWQnsmPE2m83sMXywl/elIL89LM1aHpjreUM7dFA8xpsJIITzK4GrR+vJyDDJcP0zV0orb
	JTYEjj+3/KQWPY+fcszppO5y900c9HrdjFtwcfKLSGIs7CfWEKVJr1dPDevvKWnh5NwbZ7YsuRi
	h/JbLDC07NyKGsyBufSuDMehc27VpzEYhnGcBisuJeJ7nF4uKiekYyPY2BcRl02AN5ORGpcKImG
	XpDCGLcHqWwgvtPbTDipnuBxQOQj4Av0=
X-Received: by 2002:a05:6a20:a122:b0:3c6:3c5b:f2e3 with SMTP id adf61e73a8af0-3c67da4ba64mr6941921637.33.1785123438135;
        Sun, 26 Jul 2026 20:37:18 -0700 (PDT)
X-Received: by 2002:a05:6a20:a122:b0:3c6:3c5b:f2e3 with SMTP id adf61e73a8af0-3c67da4ba64mr6941903637.33.1785123437718;
        Sun, 26 Jul 2026 20:37:17 -0700 (PDT)
Received: from [10.231.194.200] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb6632810sm2561724a12.13.2026.07.26.20.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 20:37:17 -0700 (PDT)
Message-ID: <9cd654f0-3157-4c88-be68-8979753db282@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 11:37:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: add MultiPD support for AHB
 platforms
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260721065038.126046-1-aaradhana.sahu@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260721065038.126046-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDAzMiBTYWx0ZWRfX6nZtG3q4HAOm
 GSdCFARAGvORLULkEwIPgwyzzUjmecpkO5/zFZyRLOO2a1sf/g2cke54CkrxId44isGndtPNMyV
 5YnLSZMf1s6O43elv4iM/YyVvs/6ilo=
X-Proofpoint-GUID: IU56N4X6jDcOxzhA0VNWH2nxgYOOeGpW
X-Authority-Analysis: v=2.4 cv=FOErAeos c=1 sm=1 tr=0 ts=6a66d26f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1E4GKdcwGqwKInFrMcEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: IU56N4X6jDcOxzhA0VNWH2nxgYOOeGpW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDAzMiBTYWx0ZWRfX4vck7J46X3x2
 5/iU05YZywndmcjPrbxHkEHu8gtDBoB0BDCgMlD/5rG/Mv+a6y+O6RrTtJYF6xH1N4mE1Quvkz9
 73Vn/bUSOEV5pzJAdgNi8rfhYJa6VE0uN4QNlb13DnOkPrGZhqn6okQG77IAnE4GpQfH1kPBRDh
 /VFPIfOHz2/e6ohPJB1MlNR1zHxUlbL0b9C2DzZgnddzkeEk3OqkqLmlqo6x/QMVm9uP0l/ws5u
 sd2w2oXR/pe6erzUSlJhZMh/ge1hu0GyXm/JdWyj6D1edjxmFVuA1M/QIEOG8qPE+yccqKm2Rl5
 hMjz9BikBbtRxzjeWIBOyeLXUH2AaOdse+IfidnfJUXua0Wiuyn1bP7DcJ/8mxBQPDvxsbm7Daa
 IOjvAZfMNqEAzaxs/2LwrRLmWmgQLGzilC2yL7z+OPwvF8ezJEgPRgA15mb/zDxQ7ciGhwpTGlz
 XrmtOjWyCVO4nvpoVtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_203721_176373_D86F7F55 
X-CRM114-Status: GOOD (  12.71  )
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



On 7/21/2026 2:50 PM, Aaradhana Sahu wrote:
> On AHB-based MultiPD platforms, multiple UserPDs can share a common
> RootPD. Each UserPD requires its own firmware image and PASID, while
> RootPD resources and services are shared across all UserPDs.
> Add the required infrastructure in ath12k AHB to support MultiPD
> platforms.
> 
> The first patch introduces a platform descriptor to keep
> platform-specific configuration in one place and provide userPD
> mapping support.
> 
> The second patch moves RootPD-related information into a shared
> structure so RootPD operations such as boot and notifier registration
> are performed only once and remain active while any UserPD is still
> running.
> 
> Aaradhana Sahu (2):
>   wifi: ath12k: add AHB platform descriptor support
>   wifi: ath12k: Share RootPD state across UserPDs to avoid duplicate
>     operations
> 
>  drivers/net/wireless/ath/ath12k/ahb.c       | 209 ++++++++++++++++----
>  drivers/net/wireless/ath/ath12k/ahb.h       |  34 +++-
>  drivers/net/wireless/ath/ath12k/hw.h        |   1 -
>  drivers/net/wireless/ath/ath12k/wifi7/ahb.c |  90 +++++++--
>  4 files changed, 271 insertions(+), 63 deletions(-)
> 
> 
> base-commit: 189721a4afa1804315e7dcfca9ca0539c7b1d7af

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

