Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F9EC43602
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 09:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29xDUNTed4jXAy3Mgxyo8ge5rsxJ/2Bn9rzkJN7OPjI=; b=Bs9F91nqWKt+Lo+4OWeIQei5+J
	CNSTDGc02cqCb3iKXCQJpiWLjc0msP6OSXjOlEhYmizfAXv9UI32UQxtL43U7bSnQ9Fv9DcfYMRYg
	DhJoD/9COArznw7kD7K6jCCNpHPZgtRfKAdnOBjGUXfkEkaS2kbUCL9MXcKuWBFsbALMaG9ywgOem
	4+UPwN/1ZjQ0oVUDjObicUgeziiPUTzn3pLdaImN7OwrCj/Y2I26oR+eVM7yFIfW/CmtmAjITfh0c
	GwkZrJ+fWZQewAIcu+UEhpbMqRUclfzFNJuN6jBFdaf/BYVjA1H+pctdo7q5hBXZeg0DyO3joCiPx
	Y5U2DzrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8Xo-0000000EDVZ-3b4A;
	Mon, 29 Jun 2026 09:44:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8Xj-0000000EDUF-2FFl
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 09:44:47 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6sMOj2143147
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 09:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	29xDUNTed4jXAy3Mgxyo8ge5rsxJ/2Bn9rzkJN7OPjI=; b=Nq0dTQhObC4rViq8
	hHEZ1cCiH0k/XJAfNPJgmIX1a/lj4zi3R2RIn2uCc6bDwNWPmxVgpitUNAQtfPoA
	soN48DtvuBi0duKZozhcNkj3/BKV7Nkfu1Oapfs4FK8Wy5IDtQIdRmqiJWhfxFT+
	21BuaT7nZAYyZ1B8DNrxj323ONG2jt8M+lfHNwJhSO4y4T+Ya+725vXDoc+vxqGL
	1jor/PekNcFzoYt+9d6kK5+SPfQcA1t6O+jq8pFIbmvIynVwDdRPn15bFFLvBqNG
	+SYJdAEhTC0zFWxP50x/mgdQzXMZKSMVYhHlq6I/zbBpnWM/XyJrukNHo79Aqifg
	xqgepA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8nvab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 09:44:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-845c733743eso2318609b3a.3
        for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 02:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782726281; x=1783331081; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=29xDUNTed4jXAy3Mgxyo8ge5rsxJ/2Bn9rzkJN7OPjI=;
        b=CCdm/7M3NIV3IUgv0/RVdxt01AA04lMts7EvbygAWq+FgPewGzb0E//vTR/R/gc+ri
         7/UJATE/6WQyAcxGlTJ2528Vpc5X+vrPKEAowZsS+tN7p7yzp3mUM2FcNhME8xxpzaMl
         /moajU7NsHJayBg4cJcIf9BRlKiFr47IzBAl6gOLztjsuyl++RTxYGJRvQ6+3ic6VWCH
         oxE/DxCZrZUWAW95GuXn2Ms42qCCP6iNNJ14cifrtUCfiU5jDBGeF8mUzXYnbs+lTW3R
         cbbLXb5oB0s2llUjsx4xEvH+gGKLPYKRRKc1PHE/kUO/qOIf8xVfjDao/KP/r1NQiyU/
         u18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782726281; x=1783331081;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=29xDUNTed4jXAy3Mgxyo8ge5rsxJ/2Bn9rzkJN7OPjI=;
        b=Ay1aYcTYP0rSBIg8FNooa9mQRdkACIAHzwxzQKbVZP11DzAoYtSrLbbIKqkzfP1ile
         yGWvv58PhkGTmbuW2cLViVKwYWbs4dAMfPWQdflZQAJ5V+PeQkA0xpVBY9gK/8Kp7aew
         3TTG+6pOfn54xdwFB/qmzKyx3YeICT9vnMtl7/CvhkHDdXBvm2uD/S82cjRCkZl24mXw
         45EMv4CYjPtI7FaoNDrE42oOqRJ4egOfJsFwizYpbpDQLNzS5VGAiO+WGuqLRHqdIPs7
         QiSYA2FY4Xo5F8VDR1g4CkotyhDM30cjVr2cv9qz/MvADh+RsYvl8+tQrU0mPQZ037v7
         wYkA==
X-Forwarded-Encrypted: i=1; AHgh+RqNddTLhGHSfaUwK4OHQZcELe2g49W0JgfqekQvrqxGyV8ClW/StsR51cpoOOO8iwxw7qTC8Ro=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/pfdYDSBIOvMlZJ/tWZI8GyV8jz/0l0osgfbf9AdCGpMVU/Jf
	I8jEt+wmNDQxFm4xXjAbZ875s8dJw4+IUvRVw7GAQxJTA/tRp8mHjhd7WzdzfIG9xuzH24ng/Vz
	digfRexwbUolIIO3yiExoRKYvj8Q0s3zJJ/4Q36mDTpmv9r1iV42sPqSFrshIg/a3
