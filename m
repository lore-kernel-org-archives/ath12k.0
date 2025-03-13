Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C93C282DE
	for <ath12k@archiver.kernel.org>; Thu, 13 Mar 2025 18:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nTbGDkMG71Vja7DElwOL23J/vRzorTHUbqxSp3pihno=; b=5Ec7vJggljeeunh5qmnq5d6pZK
	1BFuATX5UjI0KaKmsAxom5RFdogJHiljhIsqgUdiV0jMJQ9MbsrM3enVPAYR1Dnm0hzLxdV80q6pi
	bw+NkgxJEMF1hISVPrvnHs9ZcIOpo2MKYejZC0y+jWIJ4Axz7jkOIs1PnLTwQzqiZDxC3a4o49mR1
	RKn4dyQQ0zORfylU8zVV5c0MW9Yc3SiZTeVBb8/fctvOyE02DDPkYjq7FWUuF3PWHQwgtMxItaa1X
	YFJBiM6HYSqe/Yt6Onvki1We+rEu7qf3Tn4JiTbjan1zldMnzer8+hnS2R43kyNkN7ncfnR4qYAh3
	9zB7huIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmuN-0000000C72a-31VD
	for ath12k@archiver.kernel.org;
	Thu, 13 Mar 2025 18:03:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmZ5-0000000C4ad-2syC
	for ath12k@lists.infradead.org;
	Thu, 13 Mar 2025 17:41:52 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DACeA0020131
	for <ath12k@lists.infradead.org>; Thu, 13 Mar 2025 17:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nTbGDkMG71Vja7DElwOL23J/vRzorTHUbqxSp3pihno=; b=AVCB+8cEkqpDM10r
	dJVFAf7dDVENY6tPE+JcBQFB3AhhQiGWIc3lTA4MRs1Uj1bKFxUoYo8kW8ntqtuE
	xTihgqsOjQnrO+AmNumpRzm0WkinO230sMbpXmNMNfL39ywNgrNOL1O+oQvcrg/q
	uOkZE2LCxA+AzhaYcKDyIgHt7+pojHXqKQbTYMSvM2oxQqCYf/w471uYszh0gDIo
	2iGSp+d75rCCoqnwkDxxn3HterEmk2PKxYREcAw5Y6l366o8/mcwXJ2JxZVlz7dx
	NllC2SVQLqaLRTlnpZihvyM1/3Ens9BFEZGURINm72fMZJpxMbq6l4C30mgAcG7C
	Rrj4Ug==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2p6qn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 13 Mar 2025 17:41:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-223d86b4df0so7075765ad.3
        for <ath12k@lists.infradead.org>; Thu, 13 Mar 2025 10:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741887709; x=1742492509;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nTbGDkMG71Vja7DElwOL23J/vRzorTHUbqxSp3pihno=;
        b=BjbRaNyeqv0kx4tNmVYuxWBEvY/B3w5AhLYGRLBeGe5VoQwUlcAt6DXOrfu6Jz32tW
         wHu8B9VwzKW17F+xLn10mo2zSzxCMRSMlqq0Cclgu2NwHn2/pGeU2SeA48bn4466KZsV
         O1kejVKklRcF1Z9mKgevTEqJQJ61vfro0fTxldo+0s5+1gMSy9O6jZ+kTBUigt2cXSEj
         3OT5RnEUxPGzjjWpXYzmIWm4c3/PoGx8091kUrcAviAjO2b7pBxSwuU2Yi8/6TWz8Lbv
         wVl5HGsEYFDmYohRdDYBH2bjKhyEd/K6riuX4mOwmSAnwpdQQMNDRWfXWBxPG746jDfg
         1oIg==
X-Forwarded-Encrypted: i=1; AJvYcCVXnt51ZzVqEL0JSTIj1J5cr8+GKp2IA1S2Pl+QhCuanmRCk4Gk++EJgvw5xnXHbgz80wjYID0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yynmv7Xj9SRoLp+zpK3KvPiOhSUBj22lnpvyPXbvzeP8/DkboZY
	FaIVngL6qnoNxwPrwVjLj3YxrxvjF60xBsmVMY/Kzcb8WUHOzty7K6qWJuRwCkCByxhB9FppAE0
	oWmLGP4BjiovMk13uVAskFAyvDWf5rld+qeylnKySmNBoGx29sPwjUwsrMjSw
X-Gm-Gg: ASbGncsXn9/4Ay7TtAObTRpofWMGtHti1L6mKnBt1v0CpLeGLCGnrYE9j6ZZcV12wzX
	CoTUJbEB9ZHuCbI6nQfC1bQ/8lkKcHhJoDfkLCTKcfgjmRSwV1XNvNSI1L8nk23xIr3gwIIzcLt
	UtQxi/eA4lTLfjSIGjz9UOwJGeODuYXQDtQaVZ+pzDAtF1MeEIhGo2gFU/JJTx+XkdQicl64I4r
	11z4oRzoNA7L7R4iJeitH461QWsOD/RxnD6U22HmdK5JqRh3yDKwmLQ4mgeUu+sHYQM4MWaL1hd
	7aATOyGtIEC11G32LdLOQEV55+MRjG31VYroNeJpcHSEY0LlgkxHbgZn7gSLeE9j
X-Received: by 2002:a05:6a00:1c83:b0:736:6268:9ec9 with SMTP id d2e1a72fcca58-7371f1729a0mr531748b3a.16.1741887708763;
        Thu, 13 Mar 2025 10:41:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+uA3/wpnHTBfcMzXqUODV9pt19PlgNU43UkdbZDOtFYgif7SoOnZsveKAVGUHK18cyQ5hzA==
X-Received: by 2002:a05:6a00:1c83:b0:736:6268:9ec9 with SMTP id d2e1a72fcca58-7371f1729a0mr531724b3a.16.1741887708368;
        Thu, 13 Mar 2025 10:41:48 -0700 (PDT)
Received: from [192.168.225.142] ([157.51.162.105])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711695a2esm1659613b3a.144.2025.03.13.10.41.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 10:41:48 -0700 (PDT)
Message-ID: <9e0082a6-ac19-6f34-efb1-b22df836eacf@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 23:11:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v9 9/9] wifi: ath12k: add monitor interface support on
 QCN9274
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, P Praneesh <quic_ppranees@quicinc.com>
References: <20250313162100.2364049-1-quic_periyasa@quicinc.com>
 <20250313162100.2364049-10-quic_periyasa@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250313162100.2364049-10-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HP/DFptv c=1 sm=1 tr=0 ts=67d318de cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=KnbpFunUQJgWYJTnieH9nw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=xH0xcr9_mYJ7sMi6Wl4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: vRpTzc4Vixrc1sgbz5ktWH-YX6h9kG0A
X-Proofpoint-GUID: vRpTzc4Vixrc1sgbz5ktWH-YX6h9kG0A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_08,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=941
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_104151_847560_E5EC2B92 
X-CRM114-Status: UNSURE (   9.56  )
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



On 3/13/2025 9:51 PM, Karthikeyan Periyasamy wrote:
> From: P Praneesh <quic_ppranees@quicinc.com>
> 
> Currently, the monitor interface is not supported. To support the monitor
> interface, configure the monitor vdev state identifier, configure the HTT
> filter setup, subscribe the mac80211 NO_VIRTUAL_MONITOR feature, remove
> the mac80211 callback config handler functionality since align to
> NO_VIRTUAL_MONITOR feature and prevent monitor interface to transmit
> packet. Therefore, add these procedures to add monitor interface support
> and enable the monitor interface support on the QCN9274 platform through
> the hardware parameter.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

