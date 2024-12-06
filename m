Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522BAE7717B
	for <ath12k@archiver.kernel.org>; Fri,  6 Dec 2024 11:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hUY1e/YxiySi/wLCkZ/A7ok8yUIQYxm2Ew51lyeXS4=; b=d3VGPaNiT8x0ncvSwH2vGwJGxs
	upAttejveH6Kg1MRd35Ccw+uCJ/PCQdwszs8Flq9fM3dKAQ/61cP67g1bACYbHc/A7KCHyPohtI1F
	5k0EBaU98kKoL1SX1PXWA1mWw6+rOU/9vL/jJhGp4KmFPMVQn4TgxpgEffOrH7sUNZqvUk/8TiKQl
	jILAWuJnFR5aBMhRfibuYYpWwcuEWPyFVJA7RiDOu4bTuwoDDsGi8bSfRO0nFId16kIPf+Qmdjf2l
	MuovEdagV0MWMEyMmLH+ccfuqx6y+mCVtIea/4uEHenuFzvrYpaUhlG/ub3hC0FkHc9Bj9WbYYOUi
	rxzam2+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJWnH-00000001UTA-0LJd
	for ath12k@archiver.kernel.org;
	Fri, 06 Dec 2024 11:46:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJWmz-00000001UQg-3tnf
	for ath12k@lists.infradead.org;
	Fri, 06 Dec 2024 11:46:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B67IdWo003725
	for <ath12k@lists.infradead.org>; Fri, 6 Dec 2024 11:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5hUY1e/YxiySi/wLCkZ/A7ok8yUIQYxm2Ew51lyeXS4=; b=m2eMtTxjm3bJXk29
	l5wPFxi/4jimYBJzvV9mpPXTAA3Z1gI6uNZYM2ZB7W+REvLS+NTmbRFCr6wv/K73
	O75U48bocJPWLGWM9Mn1uew6H8Uc7jzEbMKj5mVgiO+BRLZydmmfHydYkTiZCQsG
	RuCu/YUxFciy4wllLrDTSuvmcIastvTRJtYxWaEhOK6VNvWPWZCpLGDoqQhdn5Qv
	qpzhXVlYdOf8e4YRS4yx456wmd6GidtE8A/sCC3mU0Fo/7pS4L3GYctTH9F6MP4t
	Knu5OonPBr8MrpeuYUIo0OV4dx9qxCfAw5mgDtP+KvqJhQL8D4fTeBITQqTJn6F+
	qDvh4A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba0kkryk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 06 Dec 2024 11:46:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b65d1aba51so17416285a.2
        for <ath12k@lists.infradead.org>; Fri, 06 Dec 2024 03:46:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733485588; x=1734090388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5hUY1e/YxiySi/wLCkZ/A7ok8yUIQYxm2Ew51lyeXS4=;
        b=VBV9nqYJnyjrHPxds0EVvyOD2AslywTkLD2l/+DEMHbXBxxwXB+vWVwZuF3q+l8oSn
         4KB8h0BkapMz6iiHU6A/QmRnlj9tq687qnM0egRpf/iuDHSDHP7filLLE8UphBMnvQVv
         +lWIr9hbxnHTkL1XGVzRjU1x8l5CV0tOPeBTimtsbHcv5Cw25e7579rFMOcl7Z51/VR/
         PgLHqY6TTwk9sFQrIcdAFc7sFrz6HPYcI1p8JeOF5mI5thA8/nCzGiWm8Lg393SAPUdd
         SWNVPCMpfmQwJ2txY+AKpVIVTWm6WFmoaaF4t/BdyMwo5KnuxMDk4Zw5OgsQIL7aVNuT
         BjRA==
X-Forwarded-Encrypted: i=1; AJvYcCXMbyP0DIcjYxS+3Z8iRC+9xfBEaR3lb6+9+2lSuzLea6Te+bwNR+houd4RjtuM8k6qe9DzL+k=@lists.infradead.org
X-Gm-Message-State: AOJu0YzGZSwiDPwfQvLAHUgs1KkeVydEAsxPY90uUUcdCMQCtVaHVrXN
	2w5nHLKF+2nOqx9twYiCss6/eW2WLxli8lmHgZLFacF5I4bcVgY+ELpEN8+RPjw/XmC7BzuMa3H
	vxDgaGXmLm6a8QhwI21jfm2Xt+bWEbxov1Gavb9G0UfD+qBSx7UOfGZbInr1I
X-Gm-Gg: ASbGncsx4SKGBl96KR7eghzIH6579ObCrotW1iSjLgrgwUVlKuVYdAVURd658ElY4bw
	p/btsua4Quaw1vlRCpX8jzrOGlnCDEs/SgHqzeKInojtuTIk9jL5hQKpYEdAkoff52bPDiVxukJ
	9qKswurrh+cxW4GUarWuStJmBWZ86c7ISEnFkqoQq8PZs90v8IC8TnenkQRA99ATov+ueDpQv7t
	qy+TP6soOfOgJI5+g7u9gpXQjYIBeClEa/R7nVwyR28rlts3DY4QAdQ/3HlTvfUjgBKhSNcoOmi
	jmGWMCnBIqP/mREvfZdVix/hWiM0LI0=
X-Received: by 2002:a05:620a:469f:b0:7b6:6634:5a3a with SMTP id af79cd13be357-7b6bcace083mr134724085a.6.1733485587818;
        Fri, 06 Dec 2024 03:46:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2ztyWlSb4kx6b26cpg9MuRvCCN2v3JqU/i03b5FNDZ8dzZTlaEdkLBo8DgxUk1CP0/Qt3mw==
