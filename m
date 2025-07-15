Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41E7C83F17
	for <ath12k@archiver.kernel.org>; Tue, 15 Jul 2025 03:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DTCGRhIs1G8ZriYF+cftr7+2fBBpADwLLPYQcSjDfQ=; b=Cmt16BEXcKHpZCExwjuoX2teNF
	TObNFbnrQr11IwlbtW52h6buehiQXklKZqEHhKMbiHmX++heV2w/WJgTrJhpokJ5ZdlcuOYzTzVuS
	xjnRxBUzb32GfhZq4JcS39BUrG1PUnLHp4xgJfWHoU85eyhXXCAN+jSjz0MhJAFeBiX0b9aHFFn2Q
	/Q7nk/aIjSN90dqJJQhBg9k5kkwZLH21PdPM1MbtN0cK6SZpWJCFRHcRQbYDh252C8bNnfaqxpfrp
	szJrxDxZK9ouFDhQsM3r0njt3H0o1csgkinlFYVomN2t+DvunDwCW6pZaN8KEIN0akvpNZn1ZG9lD
	b0og/85g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubVxZ-00000003q3X-2Uwa;
	Tue, 15 Jul 2025 03:04:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubVxX-00000003q2m-1KoF
	for ath12k@lists.infradead.org;
	Tue, 15 Jul 2025 03:04:00 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EJcRPm000866
	for <ath12k@lists.infradead.org>; Tue, 15 Jul 2025 03:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4DTCGRhIs1G8ZriYF+cftr7+2fBBpADwLLPYQcSjDfQ=; b=iVk1xmgevH0Cd481
	uiwcu9F9DZWyYT8EnqDaMDUEmqdnZ0zbnBzJa9WuNJhdf133S9JjXAWPtq62YDNc
	esNxyY0bsOuH5NOAc/uc4P5Kd5crdAKQ7WuSHbRRY+tqaMfCHBV5mbX8jxCBPyx2
	939zEAKOzKMIHVn3y1q2MWvwljD85Uky5e3+mu9uWXJtM3D4ELCrlBlLAw/My/EI
	822NEp0N1+FFee3YfhyQ4lw4ysC17GnFB38OzbZrt+5MePerlYgALIOe8lFe8Z8P
	l/MmUQgY5HNJs7sdKyuMXTDrV9FEfV0oYmjYWrWD0CFiiYAxjtT1Xh1biX/zSzqo
	mxtlig==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w58yhe0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 15 Jul 2025 03:03:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31218e2d5b0so8888051a91.2
        for <ath12k@lists.infradead.org>; Mon, 14 Jul 2025 20:03:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752548637; x=1753153437;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4DTCGRhIs1G8ZriYF+cftr7+2fBBpADwLLPYQcSjDfQ=;
        b=NjkCr6jqB41F8pkZCN0KNDRAdAg0G5CZT81XidgMAp3RaZ1P1h0+0WbT7wf6r1RShE
         jqNfw5bQZTr+rY/xqF0i/LWumfiPSbvZaXkRhw6A6KzUb4SgM1EOJQTXFl1B+Bvhf7E1
         cqY8KRiYMOx8O5blAkwRj3cvtrVxzNGeqxElDXIeqUIaxmrV4T3bFch7ThaSnIRgms5i
         V96jJxsB2BIY8tqZZmPDtFqaaWHky/Hh0KWC4i9oPl/VdFVtqzEJQRkzgGwN+6pNrQQ+
         C9k5MCFMhbQe8WJh6w5ZQ2dav6MsWGnBd4pD9JgfWWn9lI5BRtsuaLmrwa6G/78JMw2B
         99Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWzfsBaD6DqiSV3TVWKHp4E2nEkKvB1Xa3BWjlBhvXTQjK49/x7qMPcZg6RTPGIc/O+r637eAE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxNqzaQai7LS01Ka46s/hr9jkSPDTlvlLLwjOaoWdf97NbZVKaK
	wNeMgOCgGwN8FHRqP3uTqgcx4QmLe0JywBVbrCAwTc13Ne4SADVgTSL7J9Y7LbZkeW5gt8CC1jY
	e6UCPXMn680yeM/XFOP+OSTyKvul8c/7D3ig3axz0AKFXGBnr66JOT6dApvR6oPsN
