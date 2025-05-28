Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC1FC5AE59
	for <ath12k@archiver.kernel.org>; Wed, 28 May 2025 05:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHrXUByzbpQNJme1jcMmShtX4mCj+0+xibYn5jCESXk=; b=V1hQJAob3fyzmk9Vic5xe/+BnR
	79//BBqhgC6PMi15jXTHFI9Uayc1OpALRPD3ro9G7WP9AesH/6QQ9h4pFxsQo+IHVmIAyiI53AEDW
	uG/zPcXA1hN3qy0u5x/Q/ZJhfEiuJ7xdvHGl55e3/ZFlHYGQvkDgYFGagKIIZdps2v3ziQ3lQ7I6e
	OW84hcYt2LwR2vlGJJPIPYfbDZTUUXu3HlswWPen4RqjQRJp5vlNNo1mpbG5xEZ3NBpdRgqnXrKfn
	P+5AOj6L9NU8mXarBsdNXK291uSdWGiOcXatFpBchRdpTnqcdiVLWz8HtyolW3KInLo+Baexqw3HO
	bpqnyD/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK9BD-0000000CCaJ-0Wfh;
	Wed, 28 May 2025 05:18:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK99l-0000000CCXg-2Tj8
	for ath12k@lists.infradead.org;
	Wed, 28 May 2025 05:16:51 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RJELIx015869;
	Wed, 28 May 2025 05:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vHrXUByzbpQNJme1jcMmShtX4mCj+0+xibYn5jCESXk=; b=cDIh0ZO8XTz/0QXz
	92/T/0u6tg1jDR1pTYA9U7eDuz1DohD2MLXGHGCr6O9xRDOCF2yMHOzapJCl0gMF
	CcvFPGW2kA3gqV0c/OqZJa7Sd18e9VOUijAaHVeQRBfwzDZV3niBmgDX052EQIts
	yZ+azaQBgsBijNpEW4QJ/5ngVkqiZ9Tu6/cvKGPCq2tyy6qvoioKXMHlO5Ad066G
	d7ZezP1t5vFPnGGHLKL8Ya363e+BMZV/yWaaO/Esg+IrrRX2Uln98syeEevSn4nd
	HMl7nyFmbxyX51z2DJExj0osaLxSTkP9pEk7rwfaeJScMkog/x8ccnUDpg5j54uy
	ibOtlQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79p95c9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 05:16:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54S5GkUp002074
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 05:16:46 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 27 May
 2025 22:16:45 -0700
Message-ID: <9e5fb196-fd6d-4fdf-b970-e239bf1a682b@quicinc.com>
Date: Wed, 28 May 2025 13:16:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WCN7850 problem on Linux kernel 6.15
To: Doug Brewer <brewer.doug@gmail.com>, <ath12k@lists.infradead.org>
References: <CAG0V13S+c14OD7MCMYaSFzWS2ZnPz2BnPfMo1MY-YZmmHX6qRw@mail.gmail.com>
 <CAG0V13SVbBuNXytgW5_NfxKc5T=E+SGScf+Q_ctS5hAeRYgoQg@mail.gmail.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <CAG0V13SVbBuNXytgW5_NfxKc5T=E+SGScf+Q_ctS5hAeRYgoQg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XloUUrFlN81x9H9YDGRIMewj98RNmBY2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA0NCBTYWx0ZWRfX4SSqPEGPJ8V5
 z8EamtkV4uRdOlozXlPY0wwiteDpQfJVwtsyL4lt+RwIh21cZD7OnTj5vyy7PuyORLMzmSAUJX3
 W5nUu2qxFNylUF+l1pkXbXnYuoseG4gX7cbPrZ9dTw2Rs4VjqkJFvStriiy5G1HvQ9eM4gTJZbt
 DtnUBtnK1pLbruruKHTElT1I9FWeTSI1rnjMswXmI8thG0YVZ9KuOJKjeO5acyE8cFihm21jELt
 pGiMoX6LhVSyZN7rbsjC8plwfh/HjL/SZjCADPy+6AR8NIO0MeaBxF37ZwO4sh39HdIbjwfYISI
 VBIPrmOksQ4/rlB2jLC55jwwOXLJgwFb2x1iswJ3p+50EeD7QMyE7XRVBj6XbuQEnjb9hSDcroj
 TJ+7zmGSI0EywauZF7Wiz5WGSRn3CJ1B1h3hdTtjaXLbOTWgRS3nxXF7o9jYO/yexyiDIMVh
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=68369c3f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=afK8twAZCWZQVdb5y00A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: XloUUrFlN81x9H9YDGRIMewj98RNmBY2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_02,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_221649_635416_E1255ABA 
X-CRM114-Status: GOOD (  10.86  )
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



