Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F0DC02192
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 22:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ta7nKKd/iplZB8kvjsRtDq9z5h0gEi9TTphLdCMJBeY=; b=Bo/wyH+gtGcw2X7LKzbURZQAO8
	hq2+7g5nH7VnInvg+gwk7Qa2Oo2G4/IUbIwTeoZ4jNQcvI+BG6TkLbHA47r2Ob3er4PxKkE21rXsW
	1M4xgtzaXhMZBrV3eheitspAoRS56lZI/UViLh16VV/V8K1wyfLamB4edYT6ULkdi8ROPB0Z4Uui8
	mRh7fKSDcl1V5kD0mZmTlVbSQtQLKXiYW3QU5DntE8CeRncS8+ZyVFilvy5IsMoGW7vRdN4ZW5H5M
	SBSTrhTMVGBso0Wj3eJ+Fdzpji6VA2dXZkjJBpoU7L2MWetQVxXVI8uN9vEbsOUMnoFktLBH8lC1l
	H/lJyEgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4zH-0000000Gmvv-1JiY
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 22:32:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4zE-0000000GmvW-3b29
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 22:32:14 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513E5luD002499
	for <ath12k@lists.infradead.org>; Mon, 3 Feb 2025 22:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ta7nKKd/iplZB8kvjsRtDq9z5h0gEi9TTphLdCMJBeY=; b=D5JaPwplONOWsOfe
	Blh+Ni7LmKp4SxOy8z31iXq3rEgP6F/Asn5auyZpMnZpBTezaJMkOudu9ABooN4I
	uDnqvuWb3QVYSOtlWMn6Vw9meS7UuLBAOkykOCDm2YadFuLSd262hbpIuPCTtZz3
	EDdIkRM0E3lyIKSP1ykBTHdvllPwiF23nTUBp3NRqq64oFZF78zUDHUSnIdXyhXJ
	Rbxi/lIy4b+sYY4kykDJVUrFs8AeB2e28TE5qoZrSIJKZjsF8TwfIMsqt2azNGgc
	DfImoUiScdemv9Jp1nQyQqaL2W4ZZnFSLGmcQdOysoSLi1xjUpyeIWvkR1UMGUsZ
	DTo8jg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jy8s937h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 22:32:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2166e907b5eso89129625ad.3
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 14:32:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738621931; x=1739226731;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ta7nKKd/iplZB8kvjsRtDq9z5h0gEi9TTphLdCMJBeY=;
        b=aAGvGJ9zU+4NtEfHnLduFf1hVbaq3Ilx+TnAQUT8KjK+P5bdwD0fRKpH7P4m/ltX5y
         egnqUN1x0SN/sGXfIzNj+O2OD3kjxNzRAedpZrYCxv86ar1UF38Jw0ynMz6m0tKzP71U
         qjfRYDbywdkpdR4ILhZ/zZv4HSMJONnBtYmqr99WT7LqQfb43Hd2gtf4+EUm4bpSVLXE
         tlZv+XyAetaL6V8uZDictkOqAS0p5r95+KPxI3YcbMvv2VvXS3K3C/G5TUhvuX1eLzJc
         XjSgIxo2MSfIQfWt2IxCxAbG45dy5byQfUO+veAKD1OaVVxLsM1NnD4TUhY7sf+YtzOh
         kx7g==
X-Forwarded-Encrypted: i=1; AJvYcCVQFvNmix/TuvZ8den4YTAiGAZDElKC/yLzvnwTc89OMsNSMzqgpsQ9NY1r/0nDlNMFepF3Mnk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb0WtoWmwJTg6CLQV+yuff9FRjmfYzIqS9eXa8e0qMG6DwOAar
	99tjaiJLWlDEN6J496NOXK7819okyi8a7MIN7JRulq9T5/kjho16xdAgEX2GiSvEPS1sCK+GJo2
	TSnUoYz0F16Tc3D8tMk2L0sprsj7U/2fNPC/0xP4P4IX7Dtv54sXddK5wu+F+
