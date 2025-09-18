Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA08CAC597
	for <ath12k@archiver.kernel.org>; Thu, 18 Sep 2025 08:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UkvTQXFNTrKWLcqS699MNYS9sYPJqv6Z/HFRx1ooKCY=; b=XYsgW90ZrvP1My1V/luE29+lEO
	yTcWJ+TadsAxqU3k6c/6S3Xdo42PrY81vFKRG0uubGVBCqqUqMRa0ta6fUC7c2FOMYXaWQYl0inG5
	im4Ru+LRSJOy2w4y3seNBTq6DNH6VfEfbtj+xY9MQGatKXhNFU7jRoAZgU8xk+bAc6u94UdikmS2S
	ojkNyPV0xjo50S3Wsz7HKvt2cLNqtmwGTF48BU2y+Xrp1RdK/F/co8Xei5MANVlc3RsQzt0KypDM7
	l5ubOoiNZV7k8FOWaZ7BUVQCv9bB6lYqNsT53yalZdM8vM8dj46tE9PlzdICk1XIM5aZAW3RQBvgO
	hvJT/dnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz9e6-0000000GeBI-1kcP;
	Thu, 18 Sep 2025 08:05:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz9e3-0000000GeA2-2Nvf
	for ath12k@lists.infradead.org;
	Thu, 18 Sep 2025 08:05:36 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I5MI2c018046
	for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 08:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UkvTQXFNTrKWLcqS699MNYS9sYPJqv6Z/HFRx1ooKCY=; b=XlaOY1AmwnVPxhsY
	xlHN1zIiCwJfNvDohbMtyG0iSZuGVkqxCDdHC+OX7HpE7KglG96fyDy+z6qQhkpb
	le/6O0lcTRA5kjJirhubN8tZsLTsPFky4gN822a9jV1vbyl9hbXqk4WamsCSr9Kr
	scdDsjTv3FheQkGcPeg2/54FRrLY1u3cudIeiZ7Q2A7F6JFXsbCmvb+sBT7kI3Nl
	xPfKMhWHC9wTFa3ZO/rbbAXkswsJcOdq+jOeLsei8D1RQyVmMnKWd53i+ihEUNEW
	Sy6uxwu6gfW6WYbgKmLYtI2lt1yLlsln8N6SaYYMazYAhEf7ZnA9OMw7e1Y4paeu
	aKpJ1w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4982dea07e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 08:05:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b54fe1d849aso890212a12.2
        for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 01:05:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758182733; x=1758787533;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UkvTQXFNTrKWLcqS699MNYS9sYPJqv6Z/HFRx1ooKCY=;
        b=i2WbPzf/VjyqAh6SEC2spqQJXhFxbe52Ueuoh1OW41uwcJsrsaN1173VQtfJTLp+xc
         iNdFiWtePVIg5uzS0extloHir4I3QYI8QpFs1D8ND/jUMNLs0hmDYyu7WLSFTbgfDdJV
         //jcPyeJTGgyE9eLl532/6CgL+ZcpnbUjz71HJRC6mnvBRx6LCG8M3S+kP4aWn4pvFHI
         kvm3iSN8RYm0D7iA8GnHzSfXLJOPjou/atZEo+EzLHUmXxC0OHIu+4Bao302A/Cagjgo
         ewqQmMrURbgaEWlggmHeJw4ShH530q2Lt0/0bDVju75uhzxN5y5anPgG0yTd41EF8Vh8
         9WVA==
X-Forwarded-Encrypted: i=1; AJvYcCUImOXLKp1htkapsd8JlRPSPxPhZ9IXfOoef3GrQaBYBdKi5nRnVYuXCl/PHvFoEMUr3qWSa/U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+ZJkmoY2e4fIrpM9S8MRThWvL8S+DMWyqXKcARpUV+351lZ79
	Wgn72c7S/xqsGyTe5GSkzM0mGTWJ55T9EV2l2RDTTLcJG8gf9da1yoCEt087hHZlPKG0cevh05n
	1yEK6GMb+rbouoR3nFcNIznn2d34hjAkzwjOk+o5F/PyUVpolgYB2/vIvOW5a9s06pAnCrTJ6sY
	I=
