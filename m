Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7122AC54FB3
	for <ath12k@archiver.kernel.org>; Thu, 29 May 2025 05:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnJQpyET8rlSTcz3mGxYl4Wd+11jcRjhk/ijPrHpiRU=; b=uQs4qAhv7GbfRzR6Jel7Bcv9gV
	K9kruxkQi4dKWVLkZJg5JIRysG5sWUuDwhaMoAVrseoQl0dPG+ogSk0ThLM9UGoO0Jnn4jww45ojf
	B09XMyP9HIDbCgq2n63KSVIgFBZABUceOBfw99NWKY3n6mqqpBrC4TX5wfalVuTG6C03TtYvQytx8
	sJE7I/plsX/APpZgUcR0TsbQNv8E/xMakb0EmTOQTDfoOD9EN54i1o2BZaeEOnikyxGzQO0glIXOh
	mNAN2E0WDYJtYhgXUaHZXeB4MtJGGORKyPxb95SuSMaBB9KmyKTcJE4bcwZSDfBJwXUomNtPqtFtb
	Vn1E8WeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKVo5-0000000Eycd-0EEl;
	Thu, 29 May 2025 05:27:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKVnb-0000000Eybg-2xus
	for ath12k@lists.infradead.org;
	Thu, 29 May 2025 05:27:28 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T3WBeF029872;
	Thu, 29 May 2025 05:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dnJQpyET8rlSTcz3mGxYl4Wd+11jcRjhk/ijPrHpiRU=; b=j4od1PgOfbqBr8lK
	yqeMJOlFAvra5XYuQ9orsZ53MU4RQUiZy96xl2xNCkYMxesEQSyk3FDqHkNqXhg2
	AiZ72kIZoJOoXm3dE66rOrHc1FA3Zqz5boQVWAsRRaYsRJyRJ+k6q36LQb3vipHU
	AQniztmD9qTGZosARRD3TSUAhqTpgB5eiONYLcKVVXmBuyYAl9P1po97IBQEbvlC
	53Zzyaz2JopmsduKunObEe/5x33rsLXJPYTHJCofYmxJXELBgYPSXDngjxpneiXB
	cfjtl8NQO5+Jz/bHrutXcpUa2bzS5ReAWkUYjASi/v67rl4+2j6OcEknMIAdnpFI
	C51eMw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whuf4x88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 05:27:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54T5RPFA009799
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 05:27:25 GMT
Received: from [10.253.34.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 May
 2025 22:27:24 -0700
Message-ID: <ec205009-30d7-4be3-9909-6e86698a5f9d@quicinc.com>
Date: Thu, 29 May 2025 13:27:21 +0800
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
 <e10d6afe-b7ca-425b-99df-5c178a76fca1@quicinc.com>
 <CAG0V13RcrgZ0O2w4cVD-yq2o029bwiEuhLYGAt0n-80hqaCwdQ@mail.gmail.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <CAG0V13RcrgZ0O2w4cVD-yq2o029bwiEuhLYGAt0n-80hqaCwdQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=6837f03d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=UZ7A0T_ErdfLfv434eoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: nh3sYpFkyqrEVxK6DAz9e9FlIOVZ0WU3
X-Proofpoint-GUID: nh3sYpFkyqrEVxK6DAz9e9FlIOVZ0WU3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA1MiBTYWx0ZWRfX48EVhR4XjuEn
 cLd0DZ8Mi6Nm6LQCTLDpXsYS1eRRIezITMsMAFe6P5EQIe/pt4The/aeoD2jsvIoHt5x1s3NXAR
 dAPTEing7u/tOUs3KwLM4F3821EsafjRa1aO5WC9dC0ec4lus6u5m+o3ZZqPHAdCD7qrX8CIiwc
 GewfQ8YWDj136lpEdhl8/DRYKyoxlMyjuvAfggK/UUj1ZdosPq9ETpzU9lbcWxaXB0VEIIG44JP
 44eVmc5e8I4cEi7G1zzPJ9jpD1qh8eMLSUQt7IB7iAUvevtgl4vK5tzmpfp6PHxlGEfHXptkBis
 UoxvTkooEDITv7VPRRS555FpyPb3WGW5fnSOWp7K1Jt6eoR2mB7dTaqvQAr6nqBEQdnW4oYXrLz
 BNdDaTE/xVYYyZ1hD6Eq0J1eU8htMt08IQor1aDbuq1alrUXzuOKMkOrLMXkpD0lEpGIllZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_02,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_222727_760031_04C11919 
X-CRM114-Status: GOOD (  15.08  )
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



On 5/29/2025 8:30 AM, Doug Brewer wrote:
> On Wed, May 28, 2025 at 10:36 PM Baochen Qiang <quic_bqiang@quicinc.com> wrote:
>>
>>
>>
>> On 5/28/2025 8:55 PM, Doug Brewer wrote:
>>> On Wed, May 28, 2025 at 4:02 PM Baochen Qiang <quic_bqiang@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 5/28/2025 3:29 PM, Doug Brewer wrote:
>>>>> On Wed, May 28, 2025 at 1:16 PM Baochen Qiang <quic_bqiang@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 5/27/2025 11:00 AM, Doug Brewer wrote:
>>>>>>> On Tue, May 27, 2025 at 9:10 AM Doug Brewer wrote:
>>>>>>>>
>>>>>>>> Hello,
>>>>>>>>
>>>>>>>> After upgrading to kernel 6.15, my ath12k failed to start:ath12k_pci
>>>>>>
>>>>>> Is this mainline kernel or stable kernel?
>>>>>
>>>>> It's stable kernel:
>>>>> https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.15.tar.xz
>>>>>
>>>>>>>> 0000:03:00.0: BAR 0 [mem 0xdf000000-0xdf1fffff 64bit]: assigned
>>>>>>>> ath12k_pci 0000:03:00.0: enabling device (0000 -> 0002)
>>>>>>>> ath12k_pci 0000:03:00.0: MSI vectors: 16
>>>>>>>> ath12k_pci 0000:03:00.0: Hardware name: wcn7850 hw2.0
>>>>>>>> NET: Registered PF_QIPCRTR protocol family
>>>>>>>> pcieport 0000:00:1d.0: AER: Multiple Uncorrectable (Non-Fatal) error message rec
>>>>>>>> eived from 0000:00:1d.0
>>>>>>>> pcieport 0000:00:1d.0: PCIe Bus Error: severity=Uncorrectable (Non-Fatal), type=
>>>>>>>> Transaction Layer, (Completer ID)
>>>>>>>> pcieport 0000:00:1d.0:   device [8086:9d18] error status/mask=00008000/00010000
>>>>>>>> pcieport 0000:00:1d.0:    [15] CmpltAbrt              (First)
>>>>>>>> pcieport 0000:00:1d.0: AER:   TLP Header: 0x00000000 0x00000000 0x00000000 0x000
>>>>>>>> 00000
>>>>>>
>>>>>> Strange there is AER error? Is 0000:00:1d.0 upstream port of WLAN target? I guess not
>>>>>> because 8086:9d18 seems like an Intel device?
>>>>>
>>>>> Appending ‘pcie_aspm=off’ to the kernel command line will eliminate that error.
>>>>>
>>>>>> Can you share lspci log:
>>>>>>
>>>>>> lspci -tv
>>>>>
>>>>> -[0000:00]-+-00.0  Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Pro
>>>>> cessor Host Bridge/DRAM Registers
>>>>>           +-02.0  Intel Corporation Skylake GT2 [HD Graphics 520]
>>>>>           +-08.0  Intel Corporation Xeon E3-1200 v5/v6 / E3-1500 v5 / 6th/7th/8
>>>>> th Gen Core Processor Gaussian Mixture Model
>>>>>           +-14.0  Intel Corporation Sunrise Point-LP USB 3.0 xHCI Controller
>>>>>           +-16.0  Intel Corporation Sunrise Point-LP CSME HECI #1
>>>>>           +-17.0  Intel Corporation Sunrise Point-LP SATA Controller [AHCI mode]
>>>>>           +-1c.0-[01]--
>>>>>           +-1c.5-[02]----00.0  Intel Corporation I210 Gigabit Network Connection
>>>>>           +-1d.0-[03]----00.0  Qualcomm Technologies, Inc WCN785x Wi-Fi 7(802.1
>>>>> 1be) 320MHz 2x2 [FastConnect 7800]
>>>>>           +-1e.0  Intel Corporation Sunrise Point-LP Serial IO UART Controller
>>>>> #0
>>>>>           +-1e.6  Intel Corporation Sunrise Point-LP Secure Digital IO
>>>>> Controller
>>>>>           +-1f.0  Intel Corporation Sunrise Point-LP LPC Controller
>>>>>           +-1f.2  Intel Corporation Sunrise Point-LP PMC
>>>>>           +-1f.3  Intel Corporation Sunrise Point-LP HD Audio
>>>>>           +-1f.4  Intel Corporation Sunrise Point-LP SMBus
>>>>>           \-1f.6  Intel Corporation Ethernet Connection I219-LM
>>>>>
>>>>>
>>>>>>>> mhi mhi0: Requested to power ON
>>>>>>>> mhi mhi0: Power on setup success
>>>>>>>> mhi mhi0: Wait for device to enter SBL or Mission mode
>>>>>>>> ath12k_pci 0000:03:00.0: AER: can't recover (no error_detected callback)
>>>>>>>> pcieport 0000:00:1d.0: AER: device recovery failed
>>>>>>>> ath12k_pci 0000:03:00.0: qmi dma allocation failed (7012352 B type 1),
>>>>>>>> will try later with small size
>>>>>>>> ath12k_pci 0000:03:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff
>>>>>>>> soc_id 0x40170200
>>>>>>>> ath12k_pci 0000:03:00.0: fw_version 0x1108811c fw_build_timestamp 2025-05-17 00:
>>>>>>>> 21 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V
>>>>>>>> 2.0_SILICONZ-3
>>>>>>>> ath12k_pci 0000:03:00.0: ignore reset dev flags 0x200
>>>>>>>> ath12k_pci 0000:03:00.0: failed to receive wmi unified ready event: -110
>>>>>>>> ath12k_pci 0000:03:00.0: failed to start core: -110
>>>>>>>> failed to send QMI message
>>>>>>>> ath12k_pci 0000:03:00.0: qmi failed to send mode request, mode: 4, err = -5
>>>>>>>> ath12k_pci 0000:03:00.0: qmi failed to send wlan mode off
>>>>>>>
>>>>>>> Tested on same machine with kernel 6.14.8, ath12k works:
>>>>>>
>>>>>> This seem like stable kernel, can you try latest mainline kernel?
>>>>>>
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
>>>>>>
>>>>>> or latest ath tree?
>>>>>>
>>>>>> https://web.git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/
>>>>>
>>>>> OK, will try mailine kernel, thanks.
>>>>
>>>> Please also try latest ath tree if issue still seen with mainline kernel.
>>>
>>> Both mainline and stable kernels have the same error.
>>> Switched to ath.git, my ath12k works.
>>>
>>> Seems to me that both mainline and stable kernels have fallout.
>>
>> Great. So seems some fixes/update not landing in mainline/stable yet.
> 
> It's not good that ath12k is broken on the stable kernel 6.15.
> Do you know which fixes haven't landed yet?
> I'd be happy to help test them, thanks.

Pease pick below series and try

https://lore.kernel.org/linux-wireless/20250409-ath12k-wcn7850-mlo-support-v2-0-3801132ca2c3@quicinc.com/


> 
>>>>>>> ath12k_pci 0000:03:00.0: BAR 0 [mem 0xdf000000-0xdf1fffff 64bit]: assigned
>>>>>>> ath12k_pci 0000:03:00.0: enabling device (0000 -> 0002)
>>>>>>> ath12k_pci 0000:03:00.0: MSI vectors: 16
>>>>>>> ath12k_pci 0000:03:00.0: Hardware name: wcn7850 hw2.0
>>>>>>> pcieport 0000:00:1d.0: AER: Multiple Uncorrectable (Non-Fatal) error message rec
>>>>>>> eived from 0000:00:1d.0
>>>>>>> pcieport 0000:00:1d.0: PCIe Bus Error: severity=Uncorrectable (Non-Fatal), type=
>>>>>>> Transaction Layer, (Completer ID)
>>>>>>> pcieport 0000:00:1d.0:   device [8086:9d18] error status/mask=00008000/00010000
>>>>>>> pcieport 0000:00:1d.0:    [15] CmpltAbrt              (First)
>>>>>>> pcieport 0000:00:1d.0: AER:   TLP Header: 0x00000000 0x00000000
>>>>>>> 0x00000000 0x00000000
>>>>>>> mhi mhi0: Requested to power ON
>>>>>>> mhi mhi0: Power on setup success
>>>>>>> mhi mhi0: Wait for device to enter SBL or Mission mode
>>>>>>> ath12k_pci 0000:03:00.0: AER: can't recover (no error_detected callback)
>>>>>>> pcieport 0000:00:1d.0: AER: device recovery failed
>>>>>>> ath12k_pci 0000:03:00.0: qmi dma allocation failed (7012352 B type 1),
>>>>>>> will try later with small size
>>>>>>> ath12k_pci 0000:03:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff
>>>>>>> soc_id 0x40170200
>>>>>>> ath12k_pci 0000:03:00.0: fw_version 0x1108811c fw_build_timestamp 2025-05-17 00:
>>>>>>> 21 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V
>>>>>>> 2.0_SILICONZ-3


