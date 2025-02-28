Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A44FC282C1
	for <ath12k@archiver.kernel.org>; Fri, 28 Feb 2025 15:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8LNUpDIdNaYqmVN760bwRMxn2l9LZA3ETnVlarvrMvs=; b=zq5hjDPbaE2vxZCkzgmL7ftF6f
	XF/IGf7ElkBGae2B4hQ53dtdriRHCSEs61MpIn7ygsM9hB/ovtOTylYy3sq8BtQoWTCwp9exhEWhB
	Sz2U2pw/YMiqFF4wAju1Ef7rKf+v7P0b4B/lAI6W3ctZ9hmvx+uJgnYkofwNsa4JJjFQfUo3E7orB
	cCC8PGxX8en0j8UK4L42hPDvNTCLIc96SqQIGDfpdonYEj+JaM2ljYOF/f2af/MRTDggdifAFvHPc
	l3OxUfckdYzN7n2KP0eTwsvGl/4Yr/CoDysDSWF49pSGTK1KWR8CTTcsPh7kl6A36dPjhwDqY/3kp
	69zrHG0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to2ji-0000000BZWv-12IG
	for ath12k@archiver.kernel.org;
	Fri, 28 Feb 2025 15:57:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to2RP-0000000BUwz-45D6
	for ath12k@lists.infradead.org;
	Fri, 28 Feb 2025 15:38:21 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SAXHcQ030949
	for <ath12k@lists.infradead.org>; Fri, 28 Feb 2025 15:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8LNUpDIdNaYqmVN760bwRMxn2l9LZA3ETnVlarvrMvs=; b=DLPIcTPRotTuKfTf
	33hlPqh05yNpkp7abvi4/OzcSu0iGx/2OBAjoSaFPg3hxO+XL26VYoNcDVs+3I6d
	ga86erWfQN3KmfQihoV3hIsOpF1jE86yj8eMB068F1UFkHsj0GQkvFvTgp30699x
	dQiiOlnpa7deVA/aZytPHYx7ubb86OxWscl4dLVa9LRt2ZjhACLjcy5UpMJSqCvC
	RpicbvxhNFHar6VIWZIIzI8b92FCihl9dq7WA6xQVU9FmRTGnLWhhM0If4vWYWQ5
	Y9ChsunhMVETusHv9sP+QIBAivelJkf9crLQyKpEKfDcThkxlvXnlCVW2/eMAL8a
	1FNyLQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prmssjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 28 Feb 2025 15:38:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2feb5cd04a0so2885294a91.2
        for <ath12k@lists.infradead.org>; Fri, 28 Feb 2025 07:38:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740757097; x=1741361897;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8LNUpDIdNaYqmVN760bwRMxn2l9LZA3ETnVlarvrMvs=;
        b=trTwOlsPM9N/KY3qLCnFJfYk+tmLq9w1nf6Np8241icT9mDE1Ad/gOHl3NLV3l4coM
         pnc+73aHsfGjRkxbrzlgN3lPh6XRYc/7ntKlAQjlPpRdMYtHmi7IGHxdjl3QUz/waPmD
         lfyKFuseDwkRvS6+7E/GeUMYyFCyq7iu2rmQsx8LN0BsA+Ni8KBENPWDmFkjp4Slb/dE
         6v+dbAqDrN1NuxagFGFez1nTSdinvQRteDohgP00rE9INw9nfH79OUPdlnxbJK/kDJaK
         eeVDimMfnlbpOgkX64HQwOtC9ZXK+BJZjQOYCknxAW6z0DBB67vpch5gMvAevACCfxcW
         lWVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjcjmJB/NbaJGS3hG34n32Sku4PoRCrwEChromipGbdDvIFr5Jsd6yiwtNBhaPhkFaIC03Rrk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwqSgF2Gd/1l5hvCxEGbdko9mWruCR9vicSV0iwvnSukpJwTZEG
	+YCurxuA8hpfnw+f+apF75DCmGpuevwJJ6fBsKPnIBX0++lbgZharmgSQFxxynm7RPa7hdmdbz4
	yqxLhQ9PyEQL63Z2lMGna1cfnrVu37rQp0isnlQxMB66LYCONOPy/p+GRmF+H
X-Gm-Gg: ASbGncufoTHBSmNkwBAuIgUgDezhcv9VXQKW2JgZHMVouTvu7DROvrMPe5PIgV5U4Eo
	yZMcF/uZvr0Cjm/lvadfKIaGOQnq+9JEQgbzXXyppCib29ZwGEZ0DrdlHNyunIkxfbxqJf/g1U9
	bme2i7hESp3KDVgb355795b9+KIMm4wCqbAGJW1uzrNy58UI3I1LIpMB0nRj8XNkaXUcqszsJ07
	BoMoW0KIkfvJBtjGLKHNYlIfuWa+/m1Kr8YKc0OVATjZcmwzl/APcHr/8rnNRVFs/l3ii6v8rou
	HP4rqnZdTbn9oee7XN3oEZFLLJrwPx6zleBrQ/I2BDNzI0WYEMfJqW9kXEQDsPwOFvkBu/wsFbn
	LLM+PNQkD
