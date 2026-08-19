Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC16C5DF6D
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 07:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DWUB/mMMiSatxzAZzVLW6ob2KvWQH872h+Dc2rdweM=; b=lBiptEPVb/D4wf410V41HKaJ6A
	Ix0LZtuqlW8gXGB81NEzH34FNX6jf8aEfWnM6bT7DuATcdoz8i2GXsnxL0fl9J9We2gbwLGygYJzX
	OVv0FKS2nNJkcDH3wCnQXKDhwqn3H2LjktmZCYBwAjY1o/fq4rQrw63CpjGzionFprEnLXXn6Re4e
	iXXl+BKt0gA+ahfJks4K5d1MzvGC7+NxR7q9acU9qjF7JLMTlnPlc11wDo7lEpkj76jKzeCPWNerl
	x0rkQ+EJp7+57gMDTlKfywRPR2g14cO9rUMbrAKe1Bk6gzyF1SN0BGBRHVq3MTaSTqNJJGlaErRXp
	frK7ueBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaUx-00000009AZM-2bpt;
	Wed, 19 Aug 2026 07:14:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaUo-00000009AVy-0MVe
	for ath12k@lists.infradead.org;
	Wed, 19 Aug 2026 07:14:01 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6ZRin027702
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 07:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0DWUB/mMMiSatxzAZzVLW6ob2KvWQH872h+Dc2rdweM=; b=duHz7qwDK/R33HLi
	LiWzghqPhSlCw447IV1qkGl7oAaLahujTtuVw0LHj8UIBFqInInld6e/Pm22F0ag
	PQm7EWDa3yl6SxP9VGqRiciXKHNqTuWKJAz4XprPwK2JlOJ42nIVF6/+/ovYbi8P
	I4iW04lDx9Q5SvSVyzdSgQb4l7nWMELPTQTJzky970Td5LkmUjsls6ZGU3PtUxT8
	jPNUUvfZNUodMOY24CAfxtMxI8i7L12vE2a/jjCMfjZs13MuPU6HJVrRo/K1vhZV
	uNZHOoRGsfcdnsnkp7J39TuPWGmYsp1A2SHPfs2+XIlxU0MvmE7HFB+QWgyJGXM2
	KS/JXA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfpsum9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 07:13:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cccfa32670so12639145ad.2
        for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 00:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787123637; x=1787728437; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0DWUB/mMMiSatxzAZzVLW6ob2KvWQH872h+Dc2rdweM=;
        b=Lucd1ATPbuJteo7SUz5+RlfyZmnlQWSzRqiANwq+ZurpNWcS+fH43IhxvD5oM6/QN6
         a1twDNz5WNDpaWNQqPEq3EBuuq0aVBPFSGYgu6y5ttjMObCtiQeiXbOwLHFz82sVkAl1
         tFrSW7UjyqhFawGD9qvCLkKQbM3BHfHjsuZbgNgRxJTcXM8pEJ43DFZaWABR7IiXKf33
         yLCl2QumpK2RNEyFjuhDZ7KK288EtT6yxf1jnVM82eQOOUKAw2YE3IQzuCzw/58bQ5js
         FKSLccfoGpfvnddylqRk+z8g51TcUUC/8qBy0lYzjEvEUGIbrF+DymjollcrU/QoAYB2
         QYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787123637; x=1787728437;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0DWUB/mMMiSatxzAZzVLW6ob2KvWQH872h+Dc2rdweM=;
        b=U7fy3DgC3jf+GkQ0s5qMUinsNB8n1g+0TVJAgslCIdp8BNyCAWO0wQJQl8P2JwVG8H
         J4P9g8rRm2HjHOqRcDm8/nWrdy/rMcMSbUcGnH7J2G1QIDFZ8oVceG7/5U9fXRz4JoPd
         ZbW3ekc0XtzQRZInlQJoUJ1F3wEoRyFfuPRouc0pOopOfaoqQvZlPKA0O9tA1DaEFhIK
         jbeok1tgiyUb3EYMfe1GgYTF2qxMRRsifcL7NszGjvXziJgwIw2QPP9GkH4XIVGIM6Dl
         TEGs/mUKwlFrp/lguUtLLnOCxUau1xtDMDNY8ORyzkrOY576AG9rd8ytsKdfhIRKsxPt
         XCrg==
X-Forwarded-Encrypted: i=1; AHgh+Rpde+McPti/Q1iD4Lik/xE7zWNpyJKnRCecs5bOWs5iQcVh19fvfifmwhAFtlbVVM2IfzkcCcE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzVWR83qEy25RQ3RIi2nLfPOY3xy4S3c+xKIJwrbl50OjN+yfH6
	6kjZjTZKDpUTHsMByq90W+pKdtBdhU1R9Q0DmcrjWtbnVE0Z7IbNzg6DS/jrzUXl3md79n6j+uq
	e41d6eC7oC1owbmDN+iYWddr6dF70U3pTmO4mayFFR7Z1aGFuVUWQ/F7hagz0HYaU