X-Gm-Gg: ASbGncs2yu+Y+QEfmewF6uOZSsgLsVleVZzx/Hw5HpTdUSSQRiIZAm6nqdRfsFj2Yx+
	CI1jSfv6mKcaom2iD5bXhoZd3EQ94KrFGrIPKhdF/5twBPbiMzredYmP0+Fd+whj6HYNuXZFN3s
	5tMpchtgaqVeCy957XgNjHHQhpa8iwLlFdpFQdJqW6fxxKD4sI1aQ4gl/SJcTuZYMmBi+8gEW/F
	bTw/JdRRiwdKHgQDRzdx+4V6odnJE5JO+XqYRrmFhlVVvV3X0nA3MNB4dtIBxtOTAoEC7vD3/+Z
	bsLA+dFFRbkBy4E6tw/zJVzZ0qqV6DSfaRwDGIGPDRPXrzdYVHDaS8x5YhcYZRC39pitD2S8AhV
	uMrTqkUtVtc1v
X-Received: by 2002:a17:90b:4a81:b0:31a:9004:899d with SMTP id 98e67ed59e1d1-31c4ccd89b4mr28714304a91.18.1752548636984;
        Mon, 14 Jul 2025 20:03:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQk8UV8Z7wa/o8AdX75PKgIiy/izrir0RGwfamCQ4qVyHT6O7Nc98rChTuodHQMpHEAso/tQ==
X-Received: by 2002:a17:90b:4a81:b0:31a:9004:899d with SMTP id 98e67ed59e1d1-31c4ccd89b4mr28714258a91.18.1752548636521;
        Mon, 14 Jul 2025 20:03:56 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.226.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3eb45d1asm11017676a91.30.2025.07.14.20.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 20:03:56 -0700 (PDT)
Message-ID: <36d25bdb-e0b6-e55a-4060-e7cdcfeb6417@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 08:33:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Validate peer_id before
 searching for peer
Content-Language: en-US
To: Nagarajan Maran <nagarajan.maran@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Sriram R <quic_srirrama@quicinc.com>
References: <20250714111438.1134438-1-nagarajan.maran@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250714111438.1134438-1-nagarajan.maran@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAyNyBTYWx0ZWRfX4u4n6riTphYo
 976jDsNe33QpPF32JZzVZj+Zbr733+BSUKDLu2A8Xd2DQX1t66qoI71o7qiwD8OgEyoPC+yF1+R
 jut6f9xoTSFYi/rZCN+FrMalnTQHINZpJdoTGuCLDVlamKEBBs8VFr9cxEMQrISHjbMdGE2M+JC
 Y0ObgN/NPsyI9ti23fGXVQNsMwWoyrQ29GbHETdaSPBtK+QgHL0ji59p9/C1vopeCW5ztN1HQWM
 6msYs4TfDl/y8NhxMrE+z1v/6XcdaEEnzm2813DvX9O0cjP2i7kpBLtsE12+JN0pZo8Z6tkCPuc
 /OzTpdk3s+PSaBc8TPwxTeNAo4nbYJrvbn+ZZyRlDG65ybjh8Ee08on4sbZM2oUlTq3aHpCn3TL
 AQXkDlmQKVAo4ChhDSOirey2Q0mVp9ECinGVr7cm/d7vpTdvdne9YLE/bUbhiGVYmEtyPzs1
X-Proofpoint-GUID: 38MMwXfkFVSv6Q6tx7oQV5_Bvjl8jAzG
X-Proofpoint-ORIG-GUID: 38MMwXfkFVSv6Q6tx7oQV5_Bvjl8jAzG
X-Authority-Analysis: v=2.4 cv=Or9Pyz/t c=1 sm=1 tr=0 ts=6875c51e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=bFupCVmCsjxzjGptNxIE4g==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=o3kOZhjVV3aoIho8ZNQA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=653 bulkscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_200359_482555_504C29C7 
X-CRM114-Status: UNSURE (   9.00  )
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



On 7/14/2025 4:44 PM, Nagarajan Maran wrote:
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> In RX WBM error path, error packet is received with invalid
> peer_id (0x3FFF) as there is no peer associated with that packet.
> However, this invalid peer_id coincides with the ML peer_id valid
> bit mask, causing an unnecessary search in the ML peer list.
> 
> Prevent searching the peer list for invalid peer_id and return NULL.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Nagarajan Maran <nagarajan.maran@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

