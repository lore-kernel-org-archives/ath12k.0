Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB376C021B8
	for <ath12k@archiver.kernel.org>; Sat,  1 Mar 2025 05:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00pvRciJywe4pbk8Zn2txD6iFUc0etybYgSJXQKx6n4=; b=3SHp1QNn6pW2C7GX5YS65Up/RX
	4ZAYGMLCnVOv3uM7baoph0tobR85R2Dm3Ru6K+lPITCwbRHNs9tCCSSDbSYhrVk7q2wGZax1qHnaX
	qmrNgcOGPYyEeSETL1Do6zCjfTNqF4iM0nAA1nhI4012FVOb1NUQgst0CeJBe0upiqSlnkvTrJpUI
	2016H7Emgpk4ZCWBBOmc4ji9Tkv66x24Mba/hXZ2/SytHRIn9BXjhJb0tQxV2wn8+r9058UGm8t8R
	fDYJMHcBCNZbGUYRM00dbcrIMxCdcbU3nwFMKEWROnP044uymgy+6oW1wjTpgFsiBKH+jRL9HxfJ4
	9gKYIPEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toFAJ-0000000DQVv-2S4O
	for ath12k@archiver.kernel.org;
	Sat, 01 Mar 2025 05:13:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toFAF-0000000DQVS-4Az0
	for ath12k@lists.infradead.org;
	Sat, 01 Mar 2025 05:13:29 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5213YXns030222
	for <ath12k@lists.infradead.org>; Sat, 1 Mar 2025 05:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	00pvRciJywe4pbk8Zn2txD6iFUc0etybYgSJXQKx6n4=; b=bEGrlm/cmJMInX0A
	LhfmqC+jXOELDQ2QT973iHmsGzS5s7AWtGDz6l18BMOKI+JtijrnkboxTI7nxJOD
	pQeqyPpe9ScbbM5DGC9rbk+UYV5jmUdo9zmuNr5x1p1bWLibGKQUlxUwY1HuVkiq
	1Rg8Fgjib4vvDX9uU3NMuQCaQVB9blqoD6XvKjt4GF7n6rkAjJJBgUn5wyemhKqL
	xRVRwF+UGHbfpE7k+K1bWaRHLF/gYnZTHNXCVz4VG2fLP7fm13241xnN9CN27i3/
	NCBG6Sy/YVxBIFEWJaTg4DUTjyHwRNGhgDqP54HU1BzGu2yj+rg34K4/WdX+/Uax
	+w93Rg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453tf0g4n0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 01 Mar 2025 05:13:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fea8e4a655so8080411a91.0
        for <ath12k@lists.infradead.org>; Fri, 28 Feb 2025 21:13:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740806006; x=1741410806;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00pvRciJywe4pbk8Zn2txD6iFUc0etybYgSJXQKx6n4=;
        b=OPcegXqwq4jpt/l4+AydA+dEHhufsldeashsN87jmT7oPLhzDcREok0vFv7hQmwBdo
         cSr2zZXquGZfk4f22RmAXWD/BBt0Vgd+iZUuF9d8MWInyBrrzrte0tyrH0E1dPE6qPxO
         WLLDjMpspw3L//PZWSnfeNGfaUOpZbmVirC0AjBJkl3Oh8teRZ+u4qa5PhGPwlgxsgCT
         X73Sr3j/m9tjaCfFd6Nfvw/HlpGsi71c7b5cHtjBzOFyaSJ8Zxu91hfS6wMxceXsbEVM
         dRn5ROaqYiOyLFch/aGWQKwE7xc0v9oYSnVyk7AE2bBw9mEUI5SNn+uQBiiyVkY3EVS0
         ijhA==
X-Forwarded-Encrypted: i=1; AJvYcCUhKVj/zVN5dhRiQLoCSHrfXy/Qc9mfRxpB8SGuOVOkTvlyzHPN309DehOsSbhp2RSvukCK/oE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0LWvXpTvW3Zn9YnGxXlRcMUFkDyMcjbpt8GTY/bxxmKsUckmI
	vKIf/joIj2eAoLCeGb0qSp2VSfnv5vEJQqOIa7RS5nvgVBDsVcUzsQcUQgnx0ixlkZq8WXEKC8V
	e2A5UKYWSyBTjcdu/Rmi0NVgJ05PsHj5TbIrRIkSyGYKCZUUquo+INXyD1Xm9Bvs7aduQ
X-Gm-Gg: ASbGncvhn9tLJz81gucQT3uyfr/VU/KXj2qgZCtugtoHhWPa4OSU8YRPHc3Yvj9rkoi
	zpzXUSfApuacYSKXgOgqclN+VEPfsI9ueIOQgn4PxvUwk/eF2bH7El6dMGzzR2CH0warKLgnYvB
	HNJidGjsALShFjw5nAej7rnl/10HCmfk/AkumMdiVFSjG0LXO2t1DhHqPQDPpejRDBq+iWI8trW
	RHf+dQSy62DDSdwpKjA043ey7PJdNYYMbDoa9Xpq2HX4tz1nLrPVQjGxLqriZ7dGPjkfTRFEX7D
	xaxsOaP+5eWuCobChO1dtVJvgcG/DSU1F5WdS1HRrCRgzzBSdlJd1mISddq2VQY=
X-Received: by 2002:a05:6a20:1592:b0:1ee:7e68:6987 with SMTP id adf61e73a8af0-1f2f4ccc71amr10352733637.14.1740806006477;
        Fri, 28 Feb 2025 21:13:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzPjIspJjUNkUjz4HWnpKLOC7JMERGF/LKOMRzg9d6v2hSHkgG9atjNmQh7kvlQnH86ulpFw==
X-Received: by 2002:a05:6a20:1592:b0:1ee:7e68:6987 with SMTP id adf61e73a8af0-1f2f4ccc71amr10352716637.14.1740806006175;
        Fri, 28 Feb 2025 21:13:26 -0800 (PST)
Received: from [192.168.225.142] ([157.51.160.80])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7dec6727sm4361507a12.51.2025.02.28.21.13.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 21:13:25 -0800 (PST)
Message-ID: <3a665200-04d6-b9a4-7f47-fd7e68ea438c@oss.qualcomm.com>
Date: Sat, 1 Mar 2025 10:43:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 07/13] wifi: ath12k: add support for fixed QMI firmware
 memory
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250228184214.337119-1-quic_rajkbhag@quicinc.com>
 <20250228184214.337119-8-quic_rajkbhag@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250228184214.337119-8-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NiKyY9Hsp1k3V9019GLTS0sZXfa2uWLe
X-Proofpoint-ORIG-GUID: NiKyY9Hsp1k3V9019GLTS0sZXfa2uWLe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-01_01,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 mlxscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503010037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_211328_046499_96F0DD88 
X-CRM114-Status: UNSURE (   9.98  )
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



On 3/1/2025 12:12 AM, Raj Kumar Bhagat wrote:
> IPQ5332 firmware supports only fixed QMI firmware memory.
> 
> Hence, add support to read reserved fixed memory region from
> device-tree and provide the reserved memory segments for
> firmware to use during QMI firmware memory request.
> 
> Note that the ability to set the fixed memory will be introduced in
> a subsequent patch. Currently, the flag remains unset by default,
> ensuring that existing chipsets are unaffected.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

