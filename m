Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C7AC3ABB2
	for <ath12k@archiver.kernel.org>; Wed, 28 May 2025 08:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWXRsko0uLuCBVfEE/3EjtdV0rx/UEcEI5kM//ePtNs=; b=mtKhpJRSR8uHbqKmHGmk5Pe+iF
	mGYtLkunTgfY/ka+/0EUh1uUrFmYbCPZY3s4x8cVwVXGLqCoxCuxUn2pLuZPnE5X2v05oRQq2VSPA
	w7Ma3Sbx5kyJar/4MabTXjTtVjS65N5YYNuhgEGLo2mKffYtxPDFjoGZjSGI6Q9YVkHcZqd+4NJbu
	9FgYSq4YredsZU8InhGYUs2DHNYzjMWRCyH4bMrewZ+pLQ979aCBovioKXxazpFsxJr/OLRcMoHkG
	VAFYBeIz2atrvoTPYfrImZjmyjq2jOjHJjPFjsS+Pc3EYJp/Ia1yhDTDX35rAWzOMKPNCLePWeKxL
	KL8GABGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKBk6-0000000CUvh-3DkG;
	Wed, 28 May 2025 08:02:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKBk3-0000000CUv4-4Blm
	for ath12k@lists.infradead.org;
	Wed, 28 May 2025 08:02:29 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RJmQ6Y025377;
	Wed, 28 May 2025 08:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CWXRsko0uLuCBVfEE/3EjtdV0rx/UEcEI5kM//ePtNs=; b=Yh7yely16lTKgI55
	f4ZNtXFOH1eJMgDZ90QjX9heOT1O9z5PAh/F+t6qbeJTEQW/8WFjv5cIabz+csSM
	eMa7oIZaH6e/Orw0ztAFqmW3XKGN3Ae8zYQq00azGHEOPLTloMQAt6PDq+0bGFiW
	9tf8MRgB2Dx9vqDNTcaqfFDYDukQRqx1ooQ7N+9v2X8qheafH4K7covp2CkXgXl/
	cLSXkKzaFzBHB3dOLnVy4l9XyaKlK3E5Rb6RWUxBsYujq6J5z1m6h/Pq1hUrBftL
	/GAoXPj++qlAJWEmEKqu/j+eQChsftT79No98wkzppiSrbuwtN0jHQE7J9L1o817
	8vlZgQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fq9ppj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 08:02:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54S82P5B021461
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 08:02:25 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 May
 2025 01:02:24 -0700
Message-ID: <d8d6327b-3f33-4f1f-8369-db516573eb8c@quicinc.com>
Date: Wed, 28 May 2025 16:02:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WCN7850 problem on Linux kernel 6.15
To: Doug Brewer <brewer.doug@gmail.com>
CC: <ath12k@lists.infradead.org>
References: <CAG0V13S+c14OD7MCMYaSFzWS2ZnPz2BnPfMo1MY-YZmmHX6qRw@mail.gmail.com>
 <CAG0V13SVbBuNXytgW5_NfxKc5T=E+SGScf+Q_ctS5hAeRYgoQg@mail.gmail.com>
 <9e5fb196-fd6d-4fdf-b970-e239bf1a682b@quicinc.com>
 <CAG0V13RrWkD=Qu74JNNJQNAPA_JC1HORf_cy9s+a60Bm=BsNag@mail.gmail.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <CAG0V13RrWkD=Qu74JNNJQNAPA_JC1HORf_cy9s+a60Bm=BsNag@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Bgzmp7cq3C8pysoyHoBk6C9CgigEnAni
