Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11070C3ABB2
	for <ath12k@archiver.kernel.org>; Wed, 28 May 2025 14:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=95D+hSHXatpm4C8yU0mIMeAWS6wHConMs4aHlrvGqNI=; b=ywY/Qwx5A8nIFL4HlKgH/0yuAT
	zq0qBZGNSo811xzdjIZdtYFhvEw0gUa34FyC6jMH39qJ6fn0HBmD0UKjGzZa7KqSaKbObKgShMKZO
	ntH4F+eEvDQn5z+wv1Buy9Zm1BOun4Z3HEhA0OTdnpmf21DCAoj85c+1Sqcm7/LEtCAzIOCHz2sT/
	PbpPIZcbmpOdE/eZClSOf4B1+vtkX2q4SSQMDNNLhgPaY/Fq34Ga1vRErg4rEcSNw/M7TrZE8zZLv
	BTJDKvTnmN8R0X1+7dy4MuHW5J/qvCOAqnJN993HFeN1uQ/BV70xYPC4RzJWU7oUDEQnm/MXioJma
	IN+52phw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHwd-0000000DRTy-3Ky1;
	Wed, 28 May 2025 14:39:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHt6-0000000DQqZ-1cN1
	for ath12k@lists.infradead.org;
	Wed, 28 May 2025 14:36:14 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SCc1M5003683;
	Wed, 28 May 2025 14:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	95D+hSHXatpm4C8yU0mIMeAWS6wHConMs4aHlrvGqNI=; b=jYxjWs9HLNoyr8Ql
	HnoWiAPtFw4fH2w5za215IAqX7iHjN7Neg+pPMhcVK915wWBvJr8HgdOTvb0bf/K
	TawZDS2g8L5e0wsU5ac/00xcq0hnLcFbK6or3wKHQ+0vUBNVBs0wzeccgRT6MqYa
	7SXtBaNA9vtut3GhB5D0sfk4GJdLLMpYH5vl107+xb8vgZMMBPlEvqJNb27+zaUl
	3LlJaNPJGUi6eqWOHhLmsjhbRJ9mUA7r2OL+BIr24bJxlCCI99e5jIZM1kNLGZNi
	KwKa/iDF4BG21iNN7H+52+1XJ/+YnZ87aurolcLNv7Zv03+NHBcgQndnEieotqN8
	NmY/vA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek2dfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 14:36:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54SEa9qc007254
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 14:36:09 GMT
Received: from [10.253.34.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 May
 2025 07:36:08 -0700
Message-ID: <e10d6afe-b7ca-425b-99df-5c178a76fca1@quicinc.com>
Date: Wed, 28 May 2025 22:36:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WCN7850 problem on Linux kernel 6.15
To: Doug Brewer <brewer.doug@gmail.com>
CC: <ath12k@lists.infradead.org>
References: <CAG0V13S+c14OD7MCMYaSFzWS2ZnPz2BnPfMo1MY-YZmmHX6qRw@mail.gmail.com>
 <CAG0V13SVbBuNXytgW5_NfxKc5T=E+SGScf+Q_ctS5hAeRYgoQg@mail.gmail.com>
 <9e5fb196-fd6d-4fdf-b970-e239bf1a682b@quicinc.com>
 <CAG0V13RrWkD=Qu74JNNJQNAPA_JC1HORf_cy9s+a60Bm=BsNag@mail.gmail.com>
 <d8d6327b-3f33-4f1f-8369-db516573eb8c@quicinc.com>
 <CAG0V13STa+zO2JJyB8+t8Qr-Y3yOa96EEhUAYHbJhraKz3bj7A@mail.gmail.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <CAG0V13STa+zO2JJyB8+t8Qr-Y3yOa96EEhUAYHbJhraKz3bj7A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=68371f5a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=w91KDYoUNiYsbTrdyE8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: LgT-4lM6mC9ZkSLON8Qwo7DoGwZlTnJN
X-Proofpoint-GUID: LgT-4lM6mC9ZkSLON8Qwo7DoGwZlTnJN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEyNyBTYWx0ZWRfX0eraSS64IbP0
 xKGqwpmQrN+FxAJbDqrc+8CK4NjQMzIDpTk/fpyNeNGLQ6I9LwFNGEyRUbT0CUrzv6xiCCFOHza
 apuwAMBGjUlDwlg4cgafyB3/T0g0D1xq18Cj26RXpC7ExT6Xn3SS2rg5sEr2zliT7bUoSZj6XG8
 RJ/u/mevLfJWmkYonuYZso/bxjcqHp79a2eftZba1T9PIcj4bu5pybxq/Io2DhG+pmNR3KlcOqb
 GkORyiCQmSTCUqm8aUB4EjnywjetfUJo9rtHOv+8z1FMEwOmCTEZ8DpYPpewQok096YWO2yqQ4Q
 rePmjU7UEvmqJ+WKbw+a2YVO/e7CjF5vRVkyDag6m2j/z49x630nSfZ50+y4fjhNWiqUiEo7MBE
 Knj9sGWz/fyyOu5KOo83zBDmFFStm4Ub7d/b7TV09xHm/AcWUanSJtNVmKP5T2i85orC/QcG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_073612_555017_303202AE 
X-CRM114-Status: GOOD (  13.02  )
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



On 5/28/2025 8:55 PM, Doug Brewer wrote:
> On Wed, May 28, 2025 at 4:02 PM Baochen Qiang <quic_bqiang@quicinc.com> wrote:
>>
>>
>>
>> On 5/28/2025 3:29 PM, Doug Brewer wrote:
>>> On Wed, May 28, 2025 at 1:16 PM Baochen Qiang <quic_bqiang@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 5/27/2025 11:00 AM, Doug Brewer wrote:
>>>>> On Tue, May 27, 2025 at 9:10 AM Doug Brewer wrote:
>>>>>>
>>>>>> Hello,
>>>>>>
>>>>>> After upgrading to kernel 6.15, my ath12k failed to start:ath12k_pci
>>>>
>>>> Is this mainline kernel or stable kernel?
>>>
>>> It's stable kernel:
>>> https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.15.tar.xz
>>>
>>>>>> 0000:03:00.0: BAR 0 [mem 0xdf000000-0xdf1fffff 64bit]: assigned
>>>>>> ath12k_pci 0000:03:00.0: enabling device (0000 -> 0002)
>>>>>> ath12k_pci 0000:03:00.0: MSI vectors: 16
>>>>>> ath12k_pci 0000:03:00.0: Hardware name: wcn7850 hw2.0
>>>>>> NET: Registered PF_QIPCRTR protocol family
>>>>>> pcieport 0000:00:1d.0: AER: Multiple Uncorrectable (Non-Fatal) error message rec
>>>>>> eived from 0000:00:1d.0
>>>>>> pcieport 0000:00:1d.0: PCIe Bus Error: severity=Uncorrectable (Non-Fatal), type=
>>>>>> Transaction Layer, (Completer ID)
>>>>>> pcieport 0000:00:1d.0:   device [8086:9d18] error status/mask=00008000/00010000
>>>>>> pcieport 0000:00:1d.0:    [15] CmpltAbrt              (First)
>>>>>> pcieport 0000:00:1d.0: AER:   TLP Header: 0x00000000 0x00000000 0x00000000 0x000
>>>>>> 00000
>>>>
>>>> Strange there is AER error? Is 0000:00:1d.0 upstream port of WLAN target? I guess not
>>>> because 8086:9d18 seems like an Intel device?
>>>
>>> Appending ‘pcie_aspm=off’ to the kernel command line will eliminate that error.
>>>
>>>> Can you share lspci log:
>>>>
>>>> lspci -tv
>>>
>>> -[0000:00]-+-00.0  Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Pro
>>> cessor Host Bridge/DRAM Registers
>>>           +-02.0  Intel Corporation Skylake GT2 [HD Graphics 520]
>>>           +-08.0  Intel Corporation Xeon E3-1200 v5/v6 / E3-1500 v5 / 6th/7th/8
>>> th Gen Core Processor Gaussian Mixture Model
>>>           +-14.0  Intel Corporation Sunrise Point-LP USB 3.0 xHCI Controller
>>>           +-16.0  Intel Corporation Sunrise Point-LP CSME HECI #1
>>>           +-17.0  Intel Corporation Sunrise Point-LP SATA Controller [AHCI mode]
>>>           +-1c.0-[01]--
>>>           +-1c.5-[02]----00.0  Intel Corporation I210 Gigabit Network Connection
>>>           +-1d.0-[03]----00.0  Qualcomm Technologies, Inc WCN785x Wi-Fi 7(802.1
>>> 1be) 320MHz 2x2 [FastConnect 7800]
>>>           +-1e.0  Intel Corporation Sunrise Point-LP Serial IO UART Controller
>>> #0
>>>           +-1e.6  Intel Corporation Sunrise Point-LP Secure Digital IO
>>> Controller
>>>           +-1f.0  Intel Corporation Sunrise Point-LP LPC Controller
>>>           +-1f.2  Intel Corporation Sunrise Point-LP PMC
>>>           +-1f.3  Intel Corporation Sunrise Point-LP HD Audio
>>>           +-1f.4  Intel Corporation Sunrise Point-LP SMBus
>>>           \-1f.6  Intel Corporation Ethernet Connection I219-LM
>>>
>>>
>>>>>> mhi mhi0: Requested to power ON
>>>>>> mhi mhi0: Power on setup success
>>>>>> mhi mhi0: Wait for device to enter SBL or Mission mode
>>>>>> ath12k_pci 0000:03:00.0: AER: can't recover (no error_detected callback)
>>>>>> pcieport 0000:00:1d.0: AER: device recovery failed
>>>>>> ath12k_pci 0000:03:00.0: qmi dma allocation failed (7012352 B type 1),
>>>>>> will try later with small size
>>>>>> ath12k_pci 0000:03:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff
>>>>>> soc_id 0x40170200
>>>>>> ath12k_pci 0000:03:00.0: fw_version 0x1108811c fw_build_timestamp 2025-05-17 00:
>>>>>> 21 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V
>>>>>> 2.0_SILICONZ-3
>>>>>> ath12k_pci 0000:03:00.0: ignore reset dev flags 0x200
>>>>>> ath12k_pci 0000:03:00.0: failed to receive wmi unified ready event: -110
>>>>>> ath12k_pci 0000:03:00.0: failed to start core: -110
>>>>>> failed to send QMI message
>>>>>> ath12k_pci 0000:03:00.0: qmi failed to send mode request, mode: 4, err = -5
>>>>>> ath12k_pci 0000:03:00.0: qmi failed to send wlan mode off
>>>>>
>>>>> Tested on same machine with kernel 6.14.8, ath12k works:
>>>>
>>>> This seem like stable kernel, can you try latest mainline kernel?
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
>>>>
>>>> or latest ath tree?
>>>>
>>>> https://web.git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/
>>>
>>> OK, will try mailine kernel, thanks.
>>
>> Please also try latest ath tree if issue still seen with mainline kernel.
> 
> Both mainline and stable kernels have the same error.
> Switched to ath.git, my ath12k works.
> 
> Seems to me that both mainline and stable kernels have fallout.

Great. So seems some fixes/update not landing in mainline/stable yet.


> 
>>>>> ath12k_pci 0000:03:00.0: BAR 0 [mem 0xdf000000-0xdf1fffff 64bit]: assigned
>>>>> ath12k_pci 0000:03:00.0: enabling device (0000 -> 0002)
>>>>> ath12k_pci 0000:03:00.0: MSI vectors: 16
>>>>> ath12k_pci 0000:03:00.0: Hardware name: wcn7850 hw2.0
>>>>> pcieport 0000:00:1d.0: AER: Multiple Uncorrectable (Non-Fatal) error message rec
>>>>> eived from 0000:00:1d.0
>>>>> pcieport 0000:00:1d.0: PCIe Bus Error: severity=Uncorrectable (Non-Fatal), type=
>>>>> Transaction Layer, (Completer ID)
>>>>> pcieport 0000:00:1d.0:   device [8086:9d18] error status/mask=00008000/00010000
>>>>> pcieport 0000:00:1d.0:    [15] CmpltAbrt              (First)
>>>>> pcieport 0000:00:1d.0: AER:   TLP Header: 0x00000000 0x00000000
>>>>> 0x00000000 0x00000000
>>>>> mhi mhi0: Requested to power ON
>>>>> mhi mhi0: Power on setup success
>>>>> mhi mhi0: Wait for device to enter SBL or Mission mode
>>>>> ath12k_pci 0000:03:00.0: AER: can't recover (no error_detected callback)
>>>>> pcieport 0000:00:1d.0: AER: device recovery failed
>>>>> ath12k_pci 0000:03:00.0: qmi dma allocation failed (7012352 B type 1),
>>>>> will try later with small size
>>>>> ath12k_pci 0000:03:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff
>>>>> soc_id 0x40170200
>>>>> ath12k_pci 0000:03:00.0: fw_version 0x1108811c fw_build_timestamp 2025-05-17 00:
>>>>> 21 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V
>>>>> 2.0_SILICONZ-3
>>>>>
>>>>
>>