X-Received: by 2002:a17:90b:180b:b0:2ee:cded:9ac7 with SMTP id 98e67ed59e1d1-2febab79a02mr6270494a91.20.1740757097287;
        Fri, 28 Feb 2025 07:38:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESTQBcE0OFBLHlj8E+mhhVJ+4hIEvlMb3ba1zyf+ZYTUKbNkLyE8zPsVDOKn9heQeZqiPpoA==
X-Received: by 2002:a17:90b:180b:b0:2ee:cded:9ac7 with SMTP id 98e67ed59e1d1-2febab79a02mr6270453a91.20.1740757096898;
        Fri, 28 Feb 2025 07:38:16 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501f9dcdsm34738965ad.77.2025.02.28.07.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 07:38:16 -0800 (PST)
Message-ID: <e702e39a-e199-4ea4-a066-0b2e26253f98@oss.qualcomm.com>
Date: Fri, 28 Feb 2025 07:38:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/13] wifi: ath12k: add support for fixed QMI firmware
 memory
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250227191034.1949954-1-quic_rajkbhag@quicinc.com>
 <20250227191034.1949954-8-quic_rajkbhag@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250227191034.1949954-8-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PMGO2wB1jS9-KoEhOLrqdZd6l7xcKtjI
X-Proofpoint-ORIG-GUID: PMGO2wB1jS9-KoEhOLrqdZd6l7xcKtjI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_04,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 adultscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502280114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_073820_146589_6158BF7B 
X-CRM114-Status: GOOD (  18.20  )
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

On 2/27/2025 11:10 AM, Raj Kumar Bhagat wrote:
...
> +static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
> +{
> +	struct reserved_mem *rmem;
> +	phys_addr_t bdf_size;
> +	int i, idx, ret;
> +
> +	for (i = 0, idx = 0; i < ab->qmi.mem_seg_count; i++) {
> +		switch (ab->qmi.target_mem[i].type) {
> +		case HOST_DDR_REGION_TYPE:
> +			rmem = ath12k_core_get_reserved_mem(ab, 0);
> +			if (!rmem) {
> +				ret = -ENODEV;
> +				goto out;
> +			}
> +
> +			if (rmem->size < ab->qmi.target_mem[i].size) {
> +				ath12k_dbg(ab, ATH12K_DBG_QMI,
> +					   "failed to assign mem type %d req size %d avail size %lld\n",
> +					   ab->qmi.target_mem[i].type,
> +					   ab->qmi.target_mem[i].size,
> +					   rmem->size);

The v6 version had a kernel test robot build warning here when building for
MIPS and it looks like nothing has changed.

I don't know the history of why struct reserved_mem::size is of type
phys_addr_t, but that type has a different size depending upon architecture,
therefore you can't use %lld.

To print it correctly you either need to use the %paa format that is meant for
that type, or probably better would be to assign it to a variable of type
size_t and then use %zu (and use that variable in the size test as well)

(also consider if the other %d formats should be %u instead)

> +				ret = -EINVAL;
> +				goto out;
> +			}
> +
> +			ab->qmi.target_mem[idx].paddr = rmem->base;
> +			ab->qmi.target_mem[idx].v.ioaddr =
> +				ioremap(ab->qmi.target_mem[idx].paddr,
> +					ab->qmi.target_mem[i].size);
> +			if (!ab->qmi.target_mem[idx].v.ioaddr) {
> +				ret = -EIO;
> +				goto out;
> +			}
> +			ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
> +			ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
> +			idx++;
> +			break;
> +		case BDF_MEM_REGION_TYPE:
> +			rmem = ath12k_core_get_reserved_mem(ab, 0);
> +			if (!rmem) {
> +				ret = -ENODEV;
> +				goto out;
> +			}
> +
> +			bdf_size = rmem->size - ab->hw_params->bdf_addr_offset;
> +			if (bdf_size < ab->qmi.target_mem[i].size) {
> +				ath12k_dbg(ab, ATH12K_DBG_QMI,
> +					   "failed to assign mem type %d req size %d avail size %lld\n",
> +					   ab->qmi.target_mem[i].type,
> +					   ab->qmi.target_mem[i].size,
> +					   bdf_size);

the same issue exists here.
again this would be fixed by making bdf_size type size_t and using %zu

> +				ret = -EINVAL;
> +				goto out;
> +			}
> +			ab->qmi.target_mem[idx].paddr =
> +				rmem->base + ab->hw_params->bdf_addr_offset;
> +			ab->qmi.target_mem[idx].v.ioaddr =
> +				ioremap(ab->qmi.target_mem[idx].paddr,
> +					ab->qmi.target_mem[i].size);
> +			if (!ab->qmi.target_mem[idx].v.ioaddr) {
> +				ret = -EIO;
> +				goto out;
> +			}
> +			ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
> +			ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
> +			idx++;
> +			break;