X-Gm-Gg: AfdE7clApS4/G0SMV3Vbuz0ChANZV3+itFHXcw0gVBcrQUpWQMLh+E1sBD9j7dGu4bn
	Es/gD2Fy6W8EdiKbRHMeZ6bgoVkbzTTfWWqlkzr+KtWejEJXcSSlJAkmMITI/N5ddnxf6FgnmvI
	J/4zZf8fH258xNMfmH8p9HjwLCpY4bPtJENUL59lLUU10qkgTEarntqZBUF7KKugWxZo3VXrWbr
	CVecH2pSbxW2hWNUi1zdqZqpdU/TSM1m4XW0tS2YdZ8HCB1pIA2p4aeIF/oqsog4Pt/03IdFBtp
	rebHjeCSb22POtkNqVdsjBg9YYli/jgAca8CWUx0TtPvgIlKQkfGNp0dZgJCxB/QWCEXSdkW1zl
	JQ8oQLVTxQy4WTu4IRIOv4HmRnnjtweIwpWyZwqCqgeX8ZzNLC3Z8WV+XH6CljnMoHhDvXPe85c
	5e1VwplQ==
X-Received: by 2002:a05:6a00:2d8d:b0:847:9692:5cb4 with SMTP id d2e1a72fcca58-84796926134mr348464b3a.53.1782726281030;
        Mon, 29 Jun 2026 02:44:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d8d:b0:847:9692:5cb4 with SMTP id d2e1a72fcca58-84796926134mr348440b3a.53.1782726280533;
        Mon, 29 Jun 2026 02:44:40 -0700 (PDT)
Received: from [10.133.33.8] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847833efe03sm1741991b3a.44.2026.06.29.02.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:44:39 -0700 (PDT)
Message-ID: <b2f3eb30-ff30-423b-aa8e-3cdf47aa600f@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 17:44:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10] Add device-specific reset for Qualcomm devices
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, bhelgaas@google.com,
        alex@shazbot.org, jjohnson@kernel.org, linux-pci@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, mhi@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20260623183115.1585273-1-jtornosm@redhat.com>
 <4cdfb71b-2ef8-4985-8294-c4a29e37faa3@oss.qualcomm.com>
 <l3pcelhxn46p4smkkg5yob5enf4d4garp2p6macopnq5h2gwyf@zbbn65k4tz2q>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <l3pcelhxn46p4smkkg5yob5enf4d4garp2p6macopnq5h2gwyf@zbbn65k4tz2q>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3OCBTYWx0ZWRfX5NHor/1zKU6I
 astkS99gfL728Fvm4y9MA5W0gdltPczQt9lI0JOXxKa1cT0URrn+IBdlr4KkAXGxInzifmr846Z
 KKyz0bO6z9vAlLEerisbPLpr5KAwdvc=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a423e8a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=RRcNAnSy7hG7cj1Ejq8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 53JT4aJSCpuWnsRiCl0qm8lMYInBHPOg
X-Proofpoint-ORIG-GUID: 53JT4aJSCpuWnsRiCl0qm8lMYInBHPOg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3OCBTYWx0ZWRfX9VYHCBaYAR6R
 0GZPRdoe5puXLVWWQ7Is6AKAHwy8pdODrE7DGyNJTQNe5PnO6KOvSYqAx5PaTIpPlF7etjI3+c7
 XCXAFHAHh3PeUItatedOwArYhCFcyynRCel3NpRGfNCQOEMn6lA9uQSblsRSn2bIxJYEVI02sGr
 0MhZlfyqcbuLSI/7/Wth/nhwLaSNpp8sb6XB+k6X7d6i9eeO95OqZXo6Wt/zEM6IS6+3ouo8+TQ
 JBNQEm89lmP/BB5jKR0v0/AbWJYd6rk5y4GBEkQgfpIbOg94YOhHaNlr2GBsYiPHu8W6MRBB2Lx
 gWudUQJUKOWN7qGmFijEJhqP5fU6CPpzwe9V3kVCLc4g2zW+DcBxHVDG4fxhcaoKo4YsqvIA9JM
 UOM5xoJCZ/FFDqL+GESwfgLyA+QBCUInUzH48miW1cWhqTDzzvx670HIooly1lqabkSb3bFB0G3
 dIuyYMyxutFyRSwJtyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_024443_701701_EA458EFA 
X-CRM114-Status: GOOD (  23.56  )
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