X-Gm-Gg: ASbGnctNnsrYp75pNe+kZYlLqKskNlzRzEt23E8hzXvXZbOFX+RchByfdjQVkrMGMNm
	ZcPhhvzhOVNKL4Y22tY6UsK1Vck2DXJYQcUQmu8uMMa3TQ0c88z9Xx/ScYe2IL2Ekvp9NjGp50q
	gfvLBFKuRP2EJxOv/8Dv0pmNha4+Dn6ZKJg/kBID26mgWG5xqD0hCXscPH2qynQdf4TUTBS+d5K
	UTRxpHHbFhBiSdpCEpHtY8JlJBZFoMv+DwEbB5JZHM6cY1hVZ5iCM6nynDLBQAuK8OYD7DE/tRV
	7hioW30lMdFSRAOr7xoMU0yNb6qTlsOcx8D7+HULccHjVbbLPIWdpgPiZN2bQoo8z6cg2zA0tg=
	=
X-Received: by 2002:a05:6300:197:b0:1e5:c43f:f36d with SMTP id adf61e73a8af0-1ed7a5f901emr42504726637.18.1738621930656;
        Mon, 03 Feb 2025 14:32:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGy+pXdaTMlFqgRixZAdNAYTB0DyQXIKFwBL0IT3d+qifuvK87o3muHMcLtg2s7I2sGVyS1Q==
X-Received: by 2002:a05:6300:197:b0:1e5:c43f:f36d with SMTP id adf61e73a8af0-1ed7a5f901emr42504698637.18.1738621930313;
        Mon, 03 Feb 2025 14:32:10 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04794bcsm8616362a12.51.2025.02.03.14.32.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 14:32:09 -0800 (PST)
Message-ID: <fe37fb46-bb48-47c9-bff2-6b64acba01f7@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 14:32:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] wifi: ath12k: Support dump PDEV transmit and
 receive rate HTT stats
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Lingbo Kong <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250113071758.19589-1-quic_lingbok@quicinc.com>
 <a215f6a8-dc62-45bd-9feb-bec178e4ad5b@oss.qualcomm.com>
 <f31557e9-88d3-4800-aa77-14a76857f797@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f31557e9-88d3-4800-aa77-14a76857f797@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: exTbH4rEmlj7U-P3ML8TevwqqSMEZmeJ
X-Proofpoint-ORIG-GUID: exTbH4rEmlj7U-P3ML8TevwqqSMEZmeJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_09,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=888 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502030164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_143212_908332_225CC2F3 
X-CRM114-Status: GOOD (  11.42  )
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

On 2/2/2025 7:36 PM, Aditya Kumar Singh wrote:
> On 2/1/25 06:40, Jeff Johnson wrote:
> [..]
>>
>> pushed to pending, please verify the following edits:
>>
>> patch 1/3:
>> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=d971a54bffcda2421038fd09848b0781244f15c1
>>   added 2025 to Qualcomm copyrights in
>>     drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
>>     drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
>>   aligned = in
>>     ATH12K_DBG_HTT_EXT_STATS_PDEV_TX_RATE	= 9,
>>     HTT_STATS_TX_PDEV_RATE_STATS_TAG	= 34,
>>
> 
> Looks good.
> 
>> patch 2/3:
>> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=64cf8cc8f141ad47ca831649f3173fae25c5010b
>>   aligned = in
>>     ATH12K_DBG_HTT_EXT_STATS_PDEV_RX_RATE	= 10,
>>     HTT_STATS_RX_PDEV_RATE_STATS_TAG	= 35,
> 
> I see alignment mismatch in macro 
> "ATH12K_HTT_RX_PDEV_STATS_NUM_EXTRA_MCS_COUNTERS". Can that be fixed?

That actually aligns in the code, but looks unaligned in the patch.
The reason is that the leading "+" from the patch pushes the first tab to the
next tab stop.



