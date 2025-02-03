Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FF1C02194
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 04:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+AMughmxCTXks1HYIHZ3mVLbjoQWFQspKRk1Y3eZTAE=; b=SP4mBTOYwqq8ESS8G2ggEMiWG5
	7+NL7DlxtLP3INSD6OXTnQVbc96f07DQ+Z0GTNAlDcFv0NSfW/6pnzCUEyl3siyfrMnMurEHjhEj3
	ljZXMnCetxi0zcYAExe1G+HNE6jQ5v81NXzMMLYTXMQb23oudZs+ZS89A6TgoXN39wbQx1++0JL6V
	sAxcb7tdKbzqxlDP4yLMy7vCZFhRxka9w3gpqLA7ZWLs2FbVNFk1I7viNrB9BmTqLu4lZO6VBtNS3
	P80uCRJmyRY4nMzbxsv+Tq82lPsR8+oxZp4AAzmOi09VR4gwpRj3pBIA5ILV7SlQYVJl8MS2wjmxQ
	P169Ez7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tenli-0000000EWTD-0Clx
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 04:09:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tenlB-0000000EWOw-2w0p
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 04:08:34 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 512M1lnL019524
	for <ath12k@lists.infradead.org>; Mon, 3 Feb 2025 04:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+AMughmxCTXks1HYIHZ3mVLbjoQWFQspKRk1Y3eZTAE=; b=kFyjy6jocBQo4UYj
	6IwZ5OfV8e6OrLr9hJCGMpk6Lc1qsxefZquoC478X2ehzDPxVSeRv6NHuBU7qk8/
	szD/R3rzjgnofxzgoyLYxuoryUbswVdSUABqDhK2hS0sWNXbH9iGlYQurKFUF55Y
	NImQz36mY9JmFd60I3zUGAJfPjzk1SYHdYSqRB0xG5m3/U4aIdj127eFaVnLJrs0
	w7n/bE0bsbR0nrBsBEwGsJCxcZaPeTmdW8mbLfjvZONZdjHn2P6ra50GaQf3F750
	ujwlrwhEphpe6B6Nwe7bENhhjsp47qRke1sCD1Xuos4MaK6CLPKS2J8SSULtOl0G
	IMuxBQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44hd8rb50d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 04:08:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2f81a0d0a18so7642333a91.3
        for <ath12k@lists.infradead.org>; Sun, 02 Feb 2025 20:08:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738555712; x=1739160512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+AMughmxCTXks1HYIHZ3mVLbjoQWFQspKRk1Y3eZTAE=;
        b=YIN/biNEv/GVjI99dq9ZGxrqsAjoxjJ39fDiYnvp7lIClk6PtRA4+/6K/TSEOvP4uH
         FDpNjaoxEyuU8URQtf6llrcoZcM27/toOjFmEqf5Z5EVq7GDbQM7tmB7MwMR7Rt4Xw48
         bpu5w0TICDzS4mei4jV+JC8Ar7ZkE41kWYEEde4HWfZfBbxl/Sf6pMBb6DaL23eC0UVn
         waTIFRXBdW1EjFiKhrbUbogtZP6O8YM8mXjN2z9RcRkS5pAyzSazgo8BjTCV4UeeF054
         AWG81keh7Z98wtFVUScZa4tubUPcwgEH8ols6pHmYzYkKS/aw88umouAzM6JHQ1JLshg
         C18w==
X-Forwarded-Encrypted: i=1; AJvYcCXvTNFae9OxSf58xMAPL3S4BQAcG3GRsSKeNNccr1CRHAeYMvz+todPdR+810xQcr+U3zwrl3A=@lists.infradead.org
X-Gm-Message-State: AOJu0YyaiALbB8Olft6gsWlgP5qrj7+zo1A9xEJ7eYXlb6kXQj/s0yU7
	XlwJCc1wqM8xwodMBqJDe9uOKsm2nPbLb+tLadB3lWM5RR2trCReLsoID80E7q7/PY7g5kE9mR8
	iii/2x3lKELOXX1OiuU4cIRD11ktTYj9aag/O7UoSf6P3qAFlF69wkNfiQ2oB
X-Gm-Gg: ASbGnctVOu7W003nHAW2+MF2IUcxV/drwVcOcUogIpZXK593LiTR+hzgTPHHESNtyRq
	pydrN8nTz2qvIjUj8Ji8QF4ORECLWzqhfjgxhZ3bPNKK4fukcqk8HjkRJ65Zl5AXaIp4HZru07V
	FY/uzbucmjbKGHGgNfOZEKicmlcQfUafsou78Rl8BYgpyqs6aJSXTSxMDZrLpdpJYsQDAU9ongE
	h/Ljz7aTdcQlA2YtvQAYw2QwEOVvCSW0cVMK9aIY+CzTq/4ltYIVoP3NyLG1Fj4/hA4OHRWWuxb
	NBlthxkKY5fzTPCfy24NlBW/7v4ci4zwbz3f+3k=
X-Received: by 2002:a17:90b:2802:b0:2f7:ef57:c7df with SMTP id 98e67ed59e1d1-2f83abaf38bmr32210972a91.7.1738555712254;
        Sun, 02 Feb 2025 20:08:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCeP5NJC6LFubfmD2Sj5atF6siwhzfidW4q7YCOyvfqHClVK7EgpGt2GHCe4+X5+6gzzbD0A==
X-Received: by 2002:a17:90b:2802:b0:2f7:ef57:c7df with SMTP id 98e67ed59e1d1-2f83abaf38bmr32210937a91.7.1738555711660;
        Sun, 02 Feb 2025 20:08:31 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f848aa0874sm7854416a91.32.2025.02.02.20.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 20:08:31 -0800 (PST)
Message-ID: <e0cfabf5-a858-4069-928b-ba4dc86f307d@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 09:38:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] wifi: ath12k: Update HTT_TCL_METADATA version and
 bit mask definitions
To: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250203025016.3851279-1-quic_bmahalin@quicinc.com>
 <20250203025016.3851279-2-quic_bmahalin@quicinc.com>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <20250203025016.3851279-2-quic_bmahalin@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UQeMEF1L2jRIdC5ipHbpsKmH3Yk4zsNC
X-Proofpoint-ORIG-GUID: UQeMEF1L2jRIdC5ipHbpsKmH3Yk4zsNC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_01,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502030033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_200833_761549_48671DEB 
X-CRM114-Status: GOOD (  11.16  )
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

On 2/3/25 08:20, Balamurugan Mahalingam wrote:
> Update the HTT_TCL_METADATA version to the latest version (2)
> as the bit definitions have changed a little to support more
> features. This new version allows the host to submit a packet with
> more information to the firmware. Firmware uses this additional
> information to do special processing for certain frames.
> 
> All the firmware binaries available in upstream/public are compatible with
> this HTT version update.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Balamurugan Mahalingam<quic_bmahalin@quicinc.com>
> ---

Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

-- 
Aditya