X-Received: by 2002:a05:620a:469f:b0:7b6:6634:5a3a with SMTP id af79cd13be357-7b6bcace083mr134722785a.6.1733485587363;
        Fri, 06 Dec 2024 03:46:27 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e96aebsm229571566b.65.2024.12.06.03.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 03:46:26 -0800 (PST)
Message-ID: <153a9d51-6fc8-47d8-934b-4c53365077bc@oss.qualcomm.com>
Date: Fri, 6 Dec 2024 12:46:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/22] wifi: ath12k: add AHB driver support for IPQ5332
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Balamurugan S <quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
 <20241015182637.955753-18-quic_rajkbhag@quicinc.com>
 <243cd21d-6a35-4ff0-9b38-ec519a804670@oss.qualcomm.com>
 <9093b41c-986d-4304-8414-61e4ee2d9950@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9093b41c-986d-4304-8414-61e4ee2d9950@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RIisJjpvkARqX61oO6oQdqVDz5rX987y
X-Proofpoint-GUID: RIisJjpvkARqX61oO6oQdqVDz5rX987y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_034629_992493_5C71A37C 
X-CRM114-Status: GOOD (  25.40  )
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

On 6.12.2024 10:56 AM, Raj Kumar Bhagat wrote:
> On 10/19/2024 1:59 AM, Konrad Dybcio wrote:
>> On 15.10.2024 8:26 PM, Raj Kumar Bhagat wrote:
>>> From: Balamurugan S <quic_bselvara@quicinc.com>
>>>
>>> Add Initial Ath12k AHB driver support for IPQ5332. IPQ5332 is AHB
>>> based IEEE802.11be 2 GHz 2x2 WiFi device.
>>>
>>> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
>>>
>>> Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
>>> Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
>>> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
>>> Co-developed-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
>>> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
>>> ---
>>
>> [...]
>>
>>> +enum ext_irq_num {
>>> +	host2wbm_desc_feed = 16,
>>> +	host2reo_re_injection,
>>
>> Why?
>>
> 
> This enum is used as a IRQ number for Ath12k AHB. Based on this enum
> we can get the IRQ name from irq_name[]. This helps to request the original
> IRQ number from the DT.
> It is starting from 16 becasue, in irq_name[], the name for ext IRQ starts
> from 16 index.

[...]

> 
>>> +				irq_grp->irqs[num_irq++] =
>>> +					reo2host_destination_ring1 - j;
>>> +			}
>>> +
>>> +			if (ab->hw_params->ring_mask->rx_err[i] & BIT(j))
>>> +				irq_grp->irqs[num_irq++] = reo2host_exception;
>>> +
>>> +			if (ab->hw_params->ring_mask->rx_wbm_rel[i] & BIT(j))
>>> +				irq_grp->irqs[num_irq++] = wbm2host_rx_release;
>>> +
>>> +			if (ab->hw_params->ring_mask->reo_status[i] & BIT(j))
>>> +				irq_grp->irqs[num_irq++] = reo2host_status;
>>> +
>>> +			if (ab->hw_params->ring_mask->rx_mon_dest[i] & BIT(j))
>>> +				irq_grp->irqs[num_irq++] =
>>> +					rxdma2host_monitor_destination_mac1;
>>> +		}
>>> +
>>> +		irq_grp->num_irq = num_irq;
>>> +
>>> +		for (j = 0; j < irq_grp->num_irq; j++) {
>>> +			irq_idx = irq_grp->irqs[j];
>>> +
>>> +			irq = platform_get_irq_byname(ab->pdev,
>>> +						      irq_name[irq_idx]);
>>> +			ab->irq_num[irq_idx] = irq;
>>> +			irq_set_status_flags(irq, IRQ_NOAUTOEN | IRQ_DISABLE_UNLAZY);
>>> +			ret = request_irq(irq, ath12k_ahb_ext_interrupt_handler,
>>> +					  IRQF_TRIGGER_RISING,
>>> +					  irq_name[irq_idx], irq_grp);
>>> +			if (ret) {
>>> +				ath12k_err(ab, "failed request_irq for %d\n",
>>> +					   irq);
>>> +			}
>>> +		}
>>
>> Instead of doing all this magic, can we request the IRQs manually, as we
>> have interrupt-names in dt?
>>
> 
> I'm not sure if I fully understood this comment.
> If we manually request IRQs using their names from the DT, we won't be able to
> group the IRQs. Grouping the IRQs is one of our main objectives here. Additionally,
> we are not using all the IRQ names defined in the DT, so the logic in this function
> is crucial for grouping and requesting the IRQs according to the ring-mask.

Surely you can name these "foo_bar_ring%d" in DT and use the OF APIs

[...]

>>
>>> +	/* Set fixed_mem_region to true for platforms that support fixed memory
>>> +	 * reservation from DT. If memory is reserved from DT for FW, ath12k driver
>>> +	 * need not to allocate memory.
>>> +	 */
>>> +	if (!of_property_read_u32(ab->dev->of_node, "memory-region", &addr)) {
>>> +		set_bit(ATH12K_FLAG_FIXED_MEM_REGION, &ab->dev_flags);
>>> +		mem_node = of_find_node_by_name(NULL, "mlo_global_mem_0");
>>
>> This is not mentioned or documented anywhere.
>>
> 
> In next version, will document the below info:
> 
> "If the platform supports fixed memory, then it should define/reserve
> MLO global memory in DT to support Multi Link Operation.
> If MLO global memory is not reserved in fixed memory mode, then
> MLO cannot be supported."

You should also explain what Multi Link Operation means

Konrad