On 6/25/2026 9:03 PM, Manivannan Sadhasivam wrote:
> On Wed, Jun 24, 2026 at 03:47:12PM +0800, Baochen Qiang wrote:
>>
>>
>> On 6/24/2026 2:31 AM, Jose Ignacio Tornos Martinez wrote:
>>> Some Qualcomm PCIe devices (WCN6855/WCN7850 WiFi cards, SDX62/SDX65 modems)
>>> lack working reset methods for VFIO passthrough scenarios. These devices
>>> have no FLR capability, advertise NoSoftRst+ (blocking PM reset), and have
>>> broken bus reset.
>>>
>>> The problem manifests in VFIO passthrough scenarios:
>>>
>>> - WCN6855 (17cb:1103) and WCN7850 (17cb:1107) WiFi devices:
>>>   Normal VM operation works fine, including clean shutdown/reboot.
>>>   However, when the VM terminates uncleanly (crash, force-off), VFIO
>>>   attempts to reset the device before it can be assigned to another VM.
>>>   Without a working reset method, the device remains in an undefined state,
>>>   preventing reuse.
>>>
>>> - SDX62/SDX65 (17cb:0308) 5G modems: Never successfully initialize even
>>>   on first VM assignment without proper reset capability.
>>>
>>> Add device-specific reset methods using BAR-space hardware reset registers
>>> that exist in these devices:
>>>
>>> - WCN6855/WCN7850 WiFi devices use SoC global reset via BAR0 (sequence from
>>>   ath11k/ath12k driver: ath11k_pci_soc_global_reset(), ath11k_pci_sw_reset(),
>>>   ath11k_mhi_set_mhictrl_reset()):
>>>   - Write/clear reset bit at offset 0x3008
>>>   - Wait for PCIe link recovery (up to 5 seconds)
>>>   - Clear MHI controller SYSERR status at offset 0x38
>>>
>>> - SDX62/SDX65 modem devices use MHI SoC reset via BAR0 (sequence from MHI
>>>   driver: mhi_soc_reset(), mhi_pci_reset_prepare()):
>>>   - Write reset request to offset 0xb0
>>>   - Wait 2 seconds for reset completion
>>>
>>> These are true hardware reset mechanisms (not power management or firmware
>>> error recovery), providing proper device reset for VFIO scenarios.
>>>
>>> Testing was performed on desktop platforms with M.2 WiFi and modem cards
>>> using M.2-to-PCIe adapters, including extensive force-reset cycling to
>>> verify stability.
>>>
>>> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
>>> ---
>>> v10:
>>>   - Complete redesign based on maintainer feedback (Manivannan Sadhasivam,
>>>     Alex Williamson): use actual hardware reset registers from
>>>     device drivers instead of D3hot power cycling
>>> v9: https://lore.kernel.org/all/20260612142638.1243895-1-jtornosm@redhat.com/
>>>
>>>  drivers/pci/quirks.c | 118 +++++++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 118 insertions(+)
>>>
>>> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
>>> index 431c021d7414..8ad3f214e520 100644
>>> --- a/drivers/pci/quirks.c
>>> +++ b/drivers/pci/quirks.c
>>> @@ -4240,6 +4240,121 @@ static int reset_hinic_vf_dev(struct pci_dev *pdev, bool probe)
>>>  	return 0;
>>>  }
>>>  
>>> +#define QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET	0x3008
>>> +#define QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET_V	BIT(0)
>>> +#define QUALCOMM_WIFI_MHISTATUS			0x48
>>> +#define QUALCOMM_WIFI_MHICTRL			0x38
>>> +#define QUALCOMM_WIFI_MHICTRL_RESET_MASK	0x2
>>> +
>>> +/*
>>> + * Qualcomm WiFi device-specific reset using SoC global reset via BAR0
>>> + * registers.
>>> + */
>>> +static int reset_qualcomm_wifi(struct pci_dev *pdev, bool probe)
>>> +{
>>> +	bool link_recovered = false;
>>> +	unsigned long timeout;
>>> +	void __iomem *bar;
>>> +	u32 val;
>>> +	u16 cmd;
>>> +
>>> +	if (probe)
>>> +		return 0;
>>> +
>>> +	if (pdev->current_state != PCI_D0)
>>> +		return -EINVAL;
>>> +
>>> +	pci_read_config_word(pdev, PCI_COMMAND, &cmd);
>>> +	pci_write_config_word(pdev, PCI_COMMAND, cmd | PCI_COMMAND_MEMORY);
>>> +
>>> +	bar = pci_iomap(pdev, 0, 0);
>>> +	if (!bar) {
>>> +		pci_write_config_word(pdev, PCI_COMMAND, cmd);
>>> +		return -ENODEV;
>>> +	}
>>> +
>>> +	val = ioread32(bar + QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET);
>>
>> QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET is beyond the first 4K bar area hence requires MHI
>> wakeup before accessing, see [1]. the wakeup callback for WCN6855 is
>> ath11k_pci_bus_wake_up() which calls mhi_device_get_sync(). Not sure how this can be done
>> here. Maybe Mani can provide some hints?
>>
> 
> I don't think the device needs to be waken up before
> QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET. ath11k driver wakes up the device for
> accessing the MHI interface I believe. Since this callback is not touching MHI,
> there is no need to wakeup the device, AFAIK.

MHI register space is constitute with 3 segments, with mhi offset always being 0, bhi
offset 0x100 and bhie offset 0x224 (the latter two offsets are for WCN7850, but I think
also apply to other devices). That said the whole MHI register space does not go beyond
the first 4K region, hence wakeup is not for accessing MHI interface.

> 
> - Mani
> 


