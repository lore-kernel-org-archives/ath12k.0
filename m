Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3BCC02180
	for <ath12k@archiver.kernel.org>; Wed, 15 Jan 2025 19:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBxgq+fF3Bf8Sfv2pMTGZqiJego5AOQip+s0k40bE6w=; b=xXjj8d2/cNKcysdXDMAEBlkJgT
	w2/ehhNipX9lTAXY8mNUPnJSalnk8BXBTW0Ap2Ai5AA2kbSjzfcqnNBwzqExChPeaARTc4ZAlZylN
	RBtrBpT6uiOMca5wSrvbpNr+ewoQVYWG89QwtT9hks0/M+s/JiGOo2p+8dBju7tHNrkVYVwVTUCCQ
	EfQP9iDqDQQem2DuoDKTJlnYhNoI2Ftj3zvZPxolOPDZREYZ9LBY7yZzjoyrcmne70Jolf7P7HL9N
	rICC9jb4NBXKaQiasopOZqMJybXTNKhNsTyO2ehkOFFNOCWDJ4+P5J6twtkP+Q9PBncO/U5ybvx9O
	c5x9NH5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY9VI-0000000CwkI-3Og2
	for ath12k@archiver.kernel.org;
	Wed, 15 Jan 2025 19:56:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY9VF-0000000Cwjb-2MED
	for ath12k@lists.infradead.org;
	Wed, 15 Jan 2025 19:56:39 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FGnDE2010185
	for <ath12k@lists.infradead.org>; Wed, 15 Jan 2025 19:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MBxgq+fF3Bf8Sfv2pMTGZqiJego5AOQip+s0k40bE6w=; b=VgqTkLrYnUqxkq7a
	QS/+iCw568w9SP1VwKtEjLyy7f7MFvwzscEtbkaNZ/hC5DQcaWdsNx2igLAJrHZ9
	eHYbQML+dfu+eKbTGTT/RGNzSn64Bos6jeDuLLveu+COEmGyJPzFP45pJrAB2gk3
	Vb3AJKXyW/R6ciPLEtBLTtS5qWHZHj4IpBsKXfN12xK2IMXzAEOOa/JLUtQSlmJ5
	WosjWgrqAHGtW3cE7DbWpFgOU683fAJkIIUejwzAwJlynHb+sJRIRXr+TsiE7nuX
	1xf+5TA3qar15qBuua8k+9dbNq+y0fc5nzxUXv4jYxi0JnQ0vQcOVOt5DTEdhXeL
	9r0KMQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446gjdgfca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 15 Jan 2025 19:56:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-216430a88b0so1403455ad.0
        for <ath12k@lists.infradead.org>; Wed, 15 Jan 2025 11:56:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736970995; x=1737575795;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MBxgq+fF3Bf8Sfv2pMTGZqiJego5AOQip+s0k40bE6w=;
        b=fyLpKZkaZnwQMelLlc/Xtk1gQriTPnQjjp3nKiR6m/vOn9DUUUhzyGoasqAM4l9a+e
         iNdmvdKRlpSM9sBpgkDS/y5+SIgqipVCQz5Gmz2/v68ILHJMlUPnU0XvHBmPpqtWeSrn
         oeqdye3U0tJObvlusJTdtetrpl58T/1yQc1ulY5kGQvG3/zazZvD1YUSZ8hAMZTnVN2x
         pmc6M0gzWN/knjgxFW4UKLkXfFUgKdVtMdsYyjF+dzCfMXTwTwtq4XUhr/nRJ/qCoYny
         RS1xaLh1HjAJgv2fPC3pZJJs5MCME3GCRQi7pxIAL0c+H5fdt0o9pAN+gCTBFbEcHWvN
         hlTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKhubojlVoMh3WiVXOFTp9b9uh1GM+qmXaPeTQlUzmXf1XjmBs92J/ZAxkoctLycDc/rkjtAM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxilKzHBRHISNdSJAO1ebgtHSZVBdyiVKlPuT63g2qAPbYA8uUH
	D52fi2oLMvy3YY3zi1UjmBt+EtptVKcqvWXReR3tptZ3FGnPTui8QizCtzqlGRKW9nhLk7/oGgp
	sdvtn1sRSfYu9EYTE+0tQdovGowSX2O+Mz6hid0Au5AVixng1H7CsFi/ZOrLC
X-Gm-Gg: ASbGncsKxo79jnuPUsZTKSgWrpoeICj7QGl/AZeUDVkBjl6ByaR4un92WnLKBtSiMXw
	Id28p6OL8qXelmRTHDenKQlBD/C4moepwQF6zrHjppz+m+G5w1qNE5bbXP4f1Ed1kj0tTWhKy+9
	X1DrotJJEtwG2a42qDjfM0vGaiUww7nXpZlDg+gHzXQJBiF0VrreqipaCA6IKxna8Dqrww5iscV
	IUW8JQ8fO3tn/aKwvMkVVdAqbgwgF3DOhyGDpegSyPA0hv1BnN7xK/eOSpIN4G6JOefcqzIgCIh
	1YOtm91L1WzB3S9h3ZqyDhweVO+84ALPVsJF
X-Received: by 2002:a17:902:c94f:b0:21a:874e:8adf with SMTP id d9443c01a7336-21a874e8c72mr434837325ad.45.1736970994922;
        Wed, 15 Jan 2025 11:56:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeTR2FRj8Xbv1MavBnjJoyI+eD1M3/x5bpuMpqPWpDV3KQidnFCBBEf0x8ksBK0i5ww8nFUA==
X-Received: by 2002:a17:902:c94f:b0:21a:874e:8adf with SMTP id d9443c01a7336-21a874e8c72mr434836925ad.45.1736970994463;
        Wed, 15 Jan 2025 11:56:34 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a317a07ccd6sm10128090a12.8.2025.01.15.11.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 11:56:34 -0800 (PST)
Message-ID: <247ad29a-8c54-4046-8e75-8435c2addf75@oss.qualcomm.com>
Date: Wed, 15 Jan 2025 11:56:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] wifi: ath12k: Add monitor interface support on
 QCN9274
To: Nicolas Escande <nico.escande@gmail.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250107021017.3857555-1-quic_periyasa@quicinc.com>
 <D72U91ZG2PNM.2IXUT304LMEC0@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <D72U91ZG2PNM.2IXUT304LMEC0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BO8ScVxXkf12S9TDJ_wh4t9B3PcP7OxF
X-Proofpoint-ORIG-GUID: BO8ScVxXkf12S9TDJ_wh4t9B3PcP7OxF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_09,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_115637_739619_ACA09723 
X-CRM114-Status: UNSURE (   8.39  )
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

On 1/15/2025 9:55 AM, Nicolas Escande wrote:
> This is on split-phy QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

I don't know if it will help, but I just pushed out

new firmware WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1:
https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware/-/commit/a289ab4de56345be86d2c89c81aa12577c2c5a30

new board file:
https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware/-/commit/bd2ca865d78f3d7d899e06cef57e5bbb9da60bf7