X-Proofpoint-ORIG-GUID: Bgzmp7cq3C8pysoyHoBk6C9CgigEnAni
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=6836c312 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=XilCruA8ASXSzcX5WPkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA2OCBTYWx0ZWRfX34SRES4D8Wji
 45ZmQGBZU4EzAAP3qrLoAiXUdW/xanyDpDmowQ+7m/Z88CRvlX/G6ED2r46Fwl3+q8mJH0OgPVt
 q63w3+5UUBXongoSu0PGxNOUeat/DcYYBYAELmwQ08BHyU2T0ulgjD3AU1L9dhMEc+i1xOb7Vgb
 9U9GL8nQvg7xaG7HWacraKEqK/IzTO1Nu04wfAD56vL/C4e2h6ctV6gF3yNbpjU4ljr51GC1KMl
 c1Oax6VPfCG79ZwrIZIA9wGocMJ3CGu61bvnH7yq+oeV7cBN70hN0yreuEy0wQ5elgSgxDYCeC6
 5ITS6RmYo+jZ/YLM8U9HdJXzjW3dXKc9RwKZI0k23fOXoBiP/aJLDgS0uDgOVRa8lkk7qtYZ5Af
 WJpsDPrPBrTObLC3MWAWPIM2flWh5d/j2FwW18mJkqNwAUyU9j+54hHExSl1/nuf9J823Zwc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_04,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_010228_177878_B581D0DB 
X-CRM114-Status: GOOD (  14.41  )
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



On 5/28/2025 3:29 PM, Doug Brewer wrote:
> On Wed, May 28, 2025 at 1:16 PM Baochen Qiang <quic_bqiang@quicinc.com> wrote:
>>
>>
>>
>> On 5/27/2025 11:00 AM, Doug Brewer wrote:
>>> On Tue, May 27, 2025 at 9:10 AM Doug Brewer wrote:
>>>>
>>>> Hello,
>>>>
>>>> After upgrading to kernel 6.15, my ath12k failed to start:ath12k_pci
>>
>> Is this mainline kernel or stable kernel?
> 
> It's stable kernel:
> https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.15.tar.xz
> 
>>>> 0000:03:00.0: BAR 0 [mem 0xdf000000-0xdf1fffff 64bit]: assigned
>>>> ath12k_pci 0000:03:00.0: enabling device (0000 -> 0002)
>>>> ath12k_pci 0000:03:00.0: MSI vectors: 16
>>>> ath12k_pci 0000:03:00.0: Hardware name: wcn7850 hw2.0
>>>> NET: Registered PF_QIPCRTR protocol family
>>>> pcieport 0000:00:1d.0: AER: Multiple Uncorrectable (Non-Fatal) error message rec
>>>> eived from 0000:00:1d.0
>>>> pcieport 0000:00:1d.0: PCIe Bus Error: severity=Uncorrectable (Non-Fatal), type=
>>>> Transaction Layer, (Completer ID)
>>>> pcieport 0000:00:1d.0:   device [8086:9d18] error status/mask=00008000/00010000
>>>> pcieport 0000:00:1d.0:    [15] CmpltAbrt              (First)
>>>> pcieport 0000:00:1d.0: AER:   TLP Header: 0x00000000 0x00000000 0x00000000 0x000
>>>> 00000
>>
>> Strange there is AER error? Is 0000:00:1d.0 upstream port of WLAN target? I guess not
>> because 8086:9d18 seems like an Intel device?
> 
> Appending ‘pcie_aspm=off’ to the kernel command line will eliminate that error.
> 
>> Can you share lspci log:
>>
>> lspci -tv
> 
> -[0000:00]-+-00.0  Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Pro
> cessor Host Bridge/DRAM Registers
>           +-02.0  Intel Corporation Skylake GT2 [HD Graphics 520]
>           +-08.0  Intel Corporation Xeon E3-1200 v5/v6 / E3-1500 v5 / 6th/7th/8
> th Gen Core Processor Gaussian Mixture Model
>           +-14.0  Intel Corporation Sunrise Point-LP USB 3.0 xHCI Controller
>           +-16.0  Intel Corporation Sunrise Point-LP CSME HECI #1
>           +-17.0  Intel Corporation Sunrise Point-LP SATA Controller [AHCI mode]
>           +-1c.0-[01]--
>           +-1c.5-[02]----00.0  Intel Corporation I210 Gigabit Network Connection
>           +-1d.0-[03]----00.0  Qualcomm Technologies, Inc WCN785x Wi-Fi 7(802.1
> 1be) 320MHz 2x2 [FastConnect 7800]
>           +-1e.0  Intel Corporation Sunrise Point-LP Serial IO UART Controller
> #0
>           +-1e.6  Intel Corporation Sunrise Point-LP Secure Digital IO
> Controller
>           +-1f.0  Intel Corporation Sunrise Point-LP LPC Controller
>           +-1f.2  Intel Corporation Sunrise Point-LP PMC
>           +-1f.3  Intel Corporation Sunrise Point-LP HD Audio
>           +-1f.4  Intel Corporation Sunrise Point-LP SMBus
>           \-1f.6  Intel Corporation Ethernet Connection I219-LM
> 
> 
>>>> mhi mhi0: Requested to power ON
>>>> mhi mhi0: Power on setup success
>>>> mhi mhi0: Wait for device to enter SBL or Mission mode
>>>> ath12k_pci 0000:03:00.0: AER: can't recover (no error_detected callback)
>>>> pcieport 0000:00:1d.0: AER: device recovery failed
>>>> ath12k_pci 0000:03:00.0: qmi dma allocation failed (7012352 B type 1),
>>>> will try later with small size
>>>> ath12k_pci 0000:03:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff
>>>> soc_id 0x40170200
>>>> ath12k_pci 0000:03:00.0: fw_version 0x1108811c fw_build_timestamp 2025-05-17 00:
>>>> 21 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V
>>>> 2.0_SILICONZ-3
>>>> ath12k_pci 0000:03:00.0: ignore reset dev flags 0x200
>>>> ath12k_pci 0000:03:00.0: failed to receive wmi unified ready event: -110
>>>> ath12k_pci 0000:03:00.0: failed to start core: -110
>>>> failed to send QMI message
>>>> ath12k_pci 0000:03:00.0: qmi failed to send mode request, mode: 4, err = -5
>>>> ath12k_pci 0000:03:00.0: qmi failed to send wlan mode off
>>>
>>> Tested on same machine with kernel 6.14.8, ath12k works:
>>
>> This seem like stable kernel, can you try latest mainline kernel?
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
>>
>> or latest ath tree?
>>
>> https://web.git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/
> 
> OK, will try mailine kernel, thanks.