X-Gm-Gg: AR+sD10aiKFvEVqfdGxV7duvPejyFI/r/iGp8+VMEvJd+2erM39II9L9bW6jhVrL1Zw
	ko7usUkCabmu2aZlZbjHtXa8Gkw8uMl03EhEiBx4OIkkNc/EL7GVff7OZH+irqe80kgYF0hSNpZ
	eUqFshnP7ZtrzRCw5wLUOTaV0BXnUSLIU2mEeCqA3f9FCNeDOmFYE9voLKx099kAR+pjLOaQIRi
	gYHhIRcJHs7OlOjJ/bifHpc0foFmY1p/gLQiH32HW/13/Grvbz4kWv9UoIAK3uefhQl2IHO5s5Y
	li5M9my08j4nkM7C9Zee1ine+cP3w8C3AJPWY2uqu2pCAFdZLJWwFDu9PMrh5iK/5MSiaJOuAJY
	6ory6RSZrRs55g9PeS5yBWDwQVd6W8rVGqwdOQOAu
X-Received: by 2002:a17:903:11c9:b0:2d0:8b28:517c with SMTP id d9443c01a7336-2d5fd5ff2e9mr46122665ad.3.1787123636623;
        Wed, 19 Aug 2026 00:13:56 -0700 (PDT)
X-Received: by 2002:a17:903:11c9:b0:2d0:8b28:517c with SMTP id d9443c01a7336-2d5fd5ff2e9mr46122055ad.3.1787123636198;
        Wed, 19 Aug 2026 00:13:56 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef6ec40sm4152747eec.7.2026.08.19.00.13.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 00:13:55 -0700 (PDT)
Message-ID: <40159684-8324-4c7a-8289-d7a8a17870d2@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 12:43:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: fix truncated TX buffer DMA
 address in MSDU ext descriptor
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260818-ath12k-truncated-tx-dma-addr-v1-1-ead978969371@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260818-ath12k-truncated-tx-dma-addr-v1-1-ead978969371@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: F4NdeQFAWf8NByPqBXFhSm9aAJhHepDk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA1MyBTYWx0ZWRfX4DuijdQTYdFu
 O2vC8UMGo4nrrULHurcIjIfFF3ux2AuojMvl/NnfErfRGpA7/lMierzCmkz9lNJosWzSRv8Q8er
 6pwoVAIMS3VEXhKAgJczlfNsvcnUVx/kWhc48WJK3dYEudO4CEiGqNk70BXgE8BwcRTGox3/5mH
 l2jMf9mhEDlVooKG/loqg4ZjGYkbUwI8kARzZcJx/Oo2m4Vee7+LaXgLcwSfdKB8mTQloU/6aA/
 mdDhNYt92Ys0Y9fzFH7Xmx8M69PSQN8vwVTlD8jzHBUKo9l+i7KCNpgmuZNDL3Ykm9YeYKi9Cb5
 QpvvLO2rDmh7bLYRjkPdyhSUmDEpyDnzZR02P2yeeH0XP/NGrVc0SWTDIqROfFRom7gOspf6JNJ
 ja/2TWWLRkq+qV1rTUo74TinJreaMsNYP/HEOLO9fURUOefzGKEVLy1k4IZ7bSyxLP41t5gt+Cu
 ff4c662eHC/rfhiAUrw==
X-Authority-Analysis: v=2.4 cv=aMrAb79m c=1 sm=1 tr=0 ts=6a8557b5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Up9l7ocf1wBoMnR3cVYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: F4NdeQFAWf8NByPqBXFhSm9aAJhHepDk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA1MyBTYWx0ZWRfX1H3ZM4kNhybp
 lCduFLlWWkqP13mN7Fl73EBZKdwSIYZc5zGx+yI6bhIoNEwdcPaPRWSDkhR5szHqKCmbHl2rQkC
 BzBN9aH5cj+0Ftp1eCXthZ0N0yd+V+U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_001358_147982_E440DF59 
X-CRM114-Status: GOOD (  11.70  )
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

On 8/18/2026 7:33 AM, Baochen Qiang wrote:
> ath12k_wifi7_hal_tx_cmd_ext_desc_setup() programs the low 32 bits of the
> TX buffer physical address into HAL_TX_MSDU_EXT_INFO0_BUF_PTR_LO but
> hardcodes the high bits field HAL_TX_MSDU_EXT_INFO1_BUF_PTR_HI to 0x0.
> 
> dma_addr_t is 64-bit on platforms with CONFIG_ARCH_DMA_ADDR_T_64BIT, so
> whenever a TX buffer is mapped above the 4 GB boundary the upper bits of
> paddr are dropped and the firmware is handed a truncated address,
> leading to potential TX failures.
> 
> Write the upper bits of paddr into BUF_PTR_HI to fix this issue.
> 
> Issue found during code review, compile tested only.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