On 5/27/2025 11:00 AM, Doug Brewer wrote:
> On Tue, May 27, 2025 at 9:10 AM Doug Brewer wrote:
>>
>> Hello,
>>
>> After upgrading to kernel 6.15, my ath12k failed to start:ath12k_pci

Is this mainline kernel or stable kernel?

>> 0000:03:00.0: BAR 0 [mem 0xdf000000-0xdf1fffff 64bit]: assigned
>> ath12k_pci 0000:03:00.0: enabling device (0000 -> 0002)
>> ath12k_pci 0000:03:00.0: MSI vectors: 16
>> ath12k_pci 0000:03:00.0: Hardware name: wcn7850 hw2.0
>> NET: Registered PF_QIPCRTR protocol family
>> pcieport 0000:00:1d.0: AER: Multiple Uncorrectable (Non-Fatal) error message rec
>> eived from 0000:00:1d.0
>> pcieport 0000:00:1d.0: PCIe Bus Error: severity=Uncorrectable (Non-Fatal), type=
>> Transaction Layer, (Completer ID)
>> pcieport 0000:00:1d.0:   device [8086:9d18] error status/mask=00008000/00010000
>> pcieport 0000:00:1d.0:    [15] CmpltAbrt              (First)
>> pcieport 0000:00:1d.0: AER:   TLP Header: 0x00000000 0x00000000 0x00000000 0x000
>> 00000

Strange there is AER error? Is 0000:00:1d.0 upstream port of WLAN target? I guess not
because 8086:9d18 seems like an Intel device?

Can you share lspci log:

lspci -tv


>> mhi mhi0: Requested to power ON
>> mhi mhi0: Power on setup success
>> mhi mhi0: Wait for device to enter SBL or Mission mode
>> ath12k_pci 0000:03:00.0: AER: can't recover (no error_detected callback)
>> pcieport 0000:00:1d.0: AER: device recovery failed
>> ath12k_pci 0000:03:00.0: qmi dma allocation failed (7012352 B type 1),
>> will try later with small size
>> ath12k_pci 0000:03:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff
>> soc_id 0x40170200
>> ath12k_pci 0000:03:00.0: fw_version 0x1108811c fw_build_timestamp 2025-05-17 00:
>> 21 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V
>> 2.0_SILICONZ-3
>> ath12k_pci 0000:03:00.0: ignore reset dev flags 0x200
>> ath12k_pci 0000:03:00.0: failed to receive wmi unified ready event: -110
>> ath12k_pci 0000:03:00.0: failed to start core: -110
>> failed to send QMI message
>> ath12k_pci 0000:03:00.0: qmi failed to send mode request, mode: 4, err = -5
>> ath12k_pci 0000:03:00.0: qmi failed to send wlan mode off
> 
> Tested on same machine with kernel 6.14.8, ath12k works:

This seem like stable kernel, can you try latest mainline kernel?

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/

or latest ath tree?

https://web.git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/


> 
> ath12k_pci 0000:03:00.0: BAR 0 [mem 0xdf000000-0xdf1fffff 64bit]: assigned
> ath12k_pci 0000:03:00.0: enabling device (0000 -> 0002)
> ath12k_pci 0000:03:00.0: MSI vectors: 16
> ath12k_pci 0000:03:00.0: Hardware name: wcn7850 hw2.0
> pcieport 0000:00:1d.0: AER: Multiple Uncorrectable (Non-Fatal) error message rec
> eived from 0000:00:1d.0
> pcieport 0000:00:1d.0: PCIe Bus Error: severity=Uncorrectable (Non-Fatal), type=
> Transaction Layer, (Completer ID)
> pcieport 0000:00:1d.0:   device [8086:9d18] error status/mask=00008000/00010000
> pcieport 0000:00:1d.0:    [15] CmpltAbrt              (First)
> pcieport 0000:00:1d.0: AER:   TLP Header: 0x00000000 0x00000000
> 0x00000000 0x00000000
> mhi mhi0: Requested to power ON
> mhi mhi0: Power on setup success
> mhi mhi0: Wait for device to enter SBL or Mission mode
> ath12k_pci 0000:03:00.0: AER: can't recover (no error_detected callback)
> pcieport 0000:00:1d.0: AER: device recovery failed
> ath12k_pci 0000:03:00.0: qmi dma allocation failed (7012352 B type 1),
> will try later with small size
> ath12k_pci 0000:03:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff
> soc_id 0x40170200
> ath12k_pci 0000:03:00.0: fw_version 0x1108811c fw_build_timestamp 2025-05-17 00:
> 21 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V
> 2.0_SILICONZ-3
> 