X-Gm-Gg: ASbGnctb3xoo0CeQzXvL5FvqQk2yKU9GK76yXujl2OWO6Mp+U5X9INCgaeAahdsivam
	Hhseg2fnbHeJfAScudTqtxvCj4Yb0v0qFqPZpj89t/k+cNv2jI0DjOQP914T/GXnI2nmTyjmx3t
	0UUDosLwDXotBZss70hzl1jLGtQoi/GI3yYzuA4SMfFbkOcf0emaq0jOvWY4F5mMhgFJhTgAcNb
	DS5FRHgqU5Om3HBkE8CyJEWrz4AGIa7lIsSfJN+Sv+qUtHsjzQJsU/Wg3nEcajvxLABplOCKnHH
	5AExZCiqtVBFrYnXC6T9wK/cR2o1AsiacuT1FNxE9FiNx3XBh4PBykCupSwmm5kNvTC/VsHn6D2
	AI/GD4c0SEVO3/0g/YQN1DePIbY1OCei2lTs1
X-Received: by 2002:a05:6a20:3942:b0:24e:84c9:e986 with SMTP id adf61e73a8af0-27a90dc398emr8017887637.15.1758182733039;
        Thu, 18 Sep 2025 01:05:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAI2GSbZnRKsXK+5wDP4AEX0WtvADto5IwnoyLzXfbeNOfMZ++8+Zso/G5O+QIRqZI7gCajA==
X-Received: by 2002:a05:6a20:3942:b0:24e:84c9:e986 with SMTP id adf61e73a8af0-27a90dc398emr8017852637.15.1758182732607;
        Thu, 18 Sep 2025 01:05:32 -0700 (PDT)
Received: from [10.133.33.30] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff3fd7easm1598084a12.30.2025.09.18.01.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 01:05:32 -0700 (PDT)
Message-ID: <7dabee21-97e0-4025-bc84-10a2c1247345@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 16:05:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next V4] wifi: ath12k: report station mode per-chain
 signal strength
To: Lingbo Kong <lingbo.kong@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250812030044.688-1-quic_lingbok@quicinc.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250812030044.688-1-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YfO95xRf c=1 sm=1 tr=0 ts=68cbbd4e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pN-lpjZd9i1dOjWOSwIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: zkXYs4oXC_UaKkZdGtXW03lA2wrsbYEu
X-Proofpoint-ORIG-GUID: zkXYs4oXC_UaKkZdGtXW03lA2wrsbYEu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDE4MiBTYWx0ZWRfX+tHgb6Nd1kgN
 FusIqXz0Y0KQHp8GYk31gFy+kDAzROMtXh95SfWf+T1VphM5z9hHRBWgj+xfJGK6PnTtlETpcoB
 S7mXuyzJRWczMqwxaIgVFJOnnEi3p1R6grZkgNvrOeqBXKpEJDbGn0i8bi45q8mhSdd5cufjlEo
 BXSZ2tcs3lp7RG7n2eq3wKKpdLsCKfpuhLzqo1o86NLEnFVLWTor18mNJd9zO3EO0aLYT4megl6
 Yt8vzoev7cFLnTgLlGd/xXdoK732zDPYoT4sjfIswZ1AnT7KQ7dljFLadiXxtKBLUtjDavyHQz7
 7MsREkh12FEwH46QmIFZIjPLR2noflZ8Mba/2KouBteNdeXmgWntkfZMdtLmdmvwh6NKpGNASUX
 dWfWoUAt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509170182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_010535_722375_40951CB5 
X-CRM114-Status: GOOD (  11.30  )
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



On 8/12/2025 11:00 AM, Lingbo Kong wrote:
> From: Lingbo Kong <lingbo.kong@oss.qualcomm.com>
> 
> Currently, command “iw wlan0 station dump” does not show per-chain signal
> strength.
> 
> This is because ath12k does not handle the num_per_chain_rssi and
> rssi_avg_beacon reported by firmware to ath12k.
> 
> To address this, update ath12k to send WMI_REQUEST_STATS_CMDID with the
> flag WMI_REQUEST_RSSI_PER_CHAIN_STAT to the firmware. Then, add logic to
> handle num_per_chain_rssi and rssi_avg_beacon in the
> ath12k_wmi_tlv_fw_stats_parse(), and assign the resulting per-chain signal
> strength to the chain_signal of struct station_info.
> 
> After that, "iw dev xxx station dump" shows the correct per-chain signal
> strength.
> Such as:
> 
> Station AA:BB:CC:DD:EE:FF (on wlan0)
>         inactive time:  212 ms
>         rx bytes:       10398
>         rx packets:     64
>         tx bytes:       4362
>         tx packets:     33
>         tx retries:     49
>         tx failed:      0
>         beacon loss:    0
>         beacon rx:      14
>         rx drop misc:   16
>         signal:         -45 [-51, -46] dBm
>         beacon signal avg:      -44 dBm
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219751
> Signed-off-by: Lingbo Kong <lingbo.kong@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