Please also try latest ath tree if issue still seen with mainline kernel.

>>
>>
>>>
>>> ath12k_pci 0000:03:00.0: BAR 0 [mem 0xdf000000-0xdf1fffff 64bit]: assigned
>>> ath12k_pci 0000:03:00.0: enabling device (0000 -> 0002)
>>> ath12k_pci 0000:03:00.0: MSI vectors: 16
>>> ath12k_pci 0000:03:00.0: Hardware name: wcn7850 hw2.0
>>> pcieport 0000:00:1d.0: AER: Multiple Uncorrectable (Non-Fatal) error message rec
>>> eived from 0000:00:1d.0
>>> pcieport 0000:00:1d.0: PCIe Bus Error: severity=Uncorrectable (Non-Fatal), type=
>>> Transaction Layer, (Completer ID)
>>> pcieport 0000:00:1d.0:   device [8086:9d18] error status/mask=00008000/00010000
>>> pcieport 0000:00:1d.0:    [15] CmpltAbrt              (First)
>>> pcieport 0000:00:1d.0: AER:   TLP Header: 0x00000000 0x00000000
>>> 0x00000000 0x00000000
>>> mhi mhi0: Requested to power ON
>>> mhi mhi0: Power on setup success
>>> mhi mhi0: Wait for device to enter SBL or Mission mode
>>> ath12k_pci 0000:03:00.0: AER: can't recover (no error_detected callback)
>>> pcieport 0000:00:1d.0: AER: device recovery failed
>>> ath12k_pci 0000:03:00.0: qmi dma allocation failed (7012352 B type 1),
>>> will try later with small size
>>> ath12k_pci 0000:03:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff
>>> soc_id 0x40170200
>>> ath12k_pci 0000:03:00.0: fw_version 0x1108811c fw_build_timestamp 2025-05-17 00:
>>> 21 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V
>>> 2.0_SILICONZ-3
>>>
>>


